Return-Path: <SRS0=1PsB=SP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4200CC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:55:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1086120869
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 13 Apr 2019 07:55:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrLRSrvc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1086120869
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZyQqLMykI/tWwfrx49MTnUMwGHstxRpQARN4zHTlP+4=; b=jrLRSrvcb6NY+6
	+EvfGc9c0y79Cl+cR2unwJQZL29muH+Y72SiNaNgEUN+4GvVoz8TFWLv01u4Uqxoc6/2Qbz62wNiX
	hPzHN+UV4+Clk1M4R2rTsudYcQtsApycpbjfBzvNTclNcuUOCyG4xBFd5tg1hiXmx8ZGTaDcKurd3
	BITMFF/i7gp5lUzU6ywx/QCOX75aeVHb6sQGpwjkTzj8ra/nW2KUi1HLhR/6+pGTNqjacapVpeHn+
	ywVE0+Zj3RQ1JrYQ4BEmemZhiI5E6/k2Ay8wTfbHbIRjzJaW82UVjQnLXSx7QDBVcUfmlS4xr/LX+
	byPAWGqs0OrmsRHcg0TA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFDVt-0000xh-Kt; Sat, 13 Apr 2019 07:55:49 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hFDVs-0000xN-60; Sat, 13 Apr 2019 07:55:48 +0000
Date: Sat, 13 Apr 2019 00:55:48 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Anup Patel <Anup.Patel@wdc.com>
Subject: Re: [PATCH 3/3] RISC-V: Access CSRs using CSR numbers
Message-ID: <20190413075548.GC30428@infradead.org>
References: <20190413073906.53676-1-anup.patel@wdc.com>
 <20190413073906.53676-4-anup.patel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190413073906.53676-4-anup.patel@wdc.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Apr 13, 2019 at 07:39:44AM +0000, Anup Patel wrote:
> We should prefer accessing CSRs using their CSR numbers because:
> 1. It compiles fine with older toolchains.
> 2. We can use latest CSR names in #define macro names of CSR numbers
>    as-per RISC-V spec.
> 3. We can access newly added CSRs even if toolchain does not recognize
>    newly addes CSRs by name.

This looks mostly fine, but also please remove all the comments
regarding using sptbr instead of satp now that they are not true
anymore.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
