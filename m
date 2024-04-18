Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C01FC4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSEbjcsdMk7wjlnOXhArkT3nv6XunSGXnHSgkJ9Bu0o=; b=wqtkWCGe76WeCQ
	JtXXXdrYxAormveKC+bpeyfJa4ldqyMCq0opLHf5qDEh0SfSGfqczRHJ0X+UdcOloCh+6hD5Gwhd6
	qA+tyQC/lkg8SJ/BmoX4m5s4WUECkq7YWGlKYpG5LrNJ+2uMywXGUfJeZD452y1+N1k3yDJfSX9cj
	Z3q6xG/Lc9xP02HBLKKYk03+eZaF7JAJvRs5Szrcp1Uvfzi4SkDT0sqdy81o+AA4Z9C1Q+pUVs7Q5
	LeSBcQYG/LyasHPpTVA8JoL65nFNNNGSuAnoLoJ5fUuL24quuifezBGnY2m94DXpGHiKf+OH/A/Jr
	QivoV13tY12nA6pD2sgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR8V-00000002DNu-1L79;
	Thu, 18 Apr 2024 12:45:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxR7a-00000002Caq-3wFm
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 12:44:13 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-349a31b2babso94944f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713444249; x=1714049049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=pNC+lqG3JmePw6erqOzK6elephyHAYFEBBPYROdqPiRkUZzCwudIldHUXxbhKwmPca
         gQ6Z3A6H5fT9WjSV5cWp2BErND322j+4F9wFXvnx/3SZ8w/l8BdmbtuENhh7vHV0tHcf
         Zxd+I6+zJnHxiUGENdLABNSU5NPAzCMjwb3qb/SeVav9wiMNH2lLeyVv/xW5ddfYimDR
         mGjx4EkKIP3vtw1uHWzU4aqE0AK/IBXthYo/fKx6Do0wcv6uSKetKw7l7ZDUR97uGpX1
         rPJn2z+ZLW8WjOqS6XARZ54QSH8L7KYAmfEii6Yfa49VRScVlGjkZtUOvURwMGJrFOLD
         sbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713444249; x=1714049049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKIlCd7jL5ol5qvLgWGPfJLjgIu96MFC3958FRvJI8w=;
        b=EjmNBhej5zXd6Og53hH3N+XkQCCKIbwnik2ERJTqr70m/Iz9a0lzCfcH3hXkPL3pMI
         0pPqM4x+JQLbIu8wmv0u1U2fUZsWyvncPY5F+eBqXdBhRf5+ZTonF9Zh1OqEI6XzZGjP
         PdkkcqzO4JjIIyMZ4Gl1DOGcatV7VMxT4Yu5BK4b1G68y2iFabGsC8YzQfXRLYB5+Nmy
         feMCMQQjaKJGCqUiF6KfrC3B20i5P4jSXu1cY6LovtCUJMHiNIXc9qBmk01zmVjsB57j
         4R3VQUueuEk3t4NHwVb4W878uJDtFQsp6SKCdksxRIVZQfkhpccolATCx2zr/M5/3hM3
         eaNA==
X-Forwarded-Encrypted: i=1; AJvYcCVtd7Fo8FC2+eaPO60XRpzpFaUyoAgG2WKdL5PumXVEHyHRdelZvVmWozLQ+HFiMOYneE/OAMAkkzB4f256KDev4rkiM1gVVqjGgLvUm2//
X-Gm-Message-State: AOJu0YwMDnaB5aTiVi12sVDG5FbpMOVILPma0rdmCLDNzB9K63+Y2SFT
	nsreobNaY65kVrs7P5xKd36j6ADT7mjUyTtxoCj6TFKoimLxZPkAI3Nt4yROsVc=
X-Google-Smtp-Source: AGHT+IEuz3T/wADyuU6lhNByO66nc3HwRSSRfc4RI/wUE1r6vwDm0YQy96IvGIrIEPLWf2aV5baVXg==
X-Received: by 2002:a05:600c:47cf:b0:418:f991:70ff with SMTP id l15-20020a05600c47cf00b00418f99170ffmr135350wmo.1.1713444249424;
        Thu, 18 Apr 2024 05:44:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7b64:4d1d:16d8:e38b])
        by smtp.gmail.com with ESMTPSA id bi18-20020a05600c3d9200b00418d5b16fa2sm3373412wmb.30.2024.04.18.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 05:44:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Shuah Khan <shuah@kernel.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Atish Patra <atishp@atishpatra.org>,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v2 12/12] KVM: riscv: selftests: Add Zcmop extension to get-reg-list test
Date: Thu, 18 Apr 2024 14:42:35 +0200
Message-ID: <20240418124300.1387978-13-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_054411_464529_28615DDE 
X-CRM114-Status: UNSURE (   9.24  )
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

VGhlIEtWTSBSSVNDLVYgYWxsb3dzIFpjbW9wIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0gc28gYWRk
IHRoaXMKZXh0ZW5zaW9uIHRvIGdldC1yZWctbGlzdCB0ZXN0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyB8IDQgKysrKwogMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNj
di9nZXQtcmVnLWxpc3QuYwppbmRleCA2MWNhZDQ1MTQxOTcuLjk2MDRjOGVjZTc4NyAxMDA2NDQK
LS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL3Jpc2N2L2dldC1yZWctbGlzdC5jCisr
KyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwpAQCAt
NTksNiArNTksNyBAQCBib29sIGZpbHRlcl9yZWcoX191NjQgcmVnKQogCWNhc2UgS1ZNX1JFR19S
SVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9F
WFRfWkNCOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0Ff
U0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNEOgogCWNhc2UgS1ZNX1JFR19SSVNDVl9JU0Ff
RVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWkNGOgor
CWNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JFR19SSVNDVl9JU0FfU0lOR0xFIHwg
S1ZNX1JJU0NWX0lTQV9FWFRfWkNNT1A6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBL
Vk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkE6CiAJY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJU0NWX0lTQV9TSU5HTEUgfCBLVk1fUklT
Q1ZfSVNBX0VYVF9aRkg6CiAJY2FzZSBLVk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUkVHX1JJ
U0NWX0lTQV9TSU5HTEUgfCBLVk1fUklTQ1ZfSVNBX0VYVF9aRkhNSU46CkBAIC00MjksNiArNDMw
LDcgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmlzYV9leHRfc2luZ2xlX2lkX3RvX3N0cihfX3U2NCBy
ZWdfb2ZmKQogCQlLVk1fSVNBX0VYVF9BUlIoWkNCKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpDRCks
CiAJCUtWTV9JU0FfRVhUX0FSUihaQ0YpLAorCQlLVk1fSVNBX0VYVF9BUlIoWkNNT1ApLAogCQlL
Vk1fSVNBX0VYVF9BUlIoWkZBKSwKIAkJS1ZNX0lTQV9FWFRfQVJSKFpGSCksCiAJCUtWTV9JU0Ff
RVhUX0FSUihaRkhNSU4pLApAQCAtOTU3LDYgKzk1OSw3IEBAIEtWTV9JU0FfRVhUX1NJTVBMRV9D
T05GSUcoemNhLCBaQ0EpLAogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y2IsIFpDQiksCiBL
Vk1fSVNBX0VYVF9TSU1QTEVfQ09ORklHKHpjZCwgWkNEKSwKIEtWTV9JU0FfRVhUX1NJTVBMRV9D
T05GSUcoemNmLCBaQ0YpLAorS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6Y21vcCwgWkNNT1Ap
OwogS1ZNX0lTQV9FWFRfU0lNUExFX0NPTkZJRyh6ZmEsIFpGQSk7CiBLVk1fSVNBX0VYVF9TSU1Q
TEVfQ09ORklHKHpmaCwgWkZIKTsKIEtWTV9JU0FfRVhUX1NJTVBMRV9DT05GSUcoemZobWluLCBa
RkhNSU4pOwpAQCAtMTAxNyw2ICsxMDIwLDcgQEAgc3RydWN0IHZjcHVfcmVnX2xpc3QgKnZjcHVf
Y29uZmlnc1tdID0gewogCSZjb25maWdfemNiLAogCSZjb25maWdfemNkLAogCSZjb25maWdfemNm
LAorCSZjb25maWdfemNtb3AsCiAJJmNvbmZpZ196ZmEsCiAJJmNvbmZpZ196ZmgsCiAJJmNvbmZp
Z196ZmhtaW4sCi0tIAoyLjQzLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
