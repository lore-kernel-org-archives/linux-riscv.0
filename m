Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B343DFF885C
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 06:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u0gBlUVyOtEzI2kobF8NMBi9jiwzQUXCd8BaxP6tfHE=; b=I676rQS5FOH6zZ
	638mGHP5E0jKqMEJnfJlPSg8plxcw75zsmTWUc3p60qk2VbkNrfiEzB3T06K5wknJoJWzPAnWZYgu
	MlVSOwmSoJAx70JxL/lqjwQJqi/4lbDGclNWSPYiUlF1zSRElHm03oggcGCRkVjwzpXw0/oCs85et
	pS+2CC5BucgY29R0bvRcjZhxNeH2nD81tsNFqfWdp+q4MPhfJ2yFHzxECN1AgF7NDiDQCwaXF5SXW
	AQIrY3Wdr/RcvsFgaiqOXFgfaO3AluSOd3sh2BnkoWaWdQVFG5AoNP5H2ZQ7Put4cyZLfS/E3Zpsj
	jUIZJCa5RbifUUSKHJug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWZ5-0000000E7yM-2neJ;
	Sat, 25 Apr 2026 06:32:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGWZ4-0000000E7yD-0ILr
	for linux-riscv@lists.infradead.org;
	Sat, 25 Apr 2026 06:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B833F60052;
	Sat, 25 Apr 2026 06:32:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6669C2BCB0;
	Sat, 25 Apr 2026 06:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777098748;
	bh=D++1y5R2jalXhoi+WiSUbNLgGIrGk7orO6+SKMpDukg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mBW9X4eAbQOYPZcW40l4zQAIqew5QGz3be1qjlmF2Y+mV2tUnwOiXr9h5VuhlBERz
	 B9yYP3wFQHwDpn2expIhNuCmcO9p7a/lDTEo1cPcN1xxcDpMF/t+EB1tDnI1zbqIAS
	 OsBRbpSCvk5hBA3Qo1YhBuAzFk0K6lMfCpGLYzbsgbwf4ca2mA2z5NxMWjiKKRNG0x
	 M1oau4MAoZoAQrSS/Iry1zAmpP5AH9Z6a4+o14tZVeiKId29IV5Dv/ysEUeZ1dMqc9
	 KzoopkPTqPz/jKVcF/M82pRaRFtFuM33NtWFHvRFaOID5SL/XjVhi4TitlDxTcGFqf
	 ZMdEXfEDJZ+rQ==
From: Guo Ren <guoren@kernel.org>
To: wangruikang@iscas.ac.cn
Cc: alex@ghiti.fr,
	gaohan@iscas.ac.cn,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: Re: [PATCH] riscv: mm: Do not probe satp mode limit if known in FDT
Date: Sat, 25 Apr 2026 06:32:23 +0000
Message-ID: <20260425063223.3329222-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <0e139862-d41b-4b46-92f6-a1eb5bffc863@iscas.ac.cn>
References: <0e139862-d41b-4b46-92f6-a1eb5bffc863@iscas.ac.cn>
MIME-Version: 1.0
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

> Sorry for the trouble, it seems that some miscommunication has occurred.
> While I was able to reproduce this problem in an emulator, I do not have
> access to this hardware and had misunderstood the context and the nature
> of this platform.

I also found this issue in QEMU. It can be easily reproduced with the
following modification:

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a1c323e66d..8c1d92c8dd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -100,7 +100,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
-    [VIRT_DRAM] =         { 0x80000000,           0x0 },
+    [VIRT_DRAM] =         { 0x800000000000,           0x0 },
 };

Best Regards
  GUO Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
