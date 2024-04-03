Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20010CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEynWLlYuKun9t0HGgrfFVr2zH7NKF+0DwXKVgggHpI=; b=h7lB2Z37aFxjbn
	bT8D6j0tsFPGvikQREzI5PIDIak6t3J04Lof3aFS8hHtzHAL+2O1bYzg9XPyIC+byXAkZGoKTfPhq
	YoIizqdFvSlahFAOOdvrnvbMSYTJNpgit2NbhMF0cAswRMQd6S0XWyI4+SnScimGkBUKm2ussv1EF
	mJKqJvAdAIFxXXSdOp+nOO0EW+Lo1nnyMqJVravFu5y3fmjk9X0QjrqP5/LIzc4JxDITHsONpgS4N
	KbsHKOv2t+0hF3VQ3eytoWNjxO9ZQDf5mOy/2tINC2QUwo1K7a4cDDSIZcIQeLppnideqJBCzPdGf
	KDcrjgf6567zAGUS3J4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0Xt-0000000G99g-17fZ;
	Wed, 03 Apr 2024 13:20:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XD-0000000G8kT-1QeH;
	Wed, 03 Apr 2024 13:20:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MvARuQ+3VmnrmzgmqFSmVu3cd4NVfa8l1fZDGFIcUBg=; b=fzQ3Jy/5381FJy5Iy1LnGOhH8c
	I3jVPiozccnhl9J72qw/o7NDQxN3snuoE6RFH10H/Ip8jPaDYHECkOmdflzRqCZpUM7F6RdbSMQGm
	Mfx6kkUYf+47fdTc5GT0toqlxJvgPFZfnuP6sQcIqNjEhBWCqDBblCdYWXrRDGMkJH72xIpdTc+cV
	Ap0sYE/UD2PDXZHaVGdazk58vNcqTiaTf484zup3bRaTmJVWkj+Y5J+RC+k09pwK9XtnTXI4GtPE/
	42HvXstE0kibQrgZqTvkMacQDr4GZ8lh8AFeDE5j2ZAYd3sCHgtMdS2ARDdkp9+rIQwg57j23vTnJ
	AFEI0RPw==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XA-00000004EPd-0NO1;
	Wed, 03 Apr 2024 13:20:10 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ecc9f0bdaaso1190513b3a.1;
        Wed, 03 Apr 2024 06:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150393; x=1712755193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvARuQ+3VmnrmzgmqFSmVu3cd4NVfa8l1fZDGFIcUBg=;
        b=ANZNULJLj9jRuUlGDRpeuRH8WhvVhcSY5Vbr44M9wkDsT4p5gTR7+Ad7MR0qYYGw2k
         au5mGC0W1ydopBXq7d3bOE9AqFlB3+ertd3/hbfh5fVqrBJNnjZqK2CBeYC9XKAZZYNc
         Oi6Eikoihs3itel2psUyoUKSIkoEJyaKgrrTlmvulDxHKo1aaslod9xIQq7nMdzyi1pW
         ZC/2IOeBqYbtGBuRgSzHHBe0kXL34N5CPmujh1GAQ5dcHZrIob9CnN3UG1+FaPQMu2m0
         40+QYnKqr5IlMtV823XKJHaCyIX1yAyJhPBPOTJ/rLQ1vwC3mXqPE66UVQsDsX+a7yfO
         DkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150393; x=1712755193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvARuQ+3VmnrmzgmqFSmVu3cd4NVfa8l1fZDGFIcUBg=;
        b=KOFdxtZRkZY+bqr70Wq7fwimV56/xOb9pKEd7ShHvXKuzQnVreR68sAmYzYy8m+ZBi
         ms8t5exWHMx+vqLBJEFY0UZpQZfYZZQml2DBcSQi4DHP4nI/mHxEQxkeORe0q8ipq2rv
         kRSlt54DrdOfBxH5HFJhCcAT02KgTS9yNjZciTp3a8DNaheu9HazFtvbwrYfBxxHt5rB
         mKehTOxlhKgJsL5xXzxYLXW9m1x4s3ePuzKf6YFp248q/dDSJgSvgXLPQRIwMnyt5xb+
         rq8ea92Urx4AtmrY5S+FG5YQDzBdBJQIZdSDxt1TxZiX3waoEfdc5oO2fJliTKMFYrpg
         ohug==
X-Forwarded-Encrypted: i=1; AJvYcCVTClEwQpi8Ky5NZlBDjs0lqMVgkMlcw2bf3/xRmh0hGkZlX3qa7551ZolgM3sNOwDCbaRAJuolf7KF4IPGgKePkI8o5A9THw8u1Tvaw7ScqzEXB8H6domi5M/VFqHpqaAVicDjBiUu+DxB9Qh0dOTzMGKnRXs=
X-Gm-Message-State: AOJu0Yx+aXKep8x9p6i2rCZTRoRBfJ646w2oKi5/fIu8tMR9OYfd5epV
	oVaJLx83morYb3/KkH1EoDqdxOGFdwNg1c/WcPoqwNtgVVJoANDS
X-Google-Smtp-Source: AGHT+IFzkfgfwanXAd82f8i8ef5Fjpgbc/yneRFMHGOwV59qDNS3Awm153uRnJZYSeIbwOl4zm4JYA==
X-Received: by 2002:a05:6a00:190b:b0:6ea:73d3:d3a with SMTP id y11-20020a056a00190b00b006ea73d30d3amr17312402pfi.22.1712150393007;
        Wed, 03 Apr 2024 06:19:53 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j3-20020a62b603000000b006e56bf07483sm11720837pff.77.2024.04.03.06.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:52 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
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
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	x86@kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>
Subject: [PATCH v3 06/15] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Wed,  3 Apr 2024 06:19:27 -0700
Message-Id: <20240403131936.787234-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142008_289613_94C2C9D9 
X-CRM114-Status: GOOD (  13.88  )
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

dev_addr_lists_test generates lock warning noise at the end of tests
if lock debugging is enabled. There are two sets of warnings.

WARNING: CPU: 0 PID: 689 at kernel/locking/mutex.c:923 __mutex_unlock_slowpath.constprop.0+0x13c/0x368
DEBUG_LOCKS_WARN_ON(__owner_task(owner) != __get_current())

WARNING: kunit_try_catch/1336 still has locks held!

KUnit test cleanup is not guaranteed to run in the same thread as the test
itself. For this test, this means that rtnl_lock() and rtnl_unlock() may
be called from different threads. This triggers the warnings.
Suppress the warnings because they are irrelevant for the test and just
confusing and distracting.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@google.com>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

 net/core/dev_addr_lists_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/net/core/dev_addr_lists_test.c b/net/core/dev_addr_lists_test.c
index 4dbd0dc6aea2..b427dd1a3c93 100644
--- a/net/core/dev_addr_lists_test.c
+++ b/net/core/dev_addr_lists_test.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <kunit/test.h>
+#include <linux/debug_locks.h>
 #include <linux/etherdevice.h>
 #include <linux/netdevice.h>
 #include <linux/rtnetlink.h>
@@ -49,6 +50,7 @@ static int dev_addr_test_init(struct kunit *test)
 		KUNIT_FAIL(test, "Can't register netdev %d", err);
 	}
 
+	debug_locks_silent = 1;
 	rtnl_lock();
 	return 0;
 }
@@ -56,8 +58,12 @@ static int dev_addr_test_init(struct kunit *test)
 static void dev_addr_test_exit(struct kunit *test)
 {
 	struct net_device *netdev = test->priv;
+	DEFINE_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 
+	START_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
 	rtnl_unlock();
+	END_SUPPRESSED_WARNING(__mutex_unlock_slowpath);
+	debug_locks_silent = 0;
 	unregister_netdev(netdev);
 	free_netdev(netdev);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
