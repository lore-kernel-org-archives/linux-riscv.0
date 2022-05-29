Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05665C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tE922k+PVRD8T1Gs+Yly/HPzP7zKRiKpybb1G+D3GO4=; b=jSYXBfkLkfsyi1
	qtP9fIxptOwC/T83ocNYME3C6yvdYc/iGz51r4WGhDPpKOLq9ULr9hz6ntIg5IdDy5oFs18ujdd6H
	IO9eZcqcW1+hqxQztqlOrAr1nkbtdzkTO72QTuvwVu29bwqCznriWTfJI7Z3dKJjZE3dPoeVtewDY
	yLG2AWCtBigw+81W7uy41CKtm3xu5DmU38rLEnG8GPQgE7IreEIxxu0DEr/28ZQFYFg2x7GqRputk
	hlDm9eb1Fr6N2olefpCW9ho46/aztyJZuxoPM4h0yHHWHOEm1IQ7gfdGgXZYccqeN50djdQItnJ63
	+l69Mi5yJeJBMTdCYUWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1o-0043sy-G7; Sun, 29 May 2022 14:36:24 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1l-0043sH-5i
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 14:36:22 +0000
Received: by mail-pf1-x429.google.com with SMTP id 202so8473309pfu.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 May 2022 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ccP9l9pns6lpXbkQ5JDvCZjhGwpnETilHlLkaO3pCqM=;
        b=ZCEJTSlGhC6QcvyhCdmxOu9vfA8bK/Zth0+rW4mowO7LsstI7T8FfnLB4tOD2USh+V
         GF6lDlFzyyqv2NFPF/0CuH4ZoU0k7P/2vU5cDlMluui1bmFAbZ9Hn8/mtcxKGEJhH3lt
         CP/EvF+aWjwbQqQE3gXeqAXbNP4ZQnTrG9ESHQLvX7z8L64xX91cOlqNvWBMjgLHEfH0
         UKKvp+YLSNN+f/TcU2aCyj/2DJrttCL2FkIeb/k/qbUzJx5Czy57XeGOHd+eN8U9dqqQ
         abQ5Xj80z+xtLN05xmUufnYeDJ6Ay7nfi29hOlxFlyNZF1LiUKHLVeDtoO+7FI4cl9O9
         PrVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ccP9l9pns6lpXbkQ5JDvCZjhGwpnETilHlLkaO3pCqM=;
        b=I5gpLIYh1RPkPj/eVUk84heKcx15yZa2IgXVf7+Q3eIgJgbxiWB04HJIAPgosSiNar
         e8L/VTgItLp2DrikH8nV+Y+1FMVyEwzwov8k0s7FZQ2vS7eW4JBz+9jW4n6BuDLtt7EA
         sb3OtpP4iQIKOmrDrASxfjmXx1JeN8ud83I37ssRY8OYY/52BWKz6LEHSd/4nEHm+3WE
         Q1sV/FAlM6yvZBbGid0auEKiJ0rqcpMSkiskee4OkFgRI6wlGv5YCcMC2MHeftuP05Q1
         GTdmVRWkpuArjIZ3qTUgyaOokZXXIBqQ47cCRg8FzfelYnFR2FVrCdsMClIDnUWkDOoK
         V/Fw==
X-Gm-Message-State: AOAM531/+3yZmxRP2oUjZqcUfiiJR8ZR/g+vOZy1JGh/RD0m+L4/pi7v
	fXLpuJrVIVomYrc3rLQrvZ8olvTJvT3YF7FL
X-Google-Smtp-Source: ABdhPJxDhJZk+7siHv6hisv2A54LmE9FDcb7R9DEiXQaa9JewAA9dq+Yx8GzSPoTpegZ1GZRfx99AQ==
X-Received: by 2002:a65:6c12:0:b0:3db:a518:ff1b with SMTP id y18-20020a656c12000000b003dba518ff1bmr44022313pgu.315.1653834979896;
        Sun, 29 May 2022 07:36:19 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id h18-20020a056a00231200b005104c6d7941sm7066827pfh.31.2022.05.29.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 07:36:19 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	mingo@redhat.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org
Cc: guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH riscv/for-next 1/4] riscv: align ftrace to 4 Byte boundary and increase ftrace prologue size
Date: Sun, 29 May 2022 22:33:12 +0800
Message-Id: <20220529143315.3678563-2-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220529143315.3678563-1-andy.chiu@sifive.com>
References: <20220529143315.3678563-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_073621_329112_867D60C1 
X-CRM114-Status: GOOD (  10.57  )
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

We are introducing a new ftrace mechanism in order to phase out
stop_machine() and enable kernel preemption. The new mechanism requires
ftrace patchable function entries to be 24 bytes and aligned to 4 Byte
boundaries.

Before applying this patch, the size of the kernel code, with 43432 of
ftrace entries, was at 12.31 MB. Under the same configuration, the size
has increased to 12.68 MB after applying this patch set.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 1f19bdac6767..cb6cfdffc49c 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -11,7 +11,7 @@ LDFLAGS_vmlinux :=
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
-	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
+	CC_FLAGS_FTRACE := -fpatchable-function-entry=12  -falign-functions=4
 endif
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
