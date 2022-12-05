Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F7BEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BZvihnf9pmwAecoi6hhDwYa07LK0m/wnOWW8x47zWE=; b=M2u9WJMDdira4F
	erBXK2w+KgnfyH2gZOwfmxZ+7vI6EReWRTBGQb0wqI7RS7X4Iu9JLi/3271Q4RT4fK9OFPWq8vhPC
	6IdtPp7q0MmfxU0+uuMUvpEu2fX+Q6yHZ0J7J2LtcViQIdTTzZTQvuBio1L2v0leF/kwFiPvqFIud
	uoJOsZCsTZ7pU1P9Ow/44ybUOdzhIBYeTPbptww/pCC6pngFK9O85oVl5Vy8LdRhQzExvW7sFi8TK
	IZqVSL8JJoouw4HRXjg9LlYTMtoUsAv5FkLJjbRYAKf1acPw2Pn684EPeHKoTk4FcyE5gx/30mMk4
	uImt5a0EHAVxH5508a6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DMX-004kFy-5S; Mon, 05 Dec 2022 15:26:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DMS-004kEJ-HZ; Mon, 05 Dec 2022 15:26:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 01145611CA;
	Mon,  5 Dec 2022 15:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108D6C433C1;
	Mon,  5 Dec 2022 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670253987;
	bh=3y+uaXO+kxCid8d08Ki1sQHHOYibYWoGV7Nme9/CknM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GstjGtnXbwCmkuruQRDKXhMSIrl3dVDX8eI1wmQkVOYQJg3U+JYa+lRF3OxUxWSJN
	 r8/wQv74XWzmiSlGBPzrCZagXqX+N6SVLcufSbPSk1/iQBwdQ1Fyggc2x5+6oaEvQG
	 r3RHFY1WAPCtpY5FzOb+zda7JXr76mhgcTkFtPLxCLodC3+wDpyYfyKidVNPuMJTdZ
	 fqoWNswKBrIP/Z8MiJ01cP41hHZRr0kajuuzrJsmABSR0+FcsaJp4SgmikRHz8WE1q
	 OUlCF0sUgmwvfJatGaFVAmOs2VOqy9IDvsRI9NJZ+OFftE7gIm7uuTcAW7lXwdnnWB
	 mtEjLwrO41MHw==
Date: Mon, 5 Dec 2022 23:16:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 02/13] riscv: move riscv_noncoherent_supported() out
 of ZICBOM probe
Message-ID: <Y44LTqySUMCtKoUi@xhacker>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-3-jszhang@kernel.org>
 <5629547.DvuYhMxLoT@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5629547.DvuYhMxLoT@diego>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_072628_675503_7599AE4D 
X-CRM114-Status: GOOD (  20.52  )
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

T24gU3VuLCBEZWMgMDQsIDIwMjIgYXQgMTA6NTI6MDNQTSArMDEwMCwgSGVpa28gU3TDvGJuZXIg
d3JvdGU6Cj4gQW0gU29ubnRhZywgNC4gRGV6ZW1iZXIgMjAyMiwgMTg6NDY6MjEgQ0VUIHNjaHJp
ZWIgSmlzaGVuZyBaaGFuZzoKPiA+IEl0J3MgYSBiaXQgd2VpcmQgdG8gY2FsbCByaXNjdl9ub25j
b2hlcmVudF9zdXBwb3J0ZWQoKSBlYWNoIHRpbWUgd2hlbgo+ID4gaW5zbW9kaW5nIGEgbW9kdWxl
LiBNb3ZlIHRoZSBjYWxsaW5nIG91dCBvZiBmZWF0dXJlIHBhdGNoIGZ1bmMuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiA+IFJldmll
d2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3
ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiAtLS0K
PiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgfCAxIC0KPiA+ICBhcmNoL3Jpc2N2
L2tlcm5lbC9zZXR1cC5jICAgICAgfCAyICsrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL2NwdWZlYXR1cmUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZlYXR1cmUuYwo+ID4g
aW5kZXggYzc0M2YwYWRjNzk0Li4zNjRkMWZlODZiZWEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdWZl
YXR1cmUuYwo+ID4gQEAgLTI3NCw3ICsyNzQsNiBAQCBzdGF0aWMgYm9vbCBfX2luaXRfb3JfbW9k
dWxlIGNwdWZlYXR1cmVfcHJvYmVfemljYm9tKHVuc2lnbmVkIGludCBzdGFnZSkKPiA+ICAJaWYg
KCFyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBaSUNCT00pKQo+ID4gIAkJcmV0
dXJuIGZhbHNlOwo+ID4gIAo+ID4gLQlyaXNjdl9ub25jb2hlcmVudF9zdXBwb3J0ZWQoKTsKPiA+
ICAJcmV0dXJuIHRydWU7Cj4gPiAgfQo+ID4gIAo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gPiBpbmRleCA4NmFj
ZDY5MGQ1MjkuLjZlZWE0MGJmOGM2YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3NldHVwLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+IEBAIC0zMDAs
NiArMzAwLDggQEAgdm9pZCBfX2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQo+ID4g
IAlyaXNjdl9pbml0X2Nib21fYmxvY2tzaXplKCk7Cj4gPiAgCXJpc2N2X2ZpbGxfaHdjYXAoKTsK
PiA+ICAJYXBwbHlfYm9vdF9hbHRlcm5hdGl2ZXMoKTsKPiA+ICsJaWYgKHJpc2N2X2lzYV9leHRl
bnNpb25fYXZhaWxhYmxlKE5VTEwsIFpJQ0JPTSkpCj4gPiArCQlyaXNjdl9ub25jb2hlcmVudF9z
dXBwb3J0ZWQoKTsKPiAKPiBobW0sIHRoaXMgY2hhbmdlcyB0aGUgYmVoYXZpb3VyIHNsaWdodGx5
LiBJbiB0aGUgcHJvYmUgZnVuY3Rpb24gdGhlcmUKPiBpcyB0aGUKPiAJaWYgKCFJU19FTkFCTEVE
KENPTkZJR19SSVNDVl9JU0FfWklDQk9NKSkKPiAJCXJldHVybiBmYWxzZTsKPiBhdCB0aGUgdG9w
LCBzbyB3aXRoIHRoaXMgY2hhbmdlIHRoZSBzZWNvbmQgV0FSTl9UQUlOVCBpbiBhcmNoX3NldHVw
X2RtYV9vcHMKPiB3aWxsIGJlaGF2ZSBkaWZmZXJlbnRseQoKdGhhbmtzIGZvciB0aGUgaW5mb3Jt
YXRpb24uIGJlbG93IGNvZGUgY2FuIGtlZXAgdGhlIGJlaGF2aW9yOgoKCWlmIChJU19FTkFCTEVE
KENPTkZJR19SSVNDVl9JU0FfWklDQk9NKSAmJgoJICAgIHJpc2N2X2lzYV9leHRlbnNpb25fYXZh
aWxhYmxlKE5VTEwsIFpJQ0JPTSkpCgkJcmlzY3Zfbm9uY29oZXJlbnRfc3VwcG9ydGVkKCk7Cgp3
aWxsIHdhaXQgZm9yIG9uZSBtb3JlIGRheSBmb3IgbW9yZSByZXZpZXcgY29tbWVudHMsIHRoZW4g
d2lsbCBzZW5kIG91dAphIHYzCj4gCj4gSGVpa28KPiAKPiAKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
