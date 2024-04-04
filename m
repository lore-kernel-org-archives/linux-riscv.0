Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2194CD128A
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 01:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAmZ/9Vg35jWOzT6xEJEbidcwDtTOLg6j2cg6TwZFp4=; b=y9vv45EDXyF8fZ
	anno5bKljjppFW2uHggx4SIZ2SgfASTn09lzgD1+aOuXLeowwJsLzM6o8JC0EhMxkicNkFzhn2Jbz
	O97txkbPJD4z5cyA2DPGhNurR9Ngkj1P58xDtwmV/35oXgpJINbNz1NrNv1eGa+9ja6POPInlm2d0
	gXXFlvzOk9sPJpZ77rk5gXZM49j6KXr5tfMxCNqpwD7F52RGozN4wiRXduV2VIGJFEq4D3G4ub6xo
	WThuMO0ymEJztdebb1K9bnPu0nxEDuglmJVlvavLwKTANON19oBuavPvU4X9gtB4A6vMtbhmH4/5x
	ci6vdfAOcsLh23XfI7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBzk-00000000tSD-1pVo;
	Thu, 04 Apr 2024 01:34:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsBzc-00000000tOn-2Cr1;
	Thu, 04 Apr 2024 01:34:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F0C4615AB;
	Thu,  4 Apr 2024 01:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A94D4C433C7;
	Thu,  4 Apr 2024 01:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712194455;
	bh=PLHX9CmuF+jzJhTft7r/1Y8OPKACX4mI6u4er178G2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qb1JzlHCkOQ0xQR9xEkxKvsw8OA1eBs2sTlr4JQ5PzuUXWpA08puhxOS0+HGL5xJt
	 p+tSFhHdI0/W38jVkWUzbZ83SoA9Ze3oVX0I/xz35tzw9J8ehO4Ej2Z+v4WDgVFly6
	 bK1uHAbfHAa/MKwQyDRnXJvZKbn2ZQDjArtD+Ho/3cPayZMvc1juvsoNzlmJRr/Ju4
	 IiompHkE91W7nulKLmrSnjlpjrH1dYJE6//xltRqVI5kAJhGo2sMI29VSfrrA1CwJ3
	 2VTX8Ds9j7vLv82qYyQgrRRjYVgNl7GVkee7GY7YJqfjkE9sRb6rgoQPF1hbD/SIKA
	 JnLshHl50ZGTA==
Date: Wed, 3 Apr 2024 18:34:12 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook
 <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, David Gow
 <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, Brendan
 Higgins <brendan.higgins@linux.dev>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, Ville
 =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Daniel Vetter
 <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
 netdev@vger.kernel.org, x86@kernel.org, Linux Kernel Functional Testing
 <lkft@linaro.org>, Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end
 of dev_addr_lists tests
Message-ID: <20240403183412.16254318@kernel.org>
In-Reply-To: <20240403131936.787234-7-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
	<20240403131936.787234-7-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_183419_369714_6DEE7621 
X-CRM114-Status: GOOD (  12.57  )
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

On Wed,  3 Apr 2024 06:19:27 -0700 Guenter Roeck wrote:
> dev_addr_lists_test generates lock warning noise at the end of tests
> if lock debugging is enabled. There are two sets of warnings.
> 
> WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
> DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())
> 
> WARNING: kunit_try_catch/1336 still has locks held!
> 
> KUnit test cleanup is not guaranteed to run in the same thread as the test
> itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
> be called from different threads. This triggers the warnings.
> Suppress the warnings because they are irrelevant for the test and just
> confusing and distracting.
> 
> The first warning can be suppressed by using START_SUPPRESSED_WARNING()
> and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
> the second warning, it is necessary to set debug_locks_silent while the
> rtnl lock is held.

Is it okay if I move the locking into the tests, instead?
It's only 4 lines more and no magic required, seems to work fine.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
