Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7293BEE14AA
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Sep 2023 21:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LA2+9HEhkTfy/blx/1rDDg+d2QVOKAnpTIgV9yXyKgc=; b=qiYtFyQz5ggq9L
	UplV1t7KV7y5aczEdFkl3yWx6Bln2Jj6zBRoGTp9UU4vRfRezAT12+UptvKCuw74Aq+osKWoT3RsT
	1NTk/L+UjXKTPSvhsQABHHy2HdFanoNSaTk8KHnIQGZbQLJj8L5HoCbrC2EYsDUajpnk48e/DUgQL
	c7JB4pEYH4Ky4IKRWyhY2XoFbkVKBrbpB2YlYr1ne17qITPPD4nTmP1bDxLVA9rNGOYqUJbbXGupR
	TFjh9i/oI7C1nvJKi4b+y012EbFdsWFbbIBTMkRoPcPELQYh/R0AyRsZC+LJ1UfGbUgyGI/MQzh6Q
	2kQ5vhiw5jLuJUiUX93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5fN-00FpQN-2q;
	Sat, 09 Sep 2023 21:38:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf5fL-00FpPn-0h
	for linux-riscv@lists.infradead.org;
	Sat, 09 Sep 2023 21:38:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1C205CE01DD;
	Sat,  9 Sep 2023 21:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9532EC433C8;
	Sat,  9 Sep 2023 21:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694295530;
	bh=5fU1vfnX5/y7qCl6GytMi3XTMVYX9SNS1qWWCb3S6jQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=UcShGcp4uEqcsIQP42m5AMdjrR310GdEeuL11Bs7dKHpSk8EILB2LizO0pY63S2lG
	 d6JVp/6Pox23jSzOAsgWCzcKJiAy/dwAK2N2Dbc5bObNiJ8KbNrqPpBOokEDzQveMG
	 IaMcJRYZXda6CpgwWv85/vbhrRdLm7CGXYuQqUL3psVAhiM+xCT9tXwM0vaz5PQrql
	 uUtyIRYnFw+slnClKYsTAucXrySRpEFXtRH3TPcxCDhw8n0GBiucRPzbl5GA0PItuV
	 dvAAFHWn2amXa/lZPyz5xvPHLPGZnmm32WlBA71owojkJvibblI9/mbYSaad/IawgM
	 8Nl/nOvtvqdYQ==
Date: Sat, 09 Sep 2023 22:38:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>, Jiexun Wang <wangjiexun@tinylab.org>
CC: guoren@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, falcon@tinylab.org, jszhang@kernel.org,
 tglx@linutronix.de
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_RISC-V=3A_Fix_use_of_non_e?= =?US-ASCII?Q?xistent_CONFIG=5FHAVE=5FSOFTIRQ=5FON=5FOWN=5FSTACK?=
User-Agent: K-9 Mail for Android
In-Reply-To: <0e270067-cd2d-ecd0-512b-5dce4865fa4c@sholland.org>
References: <20230906123216.255932-1-wangjiexun@tinylab.org> <0e270067-cd2d-ecd0-512b-5dce4865fa4c@sholland.org>
Message-ID: <12294913-FC23-47F5-AB73-BDBD19F65C87@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_143855_455875_9A22C8C6 
X-CRM114-Status: UNSURE (   7.19  )
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



On 9 September 2023 22:20:41 IST, Samuel Holland <samuel@sholland.org> wrote:
>Hi,
>
>The patch is correct, though the subject isn't quite accurate.
>CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK exists; it is defined in arch/Kconfig.
>It's just the wrong option to use to guard the function definition.

That's partially my fault, I suggested using something along these lines on the previous
version.
I blame being supposed to be on holidays!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
