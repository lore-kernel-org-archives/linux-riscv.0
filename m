Return-Path: <SRS0=meey=XI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122F0C49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 20:40:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC8FC20692
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 13 Sep 2019 20:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r38cQVA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC8FC20692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yGhrlgAq8g50eJ0d+dPMoJqRlV6WgFGyLnq2+BkP0nc=; b=r38cQVA14I1iCW
	+o8q/IHoc1oTYoZw3P97dy20tK+mZVP022MZmo0+KC9g0iuXuercfMD3bZsi6wCRSNf5ysX0e2Iso
	SYDWcmXi+3musDzs+pjCwJiBnWZo6+UCnlULCFm+iHh7yysSbbRhBSWTuJzawd0S1IpzJIV/YRnD0
	dniR+fcNUSvfSWUbBUIURFmKxauOoVtFePdext7DfVAAY6QdzgcjFCCbWeuedT4fZN3TXRzIFVjZh
	TjK3Wk2cAVhMdl6Gvn5WSU1udlQJUwb2UnppFNCBB7rjocic06yCJ6ZjkejG1pyp3KTnmHgrdBh/7
	uDSF9F8YEQ8NFhdpInDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i8sMj-0008LG-Ah; Fri, 13 Sep 2019 20:40:25 +0000
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i8sMg-0008Km-RU
 for linux-riscv@lists.infradead.org; Fri, 13 Sep 2019 20:40:24 +0000
Received: by mail-pf1-f193.google.com with SMTP id y5so16047052pfo.4
 for <linux-riscv@lists.infradead.org>; Fri, 13 Sep 2019 13:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=YX0Jl8x6RlVJ3WIQRXv6TwIJGxSFKsrNzwr9swiyGPk=;
 b=QDexVeroNZor36odUr75AfUBZgHXfCMiCv/G7egsKmbAUsfttjaR/K70wAA0KE8WL7
 A4toPHHqB8Mwo3jhEKgYmE3Qz5UT9gLSVkjJOVK8/c4WZADCF+FxO5O9YARfvblkZ7mq
 k3Oy/a0d1a+Z75CsgNK27Bk5x52GNo87ghYeDeOGtN5BO8BKIJxgCv0LQHIt8kab5WRH
 ILk3iUhe8d11KnLYKWuJx2RTp9y75r553cH4oRWt2KU68PaXbPFSnatZPbDocBifwOvO
 10wWjfsVcUp6Pzc3VGBRX/JFeTCM/bo90Szn1ccj7N+GVzJyHPR3coNxk+j6crpjDMNs
 k7uA==
X-Gm-Message-State: APjAAAXX504AZ+Quulm+xi18GVC+ZUwtef/VxIPvoLMRC5L2QaM1+ro1
 kXPnQOXQCS+OOhN3pczi089wMyV6peAF/A==
X-Google-Smtp-Source: APXvYqwZU/vHw7C6zg2Y5gixSECAXnl4Li36MKYGhuCAaoGVWhphMTaMSawEPavWsUQywc5Kjyyb4g==
X-Received: by 2002:a63:4451:: with SMTP id t17mr14762885pgk.128.1568407220964; 
 Fri, 13 Sep 2019 13:40:20 -0700 (PDT)
Received: from localhost (amx-tls3.starhub.net.sg. [203.116.164.13])
 by smtp.gmail.com with ESMTPSA id 20sm33791616pfh.72.2019.09.13.13.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2019 13:40:20 -0700 (PDT)
Subject: [PATCH] Documentation: Add "earlycon=sbi" to the admin guide
Date: Fri, 13 Sep 2019 13:38:43 -0700
Message-Id: <20190913203843.27149-1-palmer@sifive.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@sifive.com>
To: corbet@lwn.net, linux-doc@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, schwab@suse.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190913_134022_900632_F3E5725E 
X-CRM114-Status: UNSURE (   7.69  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This argument is supported on RISC-V systems and widely used, but was
not documented here.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4c1971960afa..ca437381f91f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1044,6 +1044,10 @@
 			specified address. The serial port must already be
 			setup and configured. Options are not yet supported.
 
+		sbi
+			Use RISC-V SBI (Supervisor Binary Interface) for early
+			console.
+
 		smh	Use ARM semihosting calls for early console.
 
 		s3c2410,<addr>
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
