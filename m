Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B1DE9A03B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Feb 2026 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxqHByehKQhEjCzEgKyE8eagotj+meHSQ+5mRSaQExI=; b=smR7CFo65xKmnk
	s00s64CeP7o3mHFDrMmgtTXRWYogkYZGMIG8v7jU0WGKRlG4vTxdeLLcGAa/sQOdy9/CFFCpsrPKC
	0M1xsl0tLS0Dyfn81zGZ5zAzucGb0Ws4CxdwQq1JhaxAUi+2kDa3ChJNTM2Ag1b5at8K8A/hrYuWR
	eApdSvAqzx/6+JgvxHVQo/1kK8AjtObHqt8b6ZTQXP5xwXyofZf03NWZH6cd7IkbGtHhRPGHwWe5M
	+psnbElGmB8ASEEUsWDZdcIeih4ZiaiFvPObft6hFLWQrL02v9iZmIxYnzy/nBVuEMFJ/QkEXZ14g
	rCrbeAPH4QNV/WRan0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6FQ-0000000Ba20-2bI1;
	Thu, 19 Feb 2026 15:47:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt6FO-0000000Ba1f-0z1r
	for linux-riscv@lists.infradead.org;
	Thu, 19 Feb 2026 15:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 202B04063F;
	Thu, 19 Feb 2026 15:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B02A2C4CEF7;
	Thu, 19 Feb 2026 15:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771516041;
	bh=6jZLbT+JuUsgAjaLJvA0T7UDOHhQK4+JWXfz+1inNe0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YiFvl9yQEqPgVMa17paCcsApkXqXxPDC9INi1Es2mmdAetSjEQ0C6iYgWwRZDGBPl
	 T5q2p4xK5DJSE+ax2Hoz09rQk5fv0YvwjEGmVz0trJeqhE3W3byvZuFumBEQl61ssF
	 cayjjGSqQU6eGeVGCmRc/OFBNOWfgPM8oDLWkPfGsgJ9+pQiEIOT68q6C90nwJatVP
	 4bvJDf/hfPBV7jkpsVOlipwi+COGGqHuMrFczDEr0ZpeQaaIcS7OkRpG/ESSwihg29
	 a6fD+1rduNex036MvIhfIfItvvcJH/+f4AWeHzq7IsUVYS1FkhqkXugAJjZrAXoMha
	 j+xsRubgHcR6A==
Date: Thu, 19 Feb 2026 16:47:09 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, huyuye <huyuye812@163.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Robert Moore <robert.moore@intel.com>, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, dai.hualiang@zte.com.cn,
	deng.weixian@zte.com.cn, guo.chang2@zte.com.cn,
	liu.qingtao2@zte.com.cn, wu.jiabao@zte.com.cn,
	lin.yongchun@zte.com.cn, hu.yuye@zte.com.cn,
	zhang.longxiang@zte.com.cn, zuo.jiang@zte.com.cn,
	li.kunpeng@zte.com.cn, Sunil V L <sunilvl@oss.qualcomm.com>
Subject: Re: [PATCH v2] ACPI: pci_root: Clear the acpi dependencies after PCI
 root bridge initialization on RISC-V
Message-ID: <aZcwfeG3y7EuLDzB@lpieralisi>
References: <CAJZ5v0iZukqD0atbdfBnmZAxUzNB6sTcJ1YUeAo5a8NRn-emEg@mail.gmail.com>
 <20260127194648.GA368841@bhelgaas>
 <aXtld38sQ9qFoNKk@sunil-laptop>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aXtld38sQ9qFoNKk@sunil-laptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_074722_327068_F22EADA2 
X-CRM114-Status: GOOD (  29.18  )
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

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgMDc6MTk6NDNQTSArMDUzMCwgU3VuaWwgViBMIHdyb3Rl
Ogo+IE9uIFR1ZSwgSmFuIDI3LCAyMDI2IGF0IDAxOjQ2OjQ4UE0gLTA2MDAsIEJqb3JuIEhlbGdh
YXMgd3JvdGU6Cj4gPiBPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAwNjo1MDoyNFBNICswMTAwLCBS
YWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiA+ID4gT24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgNjoy
NuKAr1BNIEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4g
T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgMDQ6MDA6NDlQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gPiA+ID4gPiBPbiBNb24sIEphbiAxMiwgMjAyNiBhdCAzOjE34oCvUE0gaHV5
dXllIDxodXl1eWU4MTJAMTYzLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+Cj4gWy4uLl0KPiAKPiA+
ID4gTm90IHJlYWxseS4KPiA+ID4gCj4gPiA+IGFjcGlfZGV2X2NsZWFyX2RlcGVuZGVuY2llcygp
IGlzIHJlbGF0ZWQgdG8gdGhlIHdheSBMaW51eCB1c2VzIF9ERVAKPiA+ID4gd2hpY2ggaXMgdG8g
ZGVmZXIgdGhlIGVudW1lcmF0aW9uIG9mIGRlcGVuZGVudCBkZXZpY2VzIHVudGlsIHRoZQo+ID4g
PiBkZXZpY2VzIHRoZXkgZGVwZW5kIG9uIGFyZSByZWFkeS4KPiA+ID4gCj4gPiA+IFNvIGJ5IGNh
bGxpbmcgYWNwaV9kZXZfY2xlYXJfZGVwZW5kZW5jaWVzKCkgdGhlIGRyaXZlciBiYXNpY2FsbHkK
PiA+ID4gYWxsb3dzIG90aGVyIGRyaXZlcnMgdG8gYmluZCB0byBkZXZpY2VzLgo+ID4gCj4gPiBJ
IGFzc3VtZWQgdGhlIGRlcGVuZGVuY3kgZXhwcmVzc2VkIGJ5IF9ERVAgd291bGQgYmUgc2F0aXNm
aWVkIGJ5IHRoZQo+ID4gZXhlY3V0aW9uIG9mIHNvbWUgb3RoZXIgQUNQSSBtZXRob2QuICBFLmcu
LCB0aGUgZGVwZW5kZW5jeSBtaWdodCBiZQo+ID4gc2F0aXNmaWVkIHdoZW4gYSBfUkVHIG1ldGhv
ZCBtYWtlcyBhbiBvcHJlZ2lvbiBhdmFpbGFibGUgKGFsdGhvdWdoIHRoZQo+ID4gc3BlYyBzZWVt
cyB0byBzdWdnZXN0IHRoYXQncyBvbmx5IG9uZSBvZiB0aGUgcG9zc2libGUgZGVwZW5kZW5jaWVz
KS4KPiA+IAo+ID4gQnV0IGluIHRoaXMgY2FzZSBpdCBzb3VuZHMgbGlrZSBSSVNDLVYgaXMgdXNp
bmcgX0RFUCBub3QgYmVjYXVzZSBvZgo+ID4gYW55IEFDUEktcmVsYXRlZCBvcmRlcmluZyByZXF1
aXJlbWVudCwgYnV0IHNpbXBseSB0byBlbmZvcmNlIHRoZSBPUwo+ID4gZW51bWVyYXRpb24gb3Jk
ZXIgKGFuZCB0aGVyZWZvcmUgbmFtaW5nKS4gIEkgZ3Vlc3MgdGhpcyByZWZlcnMgdG8gUENJCj4g
PiBkZXZpY2UgbmFtaW5nLCBzbyBJIHN1cHBvc2UgdGhhdCBkZXBlbmRlbmN5IGlzIG9uCj4gPiBw
Y2lfYWNwaV9zY2FuX3Jvb3QoKS4KPiA+IAo+IFJpZ2h0LiBEZXZpY2VzIHRoYXQgdXNlIHdpcmVk
IGludGVycnVwdHMgKG9yIEdTSXMpIGRlcGVuZCBvbiB0aGUgQVBMSUMKPiBpbnRlcnJ1cHQgY29u
dHJvbGxlciBiZWluZyBwcm9iZWQgZmlyc3QuIEFDUEkgdXNlcyB0aGUgX0RFUCBtZWNoYW5pc20g
dG8KPiBlbmZvcmNlIHRoaXMgcHJvYmUgb3JkZXIuIEhvd2V2ZXIsIHdoZW4gbXVsdGlwbGUgZGVw
ZW5kZW50IFBDSSBicmlkZ2VzCj4gYXJlIHByZXNlbnQgaW4gdGhlIHN5c3RlbSwgdGhlcmUgaXMg
bm8gZ3VhcmFudGVlIHRoYXQgdGhleSB3aWxsIGJlCj4gcHJvYmVkIGluIHRoZSBzYW1lIG9yZGVy
IG9uIGV2ZXJ5IHJlYm9vdC4gVGhpcyBwYXRjaCBhZGRyZXNzZXMgdGhlIGlzc3VlCj4gYnkgYWRk
aW5nIF9ERVAgcmVsYXRpb25zaGlwcyBiZXR3ZWVuIHRoZSBQQ0kgYnJpZGdlIG5vZGVzIGluIHRo
ZQo+IHBsYXRmb3JtLCBlbnN1cmluZyB0aGF0IHRoZXkgYXJlIGFsd2F5cyBwcm9iZWQgaW4gYSBk
ZXRlcm1pbmlzdGljCj4gb3JkZXIuCj4gCj4gPiBJIHRob3VnaHQgdWRldiB3YXMgc3VwcG9zZWQg
dG8gYmUgdGhlIHJlYWwgc29sdXRpb24gZm9yIGNvbnNpc3RlbnQKPiA+IG5hbWluZy4gIElzIHRo
aXMgc29ydCBvZiBhIHdvcmthcm91bmQgdG8gYWNjb21wbGlzaCB0aGUgc2FtZSBlbmQ/Cj4gPgo+
IFllcywgTWFyYyBoYWQgc3VnZ2VzdGVkIHRoaXMgYXMgd2VsbCwgYnV0IGl0IGxvb2tzIGxpa2Ug
aXTigJlzIG5vdCBlYXN5IHRvCj4gdXNlIGluIHRoaXMgZW52aXJvbm1lbnQgWzFdLgoKRldJVyBJ
IGFncmVlIHdpdGggTWFyYyAtIEkgcmVhZCBbMV0gYW5kIHN0aWxsIGRvbid0IHVuZGVyc3RhbmQg
d2hhdCB0aGUgcHJvYmxlbQppcyB3aXRoIGltcGxlbWVudGluZyBhIHVkZXYgc2V0IG9mIHJ1bGVz
IHRvIGZpeCBpdC4KCj4gPiBJbiBhbnkgY2FzZSwgeW91ciBJU19FTkFCTEVEKENPTkZJR19SSVND
VikgcHJvcG9zYWwgc2VlbXMgZmluZSB0byBtZS4KPiA+IEkgdGhpbmsgaXQncyBuaWNlIGlmIHdl
IGNhbiBhdm9pZCBhZGRpbmcgYW5vdGhlciBfX3dlYWsgZnVuY3Rpb24uCj4gPiAKPiBJIGFncmVl
LiBCdXQgSSBhbSBub3Qgc3VyZSBpZiBBUk0gYWxzbyBjYW4gZ2V0IGludG8gdGhpcyBzaXR1YXRp
b24gd2l0aAo+IEdJQ3Y1LiBBZGRpbmcgTG9yZW56by4KCkl0IGNhbiBoYXBwZW4gd2l0aCBHSUN2
NSBidXQgSSBkb24ndCB0aGluayB0aGF0J3MgdGhlIHBvaW50LiBJdCBjYW4gaGFwcGVuCm9uIGFu
eSBhcmNoIHJlZ2FyZGxlc3Mgb2YgaW50ZXJydXB0IGNvbnRyb2xsZXIgcHJvYmUgb3JkZXJpbmcg
YW5kIHVkZXYgaXMKdGhlIGRlIGZhY3RvIHNvbHV0aW9uIHRvIHRoaXMgcHJvYmxlbSBBRkFJVSwg
cGxlYXNlIGNvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4KCkxvcmVuem8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
