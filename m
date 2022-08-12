Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1734C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 04:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NE7mW+d/gM1D9PgaQ1KDXNPAcvqoZHcIe/yTnJnoyOU=; b=WFeNaGLMyq/1mj
	DzLaT8iMsTNC0nTm1VpGjP6WbVFn3uoXCULVtkA307dqmgK38ABCDSOCep2zx7ECwwAh0RqOJAZDx
	2jtXs7TyY+euvmW3EI5UFY391BwFgoKeKTnWdRyBUIepjZ5DzRTrlVk8KSdWePilNly4avwQyae6E
	3cYD4Soi+9o2OZfeA1WQBLlBm3/mXd92UyTXI9KN2le6uLXsg946qoSHUfb9KtVgk8gaWKDCmZoIE
	Fs2/HVCMYVw5UwcNp+focyH3/QTD7PN2pMHRPIJ0Aep4FCBXU8mYHWQBFVPh+IobX4IwdllDdjR6V
	vOitLvAgORhf0gPZSQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMMIl-00F32T-Ci; Fri, 12 Aug 2022 04:29:39 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMMIi-00F31h-Q4
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 04:29:38 +0000
Received: by mail-pg1-x52a.google.com with SMTP id h132so18848527pgc.10
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 21:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=zf/lyBwgY7fwZczDkiGwYJ8KmRcJitYDUwLLF9DMyFw=;
        b=Flp/y4DxaRiEzb1TfY3zRmX8QmUL/mcRWXCEFDOOm9nPvhA/Y+V3AqgvYhFJ4uBTum
         9K58Cs6iLtajCKbyRN/mL7dB4fnjkkxhf+jbvrdMWYibblAxuivay9L10+BfJIl3VwS4
         pIVg16fJqiZ3MoyCrhBLBuq8lvKgVl5WrLJKd+U4F0hGdK6opl3nDm8ym6RjMdmbTg5w
         KN7GUFV6hsXf8LxxPTnII9qvrauyK08+wnEG9MNDL6zIuvJ/XG85qbWl+iquS75eEaOj
         lHVbY89Wez16/SAZIMfjspT/bqnvgWlXtUEq7yZLvvFLmBTyF1UsuU7/xM+K+ZIDygfx
         Ow+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=zf/lyBwgY7fwZczDkiGwYJ8KmRcJitYDUwLLF9DMyFw=;
        b=2IlWlAxgh4d0nAioT5euC7crac8aTUkUvsvqxJbVHKjLLdEC8uXE/Zhkr+12OqoWFW
         2s2tPmSh5f/4sbzZZMpI+cxaOZlKIU+G/6DDWN1iBYy+AJc98lZGLD3xdLW7wVCMXDSf
         XM8LAtb1lRwIN5AEVdyoDBlZ0E6BX9HO46GY9O1Je5aJqA3lWluCoVu5t/vljpDkUPpc
         5YLPzi9fu8kej5oxA7tw5alWX5W2UEDq/pQva7vY0dXNexRCcssVHlThF81QZfBdXW0i
         DHB/FeTeDKvyMUoNGu8oHwFASkAArtEfrmbcT78dCanbPWdNQuMzz+Dk88PWazUb/KlB
         k4DA==
X-Gm-Message-State: ACgBeo1olsUvse22ApGMPbLbVQfYAOiKytFIiVBZ4H6bhFiEaFP/7Pkq
	mHQ3GD4uIUAVkEvk6g5/TT5lOQ==
X-Google-Smtp-Source: AA6agR7CYH6SwGrweG9+9zKXE1rszN8Za04R2+ixXHyOojx0lnnZAJzuX6P25hBEtHDve78VhWyQuA==
X-Received: by 2002:a05:6a00:240f:b0:52e:f99d:1157 with SMTP id z15-20020a056a00240f00b0052ef99d1157mr1946057pfh.70.1660278575189;
        Thu, 11 Aug 2022 21:29:35 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id h29-20020aa79f5d000000b0052d981e7842sm524904pfr.208.2022.08.11.21.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:29:34 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 1/2] riscv: enum for svinval extension
Date: Fri, 12 Aug 2022 09:59:20 +0530
Message-Id: <20220812042921.14508-2-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220812042921.14508-1-mchitale@ventanamicro.com>
References: <20220812042921.14508-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_212936_860838_9FAEA3C3 
X-CRM114-Status: GOOD (  12.41  )
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

Similar to the other ISA extensions, this patch enables
callers to check for the presence for the svinval extension.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpu.c        | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 3 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e48eebdd2631..fe58a2f4ac07 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -54,6 +54,7 @@ extern unsigned long elf_hwcap;
 enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
 	RISCV_ISA_EXT_SVPBMT,
+	RISCV_ISA_EXT_SVINVAL,
 	RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
 };
 
@@ -64,6 +65,7 @@ enum riscv_isa_ext_id {
  */
 enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
+	RISCV_ISA_EXT_KEY_SVINVAL,
 	RISCV_ISA_EXT_KEY_MAX,
 };
 
@@ -83,6 +85,8 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_FPU;
 	case RISCV_ISA_EXT_d:
 		return RISCV_ISA_EXT_KEY_FPU;
+	case RISCV_ISA_EXT_SVINVAL:
+		return RISCV_ISA_EXT_KEY_SVINVAL;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 022fd1861992..125bd43878dc 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -93,6 +93,7 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e233fe154c96..b6bf1a7e30d1 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -200,6 +200,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("svpbmt", RISCV_ISA_EXT_SVPBMT);
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
