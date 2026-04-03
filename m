Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DA8D730BC
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 08:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Avfunulk6zMrX0s5Um5UivEHHfXKYNVVhhyOc0U4t8A=; b=pYrFG1rFiPGssc
	9/Kp8xQNWFYdJZSDkwEm8xAIF4U+qB6ig+LHMYw0RzjWRjP3yqTzmSf5C27048tPhDtIPMObon+TX
	9m8QYAGmwsIWVnhe7uxPR32eBMWrAn0u6cUnl2p6jydIrd5eyKFodCHpkQiz+b6mCVWE9joDqq5sh
	DzJSDN5TKKnUaskdZg3NStfCA1xWWUvimQU9/HWOv2hXjFGdPeq/chRqJf3PKD+u75hAenjgpsZ18
	QFwaWAwgeC3Sc94dXIBFu2ZtoGJXv6otHahbS7irjXYzp4gznlO7iDTAfc+vANquQEZZOihRH9xTN
	US+jIQpIXeDkBKkuIIaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZbQ-00000001gNg-2OCL;
	Fri, 03 Apr 2026 08:10:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8ZbP-00000001gNZ-1ABF
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 08:10:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 453A660008;
	Fri,  3 Apr 2026 08:10:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C37EC4CEF7;
	Fri,  3 Apr 2026 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775203802;
	bh=5TS+OLSWlTmHL05fil1uTTKrZLSNnFzINSStMd9c/Ko=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qCOOxccSLGmdfPkVgbDyWzJcy36FTlQ0vtsuQhQb47CX1N4ImAXjv/s/Ser/pojCy
	 ugPcfihJsiL4RGr619IOq9DSAkqMGlQb+Qc67XQMQ7ZNlPXCcWN7C9IH4ehfBZtTyd
	 GAEmaURXrovAScR+GjO9JHNImWEiKwbhap/u43YjvQ6RsMv8QJXHb7mXBpMZKe+2N5
	 HIvb6XW9WMUS/Zh9GqoNRE6OvT9GRcUFwxv1RISGo/4otSBWRr2155YBBL5l+TCTXA
	 wLD0wSymuGni5T/jDRGEfACTusO4zx2RYlrHu5PsrpGJX2DGfbr5mTju49uCsq+1sD
	 zlIFsrUzEmPfQ==
Date: Fri, 3 Apr 2026 02:10:00 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Chen Pei <cp0613@linux.alibaba.com>
cc: pjw@kernel.org, alex@ghiti.fr, debug@rivosinc.com, guoren@kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] riscv: vdso_cfi build cleanup improvements
In-Reply-To: <20260320021850.1877-1-cp0613@linux.alibaba.com>
Message-ID: <ce4db969-2b89-11da-5932-12b4765b02d6@kernel.org>
References: <20260320021850.1877-1-cp0613@linux.alibaba.com>
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

On Fri, 20 Mar 2026, cp0613@linux.alibaba.com wrote:

> From: Chen Pei <cp0613@linux.alibaba.com>
> 
> This patch series addresses two issues with the RISC-V VDSO CFI build:
> 
> 1. Build artifacts were not cleaned properly during 'make clean'
> 2. Copied source files were being tracked by git
> 
> The first patch adds the clean-files variable to ensure that temporary
> source files copied from the main vdso directory are removed during
> make clean.
> 
> The second patch adds a .gitignore file to prevent git from tracking
> build artifacts and copied source files in the vdso_cfi build directory.
> 
> These changes improve the build system hygiene and maintain clean
> working directories for developers working with CFI support.

Thanks, queued for v7.1.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
