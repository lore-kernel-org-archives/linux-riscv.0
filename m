Return-Path: <SRS0=xmLI=MP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A5AC64EBC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46D1320878
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  3 Oct 2018 03:13:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CG9QnDlS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tqPKp5jA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46D1320878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bxyh+plGejllrSn2yjh5dRld0nzD0jnyed8k75HMqvg=; b=CG9QnDlSidgW6NOBUOJat+hb93
	iQPEW1tWqWcwlGvPvHsWh9A6bsI1Lg09cEE3+aULNfM36J7DB9BCNUV4YLV5Xss2o5DTVfslpgK8m
	d4bDUTqNhcf1hHyhsh1Xvruiwu2tYUea/HOIk4y25+CduEe46BI/6mRHYol22u+kqtG+WUqXfUQVc
	hfm6x3JxkU7c8nWE2tNzzcbb/bwr1R7PKZ85INjBL3Tn53nxjoazUEzraDieRalW0rulGRnroWzaR
	rBK5XBzcKJxJAjE3BKLaUi8mDDT+ihKTmuvLeOO34yEmbpUX/NeVAayqSa4kfT+5jjevCJrYogTsx
	hcVu24jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7Xb3-0005Hh-Th; Wed, 03 Oct 2018 03:13:09 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Xar-00057m-Ro
 for linux-riscv@lists.infradead.org; Wed, 03 Oct 2018 03:13:03 +0000
Received: by mail-pg1-x542.google.com with SMTP id 23-v6so865606pgc.8
 for <linux-riscv@lists.infradead.org>; Tue, 02 Oct 2018 20:12:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A8JtHAC5naJL8x4fNKDf/GkWKYU0n8LRslVlKTfoHeI=;
 b=tqPKp5jA79Clg4VZIqXQg3s2E+P5J/oGRzax/CJxZuFCpxgU2xRUiC+Erj/obA9aT2
 rX+9tduecmxu5q0USuyVSrCJjjQp8UfG3Z/iA0e1DZG0par0c8r5KOdgIfYJpAt5W0Y+
 kY8vZ7TehG3+yf7Y9fJuCNk8MplG/5d1Sj7DcUZ8WtSBIvSFbrxX+w4402v1rsGh2yv5
 CrBDCZ1AKZdMilmmOiM6dHp3dFPt96RwaJAyCUVlOLH3ZDrDOWZqgTw9vEOvRmv45620
 vwhGsg1+bUBlYZNLK30EUh/Oi7JtNTpm2SiukiYjSmR13KutmKfonvxiUtb2z1Yel3la
 Nt3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A8JtHAC5naJL8x4fNKDf/GkWKYU0n8LRslVlKTfoHeI=;
 b=NVSxK01KYheWCRJt084rkKzl+s46fc+w05/7SiUUQsRjjkQnZ6rAsP4Gt6qgZvIoeb
 ws1olnqyWSiJnEjcSuKkYM5wsAu3+Bj79Z56Wc6YGdhYbH96lF13FkfZ6c+rtb+uIqH7
 1XRiQQTXr30vOWI2bgO1mFitntv9KBIm+/02agTRwOWyUw83BEF9Y70LV7t7dZC8xrjc
 vYSwanPAxaioVujmjEFdvoaAnXlzEIhBJrxVr3n74jp9v4EzjtP7Bs8ciBmbeQZP8EXz
 noxLHjCQKLza3CRBZsdo7wIYvl3XTB/gGW5tTK7OTkMsw1sAaI9PS8oBmbrHAzXo5vMg
 Pqkw==
X-Gm-Message-State: ABuFfojVPnyx/8Oe8m+MH1Z06Zwa8TS9EexZXs5ib1Oamo0JftsongTe
 u2aDWrFdvP2Cylycu9prq8w=
X-Google-Smtp-Source: ACcGV60Io+NddWjxZE0/ihvgsE/2pO0UrYIB3Q5I3B6OPmkvfx4tIDKraWUwossHggtpfPH6CNYQCQ==
X-Received: by 2002:a62:32c4:: with SMTP id
 y187-v6mr11625804pfy.4.1538536367018; 
 Tue, 02 Oct 2018 20:12:47 -0700 (PDT)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id v23-v6sm21777747pfm.80.2018.10.02.20.12.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Oct 2018 20:12:46 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v4 4/5] RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
Date: Wed,  3 Oct 2018 11:10:01 +0800
Message-Id:
 <b87900141b3ee65e639bb8a0278a2acd7fced103.1538535528.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1538535527.git.zongbox@gmail.com>
References: <cover.1538535527.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181002_201257_933469_9A44F042 
X-CRM114-Status: UNSURE (   8.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: hch@infradead.org, zong@andestech.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181003031001.yTX61r4rOEAQv94kXQKORuXNmzCzYWxnsG9kBvufFMc@z>

On RV32, it will use the __umoddi3. Select GENERIC_LIB_UMODDI3 to avoid
undefined reference.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a344980..dc262fa 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -108,6 +108,7 @@ config ARCH_RV32I
 	select GENERIC_LIB_ASHRDI3
 	select GENERIC_LIB_LSHRDI3
 	select GENERIC_LIB_UCMPDI2
+	select GENERIC_LIB_UMODDI3
 
 config ARCH_RV64I
 	bool "RV64I"
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
