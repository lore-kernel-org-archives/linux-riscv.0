Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F564C7619A
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 04:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUnBDRm9A/8E7ZDdFzTf9eyZzRd5KZba4enM7H+zRW0=; b=e3w6bT/UY+WplH
	gSrJ6rsnoRBxPX5OzmaUSN/1ChGuwNj4pn8VsisNOR3B1mdUM7/oFbYof7QvyA5ac6mY9xpH0w+o2
	7jxa5qIHNTx9UPWn7ALHa5rVuJqgDhCoCPzrrtx6AAyTiXLtFfLDR+I0VONa9aRkk2PrzI426w/8i
	c6xnEjoZzAm9WsDXbk5NG6RMwav7Gs872HlykByHCCDGZyaQYMRClvf1386Qt3LByTqUZ94vSYtyp
	TJiE2MjYpkb3gbFG6QguuUlkPdq6hnNY9n7tdid8AzOOv7bsLntptvsR1e3BXLUJfT40ofSVSM4sk
	03qUTBwnD1qV0rdD9P0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjucb-003IjV-21;
	Wed, 05 Apr 2023 04:19:45 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjucY-003IiP-06
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 04:19:43 +0000
Received: by mail-wr1-x436.google.com with SMTP id l12so34820595wrm.10
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 21:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1680668377;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BjpitaAtSgkqnnZepwdAnWUHtXKGCm4ypPOIBhTYG4=;
        b=e4BiLC+K4OYu8TIu0STxll21APg+0MALOyXN2SMFNO5cMHrJpvXOAIvzfiUxo2q+V5
         WDvHh+QslH4AhH+2TjZuYkNkEaTLztytVL2f0UYCH/TmJEd/0TAAlr//N84HDPO+XfkD
         bvPR0eoq113cOieEQrQOeDXLnxrzu4Jx3aEwesqPJ349gVeRWz3Da6iqV4pSU/2Y4iNt
         MnRmqCgCxV0aZLY7aaRW/N/kl8M1sH1Tu+WzfPMLUDgArZTNBjGppJ3nUd1FX9TI0JaZ
         seEVGGKFa1LrcmSBIBRzX4kFY1havHXXvqCKrIitnLfe41G3TACDVnWYFtLdpqNQBFsi
         ii4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680668377;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/BjpitaAtSgkqnnZepwdAnWUHtXKGCm4ypPOIBhTYG4=;
        b=v1ddejX4fXRNPvkmlGQkiT/qi2ekFhRK+PiwmKCNOvJaocS5xaf1G9Z1GS98bZQiMi
         Aa5vBNhBvPsBTtL/rUT+xOEADpSVxsLqUFvwhi6kL6aigjOP1aye4reO1kSFg7gi3fdE
         E/Lch9nAq9WRuasD7TaRvoIJflwAaA2IBwqmqONx8ExWYnm5LpY1w+x12uWVamjaSm0X
         rFLD+NMsSSWnMVLLj8l+jdMm0FqPPxOn6iqemK9tXFv0f8/Wd8OiZNSEJNFYMJ6TxgmZ
         Bqbm8yGtbQ3ahLVMvDRZ0epf2uBc8qeWWGRTMfNQpTk4bQ0T6WUbSTH2yn3J51CDa4CG
         8u4g==
X-Gm-Message-State: AAQBX9dGI18wyF8Xq9Dgjgvb11w8Kd7sMNKYkg855VuSI+QuXnFd+g41
	TEIK1BCG7xQmeIsiaf99K8Aj+A==
X-Google-Smtp-Source: AKy350blw7YP4lnrKWGeXu58qdeqpEXA8gM8aenLdDfKqAQOydoUR5t2gTdnK43PxXcc1htfiqIEPA==
X-Received: by 2002:a5d:6b91:0:b0:2e5:9101:e3af with SMTP id n17-20020a5d6b91000000b002e59101e3afmr3411038wrx.31.1680668377340;
        Tue, 04 Apr 2023 21:19:37 -0700 (PDT)
Received: from smtpclient.apple (global-5-142.n-2.net.cam.ac.uk. [131.111.5.142])
        by smtp.gmail.com with ESMTPSA id t12-20020a7bc3cc000000b003ee42696acesm797550wmj.16.2023.04.04.21.19.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Apr 2023 21:19:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH V4 22/23] platform/surface: Disable for RISC-V
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230404182037.863533-23-sunilvl@ventanamicro.com>
Date: Wed, 5 Apr 2023 05:19:35 +0100
Cc: linux-doc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-acpi@vger.kernel.org,
 linux-crypto@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 llvm@lists.linux.dev,
 Weili Qian <qianweili@huawei.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tom Rix <trix@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Zhou Wang <wangzhou1@hisilicon.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Len Brown <lenb@kernel.org>
Message-Id: <EAC85F14-B1DA-4358-9042-A607436D582A@jrtc27.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
 <20230404182037.863533-23-sunilvl@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_211942_103597_A280DF91 
X-CRM114-Status: GOOD (  22.85  )
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

T24gNCBBcHIgMjAyMywgYXQgMTk6MjAsIFN1bmlsIFYgTCA8c3VuaWx2bEB2ZW50YW5hbWljcm8u
Y29tPiB3cm90ZToKPiAKPiBXaXRoIENPTkZJR19BQ1BJIGVuYWJsZWQgZm9yIFJJU0MtViwgdGhp
cyBkcml2ZXIgZ2V0cyBlbmFibGVkCj4gaW4gYWxsbW9kY29uZmlnIGJ1aWxkLiBIb3dldmVyLCBS
SVNDLVYgZG9lc24ndCBzdXBwb3J0IHN1Yi13b3JkCj4gYXRvbWljcyB3aGljaCBpcyB1c2VkIGJ5
IHRoaXMgZHJpdmVyLgoKV2h5IG5vdD8gQ29tcGlsZXJzIGFuZCBsaWJhdG9taWMgZG8sIHNvIHN1
cmVseSB0aGUgTGludXgga2VybmVsIHNob3VsZAp0b28uCgo+IER1ZSB0byB0aGlzLCB0aGUgYnVp
bGQgZmFpbHMKPiB3aXRoIGJlbG93IGVycm9yLgo+IAo+IEluIGZ1bmN0aW9uIMOi4oKsy5xzc2hf
c2VxX25leHTDouKCrOKEoiwKPiAgICBpbmxpbmVkIGZyb20gw6LigqzLnHNzYW1fcmVxdWVzdF93
cml0ZV9kYXRhw6LigqzihKIgYXQgZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3Iv
Y29udHJvbGxlci5jOjE0ODM6ODoKPiAuLy4vaW5jbHVkZS9saW51eC9jb21waWxlcl90eXBlcy5o
OjM5OTo0NTogZXJyb3I6IGNhbGwgdG8gw6LigqzLnF9fY29tcGlsZXRpbWVfYXNzZXJ0XzMzNcOi
4oKs4oSiIGRlY2xhcmVkIHdpdGggYXR0cmlidXRlIGVycm9yOiBCVUlMRF9CVUcgZmFpbGVkCj4g
IDM5OSB8ICAgICAgICAgX2NvbXBpbGV0aW1lX2Fzc2VydChjb25kaXRpb24sIG1zZywgX19jb21w
aWxldGltZV9hc3NlcnRfLCBfX0NPVU5URVJfXykKPiAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6
Nzg6NDU6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8gw6LigqzLnHVubGlrZWx5w6Ligqzi
hKIKPiAgIDc4IHwgIyBkZWZpbmUgdW5saWtlbHkoeCkgICAgX19idWlsdGluX2V4cGVjdCghISh4
KSwgMCkKPiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeCj4gLi8uL2luY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozODc6OTogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIMOi4oKsy5xfX2NvbXBpbGV0aW1lX2Fzc2VydMOi4oKs4oSiCj4g
IDM4NyB8ICAgICAgICAgX19jb21waWxldGltZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIHByZWZp
eCwgc3VmZml4KQo+ICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4gLi8uL2lu
Y2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozOTk6OTogbm90ZTogaW4gZXhwYW5zaW9uIG9m
IG1hY3JvIMOi4oKsy5xfY29tcGlsZXRpbWVfYXNzZXJ0w6LigqzihKIKPiAgMzk5IHwgICAgICAg
ICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2Vy
dF8sIF9fQ09VTlRFUl9fKQo+ICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn4KPiAu
L2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6Mzk6Mzc6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBt
YWNybyDDouKCrMucY29tcGlsZXRpbWVfYXNzZXJ0w6LigqzihKIKPiAgIDM5IHwgI2RlZmluZSBC
VUlMRF9CVUdfT05fTVNHKGNvbmQsIG1zZykgY29tcGlsZXRpbWVfYXNzZXJ0KCEoY29uZCksIG1z
ZykKPiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+
fn5+fn5+fn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2J1aWxkX2J1Zy5oOjU5OjIxOiBub3RlOiBpbiBl
eHBhbnNpb24gb2YgbWFjcm8gw6LigqzLnEJVSUxEX0JVR19PTl9NU0fDouKCrOKEogo+ICAgNTkg
fCAjZGVmaW5lIEJVSUxEX0JVRygpIEJVSUxEX0JVR19PTl9NU0coMSwgIkJVSUxEX0JVRyBmYWls
ZWQiKQo+ICAgICAgfCAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAuL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oOjMzNToxNzogbm90ZTogaW4gZXhwYW5zaW9u
IG9mIG1hY3JvIMOi4oKsy5xCVUlMRF9CVUfDouKCrOKEogo+ICAzMzUgfCAgICAgICAgICAgICAg
ICAgQlVJTERfQlVHKCk7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gICAgICB8ICAgICAgICAgICAgICAgICBefn5+fn5+fn4KPiAuL2FyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY21weGNoZy5oOjM0NDozMDogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIMOi
4oKsy5xfX2NtcHhjaGfDouKCrOKEogo+ICAzNDQgfCAgICAgICAgIChfX3R5cGVvZl9fKCoocHRy
KSkpIF9fY21weGNoZygocHRyKSwgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gICAgICB8
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+Cj4gLi9pbmNsdWRlL2xpbnV4
L2F0b21pYy9hdG9taWMtaW5zdHJ1bWVudGVkLmg6MTkxNjo5OiBub3RlOiBpbiBleHBhbnNpb24g
b2YgbWFjcm8gw6LigqzLnGFyY2hfY21weGNoZ8Oi4oKs4oSiCj4gMTkxNiB8ICAgICAgICAgYXJj
aF9jbXB4Y2hnKF9fYWlfcHRyLCBfX1ZBX0FSR1NfXyk7IFwKPiAgICAgIHwgICAgICAgICBefn5+
fn5+fn5+fn4KPiBkcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9jb250cm9sbGVy
LmM6NjE6MzI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDDouKCrMucY21weGNoZ8Oi4oKs
4oSiCj4gICA2MSB8ICAgICAgICAgd2hpbGUgKHVubGlrZWx5KChyZXQgPSBjbXB4Y2hnKCZjLT52
YWx1ZSwgb2xkLCBuZXcpKSAhPSBvbGQpKSB7Cj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+Cj4gCj4gU28sIGRpc2FibGUgdGhpcyBkcml2ZXIgZm9yIFJJU0Mt
ViBldmVuIHdoZW4gQUNQSSBpcyBlbmFibGVkIGZvciBub3cuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U3VuaWwgViBMIDxzdW5pbHZsQHZlbnRhbmFtaWNyby5jb20+Cj4gLS0tCj4gZHJpdmVycy9wbGF0
Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZyB8IDIgKy0KPiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
bGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZyBiL2RyaXZlcnMvcGxhdGZvcm0vc3Vy
ZmFjZS9hZ2dyZWdhdG9yL0tjb25maWcKPiBpbmRleCBjMTE0ZjlkZDVmZTEuLjg4YWZjMzhmZmRj
NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2UvYWdncmVnYXRvci9LY29u
ZmlnCj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS9zdXJmYWNlL2FnZ3JlZ2F0b3IvS2NvbmZpZwo+
IEBAIC00LDcgKzQsNyBAQAo+IG1lbnVjb25maWcgU1VSRkFDRV9BR0dSRUdBVE9SCj4gCXRyaXN0
YXRlICJNaWNyb3NvZnQgU3VyZmFjZSBTeXN0ZW0gQWdncmVnYXRvciBNb2R1bGUgU3Vic3lzdGVt
IGFuZCBEcml2ZXJzIgo+IAlkZXBlbmRzIG9uIFNFUklBTF9ERVZfQlVTCj4gLQlkZXBlbmRzIG9u
IEFDUEkKPiArCWRlcGVuZHMgb24gQUNQSSAmJiAhUklTQ1YKCklmIHlvdSBpbnNpc3Qgb24gZG9p
bmcgdGhpcywgYXQgbGVhc3QgbWFrZSBpdCBzb21lIG5ldyBjb25maWcgdmFyaWFibGUKdGhhdOKA
mXMgc2VsZi1kb2N1bWVudGluZyBhbmQgbWVhbnMgdGhpcyBhdXRvbWF0aWNhbGx5IGdldHMgcmUt
ZW5hYmxlZAp3aGVuIGFyY2gvcmlzY3YgZml4ZXMgdGhpcyBkZWZpY2llbmN5PyBIYXJkLWNvZGlu
ZyBhcmNoIGxpc3RzIGxpa2UgdGhpcwpzZWVtcyBsaWtlIGEgdGVycmlibGUgYW50aS1wYXR0ZXJu
LgoKSmVzcwoKPiAJc2VsZWN0IENSQ19DQ0lUVAo+IAloZWxwCj4gCSAgVGhlIFN1cmZhY2UgU3lz
dGVtIEFnZ3JlZ2F0b3IgTW9kdWxlIChTdXJmYWNlIFNBTSBvciBTU0FNKSBpcyBhbgo+IC0tIAo+
IDIuMzQuMQo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
