Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBEDCCD1284
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xnValF1m7B4kte7A6AdFCcqAyy9NEQIkGNiv8OSYHHg=; b=DRT5EOZ4j5TxDp
	i/9b4uUWRmNPzPxbggBEWTEyk93ojP3C/4aGd+8C2Oyh1L/PVLPyvV16AAk9SY3jfrXOD05TbngRF
	mvmNPhwYIhwwj2mVHgJUzjeu3KdkMMImmylgJPDalZB4AjBXuVVCUXjmLrUu1mtvno6WqO4xpUwdm
	v/Dbvm6GCWjFVsZc/gIZkW5YfFoaxUSMcDIPJzE5mwga9YG90mA7twCi4pWZLk3UvqtyccuCIxwv3
	VsMJKsTmAaEGPzU50JCd3P+d4dQgU1BGSreG6lJmu+30sV049haPdBCbcPWGJTem6z0A4rQvOgPPv
	zEavCfdRplC99bieZgQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCdd-00000002SgA-45Ta;
	Tue, 09 Apr 2024 14:40:13 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruCdT-00000002SbQ-47d2
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 14:39:52 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-346407b8c9aso157940f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712673581; x=1713278381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9/nrLk0Oz3ZkCeLo4hEqjMq5lF9FFuOkhf5GrC8XZU=;
        b=RcFJmNDMzFiBvQsW+wQr1eAl/SVa1eWSXRd39uUrubByoIv3Hgd/BOMw2caqjKu3Za
         bb/AKrXvb0QGLoKEAzLWFStAc0Vo+VH0B0T2DSGB0L814TQyDJWfJ/eFt5VBecj5uANH
         bk2Z7gKoRwbON8j69FXTx0ky72eRFY6PGZY472ZC4eb+pMU+FHY51GjqsCVICRklHqHn
         kMRZHsbcE+yVlRS7gcH7/jQVAJCNaisYr6LgBO3AC9eiYgkoP5p8RKgcxpf9XkUh9Voc
         siTG3VDEk3xB0Aex9Eykdvo8hkwkIKq9eF+fqgVjfYOCzX4qJcAiBvw1zJ9OEpnBSztW
         3AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712673581; x=1713278381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/9/nrLk0Oz3ZkCeLo4hEqjMq5lF9FFuOkhf5GrC8XZU=;
        b=mSTd8I1Uq6lQRbQwtj4HtO/uAj2EsKFtrGMKHTRaMkrz5OZLKVhHKBrx1xwpxnEKAv
         sN3GPncYRalmsgcwf8DLj32aS6xPfJssWRU4Xv/MaznMoV7h9+v1J/OQ98+HY7K5o4Xj
         MV722MXk/5adFzqx0prr5ZrKqCV5vKs7KBBSO1SZvldlVGTAbFUbi5LuKOSZ4H78U9bY
         p54Anv97q5iKVsI1M+I+NPBmoRz4FU2yGRWylmWwwzdOQSWaPB6zNepBXX5bTidDUksf
         m00AIzT3QpC9VkUxZmMVNtxpu0q35LVyGV+AUhw/jt7ogPTPe0rZdPHu0/EHQ0IYO9UQ
         kpcw==
X-Gm-Message-State: AOJu0YxGCLLsCRLiyErJZ5F8pOMNow8wd9Ivw1sb6SFAVfzV6wToGaeK
	/MdyDpDvaBdNAG9DT17sEAcbwK41LmWWVSwi7GftNLUGGgYNCL7PysKhn0RgXoKwmBY5Pu01jSf
	j3kM=
X-Google-Smtp-Source: AGHT+IH9Po4S7zSdF+PAgblHA4vhd4X35mwBM0ndJYesLaZ8jMkEdvD3pz+xcLzEWjeQdxEpDh/97w==
X-Received: by 2002:a05:600c:5103:b0:416:b4c9:db2e with SMTP id o3-20020a05600c510300b00416b4c9db2emr913040wms.3.1712673581264;
        Tue, 09 Apr 2024 07:39:41 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:322c:7eda:35fd:4614])
        by smtp.gmail.com with ESMTPSA id p12-20020a5d638c000000b003432ffc3aeasm11594008wru.56.2024.04.09.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:39:40 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH riscv/fixes] riscv: hwprobe: fix invalid sign extension for RISCV_HWPROBE_EXT_ZVFHMIN
Date: Tue,  9 Apr 2024 16:38:37 +0200
Message-ID: <20240409143839.558784-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_073949_059248_1D67AB45 
X-CRM114-Status: UNSURE (   9.67  )
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

VGhlIGN1cnJlbnQgZGVmaW5pdGlvbiB5aWVsZHMgYSBuZWdhdGl2ZSAzMmJpdHMgc2lnbmVkIHZh
bHVlIHdoaWNoCnJlc3VsdCBpbiBhIG1hc2sgd2l0aCBpcyBvYnZpb3VzbHkgaW5jb3JyZWN0LiBS
ZXBsYWNlIGl0IGJ5IHVzaW5nIGEKMVVMTCBiaXQgc2hpZnQgdmFsdWUgdG8gb2J0YWluIGEgc2lu
Z2xlIHNldCBiaXQgbWFzay4KCkZpeGVzOiA1ZGFkZGE1ZTZhNTkgKCJyaXNjdjogaHdwcm9iZTog
ZXhwb3J0IFp2ZmhbbWluXSBJU0EgZXh0ZW5zaW9ucyIpClNpZ25lZC1vZmYtYnk6IENsw6ltZW50
IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KLS0tCiBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vaHdwcm9iZS5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od3Byb2JlLmgKaW5kZXggOWYy
YThlM2ZmMjA0Li4yOTAyZjY4ZGM5MTMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJv
YmUuaApAQCAtNTQsNyArNTQsNyBAQCBzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSB7CiAjZGVmaW5lCQlS
SVNDVl9IV1BST0JFX0VYVF9aRkhNSU4JKDEgPDwgMjgpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JF
X0VYVF9aSUhJTlROVEwJKDEgPDwgMjkpCiAjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkZI
CQkoMSA8PCAzMCkKLSNkZWZpbmUJCVJJU0NWX0hXUFJPQkVfRVhUX1pWRkhNSU4JKDEgPDwgMzEp
CisjZGVmaW5lCQlSSVNDVl9IV1BST0JFX0VYVF9aVkZITUlOCSgxVUxMIDw8IDMxKQogI2RlZmlu
ZQkJUklTQ1ZfSFdQUk9CRV9FWFRfWkZBCQkoMVVMTCA8PCAzMikKICNkZWZpbmUJCVJJU0NWX0hX
UFJPQkVfRVhUX1pUU08JCSgxVUxMIDw8IDMzKQogI2RlZmluZQkJUklTQ1ZfSFdQUk9CRV9FWFRf
WkFDQVMJCSgxVUxMIDw8IDM0KQotLSAKMi40My4wCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
