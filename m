Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E82C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 03:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAz4czl27Oyfi1ij9vfiNbVtuRWdPBJNTvcpIiKBSkM=; b=B5ByJliLgYqdFW
	fxtxxwdMzAoCTejxO6sh7az8CzEPUTUU+YrTGydk6nzkci0GUsrFJ3E4P8Mumvb8EXZUiDwCVeoWI
	bUuy49uaTCdlZtK/ipuI7tu+knXtwYCcnJyd5dw+yHhiF/7LMXCVSNXjo+EJOHdjtH1Hn6HD0kuvD
	bWXaqgdHY3j/8MuUCs34Fgge3X9G7e2CuKSI0Zz0uuioLGzzlCAcNKwQAHSQvANVgVIvoE390SmF9
	irnW9ixGZAs3FJosHPTer7eYePp5t7NWJmxwkehuWg69n51dbPFMal4ZveKEsp62jdTq2HTFLrdva
	YuaSByCJfPimr5CWKlrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfYBl-003SvJ-2n;
	Fri, 24 Mar 2023 03:34:01 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfYBh-003SuK-30
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 03:34:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id kq3so677652plb.13
        for <linux-riscv@lists.infradead.org>; Thu, 23 Mar 2023 20:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679628836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SuNyNXqOE8MJi82Ss2jr4+2w7Bbh8bl4PPMM+ipEJZg=;
        b=QwKiPoPY2sBwX1qMThbCtcIkli32kb6pTnveqLIR6/FUR0CnPvXMpm6UQcwe8zw1iO
         tnNYj38tfYqF2OiaVC+QiDTBesRwi98uV3TOpG97R9vbUvGQ3XA9dxnSuWiyeNoHLDJV
         sSZ1ROXCtKhrzQvdQgjYOPmg8bLYwN8lPQPdXdVXubE1UO49L/uhwfp+YInwbJ2ta4Mv
         fCG+4HJt79P1HIo5PUqOBBUs/VHhzPwXO4lZlo1i6yfvh+YEGftqNROdR2RFy7l3S8qs
         ex+z565PIKVV/ObuQXItC/D5mAiO9JBuJK3nsQDDi7zpNcJI7vaRV4uNy4lrG3t04Qm9
         ErEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679628836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SuNyNXqOE8MJi82Ss2jr4+2w7Bbh8bl4PPMM+ipEJZg=;
        b=Zjc9NDoaQ2XT4O9wOwiTGQb+sYKh9FOLQ7rtTv9kLb006qHVlBQFOsaVFEed9UVbZ0
         rERIfxgu79v5Po6LMnrPqFiRGvqkH+WuNRXl+eyAPdeN0ZHOyeXxdXYCDQrPnGzVt67T
         KpPXuM2OVY94/Caw/5qcrzKzbo8Ccpt9FsDfdMaSwUVYSDxAzgjI1gu3IV7hEB/KKRnG
         MTqPNRfWuAllzJe8W7VFmK3fNjvTzlFd+Sk/d8V6vvVYzsWhAWdHQBMoDVwlH/+7gc1v
         rMOFNPminNUFe9g/6opJrLk0fWtb1wd/1JfNuRxitUMaQCaWbsq/ojz2YALGYAO2xNyA
         lBWA==
X-Gm-Message-State: AAQBX9fAmoZumj30I5d7bDgjRgBLN8cmwWJ2YU8BQnCR6Q/MvnOLq5EY
	iWnE4H0C/fXwEzHNKH22kK4=
X-Google-Smtp-Source: AKy350ZTjVR39b2Jkhn03bjHsLNpTlLtmn8tFDvpX8T0uDzXVOdf1btaAfwE3KcJr+IRUCEUIuI9Sg==
X-Received: by 2002:a17:902:e3cb:b0:19c:a866:6a76 with SMTP id r11-20020a170902e3cb00b0019ca8666a76mr908258ple.42.1679628836270;
        Thu, 23 Mar 2023 20:33:56 -0700 (PDT)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f7cd00b0019d1f42b00csm13014101plw.17.2023.03.23.20.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 20:33:55 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	guoren@kernel.org,
	e.shatokhin@yadro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH V8 1/4] riscv: select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY
Date: Fri, 24 Mar 2023 11:33:39 +0800
Message-Id: <20230324033342.3177979-2-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230324033342.3177979-1-suagrfillet@gmail.com>
References: <20230324033342.3177979-1-suagrfillet@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_203357_966933_26FC8E11 
X-CRM114-Status: UNSURE (   8.95  )
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

In RISC-V, -fpatchable-function-entry option is used to support
dynamic ftrace in this commit afc76b8b8011 ("riscv: Using
PATCHABLE_FUNCTION_ENTRY instead of MCOUNT"). So recordmcount
don't have to be called to create the __mcount_loc section before
the vmlinux linking.

Here selects FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY to tell
Makefile not to run recordmcount.

Link: https://lore.kernel.org/linux-riscv/CAAYs2=j3Eak9vU6xbAw0zPuoh00rh8v5C2U3fePkokZFibWs2g@mail.gmail.com/T/#t
Link: https://lore.kernel.org/linux-riscv/Y4jtfrJt+%2FQ5nMOz@spud/
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c5e42cc37604..93d4817c9d73 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -56,6 +56,7 @@ config RISCV
 	select COMMON_CLK
 	select CPU_PM if CPU_IDLE
 	select EDAC_SUPPORT
+	select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY if DYNAMIC_FTRACE
 	select GENERIC_ARCH_TOPOLOGY
 	select GENERIC_ATOMIC64 if !64BIT
 	select GENERIC_CLOCKEVENTS_BROADCAST if SMP
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
