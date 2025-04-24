Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1DBC369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0Z5hDlcHPBT/sj1u3y6pBL+EHapHn5qwf9iEv511/A=; b=BxnaeGQtnh/p+v
	cLqv/Ye5sgOuKG1F8hGYKve4qTc7vBs+u1SYWe6V1euHwvRSA+8pe4ESDw2TObmwXt09Mxh9E/Cat
	SBd3eOM/kpkoDCy0+8begxOexOX/DXs4EVJfZK3NVnrTSV5vsStKKCRv16vmSCMOnYd00LYrRr/79
	WULUvddxAUU3wmdp8Px4EMX7vBkqrvVkyhmWKUWPL5PCp8+i6Bwa+Yok30cp8kDcrtu0CYFGRqdHy
	xrpZojW6dP2ZD1/71gRsI2cIIQPFT0J0q4hLm9PzNkd/qxjqQK1OXZ1NJuQHrc2SN0f1LT37E+C9g
	N5pGC/0pJyGYSqLF53TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80SU-0000000EuNO-18wu;
	Thu, 24 Apr 2025 17:33:58 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80SR-0000000EuL2-0vkm
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:33:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22c33ac23edso13514605ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516034; x=1746120834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvf5XOciI2RxholK/olnAUr6RSsyRw+cO5ZQm+/Dg/Y=;
        b=QHd62u7ZRS72yW3FWEYpPe0V5SYDvZPVqhVXrhOdVX/jvj9I9oq8FMO5nI13DbAPZV
         q+YhIWyo4GkWt1eDGfZA6WbCgBjJ5+sahS1opRuQ3HUgzlAoSTHHSus7he5+YpxD4Fyb
         FnjzKFZZKEYgs211cyUbUAT6byyTUi0cNIi+gouvUOUvzk8fYux8BeC4KVfVLmXCD5ZH
         LIiw6+pGfCRf14/mT+WCFuONK2fZb92arbx7rwcOqyCigBQkBgTFd4WV9L7onEGhtH6M
         E2OHCfS84Gx/9Fb+cy5qOibO6RPlRojxS0RHoCSyzjCaYF2Ks/ahIsXHaOnfy35op8gf
         jV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516034; x=1746120834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gvf5XOciI2RxholK/olnAUr6RSsyRw+cO5ZQm+/Dg/Y=;
        b=D3+FzGIIY7+z154YEiBxMevCHDmPutFkak+9MgjTIKguk2j0wv3labq4rPhm46Gq4F
         zpBi+T5Kvr/Y6CMeaPc8xWtAi8Dq2WXLQ5/VzCwSwiaBoRrbbX997+Xurvkdw3N9iW4A
         tXlCff7Vb5PQHYnxKfhXoDogPgpbNrHzkq+nZ+99OW4D71IcGLYa9IkiFaQ6yDtci8Zm
         yqXA8GRQRSjgaJr22SQ0z5hGvTGfsdqRgo4eJiRiu8JOA7Wfe5IcZaSWdqvjJN7x4nGW
         qFSs4lF6PeR5sxxRSEeNpCvIfxa73DKi6vh7IQY6ziFYDWD6di2TvhwCrmzQMvkPDq/r
         47ZA==
X-Forwarded-Encrypted: i=1; AJvYcCU60lJlgcZ/sp8XD4W7HKv873+3XfcIlUAwaIjvfovh6z3+1xx3qgRl2cHRdB63RpNtvTOcJP9ZB2FclQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHQw4C2JNeNmo+Y3UyUpZV1657R9brECfQ7O+efmJb5hECGcxU
	MAdaOEAOGNmUODKBOEJjiaUxhdQrDg/rCTsYRypVrHHStcEeeL2FnebRXWCtpkY=
X-Gm-Gg: ASbGncs51/0FuWKpiuZwRdeErtshKDMYL58PytbiHoRYTkUjTO39srsokl5KPYd3HwE
	tBu2Vk1qdvBRsSnM+l+uBJNScwHuOTFdembRcLleBLtQHaQWFttGCOCuBd8h5IpuInHJ9odDT2x
	wXWwTXItSha2WI8Dg/6Dc1b/0ESfPXU4G5sKZ4cr55yS1bD2We1GEUZsjPdkT+K8YLxJpRfj9yb
	qjaJhvGpLM5+SpIK06YYDPDZrQ5L66T6o4SaQa//EBcWIoA1cLcqEFfiY/l9/dWRK+OapJMtUfh
	ZJSXCy0XSba8ax4s+v8v4irDSHTiCQWRHuGcSQS4Vg==
X-Google-Smtp-Source: AGHT+IHaM8bzJfRRvw0MkUxc3QW2tm+twyY3rgnrMs/7xPlJBt/0WAycPUEFxVys/K0zq71dkmTO4g==
X-Received: by 2002:a17:902:d489:b0:22d:b243:2fee with SMTP id d9443c01a7336-22dbd415915mr4178995ad.13.1745516034428;
        Thu, 24 Apr 2025 10:33:54 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:33:53 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 02/14] riscv: sbi: remove useless parenthesis
Date: Thu, 24 Apr 2025 19:31:49 +0200
Message-ID: <20250424173204.1948385-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103355_377315_81C1A9FD 
X-CRM114-Status: GOOD (  10.00  )
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

QSBmZXcgcGFyZW50aGVzaXMgaW4gY2hlY2sgZm9yIFNCSSB2ZXJzaW9uL2V4dGVuc2lvbiB3ZXJl
IHVzZWxlc3MsCnJlbW92ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxj
bGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVsL3NiaS5jIHwgNiArKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmku
YwppbmRleCAxOTg5YjhjYWRlMWIuLjFkNDRjMzUzMDVhOSAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvc2JpLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKQEAgLTYwOSw3ICs2
MDksNyBAQCB2b2lkIF9faW5pdCBzYmlfaW5pdCh2b2lkKQogCQl9IGVsc2UgewogCQkJX19zYmlf
cmZlbmNlCT0gX19zYmlfcmZlbmNlX3YwMTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24g
Pj0gc2JpX21rX3ZlcnNpb24oMCwgMykpICYmCisJCWlmIChzYmlfc3BlY192ZXJzaW9uID49IHNi
aV9ta192ZXJzaW9uKDAsIDMpICYmCiAJCSAgICBzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRf
U1JTVCkpIHsKIAkJCXByX2luZm8oIlNCSSBTUlNUIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJ
CQlwbV9wb3dlcl9vZmYgPSBzYmlfc3JzdF9wb3dlcl9vZmY7CkBAIC02MTcsOCArNjE3LDggQEAg
dm9pZCBfX2luaXQgc2JpX2luaXQodm9pZCkKIAkJCXNiaV9zcnN0X3JlYm9vdF9uYi5wcmlvcml0
eSA9IDE5MjsKIAkJCXJlZ2lzdGVyX3Jlc3RhcnRfaGFuZGxlcigmc2JpX3Nyc3RfcmVib290X25i
KTsKIAkJfQotCQlpZiAoKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkp
ICYmCi0JCSAgICAoc2JpX3Byb2JlX2V4dGVuc2lvbihTQklfRVhUX0RCQ04pID4gMCkpIHsKKwkJ
aWYgKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21rX3ZlcnNpb24oMiwgMCkgJiYKKwkJICAgIHNi
aV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9EQkNOKSA+IDApIHsKIAkJCXByX2luZm8oIlNCSSBE
QkNOIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7CiAJCQlzYmlfZGVidWdfY29uc29sZV9hdmFpbGFi
bGUgPSB0cnVlOwogCQl9Ci0tIAoyLjQ5LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
