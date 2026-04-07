Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBADEDB7C8
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kA+uYubi6yhOzFkYihmWaAhZxpJ2ivfbZmaaLRJBMxM=; b=DbkOzHIfEW9aoC
	7mazQbJ8KN7ikxXXOgKoY+FKAtywiex5IQxFVcFqSuhzf8eK3OyZQ2TJUwvhtnJN0rZOabWZYw5QF
	9art7HHTy2Lc1a/9LTVT+XA/cEC/AOFiLvEs9daIr2gT0gf22HJLUUrXG6Uo1GuLpHJ9az5Ysdb/X
	vbtcQbGVxYquIXTNm/pyGjJBMiFz/Z7GtD9fFGFGHJn3Dg1eSTa5dfwPzTsWEZrmM6BsZ3Rimj04o
	hM8F3LlVriuzLyVCtfznORJeUUwyU64/k11ayHVGjmzts/CKfIr1NG+dw/NnZiIbu3DSiQHfIZav2
	dU8FUJ51/6/GQD4k4I7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0y4-0000000653C-2LZp;
	Tue, 07 Apr 2026 07:35:24 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0y2-0000000652l-2Ywo
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 07:35:23 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775547320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugVAhhp+ofRCMbbySKGlB6bhEOTipVQtotrRtOXHRh8=;
	b=tL7CFS10gxqFMuZkhJYPUPLgJiYCtijpfwt3oo9080AThvkZ01xRJVurlmD9ecWcQtgev6
	uAAZCkFIHIqB7uqJDSyE1pSOvC3LzMAEe4A5zkanQClieEQFvfGjLy8/uq+/I7YCPB19h8
	lYAi2iAnWfJcMtT4F+PZ++wQrgTvB/z+VyqYlizfS9RbcMCNFvxbdPy35EV9x13SnPbzOr
	Iy1RU7aeZ1dgw1sn7R1WLnyavY1Zcuh9ONVEcgzw7NzX/3IiwSznzx+a8hN6lhLCPeHDKY
	M6caFh73KVA7gqC55GJ/9FwOTnIgehLGohcQXPpvK+yxlGmGCxsdfrMMg2W/uA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775547320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ugVAhhp+ofRCMbbySKGlB6bhEOTipVQtotrRtOXHRh8=;
	b=h7a338o4vDqDEAYCeUaA6GfA32JNeWx2Xzwo1avvEbRbYuWJ3Qy9bvGj3z2/z9d7fDz9N9
	6mDGxQ8Y6cfqSwAQ==
To: Michael Neuling <mikey@neuling.org>, patchwork-bot+linux-riscv@kernel.org
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, ajones@ventanamicro.com,
 cleger@rivosinc.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] riscv: Cleanup and deduplicate unaligned access
 speed probe
In-Reply-To: <CAEjGV6y0=bSLp_wrS0uHFj1S2TCRtz4GKzaU5O-L1VV-EL7Nnw@mail.gmail.com>
References: <cover.1770830596.git.namcao@linutronix.de>
 <177524102078.1406513.13713846519162509736.git-patchwork-notify@kernel.org>
 <CAEjGV6y0=bSLp_wrS0uHFj1S2TCRtz4GKzaU5O-L1VV-EL7Nnw@mail.gmail.com>
Date: Tue, 07 Apr 2026 09:35:19 +0200
Message-ID: <87wlyj4408.fsf@yellow.woof>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_003522_799096_A37CA0A8 
X-CRM114-Status: GOOD (  14.49  )
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

Michael Neuling <mikey@neuling.org> writes:
>> This series was applied to riscv/linux.git (for-next)
>> by Paul Walmsley <pjw@kernel.org>:
>
>> Here is the summary with links:
>>   - [1/5] riscv: Clean up & optimize unaligned scalar access probe
>>     https://git.kernel.org/riscv/c/c202d70b2244
>
> I think this is causing a regression (SHA1 actually 6455c6c11827) .
> Fast unaligned accesses are no longer being set ever.
>
> Analysis from Claude (Opus 4.6) with Chris Masons kernel patch review skills:

I should start using these AIs..

> --
>   > diff --git a/arch/riscv/kernel/unaligned_access_speed.c
> b/arch/riscv/kernel/unaligned_access_speed.c
>   > index b36a6a56f4..1f4c128d73 100644
>   > --- a/arch/riscv/kernel/unaligned_access_speed.c
>   > +++ b/arch/riscv/kernel/unaligned_access_speed.c
>
>   [ ... ]
>
>   > -arch_initcall(check_unaligned_access_all_cpus);
>   > +late_initcall(check_unaligned_access_all_cpus);
>
>   With this change, check_unaligned_access_all_cpus() now runs at
>   late_initcall (level 7), but lock_and_set_unaligned_access_static_branch()
>   remains at arch_initcall_sync (level 3s):
...
>   Does this mean fast_unaligned_access_speed_key is never enabled at boot,
>   even on hardware with fast unaligned access? The comment in
>   set_unaligned_access_static_branches() says "This will be called after
>   check_unaligned_access_all_cpus" which is no longer true with this
>   ordering change.

Thanks, you are indeed right. This affects do_csum()'s performance.

The below patch should resolve the issue. I will send a proper patch
later today after I have tested with my hardware.

Nam

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 485ab1d105d3..96ba80e6ea32 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -244,7 +244,7 @@ static int __init lock_and_set_unaligned_access_static_branch(void)
 	return 0;
 }
 
-arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
+late_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
 static int riscv_online_cpu(unsigned int cpu)
 {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
