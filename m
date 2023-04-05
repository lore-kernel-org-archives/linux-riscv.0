Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEA1C77B62
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyzv9UuuIDy2CM1kBeYZIZnY7eVC2jWaRu9SPaRZHDA=; b=LiuGR9At49Fh/v
	dqEnCIUZoqCKjWNDhRpL2aaZ73/TFY3mRU44DXFC3M1qvby0WbgySkpjV7r7rPSqlKtwlB5OK+Wl0
	mZrPohhDW97RjbuKcpuJn9o88RhXgHkSWVEBmyjVQnB3S9XR3xU7YNC422ZyFr2wNg24Yojx6xC+n
	zi/pH8Mkv61LvvlH8avQ31qufHOw93YtY9ioNGEp18PqzgF9DU/081t84Znt8r3VzmYcr0z2jgjWS
	2VAUHN7w0lFbybyQ6OKrSTyP2VJshV+4hhBFDm7IgQd0pgOgmDloO1Cfd+j4U6l4t3no/znkdEP13
	ig2YwStXhzrU/Rbc+L9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk8J4-005RsE-0Y;
	Wed, 05 Apr 2023 18:56:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk8J1-005RrZ-0H
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 18:56:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3FBCD62707;
	Wed,  5 Apr 2023 18:56:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9687DC433EF;
	Wed,  5 Apr 2023 18:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680720984;
	bh=q5qYr0bDTHFNnVhax8wxJFcwYPGay87vGGt/38MrzVM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=glqBOJMr8awz1mYdAzkoze7HARaPDSh33fnCgunQmkPD1kudtRvLMlJWOUK6+5qmk
	 e/LhCe6gVRYUNG6k78yW9cdgZmKRURvAoUVC8LUaY0noQHyOn9sLCrSMw9mIcsUK3u
	 /h/XTNwc9/KkhV5bPSKtUJsKgZrTuHVMbaTwcNcK+sF7J6b7MD74x3VagG8r4Jc+rr
	 TE9Bsew1Dbh0TlCg58VQM6E0Tma3v3hUku5wy5mPoSsBQjeYh58Pk27gwj3IOCGdye
	 lFCAYpldQM+wQn3bbHoY77/Mvuq8T7hzyCA7Pa6rmBwQ5MH9iiATTsSV/Rj/Bp6MnS
	 /xFM20BGXz1Yw==
Message-ID: <85648045b35c889f61a536cdd568b867.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230405-constant-dreamily-0128e071c665@spud>
References: <20230405-constant-dreamily-0128e071c665@spud>
Subject: Re: [GIT PULL] Initial clk/reset support for JH7110 for v6.4
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, hal.feng@starfivetech.com, emil.renner.berthing@canonical.com, conor@kernel.org, mturquette@baylibre.com
To: Conor Dooley <conor@kernel.org>, p.zabel@pengutronix.de
Date: Wed, 05 Apr 2023 11:56:22 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_115627_179235_9CF6136F 
X-CRM114-Status: GOOD (  10.60  )
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

Quoting Conor Dooley (2023-04-05 09:05:01)
> Hey Stephen, (and Philipp if you want I guess?),
> 
> Here's a PR for the StarFive JH7110 clk/reset bits since I'd like to
> take the DT this cycle & depend on the binding headers.
> 
> I've picked up R-B tags from Emil on all that patches, despite him being
> listed as an author, as things have changed quite a lot since he was
> involved in writing things many months ago.
> 
> The base here is -rc2 rather than -rc1 as -rc1 has issues booting on
> this platform. Please pull and all that lark..
> 
> Cheers,
> Conor.
> 
> The following changes since commit eeac8ede17557680855031c6f305ece2378af326:
> 
>   Linux 6.3-rc2 (2023-03-12 16:36:44 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/riscv-jh7110-clk-reset-for-6.4
> 
> for you to fetch changes up to 63a30e1f44d5e3afbb47efe8a15fd86feeb62b4b:
> 
>   MAINTAINERS: generalise StarFive clk/reset entries (2023-04-05 15:52:25 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
