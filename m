Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C24CFD37A
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Nov 2025 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LwyzJ+KLu6fbhBwCb8aES/F6hz4P1Jz76TBk9YPHzmo=; b=sfly18uEBsTaIY
	FuQ05Z9yVilc7NNhtUdFqYG4HXbPxzjIrxpZxUQsQ2ZLMdzR44XxtOPmH7O6oqjJKGaSQfk42xQvA
	7dEWs6syi073kmd1OLH7Sfqa48gmkAc5+yzhfY/dJMkXbJyZ4g5fezwLJHCufxSmUWJOpx1Nduuja
	TtJmKRiy+ciJiaMJLyX2kpyz7NWI5ZkW6/JvpBpNyhr7x5pVe5TR2iYejcH5LbzgG4fJ7nAz0dUGf
	KE/PeOl/n93YUWwUNggYf5X3oybboG73XPHJpBEfpbDReqIJ2FKVrw2hPTThKqeE36IdVvp+Eu/Eo
	2/HHOjwmSSWhmcJ+LS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpjD-0000000D39F-2X5y;
	Tue, 25 Nov 2025 09:52:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNpjC-0000000D391-2zJr
	for linux-riscv@lists.infradead.org;
	Tue, 25 Nov 2025 09:52:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B5D14601F3;
	Tue, 25 Nov 2025 09:52:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 364BEC4CEF1;
	Tue, 25 Nov 2025 09:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764064373;
	bh=I3QihUs/VAKs2ahnOX4mCsV6pA2nrN2cnK13Z00SXA4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kd+UGwIQQ+9bJsscawW/ThS4Jznf6WBn9pKw0+10MbZM0wh02I4om3dqJgOEeEjrT
	 ydjPc1rnOK2EAXVbx8tE9WfL0D9BX59qFQt9KCEjgaZa8C9+OL2uUTuTpo9MkIRc4b
	 nt4xJJ1Oylu1K3C+Wf4QYA6KaFTJE30MUZP2g8Fhlx4Kd45UMY+3h+INqMcOMJxxII
	 IsRVlY1NgJCbXXn3YYFzQ6TRx42rGfHU5WlIUJMf46HhrEOEnWtsYuduu3WnJkPZZH
	 56radJ/A5XJ7G7AmknV2bWuJOFxHpsajP53oe8Ld2UliXK4UDD4CEjyt04bU56bVDO
	 NBzUg3rZw2gag==
Date: Tue, 25 Nov 2025 02:52:50 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>
cc: pjw@kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/5] Add Zilsd/Zclsd support in hwprobe and KVM
In-Reply-To: <ca507aa5-670e-405a-a1dc-3316f96cef3b@isrc.iscas.ac.cn>
Message-ID: <4d7863cd-34c4-281f-48e8-f128bcefaee5@kernel.org>
References: <20250826162939.1494021-1-pincheng.plct@isrc.iscas.ac.cn> <ca507aa5-670e-405a-a1dc-3316f96cef3b@isrc.iscas.ac.cn>
MIME-Version: 1.0
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

Hi Pincheng Wang,

On Fri, 21 Nov 2025, Pincheng Wang wrote:

> I noticed that this patch has remained in the testing branch for some time,
> while the other patches in the same batch have already moved into the
> experimental/merged and for-next branch.
> 
> When testing locally by merging the current testing branch onto the latest
> for-next, I observed merge conflicts in the related areas. I would be glad to
> rebase the patch onto the current tree and send a new version if that would
> help resolve the conflicts.
> 
> Please let me know whether you would prefer me to prepare a rebased v3, or if
> the merge will be handled on your side.
> 
> Happy to rebase and resend if that would help.

These are now queued for v6.19.

I had to clean up a few checkpatch and whitespace issues; please keep that 
in mind for future patches.


thanks,

- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
