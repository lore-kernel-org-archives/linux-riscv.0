Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAF0C7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 19:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3AVpQlztu9ayb8uyNVhSQAV8cy7JbcZrVxvKlyNKwZU=; b=vOZ/e9qUTU0KlG
	1h8l1jh/iysjszCYTJA4yi40unGqO6bjxXOT+qyekL/kY9zyPrVtnyKTxkn0SYQDhCHIAK6Fep8CW
	58L5GdgFA98Fq7RIXVIZLUiYhSGv9zPjG9OZzvCdushgaFJYY4GTmavVjwo5bVrFN7lK1nxpS3os7
	c+8FKPXMd9tROjzWYrLHkf/XFvmdhiXaTbMt2Rje2eV2/S7lZ6MQLhBLr4tsm3zHMagcL8Um74fvu
	fLFAvng2Uc6P6wOn1qawaTjybHpFR5jXwMaTogfJIcGFdVQUpyQ0JTHqXmlMZFwNIuDz+JDyTBGlT
	N6EE8Vi+k5vGs6fLDk/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppwNO-00Bj8c-0F;
	Fri, 21 Apr 2023 19:24:58 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppwNK-00Bj79-08
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 19:24:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1a667067275so22338635ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 12:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682105092; x=1684697092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvkLA+a8YoW/wuOsjaIxJzuPVSb1YjjMK/JpWWUYlMo=;
        b=Z1mYNDZ6AkudtVnrT3n5V/eEIts8OddUDSW9KLn74LxIddwBxxMBvHvXimDOcCpD64
         X6WHStiU+II2uxk73igF03YyRe+mqwSuW6H9Qtdv7u/DWvtDubpnzfk1YriCRr9za8v5
         XC2S0BuPZrz2o6+CZXODj0TbYeG2KwCM2cVe6oSpp9pVUDXxGg9olTtkau7Q+5+NsYc4
         cPFBjLGEPHFWzzeOrmDbwFXicua/PB03j/rs7FblIcXdCvm1JDi0Tcgqxr22anUmw5R3
         tGRsDEZo6/EsKO19A+OOzPNIS7W+AHqe2QZk6VRckV7ELyCwNp6MWsNbX2FhgYUyMfrE
         CxsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682105092; x=1684697092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvkLA+a8YoW/wuOsjaIxJzuPVSb1YjjMK/JpWWUYlMo=;
        b=bie7/7Feh9Ii0sU3fECG1v8ZWb0Qao1OUJKTulVuGxQXivooELB43ai0XDLB5NIP9O
         zkoyJSdyY+gxO/SlKURQ9++AWMT3CM3h1Q/hVInZmLdPvJrW/PahPrktKj7Iw9CuNEuz
         YV3XjzsNQ5osJXXnoj0wusqsfqUmhfq6RBGS+Zw3DFGQGVMV91ixlkzIkhopcWrwd1Dy
         uceyuVq6jRhneZVgWyOQBQBVSd5nsJHdp4Zr9VmfMM8JU4TOO+ooWMV6Mm/DxmagKOzq
         8ILT5u5QZsi2jAEeq8nixQs7cRN7Soz7TvjkHAMFtbj/fnqLWv0Qw3rClj9IZybs+ew+
         o1UQ==
X-Gm-Message-State: AAQBX9cxwWHwyxa3/29LhxYWe3NRwrUrbwLzP80IXjbvD8hf126PpE72
	hfbMRrpvc6S/WZ5KSQp+K/tE5fybXPuEn7p+RkZmFQ==
X-Google-Smtp-Source: AKy350bWDl0o884sMlNpmr/NR+NvkEPHrIR9Z4zX48mWh2RO0zn4bHfGQxbBytUzrO9XtFhCP8cwpF/T0JLyArYTY9E=
X-Received: by 2002:a17:903:22c8:b0:1a6:c12d:9036 with SMTP id
 y8-20020a17090322c800b001a6c12d9036mr7907063plg.33.1682105092516; Fri, 21 Apr
 2023 12:24:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230419221716.3603068-1-atishp@rivosinc.com> <20230419221716.3603068-46-atishp@rivosinc.com>
 <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
In-Reply-To: <69ba1760-a079-fd8f-b079-fcb01e3eedec@intel.com>
From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Sat, 22 Apr 2023 00:54:41 +0530
Message-ID: <CAHBxVyFhDapAeMQ8quBqWZ10jWSHw1CdE227ciyKQpULHYzffA@mail.gmail.com>
Subject: Re: [RFC 45/48] RISC-V: ioremap: Implement for arch specific ioremap hooks
To: Dave Hansen <dave.hansen@intel.com>
Cc: linux-kernel@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, linux-coco@lists.linux.dev, 
	Dylan Reid <dylan@rivosinc.com>, abrestic@rivosinc.com, 
	Samuel Ortiz <sameo@rivosinc.com>, Christoph Hellwig <hch@infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jiri Slaby <jirislaby@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Uladzislau Rezki <urezki@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_122454_079838_7B3A0FED 
X-CRM114-Status: GOOD (  17.35  )
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

T24gRnJpLCBBcHIgMjEsIDIwMjMgYXQgMzo0NuKAr0FNIERhdmUgSGFuc2VuIDxkYXZlLmhhbnNl
bkBpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gNC8xOS8yMyAxNToxNywgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gPiBUaGUgZ3Vlc3RzIHJ1bm5pbmcgaW4gQ29WRSBtdXN0IG5vdGlmeSB0aGUgaG9zdCBh
Ym91dCBpdHMgbW1pbyByZWdpb25zCj4gPiBzbyB0aGF0IGhvc3QgY2FuIGVuYWJsZSBtbWlvIGVt
dWxhdGlvbi4KPgo+IFRoaXMgb25lIGRvZXNuJ3QgbWFrZSBhIGxvdCBvZiBzZW5zZSB0byBtZS4K
Pgo+IFRoZSBndWVzdCBhbmQgaG9zdCBtdXN0IGFncmVlIGFib3V0IHRoZSBndWVzdCdzIHBoeXNp
Y2FsIGxheW91dCB1cAo+IGZyb250LiAgSW4gZ2VuZXJhbCwgdGhlIGhvc3QgZ2V0cyB0byBkaWN0
YXRlIHRoYXQgbGF5b3V0LiAgSXQgdGVsbHMgdGhlCj4gZ3Vlc3QsIHVwIGZyb250LCB3aGF0IGlz
IHByZXNlbnQgaW4gdGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UuCj4KClRoYXQgaXMg
cGFzc2VkIHRocm91Z2ggRFQvQUNQSSAod2hpY2ggd2lsbCBiZSBtZWFzdXJlZCkgdG8gdGhlIGd1
ZXN0LgoKPiBUaGlzIGNhbGxiYWNrIGFwcGVhcnMgdG8gc2F5IHRvIHRoZSBob3N0Ogo+Cj4gICAg
ICAgICBIZXksIEkgKHRoZSBndWVzdCkgYW0gdHJlYXRpbmcgdGhpcyBndWVzdCBwaHlzaWNhbCBh
cmVhIGFzIE1NSU8uCj4KPiBCdXQgdGhlIGhvc3QgYW5kIGd1ZXN0IGhhdmUgdG8gYWdyZWUgX3Nv
bWV3aGVyZV8gd2hhdCB0aGUgTU1JTyBpcyB1c2VkCj4gZm9yLCBub3QganVzdCB0aGF0IGl0IGlz
IGJlaW5nIHVzZWQgYXMgTU1JTy4KPgoKWWVzLiBUaGUgVFNNIChURUUgU2VjdXJpdHkgTWFuYWdl
cikgd2hpY2ggaXMgZXF1aXZhbGVudCB0byBURFggYWxzbwpuZWVkcyB0byBiZSBhd2FyZQpvZiB0
aGUgTU1JTyByZWdpb25zIHNvIHRoYXQgaXQgY2FuIGZvcndhcmQgdGhlIGZhdWx0cyBhY2NvcmRp
bmdseS4KTW9zdCBvZiB0aGUgTU1JTyBpcyBlbXVsYXRlZCBpbiB0aGUgaG9zdCAodXNlcnNwYWNl
IG9yIGtlcm5lbAplbXVsYXRpb24gaWYgcHJlc2VudCkuClRoZSBob3N0IGlzIG91dHNpZGUgdGhl
IHRydXN0IGJvdW5kYXJ5IG9mIHRoZSBndWVzdC4gVGh1cywgZ3Vlc3QgbmVlZHMKdG8gbWFrZSBz
dXJlIHRoZSBob3N0Cm9ubHkgZW11bGF0ZXMgdGhlIGRlc2lnbmF0ZWQgTU1JTyByZWdpb24uIE90
aGVyd2lzZSwgaXQgb3BlbnMgYW4KYXR0YWNrIHN1cmZhY2UgZnJvbSBhIG1hbGljaW91cyBob3N0
LgoKQWxsIG90aGVyIGNvbmZpZGVudGlhbCBjb21wdXRpbmcgc29sdXRpb25zIGFsc28gZGVwZW5k
IG9uIGd1ZXN0CmluaXRpYXRlZCBNTUlPIGFzIHdlbGwuIEFGQUlLLCB0aGUgVERYICYgU0VWCnJl
bGllcyBvbiAjVkUgbGlrZSBleGNlcHRpb25zIHRvIGludm9rZSB0aGF0IHdoaWxlIHRoaXMgcGF0
Y2ggaXMKc2ltaWxhciB0byB3aGF0IHBrdm0gZG9lcy4KVGhpcyBhcHByb2FjaCBsZXRzIHRoZSBl
bmxpZ2h0ZW5lZCBndWVzdCBjb250cm9sIHdoaWNoIE1NSU8gcmVnaW9ucyBpdAp3YW50cyB0aGUg
aG9zdCB0byBlbXVsYXRlLgpJdCBjYW4gYmUgYSBzdWJzZXQgb2YgdGhlIHJlZ2lvbidzIGhvc3Qg
cHJvdmlkZWQgdGhlIGxheW91dC4gVGhlIGd1ZXN0CmRldmljZSBmaWx0ZXJpbmcgc29sdXRpb24g
aXMgYmFzZWQgb24KdGhpcyBpZGVhIGFzIHdlbGwgWzFdLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIxMDkzMDAxMDUxMS4zMzg3OTY3LTEtc2F0aHlhbmFyYXlhbmFuLmt1cHB1
c3dhbXlAbGludXguaW50ZWwuY29tLwoKCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
