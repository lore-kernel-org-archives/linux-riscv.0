Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31D1C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 16:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Yqfw7yxNhtnPH6dNEBn+2pMGImDGM4fpxiOZ2nM1Og=; b=ZFzW9fTklcwxrU
	RNavPCCZMalShfX7omoQ34CqFI4usX7mpWiCpvVBrrYDRwd5Nfvgep7LZ8skGCNo4frGf1YhHVlir
	YSbBYKzWIKJUYfmfWBQ0h0UcvkAlXmqYCxRzHeWNKWqVdlwPO8rLi+zj64HIEeQctc6hui1TOlazF
	tuRW96XapOpLk5J4queTsY3Upvx89JBOiFFhhhO+edI9JwzfI5sgMxR2fep2jdFTApKTN/hK0eYpb
	zKxFKmwZeG5Mw5hKcaCmb+35Y3Bbb3waTsF191yQpEKhink2YzYSkAb1IFgBfLhaZxNUCYahT/FG2
	TX86uj4vTthWl8geEnNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVml-00000009zMl-1gfZ;
	Wed, 27 Mar 2024 16:06:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmV-00000009zCc-3b4S
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 16:05:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JTir40frdJeiV9LGmiUfO8UY8kCkwqA6MXq/cDxcl6E=; b=pzOnty5SSWcXWQYvVjm49bYLmZ
	dsqCAvS+G8Ng/Yx9ML3g7WpJgYMXAM/Bv9GSKFV8Ej5PLkL2vUHOiDJ9ZNtI3jg8RviUk5HAM2yVj
	C92uOq17DIh5M6Z02+e4EB1FovhXAIKNIn/YFS6RSocS2u/r9UbSx9WV+foCR0fjDK1MWXN7Oeel8
	RftDNSOa4NU2i0aIBz6GpENAc7/60sXz10sNACxmeMSs3x6Dysu7eGv27AJp4h5EOu3gDbWL3YWJm
	aRggbNA6MXcQeLxEnadvAsmYOG0WQdfMAwoipczgagWtGsvYWlReavD6nLVQ2gatMaaqKaPZbGJci
	5RVDcPsA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpVmQ-00000000MTb-3H94
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 16:05:38 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dee27acf7aso49120805ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 09:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711555532; x=1712160332; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTir40frdJeiV9LGmiUfO8UY8kCkwqA6MXq/cDxcl6E=;
        b=ZRZL4Hzm51zVNPp1okL+2TL3ReUWukhjrDglt4OkYTuVmBXYEVvOLzguY0UzAk0++E
         kcvDfSll2EaRdDsKv88DXbHzKATbMkSoPMXJLQWuGfeCcmATrCzN+d6xQSFiC9k5/Q9E
         9yn324I34gBOB5ZtJQKSq5XZTT6nLyW+U++dHTKsxWxe3G4JqWeEj8tsgQmqCNCl1hv2
         DZPr5ZMcE86SqGv05csxTr0dOdZ4GCLAl8Jy42xoyrLMjV3ZI9AZsWT2QhPGdRdBzTyW
         R4RidsRz291zIEqaSjM/L43+kZZmZaYGQ0k7uWazQnCt/ZzdVJxZ5J8t4AIhcuOfAzUZ
         3+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555532; x=1712160332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JTir40frdJeiV9LGmiUfO8UY8kCkwqA6MXq/cDxcl6E=;
        b=sr0QyTkbUSWMWjIjCmWMRjUArNh46zmYWeZ83TZKcjs3TcHSp/N8cKpEQTkOiKiYI9
         5bbJg9cR3SN7Ddx0fW8HuCC2o+0st0RlSpdStf1HTINArzhju1NMMabLCK8zcRP0rQ0x
         8TbwPErGECPi4/RrUmcEoW8SB3EQ691QYIi35akKEWSuVkQLDXIf8VSRrajucscfDHyP
         4PSuFRwOwz7h1KBYWV+cwCLatdt1EbjIrZm/5jrOG5jBPIOmyOoueIp7VzHVUla1W46D
         Wm2OTpcO8Mm11HFGA4EJJVq7BZlml3IOhVeHd0g/hzCP11gDo9okw3/H9C1KOsmZbDuK
         /cFA==
X-Forwarded-Encrypted: i=1; AJvYcCWAmaEHgyj7rGjlO7fZG8zbT9DEZPTmGvEM+CMA/SKr3OUN+5YTK9vwmrqtQtDeTHoPxjObWv1XJIYT6OYslw3DngZ93IZGDuDBKRLy9tKw
X-Gm-Message-State: AOJu0YwRU93PZ3kdNX7eANpZT7y7OLbV4uRiFUl9ULA9N0m1LwjB7tNJ
	FQqIU3Dxa6yGqNPeLH6DEo7O/AyHJBXgRUOewsKFWw5D6XyGxRVwFlOjilqBQAs=
X-Google-Smtp-Source: AGHT+IFccFF2oFHmlsLnwpVDYsHbnzwo+hSZtspn9JVTNBPSJFrTpSFKN5a3C18e5F8g5GCAcVJVZQ==
X-Received: by 2002:a17:902:cecb:b0:1e0:b1af:9b with SMTP id d11-20020a170902cecb00b001e0b1af009bmr86571plg.43.1711555531737;
        Wed, 27 Mar 2024 09:05:31 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id bf4-20020a170902b90400b001e14807f9cesm1718226plb.125.2024.03.27.09.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 09:05:31 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 7/7] riscv: Remove extra variable in patch_text_nosync()
Date: Wed, 27 Mar 2024 09:04:46 -0700
Message-ID: <20240327160520.791322-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327160520.791322-1-samuel.holland@sifive.com>
References: <20240327160520.791322-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_160535_048669_E8643D9F 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

VGhpcyBjYXN0IGlzIHN1cGVyZmx1b3VzLCBhbmQgaXMgaW5jb3JyZWN0IGFueXdheSBpZiBjb21w
cmVzc2VkCmluc3RydWN0aW9ucyBtYXkgYmUgcHJlc2VudC4KClJldmlld2VkLWJ5OiBCasO2cm4g
VMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+ClNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5k
IDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgotLS0KCihubyBjaGFuZ2VzIHNpbmNlIHYxKQoK
IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgfCAxMiArKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9rZXJuZWwvcGF0Y2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMKaW5kZXggY2Zj
Yjk5MjZlNzIyLi45YjhkNjMzZjY1MzYgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Bh
dGNoLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwpAQCAtMTc4LDEzICsxNzgsMTEg
QEAgTk9LUFJPQkVfU1lNQk9MKHBhdGNoX2luc25fc2V0KTsKIAogaW50IHBhdGNoX3RleHRfc2V0
X25vc3luYyh2b2lkICphZGRyLCB1OCBjLCBzaXplX3QgbGVuKQogewotCXUzMiAqdHAgPSBhZGRy
OwogCWludCByZXQ7CiAKLQlyZXQgPSBwYXRjaF9pbnNuX3NldCh0cCwgYywgbGVuKTsKLQorCXJl
dCA9IHBhdGNoX2luc25fc2V0KGFkZHIsIGMsIGxlbik7CiAJaWYgKCFyZXQpCi0JCWZsdXNoX2lj
YWNoZV9yYW5nZSgodWludHB0cl90KXRwLCAodWludHB0cl90KXRwICsgbGVuKTsKKwkJZmx1c2hf
aWNhY2hlX3JhbmdlKCh1aW50cHRyX3QpYWRkciwgKHVpbnRwdHJfdClhZGRyICsgbGVuKTsKIAog
CXJldHVybiByZXQ7CiB9CkBAIC0yMTYsMTMgKzIxNCwxMSBAQCBOT0tQUk9CRV9TWU1CT0wocGF0
Y2hfaW5zbl93cml0ZSk7CiAKIGludCBwYXRjaF90ZXh0X25vc3luYyh2b2lkICphZGRyLCBjb25z
dCB2b2lkICppbnNucywgc2l6ZV90IGxlbikKIHsKLQl1MzIgKnRwID0gYWRkcjsKIAlpbnQgcmV0
OwogCi0JcmV0ID0gcGF0Y2hfaW5zbl93cml0ZSh0cCwgaW5zbnMsIGxlbik7Ci0KKwlyZXQgPSBw
YXRjaF9pbnNuX3dyaXRlKGFkZHIsIGluc25zLCBsZW4pOwogCWlmICghcmV0KQotCQlmbHVzaF9p
Y2FjaGVfcmFuZ2UoKHVpbnRwdHJfdCkgdHAsICh1aW50cHRyX3QpIHRwICsgbGVuKTsKKwkJZmx1
c2hfaWNhY2hlX3JhbmdlKCh1aW50cHRyX3QpYWRkciwgKHVpbnRwdHJfdClhZGRyICsgbGVuKTsK
IAogCXJldHVybiByZXQ7CiB9Ci0tIAoyLjQzLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
