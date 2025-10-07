Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9E8CCA476
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Oct 2025 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=154v8c3eDQ++RWUqvuKVa3uAbbF1SXWGUYhcX+wx1oI=; b=2L2DJHrnjtOb4w
	hp+9VXezfcz5218tbDaDH3Jmw6YhxSzZjBg9z8ywXPqL1sOxuYYM2FDXcm7QgIohLLijs6KXC5Wkz
	la/gRloPhP0F4uKYkYdtTKxbCkGVyswPmO6flmjh0P9XFu1xdeUnqKskQKL0FClV5+MzOuU3jHXKL
	5xasfcGRqR/fFkz+KbCCn6xczLX2E6w17RTJSGNx8vUlu+Slc5SQm8a3LoOTnUb1vBGFKqgZt1/ax
	nmextiCKAHpm6dztOEbCRgvRe2gh6GKAuJbG4ZOtR0EOPZaERM/OYpqn4IfLwRJEJEW1sR4jh6t1X
	xHygYinx7R/UqdZK/oBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6HLY-00000002xls-2dDQ;
	Tue, 07 Oct 2025 23:43:56 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6HLV-00000002xks-0nAR
	for linux-riscv@lists.infradead.org;
	Tue, 07 Oct 2025 23:43:55 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id DF3C892009C; Wed,  8 Oct 2025 01:43:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id D935092009B;
	Wed,  8 Oct 2025 00:43:46 +0100 (BST)
Date: Wed, 8 Oct 2025 00:43:46 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Olof Johansson <olof@lixom.net>
cc: Ben Dooks <ben.dooks@codethink.co.uk>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
In-Reply-To: <aN6U8NtIfqd-fowQ@chonkvm.lixom.net>
Message-ID: <alpine.DEB.2.21.2510072335250.7364@angie.orcam.me.uk>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org> <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk> <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com> <3c9d9f92-aaf8-4d4d-a2d9-8d6a410edc30@codethink.co.uk>
 <aN6U8NtIfqd-fowQ@chonkvm.lixom.net>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_164353_389112_18EA0533 
X-CRM114-Status: GOOD (  21.09  )
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

T24gVGh1LCAyIE9jdCAyMDI1LCBPbG9mIEpvaGFuc3NvbiB3cm90ZToKCj4gPiBOb3cgd2XigJly
ZSBzdGFydGluZyB0byBzZWUgY29tbWVyY2lhbCBjb3JlcyBvbiB0aGUgaG9yaXpvbiB0aGF0IHdp
bGwgaGF2ZSB0aGUKPiA+IGFiaWxpdHkgdG8gYmUgZW5kaWFuIGNvbmZpZ3VyZWQgYXQgcnVuLXRp
bWUuIEZvciBleGFtcGxlLCBNSVBTICh0aGUgY29tcGFueQo+ID4gbm90IHRoZSBJU0EpIGhhcyBh
bm5vdW5jZWQgdGhleSB3aWxsIGJlIHByb2R1Y2luZyBjb3JlcyB3aXRoIGNvbmZpZ3VyYWJsZQo+
ID4gZW5kaWFuIChodHRwczovL21pcHMuY29tL3Byb2R1Y3RzL2hhcmR3YXJlL2k4NTAwLykuCj4g
Cj4gTUlQUyBoYXMgYmVlbiBkb2luZyBzb21lIG5vdCBzbyBhd2Vzb21lIHRoaW5ncyB0byB0aGUg
UklTQy1WIGFyY2hpdGVjdHVyZQo+IGluIHRoZSBsYXN0IHllYXIgb3Igc28uIFRoZXkndmUgcHVi
bGlzaGVkIHBhdGNoc2V0cyB0aGF0IG1ha2UgaXQgc2VlbQo+IGxpa2UgdGhhdCB0aGV5IHNlZW0g
dG8gaGF2ZSB0YWtlbiBzb21lIG9sZCBNSVBTIGRlc2lnbnMgYW5kIGRvbmUgdGhlCj4gYmFyZSBt
aW5pbWFsIGNvbnZlcnNpb24gb3ZlciB0byBSSVNDLVYsIHNpbmNlIHRoZXkgbmVlZCB0aGVpciBv
d24gd2VpcmQKPiBzeXN0ZW0gcGVyaXBoZXJhbHMgYW5kIGhvb2tzLiBBZ2Fpbiwgd2l0aCB0aGUg
YnVyZGVuIGZvciBldmVyeWJvZHkgdG8KPiBtYWludGFpbiBiZWNhdXNlIHRoZWlyIGhhcmR3YXJl
IGVuZ2luZWVycyBjb3VsZG4ndCBib3RoZXIgdG8gZGV2ZWxvcCBhCj4gZnVsbCBwcm9wZXIgUklT
Qy1WIGNvcmUuCgogVGhpcyBpcyBvYnZpb3VzbHkgYSBmYWxzZSBpbWFnZS4gIFRoZSBtb3N0IHJl
Y2VudCBNSVBTIElTQXMsIHN1Y2ggYXMgdGhlIAptaWNyb01JUFNyNiBvciB0aGUgbmFub01JUFMg
YXJjaGl0ZWN0dXJlLCBhbmQgY29uc2VxdWVudGx5IGltcGxlbWVudGF0aW9ucyAKd2VyZSBhYnNv
bHV0ZWx5IFJJU0MtVi1saWtlLCB3aXRoIGJyYW5jaCBkZWxheSBzbG90cyByZW1vdmVkLCBjb25k
aXRpb25hbCAKbW92ZXMgcmVwbGFjZWQgd2l0aCBjb25kaXRpb25hbCBzZWxlY3RzLCBmbG9hdGlu
Zy1wb2ludCBjb25kaXRpb24gY29kZXMgCnJlbW92ZWQgaW4gZmF2b3VyIHRvIHNldHRpbmcgYSBn
ZW5lcmFsIHJlZ2lzdGVyLCBQQy1yZWxhdGl2ZSBpbnN0cnVjdGlvbnMgCmFkZGVkIGFuZCBvdmVy
YWxsIGJlaW5nIGEgdmFyaWFibGUtbGVuZ3RoIGNvbXByZXNzZWQgaW5zdHJ1Y3Rpb24gc2V0LCB1
cCAKdG8gdGhlIHBvaW50IGZvciBzb21lIGNvbXBhbnkgZW5naW5lZXJzIHRvIGJlY29tZSBkaXNn
cnVudGxlZCB3aXRoIHRoZSBJU0EgCiJsb3NpbmcgdGhlIE1JUFMgc3Bpcml0LiIgIFNvIGl0J3Mg
bm90IHRoYXQgdGhleSBjYW4ndCBiZSBib3RoZXJlZCB0byBtYWtlIAphIGZ1bGwgcHJvcGVyIFJJ
U0MtViBjb3JlLCBzdXJlbHkgdGhleSBjYW4uCgogVGhlIHRoaW5nIGlzIGJhc2VkIG9uIG15IGV4
cGVyaWVuY2UgSSdtIGZhaXJseSBzdXJlIGl0J3MgYWxsIGp1c3QgZHJpdmVuIApieSBjb21wYW55
IGN1c3RvbWVycywgd2hpY2ggaGF2ZSB0aGVpciBsZWdhY3kgTUlQUyBjb2RlIGJhc2Ugb3Igd2hh
dGV2ZXIgCmFuZCB3YW50IHRvIHN3aXRjaCB3aXRoIG1pbmltdW0gZWZmb3J0LiAgQW5kIGZvciBh
IGhhcmR3YXJlIGNvbXBhbnkgdG8gCnN1cHBvcnQgYSBjdXN0b21lciBpdCdzIG9idmlvdXNseSBl
YXNpZXIgdG8gdHdlYWsgaGFyZHdhcmUgcmF0aGVyIHRoYW4gCnNvZnR3YXJlLgoKIE5CIEkgZG91
YnQgaXQncyBhYm91dCBwZXJpcGhlcmFsczogZHJvcHBpbmcgYSBkaWZmZXJlbnQgQ1BVIGludG8g
YW4gCmV4aXN0aW5nIHN5c3RlbSBpcyBub3RoaW5nIG5ldyBhbmQgZG9lcyBub3QgcmVxdWlyZSB0
aGUgSVNBcyBpbnZvbHZlZCB0byAKYmUgcmVtb3RlbHkgc2ltaWxhciB0byBlYWNoIG90aGVyOyBj
Zi4gVkFYIHZzIEFscGhhIGZvciBleGFtcGxlLgoKPiBXaGlsZSBJJ20gbm90IGhhcHB5IHdpdGgg
dGhlIGxhY2sgb2YgdXBzdHJlYW1pbmcgZnJvbSB0aGUgKG1vc3RseQo+IENoaW5lc2UpIFNvQyB2
ZW5kb3JzLCBhbmQgd2Ugc2hvdWxkIGJlIGVuY291cmFnaW5nIG1vcmUgb2YgdGhlbSB0bwo+IGNv
bnRyaWJ1dGUgZGlyZWN0bHksIE1JUFMgc2VlbXMgdG8gYmUgbWFraW5nIGNob2ljZXMgdGhhdCBt
aWdodCBoYXZlCj4gbG9uZyB0ZXJtIGJ1cmRlbiBmb3IgYWxsIG9mIHVzLiBTbyBmYXIgdGhlIHNs
b3BlIGlzIHNsaXBwZXJ5IG9uIHRoZQo+IHN5c3RlbSBzaWRlLCBidXQgbmVlZGluZyB0byB3b3Jy
eSBhYm91dCBCRSBzdXBwb3J0IHNlZW1zIHRvIGJlIHN0ZXBwaW5nCj4gb3ZlciB0aGUgbGluZSBm
b3IgbWUgd2l0aG91dCBzb21lIG9idmlvdXMgY2xlYXIgdXNlIGNhc2VzIHRoYXQgbWFrZSBzZW5z
ZS4KCiBXaGV0aGVyIHdlJ3JlIGdvaW5nIHRvIGFjY2VwdCB0aGluZ3MgZHVtcGVkIG9udG8gdXMg
aXMgYW5vdGhlciBtYXR0ZXIuICAKVGhlcmUncyBwbGVudHkgb2YgY29kZSBkb3duc3RyZWFtIHRo
YXQgaGFzbid0IG1hZGUgaXQgaGVyZSwgYW5kIGdvaW5nIGJhY2sgCnRvIG15IGV4YW1wbGVzLCB3
ZSd2ZSBuZXZlciBnb3QgbWljcm9NSVBTcjYgc3VwcG9ydCBpbiBMaW51eCBldmVuIHRob3VnaCAK
aXQgdXNlZCB0byBsaXZlIGRvd25zdHJlYW0sIGFuZCBhdHRlbXB0cyBjb250aW51ZSBiZWluZyBt
YWRlIHRvIGdldCB0aGlzIApzdHVmZiB1cHN0cmVhbWVkIGFjcm9zcyB0aGUgYm9hcmQuICBXZSBt
YXkgb3IgbWF5IG5vdCBjaG9vc2UgdG8gYWNjZXB0IApiaXRzIHRoYXQgbWFrZSBvdXIgbGlmZSB0
b3VnaGVyLCBhbmQgdGhlcmUgaGF2ZSBiZWVuIHByZWNlZGVudHMgYWNyb3NzIApmcmVlIHNvZnR3
YXJlLCBzdWNoIGFzIHRoZSBSUzYwMDAvUG93ZXJQQyBHQ0MgYmFja2VuZCBtYWludGFpbmVyIHJl
ZnVzaW5nIAp0byB0YWtlIGNoYW5nZXMgYWRkaW5nIHN1cHBvcnQgZm9yIHRoZSBWTEUgaW5zdHJ1
Y3Rpb24gc2V0LgoKIEZZSSBhbmQgRldJVywKCiAgTWFjaWVqCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
