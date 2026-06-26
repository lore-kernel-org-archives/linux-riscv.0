Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83B49CDE013
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06/tnSbtx8a6n9ZfjFWyb4YoBkyXOCGS2XbnP0GvMMI=; b=MqjtAVZmfsjygT
	yaetSMju+qf8Vfo6D29EdupsYMLMLp8xMoeQlSL+Lch8vI9Fdw/u83t+XW6gE1TciO0F/uBXDPlTQ
	Hi/6xNVXc1Sd4ch6yc378xdXbNL1GpOzN3m2iqh3DJ/XP5+BgxXA69iDkMdj6Q25nxZW34DwlvDZw
	8wGeIghzEDwtBcsL8a6MddTTJut33YSU7kUgXeeIWrH2/71cBY5nnYd40qFNDzOC+sSxeDJNAYsrt
	rfp8XOOmhl17XeBJcYy/6fDCNqcpABVpjPVW7CZ/5IFjAW5pM1mGBlFIiF4q5wDiKR7qMBqKRWPA2
	bODdqBPdKhh6iWGO44aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oo-0000000Ao0M-28hT;
	Fri, 26 Jun 2026 08:21:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oY-0000000AnZO-2twJ;
	Fri, 26 Jun 2026 08:21:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A8B7860229;
	Fri, 26 Jun 2026 08:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D0F1F000E9;
	Fri, 26 Jun 2026 08:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462089;
	bh=keBQ1PB9E9ulKt7uMx/nDlIJ5ohwmy4K2SVXnXfXhTo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TplBEdU4A/z/qEhUSGn77hXstHEYmJOXCCuN+UkQKeu1/I9KO0Qz+9fznYYYSxVbt
	 dEAkmVaUPl8uqq97GQ/QBYwsoc0KXBtQgIVRDSYX/BmQNjUqy58m/JzNQhPXP76cbH
	 796cf9T9XiQ2YthX//6M6kR5Jr/1DPvD/uF3QDIJADTCir7yryOiUIqr5YUUx2BjPK
	 rvUwIDrGMOB+2M+QznofiRmp9MYhl1iLrv41oa8p2m3DTiKv9PvMLlh8ejFDHpLNcB
	 rrMyEjK3cKyesdAwr/ZAIB8POB86Ebs36xbPg+VMubfbzyEUyPcu+wH7WOhXQQF2f0
	 BKzdbh/NP1Frg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9393539389E8;
	Fri, 26 Jun 2026 08:21:17 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/5] mm/sparse-vmemmap: provide generic
 vmemmap_set_pmd()
 and vmemmap_check_pmd()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246207624.3816447.4177031772329695086.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:16 +0000
References: <20260404122105.3989557-1-songmuchun@bytedance.com>
In-Reply-To: <20260404122105.3989557-1-songmuchun@bytedance.com>
To: Muchun Song <songmuchun@bytedance.com>
Cc: linux-riscv@lists.infradead.org, catalin.marinas@arm.com, will@kernel.org,
 chenhuacai@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, davem@davemloft.net, andreas@gaisler.com,
 akpm@linux-foundation.org, david@kernel.org, linux-mm@kvack.org,
 muchun.song@linux.dev, kernel@xen0n.name, alex@ghiti.fr, ljs@kernel.org,
 Liam.Howlett@oracle.com, vbabka@kernel.org, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, ryan.roberts@arm.com,
 kevin.brodsky@arm.com, dev.jain@arm.com, anshuman.khandual@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ptesarik@suse.com,
 vishal.moola@gmail.com, junhui.liu@pigmoral.tech, austin.kim@lge.com,
 chengkaitao@kylinos.cn, willy@infradead.org, alexs@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
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

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sat,  4 Apr 2026 20:20:53 +0800 you wrote:
> The two weak functions vmemmap_set_pmd() and vmemmap_check_pmd() are
> currently no-ops on every architecture, forcing each platform that needs
> them to duplicate the same handful of lines. Provide a generic implementation:
> 
> - vmemmap_set_pmd() simply sets a huge PMD with PAGE_KERNEL protection.
> 
> - vmemmap_check_pmd() verifies that the PMD is present and leaf,
>   then calls the existing vmemmap_verify() helper.
> 
> [...]

Here is the summary with links:
  - [v2,3/5] riscv/mm: drop vmemmap_pmd helpers and use generic code
    https://git.kernel.org/riscv/c/abff0ecf7602

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
