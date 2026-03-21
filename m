Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F941099B58
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 00:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMW5r1+0wwR4dr/x/aCgvVAwxcD3Ah06vstKZ9aVomM=; b=GFWx7UCWqzS0Z7
	aiY5CCj+INKZXCLahwZbgHOnpczYkKu0zymXM08/btLLfXATAs+1iAcj12dXOKeqNYhzvRlVmocxn
	4Wua5h79LJ22KAnW9plhkqgPOE+8MjfvDWVwpEWTdCFNumj8UN2V7kjSZbXJsRnC6qLKeCFHuutuN
	8Lfr+A+5vucfiEqoE67RHSXC09lf2YjDBRESxHy1JUtaTO7S4VoczwiazV/U7DNTDc8dcnfE9QsrS
	rWVyzVbnTEdkDUQH39QVmtDKrO5duwnyUdLTgdGDMxXScdlC7lKUYX1h/G1553dYzAiXndN5vtKcd
	a7Uj1eEnto5Cpgqn6GhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kcF-0000000Dqxj-30Dy;
	Sat, 21 Mar 2026 00:54:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3kcF-0000000DqxY-09IF
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 00:54:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7961F60128;
	Sat, 21 Mar 2026 00:54:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87968C2BC9E;
	Sat, 21 Mar 2026 00:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774054498;
	bh=qa/nXm2lQDzYOfPzKSQx8dKHj+Y27voBIEJmPJeHo+o=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E7EVIvEzmpaipMFDaprEtqYlF30YXLWD6o5CIoFOmxMwFrCg2noU6Q97V92pP1lQN
	 VESWsmgu/BzpdAdprDKJh4Rlfko4gvpHfhMWqOD6B5SHgL0pAdUAtIowD5q/6uY2qw
	 dorjjKloFWMCiPncT+fQnH4vHmxpUG7DQqySrH+GatGaDju+q3AIYA/fH3tIQV6YY9
	 wpiGHWaQTBCWmMUqI9DU8htbmu/tzja0W0xs9HHjNtp3q94crTbtGv4YaMGREW2esQ
	 Tu1TvK6DMY8m7nFg98rYjuwvjAMCsuGhIVmS7THPveeQEdX0RlgPo/h+b3e1Fi9m/q
	 45r5JjE6suqIA==
Date: Fri, 20 Mar 2026 18:54:56 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    Sergey Matyukevich <geomatsi@gmail.com>, Andy Chiu <andybnac@gmail.com>, 
    Deepak Gupta <debug@rivosinc.com>, linux-kselftest@vger.kernel.org, 
    linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] selftests: riscv: Add license to cfi selftest
In-Reply-To: <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
Message-ID: <b6282cff-8b80-8d10-00e9-852bb4e01093@kernel.org>
References: <20260309-fix_selftests-v2-0-9d5a553a531e@gmail.com> <20260309-fix_selftests-v2-4-9d5a553a531e@gmail.com>
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

On Mon, 9 Mar 2026, Charlie Jenkins via B4 Relay wrote:

> From: Charlie Jenkins <thecharlesjenkins@gmail.com>
> 
> The cfi selftest was missing a license so add it.
> 
> Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

Thanks, queued for v7.0-rc.  This sort of thing probably is best coming 
from Deepak, since he is the author, but since he added his Reviewed-by:, 
we're good.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
