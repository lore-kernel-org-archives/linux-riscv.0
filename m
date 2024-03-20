Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A787DC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3hFjPLhGAViS7Jqq3P4mTOTodGrMbs+/bPmsjUWkqI=; b=4snxNYRACrLnwG
	2vmBZqrPuOcdXPp2RRQhoHQtkW0yHvLWFa0jlbqwjSYXuvMZ9FTfgILmg/b6sRbV/3vGovCE0THSZ
	M8AG1IRlQirK6sB17YBJ8nZhbxexglKLvPgdjo3b9s/KnRrd6kKFJzsijqjfA24eie1iDCuHkEuo7
	/B0GIW5GNCBnhbRi7vV1Np6q8eVIJNoaj86mBlS1Wbh6sVafe81DGLPdYMweiAtUsd8plRPSosOGj
	Omn90zHqsA0GluBVQUFJwOl2fDtIcSaa3AZm618UEWlBc6EP2cFfUTjHHBOjr9r94TJXipUlfvLnF
	7PasmA/ShGPXrre4CApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tv-00000000w7W-1nQx;
	Wed, 20 Mar 2024 20:51:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn2tW-00000000vr1-47hj
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 20:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C7DECE1255;
	Wed, 20 Mar 2024 20:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A4FFC43394;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710967839;
	bh=WctFVZC3uzOKg3omygLLq58GK6rmac3ruk/bV/eUe4E=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oGPR/WNrpVEAj8cDjoABAs5QUae39b+h27Kte/8WwnRrufEGZbpJMKKX//IBXuV23
	 ut2CISiKtazHqXYKxQOueZ70YZeT/d0jnqmKE3vYBw7BFg3ml3QpvCM1udzAJXubNY
	 Q6idir5BZLH1XLrRXsZrLWA/8UD/mq4q29SYQ0VxQcp2+e9P2iWHunpPVNh/6b3hhO
	 BhDDVmYBXtOcDkTmTt5PJbH6tzuwDL0//jHHpyRrneX22pvXhYgxHLH04fN8RiGYut
	 KEyxQ31kxLr1yoTrso8e7u5kz2kt7EE77EW5AOQ1cWScaHZDxiEOl8+hIcSPFPpPQ6
	 UR7sqqbmYEtug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1BDD8D982E4;
	Wed, 20 Mar 2024 20:50:39 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v1 0/5] riscv: Introduce compat-mode helpers & improve
 arch_get_mmap_end()
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <171096783911.6804.6652711937507464203.git-patchwork-notify@kernel.org>
Date: Wed, 20 Mar 2024 20:50:39 +0000
References: <20240103160024.70305-2-leobras@redhat.com>
In-Reply-To: <20240103160024.70305-2-leobras@redhat.com>
To: Leonardo Bras <leobras@redhat.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, ebiederm@xmission.com,
 keescook@chromium.org, oleg@redhat.com, guoren@kernel.org,
 andy.chiu@sifive.com, conor.dooley@microchip.com, xiao.w.wang@intel.com,
 vincent.chen@sifive.com, charlie@rivosinc.com, gerg@kernel.org,
 akpm@linux-foundation.org, shikemeng@huaweicloud.com, alexghiti@rivosinc.com,
 david@redhat.com, willy@infradead.org, panqinglin2020@iscas.ac.cn,
 greentime.hu@sifive.com, bhe@redhat.com, cleger@rivosinc.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_135043_491086_47192D9C 
X-CRM114-Status: UNSURE (   8.43  )
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

This series was applied to riscv/linux.git (for-next)
by Palmer Dabbelt <palmer@rivosinc.com>:

On Wed,  3 Jan 2024 13:00:18 -0300 you wrote:
> I just saw the opportunity of optimizing the helper is_compat_task() by
> introducing a compile-time test, and it made possible to remove some
> #ifdef's without any loss of performance.
> 
> I also saw the possibility of removing the direct check of task flags from
> general code, and concentrated it in asm/compat.h by creating a few more
> helpers, which in the end helped optimize code.
> 
> [...]

Here is the summary with links:
  - [v1,1/5] riscv: Improve arch_get_mmap_end() macro
    https://git.kernel.org/riscv/c/6be7ee4bebd1
  - [v1,2/5] riscv: Replace direct thread flag check with is_compat_task()
    https://git.kernel.org/riscv/c/9dc30419248f
  - [v1,3/5] riscv: add compile-time test into is_compat_task()
    https://git.kernel.org/riscv/c/4c0b5a451675
  - [v1,4/5] riscv: Introduce is_compat_thread() into compat.h
    https://git.kernel.org/riscv/c/5917ea17ad07
  - [v1,5/5] riscv: Introduce set_compat_task() in asm/compat.h
    https://git.kernel.org/riscv/c/2a8986fc5e1c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
