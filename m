Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F78FB5173
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 01:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/erUNM1J9JhbpjvcD0ouLTia3JSKaVrDANm4zG+xMg=; b=xo+kbBxBG7RylL
	CbVo6DCK3KHXbz1SNBh0wC2cYKuB0rfsIW2kkTRkpmGcwSOIw0fEy4q7dZc//H3Y+vkdGyw81wYze
	RNHeMnaNz0enK7Nzq2ZzEU9muqB6Xo495wN8oM5sTumnAEUwt/v4U2otFv9JgTT2H+o5gGLzTkfRt
	b9ItZ72I9A/HbnfOjUaGC9gdu9paf3Jgdz7k5g7iltHyYr4GGksdKXvxNIIj9yXGK34ibzZx3TDsI
	grA4fi0qDPbUGTvvwch2IIaX4jLU44D5E7lu6AgFUuxYeojkOWZ2lwZfybetDq9cefO7KGY6Ocu9a
	944pX8tBwG0BppkRJ68g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vPH-00000005iiB-2idV;
	Tue, 07 Apr 2026 01:39:07 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vPF-00000005ihg-0J6A
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 01:39:06 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-7a43424f861so42900727b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 18:39:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775525943; cv=none;
        d=google.com; s=arc-20240605;
        b=jPdIvLG76NXfw4xDqnir8d+JiS9Njh/cqXWS9hdn46qLIv+CBwtab3syWsUs8nWeTS
         f5FP90/qE8RmXVcHbB0KUd0FS8jwKc5LB4fzG+wSTTignHKqQkv3QGn4XSsISceD5m5m
         kaVMPvqkfdxnCk6btqWo8GzmkNl3RTqprU6HIuIZGlidu4OGnTVkN/DkFccuv34+4Tuh
         CskUNH2grS5d2WZB3tRVcJiqBsU35hIFt2xdQxyNPuSvmAzzjSu8roIKkK5qaLnKREvL
         vt6J9KzQgrwULaJwp7DEnaIU7pWq//uNgKeBcZJCs6xByNfFmc6oH5bTqEw6MAO2WZ2L
         oKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=p50zrqNNCvOdvNZk/Ue0NF5eHlks4zpndiQNvQ89PKY=;
        fh=SXaZ3JR0f2BMjv/z1BH+ZXluh20y+OkX8r/65dFjDCw=;
        b=R0BRvKGd28wjNSa+ZqriiFSm8qt+7g/0SXAHA5mvllzp9fAcXS7lmWzMGRpf9aEhCW
         OVwy2TzWfwnrhB80zdQQ7cniHPtzDnMpKR5dz/AfXssX4kMXRoQDCF9myge6C9JgkteQ
         B+FBqUetx9IRlC3TTffILoXrJeM1nmnzq5xCQnu62YGE/IHeWiUm6zk0T8Ccb/OMSeEJ
         wJPFH2rsf0UYKVG6L3evt+FgwDJla/Nq21SsxUds9+qsdR4CNHeMN4Eht1mShTY8k690
         a2DCoPKSrEiayBKDeOwW//NDgL0xqpiGgwMxOpaDxtyT1NxRKQgR9zFvndnPHmvzkCbF
         Aaag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775525943; x=1776130743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p50zrqNNCvOdvNZk/Ue0NF5eHlks4zpndiQNvQ89PKY=;
        b=gIeY1CELn/WduHZydM3Hw4vs1hOd4HSC5SwY+ztQ/v5TJUocEB4cYrUxR1k9bZCwGo
         vHsSXF1zYGLQLbQ6ZVX0CoB94yvlAOIQdlA3AgSAn65ZC6FkOefyZ4BL+P9SddS4LJKg
         SKh/7RAY+8iJQrMmKFEJBnP6UxYuAGEUI9qG7mOW0adUR1k1Xp53/1OVa11qw5o++L81
         Rciu66XLKlA++1Xz82VhJYF6MWfAjD1sPRt0ayEPcaLNtOCeWULymSnh+RXIAr6qTTTw
         DF3wk047/yAl+3SAJ8VQnsH+3NOPlZDnrTlpJhmMsS1P8wcdRxY/Q+EmWx/nC5TCow2U
         vdww==
X-Forwarded-Encrypted: i=1; AJvYcCUR7iXiiLwYBRS65Bl/iZGekRfHEd5V3Lleb6h8H4EM6xAjzaQy8fi+ZTeXWmcvhyUwpl4Rusippbuiuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyqqKZ4QO47LS6+A6UsHwz5zxO7b8a9MjQZa++7yIiXEOLu8hL
	sYU6zcWhXRRkhMxpcwajRVIReeV/afM1GKO0meZ/3s1cAHmsvjOrKvMfiICzLFhXOI5L4H5dJoS
	KXJRxXVk6KlWCgLKsDjxIuJ5ULjRPh68=
X-Gm-Gg: AeBDiet5B5Nb6cewQY52oahLdr/gQCgJuZD6fM16BePRLh+9MYnXdcCkwakGqx/EP1L
	JwAM/2gup5CpCkO/vr3VScoJzhf2EVcEUKBV0XKjCOgCGY5XjTUy0YqwwU6Tmo/E/mo3y3zT/8N
	4qBcx7AN6uUW4d31590jbXxylfDwky2ZRqS14djGEkS9r8c2N5cyv1POo5Hf4/03fjJkOWj2V6Q
	1OL5KgAPU4RJ0SRVJNOfLEDe5TM1IuMA16mWtEDWkB89NHjFzgWKwaPor3mIzjC0TJ507WNvQCe
	GENj2I0=
X-Received: by 2002:a05:690c:9217:b0:79a:b46c:e61b with SMTP id
 00721157ae682-7a4d33e30c9mr127169747b3.2.1775525943366; Mon, 06 Apr 2026
 18:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1770830596.git.namcao@linutronix.de> <177524102078.1406513.13713846519162509736.git-patchwork-notify@kernel.org>
In-Reply-To: <177524102078.1406513.13713846519162509736.git-patchwork-notify@kernel.org>
From: Michael Neuling <mikey@neuling.org>
Date: Tue, 7 Apr 2026 11:38:52 +1000
X-Gm-Features: AQROBzBHGlGYyJcNn1s2jZNsxGD5X0AoL2ZiOKNY4aY18jBnUqWSRMht-CYfsdc
Message-ID: <CAEjGV6y0=bSLp_wrS0uHFj1S2TCRtz4GKzaU5O-L1VV-EL7Nnw@mail.gmail.com>
Subject: Re: [PATCH 0/5] riscv: Cleanup and deduplicate unaligned access speed probe
To: patchwork-bot+linux-riscv@kernel.org
Cc: Nam Cao <namcao@linutronix.de>, linux-riscv@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	ajones@ventanamicro.com, cleger@rivosinc.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_183905_150776_E27D2627 
X-CRM114-Status: GOOD (  12.75  )
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

> This series was applied to riscv/linux.git (for-next)
> by Paul Walmsley <pjw@kernel.org>:

> Here is the summary with links:
>   - [1/5] riscv: Clean up & optimize unaligned scalar access probe
>     https://git.kernel.org/riscv/c/c202d70b2244

I think this is causing a regression (SHA1 actually 6455c6c11827) .
Fast unaligned accesses are no longer being set ever.

Analysis from Claude (Opus 4.6) with Chris Masons kernel patch review skills:
--
  > diff --git a/arch/riscv/kernel/unaligned_access_speed.c
b/arch/riscv/kernel/unaligned_access_speed.c
  > index b36a6a56f4..1f4c128d73 100644
  > --- a/arch/riscv/kernel/unaligned_access_speed.c
  > +++ b/arch/riscv/kernel/unaligned_access_speed.c

  [ ... ]

  > -arch_initcall(check_unaligned_access_all_cpus);
  > +late_initcall(check_unaligned_access_all_cpus);

  With this change, check_unaligned_access_all_cpus() now runs at
  late_initcall (level 7), but lock_and_set_unaligned_access_static_branch()
  remains at arch_initcall_sync (level 3s):

  arch/riscv/kernel/unaligned_access_speed.c:
      static int __init lock_and_set_unaligned_access_static_branch(void)
      {
              cpus_read_lock();
              set_unaligned_access_static_branches();
              cpus_read_unlock();
              return 0;
      }
      arch_initcall_sync(lock_and_set_unaligned_access_static_branch);

  Before this patch, the ordering was:

      arch_initcall:      check_unaligned_access_all_cpus()  -> measures
      arch_initcall_sync: lock_and_set_unaligned_access_static_branch()
                                                           -> sets branch

  After this patch:

      arch_initcall_sync: lock_and_set_unaligned_access_static_branch()
                                                  -> empty cpumask -> off
     late_initcall:      check_unaligned_access_all_cpus()  -> measures
                                                  -> never re-evaluates

  Does this mean fast_unaligned_access_speed_key is never enabled at boot,
  even on hardware with fast unaligned access? The comment in
  set_unaligned_access_static_branches() says "This will be called after
  check_unaligned_access_all_cpus" which is no longer true with this
  ordering change.
--
I confirmed this by booting (qemu) the below patch before and after
this change, and I get this:

Before this change fast_misaligned access is set when setting the
static branches
   [    0.117326] TEST: lock_and_set running, fast_misaligned_access weight: 4/4
After this change fast_misaligned access is unset when setting the
static branches:
  [    0.168865] TEST: lock_and_set running, fast_misaligned_access weight: 0/4

So I think this confirms the regression.

Mikey

--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ @@
 static int __init lock_and_set_unaligned_access_static_branch(void)
 {
+ pr_info("TEST: lock_and_set running, fast_misaligned_access cpumask
weight: %u/%u\n",
+ cpumask_weight(&fast_misaligned_access), num_online_cpus());
  cpus_read_lock();
  set_unaligned_access_static_branches();
  cpus_read_unlock();

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
