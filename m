Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCEFCD1296
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 16:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K1Zq4AtqEcxm+tR5Ioon65zSgX82LFwFry9NXF6APqQ=; b=J5Mrb0FZraVxyX
	tPXxS6ctIaVAs0wE01greaQ/WiQTvXzZwhAcqdNA0OTrTe95wCp6IS+5FGF3m2URGfbYnvoa1mkPx
	VMUka4qhC92cWTl5tiWfY9zUuvgDnM5XVHHrtembAau9EMQ3f4p0QwdLygedSk/uH12vvliDho/bc
	N7vszd84N9i9v3q1xPVPZz5QrIya289cF1zaY/XmIl0BiN9hgggpmV9VjnsKRDJ+M4Dcih+ZixAMD
	CIy81wB7UtwMcuuwnb+rCKKKgUC3Ae7tZjMwx0rSLl+9+QNf5Eirdkzj5jDadYn7/66SY25lM4vD+
	DzEpWN3Ke/ghmt9vnBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtrxB-0000000GCRg-2TIh;
	Mon, 08 Apr 2024 16:34:41 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtrx6-0000000GCOA-3eXR;
	Mon, 08 Apr 2024 16:34:38 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so3880982a12.1;
        Mon, 08 Apr 2024 09:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712594073; x=1713198873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
        b=lcoT1mZKzJ6B9CXK+WhW0M52ptbLfey25v5wfkJJ6UrWgbEjIEKOdOkURP8/dfvQAR
         gXIlXYKnz7ry0ctqrUy13B4qVtl8jiqiUl14EUtf8HNTgICVTHai7g+wwU09oktKoFay
         6rJ+DjDnd4z+IQUxzF6pgXN9WR2QYcwN2esa6wnf//5L9P5/i/jFHj7aemv1Sn0qFs3U
         eBs28sbnsh3dyeOL5VRBK8Ej+83DMskCSuv5B6wXiJYz72+HJdhKIjLUpNgZzzLvTtOx
         Aw2n78vu1hV2DkQB3jGbicZxlNwxmw8NGzlfvJwr7maW91o0APZlMdSXO8HN9YhM3rOY
         M9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712594073; x=1713198873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8W6JiQXMJlyRVh6G0P1/xRBUWDgR2AudHru0aHPOuY=;
        b=JzqUBjQOi399Nt0/gp+h65oG2ibIWsIu0nH/AQ7YEGutJWuDSOXHueavL+6wFSeRPK
         NEd4aEh+5xuiRGAVPrzfLNkdATxDS7dBb9jSIFRYj1Zyp0VRaGa2/5x9OOpdcBMnTit3
         2W5MuyHUEPjKhjWpgQ99pDKk0Xm8Js/iuhdZTs8sqdPIx56hwiFCfORV2HGVYiq7qH5n
         nGOInK3DA9OQtvPbfZh7MOAfAa5XZmjIrN808Upryiw9Hi4ljoBYFXeJQIZh2X9tTZIO
         jE9bjtrpLNDZ7B71rBniYr34HpB9R2eNkBY6AlH3i4vsy0HeyDWqMcO4Stpb+9uZk7Iv
         UR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUDjbRsTlxNkF7KZmOvGwhw4UdbD/0nQv67TcMfSxhVg9EQirHoOTvZjENJt+bD7oZy+26k618iyKmP01VP2RX4BJbhn/lNadatSnZ9uhFT44DO3Fv9N5XJW5xe5vZZniH6xVTaDaODdHARbeX+syXJjf+CLPE=
X-Gm-Message-State: AOJu0YwRQs1dopkb7csIJGn8TBALZRJpAejDpKSO7TKfSupDiwT4qzXS
	MRrNAU/YkyySSFXyfRKwjPDwwWQ2+XAM1qT8JNfl6Gsexno2ZqtI
X-Google-Smtp-Source: AGHT+IHjgwPwZy3e5AEopzEIQpEcmD2hcpsHcoA+sLwIBYMIqqkK3bLGAgIh/jDVDgJdWRaZ9xWs0g==
X-Received: by 2002:a17:902:cec7:b0:1e3:f911:22b2 with SMTP id d7-20020a170902cec700b001e3f91122b2mr6050960plg.7.1712594073047;
        Mon, 08 Apr 2024 09:34:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001e2b36d0c8esm7189331plf.7.2024.04.08.09.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 09:34:32 -0700 (PDT)
Date: Mon, 8 Apr 2024 09:34:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end
 of dev_addr_lists tests
Message-ID: <9e8718bf-da81-463b-9436-6c8b0881a045@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
 <20240403131936.787234-7-linux@roeck-us.net>
 <20240403183412.16254318@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403183412.16254318@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_093436_919758_1D3A76D5 
X-CRM114-Status: GOOD (  21.77  )
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

On Wed, Apr 03, 2024 at 06:34:12PM -0700, Jakub Kicinski wrote:
> On Wed,  3 Apr 2024 06:19:27 -0700 Guenter Roeck wrote:
> > dev_addr_lists_test generates lock warning noise at the end of tests
> > if lock debugging is enabled. There are two sets of warnings.
> > 
> > WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
> > DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())
> > 
> > WARNING: kunit_try_catch/1336 still has locks held!
> > 
> > KUnit test cleanup is not guaranteed to run in the same thread as the test
> > itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
> > be called from different threads. This triggers the warnings.
> > Suppress the warnings because they are irrelevant for the test and just
> > confusing and distracting.
> > 
> > The first warning can be suppressed by using START_SUPPRESSED_WARNING()
> > and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
> > the second warning, it is necessary to set debug_locks_silent while the
> > rtnl lock is held.
> 
> Is it okay if I move the locking into the tests, instead?
> It's only 4 lines more and no magic required, seems to work fine.

I don't think it is that simple. Unit tests run in a kernel thread
and exit immediately if a test fails. While the unit test code _looks_
sequential, that isn't really the case. Every instance of KUNIT_ASSERT_x
or KUNIT_FAIL() results in immediate kernel thread termination. If
that happens, any rtnl_unlock() in the failed function would not be
executed. I am not aware of an equivalent of atexit() for kernel threads
which would fix the problem. My understanding is that the kunit system
doesn't support an equivalent either, but at least sometimes executes
the exit function in a different thread context.

Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
