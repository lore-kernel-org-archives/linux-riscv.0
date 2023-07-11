Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D026CEB64DC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 16:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9mR2mkRTxyQJIlAr7anifRvEn000JtdfWgUowzNMlY=; b=sZ85eiu6vvYVlJ
	XF/ilB3cR+ku5yCNsdiamluCa8EwtjQQcM681jlrueo4OyyaKQgSBSWavD920L59Q+aRDug+wDj0n
	yfwcHFS+3k7TPe24XX6721JdK4b6dSdrv7m4/v8tuQUT3XGgcGVWBtnJeFv1TJBRW+KyKYJbiUWLd
	SuJdviO3exNZ9mcVj01V6fSQ6aphRvw12rLWkFR5iuPwsdoKxXXgXq3K7meBwfdBeub/0Rzebf/Vx
	EYPr+qQ8bE1Mlw2+Ec/lkif5qlF0rMxsyMkl7ekQ++p2ZI3R2TUrEHlfpcDOk1e8q7sXH9xQu1Z5l
	xIMZ8VRM6ijbcbg7GXTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGTT-00FQpP-26;
	Tue, 11 Jul 2023 16:44:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJGTQ-00FQoH-22
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 16:44:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28BAD61561;
	Tue, 11 Jul 2023 16:44:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE5EC433C9;
	Tue, 11 Jul 2023 16:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689093863;
	bh=adoK2M7+Iw3xoZDKLtXMLqYtn1O0kZbvZVoFdeAYFf4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=tdSh7uqWFLHuZmtD8XxRzyFtsSP3JQ94pY6e4dpKC2uQopQZc8X2O/iCGToLP7/Nd
	 y7kTcShrjtZ1466kFofnsefZd+Z5jM1T6CkdaJTVVuc4PcTnkrWLFIKyjaUeJ2ncqP
	 sPtuwwgrMFy6Nf09HwNPdGu1Uv4wbLMw0RLCgRuweIr0eul67pwkW8dhz9U23usFro
	 zS/ph8JpPpoIOQVsKeFEZjQhsNtEcSEYYSu9uA7w+hA13voWNt2aDDCX4WS6A/RoCB
	 vQHmqYR3i78M4NQEHBlsLur7CVCCVBleKZU9/G0wq9W7zkVwamdhs8DrIMdAfLbpOK
	 x1FfP8XtMbpig==
From: Vinod Koul <vkoul@kernel.org>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, 
 radhey.shyam.pandey@amd.com, dmaengine@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>
In-Reply-To: <20230531090141.23546-1-zong.li@sifive.com>
References: <20230531090141.23546-1-zong.li@sifive.com>
Subject: Re: [PATCH v3] dmaengine: xilinx: dma: remove arch dependency
Message-Id: <168909386029.208679.18311531305885032641.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 22:14:20 +0530
MIME-Version: 1.0
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_094424_713950_13640A0E 
X-CRM114-Status: UNSURE (   6.99  )
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


On Wed, 31 May 2023 09:01:41 +0000, Zong Li wrote:
> As following patches, xilinx dma is also now architecture agnostic,
> and it can be compiled for several architectures. We have verified the
> CDMA on RISC-V platform, let's remove the ARCH dependency list instead
> of adding new ARCH.
> 
> To avoid breaking the s390 build, add a dependency on HAS_IOMEM.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: xilinx: dma: remove arch dependency
      commit: 9945a80fe40886f2d0655c0c3cdee95aaecafb87

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
