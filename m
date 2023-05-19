Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D20CC77B75
	for <linux-riscv@archiver.kernel.org>; Fri, 19 May 2023 21:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QLQWfPSbxlSNGNs2Y74gxyqj5ggqUn0SxxR/DE6LB08=; b=V6v8AwSaQo1zPcpaYRIehmiSqD
	i87Axk/Yzbdq9TqSUQzQ4DpVrmCp/n75hgMkZUw/7iup6zCjHszg9JVfLf70yMgzEjsIhdtCmDAne
	vKmvOFo1C09y5Skw0+JoGubF9sAZSl+xmJay7AdxruDxYF4nxgdOIlflqARDazqqMN4G3X2UikwVq
	NJyGcMOKBa9e9oHu3Gbc2nGiH2JRC2xR30kWYIPw5lBMY+tfCDUAxc1oEcVS3M2R030W8HvD7jJih
	Uz/BCRtqU4+3lC/0qsc0Bvny/n5B8GAk6CwurDYNlsqCKoUvQ+2KEnztYjY5YbuJHzA7YTNnyGv9+
	NDj4SN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q084U-00HLBL-2X;
	Fri, 19 May 2023 21:55:34 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q084S-00HLAK-0K
	for linux-riscv@lists.infradead.org;
	Fri, 19 May 2023 21:55:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1ae763f9c0bso14988785ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 14:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1684533329; x=1687125329;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4uXFG3N07SM/6noHGA5ZD0BhWKs4fe06jSmLKiYiFpA=;
        b=qi8xAHodXi1tTUlxkODdWEQyiAwma/a9BvGcwY/aQkz6Qrfgd/uYwIsQ3ftgzEUzB7
         gQPnW4y98zBiQ1VJR1u1WmO0yXGgMdTnoKC4h1pdaN0elORWUcBRgyEH9K9ragANYapi
         wvIqmSO9V822mFO1HA5NixmIP6q/D+Q5AwrBbbtETBnZBo3FeUikHs11UulsM7CkjzDJ
         J8h6sS8sJhSFcDl/4uQ/P1JP35ibHi6+NnvdLdBO39EeIwkui0FYW8krsRQlEj+OcJaT
         1EkX2USheSSzI+PFRacvW1yO7xokuC0lKYP8KIO4GPA1Hd/ORj085Er5URM/OrxF27lc
         9Zbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684533329; x=1687125329;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4uXFG3N07SM/6noHGA5ZD0BhWKs4fe06jSmLKiYiFpA=;
        b=LOWFru5IFeqYHdctH8Ys5jGI1LP0ADuJYz2tX5nSO+JwUlPVqCu+R/Wj4cgPeZky3A
         zbeRWJuy33MbqFLGXdybbx56Fgi66ga7xt99Lq6/ZvRoIuzHm0180fZLiyhVh9cEt4wU
         bMHHnhn5BszBcyIDK+2C/iDLM+UMXjovSw4TN/sJmQlz1SjziPwOk8bG16+YGrgDYuFB
         PGGQasUxxrSNpM5+uem8qIsRvObCCYOmPVi9CIU3fzjGp6i/3QV4gPnbBci9jLRuisRH
         yncPG/FiXu9y6CRu3wN7G8gpVbM4Kpfq8Wgo4M5OZGe/KyGceUSXl5l1VUSbbXO5foB8
         ZeeA==
X-Gm-Message-State: AC+VfDykoK7RdC3VUlEu05QDChTsKXKCpPBo21vc3FLuVTipZFC3JRE2
	+CzaGhooKJmmnxpDpggYBHbDVQ==
X-Google-Smtp-Source: ACHHUZ5/ROOeL9x3rAVEVvDuoSZzBU2MR5h4O3UXzZfGGu9m3CMVQZIexSY6expZXuqtDJrP1h/97g==
X-Received: by 2002:a17:902:e746:b0:1aa:df9e:2d19 with SMTP id p6-20020a170902e74600b001aadf9e2d19mr4239865plf.54.1684533329317;
        Fri, 19 May 2023 14:55:29 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id g23-20020a170902869700b001a98f844e60sm80031plo.263.2023.05.19.14.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 14:55:28 -0700 (PDT)
Date: Fri, 19 May 2023 14:55:28 -0700 (PDT)
X-Google-Original-Date: Fri, 19 May 2023 14:55:05 PDT (-0700)
Subject: Re: [PATCH v8 1/3] riscv: Introduce CONFIG_RELOCATABLE
In-Reply-To: <87sfbsvvp0.fsf@igel.home>
CC: alex@ghiti.fr, alexghiti@rivosinc.com, mpe@ellerman.id.au, npiggin@gmail.com,
  christophe.leroy@csgroup.eu, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@linux-m68k.org
Message-ID: <mhng-d3720bcf-5eda-46da-b640-0606ef3a60e2@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_145532_141726_A74855D0 
X-CRM114-Status: GOOD (  11.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxOSBNYXkgMjAyMyAxNDo0ODo1OSBQRFQgKC0wNzAwKSwgc2Nod2FiQGxpbnV4LW02
OGsub3JnIHdyb3RlOgo+IE9uIE1haSAxOSAyMDIzLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4K
Pj4gSSBoYXZlIHRlc3RlZCB0aGUgZm9sbG93aW5nIHBhdGNoIHN1Y2Nlc3NmdWxseSwgY2FuIHlv
dSBnaXZlIGl0IGEgdHJ5Cj4+IHdoaWxlIEkgbWFrZSBzdXJlIHRoaXMgaXMgdGhlIG9ubHkgcGxh
Y2UgSSBmb3Jnb3QgdG8gYWRkIHRoZSAtZm5vLXBpZQo+PiBmbGFnPwo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmls
ZQo+PiBpbmRleCBmYmRjY2MyMTQxOGEuLjE1Mzg2NGU0ZjM5OSAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZp
bGUKPj4gQEAgLTIzLDYgKzIzLDEwIEBAIGlmZGVmIENPTkZJR19GVFJBQ0UKPj4gwqBDRkxBR1Nf
UkVNT1ZFX2FsdGVybmF0aXZlLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPj4gwqBDRkxBR1NfUkVN
T1ZFX2NwdWZlYXR1cmUubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+PiDCoGVuZGlmCj4+ICtpZmRl
ZiBDT05GSUdfUkVMT0NBVEFCTEUKPj4gK0NGTEFHU19hbHRlcm5hdGl2ZS5vICs9IC1mbm8tcGll
Cj4+ICtDRkxBR1NfY3B1ZmVhdHVyZS5vICs9IC1mbm8tcGllCj4+ICtlbmRpZgo+PiDCoGlmZGVm
IENPTkZJR19LQVNBTgo+PiDCoEtBU0FOX1NBTklUSVpFX2FsdGVybmF0aXZlLm8gOj0gbgo+PiDC
oEtBU0FOX1NBTklUSVpFX2NwdWZlYXR1cmUubyA6PSBuCj4KPiBJIGNhbiBjb25maXJtIHRoYXQg
dGhpcyBmaXhlcyB0aGUgY3Jhc2guCgpUaGFua3MuICBBbGV4OiBjYW4geW91IHNlbmQgYSBwYXRj
aD8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
