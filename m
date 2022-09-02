Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9FECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 17:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSi4uPuA5jlLWnUpyZDUyGtK6FqQw0s122SqFW3YnFE=; b=FlpyA8v4qc4E4A
	RCK22XFSDgdEsPACeWxVaAIQ3VPlGvq8hFTVBzTpknIuvIVNsNCtIrr/qfNH+F3cTWE2kbKmvEcsa
	zh2PN2MB0GoiEDnLc/hNbouCrpLSuD7LbG9BAxDeBG7/yhWzxEan9FjR+Okik7wi++joFJ+mAYNPH
	pIPz7ighqPsb7LbzQwMIFMHwhYQBKAwVD4l7/hf4edyIcvF4dl7xuQuwOsyE5hc9tcNjO1XUipcGE
	gM4Wvl2D8TcqgHUcZxvYqBNKT+BnqhueAMaV87m1GYC/OEEBSLtHCTp5UyGWoDxpc8Wq35b4wg77O
	8L6pAoAIeF0oQzwM4HCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA3D-007bOS-OY; Fri, 02 Sep 2022 17:01:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUA3B-007bLT-9p
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 17:01:50 +0000
Received: by mail-pf1-x436.google.com with SMTP id t129so2479423pfb.6
        for <linux-riscv@lists.infradead.org>; Fri, 02 Sep 2022 10:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=Vm/PQtsMRdh7Pbw/4p9noQ+tg28yZ0+v0kEq1eCWKD4=;
        b=CkXXcHNS74QYdJ9e1NnZgnh3uVejOIINykzPJi6+1fXrDGrv0jJSyOFb5qRUcW5/iL
         EY2dLxMXAVSd9HWxKc1w6YMzC31Bvkow3RstUPN8fDd1eqBgYHg1lL0WnsUbBLufx0/2
         8I8XoHAsYff0k2alAeR9BpU5rmLJwJUWEKcHq7pxnDJxxDOL9FgRojBBa9CuIgr21tNU
         W3b0LLhfi6kiQxAa3zn/Wqyjs3qJhiZSokdva/fpwv+riege1Q8b0rnjdC4qaZdX+afX
         o8QEjn68saj7tA5h+i7UryiRBvSHJMQ7Qhnt/OEnZUQLoy6WtEzQKo/ycSV5C9ZcG3uO
         7sTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Vm/PQtsMRdh7Pbw/4p9noQ+tg28yZ0+v0kEq1eCWKD4=;
        b=78syIuktoJJZ2IHOz1I3KRpH4Bw7Uaf7WVEBOXv2ogxhtfobBqZgfJDrAg6wJ1tMK3
         TtlnIpMSEa5f3Mq+x4jdI/66oAPYO25xNEuXTkE1K4IJX4jLWnnkL03A1b4fRWsYvLrR
         buRYQ+UEJw6ECEmxu2QXsT23XNNtE6LlBbRJcddMKBbmVbuJNPfy8DBefQNGtnaVqGfI
         ZpL6e74lkMz89Yh4T/jq7/bS40+VXmRbhETj4udy+05FSAo2ertdKzAS7VTvkvDn6vxX
         /J/ROlreLlwzA2ayTGzvNYQkZLMdhcSk3dyUg7QDO7lm1u6QmeB2AcYhe1FAijqB29VL
         XwWQ==
X-Gm-Message-State: ACgBeo1HT28hUJkfuZ40vTPmKIYkfInwgM5wh/q22TOuEmobB4scrhLz
	p/oT65RwJFV95e6M8eAW7KCWFg==
X-Google-Smtp-Source: AA6agR4XTOArH8T6f1P6llgRGm5gyZO4n41IcmSaVSLCUa7S2QZEh/HuEaSl6Wg82L2tiR2gYRy8wA==
X-Received: by 2002:a05:6a00:b43:b0:52f:59dc:93 with SMTP id p3-20020a056a000b4300b0052f59dc0093mr37082459pfo.26.1662138108131;
        Fri, 02 Sep 2022 10:01:48 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.83.155])
        by smtp.gmail.com with ESMTPSA id w10-20020a65534a000000b0043014f9a4c9sm1638800pgr.93.2022.09.02.10.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 10:01:47 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/3] RISC-V: Probe Svinval extension form ISA string
Date: Fri,  2 Sep 2022 22:31:29 +0530
Message-Id: <20220902170131.32334-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902170131.32334-1-apatel@ventanamicro.com>
References: <20220902170131.32334-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_100149_375518_2518F1E1 
X-CRM114-Status: GOOD (  10.95  )
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

From: Mayuresh Chitale <mchitale@ventanamicro.com>

Just like other ISA extensions, we allow callers/users to detect the
presence of Svinval extension from ISA string.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..b22525290073 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -58,6 +58,7 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZICBOM,
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
+	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
@@ -69,6 +70,7 @@ enum riscv_isa_ext_id {
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
 	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
+	RISCV_ISA_EXT_KEY_SVINVAL,
 	RISCV_ISA_EXT_KEY_MAX,
 };
 
@@ -90,6 +92,8 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_ZIHINTPAUSE:
 		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
+	case RISCV_ISA_EXT_SVINVAL:
+		return RISCV_ISA_EXT_KEY_SVINVAL;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0be8a2403212..7d1cd653ca02 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -96,6 +96,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
+	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3b5583db9d80..9774f1271f93 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -204,6 +204,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
+				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
