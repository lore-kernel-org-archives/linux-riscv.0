Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69842CE7A96
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFvf1IpQVdQrCXlBEiWydFb/rk3znDtEET0jbchMUyw=; b=bi1TPYH3erLMxo
	YAI7GgjX8rGaGpl9wuIm8sChqUCxSx/PYZsL7g2haUCGx7K9Rn7H7sVkCujtHXuaIRzckIEwru8Xu
	XRD1TA0R73yTrR0NJ2oyjKIJ98afgFZnO+NOVgiUISbp9Tb7urgpmQqklUshFutCGoirLTkvwV5o0
	1eBYoWzzZrxNGV/U3neXTe2w+Eo5D894JH9wKQotfaZIJOmK9hcksSyHbdkNbj5PTyhDrdWnA0/tR
	fmFhcrUE9md0xQqxEdpUIrWNWR28opgjoPDgB48UHJ+WHG9Zu5o0Zf1oHpl93/yBzWi/yfOQKScKJ
	9SlAYY0FvSaT99Bie0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloD-00EMBS-2I;
	Mon, 25 Sep 2023 13:39:33 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkloB-00EM9O-08
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:39:32 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c09673b006so42614495ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695649168; x=1696253968; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gV6mGP1XJq3xnVTxbQIHP/QVhp+GQJw7IZPtitWR2ag=;
        b=CrCakrCP23LzqiLUXI/PPlDOWPxM8efPzm+u7c3RkUDcccKVtIqOdtmGY/X3SdhTf8
         RjtCxe3A6l2tS+1mZM7qYQ1Q6dIpfdZa2JJ7acV+0J2ipd4ruAdH0mafJE8+id/vYCFb
         Olsny8jx1MPDH/bFb4kwKxx534ZuycE26NCigByDZV/MRz6gHjf8QKzeqqf7uVfvqrWk
         CSQDbYryiNXhgOJwYSslWhz+sFq58BwqP2RtVsL6paJKIwWrP6ZkgpykTEpFbiLcNJ3s
         FGByatgmM/cjm+hvsVRyuWH68OXkgqBcmaJQ7nUrsefkMzSIRWT6vGuy4BrjMf0Pbyno
         eOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695649168; x=1696253968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gV6mGP1XJq3xnVTxbQIHP/QVhp+GQJw7IZPtitWR2ag=;
        b=M85R55cZAEzAFDud19rsmUg0oDyMmViN91cZsz+bmf2+Pl47IcrFhcRh0XXMEt3Zd/
         YSlyHSwvVM6ci0wxxb69+y9u1ZUFAXMLcmCoYYFmxiM7u+I87X8YioMxjobNets0hHHz
         QmqNvbKErg9MxgB2qKpfjnM39kxu+t+jYUXQD6AdNhInxMo4zqIHqMW9NRhj1v453tUw
         blJ/ffc3i3LW4eW1yaB98uPOrGbI/wBrQ/7TRkEgLHtNtE5wMkUcGSukRyCjXLCd8LCb
         7yp72vO7YpStfijJw/BD0hJYE/t7bTPCA1A2v9uh3ezW6uXYyce5LRXJmCE4vfmHLqWQ
         2ypA==
X-Gm-Message-State: AOJu0YzNtPie5H/UYa7cQQR2LHGiVj/h2UQHQlTyKLIFpugGT7+3JKCs
	11xYLarzYK8zptcFtXX/WrFMnQ==
X-Google-Smtp-Source: AGHT+IEDXrhyEx6eaSZ6frtjTYSejpa1s2eAnJYzebqP5g4HzZCjNkN/tfngtcIrEJra3Z7D04o6Dg==
X-Received: by 2002:a17:902:c10c:b0:1c5:741d:f388 with SMTP id 12-20020a170902c10c00b001c5741df388mr4868718pli.9.1695649167770;
        Mon, 25 Sep 2023 06:39:27 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id p11-20020a170902eacb00b001c625d6ffccsm969433pld.129.2023.09.25.06.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 06:39:27 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	devicetree@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/9] RISC-V: Detect XVentanaCondOps from ISA string
Date: Mon, 25 Sep 2023 19:08:52 +0530
Message-Id: <20230925133859.1735879-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925133859.1735879-1-apatel@ventanamicro.com>
References: <20230925133859.1735879-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063931_075051_74C3D2C8 
X-CRM114-Status: UNSURE (   9.33  )
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

The Veyron-V1 CPU supports custom conditional arithmetic and
conditional-select/move operations referred to as XVentanaCondOps
extension. In fact, QEMU RISC-V also has support for emulating
XVentanaCondOps extension.

Let us detect XVentanaCondOps extension from ISA string available
through DT or ACPI.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0f520f7d058a..b7efe9e2fa89 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,6 +59,7 @@
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
+#define RISCV_ISA_EXT_XVENTANACONDOPS	44
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3755a8c2a9de..3a31d34fe709 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -182,6 +182,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(xventanacondops, RISCV_ISA_EXT_XVENTANACONDOPS),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
