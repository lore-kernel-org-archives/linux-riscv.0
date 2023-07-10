Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1296EEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 19:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeKifOpkIhc6hEFi+Le6eVtg2b2oqJ2w7SIcv/Q06o8=; b=PAo9CykPReRkls
	/gVHc/uSn7h5XzNhRiiYo0rHDCPDFoIEG+jy86V/xBm/T9zFVFmRktTzigs2Km16KuakpGnYLH4IP
	KbpsLlSsa/M8rx25H3OD/sClTpglq/QgYsmczp8YrwjPOoaEb6A+i4pIX/HaReCA1DRqyO3fv2Q5F
	NYbd1uMb7/13GowY/WxsbB+AVlWtzOhRWPCgI/EY9bbk9Ou0uleNtEHaeynvfcbrFxHXnlNDUmMIg
	fbAD0rQ+4AaHSjp+SF7lfQUuxZAOpDK0v0oWfqcscGS2S2POy/grmBwscbPKbmbNaiHvnvN31aSMA
	FLADaQVx5CKxenyKNFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwpX-00CaVI-1y;
	Mon, 10 Jul 2023 19:45:55 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1qIwpW-00CaUu-1g;
	Mon, 10 Jul 2023 19:45:54 +0000
Date: Mon, 10 Jul 2023 12:45:54 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: rdunlap@infradead.org, thomas@t-8ch.de, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] module: Ignore RISC-V mapping symbols too
Message-ID: <ZKxf8jK8m+073rBE@bombadil.infradead.org>
References: <20230707160051.2305-2-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230707160051.2305-2-palmer@rivosinc.com>
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

On Fri, Jul 07, 2023 at 09:00:51AM -0700, Palmer Dabbelt wrote:
> RISC-V has an extended form of mapping symbols that we use to encode
> the ISA when it changes in the middle of an ELF.  This trips up modpost
> as a build failure, I haven't yet verified it yet but I believe the
> kallsyms difference should result in stacks looking sane again.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/all/9d9e2902-5489-4bf0-d9cb-556c8e5d71c2@infradead.org/
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks, applied and pushed!

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
