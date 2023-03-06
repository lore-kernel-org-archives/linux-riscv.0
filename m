Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B53C64EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Mar 2023 22:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzovbwA3+4KF6z8cV+X8ksL2RKMFUs797Zi55usmFh4=; b=qRBpJmJoFrhens
	jlzNK6lwZ1cTfB4HtTiOtZ3tPKIuqei0oG5TXhdNtgGZ4n2UKhJ0c/Qn8V+NbEurzDJ48Q5esPheH
	WI+ieQFPg4xWGhZJAvzQvH0DT9haeUX0atvvNEjjcZW0J9somZMVEiTrJoC/1A/OedTwbQBRyeVd2
	q60Nsupu/Kup7DVU3wfGsg3RbglWSjCKZr/iOf+pE98eiE5kx46ASStiIvhfer26njtAPJJSZmUDp
	GqAbhMIwqKXP4RigBsOEmqhMdDBg2uy7DWcXyhGnLpdyfSvMGGAtkKLP8lKkFV/W3445sFYZAp7B/
	umpWDCqFEYnsRa6zZCHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJW9-00FJr0-Bc; Mon, 06 Mar 2023 22:41:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZJW7-00FJqT-1c
	for linux-riscv@lists.infradead.org; Mon, 06 Mar 2023 22:41:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9996160F79;
	Mon,  6 Mar 2023 22:41:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02359C433D2;
	Mon,  6 Mar 2023 22:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678142474;
	bh=u9uGh4pi784kK/BdrEWdlErP4vljBHvgMSyzioqQplY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Ip9f8Hne+4n32QOvIfj1Q0VWOEfjj+Gv9Xt56nJ7n6E/U7BB6ipsGjQLEkUrkKBH5
	 X8z6Iv/4C1kyrGgImFAWZ4PP1REHhRD9BKCE2UDsHMmMVndKqMEx7JlU/0xekKNkmh
	 1snJPo9fNXmEwb1RsocN7MDmaX6fGXI2xpQR283vJLIbN7IU2qjLpZmZIPfKy0tZPo
	 qNZlLibu9fYBGeO5qnLyaExJtdFY5xc4br6yReOc/06Uc3xKIK59jWwMLmeKC8TXV7
	 8TBaql55HOU8Iyj0vUMCLTNr4AfjUuRRY8qX+hJqdojw3WqyNAG6mCsx1OEgeMJus9
	 jfKdEk6H62jfA==
Message-ID: <774cb6d15fef0e0b41e7a071eedef980.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230301002657.352637-2-Mr.Bossman075@gmail.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com> <20230301002657.352637-2-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v3 1/3] clk: k210: remove an implicit 64-bit division
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <Mr.Bossman075@gmail.com>, Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>, Michael Turquette <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, kernel test robot <lkp@intel.com>
To: Jesse Taube <mr.bossman075@gmail.com>, linux-riscv@lists.infradead.org
Date: Mon, 06 Mar 2023 14:41:11 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_144115_142765_D9393282 
X-CRM114-Status: UNSURE (   8.84  )
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

Quoting Jesse Taube (2023-02-28 16:26:55)
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The K210 clock driver depends on SOC_CANAAN, which is only selectable
> when !MMU on RISC-V. !MMU is not possible on 32-bit yet, but patches
> have been sent for its enabling. The kernel test robot reported this
> implicit 64-bit division there.
> 
> Replace the implicit division with an explicit one.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/linux-riscv/202301201538.zNlqgE4L-lkp@intel.com/
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---

Seems better to merge this one-liner earlier to unblock 32-bit.

Applied to clk-fixes

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
