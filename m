Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F875CDE00E
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2026 08:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCGULD9keIqjxrUYLuEn/GdgRkITXD+gcu6LA41G53g=; b=QLeb5/dqp7jIV1
	TDQF2FEonxWsb48KYsY9R33PMy1nf+e7MDaDFEF13UJIDvjPdc51yYaHM1EM26Zu7OSPclsB38zXA
	7r+izzbJj9z74fwVwwghSGTXvn7qiy4HTPoHts2dPvIdy2IyDVUjrtNL8jgvPUVJUsiNcxnZCN+7q
	fHwFRaOVMpRC5Foo6desq/nTn0X6pPHSz+62YXXH/EgiCYJ4wDcSFOWuMVBc2PbT8yCay7CwOhiAE
	SzY+8HohRzUgrFvh7EZNcX9gSufKsdovbnWiPmJZh7gFGFE3oM9iN9eX9lNZCS1qKOzwwQj79YUQ5
	qf3yviDy2NsUmRi1GLpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1p7-0000000AonO-35G1;
	Fri, 26 Jun 2026 08:22:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1oj-0000000AnoZ-2s1I
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jun 2026 08:21:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10609600AE;
	Fri, 26 Jun 2026 08:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A601F000E9;
	Fri, 26 Jun 2026 08:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462099;
	bh=/URyDSaM1Mp00hYDxzcu1PlaeGQCy7y9ufaCKG+1pYk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dZ6wUmHlou3J6WeaopCIhZOzl5LxPzE65VLGwts7XKUdv71sYAo7u0DcmzHudoAeC
	 dUUU3ZBCDSL1NXw420mqK9HQKDWL+3Mf932mHOQbY5haEiBgbzgz+TvikEdOG8odvD
	 b1xMWbiwWliWZPzhGeLA+1YDYFPXwVtjUHD231hpuDUDCdBWWpz8fTMT2aNKlNClA0
	 auSTv8t3dvuaYganHC6zeXelxXxD1hJBswndcayL5cTEfGWd7sDNN5UuosA5B5UhWE
	 0iB4C44h6WSBaWEu/jEws2dH0VFYZi9QvILF/Ez8Hd6jBU8RVZlmVkL2yPhIEpb/tG
	 Z7rdZkOnXcovw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19B8839389E8;
	Fri, 26 Jun 2026 08:21:28 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v13 0/4] kunit: Add support for suppressing warning
 backtraces
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178246208674.3816447.9584369939582811196.git-patchwork-notify@kernel.org>
Date: Fri, 26 Jun 2026 08:21:26 +0000
References: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
In-Reply-To: <20260515-kunit_add_support-v13-0-18ee42f96e7b@redhat.com>
To: Albert Esteve <aesteve@redhat.com>
Cc: linux-riscv@lists.infradead.org, arnd@arndb.de, brendan.higgins@linux.dev,
 david@davidgow.net, raemoar63@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 corbet@lwn.net, skhan@linuxfoundation.org, akpm@linux-foundation.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 dri-devel@lists.freedesktop.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, peterz@infradead.org, acarmina@redhat.com,
 linux@roeck-us.net, kees@kernel.org, lkft@linaro.org, mcanal@igalia.com,
 error27@gmail.com, simona.vetter@ffwll.ch
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

This series was applied to riscv/linux.git (fixes)
by Shuah Khan <skhan@linuxfoundation.org>:

On Fri, 15 May 2026 14:29:31 +0200 you wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons:
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> [...]

Here is the summary with links:
  - [v13,1/4] bug/kunit: Core support for suppressing warning backtraces
    (no matching commit)
  - [v13,2/4] kunit: Add backtrace suppression self-tests
    (no matching commit)
  - [v13,3/4] drm: Suppress intentional warning backtraces in scaling unit tests
    (no matching commit)
  - [v13,4/4] kunit: Add documentation for warning backtrace suppression API
    https://git.kernel.org/riscv/c/5c1553dd5db3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
