Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A00C4345F
	for <linux-riscv@archiver.kernel.org>; Sat,  4 May 2024 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SRzNM8SdlMaOB7xiL6Irueqo6zimGM1jdshB19y39bA=; b=x8PP1/l+qQOqkM
	Tn+p9vHJkCFZxlE5gTZkHyMT3a9qXkn9wG6Wb26XdCyhTLQbQAE2ifeKZIBj3AHM6sg/vgxU2Xcc7
	RSh7zoJDiJmbvn1+ynRJy3khVUEJtL9gyw9mey57tbBIW3KIEJuq+5xXwpn8PRaKkPzezI9I+5ChH
	Gyrq3MOlSXvJ4N+BzEJBcz0YQE1creHc4RuaTrvRfU2egZbrcrJV1DosvQ1GulkNOGcW43wPunkBe
	Yi3w140eghxuE+EFBgdQykpMtmBk6ENzHpdd0yWWgzF1AYMx85bCY4s61o6xXlnAywh21V1JCqI/Y
	Jb2x1pxDIOyw7I86x59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3L9w-00000002jJW-1AXV;
	Sat, 04 May 2024 19:35:00 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3L9s-00000002jIF-0gKE
	for linux-riscv@lists.infradead.org;
	Sat, 04 May 2024 19:34:57 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D933D3F270
	for <linux-riscv@lists.infradead.org>; Sat,  4 May 2024 19:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1714851294;
	bh=oOLIaUL1ksCYikVh+tjyK0yztXrep94eIS+0vADjCFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=nWYmfSpstEpb6gXasL1OcKvQN2WddkBbMMjRglv3T1Wl0GeuakSjmAELTTcyi2egr
	 akIrin3G4Use7ANU8v+YgzLEUxjxG0LKZsmEkNpGcrd5cMAfhXrkyL8gxtShyZ0Ngv
	 q8fhQKlFL3dfOJhKEC3n4cnOiWIQsUs9J0GZW6tSPRoqp0msAvFXNHFt0XYcQE1f6N
	 btFtw0HRFed8Cn87gpUsuTD5WCntAlCefdEZ5vh1t6F+DMsu3HdlrqB7lmCcSs5DCc
	 2YtnNui3jgWZekfBUe9N92kxn9hxkidKk+JsaBsqfDWlz6ahftundeSx0V199GTDZy
	 +NPyHSm6Adtcw==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a58d2d13937so15272266b.0
        for <linux-riscv@lists.infradead.org>; Sat, 04 May 2024 12:34:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714851291; x=1715456091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oOLIaUL1ksCYikVh+tjyK0yztXrep94eIS+0vADjCFU=;
        b=R9wwzdVssqiTsOyWn85Lng6vL4X+YQzTwrJ3z77rv7uExj984BrwOVKEaoGkbv/K7D
         MfzabgRkALcgtFFIFXIaaMSWJAJeMNSjMe4vikZxD872ZzH9kr0y5Q6gZwoZixG48Q82
         gbcY1/kBbd6H71rY3dY1yAaQe+sRin/Bu5PnT3BhtDvyP5Bxxq+xkPojH3lRvsKVXRzc
         9xXLcm4i+os38LpwWzKRHOXY7H5eI+PehfHnLtgWf8WtrDzrhzfFqgluR6Oh8WS6q+7/
         NdRNy7ikxJ1gFvs1SFWvILD5vqGRHah6YDxpmQWC0bR21/B0AU24/rdXtgSqQhHa5X3l
         k57w==
X-Gm-Message-State: AOJu0Yy6bR8PSQ53GuvGrcAmVB84iOUB04Uzx/wv+1i/rl2uE11RXPYK
	XuKNphAR5GVYsLxeelyuGosOuhJt1+8AWxXAQvbJ0k1SAF2mYjbXxL2OIqvYtBFH26LLR51NF0x
	eiwzTnPvUW8rfomJGjwQylk3LGKXr+Q57k8hsA/2FAmOT2BSaLx1tbSJXl6F/KTpmQM2RRfyIAp
	Rz5P7CGe3UjGf+Yg==
X-Received: by 2002:a50:a693:0:b0:56e:2cb6:480e with SMTP id e19-20020a50a693000000b0056e2cb6480emr5037843edc.38.1714851291518;
        Sat, 04 May 2024 12:34:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSxa0bKw9XZSPRzRQBk5sICnCx31i0zneLUhKIf2Xqa/AxILKx9IuvkMH2j2eNM0zWghhKyQ==
X-Received: by 2002:a50:a693:0:b0:56e:2cb6:480e with SMTP id e19-20020a50a693000000b0056e2cb6480emr5037835edc.38.1714851291333;
        Sat, 04 May 2024 12:34:51 -0700 (PDT)
Received: from stitch.. ([80.71.142.166])
        by smtp.gmail.com with ESMTPSA id et4-20020a056402378400b00572d255e342sm2227021edb.10.2024.05.04.12.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 12:34:50 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Nick Terrell <terrelln@fb.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Subject: [PATCH v2 2/2] riscv: show help string for riscv-specific targets
Date: Sat,  4 May 2024 21:34:39 +0200
Message-ID: <20240504193446.196886-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
References: <20240504193446.196886-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240504_123456_361784_5868163D 
X-CRM114-Status: UNSURE (   8.86  )
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

RGVmaW5lIHRoZSBhcmNoaGVscCB2YXJpYWJsZSBzbyB0aGF0ICdtYWtlIEFDUkg9cmlzY3YgaGVs
cCcgd2lsbCBzaG93CnRoZSB0YXJnZXRzIHNwZWNpZmljIHRvIGJ1aWxkaW5nIGEgUklTQy1WIGtl
cm5lbCBsaWtlIG90aGVyCmFyY2hpdGVjdHVyZXMuCgpUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQHJpdm9zaW5jLmNvbT4KU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcg
PGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Ci0tLQogYXJjaC9yaXNjdi9NYWtl
ZmlsZSB8IDE3ICsrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0aW9u
cygrKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvTWFrZWZpbGUgYi9hcmNoL3Jpc2N2L01ha2Vm
aWxlCmluZGV4IDA3ZmYyZjM0ZjBkYy4uYWU1MTcyMDE5OWEzIDEwMDY0NAotLS0gYS9hcmNoL3Jp
c2N2L01ha2VmaWxlCisrKyBiL2FyY2gvcmlzY3YvTWFrZWZpbGUKQEAgLTIwMSwzICsyMDEsMjAg
QEAgcnYzMl9kZWZjb25maWc6CiBQSE9OWSArPSBydjMyX25vbW11X3ZpcnRfZGVmY29uZmlnCiBy
djMyX25vbW11X3ZpcnRfZGVmY29uZmlnOgogCSQoUSkkKE1BS0UpIC1mICQoc3JjdHJlZSkvTWFr
ZWZpbGUgbm9tbXVfdmlydF9kZWZjb25maWcgMzItYml0LmNvbmZpZworCitkZWZpbmUgYXJjaGhl
bHAKKyAgZWNobyAgJyAgSW1hZ2UJCS0gVW5jb21wcmVzc2VkIGtlcm5lbCBpbWFnZSAoYXJjaC9y
aXNjdi9ib290L0ltYWdlKScKKyAgZWNobyAgJyAgSW1hZ2UuZ3oJLSBDb21wcmVzc2VkIGtlcm5l
bCBpbWFnZSAoYXJjaC9yaXNjdi9ib290L0ltYWdlLmd6KScKKyAgZWNobyAgJyAgSW1hZ2UuYnoy
CS0gQ29tcHJlc3NlZCBrZXJuZWwgaW1hZ2UgKGFyY2gvcmlzY3YvYm9vdC9JbWFnZS5iejIpJwor
ICBlY2hvICAnICBJbWFnZS5sejQJLSBDb21wcmVzc2VkIGtlcm5lbCBpbWFnZSAoYXJjaC9yaXNj
di9ib290L0ltYWdlLmx6NCknCisgIGVjaG8gICcgIEltYWdlLmx6bWEJLSBDb21wcmVzc2VkIGtl
cm5lbCBpbWFnZSAoYXJjaC9yaXNjdi9ib290L0ltYWdlLmx6bWEpJworICBlY2hvICAnICBJbWFn
ZS5sem8JLSBDb21wcmVzc2VkIGtlcm5lbCBpbWFnZSAoYXJjaC9yaXNjdi9ib290L0ltYWdlLmx6
byknCisgIGVjaG8gICcgIEltYWdlLnpzdAktIENvbXByZXNzZWQga2VybmVsIGltYWdlIChhcmNo
L3Jpc2N2L2Jvb3QvSW1hZ2UuenN0KScKKyAgZWNobyAgJyAgdm1saW51ei5lZmkJLSBDb21wcmVz
c2VkIEVGSSBrZXJuZWwgaW1hZ2UgKGFyY2gvcmlzY3YvYm9vdC92bWxpbnV6LmVmaSknCisgIGVj
aG8gICcJCSAgRGVmYXVsdCB3aGVuIENPTkZJR19FRklfWkJPT1Q9eScKKyAgZWNobyAgJyAgeGlw
SW1hZ2UJLSBFeGVjdXRlLWluLXBsYWNlIGtlcm5lbCBpbWFnZSAoYXJjaC9yaXNjdi9ib290L3hp
cEltYWdlKScKKyAgZWNobyAgJwkJICBEZWZhdWx0IHdoZW4gQ09ORklHX1hJUF9LRVJORUw9eScK
KyAgZWNobyAgJyAgaW5zdGFsbAktIEluc3RhbGwga2VybmVsIHVzaW5nICh5b3VyKSB+L2Jpbi8k
KElOU1RBTExLRVJORUwpIG9yJworICBlY2hvICAnCQkgIChkaXN0cmlidXRpb24pIC9zYmluLyQo
SU5TVEFMTEtFUk5FTCkgb3IgaW5zdGFsbCB0byAnCisgIGVjaG8gICcJCSAgJCQoSU5TVEFMTF9Q
QVRIKScKK2VuZGVmCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
