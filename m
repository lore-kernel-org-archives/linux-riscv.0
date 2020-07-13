Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA19AC433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 08:32:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D982067D
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 08:32:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fPyDbjnv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="ecXF2CYX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D982067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AV7jUxICbbxlHde8sIl1IAZEOzc+21883WMGDGAtbqM=; b=fPyDbjnvIEc0Brr/WNGRFT5fcS
	v+NK2xszDxX/W5Hcb0dWsmsIFW2NP65uxTJ17KxTyzW51DQwp/aHQ7Po6V7pv+cKDsUDpsx5B5AbW
	LZdXqeCydYS0mWmcctIkCOFBRCJ33VCYljXgjXbXzmR9zLCyMX0S6tTywUfFdIyTQREIazzTW3JvZ
	xzINS/BqS97ZYFwKDrphYPmaCBIyEhPLTXSwoLzz0TWZWvDZ8dPKWDS8oRtUYTFhrfZ+kqOk9/fUG
	Zj1EK81rrpHlN5+IyoGyAMtBsGhxkYm3LP2DHzRmNLE3h6Rmp6/YAg1pnA9gflwnpfvYrFAqQQAss
	FfDfIQVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jutt6-0005TJ-MR; Mon, 13 Jul 2020 08:32:36 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jutt2-0005RC-9C
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 08:32:34 +0000
Received: by mail-pg1-x543.google.com with SMTP id k27so5729172pgm.2
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y0T+GMH1Kh2ICjHY21eXCCE66DOmM5GvIu3hqK8aoBU=;
 b=ecXF2CYXVgfNVLmav2XOWfVtk0U81NPq0g31QUQx+V53EK3fzxxN0wb8dpfZDPA79T
 xsm2kCCMH3iM9gAAzUjzuAcT4CWtnW8vk9p94f93xa2bzu7R1YJTLAAsiu79qZJgrBk3
 tnxMwUzJ8GqxaTh4KEgvaW9pmLrnLhSjy23X8p1ySl2m06lC7kvbG00cTVijNlFkfce/
 qh9ePNYZOZHwEwSkKetIKn0eBwfDwMPXOMb+HL1BDv3HhiIOM5+C06elUE7ArLIW4hUv
 5njnkJx6PR2bt9dXDi3IbPBvSaZy/2QZroCphjKFF1LaPvSfggxx0O3LdxUZHK4dsaDJ
 8FjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y0T+GMH1Kh2ICjHY21eXCCE66DOmM5GvIu3hqK8aoBU=;
 b=A7Oh528Ur18y3vbOTVxxhTzbPi8wY9CSdy34ZDPja+cM6/xSpuZSurGTbbF7ZwEOks
 MWYOw/yA5n7sTSwDub4AslcigIVvF4inNPCyQ9PU823wwdIcBuf244LC+o1HZwjlVSm5
 xh5vBNiSe8araEVmpWdVq1d6IajpMfOOwLU34ZSfD8sI2jgkqE8oVfOIpBFKT/lMauC8
 251+b8JxT899KryXBpUD1iKf69gxpgPDfyO6GJzrw0Qjas49MAFCZquCTxoSOX2gNnSB
 +lbar71xxRj6ZlS1Fv+B7qtUkXUgsrG79ws9/mHN+0qmV+RlcBxkMiD30SlcpovbRuqf
 5TNQ==
X-Gm-Message-State: AOAM532grfBnMBRHbDkgtNpJR8JlaP9pILPrHQrqJJ+xJhBP7FZSPsEE
 +D6xfWdSMOGBLBZBLuyloxbxvA==
X-Google-Smtp-Source: ABdhPJzYIKvSchn6EAYr5Yv3j4DAQKytxquVEMaHG6dFxMusYnStue1qyRJp6N/+iUZHihl3zE3w0Q==
X-Received: by 2002:a62:3744:: with SMTP id e65mr38578823pfa.20.1594629148757; 
 Mon, 13 Jul 2020 01:32:28 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id b4sm13603678pjn.38.2020.07.13.01.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 01:32:28 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [PATCH 1/2] riscv: Fix building error in entry.S when
 CONFIG_RISCV_M_MODE is enabled
Date: Mon, 13 Jul 2020 16:32:15 +0800
Message-Id: <742f0a82a9d4ab62d8616784db5a88a95d8b5389.1594629047.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_043232_353201_15E7D12B 
X-CRM114-Status: UNSURE (   8.37  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arch/riscv/kernel/entry.S: Assembler messages:
arch/riscv/kernel/entry.S:106: Error: illegal operands `andi a0,s1,0x00001800'

This building error is because of the SR_MPP value is too large to be used
as an immediate value for andi. To fix this issue I use li to set the
immediate value to t0, then it can use t0 and s1 to do and operation.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/kernel/entry.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 6ed579fc1073..000984695cd6 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -99,7 +99,8 @@ _save_context:
 
 #ifdef CONFIG_CONTEXT_TRACKING
 	/* If previous state is in user mode, call context_tracking_user_exit. */
-	andi a0, s1, SR_SPP
+	li t0, SR_PP
+	and a0, s1, t0
 	bnez a0, skip_context_tracking
 	call context_tracking_user_exit
 
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
