Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A68CAC5AE
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 02:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIeXXHa7jFMWr4LdewsZWPG7wGhlbBv1LZwB9G4PaW0=; b=G3sCg3XoYE9O0g
	CTV/UUMSaG+Ji2XyMMiGG9WCa+QbIF86M5RgSaq5Ojw0fvwG2H9RM2AeCuF4Uw/5R7mAf3bK7vlWB
	K/v9lYKjgZhcItZFCKQVbxU+buKm86ev7i4oXxUFPX+BbAEnyW3Os444EzMpvgQP936atUC08hkKj
	kqgJcT1cYiLzjltMl0w+Ch1LcYj5ZNmLZfufGn4yv6F8zgQ5VtZ71hrDr4+t+/7Nh6nJHKn4znowg
	bk8QqjBCERBjrGI04RRj3wDJq+OWufCCIBa6AWsrCCeJiIb40ud93lIibpZCLTPZ2scChSpRCo7De
	t260eW088B0MSiBp02Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bxk-00000005LCA-1rm0;
	Thu, 25 Sep 2025 02:44:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bxh-00000005LBO-3ve0
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 02:44:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7F6241A85
	for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 02:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888FFC4CEF8
	for <linux-riscv@lists.infradead.org>; Thu, 25 Sep 2025 02:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758768240;
	bh=S7vb/zf3V2GaassUXCT9UJV1Et/9TJiqD8ubx2PkhwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=J58/SCUfWipwZ1MVIpQEBYOUxqgqodgM0cUqxO+6oYTnwX30OAYYFnF0WKJxi5SU3
	 1YOU1P/IZqOtiBNDhKnXN1z4ovoCMhsotskp189F0RKKNay05fweIgyzg2e3gFkOa+
	 mrEzWgOqJIw9XZ1B1L1AdSJy3OwrymPL9j/QShB/+lcZEezrx+noPCD585qWFJNKzN
	 6E6HdZZvyCsVBaO63lJCmSambbsyS5Xwl45MRs1Bl9W47XafA1DEa4nLWflPswoZ74
	 CUlx92J4FcsuHOfMtemFUEOhpKfKnlSdBytdl9IRLQmzaeKqeOP4mbfyhOZCLS3Mji
	 uaOs9TbYVJNTg==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3194020e86so72790566b.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Sep 2025 19:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7OJEwOGOfl8tZOCc+K4Q1/I1hCbMoqtiu2L3vKGSJgFrqNAdzIymJtvgvuP3jjfFJUHjK8wo0vi4cxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwAt1VdTi7g3e20g5eRGy73VNao6enGZl3EN6cpJ4QLCCsEDSc
	zC+sXFrAjP2X0d6gUShG0N3K2kN+F5X6Drz8X+ki7c+mhKcEQKz4J6dq4h3KPOPR4muTr7TAKw+
	/mOWTVss60JMoxF9Z/HYyZGwmzFhZMPM=
X-Google-Smtp-Source: AGHT+IFAKAis+f8CsaeB/ZYEn6Mbsm0qvkYWWb/1JIaJw+bN7o9FCGRKh+44tCSaadZ6c4rMcagZJ6G9mHVPClZ1tck=
X-Received: by 2002:a17:907:3f1e:b0:b11:c9df:7a73 with SMTP id
 a640c23a62f3a-b34bd34a2b0mr217761266b.57.1758768239043; Wed, 24 Sep 2025
 19:43:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250919093615.30235-1-yangtiezhu@loongson.cn> <20250919093615.30235-2-yangtiezhu@loongson.cn>
In-Reply-To: <20250919093615.30235-2-yangtiezhu@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 25 Sep 2025 10:43:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4fdfB3fH0DnfgxNimPBsjiOGQZV-w0g63d7TVDOK5-zw@mail.gmail.com>
X-Gm-Features: AS18NWDZZeQr-H2-K3eeVtlqTGrlSQzrQ7P8GUhNaKX_KK-BVvdywIo1Js7nnoc
Message-ID: <CAAhV-H4fdfB3fH0DnfgxNimPBsjiOGQZV-w0g63d7TVDOK5-zw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] LoongArch: Only link libstub to final vmlinux
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-efi@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_194402_016271_EC610707 
X-CRM114-Status: GOOD (  21.79  )
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

SGksIFRpZXpodSwKCk9uIEZyaSwgU2VwIDE5LCAyMDI1IGF0IDU6MzbigK9QTSBUaWV6aHUgWWFu
ZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5jbj4gd3JvdGU6Cj4KPiBXaGVuIGNvbXBpbGluZyB3aXRo
IExMVk0gYW5kIENPTkZJR19MVE9fQ0xBTkcgaXMgc2V0LCB0aGVyZSBleGlzdHMKPiB0aGUgZm9s
bG93aW5nIG9ianRvb2wgd2FybmluZzoKPgo+ICAgdm1saW51eC5vOiB3YXJuaW5nOiBvYmp0b29s
OiBfX2VmaXN0dWJfZWZpX2Jvb3Rfa2VybmVsKCkKPiAgIGZhbGxzIHRocm91Z2ggdG8gbmV4dCBm
dW5jdGlvbiBfX2VmaXN0dWJfZXhpdF9ib290X2Z1bmMoKQo+Cj4gVGhpcyBpcyBiZWNhdXNlIGVm
aV9ib290X2tlcm5lbCgpIGRvZXNuJ3QgZW5kIHdpdGggYSByZXR1cm4gaW5zdHJ1Y3Rpb24KPiBv
ciBhbiB1bmNvbmRpdGlvbmFsIGp1bXAsIHRoZW4gb2JqdG9vbCBoYXMgZGV0ZXJtaW5lZCB0aGF0
IHRoZSBmdW5jdGlvbgo+IGNhbiBmYWxsIHRocm91Z2ggaW50byB0aGUgbmV4dCBmdW5jdGlvbi4K
Pgo+IEF0IHRoZSBiZWdpbm5pbmcsIHRyeSB0byBkbyBzb21ldGhpbmcgdG8gbWFrZSBlZmlfYm9v
dF9rZXJuZWwoKSBlbmRzIHdpdGgKPiBhbiB1bmNvbmRpdGlvbmFsIGp1bXAgaW5zdHJ1Y3Rpb24s
IGJ1dCB0aGlzIG1vZGlmaWNhdGlvbiBzZWVtcyBub3QgcHJvcGVyLgo+Cj4gU2luY2UgdGhlIGVm
aXN0dWIgZnVuY3Rpb25zIGFyZSB1c2VsZXNzIGZvciBzdGFjayB1bndpbmRlciwgdGhleSBjYW4g
YmUKPiBpZ25vcmVkIGJ5IG9ianRvb2wuIEFmdGVyIG1hbnkgZGlzY3Vzc2lvbnMsIG5vIG5lZWQg
dG8gbGluayBsaWJzdHViIHRvCj4gdGhlIHZtbGludXgubywgb25seSBsaW5rIGxpYnN0dWIgdG8g
dGhlIGZpbmFsIHZtbGludXguCj4KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21s
L3BxNGg3amduZG50NnA0NWxqNGtndWJ4amQ1Z2lkZmV0dWdjdWY1cmN4enh4YW56ZXRkQDZycmxw
am5qc211eS8KPiBTdWdnZXN0ZWQtYnk6IEpvc2ggUG9pbWJvZXVmIDxqcG9pbWJvZUBrZXJuZWwu
b3JnPgo+IFNpZ25lZC1vZmYtYnk6IFRpZXpodSBZYW5nIDx5YW5ndGllemh1QGxvb25nc29uLmNu
Pgo+IC0tLQo+ICBNYWtlZmlsZSAgICAgICAgICAgICAgICB8IDEgKwo+ICBhcmNoL2xvb25nYXJj
aC9NYWtlZmlsZSB8IDUgKysrKy0KPiAgc2NyaXB0cy9saW5rLXZtbGludXguc2ggfCA1ICsrLS0t
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPiBpbmRleCA5NzcxNjE5YWM1OTYuLmI4
ZTdjNjNhZTNkMSAxMDA2NDQKPiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01ha2VmaWxlCj4gQEAg
LTEyMDEsNiArMTIwMSw3IEBAIEtCVUlMRF9WTUxJTlVYX09CSlMgOj0gYnVpbHQtaW4uYSAkKHBh
dHN1YnN0ICUvLCAlL2xpYi5hLCAkKGZpbHRlciAlLywgJChsaWJzLXkpCj4gIEtCVUlMRF9WTUxJ
TlVYX0xJQlMgOj0gJChmaWx0ZXItb3V0ICUvLCAkKGxpYnMteSkpCj4KPiAgZXhwb3J0IEtCVUlM
RF9WTUxJTlVYX0xJQlMKPiArZXhwb3J0IEtCVUlMRF9WTUxJTlVYX0xJQlNfUFJFTElOSwo+ICBl
eHBvcnQgS0JVSUxEX0xEUyAgICAgICAgICA6PSBhcmNoLyQoU1JDQVJDSCkva2VybmVsL3ZtbGlu
dXgubGRzCj4KPiAgaWZkZWYgQ09ORklHX1RSSU1fVU5VU0VEX0tTWU1TCldoeSBkb2VzIHRoZSBM
b29uZ0FyY2ggcGF0Y2ggbW9kaWZ5IHRoZSBjb21tb24gcGFydHM/IFNpbmNlIHRoZSB3aG9sZQpz
ZXJpZXMgaXMgc21hbGwgZW5vdWdoLCBJIHN1Z2dlc3QgbW9kaWZ5aW5nIGV2ZXJ5dGhpbmcgaW4g
YSBzaW5nbGUKcGF0Y2guIEFuZCB0aGUgc2luZ2xlIHBhdGNoIGNhbiBiZSBtZXJnZWQgdmlhIHRo
ZSBlZmkgdHJlZS4KCkh1YWNhaQoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvTWFrZWZp
bGUgYi9hcmNoL2xvb25nYXJjaC9NYWtlZmlsZQo+IGluZGV4IGEzYTk3NTk0MTRmNC4uZTljNjFm
NzZhMDQ1IDEwMDY0NAo+IC0tLSBhL2FyY2gvbG9vbmdhcmNoL01ha2VmaWxlCj4gKysrIGIvYXJj
aC9sb29uZ2FyY2gvTWFrZWZpbGUKPiBAQCAtMTY0LDcgKzE2NCwxMCBAQCBDSEVDS0ZMQUdTICs9
ICQoc2hlbGwgJChDQykgJChLQlVJTERfQ1BQRkxBR1MpICQoS0JVSUxEX0NGTEFHUykgLWRNIC1F
IC14IGMgL2Rldgo+ICBlbmRpZgo+Cj4gIGxpYnMteSArPSBhcmNoL2xvb25nYXJjaC9saWIvCj4g
LWxpYnMtJChDT05GSUdfRUZJX1NUVUIpICs9ICQob2JqdHJlZSkvZHJpdmVycy9maXJtd2FyZS9l
ZmkvbGlic3R1Yi9saWIuYQo+ICsKPiAraWZkZWYgQ09ORklHX0VGSV9TVFVCCj4gK0tCVUlMRF9W
TUxJTlVYX0xJQlNfUFJFTElOSyArPSAkKG9ianRyZWUpL2RyaXZlcnMvZmlybXdhcmUvZWZpL2xp
YnN0dWIvbGliLmEKPiArZW5kaWYKPgo+ICBkcml2ZXJzLXkgICAgICAgICAgICAgICs9IGFyY2gv
bG9vbmdhcmNoL2NyeXB0by8KPgo+IGRpZmYgLS1naXQgYS9zY3JpcHRzL2xpbmstdm1saW51eC5z
aCBiL3NjcmlwdHMvbGluay12bWxpbnV4LnNoCj4gaW5kZXggNTEzNjdjMmJmYzIxLi5iM2NiZmYz
MWQ4YTkgMTAwNzU1Cj4gLS0tIGEvc2NyaXB0cy9saW5rLXZtbGludXguc2gKPiArKysgYi9zY3Jp
cHRzL2xpbmstdm1saW51eC5zaAo+IEBAIC02MSwxMiArNjEsMTEgQEAgdm1saW51eF9saW5rKCkK
PiAgICAgICAgIHNoaWZ0Cj4KPiAgICAgICAgIGlmIGlzX2VuYWJsZWQgQ09ORklHX0xUT19DTEFO
RyB8fCBpc19lbmFibGVkIENPTkZJR19YODZfS0VSTkVMX0lCVDsgdGhlbgo+IC0gICAgICAgICAg
ICAgICAjIFVzZSB2bWxpbnV4Lm8gaW5zdGVhZCBvZiBwZXJmb3JtaW5nIHRoZSBzbG93IExUTyBs
aW5rIGFnYWluLgo+ICAgICAgICAgICAgICAgICBvYmpzPXZtbGludXgubwo+IC0gICAgICAgICAg
ICAgICBsaWJzPQo+ICsgICAgICAgICAgICAgICBsaWJzPSIke0tCVUlMRF9WTUxJTlVYX0xJQlNf
UFJFTElOS30iCj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIG9ianM9dm1saW51eC5h
Cj4gLSAgICAgICAgICAgICAgIGxpYnM9IiR7S0JVSUxEX1ZNTElOVVhfTElCU30iCj4gKyAgICAg
ICAgICAgICAgIGxpYnM9IiR7S0JVSUxEX1ZNTElOVVhfTElCU30gJHtLQlVJTERfVk1MSU5VWF9M
SUJTX1BSRUxJTkt9Igo+ICAgICAgICAgZmkKPgo+ICAgICAgICAgaWYgaXNfZW5hYmxlZCBDT05G
SUdfR0VORVJJQ19CVUlMVElOX0RUQjsgdGhlbgo+IC0tCj4gMi40Mi4wCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
