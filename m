Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2898CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqCywzCmnJJw2KoYjd8bxGnSu9qAeh+IZLME3qG1iYQ=; b=Sx4I+9iTMFSPvQ
	l4mU0Z0cTd8XbqgKI4hSxiI/O6Ri9EfNDh8dHWHakMcds64fB30LhUseRI1rcuAYKmJc/NwufiPqW
	DDtkFtiUQ2T3nBOnTvkp13cRDQsrycx2FCWeJR071otItBD6Xu7VLIxW193FdNJy2ly7tgsmWkP8p
	mWT07rsXrAaTKZ15uGXKemv7LKJ+iw+bCsX7o+RUA+gG37lpWxsjmoamVERm0cU1j5ivgS61VWDZZ
	Yjz2ovqLr2gbsPWcoBm5OVmtm+76vQwZjonfuxPmHeOmTLiN0Wcez6pW7HjUkE2fSQyTMoGQG98zw
	tvNJ2HFZXN3h+RelDp8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0Yf-0000000G9oK-2jee;
	Wed, 03 Apr 2024 13:21:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XF-0000000G8mI-2u0r;
	Wed, 03 Apr 2024 13:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=; b=GBDcDp+ly3uACKwmnqVq3Pzc2W
	xfxq5cGJuEBeqpq9BJHsRQXrbg9RmYySh543zoUhBmjmjgwL+IW9a6PYZdHQ7lBN2n8/rpXqBTbpE
	3iK0kHBC2pbz4MkOmSf8odtJe3ewTaJ1HB0bi1DKDW94XJhbH9kyHneVlXBSwDRhrvHJm9Lh/Mwgx
	LI5sZR1XXBNm4F+Zzo6MTxCJnEVIAvo+4e2irov0uoQMJuKb78xPEeOyT5i5Ty6S8/2+4Mg/dgPoN
	f6A/X3DDTo9yw0/Q0E/ZRORE7e43Fx4phxwHBJ9MdMGOQfmbLB4AhoSM+TQd4hOP8YwVbZLMFozdN
	ey/vWfxw==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XA-00000005eWX-43p7;
	Wed, 03 Apr 2024 13:20:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1e27c303573so13522905ad.3;
        Wed, 03 Apr 2024 06:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150404; x=1712755204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
        b=cLhb9uJ20UEOCu3HqctWjUf3+2ggpQ5sH5ZuYbdG4QFQ2PAdcevvW1411OmbPK5OtP
         T68js+3z/NHi23lZDP+CxI4q/lGbVPl9WckEsiEEMZUOt7KMZo4g1I/JXJHdvv+bGh8Q
         ZzVu5xM4W+xL1nOS0IwH8e9FbFY8I916+wmwy0WHSGTNtIdUTI+WN9wr2wubH8/v58P6
         995z5WNPVust45zVSOJi+5pnH826eHP8+V6VCbJZCYGj4taNkQa0zmFCRoOpVMcJ7+qC
         Wismnug2KxOhjbkh+aAXnK6NqkIdOpjx7qX/8iUH68oSatKdfMucFHALE5EYjUpfs1Fs
         9cww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150404; x=1712755204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cRPOdz6AnxublM7n3KmjYybYhLan42asyWOmMDzsw+o=;
        b=mJPNWK0LHHtYJO6ajvYvRlihqR6CJNfQ/JucaBhZnwCbCjtKhsjArqPQFvtuXRmZZH
         nbSft14Wpjav63Q9KRQ2qMFAoHrn5J78zZVGTxhOBGWGWwrs5x0fJzNdE6Q5tO+QoIKa
         dBOU1NZEsBBg/WMmCvXkix14P/X3RATeCJMWL9tlEtf3t3KlHaCnV2frsh0lGzCUIZmN
         QZnLoRqaiaJUYjPt9OAy/blkaRvVGSqxLPoI+5A4HWQcdCjq2hMAwfVqYWf3teHKtUe+
         YgEuyQ/rsK70fJrXSoO/B1zi2YRAPPTWKfZtX+JjfAjAaY7jeNDj9pvYgA1gnloqsS7M
         rPPw==
X-Forwarded-Encrypted: i=1; AJvYcCVMgtesJ4r7eJ9Ksb/KfsBmXjTOAhwtY7bO2iFt2sINUp7bd4xtih64KFfwE0xYf94ImMQ9wkfZoDulupr8J6eHo1cf6lC3LcXKE1VeuuTuNSFMr9vA68hFWN3KmwsW2taI0psajW/pxSkPZW7cwIM/UhhodOM=
X-Gm-Message-State: AOJu0YwY1zCQoZ1MayW1E8Dxx9Ih7d9djRsohQH5EzRWNb4JSJxabqpI
	gcJwUSc/i7dooRMjKdGJv1M18U7QXZVVg6kAG57OtSOT7NnxVCG3
X-Google-Smtp-Source: AGHT+IGx8oRVikcJmoZrmV6I1PpggSRavr/G5SNCkYR+IkJlaqrk2wHgg+ZazQ8Nymmw82Dh4v/u5A==
X-Received: by 2002:a17:903:32cc:b0:1e2:2d0c:fef0 with SMTP id i12-20020a17090332cc00b001e22d0cfef0mr17310539plr.48.1712150404272;
        Wed, 03 Apr 2024 06:20:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d5-20020a170903230500b001dd4d0082c8sm3855527plh.216.2024.04.03.06.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:03 -0700 (PDT)
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
	Simon Horman <horms@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v3 13/15] sh: Move defines needed for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:34 -0700
Message-Id: <20240403131936.787234-14-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142009_018342_D65191C4 
X-CRM114-Status: GOOD (  10.45  )
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

Declaring the defines needed for suppressing warning inside
'#ifdef CONFIG_DEBUG_BUGVERBOSE' results in a kerneldoc warning.

.../bug.h:29: warning: expecting prototype for _EMIT_BUG_ENTRY().
	Prototype was for HAVE_BUG_FUNCTION() instead

Move the defines above the kerneldoc entry for _EMIT_BUG_ENTRY
to make kerneldoc happy.

Reported-by: Simon Horman <horms@kernel.org>
Cc: Simon Horman <horms@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Added patch. Possibly squash into previous patch.

 arch/sh/include/asm/bug.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 470ce6567d20..bf4947d51d69 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -11,6 +11,15 @@
 #define HAVE_ARCH_BUG
 #define HAVE_ARCH_WARN_ON
 
+#ifdef CONFIG_DEBUG_BUGVERBOSE
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+#endif /* CONFIG_DEBUG_BUGVERBOSE */
+
 /**
  * _EMIT_BUG_ENTRY
  * %1 - __FILE__
@@ -25,13 +34,6 @@
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
-#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
-# define HAVE_BUG_FUNCTION
-# define __BUG_FUNC_PTR	"\t.long %O2\n"
-#else
-# define __BUG_FUNC_PTR
-#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
-
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
