Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6FFECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DXIrnseRzr9p1MIW0m3z15fv08F4JnyaeFZKx6XJ+Fs=; b=S16li9e+azEaSO
	xhaG6EqM32ByVhC/oHJGvtC7FbyoE3EQLJZI4WnaQVdx6Q0ciWUnL8REXPD/P+3TMs13wIV4E0v1Z
	5Q0KecMOgGks1bGAUAhRtZ3lYTA/DTotvkJC3v/psLRuMeb5L7nBtZ9unCbD+uKNHGCUuJoJ1jqxq
	33Zgel8qbZ1+Av2dmtujF+68T19DI4hzn2GnQmgJyz6esh+3iSdNh0mFfrAZIaUF4cHKTeXWmrWDI
	eovnGA4bHcV6AqT4JW16DZmUW7EXgNZQFNAVJgwuH+X/GYuMGDpTO9T8UZlTNdqFE8nM2mA1tsxqK
	QTexH0fNR7csECcC5KQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2tw-00C33P-Vi; Wed, 21 Sep 2022 16:48:45 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2tt-00C2s4-7h
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:48:42 +0000
Received: by mail-wr1-x430.google.com with SMTP id bq9so10897917wrb.4
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=YCN2tVuugvi8qTfs+QkeI544lSmy4+FJUIa8ytD8sjY=;
        b=sJrxzeFxvLWTi2acUQTe8MR9BfkAvZ78komlubFTwPNNnj6DdlcU9MzFvzqqyJrwCu
         GaATgzwENxOwuhTZZyEd3lVZsUUeX+Dlr9DlKh2K+/2UCws/iwg9JQbi6VksIshJNCqu
         SNgNALGl8kjFqLjd4QSbekQHuS4TgslDPiOLGfA9WTi49By/9eBCOwertGucKpAdn8NP
         PluDui0eEgXeUQszcM7fo+G+rwZ14+7fssNTxUBQG2N3MjDWgFDRtHlekY6CVzdPy7Au
         UubTtuuTegZNtRxaJTuEJfgqTGY+hvoo6MOrICh+Jsk5eq824i6lTiXks5AjbmTb0R03
         aaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=YCN2tVuugvi8qTfs+QkeI544lSmy4+FJUIa8ytD8sjY=;
        b=Tia/ZjaWvnCjjas8IG+UTkkGQItgTROmcNHEl1sA5gaErIRNyu8WWa2lqwAidtTaeM
         j9uaBgaQMqMrKeM6aoDlGJucdwmIXNGOek5Banmr2uqQshJ+JQIJaWV2MxVJy5JVbZaS
         wZRJzthyi1ZucNjg0/W5aW+SQcfcLDPZQfZashE7OwVh5qm8MruogGhJ014VyHCAIhdJ
         sVYWcFT8biIGdPK8iYT73lCQ3XzsA+rkVKuAU39z09Gh/H0oJrh/pz0tVEhEucCchBoG
         jYPZHiEX1ZTzBhH9VdrR8ySJjuwp3dhOlc2CUID9/XhcRlEnefnx0kxsENUL7yBsaSc5
         Oi+Q==
X-Gm-Message-State: ACrzQf1XjXlbMIw6I2mOL+5RMEFlbBRJr5z5o/PWSL2jdWnWVIX4aNih
	nkd1iHa/3Ww1xsuxqhdVb5VNVgNUnNP56IXPqINk6vUhddRaXg==
X-Google-Smtp-Source: AMsMyM6TJUz28ah59o30o4bgEO2bdaJzODFws/bNSqDhn366WPrqA7Na4NFBsDwSovWdk9bfQAC3NcYul7N7vWVp1BQ=
X-Received: by 2002:adf:fb8f:0:b0:225:2def:221e with SMTP id
 a15-20020adffb8f000000b002252def221emr17854387wrr.130.1663778920538; Wed, 21
 Sep 2022 09:48:40 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:48:04 -0700
Message-ID: <CAM2SziWHRo6wY5FNeNZ+V8q73LdEvv1VA8CRRzNR6rfLDPLZew@mail.gmail.com>
Subject: [PATCH 07/17] riscv: Add vector struct and assembler definitions
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_094841_317044_8786CDE8 
X-CRM114-Status: GOOD (  11.18  )
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

Add vector state context struct in struct thread and asm-offsets.c
definitions.

The vector registers will be saved in datap pointer of __riscv_v_state. It
will be dynamically allocated in kernel space. It will be put right after
the __riscv_v_state data structure in user space.

Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/processor.h   |  1 +
 arch/riscv/include/uapi/asm/ptrace.h | 17 +++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  6 ++++++
 3 files changed, 24 insertions(+)

diff --git a/arch/riscv/include/asm/processor.h
b/arch/riscv/include/asm/processor.h
index 19eedd4af4cd..95917a2b24f9 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -39,6 +39,7 @@ struct thread_struct {
        unsigned long s[12];    /* s[0]: frame pointer */
        struct __riscv_d_ext_state fstate;
        unsigned long bad_cause;
+       struct __riscv_v_state vstate;
 };

 /* Whitelist the fstate from the task_struct for hardened usercopy */
diff --git a/arch/riscv/include/uapi/asm/ptrace.h
b/arch/riscv/include/uapi/asm/ptrace.h
index 882547f6bd5c..6ee1ca2edfa7 100644
--- a/arch/riscv/include/uapi/asm/ptrace.h
+++ b/arch/riscv/include/uapi/asm/ptrace.h
@@ -77,6 +77,23 @@ union __riscv_fp_state {
        struct __riscv_q_ext_state q;
 };

+struct __riscv_v_state {
+       unsigned long vstart;
+       unsigned long vl;
+       unsigned long vtype;
+       unsigned long vcsr;
+       void *datap;
+       /*
+        * In signal handler, datap will be set a correct user stack offset
+        * and vector registers will be copied to the address of datap
+        * pointer.
+        *
+        * In ptrace syscall, datap will be set to zero and the vector
+        * registers will be copied to the address right after this
+        * structure.
+        */
+};
+
 #endif /* __ASSEMBLY__ */

 #endif /* _UAPI_ASM_RISCV_PTRACE_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index df9444397908..37e3e6a8d877 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -75,6 +75,12 @@ void asm_offsets(void)
        OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
 #endif

+       OFFSET(RISCV_V_STATE_VSTART, __riscv_v_state, vstart);
+       OFFSET(RISCV_V_STATE_VL, __riscv_v_state, vl);
+       OFFSET(RISCV_V_STATE_VTYPE, __riscv_v_state, vtype);
+       OFFSET(RISCV_V_STATE_VCSR, __riscv_v_state, vcsr);
+       OFFSET(RISCV_V_STATE_DATAP, __riscv_v_state, datap);
+
        DEFINE(PT_SIZE, sizeof(struct pt_regs));
        OFFSET(PT_EPC, pt_regs, epc);
        OFFSET(PT_RA, pt_regs, ra);
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
