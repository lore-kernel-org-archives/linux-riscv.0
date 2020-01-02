Return-Path: <SRS0=K0nT=2X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46A6C2D0DE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 03:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA10C20863
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2020 03:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZszxSdYF";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FdObOX2d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA10C20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TMcYLN3IkMoBxMFdCkuvjs15n5cIfbofEAZTiuFMn6Y=; b=ZszxSdYFsaxxGP
	vYSPE3GKQNnxzvjU20ziHJN5IbyKXTkebDY1HtuEC7L62bF6OhaNQFuFGQP2fFVfCflthoZANhwk9
	++S3WBJsp2xTkJvozj8jhVziH7Rm65oDd1OJ2vTCFlNIVVkF24eSCsyJz3nLSk67RjK0101dDWfoE
	R1KDOzbCCAi91fGBDAZLyrw7CMtDg6boN98wFeiYZ55mcEtDOatvVqbQDwxxlje+ANakPJw9q3QO/
	xhifoceQAsbb3V6QsmKS/NxQL/4PiXuR11kIbI7w7dQdALZNt7fAjgvVfyvHbJtJBthxcU07qfQxH
	aknn87xWFXE3BCW2hUBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1imqul-00043A-Pq; Thu, 02 Jan 2020 03:12:47 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1imquj-00042F-GQ
 for linux-riscv@lists.infradead.org; Thu, 02 Jan 2020 03:12:46 +0000
Received: by mail-pl1-x644.google.com with SMTP id g6so17311302plt.2
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jan 2020 19:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TMcYLN3IkMoBxMFdCkuvjs15n5cIfbofEAZTiuFMn6Y=;
 b=FdObOX2dsbDRlFC6cfrSgH4NJ8u/d+dDPwphvVvBQMbbrMyq/5qEKGfXT/55/7uL59
 Jo3U18bfpPcWYIvMqK6ERmXXv/0/SxBSydcYObUABZdNVkXGEsSybeP2fYSRWCNWoS89
 jjKQ+mme76LObO7nKf41OjNe56NjbwypL839Gv672GwQSyyd6BVt3HR4cicOdSqgh0Ac
 VKBimMsvkR7pHdMD5TB33+7lxYvAdQjOC/iLxYy97adq5ZB9Q6B9j0n4pHJzV6E+o6q7
 yuK1vSHaINe+aEUibokjtTdNyaEI9nDbu4WlUQo7eiOZm3KmIiBg0mZoEEI9TSpdLu/x
 tr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TMcYLN3IkMoBxMFdCkuvjs15n5cIfbofEAZTiuFMn6Y=;
 b=DwZbTuc5r5qeT3FLL1tK1sL900fGVZmMdgtDffz+x+Ru6YNLCiajNDUohE7wbHYG32
 0UHsZ+GRVMsNcLfatuTZcCvosGFk6JfqkoyHXv3kSzKckne6IDBQP/PBGsbhXfX9y+ym
 oqF56sgsWvXhuwbid48+Eng7auID/p64je8ZFwWPWebWuHK5w7j4lE6UMuzvwNIXevQm
 iRU+zu0M1OssxDq3LLWHGhTe7IvgLkDCIVV2gIa7xUi3WYAJqVLDA/O686XGrWrxGFlw
 Gng3VGvZV0a1r1kyDoQlPI2VYvw1nzxBGIHVtJi0Bn/yem4IWIbFctNnpbGyOlkT+ik3
 8Keg==
X-Gm-Message-State: APjAAAW7d8g5OrN/7OxCOjjVWSX9SBTF1e1F6O/EbdstG4eH8hJXh6F2
 4EgBbaVfudzMMNd7PAz4X/qMDw==
X-Google-Smtp-Source: APXvYqwbFnj6ajJf+Fid3c7aNGr3nMJJR57DIC+mTq8Y6qZG36OlFLZnwtxd01211MJAnFu9F1Q6jg==
X-Received: by 2002:a17:90b:3011:: with SMTP id
 hg17mr16969954pjb.90.1577934764625; 
 Wed, 01 Jan 2020 19:12:44 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id l127sm57943938pgl.48.2020.01.01.19.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jan 2020 19:12:44 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: mm: add support for CONFIG_DEBUG_VIRTUAL
Date: Thu,  2 Jan 2020 11:12:38 +0800
Message-Id: <20200102031240.44484-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200101_191245_551826_026FEF81 
X-CRM114-Status: UNSURE (   7.04  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch implements CONFIG_DEBUG_VIRTUAL to do additional checks on
virt_to_phys and __pa_symbol calls. virt_to_phys used for linear mapping
check, and __pa_symbol used for kernel symbol check. In current RISC-V,
kernel image maps to linear mapping area. If CONFIG_DEBUG_VIRTUAL is
disable, these two functions calculate the offset on the address feded
directly without any checks.

Zong Li (2):
  riscv: mm: add support for CONFIG_DEBUG_VIRTUAL
  riscv: mm: use __pa_symbol for kernel symbols

 arch/riscv/Kconfig            |  1 +
 arch/riscv/include/asm/page.h | 16 +++++++++++++--
 arch/riscv/mm/Makefile        |  2 ++
 arch/riscv/mm/init.c          | 12 ++++++------
 arch/riscv/mm/physaddr.c      | 37 +++++++++++++++++++++++++++++++++++
 5 files changed, 60 insertions(+), 8 deletions(-)
 create mode 100644 arch/riscv/mm/physaddr.c

-- 
2.24.1


