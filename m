Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F712C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 19:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ziGRdKcRncLfDDiMDjaFSV4Hq6MKJou1SsicfD1w2M=; b=obIBZYqPdesHML
	f2kfOnkEp5yddW43xepUq86aaMT4WjaL2Krj3Y3TY409nqHZwldNZX1Ct2avwwtZbqRcZSdI2aSNQ
	5gnxcSVhNOudiHvxdNe5NtSp0xNduLVH8avn9az3RXdObW6uxhh2YM1Wzank1d2Tub6eCblJ0OUix
	tcXcgzIAnMemGRuIZD42wPzm8h9GZZKAv84mQaFn2Oo/f2UvGnRCQHrebteHN/bpCUPsL+SYvqlAo
	p/6ObHYRUeZNID2O8f61WfyyBZ4kp5ehHF6Gm6bF+Zg7KwYRmAz+9ZACjXZ+nNUSc1mUVZuO3B8b/
	Ofol/4nO0tfeCHz7spnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouIJJ-00DBRM-2w; Sun, 13 Nov 2022 19:06:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouIJF-00DBPW-Hd
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 19:06:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D8A28B80B8A;
	Sun, 13 Nov 2022 19:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57011C433C1;
	Sun, 13 Nov 2022 19:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668366382;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scbQiPppeFY+WNjHB/TuAbIHqo/c9VSVKAxTrTA0eMgS+TcCA6xDcmPndA9fIag+1
	 z8g2o+8Xc5ysxibiMhYD+NjGVuBPGbsul8IlM1arDv6eGNvx+q0Dg3jfzy/nJdPJq/
	 NmH1fCyJz5udzOMfRB0FA1C6URw7BNNBe4WmRbBe9fI7ygk9AOhJPHaux5kdLrun2g
	 X5vsHaOW7Ot2XHJpm0U1uLAsiXV8beIByM58Bp5wJiELKESrKPwQ3b7/pLG8ig28wC
	 yOQhEeesw2uzR/7ip2YJO7zulGP2NCqFpdl6xWXhiSJhnhlVyJQ+5lmmxGhvvK3YGq
	 4wNISndrSHw6Q==
Date: Sun, 13 Nov 2022 19:06:17 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 3/7] RISC-V: add U-type imm parsing to parse_asm header
Message-ID: <Y3FAKVyuBasCtv+0@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110164924.529386-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_110625_739689_F8490D2C 
X-CRM114-Status: UNSURE (   5.38  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
