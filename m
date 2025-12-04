Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E549D24440
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 17:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hx07uzK094MQ9EXqFZNgWhnvCR295qRwshUvB0mOXp4=; b=XwfGr4/wnhxaId
	RIF4shorE0/2inQQg4NXdwmKoL7JNDYzMI8aHNDua4LTG29Izgbuu93aKFoFKAtXEJuCCrR07vvbc
	tzEj/AfE8bdzbj8PS4e7PZLmYJQAd+/5iTWLlpX+Xoa6Kvl2PY4ro4ADV2jBFZAFop6YbPh6r0ihF
	5GZLm2V2fC8pCHTtPTj35rH5LPDiVMlx+2LrL0zUci33tVES5XWaIDEiuLHTTj3k/9FZHiIfGpEqP
	Tm3uIIH7tG1ZB6wtniUjN64naJj2Ik4sD7YdIOcdDJcrHJaER4yt0mn7dZNNjalWie7ZrbbqqGmXf
	8ekSgauWFfH6AZTaDNCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCz7-00000008MTO-2LIv;
	Thu, 04 Dec 2025 17:19:17 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCz4-00000008MSo-3Ujv
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 17:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764868752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tbhl1hB6Go7cKeEzi9fq0ksxVXWeewQm1ULfbDi4zC4=;
	b=Ji5+FXRdW7M70lUiECmr+uxNDiJhlP5rqFV6ZyKH+xHyJSXqk/mKz/v2nt8wAXh22FLyMD
	jEXs+I0EKFKF3tLE4Qur8lGBCjFkknCyXoCLai4GkfDtM5Yqv9+PgRz5ZAtTYaLqM5yxWs
	v0U1CpbbPCqvcOMijWe5tzuNWVn/Jo8=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-YG5t-aqaPwCj46nhWYVyzA-1; Thu, 04 Dec 2025 12:19:10 -0500
X-MC-Unique: YG5t-aqaPwCj46nhWYVyzA-1
X-Mimecast-MFC-AGG-ID: YG5t-aqaPwCj46nhWYVyzA_1764868750
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-55962ec6308so1653008e0c.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Dec 2025 09:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764868750; x=1765473550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tbhl1hB6Go7cKeEzi9fq0ksxVXWeewQm1ULfbDi4zC4=;
        b=BBcitGKJGZZZVf8KCfvi4vCMEIrhfohrC6Mywyv1ZC3h55rtCPCjqqzKVlmC77NPWv
         wxfKWMPipJXwYyUbbpvswgO3xrsOBt+GCwHZBHocCL7rCB+0gohH/e1DwvkXDOmPDVtH
         fHL9rx22S9SWsFR8m2qx0zACs6XMdoKq9IbIFPwGMZnNoc85KeVYd5wItd3y2yf7JWVu
         xdriEdJoKWNvu2O4NWz0W7L+39qj38NhPj5ZZWWFy6ItsiGg2PDfmIrbeUOONc5uVRB3
         JIKY66yTQofLQNw+CQNZHH7ZkQ13tz4hieCZQwq/K0UtKo2eDAn9VAtsGcjntf1U06PD
         XEmg==
X-Forwarded-Encrypted: i=1; AJvYcCX9NwOFNWiGs60arNJORXLrsI2Dc4B3ChFZyjzslYEwD5x5KPgZAMXASBQYAOWkHmMkejsWAtRPouwUGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYsqDayw30c2ZmcLbhZSdhcx8b/Ew3pHVuuUWV9/o8Lnr/TUYQ
	MMfuMJqMgOOU1R8TKrRuwmRTIbkVqh1Ll+vlY2dIN5fKQiVmBdLa020N+FhPH9s3Cq/HzQ9aIsX
	yu6Y/NpzVU93IW9QPqdxODs1Bpm/zvDVdv6Ko1l3Wgau1N068x8DDuUBgBXMi0my41F/OyJYPE7
	9wOO9SaVNgXle1FPPZOfX+4tZzEcGUXgu8rf9plo4hLrFt
X-Gm-Gg: ASbGncvDe7iPtIt+yVQ25bVEkXxXWrZMtsM99rOxW2gFWZsCMrpCr9b7s9GP99a6WC9
	YzYhaUAeiUWrcyciDCOC71SosUcNxuWwHJrh27Bx9MM2oYTBVi+2VNhM6a/TWNDBovXnVfnxN28
	FqgJIyaDeszJQn3HBg1RY6VNnE/7GCdVnlWg++YTm4/VqlnYrSYIMsWElfI7/0SaKY9PgHv+VAZ
	08=
X-Received: by 2002:a05:6122:219e:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-55e69d33928mr1380176e0c.4.1764868750216;
        Thu, 04 Dec 2025 09:19:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeIB0YNcpJAiGx/GNuObvXw/sfsBoL+Pu7iwpKlscfZjHDAR4upRzogd+N3zgiWodvzIxUpcfLPOjZg7ZeO+k=
X-Received: by 2002:a05:6122:219e:b0:55b:d85:5073 with SMTP id
 71dfb90a1353d-55e69d33928mr1380133e0c.4.1764868749828; Thu, 04 Dec 2025
 09:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20251112-v5_user_cfi_series-v23-0-b55691eacf4f@rivosinc.com>
 <20251112-v5_user_cfi_series-v23-24-b55691eacf4f@rivosinc.com> <20251204175055-fefb76ff-2ff2-48b8-b92c-3d3ce33ec9f5@linutronix.de>
In-Reply-To: <20251204175055-fefb76ff-2ff2-48b8-b92c-3d3ce33ec9f5@linutronix.de>
From: Charles Mirabile <cmirabil@redhat.com>
Date: Thu, 4 Dec 2025 12:18:57 -0500
X-Gm-Features: AWmQ_bn9PjdtETVMsD9KORY8lffIPeFGUkSijG0lA3xh-eP2WvDjQUg18Xtxf3s
Message-ID: <CABe3_aH6wRzKt+f8RyG+0mN0Kyu2eASRn4URxgU4R-zEmdwBgA@mail.gmail.com>
Subject: Re: [PATCH v23 24/28] arch/riscv: dual vdso creation logic and select
 vdso based on hw
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Deepak Gupta <debug@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, Jann Horn <jannh@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, alistair.francis@wdc.com, 
	richard.henderson@linaro.org, jim.shu@sifive.com, andybnac@gmail.com, 
	kito.cheng@sifive.com, charlie@rivosinc.com, atishp@rivosinc.com, 
	evan@rivosinc.com, cleger@rivosinc.com, alexghiti@rivosinc.com, 
	samitolvanen@google.com, broonie@kernel.org, rick.p.edgecombe@intel.com, 
	rust-for-linux@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1GsRWyEH7qv8mZHdi-MKAw81m1aB-wIZBkLf7AqqMr8_1764868750
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_091914_937976_00EC0FE6 
X-CRM114-Status: GOOD (  20.13  )
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

T24gVGh1LCBEZWMgNCwgMjAyNSBhdCAxMjowNOKAr1BNIFRob21hcyBXZWnDn3NjaHVoCjx0aG9t
YXMud2Vpc3NzY2h1aEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDEyLCAy
MDI1IGF0IDA0OjQzOjIyUE0gLTA4MDAsIERlZXBhayBHdXB0YSB2aWEgQjQgUmVsYXkgd3JvdGU6
Cj4gPiBGcm9tOiBEZWVwYWsgR3VwdGEgPGRlYnVnQHJpdm9zaW5jLmNvbT4KPiA+Cj4gPiBTaGFk
b3cgc3RhY2sgaW5zdHJ1Y3Rpb25zIGFyZSB0YWtlbiBmcm9tIHppbW9wIChtYW5kYXRlZCBvbiBS
VkEyMykuCj4gPiBBbnkgaGFyZHdhcmUgcHJpb3IgdG8gUlZBMjMgcHJvZmlsZSB3aWxsIGZhdWx0
IG9uIHNoYWRvdyBzdGFjayBpbnN0cnVjdGlvbi4KPiA+IEFueSB1c2Vyc3BhY2Ugd2l0aCBzaGFk
b3cgc3RhY2sgaW5zdHJ1Y3Rpb24gaW4gaXQgd2lsbCBmYXVsdCBvbiBzdWNoCj4gPiBoYXJkd2Fy
ZS4gVGh1cyBzdWNoIHVzZXJzcGFjZSBjYW4ndCBiZSBicm91Z2h0IG9udG8gc3VjaCBhIGhhcmR3
YXJlLgo+ID4KPiA+IEl0J3Mgbm90IGtub3duIGhvdyB1c2Vyc3BhY2Ugd2lsbCByZXNwb25kIHRv
IHN1Y2ggYmluYXJ5IGZyYWdtZW50YXRpb24uCj4gPiBIb3dldmVyIGluIG9yZGVyIHRvIGtlZXAg
a2VybmVsIHBvcnRhYmxlIGFjcm9zcyBzdWNoIGRpZmZlcmVudCBoYXJkd2FyZSwKPiA+IGBhcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvX2NmaWAgaXMgY3JlYXRlZCB3aGljaCBoYXMgbG9naWMgKE1ha2Vm
aWxlKSB0bwo+ID4gY29tcGlsZSBgYXJjaC9yaXNjdi9rZXJuZWwvdmRzb2Agc291cmNlcyB3aXRo
IGNmaSBmbGFncyBhbmQgdGhlbiBjaGFuZ2VzCj4gPiBpbiBgYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by5jYCBmb3Igc2VsZWN0aW5nIGFwcHJvcHJpYXRlIHZkc28gZGVwZW5kaW5nCj4gPiBvbiB3aGV0
aGVyIHVuZGVybHlpbmcgaGFyZHdhcmUoY3B1KSBpbXBsZW1lbnRzIHppbW9wIGV4dGVuc2lvbi4g
T2Zmc2V0Cj4gPiBvZiB2ZHNvIHN5bWJvbHMgd2lsbCBjaGFuZ2UgZHVlIHRvIGhhdmluZyB0d28g
ZGlmZmVyZW50IHZkc28gYmluYXJpZXMsCj4gPiB0aGVyZSBpcyBhZGRlZCBsb2dpYyB0byBpbmNs
dWRlIG5ldyBnZW5lcmF0ZWQgdmRzbyBvZmZzZXQgaGVhZGVyIGFuZAo+ID4gZHluYW1pY2FsbHkg
c2VsZWN0IG9mZnNldCAobGlrZSBmb3IgcnRfc2lncmV0dXJuKS4KPgo+IElmIHRoZSB1c2VkIHZE
U08gdmFyaWFudCBvbmx5IGRlcGVuZHMgb24gdGhlIGhhcmR3YXJlIGFuZCBub3RoaW5nIGVsc2Us
Cj4gd2h5IG5vdCB1c2UgYWx0ZXJuYXRpdmUgcGF0Y2hpbmcgYW5kIGF2b2lkIHRoZSBjb21wbGV4
aXR5Pwo+IEkgc2VlIHRoYXQgUklTQ1ZfQUxURVJOQVRJVkUgZGVwZW5kcyBvbiAhWElQX0tFUk5F
TCBidXQgdGhlIHZEU08gY29kZSBpcwo+IG1vdmVkIHRvIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBt
ZW1vcnkgaW4gYW55IGNhc2UsIHNvIGl0IGlzIHBhdGNoYWJsZS4KClRoZXNlIGluc3RydWN0aW9u
cyBhcmUgZW1pdHRlZCBieSB0aGUgdG9vbGNoYWluIGluIHRoZSBDIGNvZGUsIHNvIGEKdHJhZGl0
aW9uYWwgYXBwcm9hY2ggd2l0aCBhbHRlcm5hdGl2ZXMgaXMgbm90IGV4YWN0bHkgZmVhc2libGUu
IE1heWJlCnlvdSBjb3VsZCBkbyBpdCBieSBzY2FuIHRoZSBiaW5hcnkgZm9yIHRoZW0sIGJ1dCB0
aGF0IHNvdW5kcyBkdWJpb3VzLgoKPgo+ID4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIEd1cHRhIDxk
ZWJ1Z0ByaXZvc2luYy5jb20+Cj4gPiBBY2tlZC1ieTogQ2hhcmxlcyBNaXJhYmlsZSA8Y21pcmFi
aWxAcmVkaGF0LmNvbT4KPgo+ICguLi4pCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
