Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1E3EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 07:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cx8C0GSz/eTX7vU9TUZX1KZ3AVYBROW62Tp7CQlFEdE=; b=IeAU7euifcWRA+
	xh8MGLVKw/FHv+qeAfDe87jOl2+ji9+4s6P7Ga5iMNrs0i5wkHTJVaRt998Pf5H8kN9h+fKDv/loK
	T3nK+W/+PBn47ad8SUk6mArcy1EidsMWDczN0Bmv4SvO4G+lvbgshsmTOcpwbfIz6BFdTtOUAtJyP
	zZzlM3R2Zth6/lkLujrzVMseIAU1iSMSztE8XodcTXgZ0W/tfbuc5vMoYbesyGgYlYsV8cnBIl3B9
	HyyJP79jnPfinNNe1dBJR0FVzW3w+m79qhrn+bLsHxMQKykIGTJStReXoAIZJWnY0mCcs4UH6a59g
	CFDmu/mjXGQfFyTsXPrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hXO-00E2HC-2v;
	Thu, 15 Jun 2023 07:36:58 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9hXM-00E2Ed-0q
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 07:36:57 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 8CAC2223B2;
	Thu, 15 Jun 2023 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1686814612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mNKNRzgrkQfqOq8GTGe9odKYtIpMuAwcvj9zeiuqgw=;
	b=Lu8WGmF85lTLuhf5Gyy3Yo5wo0x0osKeUw+ji8hm68oDiiHp8xzEYhzNjgUDvPAtNFtZbl
	L3OPxe2EWc76ocU3E6In49ZpwBYkPXtkFXkZAbwocmewhrLDCK1D5sPqHgpyqP2g1Zz5YH
	RpAiG7e/Wfd25vCKyWrMEEhvOwgTLBM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686814612;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mNKNRzgrkQfqOq8GTGe9odKYtIpMuAwcvj9zeiuqgw=;
	b=vjBv/v3Z+RpYnN8Hx46rPshftjifDI2uhymBnnTN2V1ayq7u9EPO4luNWSHxWHwJ6wDf+j
	yD8RN6TIfRNYuVAQ==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 4A2322C141;
	Thu, 15 Jun 2023 07:36:51 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 38C684A037D; Thu, 15 Jun 2023 09:36:51 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  jszhang@kernel.org,  ajones@ventanamicro.com,
  conor.dooley@microchip.com,  aou@eecs.berkeley.edu,  palmer@dabbelt.com,
  paul.walmsley@sifive.com,  greentime.hu@sifive.com,  zong.li@sifive.com,
  nylon7717@gmail.com
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
In-Reply-To: <20230615072302.25638-1-nylon.chen@sifive.com> (Nylon Chen's
	message of "Thu, 15 Jun 2023 15:23:02 +0800")
References: <20230615072302.25638-1-nylon.chen@sifive.com>
X-Yow: ...PENGUINS are floating by...
Date: Thu, 15 Jun 2023 09:36:51 +0200
Message-ID: <mvm5y7p41nw.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_003656_467265_F078B6E5 
X-CRM114-Status: UNSURE (   4.57  )
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

On Jun 15 2023, Nylon Chen wrote:

> Fix the 'unsupported relocation type' error caused by
> enabling the -fasynchronous-unwind-tables flag,
> which generates relocation types that are not supported.

arch/riscv/Makefile has
KBUILD_CFLAGS += -fno-asynchronous-unwind-tables -fno-unwind-tables

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
