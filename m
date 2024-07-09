Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830FDC3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 01:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nZPrWKA4PVl0mzZ/t3YTvsb7Umgovi70OcecHjwkgd8=; b=sAvIhUXTObJp5Z
	d9Z68L53feusdLgNaHhJylrnVcwd/BlaayvgYNawh2PBWHDBOKUDc5ENC/uWWlxH+LlfQSwjYrS4B
	sgoexQ3BngPHkCqez3aXLkey0lziUqhzfmFPXwgcGvNnyZAc1Ytcnzm32ZJsLU934HH0qeCu8nzcx
	eenrV8GnlyU8OEo5v36txNOm2JniQjTdJ50pAKdZWW+HEcY8gXSVfr6Ywiyly02akNZxhUBrQzZxY
	XSttGoukEfQx2gR/2H5RObNl30zM3pW3vk4Kd0VNhO1FTWJltK2x7aqrFHU1M2ksKKsYv3vyj9huL
	yjT9yzGdB/AJ28mfjgwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQzcV-00000005XLy-10YT;
	Tue, 09 Jul 2024 01:26:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQzcS-00000005XLC-1TAe
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 01:26:13 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-52ea5dc3c66so6054045e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jul 2024 18:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1720488370; x=1721093170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=136zt4/6BYW2/kpJsnjidD2iOco9V0C95e+drYPyuRw=;
        b=DmFwucbpx1tdHk3rVKcvKj6iDTpwdtDaLxqCjrqMljuVhtAkikG0zp+ln6X5nn0zMQ
         i/VBrq6rDyMzQDhxH3g8Kj4CoSjxwv90XoHlMEwgxCNK6/i/mWpt/EKj1UnjzGzpPZai
         mG0Oz4r0MWn/+ixQOv5gwRZ1tEtoRf0/TtTZh/qdJjKSgNFPCYSB5F0DHX0ifaRlJllh
         yHtOYiMUAIm8Me3O77TMzo11ziiaBSjuNEZ4XmpkGxXEkihirUp+Q6B2XMQ9H/bogLFC
         DDac2G/I1wSVAIiFlnr1ImmVPfXK9ZVGCWODsKMGaux44Y5Q6YWqxE0xvFcpCW6KifLm
         16Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720488370; x=1721093170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=136zt4/6BYW2/kpJsnjidD2iOco9V0C95e+drYPyuRw=;
        b=OiD2LCnRiPIa6sFa1OEF93gprH1tPq7hn6tOR3m0N/0noaZjrxMAiGP3d7/LPTAiJD
         2SvxvGbhVc3t93RAkgxBmfWG7MZnB1+F0fwATX9Hh/sLBkxi7YasJEs4kzlUxJuXICVC
         yCVe7Xaow6pDKibVpgk+OTZskmzps6uvivoHWclcc9iTx9NqhJwaPBZsCKNFMY3/mez1
         2j85+PzQGS1xIPf1JSHb1TSHGernrNTDBPmWJGeRdhds7wmdSw2eFSub6JD1gQZNy+jw
         VN4GYZo9UCtGEkrZeYDSF008oNzWrcJ8HEusHJxL9DD+MOTiZoZOJw8m45FOyJyFulkj
         zIGw==
X-Gm-Message-State: AOJu0YwsvsLSVKrknWcRBfKGaX3PE9zh3nE0aLPUXGq67x6IwCIsV0XB
	iowj12Ht2le9roUDzHQQ7YR16cdJE/mHY0rySGIakI2rvYt1
X-Google-Smtp-Source: AGHT+IGsXrwBCqoVWtstjwJhjlsKfpN9TausDkFwy0s1K73M40ZHxTjh/TbzOPXiDOlgDEvYdgHnxA==
X-Received: by 2002:a05:6512:2349:b0:52c:a20e:4da4 with SMTP id 2adb3069b0e04-52eb99d6033mr800114e87.57.1720488369651;
        Mon, 08 Jul 2024 18:26:09 -0700 (PDT)
Received: from localhost (ip-005-147-049-005.um06.pools.vodafone-ip.de. [5.147.49.5])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-a780a8562a2sm35458566b.169.2024.07.08.18.26.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jul 2024 18:26:09 -0700 (PDT)
From: Daniel Maslowski <cyrevolt@googlemail.com>
X-Google-Original-From: Daniel Maslowski <cyrevolt@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Daniel Maslowski <cyrevolt@gmail.com>
Subject: [PATCH] riscv/purgatory: align riscv_kernel_entry
Date: Tue,  9 Jul 2024 03:26:06 +0200
Message-Id: <20240709012606.748596-1-cyrevolt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_182612_444569_CA293677 
X-CRM114-Status: UNSURE (   8.36  )
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

When alignment handling is delegated to the kernel, everything must be
word-aligned in purgatory, since the trap handler is then set to the
kexec one. Without the alignment, hitting the exception would
ultimately crash. On other occasions, the kernel's handler would take
care of exceptions.
This has been tested with oreboot and its SBI delegating unaligned
access exceptions and the kernel configured to handle them.

Signed-off-by: Daniel Maslowski <cyrevolt@gmail.com>
---
 arch/riscv/purgatory/entry.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
index 5bcf3af903da..29121650a941 100644
--- a/arch/riscv/purgatory/entry.S
+++ b/arch/riscv/purgatory/entry.S
@@ -34,6 +34,7 @@ SYM_CODE_END(purgatory_start)
 
 .data
 
+.align 4
 SYM_DATA(riscv_kernel_entry, .quad 0)
 
 .end
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
