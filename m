Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43016C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=do/1V0Frb7ADtMft4q2jHSEQ9FpFerh1a3TSKNUW9SA=; b=tqB+laMOUDeWKK
	wIjQYHJsBLbz9Ci1WHXjZLElWxs7JxvvYSxCPsoFPHPCVgXqDiYB7OYmU77h3dFIlzksxVji/8HPz
	+7aEoRqmldIQHswvalx3vawKWk7TnrGZKvhStf8WaqzGmBwmPTyxHkldwDDHrc3P+eZKmjL2qg2/p
	U5nDTjGykTqZfOG8KohnH3QvQNRqpxqqdv6j2asT3BZQMczSo/9CLc8y8AUzyFTmDGwn1rdcIuyrL
	Cv57Qd6J8JVY3z3dxNPmj4KN9xR3s4+smVq1LbXm1VhoL03vm952WzIenFdetImkAN5msdI2yC7PZ
	fnx//iVOm+qhUTZ+u/eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3RwF-00HMsB-Ve; Fri, 09 Dec 2022 01:12:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3RwD-00HMlF-MB
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:12:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CD06DCE277A;
	Fri,  9 Dec 2022 01:12:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04F9FC433F2;
	Fri,  9 Dec 2022 01:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670548342;
	bh=Q37W1vLJUGba/GKJcAqRPtnLC0ooux4QhJ6D99IJvhs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ZI661ixsVRMEo2OEh2JptvfA43/sySTL9PIV5OGjqqz8AXWluQyKtbzcL7VzvqpA6
	 tDzRF+77RWwnHY1u2wgaGEAze1zzKKeVs/I+dPCp6t8UU/uEUnkuCMVEE6aRwU6YnQ
	 mLnNQxauxZhpj817bP0+qn9KlAzxQRNWqW95ZkGuKPiUVpuqoE0jxJqsz7hxxDxKFg
	 DhGyx1E5dviHdq1EW9Ct5XCg/6U0sHJ5sOQhksFy9Y98gAa0m1/QhibqTW5q6E5oGG
	 YwgUuAMVlJ171/Y8Bf925ON8M1wRd3QC/eyUBtWXiXdgMIzisI8pIR04JBNF8Ho0xP
	 gQgjYVhBy15tQ==
MIME-Version: 1.0
In-Reply-To: <20221123161921.81195-1-conor@kernel.org>
References: <20221123161921.81195-1-conor@kernel.org>
Subject: Re: [PATCH] clk: microchip: enable the MPFS clk driver by default if SOC_MICROCHIP_POLARFIRE
From: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
To: Claudiu Beznea <claudiu.beznea@microchip.com>, Conor Dooley <conor@kernel.org>
Date: Thu, 08 Dec 2022 17:12:19 -0800
User-Agent: alot/0.10
Message-Id: <20221209011222.04F9FC433F2@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_171229_921838_47B11677 
X-CRM114-Status: UNSURE (   8.37  )
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

Quoting Conor Dooley (2022-11-23 08:19:22)
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> With the intent of removing driver selects from Kconfig.socs in
> arch/riscv, essential drivers that were being selected there could
> instead by enabled by defaulting them to the value of the SoC's Kconfig
> symbol.
> 
> Do so here & drop the depend on RISC-V - the SOC_ symbols are only
> defined there anyway.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---

Applied to clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
