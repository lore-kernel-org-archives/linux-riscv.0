Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C2BC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tktJZtGTSEY1uChXSM4FFXcfOZVRJX1qxcKa+UmGhKU=; b=MEV5xTmTel9rSZ
	r82kEI9gWRcC99ZGjAm1sYsVH74GOG26tPxccHC5HmU5H8R2IDfTTdzvqwp5MjqAu5hkzFCWIBgGR
	ZG89XtS9jhsFDtzWKKYgticnm+TqafaSWyQrmeFGR9vUkpV6wJB6UPfx2JgldJR7GYw08Qz0mcBeP
	CrSYUcmy7FzL8Eq/ZG3gpXwNTI7bp6E11hKpSlp7brLIcMyCx1jLfw31tNJpdLKTp2fXkpx3eLEKe
	g9FqCU5mfTAeeY0qd+gnQOGujyFIWo9Orx644LAwcZcqO7+4xtB1QIZ58O4k+0Cb8L/C0Tr/LMsWV
	E69dVuU1f88jHuyg76OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooWC-00000001AUr-15TE;
	Mon, 25 Mar 2024 17:53:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVP-000000019mo-0vVr;
	Mon, 25 Mar 2024 17:53:09 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1dddbe47ac1so35475845ad.1;
        Mon, 25 Mar 2024 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389185; x=1711993985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
        b=HkdYmrfApVCT2Vbc5JxPSI2TAOhXHg6cUYLVKxY8qz4fp8d8esCK4xV/0wBxMvZtoB
         f/nKMsEeNMuKzACw68lOVpI2dP1DyjKpK5lNyzCziKMb6XfAG29HVkBBW9UoxISOAZf5
         AYrPqE242NSEumlH6RYby/eqHe8fqpRaA3XycKbay8+FUOPph828PwupQAoXRZOEMzIJ
         vyB/Ya4OxTkz39UfXtwMuQFqpq/oPXi5tvHd9XYlcv04bbNrPFUwYRuoXGZiuqLvLtZ3
         PMPb0d5qAY3jL5KDE84k/ZpUL3SHUcyaCdAUW5as0P8IJt/6XWNoQRom5X0kRebUi2la
         5U/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389185; x=1711993985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yZNhbleKNla2Ie/ZEatm6EVk1jlCAGbsmm+zF41MFkk=;
        b=YM6qHtjxPHfPCxhdlIc+k76vT06uA2TpYInPvc3iQXwzekcJbTrys4zbDuaKoRaVE6
         mSnYc1QLtdm033PnxFyqbEhXI3GO0J0e9qvgFQ3LzdD4okruWkGRLbOgDNHQif84oTUX
         PyQ9vmyB9cH56lp0YwbTn2VUWRlRvmD1+MNCWjEpEhVTaBkNfc3SF+gJ9EyUmsc07th4
         Im6C46WSGdfrEn2gef8ZDzlGfZQKL81EUUh6Stj+nmpG0G5Bn+RHcKz1A/kO0C3Lo2KA
         ozIQpDAKveYibfQZQZ7N5DERRngmDnk9eDLQptxsKCXzwBsaX/7L0pmvNNtpItAqM+vO
         wheQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDjTRb9f/Phb69sEQFdD1xw65Qs6+/W1E4OkxvtrG+UORuhjmTqWbWeJOi1VHjXCoE0z56Fo4xd+Nf3TkCkG8gA2BMOec16HJX7Jp1r4iMaS4Aoz9YSerGoOyYahhoEHCWRpFsMYBRKHJkHsK6EfBgxUiMx/w=
X-Gm-Message-State: AOJu0YxyvUEhWbCTHTH5awoYGOfh+fCcWs2pk7jexVEtQWyXsTKAqgIl
	epvgtaTfB/Mkh20PrRs4gfndHPsl8qwW+biXeHETyq21YrqP88cu
X-Google-Smtp-Source: AGHT+IEKWGuzpihfez0cIj5Jcw9QuULSWV5Y1XxkrBzCrtkepZtfQa7QDls+G+yzQdtdIaLpfh3muA==
X-Received: by 2002:a17:902:e810:b0:1e0:960b:f395 with SMTP id u16-20020a170902e81000b001e0960bf395mr11373029plg.25.1711389185110;
        Mon, 25 Mar 2024 10:53:05 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001e0c568ae8fsm1586519plx.192.2024.03.25.10.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:04 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH v2 06/14] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Mon, 25 Mar 2024 10:52:40 -0700
Message-Id: <20240325175248.1499046-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105307_488223_D3ACE31E 
X-CRM114-Status: GOOD (  13.99  )
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
confusing.

The first warning can be suppressed by using START_SUPPRESSED_WARNING()
and END_SUPPRESSED_WARNING() around the call to rtnl_unlock(). To suppress
the second warning, it is necessary to set debug_locks_silent while the
rtnl lock is held.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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
