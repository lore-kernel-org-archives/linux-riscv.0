Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96476C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 12:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUSwoqy5NhDGkvrZWUsJPGC1RRvMNCAm4jprrQ6WyHM=; b=VKRot5k1/w9zws
	J9zTO6B0yycXTg4af843dELEXsTGauZXyvbwNofARzFXljjL+pEfxnT8Bta5z0v+yxWOwWcsr6Qto
	ONb0Q/FWiQXPheMNHh4bCmKUgjYxMpScpDfjr9HKPV4nWEH5jh6rWTe+jJAH71MUX6BXnNfZoetN/
	VWF0PrhjgWelPtUUEdlj1Ez+ed1Vdi3+RXXtN9CzSoA39YAC4oMahCQVp3OCt80aTICUGX5Ghe/cg
	/IHMNllLcptsBpP+3jXhfyZpgr1J21i+MJX/fwQnFRNljgCcbDpk/YRujAwt15JmdEKvBYTx90vYD
	vOVOtxenygCtT/8bwtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9OWb-0000000HQFX-3d48;
	Tue, 21 May 2024 12:23:25 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9OWY-0000000HQAz-23Fl
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 12:23:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-574b3d6c0f3so9500083a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 05:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716294188; x=1716898988; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hwv4UfeFB/qhGfzo1UPvxGLOjaOyyNNjAF75j9o1V88=;
        b=cQlELrEBEcWb0L74KrV+SFowVm68B9n8Fo1UjvaNdXp0Iv9Eh5whVASnN5q/haZWAp
         oOpuEu9esZrfA+7YkQgORTCJjeQeRJjRrMYDM6jE3DC7OlR0vLzfAqvKAN+OGemZeWSo
         ckTnpN321U2nGjSGifme/M5zWDY0/qwN4luMnJEgYoaQequ4CsLjDORVgxfgHKVZVeVg
         Nv2CXBZpy4KykF4vt8nKByy7u/KQKbQGb5SYqvTXPf8uGwjHkHRTN6rt1oZ6lKSUNcMw
         Z73vFARSJJQsph70AD1BF3JDW80UOZK1bxiq16Pkp+4iZOG/he2mR7DRigq/P0O8+qEP
         KnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716294188; x=1716898988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hwv4UfeFB/qhGfzo1UPvxGLOjaOyyNNjAF75j9o1V88=;
        b=vE8n0u8Y/crWyXlk+qJYEnYHGNLQyjXKWLB+RR9OqysFYLDeSDWuD+g2VFO1epmF3p
         i/BGUwb8LYHwHVLNJbZ+ibdzstNtE8QNxj1pBew13kH+BngA5FVMa6Yvvk+ZHwm699e+
         goj0I6LOlmHXafPYEwKyr75ZN0TlkP+rt3E8gWQ47BlYzS/vrKP6jAy8LQEQCAPHuP3q
         SkPPOYIaZJoPPMGd4Y7zWGzGrwMIu9RWebr4Wgcrsa09Gm3maBtnEXXilekuciXiz+b5
         v89J9pVYdUMNcCir88w3rHFc+CefnALG0EizXjA7orqkPbRJV+bd1jvPVkBORfqwcyNI
         5TOg==
X-Forwarded-Encrypted: i=1; AJvYcCUveWMmZ0wcBJdO6mmxYhG7OqK/H5QW0/Zn1Hd+X1m3AS7MyMX0sUwEVAdW0jbEDZbF4qMGtksFARt7ypC2eZ7L3o384ILM0QwzzbikIsGg
X-Gm-Message-State: AOJu0YzTQadjeRYzrxXBJHo/3/srPiLEoWx8TnppUfh6gwXSP7DY6cS9
	LA9uBNqK9czYm+WFYLBmgYtzJJevn1UxyyV75oWjYwkZHe0PKyZBmVZUmyGSpsZF/jBT2iK5r8v
	dHrLYgsrFDFP5dW8m3/m/cFeVi8cHTai/UtNsBA==
X-Google-Smtp-Source: AGHT+IHX4jtW/r/4JyHv1bYM+G3dQXmDZlMIxpf7dQJZDLPBpeUHYdAiwTVGvcK2C7L80+t1dhIgiRP4aMhzpvkO6DY=
X-Received: by 2002:a17:906:5655:b0:a59:8786:3850 with SMTP id
 a640c23a62f3a-a5a2d681266mr2140690066b.72.1716294188405; Tue, 21 May 2024
 05:23:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240521114830.841660-1-bjorn@kernel.org> <20240521114830.841660-2-bjorn@kernel.org>
In-Reply-To: <20240521114830.841660-2-bjorn@kernel.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 21 May 2024 14:22:57 +0200
Message-ID: <CAHVXubhFesiBKL0iF=Xu6J7O2m2i4d903m6o6Anq8JLdwmnz1Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] riscv: mm: Properly forward vmemmap_populate()
 altmap parameter
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_052322_676392_8E193199 
X-CRM114-Status: GOOD (  15.87  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Stoakes <lstoakes@gmail.com>, Chethan Seshadri <Chethan.Seshadri@catalinasystems.io>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Santosh Mamila <santosh.mamila@catalinasystems.io>, linux-mm@kvack.org, Sivakumar Munnangi <siva.munnangi@catalinasystems.io>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, virtualization@lists.linux-foundation.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQmrDtnJuLAoKT24gVHVlLCBNYXkgMjEsIDIwMjQgYXQgMTo0OOKAr1BNIEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogQmrDtnJuIFTDtnBlbCA8Ympv
cm5Acml2b3NpbmMuY29tPgo+Cj4gTWFrZSBzdXJlIHRoYXQgdGhlIGFsdG1hcCBwYXJhbWV0ZXIg
aXMgcHJvcGVybHkgcGFzc2VkIG9uIHRvCj4gdm1lbW1hcF9wb3B1bGF0ZV9odWdlcGFnZXMoKS4K
Pgo+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAt
LS0KPiAgYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0v
aW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBpbmRleCAyNTc0ZjZhM2IwZTcuLmI2NmY4
NDZlNzYzNCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ICsrKyBiL2FyY2gv
cmlzY3YvbW0vaW5pdC5jCj4gQEAgLTE0MzQsNyArMTQzNCw3IEBAIGludCBfX21lbWluaXQgdm1l
bW1hcF9wb3B1bGF0ZSh1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwgaW50
IG5vZGUsCj4gICAgICAgICAgKiBtZW1vcnkgaG90cGx1Zywgd2UgYXJlIG5vdCBhYmxlIHRvIHVw
ZGF0ZSBhbGwgdGhlIHBhZ2UgdGFibGVzIHdpdGgKPiAgICAgICAgICAqIHRoZSBuZXcgUE1Ecy4K
PiAgICAgICAgICAqLwo+IC0gICAgICAgcmV0dXJuIHZtZW1tYXBfcG9wdWxhdGVfaHVnZXBhZ2Vz
KHN0YXJ0LCBlbmQsIG5vZGUsIE5VTEwpOwo+ICsgICAgICAgcmV0dXJuIHZtZW1tYXBfcG9wdWxh
dGVfaHVnZXBhZ2VzKHN0YXJ0LCBlbmQsIG5vZGUsIGFsdG1hcCk7Cj4gIH0KPiAgI2VuZGlmCj4K
PiAtLQo+IDIuNDAuMQo+CgpZb3UgY2FuIGFkZDoKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
