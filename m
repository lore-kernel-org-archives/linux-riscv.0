Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E0DC48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 12:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WlKPbVe1Xnq6py6VTJQeH7pGqr8FCWrFTr/sAiJrYR8=; b=dDwbFs+l5RB5xo
	BmbvrrEe/4KiRMSi+tM10Ip3dVMRCfKYw5X5CSmCSvqWWA6UML665bb+tGPdqih4v8syCYZcM+DKg
	4b2ML2HIDlC1HZlFtmcoZN9EXa7+qRB7tCxkXK0TF6uQTbslvEmpZNvcAyoo1wjjaHtxGccCyEQC3
	uvylSpMrpc8qb5Y3w3cFEW0Wh7owNjBxxAjJROfbFdXTsplhHyio58x3BiCO+1miYSqw2Q2oeenAY
	CrTAfay4znBPJ3TUyL6mweXjRITvmDA7+82hKWeuUgE80oDnCaZkUA6wWmPzab3NazgYVwoK+pbDg
	x7DAGwEM/q9/GWlcvBMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWv-0000000CrDg-1ces;
	Wed, 14 Feb 2024 12:38:25 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raEWs-0000000Cr9k-0MhO
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 12:38:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e0ac91e1e9so2605951b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 04:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707914299; x=1708519099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtRzUtn5YlgGEqGNmE5oViuKGD26HTcJD0Q89ujSctY=;
        b=o9tlS4kj7cg/+VWE1YzPnzkRA5L3uQkoDFQs+HMBzGpFTehXpkVoDzauZlpvsYgAJ7
         8RTSKhrsoytQHd4o1LmgqIq/InVaCsnWB4uCV9iRje/BSQ7+RPzsCwhNlBbI8iBbMgBB
         UhuuSlZI/gXf+bJIq71wRW3ofkg2uxRhM3UhKC61UvVWVCJigOUpz+1WVroOJCBOxqnR
         rlb7nxlZQL2+jq0H1vrkStqFgET7tsRCcY7Lq6JYhM7kSvcbS2mx7MaHECJUzFqWG4Zc
         hjWDu9E3bj88Lm+25tEAVnjHL/2O6c+gJPCT3qtKlcvIoWFBXpRIS5w+hROvbBT17prw
         7IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707914299; x=1708519099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CtRzUtn5YlgGEqGNmE5oViuKGD26HTcJD0Q89ujSctY=;
        b=vLOr4JsHA0lYGcfhfl85rro6s4bRKD4raiIMCaPywZn+68dtiAFReDkm+y2PCkxzIM
         3P0TclcmoJ+l6WIQBN5/zoILfCFF/2s1qlf1MToFjEKUWQCnXICrwgElbGv7slnMk7L7
         iS3QzeOoGUS3DxEiF8Yy/BoHEPc2zryfu7IJdI9fQeH6ai24khjTntqMzVNahu9FWoeu
         Dsn/7/ChzvBguaQjk5Vdu+NHBTM7+DEIqKkZIz2MI0ZvGpkO3/D6ChdeiVqoP1sSqzZ3
         VzltMBGVKGilN2duwZTrPKnFoR7Z+gZNeWjVr1tJRQl2A6AK0D4PLlnsh0Re4YmuHRDW
         SvXA==
X-Forwarded-Encrypted: i=1; AJvYcCXn2KsU883vRgCNY7s3eAhCPGNP+jk91LCOr4uUXUZ0AcYbyA2/8xocwug9XxA5C1jO95oGfbV9blkBbR4KrG41DeD6TgISimJpAE8Q+NSg
X-Gm-Message-State: AOJu0Yw3uOl2U7qLphDKUG+pRZlhEFpCCg/yAMxpvNFPkD36ENOmLY0k
	NpaYcF7y25JkzX27uK7iJXa3DoFpsDhAzs/uecppdSMp8qddR22MAzUkIRb6Q5g=
X-Google-Smtp-Source: AGHT+IGCWZ5G/G3vbyNMBfek5NVGYdPpcnCAN0KmPun1zKGXih4KLFfWufmz/OYQLaOucpICouOPBA==
X-Received: by 2002:a05:6a21:1644:b0:19e:cf31:6a04 with SMTP id no4-20020a056a21164400b0019ecf316a04mr2855300pzb.59.1707914299363;
        Wed, 14 Feb 2024 04:38:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrXT4KToL9IgoHVlEatzhhCjqaY+aDf2dj3WXtREaMV4mVz7xD/BsynLgPAcDs1YDjmE60t4dut/SjiWkhbTvOevleB2YNKNZYIS19SAmNlE2hgyLgJhuLzf4qm1iogqAQxnKViApc+lYzuksXCv1knBeeRikj8YvcIXPoBUqJwAQzDYBhZwDXGkF5pQvyOMUj5qPsY2GGzZ81gTzJ6hteOMyADmeptjvymrVt6NED+ZuDq9a1Ks+rj8snJcamLctx8azbCwuMgKAr3SrDpJAGu1O411FkkvGCSFbB3bsz6Q6CTd8Oxqd4gaX7coarmV/Ix2htiWKpjx3EXVWnO3m+jbPNad0iid8txVbAZu/3P31wCiAi8REn65ISTwSDmI6/XM7mgZ/a3fDMXFQc8buJ4+f0iw4Z+H0YQ3JZ1IWCooM3JsOmzkeOv1Ny6A==
Received: from anup-ubuntu-vm.localdomain ([171.76.87.178])
        by smtp.gmail.com with ESMTPSA id o20-20020a170902e29400b001d9b749d281sm3041419plc.53.2024.02.14.04.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 04:38:18 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 3/5] KVM: riscv: selftests: Add Ztso extension to get-reg-list test
Date: Wed, 14 Feb 2024 18:07:55 +0530
Message-Id: <20240214123757.305347-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214123757.305347-1-apatel@ventanamicro.com>
References: <20240214123757.305347-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_043822_165379_0019DA8C 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The KVM RISC-V allows Ztso extension for Guest/VM so let us
add this extension to get-reg-list test.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 9d9c50b68207..5429453561d7 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -73,6 +73,7 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSED:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKSH:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZKT:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZTSO:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVBC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZVFH:
@@ -436,6 +437,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZKSED),
 		KVM_ISA_EXT_ARR(ZKSH),
 		KVM_ISA_EXT_ARR(ZKT),
+		KVM_ISA_EXT_ARR(ZTSO),
 		KVM_ISA_EXT_ARR(ZVBB),
 		KVM_ISA_EXT_ARR(ZVBC),
 		KVM_ISA_EXT_ARR(ZVFH),
@@ -957,6 +959,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zkr, ZKR);
 KVM_ISA_EXT_SIMPLE_CONFIG(zksed, ZKSED);
 KVM_ISA_EXT_SIMPLE_CONFIG(zksh, ZKSH);
 KVM_ISA_EXT_SIMPLE_CONFIG(zkt, ZKT);
+KVM_ISA_EXT_SIMPLE_CONFIG(ztso, ZTSO);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvbb, ZVBB);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvbc, ZVBC);
 KVM_ISA_EXT_SIMPLE_CONFIG(zvfh, ZVFH);
@@ -1010,6 +1013,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
 	&config_zksed,
 	&config_zksh,
 	&config_zkt,
+	&config_ztso,
 	&config_zvbb,
 	&config_zvbc,
 	&config_zvfh,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
