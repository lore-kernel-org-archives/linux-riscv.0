Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43763CD4F3E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 05:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giGZ6UO/R/axpKAy/bjmWCvgi5vwPno32R9NKw2L3yA=; b=CVJIvdHAA/fHOk9nn2bLEze6tZ
	HXKXxsUPktX22QOAkVppvI4w/I+T81/ojfRzfGLznwpjIF8H3XsZ3HqS9LxiE8Px+0P3zFowaomeT
	fzzPVZEXRpTE8+9jhgy/cazV5et7sW1ghfEUdFPqaF20AZLyQXoLjBYAHPUaSRbzvmx53JPu0vQy2
	2+ML4I3+swTzkAIhK63frnc2IDXLMUlkFMLUzrwacGN+WzrFz0YUMBaYvcTI62SsAks2IabiLeADH
	iic0Qh1Y3BwifKFqFH6rvhm/BbsHtaGJV9Z0y6y7dKvgTOZXGaRBFbTMsuIDWXGPjDCagTCDNYRsf
	FbEzRq3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKV6o-0000000ENNu-0HGe;
	Sun, 16 Nov 2025 05:15:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKV6l-0000000ENNZ-0TMn
	for linux-riscv@lists.infradead.org;
	Sun, 16 Nov 2025 05:15:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4809C41B0F;
	Sun, 16 Nov 2025 05:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60650C4CEF1;
	Sun, 16 Nov 2025 05:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763270123;
	bh=dNLCN4xzJHk6Kx1G6l5URc9pyC3bZpgJBBPCsARSj6Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=M6KRXOcmL+/wOdSVNdXiMq4a4HDT9N0DqU6tYhh8DHBFVX78uJTwZma0RQaT/wTEV
	 CHCXSCfQISc36CNhW/iyZuqXcUARA/4TCQXHewebZK+TGMQ8iCi0FUTExYdOdalRLm
	 gVqEwEjZXvZrY+PlxVimT5yfud7vuPLqKbkVrP90WBWQNx+bhM3HIdmoLuPtfRe1Zz
	 xNW2Tr3S8Hk0QnHXhHrufe8LOGG0VpIV/dSDyiTaR2jX+mGKYQnN6GVxvsaaq1A1wL
	 KDgx0NCNJK1El2U5FdG5s1NYbw10Zs2QoCqtgOLNOBfTSX0sJdiV+TWZZrjpzI1nUY
	 BzZf0XF7hihiA==
Date: Sat, 15 Nov 2025 22:15:19 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: =?GB2312?B?0O280b+t?= <xujiakai2025@iscas.ac.cn>, 
    Nathan Chancellor <nathan@kernel.org>
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
    Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    namcao@linutronix.de
Subject: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building with
 Clang
In-Reply-To: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
Message-ID: <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1421703746-1763269127=:3638584"
Content-ID: <b19f0960-97de-1ef5-4216-eb950287f71a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_211527_174048_C2255B1F 
X-CRM114-Status: GOOD (  12.17  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1421703746-1763269127=:3638584
Content-Type: text/plain; CHARSET=GB2312
Content-Transfer-Encoding: 8BIT
Content-ID: <1ff382db-44ce-50a3-d880-c25b51849d02@kernel.org>

+ Nam Cao, Nathan Chancellor 

On Thu, 13 Nov 2025, Ðí¼Ñ¿­ wrote:

> Clang misaligns the test_kprobes_addresses and test_kprobes_functions
> arrays, or does not export local labels by default. Both can cause
> kmalloc_array() allocation errors and KUnit failures.
> 
> This patch fixes the issue by:
> - Adding .section .rodata to explicitly place arrays in the read-only data segment.
> - Adding .align 3 to align arrays to 8 bytes.
> - Adding .globl to probe labels to ensure symbols are visible.
> 
> For detailed debug and analysis, see:
> https://github.com/j1akai/temp/blob/main/20251113/readme.md
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>

Hello Jiakai Xu,

Thanks for the patch.  Have you reported this difference in behavior to 
the Clang/LLVM folks so they can render an opinion on it?  We can consider 
this as a short term workaround if it's indeed a toolchain issue, but I'd 
like to hear from the LLVM folks.

Also: could you please include the narrative from your page 

    https://github.com/j1akai/temp/blob/main/20251113/readme.md 

in the patch description, just in case that URL eventually becomes 
unavailable?

thanks,


- Paul
--8323329-1421703746-1763269127=:3638584
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1421703746-1763269127=:3638584--

