Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C826C32772
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=naOYZhrmc0Y6lm4RkkgBddvnYPxt+KaMky+W5hpSrFI=; b=015H0gwuL6Gxgz
	HS8Fbuh/HdmXBHYAtqM9YSlL8B1/fGQF0cr7V2Ma4go9POPmxCow+buBnkUGZnywaCNukig/2l2+U
	1BKi5p4d9f8S0GUpbTL7UlfBZMhAAH4fKV0wTijKgJKEGSJ/w9RASFmaWQTxhu7DWMEGDZzP/XoJZ
	mU5Rwy0SiflVliynDmhxyx0n/9gKuVL51E5ryk8+ZcK03YhZFwQ3N1MeBZOGSj6qdrSlF1AizLdBy
	b+/EUwb3yr5AtCOrCLL5yn6UiTk5rVt9sesUhMjBvCM9H2OTBJ3Me138XUY5m4vDQ+rrN0oOiRSc6
	tX1atWd2AuhGNIysS6Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aW-009KfN-Eq; Fri, 19 Aug 2022 14:03:04 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aQ-009KXB-Rh
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:03:00 +0000
Received: by mail-ed1-x52f.google.com with SMTP id e21so943175edc.7
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=gWpCeboSTd362c81JJRbfvlhocgLTAM7tdDbcBSzWLo=;
        b=nAbT1+smFaqdX4qfGI5TykDxMyIbjzhqPcHArokTkIhBwchex3uvH78ENi3Bnt4BX0
         7w5W23B0DjDiFlHt0tvmIR7ZBNYQXCvUgD8pwYp8qlP3gFqj6NxL89vjWHt8T25TT1Wy
         UrKpuERmkAa5DCCZ1tOsYOxShaMrJ1Purq4AJ0OlUWJZnLKm9oeL6UTGZSl4ncJ7MzFr
         82RvD6l56TIYCeypl3BK4Mgyzwq3H8JprBrW79AqcMzodyc7wGF4QoM8pQgA9htThGnF
         pqTJ9f/BsE6PliI6Iwsc5feBsinOW5WQUQkxw0puSHoOgvWPFWikY5bEgkDHA8tOF5ra
         LK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=gWpCeboSTd362c81JJRbfvlhocgLTAM7tdDbcBSzWLo=;
        b=ZTc6gl9Eg8jb/y5uBTt6qBPU7kFGvxHp6Dkv8I+FlKdizTAFyFCWOBqafNcUsJi7pR
         Zw1UWaeWAkmaAfTjZHkR+TKpLjNOKvb6U4vYWahjJzvZ+fw32MOpaawI615bK1Q9Qsp2
         WNhRqK8g1PH+yMXfKTr7pfSCmBw0hN8Hxixgsjc+WZZFx5mEGGVirWzTpPr+/O6lVm1F
         xGjLUAU1B7WXAQrsFHYDmc6vDvLqiteO5JiwP/qLbxO1X8uWu1isATZIeniLIsqaQOHz
         2WVUqcF27CTb9T5fyEow+8MVnhU9Tej5PS79dBsLHhwuJYeqzdfXW6+feZM4+3zIJDdE
         EUuw==
X-Gm-Message-State: ACgBeo0z81RSPWEbbT0ngFbXWWHVtaiUioj5eSaRXUwFWA6xEwOc4zVR
	xEyRGbS+rN4y2u5WB+YAmUD6x+UN6bGArg==
X-Google-Smtp-Source: AA6agR6iqHD8BlV5q3t5q+oMfU59Fa2v3ezBpXzZ0BeKOHeC9Vpm41nPJvjiQV3QcFghPode/hRkQw==
X-Received: by 2002:a05:6402:198:b0:442:da5a:6716 with SMTP id r24-20020a056402019800b00442da5a6716mr6164620edv.5.1660917773621;
        Fri, 19 Aug 2022 07:02:53 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id q15-20020a170906360f00b00730a73cbe08sm2383101ejb.169.2022.08.19.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:02:53 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	heiko@sntech.de
Subject: [PATCH 1/4] riscv: Add X register names to gpr-nums
Date: Fri, 19 Aug 2022 16:02:47 +0200
Message-Id: <20220819140250.3892995-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220819140250.3892995-1-ajones@ventanamicro.com>
References: <20220819140250.3892995-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_070258_981716_EE1C0187 
X-CRM114-Status: UNSURE (   9.15  )
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

When encoding instructions it's sometimes necessary to set a
register field to a precise number. This is easiest to do using
the x<num> naming.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/gpr-num.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/gpr-num.h b/arch/riscv/include/asm/gpr-num.h
index dfee2829fc7c..efeb5edf8a3a 100644
--- a/arch/riscv/include/asm/gpr-num.h
+++ b/arch/riscv/include/asm/gpr-num.h
@@ -3,6 +3,11 @@
 #define __ASM_GPR_NUM_H
 
 #ifdef __ASSEMBLY__
+
+	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
+	.equ	.L__gpr_num_x\num, \num
+	.endr
+
 	.equ	.L__gpr_num_zero,	0
 	.equ	.L__gpr_num_ra,		1
 	.equ	.L__gpr_num_sp,		2
@@ -39,6 +44,9 @@
 #else /* __ASSEMBLY__ */
 
 #define __DEFINE_ASM_GPR_NUMS					\
+"	.irp	num,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31\n" \
+"	.equ	.L__gpr_num_x\\num, \\num\n"			\
+"	.endr\n"						\
 "	.equ	.L__gpr_num_zero,	0\n"			\
 "	.equ	.L__gpr_num_ra,		1\n"			\
 "	.equ	.L__gpr_num_sp,		2\n"			\
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
