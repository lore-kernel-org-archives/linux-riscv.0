Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0936C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YanSgV4tAc4FW6GqzY5egKo6656djGFHYueCZsgkKo=; b=E06fatFJKckr2x
	ygqOykeyYGvkL6OZtQgiLtps1QBcKgNtUFTdvpjma4sa/6/gGXuj6PeBWTFulbAJYuBa/0IwXHJ8Q
	wjIVHdODs2GBbbuKtWxyumANFyzQDWa0Tig26azh9ltXLZ0Z2XUxtZsgMj7UPwMhuz75h6DIhzhsa
	etHfjxO4W02tRDnTa7y+B3aRCFgTJAjMnQRWxBjrewst61yp1svnkyRbUgWurqvb0ybikn514nsB5
	pkAmG4H/0bF5qQsi+Gox/nA+qZrXGVcpL7t01Nh5nD0RY6YqE9fsH6PCzSQkPFUnd1l2I97N1pQ31
	LvEz23jve/YuVh1XPgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBoM-0000000GvsD-1mjW;
	Fri, 12 Jul 2024 08:39:26 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBoH-0000000GvnW-3HiR
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 08:39:24 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3d9e13ef9aaso1068378b6e.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1720773560; x=1721378360; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PpDCA7CnSWtIO6seFJ4J0hDKtH06inwXMPU5CaySLhw=;
        b=dhzegVHPG3GEvFFoZX/I3A+WBLxXf3THzodUV6bO1JZ6CSsQr+3HZP+20f0oF1XGx6
         wSZ3DkSUyQRO76BkFixCs3deIQetixFCElf9eMT8DLzG1DCu67jr5aFMn2ntamKQWm/t
         kDc6AqSLOHar1zJDGUTJf8laDTxqOdlSB+tbXUj3LTiUnVakBGtkxQ5VKQG851Rm1cAM
         eTPYPLHaVHwn4TTRXUwleWqk4q0fweWtcn0ShCnUIWROI6IgfX+cKRXSwm18l931jkzu
         mv6xUEwGT9DZtGcsNt6f2PX60i8lqny51F0P0CjPlRacU2Fz2fsY/3jeMb4U5RhskjeD
         32Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720773560; x=1721378360;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PpDCA7CnSWtIO6seFJ4J0hDKtH06inwXMPU5CaySLhw=;
        b=eqliGruLTpljvM5/ORnK3hL4EXSj8V69F0YSrS3Jn172lmaHF+3Zr8959oHV4NCy6y
         /pvedlgtBk/2Sdm5mKnR3bJ0rds2DZAZlZP5reiGpJmtPYJzAqszzoz9FhiIVz+94D6s
         5j6fsnAB4gjCKPPELbiKcho9/pLfr2iF7RripXLgajTV/zAt7P2Czqe5tty4x5x2HXRy
         +QbBo/FiisVl/nvFVggz/7/L7y3LP8ijv+nFqpNmLe7dL0M608Ewr3Uh/rwakQK853ds
         5q4ibcZ/9QtiDRjAccA+T19PmWuM5YEi4JnhTqnntBmsf5Ld6uNUlJOqu5DjHK8eptBc
         uRsw==
X-Forwarded-Encrypted: i=1; AJvYcCWTiqcKqqC5PHZJwXnkTsG3AS2O3ZDxjTSHP3+/MKiGSxVreli4OFhgfp4hSYsMDV1KzaF8u5DYRaAYe52p4+v9KAfknFdMw26NwAcnUkBA
X-Gm-Message-State: AOJu0YyxAilNdQzSlrrP3JLpF8Cp411KrmnoL9N/DW1gzUy4qiY9KeY6
	sYwgzF9iMP+ooVf7Cvda7QVvU+EzI//KaSNGd3JVckr7c3Jn1Y9V9LuLXvOLZ54=
X-Google-Smtp-Source: AGHT+IHmBxrEAG3WPd6oj+/586lglgYzxY+9BouYb6jIFT5EHBZDlB4+cb5Y4B3ynyNiUyxupNCiwQ==
X-Received: by 2002:a05:6808:1982:b0:3da:a6ce:f017 with SMTP id 5614622812f47-3daa6cef5a9mr3909532b6e.46.1720773560484;
        Fri, 12 Jul 2024 01:39:20 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c7099sm6894194b3a.84.2024.07.12.01.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:39:20 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 4/4] KVM: riscv: selftests: Add Svade and Svadu Extension to get-reg-list test
Date: Fri, 12 Jul 2024 16:38:48 +0800
Message-Id: <20240712083850.4242-5-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240712083850.4242-1-yongxuan.wang@sifive.com>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_013922_122059_20BF2E93 
X-CRM114-Status: UNSURE (   8.27  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Update the get-reg-list test to test the Svade and Svadu Extensions are
available for guest OS.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 222198dd6d04..1d32351ad55e 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -45,6 +45,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSAIA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSCOFPMF:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVADU:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
@@ -411,6 +413,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(SSAIA),
 		KVM_ISA_EXT_ARR(SSCOFPMF),
 		KVM_ISA_EXT_ARR(SSTC),
+		KVM_ISA_EXT_ARR(SVADE),
+		KVM_ISA_EXT_ARR(SVADU),
 		KVM_ISA_EXT_ARR(SVINVAL),
 		KVM_ISA_EXT_ARR(SVNAPOT),
 		KVM_ISA_EXT_ARR(SVPBMT),
@@ -935,6 +939,8 @@ KVM_ISA_EXT_SIMPLE_CONFIG(h, H);
 KVM_ISA_EXT_SUBLIST_CONFIG(smstateen, SMSTATEEN);
 KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
 KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
+KVM_ISA_EXT_SIMPLE_CONFIG(svade, SVADE);
+KVM_ISA_EXT_SIMPLE_CONFIG(svadu, SVADU);
 KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
 KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
 KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
@@ -991,6 +997,8 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_smstateen,
 	&config_sscofpmf,
 	&config_sstc,
+	&config_svade,
+	&config_svadu,
 	&config_svinval,
 	&config_svnapot,
 	&config_svpbmt,
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
