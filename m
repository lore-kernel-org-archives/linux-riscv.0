Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896D0C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 19:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7fSoBq4fg5Ppx3rY+KKW892YgaTBtIOptuEAs3JODo=; b=TqKbHNbhM24Tej
	QDRcwZm4CwMo7+BwJYcXisaXA3GmD+ex5xSNIzhg08nYMAooyNTR4If1Ppx4DBFrGns2690cXmB4L
	yQBLWn9ZiAw4brts9+zytIZWcvxSWK3F3ZNBQa/U75YxL5eUtX+dlGX/8k2YaBEQjvZ6yKPdW/28R
	hhkRFNBUDAu4Rw/9fwcDGSbGGLt5spbaY35Eae1Sc+4L9bCwcnhYAB6zGueEMLeG1E/Qykl0oXlTg
	fCEq2jVuSwG8B63vl+e+0EMmw7mkdXmlS4NBe3xlWOE6/S+860DbfvWpUAEjjzIypnGwyBsMpaDG9
	bUDObnkWoPFr3tWf2vdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCzr-008id9-2i;
	Wed, 19 Jul 2023 19:38:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMCzo-008icA-29
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 19:38:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6358C617D6;
	Wed, 19 Jul 2023 19:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF362C433C7;
	Wed, 19 Jul 2023 19:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689795478;
	bh=RoApuEBZHp8i1pghl2j5zeKB/PC8LoNvYwsxZUUhu+w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sScyy0ELuGvtqYrV+O9/LFoCKVPRZtcLiMgOe3CodM81MSZsxikyT7L7RZNj664b8
	 Tiju3xlAucu2poBrWiWtZndeCtI9V17NMyIGPw/D6XCuIoWyo8RSVoB+k9JhSRDaHT
	 6kOnku2OPg+3ff7yue7SfH3cMnO7wDqe4KzwafZjWwPH9Nz5vWh2VjfrWIYCH/uT3H
	 6k92HkfR1kSawoxbi7xlT+iF3svX0OQouuZmwOPyLM3iX2uJ/kvRUZVcA/BVs71hjT
	 /tfTzG/TsP55Dapp9xluZVs7JJkx5qQub4MdZzKs6ELEDqr6c+C2kVPj8xF3mWGLfl
	 KETPSG8iveSMg==
Message-ID: <7d208aae212aa2101e8a9ca998a6a355.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230719-trough-frisk-40b92acb485a@spud>
References: <20230719-trough-frisk-40b92acb485a@spud>
Subject: Re: [GIT PULL] StarFive clock driver additions for v6.6
From: Stephen Boyd <sboyd@kernel.org>
Cc: conor@kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, emil.renner.berthing@canonical.com, xingyu.wu@starfivetech.com, walker.chen@starfivetech.com, hal.feng@starfivetech.com
To: Conor Dooley <conor@kernel.org>
Date: Wed, 19 Jul 2023 12:37:56 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_123800_770781_DB916175 
X-CRM114-Status: GOOD (  14.60  )
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

Quoting Conor Dooley (2023-07-19 10:37:55)
> Hey Stephen,
> 
> Please pull some clock driver additions for StarFive. I've had these
> commits, other than a rebase to pick up R-b tags from Emil, out for LKP
> to have a look at for a few days and they've gotten a clean bill of
> health. Some of the dt-binding stuff "only" has a review from me, but
> since I am a dt-binding maintainer that's fine, although maybe not
> common knowledge yet.
> 
> I've also gone and re-arranged the patches in this PR relative to their
> mailing list postings, so that the dt-binding patches can be used as a
> base for adding the clock controller nodes & dependant peripherals to
> the jh7110's dts.
> 
> I'm hoping that next time around, someone from StarFive can send you the
> PR, maybe Walker, Hal or Xingyu are interested in that.
> 
> Thanks,
> Conor.
> 
> The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:
> 
>   Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ tags/clk-starfive-for-6.6
> 
> for you to fetch changes up to dae5448a327edef952faaf31bb3aedb0597ba62a:
> 
>   clk: starfive: Add StarFive JH7110 Video-Output clock driver (2023-07-19 18:08:05 +0100)
> 
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
