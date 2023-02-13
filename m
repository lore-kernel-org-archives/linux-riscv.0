Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066F0C6379F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 04:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzZ+ujtLBzJij6X389D2v+nFSwULsymnJD454ooUeMQ=; b=BI+moNS2S/KJ6O
	CArePmFuaq7C88PYVQDltEZMuX4W9/POSKvZ9Nf+hEH914Ea5NHalat8K8kBUOWNyRkzDmGNEQFW4
	T/QRCx/9kT7Ph+iTLEmldXuFsUlIZ7BGUyuXgIDBA9MTzjLqlZNfKQPcg1OMm4CX8bzXyvBnycXrr
	VAl4cOKC+ItuGkvUEvFoS4/wTH00PiORqsUnmHOeaYxB2cmDvwdXsjcgkI/0HXgX220J2UzdLgZEh
	fxTtSh7goWOgch9chVCbu2PjgAj0tA/MlV2T34+RdQgGM12lOkLpzw13bzifoPuH1YH1tmTNncDAA
	fKPPj78XAIYJxhpEUGHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqy-00D9Jw-56; Mon, 13 Feb 2023 04:54:12 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRQqr-00D9HC-Uw
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 04:54:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id o8so9929746pls.11
        for <linux-riscv@lists.infradead.org>; Sun, 12 Feb 2023 20:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygm9hLpLL1KwyacXGpOOuca3iQf7LxxYrIQu5XdYYTM=;
        b=JmbKf5O4FW7VprGWzT6pTOJ6+XRdEoQ4K+BKlOUVtq85X7g+qzslXWNCPg42IUCWhU
         rw4+oyC8n0SztanJDULrL0G4HIT5Q6o7vob1J4OfyTnIEsl1YFKX11cOkOdy9uFegNwa
         x6igQ0OwD2KhxVFTGm59+14EXLtfxvRRr1Av1QGSCWfRbEuBt4TxWInNIgMZ226q7q9/
         mmo1iJFG+ymYF8U6azYAqrHjWkWmn7/1v4j2+bnP97Jt2+z8SgCRNd94EPiNAI6ixCai
         zyDUdTGbuUYxA+xybA1iB80amQlKMk9SNsoRQEq8gcwMLoxLIaePp1DQ1hHVL5zeZHc4
         wX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygm9hLpLL1KwyacXGpOOuca3iQf7LxxYrIQu5XdYYTM=;
        b=jMopRwovX9NCQCaGDSP99jCtmnZd7sPHprZlfgQPqFteTnVIqay/87Yge/3nrAruOd
         aGRwcAQJoQ+dfg+cgQzBcybyHjUhwZNP6YaS/tHULyV7PvplOzy5ox8ggAiMU+7xADpo
         6TNTQPxvXWOup1p4FwBVS3eIX/Vu2D0Kjey+IGj3fMtkBUkKG0yaI5BURxIGa5ynxKBc
         LQM0TSdgAs8JESHOEMF0l/2K+10diAUIqfpOMC8d0qSUew/R88FQT+nJjb9gCdZD+3Ew
         IPd0R89HKbl4/TcTQaH5lgR0n/8wiJDr0rqVxMwqoP+QVpdUS83y8XdGe4GngNzSR2jX
         /z9g==
X-Gm-Message-State: AO0yUKU6aZAkYkNDMtdpqWqZZmCGwhMppuWTXQTayCvxYHZuWUeOxZgX
	KCM0zkCcFHM2pRa2TFJikM4ECQ==
X-Google-Smtp-Source: AK7set9LivmAL6nscPb/Ur0Knw2PHztkbYBAr8wiViog/IxQpf/a9GLEV3lzuzHcUxnGms82gaueBw==
X-Received: by 2002:a17:903:4091:b0:19a:73f7:675f with SMTP id z17-20020a170903409100b0019a73f7675fmr7653937plc.60.1676264044842;
        Sun, 12 Feb 2023 20:54:04 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902784500b00189e7cb8b89sm7078303pln.127.2023.02.12.20.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 20:54:04 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v1 RFC Zisslpcfi 02/20] riscv: zisslpcfi enumeration
Date: Sun, 12 Feb 2023 20:53:31 -0800
Message-Id: <20230213045351.3945824-3-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213045351.3945824-1-debug@rivosinc.com>
References: <20230213045351.3945824-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_205406_013949_AC631E01 
X-CRM114-Status: GOOD (  13.74  )
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

This patch adds support for detecting zisslpcfi. zisslpcfi stands for
unprivleged integer spec extension to support shadow stack and landing
pad instruction for indirect branch.

This patch looks for "zisslpcfi" in device tree and accordinlgy lights up
bit in cpu feature bitmap. Furthermore this patch adds detection utility
functions to return whether shadow stack or landing pads are supported by
cpu.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h     |  6 +++++-
 arch/riscv/include/asm/processor.h | 12 ++++++++++++
 arch/riscv/kernel/cpu.c            |  1 +
 arch/riscv/kernel/cpufeature.c     |  1 +
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 86328e3acb02..245fb7ffddd2 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,7 +59,8 @@ enum riscv_isa_ext_id {
 	RISCV_ISA_EXT_ZIHINTPAUSE,
 	RISCV_ISA_EXT_SSTC,
 	RISCV_ISA_EXT_SVINVAL,
-	RISCV_ISA_EXT_ID_MAX
+	RISCV_ISA_EXT_ZCFI,
+	RISCV_ISA_EXT_ID_MAX,
 };
 static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
 
@@ -72,6 +73,7 @@ enum riscv_isa_ext_key {
 	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
 	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
 	RISCV_ISA_EXT_KEY_SVINVAL,
+	RISCV_ISA_EXT_KEY_ZCFI,
 	RISCV_ISA_EXT_KEY_MAX,
 };
 
@@ -95,6 +97,8 @@ static __always_inline int riscv_isa_ext2key(int num)
 		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
 	case RISCV_ISA_EXT_SVINVAL:
 		return RISCV_ISA_EXT_KEY_SVINVAL;
+	case RISCV_ISA_EXT_ZCFI:
+		return RISCV_ISA_EXT_KEY_ZCFI;
 	default:
 		return -EINVAL;
 	}
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 94a0590c6971..bdebce2cc323 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -80,6 +80,18 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
+#ifdef CONFIG_USER_SHADOW_STACK
+static inline bool arch_supports_shadow_stack(void)
+{
+	return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZCFI);
+}
+#endif
+#ifdef CONFIG_USER_INDIRECT_BR_LP
+static inline bool arch_supports_indirect_br_lp_instr(void)
+{
+	return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_ZCFI);
+}
+#endif
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 1b9a5a66e55a..fe2bb908d805 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -168,6 +168,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
+	__RISCV_ISA_EXT_DATA(zisslpcfi, RISCV_ISA_EXT_ZCFI),
 	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
 };
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 93e45560af30..b44e258a7502 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -228,6 +228,7 @@ void __init riscv_fill_hwcap(void)
 				SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
 				SET_ISA_EXT_MAP("svinval", RISCV_ISA_EXT_SVINVAL);
+				SET_ISA_EXT_MAP("zisslpcfi", RISCV_ISA_EXT_ZCFI);
 			}
 #undef SET_ISA_EXT_MAP
 		}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
