Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E759D1CDA0
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 05:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mgZdg9FmS29SUgVlF5LxmDv1P1i14sXODx5aqu6dzI=; b=sdfRtepA+mkzAB
	n4kmX5Frgf9q20MpA18EChXBglvTXCCULtc8B1+ntXzT+cl6xUT8jPygQeeKqD7dWeqky1I0pXKdQ
	O2Ve5XqDLbMlLgNgXV25g94sFDUAPJWR0e52u8J1ciCpS/C3HlgDLgkXC56vmrMYudbalo2/Ypd1p
	CMgF6dww0BkJ3cbkHEQBYynuB+XML9xZBNMKD4kXozrJuUW+W8YnXPZob8ReAk0QGOXrZ81uwtPv0
	xRNWV+ICUNjC6K/Z/glKE+FOVB/nCE7FgkIDdP6CSGUYxld1X2vHqZGaRmpbLcepN9+Ny5v475T35
	qjPFf1rDLPfQRaQYdQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t37cu-00000009geT-45wI;
	Tue, 22 Oct 2024 05:40:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t37Vw-00000009fE2-1ewH;
	Tue, 22 Oct 2024 05:33:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 484DE5C5BF5;
	Tue, 22 Oct 2024 05:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23829C4CEC3;
	Tue, 22 Oct 2024 05:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729575183;
	bh=DqPOw5Afx12BpuzF6xGu5Io93p3y6bip4Gvpl3L7H6k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=TqO9CuC7N7TpT4tpOx92kXJM76C3MzBenpDiuzwPEnz18DnJgNovrbdTVHe1Qys0M
	 CpAfzbiu8BfNoRoOoRE92v9eIzY+W2rAfNvWU79IuOLvma/aB+xG3xmfzNfjY4+HwK
	 JW7QsFI4GYTale/cZx9XVCtTdpXYLNcvP6zPvcgGTu9awlbdz46XyCCIVzjo9Ew+HO
	 G8Tc4a/odoHjZt1uC3tdzCtGkkuiRm3cRcl0XyXCGR5bSegBr/fltepqiIR1d5ioYd
	 OKd2aK2Rcjp34sgl8dRFJBc/nEOnc1Mh34v+NQy7LixO85mLL8fEjwqoUQRe853M4L
	 zSXwhUAry2ctA==
From: Vinod Koul <vkoul@kernel.org>
To: paul.walmsley@sifive.com, samuel.holland@sifive.com, 
 michal.simek@amd.com, Yan Zhen <yanzhen@vivo.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 opensource.kernel@vivo.com
In-Reply-To: <20240918034114.860132-1-yanzhen@vivo.com>
References: <20240918034114.860132-1-yanzhen@vivo.com>
Subject: Re: [PATCH v1] dma: fix typo in the comment
Message-Id: <172957518103.489113.3611474825352477788.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 11:03:01 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_223304_511140_F8E54EDE 
X-CRM114-Status: UNSURE (   6.17  )
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


On Wed, 18 Sep 2024 11:41:14 +0800, Yan Zhen wrote:
> Correctly spelled comments make it easier for the reader to understand
> the code.
> 
> Replace 'enngine' with 'engine' in the comment &
> replace 'trascatioin' with 'transaction' in the comment &
> replace 'descripter' with 'descriptor' in the comment &
> replace 'descritpor' with 'descriptor' in the comment &
> replace 'rgisters' with 'registers' in the comment.
> 
> [...]

Applied, thanks!

[1/1] dma: fix typo in the comment
      commit: 39d283d146922a266e8196e7fd29b31feff528be

Best regards,
-- 
~Vinod



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
