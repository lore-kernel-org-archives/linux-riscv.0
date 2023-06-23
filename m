Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26763EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 13:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSByU2DB4JZVQzqbbeiiTG2IX19DPxx5Ii6kAE4/7Q4=; b=avTO07EY3/1yx1
	MwVwVFX5g8V5qn1M7GKfcIe+yIEJyvvG5zcBPJXBDwu55MkjF2qCd0yzDwOXfkxA4yj8JAyJCqlpc
	WA41EcFXCc8V2xnCaj//QxxHWxZ+O///zvQ9OkgvkenJw7L3XBNo4hFP2dgrC1ELQizFrSEdkPfja
	sbQJN1zQxByyf8YRr/Ge/asXj7myg09WEoV3acwWty5mftuTxdVi8J8wpqHoJUEG7gemghKlQqapt
	XCFJ05Bwe+WoAR2Fw+9Nw0yEZNRVVH7g84KUQeAp9p0Ax4kTzSmf3i+Rz+EF97B43A3km3VBjNm3J
	VCvouzrN8WvwdONTv22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCgly-003dY0-2K;
	Fri, 23 Jun 2023 13:24:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCglv-003dX2-1A
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 13:24:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7DED61A33;
	Fri, 23 Jun 2023 13:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBD4C433C0;
	Fri, 23 Jun 2023 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687526656;
	bh=ya+979j6nW2ZkC3+qp94+q7c0uMnkw7U/dMO6m4wlqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1w28N72tr9K7DwVRXA1TYbu6gg+O3KhwX7tls3Oj3WVC535mHlV3dsi/ncKQcZH+
	 679ghZFTBqkiuUDpmf+DRI75z5FGlKQn+KBF6G0kHjQov2XnfU0AYTytOTHPtKjgxO
	 PFyK6qWdcig9q3FOpD2Z+jvGZkW6qJVojS1LO2XUNICnBPApsNmSkhWaxisg7mCW4Z
	 jdHb5rPLzZaaapN2SXxLJIqn2wbqSYGSe3DsuGFSyjWhIxhOaGJ0ms4C1BsSbEWU5O
	 P6pmHwuQeNM+lX1OINbFR4aGTZbH13HzJu3HXLQ6Bnnway10Qa22PkJD/hDJxMd5Xd
	 iW7DBAT/y1ESA==
Date: Fri, 23 Jun 2023 14:24:08 +0100
From: Will Deacon <will@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Eric Lin <eric.lin@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org,
	chenhuacai@kernel.org, baolu.lu@linux.intel.com,
	kan.liang@linux.intel.com, nnac123@linux.ibm.com,
	pierre.gondois@arm.com, jgross@suse.com, chao.gao@intel.com,
	maobibo@loongson.cn, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dslin1010@gmail.com, Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>,
	mark.rutland@arm.com, arnd@arndb.de
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
Message-ID: <20230623132402.GA17369@willie-the-truck>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-3-eric.lin@sifive.com>
 <20230616-revision-speed-a83dc926b334@wendy>
 <CAPqJEFo5genyjY7qJBaESzeppbEnTiDe9qzv98ETLhWfMZeG4A@mail.gmail.com>
 <20230621-stupor-violin-930ccc7d7593@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230621-stupor-violin-930ccc7d7593@spud>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_062419_495601_04B9F2B5 
X-CRM114-Status: GOOD (  20.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgZm9sa3MsCgpPbiBXZWQsIEp1biAyMSwgMjAyMyBhdCAwNDoxNzoyNFBNICswMTAwLCBDb25v
ciBEb29sZXkgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMjAsIDIwMjMgYXQgMTE6MTQ6MzJBTSArMDgw
MCwgRXJpYyBMaW4gd3JvdGU6Cj4gPiBPbiBGcmksIEp1biAxNiwgMjAyMyBhdCA2OjEz4oCvUE0g
Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPiA+IE9u
IEZyaSwgSnVuIDE2LCAyMDIzIGF0IDAyOjMyOjA5UE0gKzA4MDAsIEVyaWMgTGluIHdyb3RlOgo+
ID4gPiA+ICBkcml2ZXJzL3NvYy9zaWZpdmUvS2NvbmZpZyAgICAgICAgICAgIHwgICA5ICsKPiA+
ID4gPiAgZHJpdmVycy9zb2Mvc2lmaXZlL01ha2VmaWxlICAgICAgICAgICB8ICAgMSArCj4gPiA+
ID4gIGRyaXZlcnMvc29jL3NpZml2ZS9zaWZpdmVfcGwyLmggICAgICAgfCAgMjAgKwo+ID4gPiA+
ICBkcml2ZXJzL3NvYy9zaWZpdmUvc2lmaXZlX3BsMl9jYWNoZS5jIHwgIDE2ICsKPiA+ID4gPiAg
ZHJpdmVycy9zb2Mvc2lmaXZlL3NpZml2ZV9wbDJfcG11LmMgICB8IDY2OSArKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gPgo+ID4gPiBQZXJmIGRyaXZlcnMgc2hvdWxkIGJlIGluIGRyaXZl
cnMvcGVyZiwgbm8/Cj4gPiA+Cj4gPiAKPiA+IEJ1dCBJIGdyZXAgcGVyZl9wbXVfcmVnaXN0ZXIo
KSwgaXQgc2VlbXMgbm90IGFsbCB0aGUgcG11IGRyaXZlcnMgYXJlCj4gPiBpbiBkcml2ZXJzL3Bl
cmYgYXMgYmVsb3c6Cj4gPiAKPiA+IGFyY2gvYXJtL21hY2gtaW14L21tZGMuYzo1MTc6ICAgcmV0
ID0KPiA+IHBlcmZfcG11X3JlZ2lzdGVyKCYocG11X21tZGMtPnBtdSksIG5hbWUsIC0xKTsKPiA+
IGFyY2gvYXJtL21tL2NhY2hlLWwyeDAtcG11LmM6NTUyOiAgICAgICByZXQgPQo+ID4gcGVyZl9w
bXVfcmVnaXN0ZXIobDJ4MF9wbXUsIGwyeDBfbmFtZSwgLTEpOwo+ID4gLi4uCj4gPiBkcml2ZXJz
L2RtYS9pZHhkL3BlcmZtb24uYzo2Mjc6IHJjID0gcGVyZl9wbXVfcmVnaXN0ZXIoJmlkeGRfcG11
LT5wbXUsCj4gPiBpZHhkX3BtdS0+bmFtZSwgLTEpOwo+ID4gZHJpdmVycy9mcGdhL2RmbC1mbWUt
cGVyZi5jOjkwNDpzdGF0aWMgaW50Cj4gPiBmbWVfcGVyZl9wbXVfcmVnaXN0ZXIoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldiwKPiA+IGRyaXZlcnMvZnBnYS9kZmwtZm1lLXBlcmYuYzo5Mjk6
ICAgICAgICByZXQgPSBwZXJmX3BtdV9yZWdpc3RlcihwbXUsIG5hbWUsIC0xKTsKPiA+IC4uLgo+
ID4gZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3BtdS5jOjU0OTogICAgcmV0ID0K
PiA+IHBlcmZfcG11X3JlZ2lzdGVyKCZwbXVfZW50cnktPnBtdSwgcG11X25hbWUsIC0xKTsKPiA+
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfcG11LmM6MTE5MDogICByZXQgPQo+ID4gcGVyZl9w
bXVfcmVnaXN0ZXIoJnBtdS0+YmFzZSwgcG11LT5uYW1lLCAtMSk7Cj4gPiBkcml2ZXJzL2h3dHJh
Y2luZy9jb3Jlc2lnaHQvY29yZXNpZ2h0LWV0bS1wZXJmLmM6OTA3OiAgIHJldCA9Cj4gPiBwZXJm
X3BtdV9yZWdpc3RlcigmZXRtX3BtdSwgQ09SRVNJR0hUX0VUTV9QTVVfTkFNRSwgLTEpOwo+ID4g
ZHJpdmVycy9od3RyYWNpbmcvcHR0L2hpc2lfcHR0LmM6ODk1OiAgIHJldCA9Cj4gPiBwZXJmX3Bt
dV9yZWdpc3RlcigmaGlzaV9wdHQtPmhpc2lfcHR0X3BtdSwgcG11X25hbWUsIC0xKTsKPiA+IGRy
aXZlcnMvaW9tbXUvaW50ZWwvcGVyZm1vbi5jOjU3MDogICAgICByZXR1cm4KPiA+IHBlcmZfcG11
X3JlZ2lzdGVyKCZpb21tdV9wbXUtPnBtdSwgaW9tbXVfcG11LT5wbXUubmFtZSwgLTEpOwo+ID4g
ZHJpdmVycy9udmRpbW0vbmRfcGVyZi5jOjMwOTogICByYyA9IHBlcmZfcG11X3JlZ2lzdGVyKCZu
ZF9wbXUtPnBtdSwKPiA+IG5kX3BtdS0+cG11Lm5hbWUsIC0xKTsKPiA+IC4uLgo+ID4gCj4gPiBJ
IGp1c3Qgd29uZGVyaW5nIHdoYXQga2luZCBvZiBwbXUgZHJpdmVycyBzaG91bGQgYmUgaW4gZHJp
dmVycy9wZXJmCj4gPiBhbmQgd2hhdCBraW5kIG9mIHBtdSBkcml2ZXJzIHNob3VsZCBub3QgYmUg
aW4gZHJpdmVycy9wZXJmLgo+ID4gVGhhbmtzLgo+IAo+IFRvIGJlIHF1aXRlIGhvbmVzdCwgSSBo
YXZlIG5vIGlkZWEuCj4gSSdtIGp1c3QgYSB3ZWUgYml0IHdhcnkgb2YgdGFraW5nIGFueXRoaW5n
IHRoYXQgYXBwZWFycyB0byBoYXZlIGFub3RoZXIKPiBob21lIHZpYSBkcml2ZXJzL3NvYy4gSSdk
IHJhdGhlciBicmVhayBkcml2ZXJzIG91dCwgdXNpbmcgdGhlIGF1eCBidXMgb3IKPiBzaW1pbGFy
IGlmIG5lZWQgYmUsIHNvIHRoYXQgcGVvcGxlIHdobyBhcmUga25vd2xlZGdlYWJsZSBpbiBhbiBh
cmVhIGFyZQo+IENDZWQgb24gcGF0Y2hlcy4KPiBIb3BlZnVsbHkgQXJuZCBvciB0aGUgUGVyZiBw
ZW9wbGUgY2FuIG9mZmVyIHNvbWUgZ3VpZGFuY2UgaGVyZS4gSWYgaXQKPiBkb2VzIGdvIGludG8g
ZHJpdmVycy9zb2MsIGl0J2xsIG5lZWQgYSByZXZpZXcgZnJvbSBzb21lb25lIGtub3dsZWRnZWFi
bGUKPiBvZiBwZXJmIGFueXdheS4KCkknbSBub3QgdGVycml0b3JpYWwgYWJvdXQgdGhlIHBlcmYg
ZHJpdmVycyBhdCBhbGwsIGJ1dCBMMkNDIFBNVXMgbGlrZSB0aGlzCm9uZSBwcm9iYWJseSBmaXQg
cHJldHR5IHdlbGwgaW4gZHJpdmVycy9wZXJmLiBUaGUgdXN1YWwgcmVhc29uIGZvciBwdXR0aW5n
CmRyaXZlcnMgZWxzZXdoZXJlIGlzIGlmIHRoZSBQTVUgaXMgdGlnaHRseSBjb3VwbGVkIHdpdGgg
c29tZSBvdGhlciBJUCB3aGljaAppcyBoYW5kbGVkIGJ5IGFub3RoZXIgc3Vic3lzdGVtIChlLmcu
IEdQVSkuCgpXaWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
