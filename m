Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFAFC3DA7F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 21:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c05uCLXO8Aijgq1cswwGtm81CfigwTJ/IcY8xjuhNBE=; b=irD0XjYTE2alI0
	TAvmZB+xBmefn2c9Z8GnQnGEBoLc1xe4EGxrWVj02pqhkko4hc+/G7yONrZJhKhXOuZ0zjOQNScmc
	xRxOV2lIxHlG/+l8RqvaQ0jHUoGuKFf+1fANnc2Q7ZRdWSN0aHLkzC+aoNV/1Aw5CmX5pE3cI2Y/8
	XHQ65Cj1tOMenDGh//FT79dyV6QlGwLVXCn5ir7SS8wDu8AILH3PCIDD8FktrtuJQLN03sGMnRN+Y
	u5CvOC1wcZokPIB7fKjhAShbkspMgU+sjOFBEoWc53r/FzfHmx7vWabN7YGHXoGmjVWKufomhSg2o
	IEwORu2I4LOIWeoKTJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXTd-0000000CiyX-0BIC;
	Mon, 29 Jul 2024 21:00:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXTX-0000000CixN-2xLJ
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 21:00:13 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1fd66cddd4dso32061025ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 14:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722286810; x=1722891610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRgJIV1cTDPBS5NKysD3spMfMdec84tFxkNVs2v3aFc=;
        b=sXjs9o735VzUOA83CPXNMceEgnxbXTqwgtdhcJVO1Mzn7xZDexoZ8gIjMTiqtDeIkf
         Eu1yuOFr1s5dy7Jp0jV6IdeSUQgMuoB+4duLRK1DM4cPwhzwJRAkriQ5ZTmgCpX/OC1s
         wS0DWC1uLXliJ6CmT5gYvQF85iHi4IaXd0q6tHrDdxxKSk4vhLMlwLdEc1CpCqucso+R
         sKHqpC4Z8C5K7x9HB+2LSaakLny5J1RxJzJZPV2LB6dG3hiPSRz02ZcBKawAncVl227E
         usYV9po7iY8iIrJQJNsv+6BiZ1queUBmEJOshUn3xf7Szh+C4vce8shHBpOStpXagN0E
         LQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286810; x=1722891610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRgJIV1cTDPBS5NKysD3spMfMdec84tFxkNVs2v3aFc=;
        b=hQ7hhyUZVOtfV+u9OpiFT3ssK8xuiTqMvV4PHNNpCloLtq3CTYN2w+0MbIKi8XJhRB
         yH7985RRiA1TVmd0RAOPqYtPJ9K0vKGw+9rJLBMZYjtiVNX2kS19O2cYg7m4gK7IJllf
         ngdI8cqeMw9uIRFj+cU4tRtCUt7dPZgLallXxDWBwSWdETiSa2TLctWPp/vjHU1maBDd
         wu/mHq6oTQmQYWs0kKyuNP1r2iPAsj/lNsqAyTxsnXDdJPBxUYJ3PvtHAaESpufR1HhP
         0KeaL77xxFn58y6lLxFV4oceqoTPaY3uLmEPsi4Zy+XrcPrWiwjtzT+IgRBYTybG5K6Y
         tPgA==
X-Gm-Message-State: AOJu0YxHNXdxvY2wcqrnds2rLDJPVQUcX4NN5OeUbmikonEMrs2l/Byn
	V2xo1KQkAcj3SrY4iyafCLB/lNcLM//ZnQOcsAqTq4GOuEeL7v87PyMI0+6HqGc=
X-Google-Smtp-Source: AGHT+IEqv2wM0QP/vtvMFjcXLVCXqZ3EczLUQnCDQX1jaxebQ0tOwZa5TBFWE47h/eDPqFkV6Vnecg==
X-Received: by 2002:a17:902:f811:b0:1fd:9b96:32f5 with SMTP id d9443c01a7336-1ff0483e1f2mr89994395ad.31.1722286810331;
        Mon, 29 Jul 2024 14:00:10 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f71d61sm87341745ad.225.2024.07.29.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 14:00:09 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 29 Jul 2024 14:00:02 -0700
Subject: [PATCH 1/2] riscv: Add license to fence.h
MIME-Version: 1.0
Message-Id: <20240729-riscv_fence_license-v1-1-7d5648069640@rivosinc.com>
References: <20240729-riscv_fence_license-v1-0-7d5648069640@rivosinc.com>
In-Reply-To: <20240729-riscv_fence_license-v1-0-7d5648069640@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722286807; l=505;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=KLZOPxSIPFADWanc8+KTUi5BYPXEMMvuVPtNYrhJHTs=;
 b=KiHexqfK0b0CM+McxiebOkChmmVRLM0YTyR4PhvF580R72jwXt2SwLepwmfmi+ylEfie9cYp+
 nG/8+TCh3mnBD68DrSHQwWI08b7KxYE/vr+MDXqzMCfccxLca+W+EIB
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_140011_867877_57B4089D 
X-CRM114-Status: UNSURE (   7.99  )
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

Add a missing license to fence.h.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/fence.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
index 6bcd80325dfc..182db7930edc 100644
--- a/arch/riscv/include/asm/fence.h
+++ b/arch/riscv/include/asm/fence.h
@@ -1,3 +1,4 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASM_RISCV_FENCE_H
 #define _ASM_RISCV_FENCE_H
 

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
