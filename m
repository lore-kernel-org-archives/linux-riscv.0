Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D07C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 17:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BkF/joCOJzC497EvRJcYw9siXcH2EVCjGFox1KtvWKQ=; b=d//Rj32PbqHy9r
	0Q+qRMQCMvInjW+6zwY8e94YvoQx7I866CHCnluCRnnaBbIGAXbvzir2RJk2SXW9jVr1KlcAk1nt2
	siQ5KK2VBZFIrwV4riRrngmE5CzhviJVyKxsJ/Ca1lw6w8Ow8XmJquhqgSVePT34JGffZNZET63bI
	GMJIpbwfvc/ZYy+s+21MLPjSH+6Z9suiAYZ2QSNuqwJCPD6qSHZCdCN7jINBjbvbLHYlPeLXJWQFn
	GaNyMBT3N5xBesdz4P4V0o5Rp1wM6tcIhhZDiH8XcyhmzGxGyoTRYRTzwyfHvcAb6WbJ/p/wc22n8
	/1ngQjjfy+SrbjZTjlKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6If-00GvdN-Eu; Mon, 07 Nov 2022 17:52:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os6Hp-00Gv8p-Fk
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 17:51:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7517F60EC0;
	Mon,  7 Nov 2022 17:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75EFC433D6;
	Mon,  7 Nov 2022 17:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667843511;
	bh=4UU7R5xt/AtOkizC3oO21TyvSGXzZpcNUYWl/Dq2IAU=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=dleOm0uekrwWe4ql1vnB4tpwh2jViPLEixEbp24uuS5V/xmRdo14bF1if8+H1iJW5
	 WvNU4rucn5ZWi9F2DMDfLeVS6Qy+O+Mqa7kzAR+LIVEoqQtnh5hJTHjKlfiDJw9XeB
	 LQzXdGWCB2/I/a+rNqDES1zgPG3Gk2bt4cto+6XBiZqyL7w2cJBqeQVYekuE0b62W5
	 IbYpv6EEMETizVJTxaBZIJHpfTI4zjok5L4loXaiwISX0ZXUGAukWFnoEZ8EWDSdIA
	 swO1qyLKxVEQJKCcEoveI8YMuFkyitmHo0v5A8AbmkbAcs+MlGGhXgJ+ON8REKWG5t
	 sIrpKHfqS2Ruw==
Message-ID: <882e75f9-dc96-4084-a64b-ace4246c88ff@kernel.org>
Date: Mon, 7 Nov 2022 18:51:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Should we merge arch/riscv/boot/dts via the SOC tree?
To: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Conor Dooley <conor@kernel.org>, kernel@esmil.dk
Cc: masahiroy@kernel.org, mkl@pengutronix.de, davem@davemloft.net,
 linux-riscv@lists.infradead.org, soc@kernel.org
References: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <mhng-e4210f56-fcc3-4db8-abdb-d43b3ebe695d@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_095153_624435_D00B90B1 
X-CRM114-Status: GOOD (  25.57  )
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

On 07/11/2022 17:46, Palmer Dabbelt wrote:
> This has come up a bunch of times, but I don't think we've ever really
> made a decision.  Historically that's not been such a big deal because
> the RISC-V device trees were pretty inactive, but that's changed -- both
> because Conor has been cleaning everything up, and also because there's
> a bunch of SOCs showing up with RISC-V cores in them.  We talked about
> this again at plumbers a few times, but Arnd wasn't around it person so
> I figured it's best to just start an email thread and see how people
> feel.
> 
> A lot of these new SOCs are based on Arm designs and the device trees
> very much reflect that, so it makes sense to me to just keep the device
> tree merges via as similar a path as possible.  

Recent Renesas r9a07g043 (sharing between arm64 and riscv) is example of
that. If changes to them start coming via different trees, we might have
a lot of conflicts.

> IIUC that happens via
> the SOC tree these days, so it makes sense to me that we start handling
> the RISC-V device trees that way as well.  That would make things easier
> for contributors, as they'll have one workflow for all their SOCs, but
> also easier for me as a lot of this SOC stuff touches bits I really
> don't understand and thus get kind of lost trying to review.
> 
> Arnd: looks like you're handling most of the merges these days so this
> would be increasing your workload.  I feel kind of bad just dumping a
> bunch of stuff on you, but I think at least now the RISC-V DTS are in
> reasonable shape so hopefully it's not that bad.  It'd certainly help
> things on my end, and I'm happy to try and re-direct some of that saved
> time to helping out in SOC land but I'm not sure how well that'd work
> out in practice as I'm pretty buried.
> 
> On a somewhat related note, Conor has offered to pick up the otherwise
> unmaintained RISC-V SOCs.  That's sort of its own discussion, but if we
> change over to the SOC tree we might as well just do everything at the
> same time.
> 

On the other hand MIPS DTS is not coming via SoC tree, so there is no
yet such wide approach.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
