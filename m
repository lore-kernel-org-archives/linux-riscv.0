Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157F3C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Mar 2022 05:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GacnYM2RZWKpBtrKrhSlS7AknyGLQ9Og6Y6XlA7YgCc=; b=VBV3yw4TmN0ope
	WgugdZtBiKYVxIu5mzBKbzoCq6Ehin2e0mdi8qiNrLc8tPm7a2QjbXw0Ytg1mAZ0z7fZlp6RdZzah
	srS/eIMwBp8o4I/opoXh+FUM+31jMQ7SUPDx9kcrk6TJs22zvUOmZsuLPDG9J6EQaE4REp2LmFMV1
	/HGUuU2q+IE3G3O0NASGfpdQ7Y5kFsMYaGXdDiIqgKPb36IHXb/JRAp8MLgQbXgPaqgh6ljnoD4qX
	cftUDG6O90xNDORuA369db5WqQLpxNZ4qpiZsHj52p+RqEhwMVS8Pa1V7n1Lhvg51jsnUpzs37Ihs
	SNzZCuBvt1SgakKQ+d8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXG4E-00Fdjb-9b; Thu, 24 Mar 2022 05:31:26 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXG4C-00Fdii-5e
 for linux-riscv@lists.infradead.org; Thu, 24 Mar 2022 05:31:25 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 o3-20020a17090a3d4300b001c6bc749227so4072062pjf.1
 for <linux-riscv@lists.infradead.org>; Wed, 23 Mar 2022 22:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QipneOKTQA94tj99xDqNJKu1O2H8ssVgZVHFopSbC+M=;
 b=C5mGlEIKX4AWJlHVpauTVvB1V3nbesh9rYgkVht4cmoudIeXr83jAVOCcnuKjdxCj3
 ll6uI1LWyqz3e65iD7SYEM8zrl5aYpvlCJ6TGQwUXDcbAAoidQNq5iTUKrs8n0g67oaw
 Plp3VhPSPaz/Za9aKPahuqpkO327MUBmFDn9gaHk7o2EmdtCcHLG47R7o11CLVeV+0Lz
 UdXdh7WdHp0vZI07iDNxk4lqGsgOWSKxBkYf/vGfvVaEmj5jOkRMy+OC8/a8J5qAw09p
 ifCLQBeNwtED603uCRuD1ackl/Jnt9fzxJJBw9Artkzm7vuiTc5Sob1SXiHu5bHfDpuG
 8ksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QipneOKTQA94tj99xDqNJKu1O2H8ssVgZVHFopSbC+M=;
 b=pNzgIRED1rACnPVVKRvAbNkaKrloaRAwzAzdp5uL15sShI78rzLvYC+zTuDKO619ag
 g+1pQ6M35HomiWI3IIFkepZAFDeF6dhNfvAEq1k2ojrCzCwlIODhc2PIrd8XvyDLgPU8
 ay7f5Nlag63mdmVYwt6A5iueQ0q0q90oeswLbxaOOWdVe0bNkh0tCgKkowU36fv1dBw6
 TUXxB2ceBf8bg/CsyPBtbf0e1bvESSY+5Hfprnw2cMSs7oFKYMguC5jTrdwrhgO7KqEp
 CMdEm02YwnapfIVR7x1pi0nsCyndAt4P0tywC0ivpqXJVH6EvV30MoRGEuaH9QqPYXfi
 me6w==
X-Gm-Message-State: AOAM533/pGRX9kiiq5A+EOFoTaMMlYGPvBEKffpeQkQAsC7UPi1Bv780
 bS3QROMRH3w0G7p2VQ3J3NybKA==
X-Google-Smtp-Source: ABdhPJzJ23XG52EA/bmvEIHgik5fGswJ/31WIMHu5gBxwc/4KUviZwOOxTxAZQRkGfjJNyveMriTjA==
X-Received: by 2002:a17:903:281:b0:14c:f3b3:209b with SMTP id
 j1-20020a170903028100b0014cf3b3209bmr3906079plr.87.1648099883419; 
 Wed, 23 Mar 2022 22:31:23 -0700 (PDT)
Received: from localhost.localdomain ([122.171.187.87])
 by smtp.gmail.com with ESMTPSA id
 c4-20020a056a00248400b004faad8c81bcsm1705069pfv.127.2022.03.23.22.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Mar 2022 22:31:22 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2] RISC-V: Enable profiling by default
Date: Thu, 24 Mar 2022 11:00:20 +0530
Message-Id: <20220324053020.606637-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_223124_242374_C72D9084 
X-CRM114-Status: UNSURE (   7.98  )
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

Let us enable profiling by default in RV32 and RV64 defconfigs so
that we can use RISC-V PMU drivers on various RISC-V platforms.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
Changes since v1:
 - Enable CONFIG_PROFILING instead of CONFIG_PREF_EVENTS in defconfigs
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index f120fcc43d0a..bfebee46784c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 8b56a7f1eb06..2b68b1bd2559 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -15,6 +15,7 @@ CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
+CONFIG_PROFILING=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_VIRT=y
 CONFIG_ARCH_RV32I=y
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
