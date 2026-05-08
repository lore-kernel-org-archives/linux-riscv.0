Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B647CD37AC
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 23:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HfcZIo2WISh4pcwur0Fw9lupyGGBnLywTN9J6S1gV9k=; b=HOqoqj2kbky4kY
	FcW5QcdXPY4n6HID2mgl3Zrbu4MtwWuh0raGg2KQChoNozG9HgaukekD5pkOze5W/euYahVMNExoX
	HSthDGrqsD+rJJXT1AhkIjuu5DE3B4BxAGFJQpDkJHwgkkQkurbGMlSdWfp58fovy/Vq2WiazdbNm
	qkriUBfRji8+sP9W3rDQeelwb139Ge7GJmxmWnm6ZBmGE6m1kVcgRuooJhwKkgwUnt7xKok4kP+77
	wB1dubeaZGPYNFCWGKv1EM/IA4H4RtS3xn+9+/iT+hbxV39nwojcDUa1Gi4P/9PLHg458FGdGVaqY
	zVSHdy1SZ5suCgRTQlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUzJ-00000007meV-1qo5;
	Fri, 08 May 2026 23:52:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLUzG-00000007mdp-1Vb4
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 23:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B64C3417AC;
	Fri,  8 May 2026 23:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3FDC2BCB0;
	Fri,  8 May 2026 23:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1778284324;
	bh=sRGeCV6w/1XLJmMiis3Zh7jmQgcOwgTRye0mEg75f10=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ALxe9ym2sHgz7eBUYTEuUFF41oSDC4cz3mXGbV78Dfm+oqqwoIPEWCG2MGsWVZ8Z4
	 +kLExX711p4ifWyTbJVe/8ddxhSROJmkV+x4IqyVtlJY9/t7d0pJNbyrMmNlQj8ehW
	 q/cmtclmZMfOII99C0Y3VrNtwUEN0IxC3cncAWjE=
Date: Fri, 8 May 2026 16:52:03 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar
 <raemoar63@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Shuah
 Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, dri-devel@lists.freedesktop.org,
 workflows@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-doc@vger.kernel.org, peterz@infradead.org, Alessandro Carminati
 <acarmina@redhat.com>, Guenter Roeck <linux@roeck-us.net>, Kees Cook
 <kees@kernel.org>, Linux Kernel Functional Testing <lkft@linaro.org>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Dan Carpenter
 <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v9 0/4] kunit: Add support for suppressing warning
 backtraces
Message-Id: <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
In-Reply-To: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
References: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_165206_463550_522271EB 
X-CRM114-Status: GOOD (  11.63  )
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

On Fri, 08 May 2026 17:02:44 +0200 Albert Esteve <aesteve@redhat.com> wrote:

> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> ...
> 
> Solve the problem by providing a means to suppress warning backtraces
> originating from the current kthread while executing test code.
> Since each KUnit test runs in its own kthread, this effectively scopes
> suppression to the test that enabled it, without requiring any
> architecture-specific code.

Thanks.  AI review has a bunch of questions:
	https://sashiko.dev/#/patchset/20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
