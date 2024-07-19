Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C961C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY2jXOuabB5kNF7/IXnpUfiXnnaGqA/Te6O09OadtFU=; b=XUzSe2sgF90sia
	yJXc9CL9ceGHESVrhZffhEZW8GrNEXcYguxLyzVN6Iqlzgo9gKEejdGcJDkY7toCl8h/zmL88CfBj
	Qsvh2Op3zXp3PWYALwasJaps++NEgso8O8p5vLUYYyMe2hd6cSRhY31zSlizFrpcJ+Mz9wL85q260
	pzixGv5i88V2jt1lnzB8uHq7hkFb7DRxfCFYuEGC1Kuv1U5WdneBRqr1sOB+YTGCrLmgBOLa3M2uw
	/6p4W9mruQZDq4S3vKo4/2o/oOUT0ATPE9ndLnEmiQJP1tc1NMi3jXgPHjLq9t+LxcJdrvgGGSx+N
	lekJD9QRpv7qjDJaow2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUtj4-00000003gvf-1ERh;
	Fri, 19 Jul 2024 19:57:10 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUtj0-00000003gv7-3zwK
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 19:57:08 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-59589a9be92so1437977a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 12:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721419024; x=1722023824; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71CBKJ5o7I4cy2JXrEI11tVDU0uyHgYLiRo2v5Mi+QE=;
        b=xECcJKsoOuZGiqnGMR8zEGlp2Vk+xMFcC3x6sL5zSz8tg/vkvQ1tTLc9/JVl6ZKvTR
         dw0Cy9sLFNWuga4c/xnIqMzcGcQ1O96kuAzt681t0WfmJ4rJutwxn+f6FuLU+O1ICDuw
         qTMde09fda//3XGfDZWes1tzMNxxjBJTfBp3wIYqg1RDFSPJ8Bd/qk3EYLgP2hxdVGkC
         PNwwwDvknXLDT5sJ3R2ROLtPs2ayjC+kJMqwUZiJ6Cufmr0e0k7KdCjnRYj1lQQC5RPZ
         REAb8mtdiD6PS/VTH4nClqRDS6RMY2vlpx0PGX1gD0zHW7fhi/yarVW/kXByfIkFmRT2
         P5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721419024; x=1722023824;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71CBKJ5o7I4cy2JXrEI11tVDU0uyHgYLiRo2v5Mi+QE=;
        b=tiQ1GTxPjzenXAPoAZEANI7tbA4ha8jt/BG8DImecXzhCPuOOdz3DmHbnXXmCa4FrB
         GWYay56MuPB5FYisUN7X66qb0ZV9aRyqPVy6BcgC4OIZ/BgtFs5Q4mfQhr7U8/bHHrqD
         /jlgIJ5gI7blpmrxHuzxdu+z1S9SRDDm0dKWDswCIzTr7uYPqzTlc6p5eZaXgkEu/7Zc
         m8Jm5HS3MjNk0xj/yKa6XozoCEcihqSaGlrOCVzo256ck3Mfd0imiObZhZ6NzGmP1Abj
         JAoHA00+wyFa8eBs1iyLzFkMT2fJG2TcaspLCgCdKvfZSqWULFtM+gQX+H6g1XFZ+SXv
         lbRQ==
X-Gm-Message-State: AOJu0YyOVGRltZ3Idh0iq+XVtOae3uH9I1UWxVi7bHqKwLmRqx16xWUg
	K17dE6TaMwOrqzYyf2O4QGQonDIb/WQHR2BoKaO7MEd97WnmpwF+S9YAvuCTgHO2IYMyshIwjcX
	nvct0MKzTMnTQBri8Lbq5ne2gVfK5owl8sLwnwQ==
X-Google-Smtp-Source: AGHT+IGMKZ7Id6PZ9k5+krjiDl6iseri2cr1uDlMZ6EwfH9XwMKTFPCtWo++b63LltYV6CLMBQXdC/iIw073Dt+So4w=
X-Received: by 2002:a17:906:fa1a:b0:a6f:b58f:ae3c with SMTP id
 a640c23a62f3a-a7a0116c6acmr543296366b.26.1721419024408; Fri, 19 Jul 2024
 12:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240717180727.4180475-1-jesse@rivosinc.com> <20240717180727.4180475-4-jesse@rivosinc.com>
In-Reply-To: <20240717180727.4180475-4-jesse@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 19 Jul 2024 12:56:28 -0700
Message-ID: <CALs-Hst+Wb4MNoN6y+pOF92+MLenGZqhcZUmZW+rW76DTECduA@mail.gmail.com>
Subject: Re: [PATCH v5 3/7] RISC-V: Check scalar unaligned access on all CPUs
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>, 
	Eric Biggers <ebiggers@google.com>, Greentime Hu <greentime.hu@sifive.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Heiko Stuebner <heiko@sntech.de>, Costa Shulyupin <costa.shul@redhat.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>, 
	Anup Patel <apatel@ventanamicro.com>, Zong Li <zong.li@sifive.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Erick Archer <erick.archer@gmx.com>, Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_125707_276141_B4F10849 
X-CRM114-Status: GOOD (  21.02  )
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

T24gV2VkLCBKdWwgMTcsIDIwMjQgYXQgMTE6MDfigK9BTSBKZXNzZSBUYXViZSA8amVzc2VAcml2
b3NpbmMuY29tPiB3cm90ZToKPgo+IE9yaWdpbmFsbHksIHRoZSBjaGVja191bmFsaWduZWRfYWNj
ZXNzX2VtdWxhdGVkX2FsbF9jcHVzIGZ1bmN0aW9uCj4gb25seSBjaGVja2VkIHRoZSBib290IGhh
cnQuIFRoaXMgZml4ZXMgdGhlIGZ1bmN0aW9uIHRvIGNoZWNrIGFsbAo+IGhhcnRzLgo+Cj4gRml4
ZXM6IDcxYzU0YjNkMTY5ZCAoInJpc2N2OiByZXBvcnQgbWlzYWxpZ25lZCBhY2Nlc3NlcyBlbXVs
YXRpb24gdG8gaHdwcm9iZSIpCj4gU2lnbmVkLW9mZi1ieTogSmVzc2UgVGF1YmUgPGplc3NlQHJp
dm9zaW5jLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hhcmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9z
aW5jLmNvbT4KClJldmlld2VkLWJ5OiBFdmFuIEdyZWVuIDxldmFuQHJpdm9zaW5jLmNvbT4KCgo+
IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gVjEgLT4gVjI6Cj4gIC0gTmV3IHBh
dGNoCj4gVjIgLT4gVjM6Cj4gIC0gU3BsaXQgcGF0Y2gKPiBWMyAtPiBWNDoKPiAgLSBSZS1hZGQg
Y2hlY2sgZm9yIGEgc3lzdGVtIHdoZXJlIGEgaGV0ZXJvZ2VuZW91cwo+ICAgICBDUFUgaXMgaG90
cGx1Z2dlZCBpbnRvIGEgcHJldmlvdXNseSBob21vZ2Vub3VzCj4gICAgIHN5c3RlbS4KPiBWNCAt
PiBWNToKPiAgLSBDaGFuZ2Ugd29ya19zdHJ1Y3QgKnVudXNlZCB0byB3b3JrX3N0cnVjdCAqd29y
ayBfX2Fsd2F5c191bnVzZWQKPiAtLS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxp
Z25lZC5jIHwgMTQgKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMK
PiBpbmRleCBiNjJkNWEyZjQ1NDEuLjlhMWU5NDM4M2Q2ZCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwc19taXNhbGlnbmVkLmMKPiBAQCAtNTI2LDExICs1MjYsMTEgQEAgaW50IGhhbmRsZV9taXNh
bGlnbmVkX3N0b3JlKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAgICAgICAgcmV0dXJuIDA7Cj4g
IH0KPgo+IC1zdGF0aWMgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGludCBj
cHUpCj4gK3N0YXRpYyB2b2lkIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWQoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrIF9fYWx3YXlzX3VudXNlZCkKPiAgewo+ICsgICAgICAgaW50IGNw
dSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsKPiAgICAgICAgIGxvbmcgKm1hc19wdHIgPSBwZXJfY3B1
X3B0cigmbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQsIGNwdSk7Cj4gICAgICAgICB1bnNpZ25lZCBs
b25nIHRtcF92YXIsIHRtcF92YWw7Cj4gLSAgICAgICBib29sIG1pc2FsaWduZWRfZW11X2RldGVj
dGVkOwo+Cj4gICAgICAgICAqbWFzX3B0ciA9IFJJU0NWX0hXUFJPQkVfTUlTQUxJR05FRF9VTktO
T1dOOwo+Cj4gQEAgLTUzOCwxOSArNTM4LDE2IEBAIHN0YXRpYyBib29sIGNoZWNrX3VuYWxpZ25l
ZF9hY2Nlc3NfZW11bGF0ZWQoaW50IGNwdSkKPiAgICAgICAgICAgICAgICAgIiAgICAgICAiUkVH
X0wiICVbdG1wXSwgMSglW3B0cl0pXG4iCj4gICAgICAgICAgICAgICAgIDogW3RtcF0gIj1yIiAo
dG1wX3ZhbCkgOiBbcHRyXSAiciIgKCZ0bXBfdmFyKSA6ICJtZW1vcnkiKTsKPgo+IC0gICAgICAg
bWlzYWxpZ25lZF9lbXVfZGV0ZWN0ZWQgPSAoKm1hc19wdHIgPT0gUklTQ1ZfSFdQUk9CRV9NSVNB
TElHTkVEX0VNVUxBVEVEKTsKPiAgICAgICAgIC8qCj4gICAgICAgICAgKiBJZiB1bmFsaWduZWRf
Y3RsIGlzIGFscmVhZHkgc2V0LCB0aGlzIG1lYW5zIHRoYXQgd2UgZGV0ZWN0ZWQgdGhhdCBhbGwK
PiAgICAgICAgICAqIENQVVMgdXNlcyBlbXVsYXRlZCBtaXNhbGlnbmVkIGFjY2VzcyBhdCBib290
IHRpbWUuIElmIHRoYXQgY2hhbmdlZAo+ICAgICAgICAgICogd2hlbiBob3RwbHVnZ2luZyB0aGUg
bmV3IGNwdSwgdGhpcyBpcyBzb21ldGhpbmcgd2UgZG9uJ3QgaGFuZGxlLgo+ICAgICAgICAgICov
Cj4gLSAgICAgICBpZiAodW5saWtlbHkodW5hbGlnbmVkX2N0bCAmJiAhbWlzYWxpZ25lZF9lbXVf
ZGV0ZWN0ZWQpKSB7Cj4gKyAgICAgICBpZiAodW5saWtlbHkodW5hbGlnbmVkX2N0bCAmJiAoKm1h
c19wdHIgIT0gUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEKSkpIHsKPiAgICAgICAg
ICAgICAgICAgcHJfY3JpdCgiQ1BVIG1pc2FsaWduZWQgYWNjZXNzZXMgbm9uIGhvbW9nZW5lb3Vz
IChleHBlY3RlZCBhbGwgZW11bGF0ZWQpXG4iKTsKPiAgICAgICAgICAgICAgICAgd2hpbGUgKHRy
dWUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY3B1X3JlbGF4KCk7Cj4gICAgICAgICB9Cj4g
LQo+IC0gICAgICAgcmV0dXJuIG1pc2FsaWduZWRfZW11X2RldGVjdGVkOwo+ICB9Cj4KPiAgYm9v
bCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCj4gQEAgLTU2
Miw4ICs1NTksMTEgQEAgYm9vbCBjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9j
cHVzKHZvaWQpCj4gICAgICAgICAgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0YXNrcyByZXF1
ZXN0aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQo+ICAgICAgICAgICogQ1BVLgo+ICAg
ICAgICAgICovCj4gKyAgICAgICBzY2hlZHVsZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRf
YWNjZXNzX2VtdWxhdGVkKTsKPiArCj4gICAgICAgICBmb3JfZWFjaF9vbmxpbmVfY3B1KGNwdSkK
PiAtICAgICAgICAgICAgICAgaWYgKCFjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKGNw
dSkpCj4gKyAgICAgICAgICAgICAgIGlmIChwZXJfY3B1KG1pc2FsaWduZWRfYWNjZXNzX3NwZWVk
LCBjcHUpCj4gKyAgICAgICAgICAgICAgICAgICAhPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURf
RU1VTEFURUQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAg
ICAgICB1bmFsaWduZWRfY3RsID0gdHJ1ZTsKPiAtLQo+IDIuNDUuMgo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
