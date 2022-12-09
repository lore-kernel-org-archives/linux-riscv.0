Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476C8C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 01:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vnc4mbcsH8/tP5iQRn5u+f03KVyrhtVYlcrGY0VNY14=; b=IblgIvCth+4mcH
	CAgI0Y3HFIsNstLSWX9Fs4u8iRR/xVynX/2OaOAKfS36rdMPgtViE9/Iz3x4hMOLC4kHT4m9H+IfC
	6xo+YFoLED5LDzoPmsDu9PAGuDISYH1N2h64ALiYYtWn72f/gibqehEqikj0R9Q3kB4TeXY3iNToe
	BuTs8Ot8+7zy1lYuDYeBNN0ChRnurAkdP9QSw8OJLg5+IkTNI6hLfOqw0r+HIiSngOpxGvJqxaiDN
	3aUJlU+peedbgRYhXqqG5/bLfxANqg2n6u/HYp3nIQoRGPSQIab1SKAdStGFokGxE8337yhVDazCJ
	+dL6Gh2q3SgdhUETs1mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SDX-00040r-8c; Fri, 09 Dec 2022 01:30:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3SDU-0003x9-B5
	for linux-riscv@lists.infradead.org; Fri, 09 Dec 2022 01:30:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AC6762103;
	Fri,  9 Dec 2022 01:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD258C433F0;
	Fri,  9 Dec 2022 01:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670549418;
	bh=K0icfcWXctigWWVx3ADmDqvIRURr0H+ejPlG7fwXulw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ruR/saYEQ8/sPSnWWkoEOfCTVZRKvI7UT3oxl7qE/KCFfL675z/I9DZLWPElyaqSo
	 UcjcNVkmpu7+Sh5cZ4KTQRKqrj10o4EWzpo9F9NfMet8ctPlqrOoPOtrCZ95UO59Ak
	 Am91RkFkb4JjYRVWUoFLGzHwkM03iCcNKmUUxMHQWf6QlBiV0A1G0ZFu8WtaRNvz4p
	 etOwD62wCCSd+LAa0dxZQ/SvlsV8v53ZZN088Je+c+OX5KgsboOY0qg0NhRdIfyy2Y
	 P3ZQDww4T9xifw5rP4F79u3PsCUjj0Z3SCDguSi+OzqdQWmgkKi30rjNuCh7JSZkBF
	 Sa7d0uw2psQqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C3468E1B4D8;
	Fri,  9 Dec 2022 01:30:18 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: boot: add zstd support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id:  <167054941879.3046.3791891123009116103.git-patchwork-notify@kernel.org>
Date: Fri, 09 Dec 2022 01:30:18 +0000
References: <20221123150257.3108-1-jszhang@kernel.org>
In-Reply-To: <20221123150257.3108-1-jszhang@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, terrelln@fb.com,
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_173020_458278_F9BC9186 
X-CRM114-Status: UNSURE (   9.25  )
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

Hello:

This patch was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed, 23 Nov 2022 23:02:57 +0800 you wrote:
> Support build the zstd compressed Image.zst. Similar as other
> compressed formats, the Image.zst is not self-decompressing and
> the bootloader still needs to handle decompression before
> launching the kernel image.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> 
> [...]

Here is the summary with links:
  - riscv: boot: add zstd support
    https://git.kernel.org/riscv/c/de59b6ed0618

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
