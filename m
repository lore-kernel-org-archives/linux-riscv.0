Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828A4C64EC7
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 08:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cbWqfW+iKTypJbeYvisSrgugkDV9KV+8rUPSz4AFswI=; b=hpPywniqE0C/Vf
	3oNpkev3/YA1DBZNeHP2A7GPNnl1EKIdHfX8sjRV23o0VkggZyPtPRQKoPSL0Vqw1RF84JLwjBXFc
	SH5StsGKi63Ww7nEko0DCZJ34mQUR9CYPoG098LJmVZQSLehp/hS2ilm5puWc4TCpOawMvlOHYCrj
	iy3u++EdXMLW7xdGP+v735pAnh93qCL8p3tb83YNoNgdsy379S4RVvvDXIQq5sSCpIA1XRcS3ENHm
	p1WOZA413Z/PWm9ED6YgiL3fJ8uKCo2EtGNb9LyQrX9Voyg3drp38uamM0WAVlkbcaqaUhUknHzVG
	KoKJfeOQBOHa5MgUyVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHn5-00FRls-Qc; Wed, 01 Mar 2023 08:26:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXHn1-00FRkp-W9
	for linux-riscv@lists.infradead.org; Wed, 01 Mar 2023 08:26:21 +0000
Received: by mail-wr1-x430.google.com with SMTP id v16so9519401wrn.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Mar 2023 00:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677659176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HfD4q2LgbRRlvJ4+bYxh6ZqsbcVB/WxMo7rj6NRQuk0=;
        b=f7dPjsGeDMkdphwBk+4dWnmbmhEKV1N7dpGkBBAUcyhUY0gcTKFFBuC1ja3NxeDB+/
         rPTxKIBV6WvchBkRLT/usr+RSymAsbd9LhEYMY3QXqDcozg6r/j6yNAXluT1sVZvsxuJ
         YAcMT7CNVOmIH3vMKAkZoAQy6ng+6gk4BX0XWTACqeGneIfVMiFUC8d9yR+1N1vlJnbe
         y45ne71uOYnjyQdPWgJnIZcWr9s1/SBmFsUFlg7vwFIE4s4mHDFPLsXbnP+3BO9hPq6T
         dnn82De3HHv9pTb7KAQ+wcCOUerZ9baKElRNGegh7lftO2JosnaJqWHps9bfpDfIViUv
         QTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677659176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfD4q2LgbRRlvJ4+bYxh6ZqsbcVB/WxMo7rj6NRQuk0=;
        b=z9o0c9U77rTyJnKkFIzY7k/Rn5tii9mQ+a2PS1HcJBoE3646DzL2dGs1NHIgoG9dkG
         2meQFFxACXM5+L6JtBZO55dLdueMEKDygje8VJatgpOt+elLk9KA/8zoNG/FzUjqrx65
         uNNfUAEETm6w0DTvwXl4glLdbrpe+7+gKY0/wYKSNUPYgjWNcOQirafltbvv9nZLcWuj
         sGmmKRSiI7RITaFUhIrdmGxyNhziaVOvtNqBrV0uaY/8DiF0fFTDpONx4M5rpK85+kiC
         nnfiyOysKPsnRvZlu/Ack06wC4Jz6dEtJx+1GexE8Mwnj+GP6hGpaNd4j/wMs7x/i0jO
         xn8w==
X-Gm-Message-State: AO0yUKVOEqN/+yUKpRpm4RrNfpcwdnim1klE6Jdfbh1VWZAHtche8YXn
	8lT9KPOp/SmZsMF/QaRXQFEbPA==
X-Google-Smtp-Source: AK7set860SjBlAUqr0i040uF9NlXD059b879x/lzjp+pMjSSaQDOynaWXtRRmOsueJGr/ZNni44PcA==
X-Received: by 2002:a5d:424a:0:b0:2ca:d5dc:bba4 with SMTP id s10-20020a5d424a000000b002cad5dcbba4mr4492855wrr.59.1677659175817;
        Wed, 01 Mar 2023 00:26:15 -0800 (PST)
Received: from alex-rivos.home (lfbn-gre-1-235-32.w90-112.abo.wanadoo.fr. [90.112.194.32])
        by smtp.gmail.com with ESMTPSA id w11-20020adff9cb000000b002c55de1c72bsm11859694wrr.62.2023.03.01.00.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 00:26:15 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v6 0/2] riscv: Use PUD/P4D/PGD pages for the linear mapping
Date: Wed,  1 Mar 2023 09:25:50 +0100
Message-Id: <20230301082552.274331-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_002620_296205_5021323A 
X-CRM114-Status: GOOD (  10.65  )
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

This patchset intends to improve tlb utilization by using hugepages for
the linear mapping.

base-commit-tag: v6.2-rc7

v6:
- quiet LLVM warning by casting phys_ram_base into an unsigned long

v5:
- Fix nommu builds by getting rid of riscv_pfn_base in patch 1, thanks
  Conor
- Add RB from Andrew

v4:
- Rebase on top of v6.2-rc3, as noted by Conor
- Add Acked-by Rob

v3:
- Change the comment about initrd_start VA conversion so that it fits
  ARM64 and RISCV64 (and others in the future if needed), as suggested
  by Rob

v2:
- Add a comment on why RISCV64 does not need to set initrd_start/end that
  early in the boot process, as asked by Rob

Alexandre Ghiti (2):
  riscv: Get rid of riscv_pfn_base variable
  riscv: Use PUD/P4D/PGD pages for the linear mapping

 arch/riscv/include/asm/page.h | 19 +++++++++++++++++--
 arch/riscv/mm/init.c          | 28 ++++++++++++++++++----------
 arch/riscv/mm/physaddr.c      | 16 ++++++++++++++++
 drivers/of/fdt.c              | 11 ++++++-----
 4 files changed, 57 insertions(+), 17 deletions(-)

--
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
