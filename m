Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159B4C54E66
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8AOfJwZrk7GYo1MOzxkGaQdID8iKP5GOWLgl4ULalbU=; b=X56WfEH1Sqe4HI
	7bPK5qMcB2NBJTU2Y1htPtRWeeS5qbeAZDZ7hXSqA2LGp4PYDRViYME6gZ9eyaJUWN0Xs5evESClS
	8MEt/0dSycw6/Oi5NBw7wkuuzsTDordXjR6oIUP9iw7e5YLs6yqmd3VxSs/sK5cNGnMuNXFm83+Fv
	nBjsVOP0OYuW8U+0kl3APXZvs959DZkEDqkpkfaYgK2tE+zA9eeFEXxcVkk1UdTACl4fBbgHAO62o
	pq4z4US3GJNaE5jtdSHZW2IfdeEI19x/1UgrKwOlbA5qb6cg8QMocLYLFPlt4AZRh0g+B1iA/zlhs
	ojxPdMWVhuQ/35xAezyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qR-00000007IBl-0uVB;
	Tue, 12 Mar 2024 19:31:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XI-00000006ijt-1ogq;
	Tue, 12 Mar 2024 17:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=; b=UJ90j4X8rUu6lFtsW1Bptts8Mq
	97X11bK7Tq96V0+GzAmod/S8D8F959Tzrs78QOzmfMHEoovvYq0E9k30tQWiIirzGBYt/wLntVZDM
	0K80PnjER6YXXxPdDy8qM3BDjvDlxmNlzsjrSUWGhAvIyckRsHLVFh9XGUeZ+sJVlBU9VxbBB9FlQ
	p8DWufeRTrrECEZhyF+vOU8Uq6vDsW1QU9MHqnNqyhxCxZq6LILhcbgxWe3JqySsv8aWuiK2Cbgzd
	vg6Y3D/v17iCdyedSLYvH8m5GzFSKUaUdF5aQ7JQJ0FmGaYViBZ3Bx9u71dBCPCdO/vLaxiurW4F3
	m1tV6Phw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XF-00000009YdE-1PZv;
	Tue, 12 Mar 2024 17:03:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1dd5df90170so518565ad.0;
        Tue, 12 Mar 2024 10:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263006; x=1710867806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
        b=jAoPIwbxWrHtMtAAhH6U4842hxKWFVdXZcO5CSoRr8TXcx53cWAOW5gH0ybqpYcY83
         ET5gm1uZ1XyWxqwvKbdBcqViCejRx1fcOGtQ9s3NPUQVitzPwyMNhTlBUFukIT8S/mVe
         PjahDe5/ODmXkRI8g/XHJdkEFK6r4hJHD64VxB/uUdIOwW9gaEC2q23V+U2TTlFX0M1s
         KI8k03HX3mttP4sqJX/KF3hnmWSa24fDSvztAEb/Pt8K8YZw95XrR3/TS7pdal1i6Slq
         GxukoN7Q7X7KXhNUj0s+j5RFsh5zq4jrvkaqjLpzGcHmcb+TvrSdR4ECtdlGbaakMK9L
         SIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263006; x=1710867806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mFp+F6/qbMDKwppN9CX4ZWrh/15b9XKC6E4V4vAKNpU=;
        b=S5JSks6/UKnXFMv6yosi8LSuhQz1c4V9Nb3pEJ/K36isKaN4e6x81oBogTVSBW0QDf
         eBPXXPNgh6zcE6rC5dfR8/jfZyFMSqjDoVnsYZ3SDSCoPJvgOZj5k5sYonCbim2SWLG4
         ktVwT5uKLi3yj9C+UjzJX6eVpJqsIQL3vse5fC0lJKvoGU6qMhf/nZRcyxD4buSg8Hv+
         c7t5fPnOXos5ItPg34PfP5MGG/gp/hLSmMLiPAj7p5QCH9wJbmnRgzUn5Bg3thSLqE3H
         /ln7JO08qC9TN6UwQ/JYzs3TthIHXdGPvR6ZraD1Qb7U3lFP6A/xuMApDQ6NGEPFfGW1
         r9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpoSeSbHz7ytItbmjo/spoEhSnsfFY1YJ6vV1pofN4dTgfKzvb7jnU/5tywyEQUgOVTd3hnQxVxgxUf7Ijs7KItRVnehuJUudG6vT31S9g3PpYIXtpLgDRhCu3Ku3IhVhvtqkNqL5eHnDhRPgTE1ZI1QdkEvY=
X-Gm-Message-State: AOJu0YxDb1UdyWiz4Yp82K3X2DfHen7mVeK7o1kIAuNGe2x9wJgKhZKR
	EOWqD7+o1seyC5B/3uQC00SRazSS1NV29OLdrwmvX3M9sPTKYdlY
X-Google-Smtp-Source: AGHT+IFHgAu4TIvnFI5COGYb5tswxOQ5AvbfbseYntF0tu2SzSXjMyu1g4BetZFgaKzrp5WqY1rOuQ==
X-Received: by 2002:a17:902:db10:b0:1dd:8ed0:59d0 with SMTP id m16-20020a170902db1000b001dd8ed059d0mr179469plx.17.1710263006272;
        Tue, 12 Mar 2024 10:03:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001d9a42f6183sm6958740pld.45.2024.03.12.10.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
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
	netdev@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 06/14] net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
Date: Tue, 12 Mar 2024 10:03:01 -0700
Message-Id: <20240312170309.2546362-7-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_170329_506225_645B3421 
X-CRM114-Status: GOOD (  13.74  )
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

Cc: David Gow <davidgow@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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
