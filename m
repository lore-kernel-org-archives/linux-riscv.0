Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3239FEB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqX+d9/qUD5JF/lIZWaNBILCaJeG0EvuEvzsxiQSBK0=; b=r2htsEk9q1y3ML
	l0/7fNSTW4RvM4nbtuMV4yWAqo64J711R5oGPKTOmnWS6MTWSDRF77N0Fluap/sM00fhMkSk5unIJ
	jr3THb0rrc3uyTjjBiYA28h+x/2aDasLeOAfkj+BufGT3xNIuZSgQOheH4lgAKSYMTXoT3HcOfB+G
	oHhzKvPOtRd2yDT36FrLJyXbTjYHsWQb1ukd3Q9QQS2ow2SPxiDw9VEvU+riYmvoT6L6ntl8Vslj1
	HvjADs0ythhfnUJEGFDwQ6qTtnVqyjTlrB+tiwjkzChHSQATSu8+k9NuWtUtntPLDZ/Js12xntsbV
	nz/PHPPfCOt7BeKyKpfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNdK-00A1rz-1l;
	Thu, 20 Jul 2023 06:59:30 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNdH-00A1qE-1t
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:59:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbca8935bfso3301385e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689836364; x=1690441164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT1DoIojr0lvslKOunqTR4YXj4PFl+5LQJAMXq3nC5E=;
        b=ZDbx6qAcN8P+a9zusWZTkSl9rouTQF/iSqEtve1lkFjxsrKdWPD6dMC2Umr3gK0sIm
         nkzMw50TbmJwgcQIx++d1ggHjzr6+sA6GAKvbxlNWECwqbhFRvboEMDbjSOMt6CFznjJ
         O36ADGX1UaNkxZWfL7VJnxC+Cw3dNijMi+5cHTLgKK8SiFsVriuYykuE2k1SMWR22XY6
         5WxT4DDw/UrHFcXUA/TDL5yUwwgAoniALRtBlkd8RbObdZKNO0W+L2Z2Ac61fVFTAtPL
         YHLVKQefTrzGZrXQCVxFRHfphf2SXdfAdIWaHdz9BRl6fVTzOf00WkysK5x98InR9zeP
         FHQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689836364; x=1690441164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pT1DoIojr0lvslKOunqTR4YXj4PFl+5LQJAMXq3nC5E=;
        b=Zj+NkMqPeG5DhVS/4wch1UmXJmXhhaDN+/RwqXqTbeGNfgzNtKGJxJRKYls1oyqAL+
         AyRelogFbxsD4a0tgJrvoERKeHzDbwv0elEL21fWqU+TIPIV58uXGtBrl34gaCFeD+vt
         LQlsLY5z1VImTU+dxKgvha554Aefw8fSmeCWn5urW+7voMwtCfq0CN9YbcyuVi9cOAJD
         aMzpSLT0ouL1FoK9CNYTR68vA3dvwDfLWka4En+qOVU2+0dG2HIuwIFOz/TVzyHSClCW
         l1YpXW5xt+Hea+T9wGKIYeERXoWygtd9k/HmiQW69MonqOVO1FakyKyQYlk2LB54w+mT
         pG1g==
X-Gm-Message-State: ABy/qLZbnxWf742tyMdiGa7MIWm0a/CXRUVLvTYCrJriXFA6YIYTkIlf
	lZK2FzP9UG5cSkVe+vLHfJ3B8QdxuFOG5WWGDP7WbCNNLhDLefKCLbc=
X-Google-Smtp-Source: APBJJlG41skPij9fp8nZyKeEoH9myLamnBgBOCZf3SxF3pb6Xp13yIhuN0hjhRkJju4WSDs1jm0RLUedZXc7rvYty9A=
X-Received: by 2002:a05:6000:1c2:b0:30f:b7b4:3e55 with SMTP id
 t2-20020a05600001c200b0030fb7b43e55mr1436688wrx.19.1689836363671; Wed, 19 Jul
 2023 23:59:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230714165508.94561-1-charlie@rivosinc.com> <20230714165508.94561-5-charlie@rivosinc.com>
In-Reply-To: <20230714165508.94561-5-charlie@rivosinc.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 20 Jul 2023 08:59:12 +0200
Message-ID: <CAHVXubgSLhsMdS3aFbSuPNf2d_FXhztnFtRnbjsMstH5coCHWA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] RISC-V: mm: Document mmap changes
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	conor@kernel.org, paul.walmsley@sifive.com, palmer@rivosinc.com, 
	aou@eecs.berkeley.edu, anup@brainfault.org, konstantin@linuxfoundation.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, mick@ics.forth.gr, jrtc27@jrtc27.com, 
	rdunlap@infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_235927_622696_DF28EB7D 
X-CRM114-Status: GOOD (  22.31  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgNjo1NuKAr1BNIENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+IHdyb3RlOgo+Cj4gVGhlIGJlaGF2aW9yIG9mIG1tYXAgaXMgbW9kaWZp
ZWQgd2l0aCB0aGlzIHBhdGNoIHNlcmllcywgc28gZXhwbGFpbiB0aGUKPiBjaGFuZ2VzIHRvIHRo
ZSBtbWFwIGhpbnQgYWRkcmVzcyBiZWhhdmlvci4KPgo+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUg
SmVua2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vcmlz
Y3Yvdm0tbGF5b3V0LnJzdCB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNo
YW5nZWQsIDIyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jp
c2N2L3ZtLWxheW91dC5yc3QgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QKPiBp
bmRleCA1NDYyYzg0ZjQ3MjMuLjg5MjQxMmI5MTMwMCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0
aW9uL3Jpc2N2L3ZtLWxheW91dC5yc3QKPiArKysgYi9Eb2N1bWVudGF0aW9uL3Jpc2N2L3ZtLWxh
eW91dC5yc3QKPiBAQCAtMTMzLDMgKzEzMywyNSBAQCBSSVNDLVYgTGludXggS2VybmVsIFNWNTcK
PiAgICAgZmZmZmZmZmYwMDAwMDAwMCB8ICAtNCAgICAgR0IgfCBmZmZmZmZmZjdmZmZmZmZmIHwg
ICAgMiBHQiB8IG1vZHVsZXMsIEJQRgo+ICAgICBmZmZmZmZmZjgwMDAwMDAwIHwgIC0yICAgICBH
QiB8IGZmZmZmZmZmZmZmZmZmZmYgfCAgICAyIEdCIHwga2VybmVsCj4gICAgX19fX19fX19fX19f
X19fX19ffF9fX19fX19fX19fX3xfX19fX19fX19fX19fX19fX198X19fX19fX19ffF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ICsK
PiArCj4gK1VzZXJzcGFjZSBWQXMKPiArLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiArVG8gbWFpbnRh
aW4gY29tcGF0aWJpbGl0eSB3aXRoIHNvZnR3YXJlIHRoYXQgcmVsaWVzIG9uIHRoZSBWQSBzcGFj
ZSB3aXRoIGEKPiArbWF4aW11bSBvZiA0OCBiaXRzIHRoZSBrZXJuZWwgd2lsbCwgYnkgZGVmYXVs
dCwgcmV0dXJuIHZpcnR1YWwgYWRkcmVzc2VzIHRvCj4gK3VzZXJzcGFjZSBmcm9tIGEgNDgtYml0
IHJhbmdlIChzdjQ4KS4gVGhpcyBkZWZhdWx0IGJlaGF2aW9yIGlzIGFjaGlldmVkIGJ5Cj4gK3Bh
c3NpbmcgMCBpbnRvIHRoZSBoaW50IGFkZHJlc3MgcGFyYW1ldGVyIG9mIG1tYXAuIE9uIENQVXMg
d2l0aCBhbiBhZGRyZXNzIHNwYWNlCj4gK3NtYWxsZXIgdGhhbiBzdjQ4LCB0aGUgQ1BVIG1heGlt
dW0gc3VwcG9ydGVkIGFkZHJlc3Mgc3BhY2Ugd2lsbCBiZSB0aGUgZGVmYXVsdC4KPiArCj4gK1Nv
ZnR3YXJlIGNhbiAib3B0LWluIiB0byByZWNlaXZpbmcgVkFzIGZyb20gYW5vdGhlciBWQSBzcGFj
ZSBieSBwcm92aWRpbmcKPiArYSBoaW50IGFkZHJlc3MgdG8gbW1hcC4gQSBjYWxsIHRvIG1tYXAg
aXMgZ3VhcmFudGVlZCB0byByZXR1cm4gYW4gYWRkcmVzcwo+ICt0aGF0IHdpbGwgbm90IG92ZXJy
aWRlIHRoZSB1bnNldCBsZWZ0LWFsaWduZWQgYml0cyBpbiB0aGUgaGludCBhZGRyZXNzLAo+ICt1
bmxlc3MgdGhlcmUgaXMgbm8gc3BhY2UgbGVmdCBpbiB0aGUgYWRkcmVzcyBzcGFjZS4gSWYgdGhl
cmUgaXMgbm8gc3BhY2UKPiArYXZhaWxhYmxlIGluIHRoZSByZXF1ZXN0ZWQgYWRkcmVzcyBzcGFj
ZSwgYW4gYWRkcmVzcyBpbiB0aGUgbmV4dCBzbWFsbGVzdAo+ICthdmFpbGFibGUgYWRkcmVzcyBz
cGFjZSB3aWxsIGJlIHJldHVybmVkLgo+ICsKPiArRm9yIGV4YW1wbGUsIGluIG9yZGVyIHRvIG9i
dGFpbiA0OC1iaXQgVkEgc3BhY2UsIGEgaGludCBhZGRyZXNzIGdyZWF0ZXIgdGhhbgo+ICs6Y29k
ZTpgMSA8PCAzOGAgbXVzdCBiZSBwcm92aWRlZC4KCklzIHRoaXMgY29ycmVjdD8gU2hvdWxkbid0
IHRoZSBoaW50IGJlIHN0cmljdGx5IGdyZWF0ZXIgdGhhbiB0aGUKYWRkcmVzcyBzcGFjZSBpdCB0
YXJnZXRzPyBJbiBwYXRjaCAxLCB5b3Ugc3RhdGUgdGhhdCAiQSBoaW50IGFkZHJlc3MKcGFzc2Vk
IHRvIG1tYXAgd2lsbCBjYXVzZSB0aGUgbGFyZ2VzdCBhZGRyZXNzIHNwYWNlIHRoYXQgZml0cyBl
bnRpcmVseQppbnRvIHRoZSBoaW50IHRvIGJlIHVzZWQiLCBpdCBzZWVtcyBjb250cmFkaWN0b3J5
IHRvIG1lLgoKPiBOb3RlIHRoYXQgdGhpcyBpcyAzOCBkdWUgdG8gc3YzOSB1c2Vyc3BhY2UKPiAr
ZW5kaW5nIGF0IDpjb2RlOmAxIDw8IDM4YCBhbmQgdGhlIGFkZHJlc3NlcyBiZXlvbmQgdGhpcyBh
cmUgcmVzZXJ2ZWQgZm9yIHRoZQo+ICtrZXJuZWwuIFNpbWlsYXJseSwgdG8gb2J0YWluIDU3LWJp
dCBWQSBzcGFjZSBhZGRyZXNzZXMsIGEgaGludCBhZGRyZXNzIGdyZWF0ZXIKPiArdGhhbiBvciBl
cXVhbCB0byA6Y29kZTpgMSA8PCA0N2AgbXVzdCBiZSBwcm92aWRlZC4KPiAtLQo+IDIuNDEuMAo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
