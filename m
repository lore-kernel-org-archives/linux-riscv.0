Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98B1C54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vI3AEo0Yi1a9cqOiPKIFCoZbOA7ImacFrvtVte1xWIE=; b=HazA+tMDVlpTfr
	bIst4QlmgsJmLE+58MoDxCD03kJTN2craELrZWHpjri1OwCx7UNZZ0nSppiBYA7vqtkD8FDQ2QcUd
	UcvznbLYsxWaMAbeLf0n4YY5fZcAv9UYLoNzha798psnOm2O2+Y1XkrR2PhrmcnTJB1l/6oL7/yty
	zfx8YUvs8rHjoYHNGiMdLVrA/RNCt6A3YMboFGOyugE/bULmnnJ5bM0VEvpgHjnmOKMFv9DJ0wEYQ
	gJFhmVrOXj9P9hChWWTJGdGy5wqgzUy1VlGT3ZIRgV4LYFGVOp805ZKoxiZmSZq0Ov7qpWu6S8zU0
	GasDjoV232lkC/oV/8tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XB-00000006ieb-4ArO;
	Tue, 12 Mar 2024 17:03:26 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5X4-00000006iZV-1fqQ;
	Tue, 12 Mar 2024 17:03:20 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1dd6412da28so941025ad.3;
        Tue, 12 Mar 2024 10:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710262995; x=1710867795; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
        b=Tb2kBAsLmATcSC5So2iRpN0w+bPplSeYoGoNlGqnmS6kVWmkKN5EcLe0l0qQCz6x41
         x3yn06IKQy2DifMImRvLzf9b3bh4ke49Sf/Ml/yzlYP3NzgRE3V8ThpAvphIonVaAVan
         IeWgrP0YWAwDAAweuTPE4fJJZO3XRHzxMkg3LI8clQjP/jcUccL7fXOAWep1KrMK7qpR
         xLz9NxZpVrsCJK1woKDZ2eTEdCGbpHjCZHQWelLmcFyQerop0FV2sD06pou2VGBmV+e3
         j1iP+x+4739ZmlzMtKpZWpgj8CCPo7mjpD/OFchBUEK7vBVqFv0HGS54M6Ejm+qPzo4H
         uWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262995; x=1710867795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WLftE/7MjlMuOSj897HlMQUMVZbmkOmcm7ijw8JWvLk=;
        b=vGHDBDcRTfqxO7Xj6dEaDMwlMklPE9qeTFlqBq7t7jxbFxMEC4bZAaUkiktkvRdckP
         rf/g9VGGz/GHbRMtiUKiz+VjR+s+Rt7o09oLjlenpjzbhdseH6f+vcTeefI7AjWHnaUB
         ioGChC3hdrLZoVTOuOooRhAsECekEd/NXC9+1GemJGEKlUTrc3LrqKAkdXPl39iIBM9t
         yvyxJrOf88zA3sunpOd5DYSrNOsnVDy2Ox3WZxDh/Sy+vqcb+vSQ+vftXQsaE0Rs13NL
         76M4N7f7U67XMM1bLINOoKW5klv6COo1yzgjB6Onk8TQSQU2aWS7PzbIcAJo44GqHeCR
         3LkA==
X-Forwarded-Encrypted: i=1; AJvYcCUuZM+CeJihJpxk0Fyh6naeOl1AXquX4oIJcYtXytJXSzn3SYYTzCfVS00vMZDXAAcN+qK1cCvbSe+n4z3dUdhQHajBPelwOV/RJe0FTQsFFRndcqyEWu5K0EiFhDVf2uBE8NQaT2kGmiIQWd+tZ3Ser0s/zvE=
X-Gm-Message-State: AOJu0YzWqhS5KAqLSlLaBQn1nAC7cdALR1kPi6VhDxrJ69q71KeZ98dK
	X2KE0jyuNsSzM8DcMLMHn4RMEfLQcW/Qudv5ZQe7BjuUkE38kLAj
X-Google-Smtp-Source: AGHT+IGoSNJSdzshXUinY0deqrpWSsXfjdp27VpnRBXFH0xqKuZltMGKwFFXD7x5fWGnOCLrPfDYHw==
X-Received: by 2002:a17:902:7ec9:b0:1dd:b681:990e with SMTP id p9-20020a1709027ec900b001ddb681990emr2092458plb.36.1710262994820;
        Tue, 12 Mar 2024 10:03:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r20-20020a170902c61400b001dd02f4c8fcsm6942533plr.139.2024.03.12.10.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:13 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 00/14] Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:02:55 -0700
Message-Id: <20240312170309.2546362-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100318_530265_6E6277BC 
X-CRM114-Status: GOOD (  17.97  )
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

Some unit tests intentionally trigger warning backtraces by passing bad
parameters to kernel API functions. Such unit tests typically check the
return value from such calls, not the existence of the warning backtrace.

Such intentionally generated warning backtraces are neither desirable
nor useful for a number of reasons.
- They can result in overlooked real problems.
- A warning that suddenly starts to show up in unit tests needs to be
  investigated and has to be marked to be ignored, for example by
  adjusting filter scripts. Such filters are ad-hoc because there is
  no real standard format for warnings. On top of that, such filter
  scripts would require constant maintenance.

One option to address problem would be to add messages such as "expected
warning backtraces start / end here" to the kernel log.  However, that
would again require filter scripts, it might result in missing real
problematic warning backtraces triggered while the test is running, and
the irrelevant backtrace(s) would still clog the kernel log.

Solve the problem by providing a means to identify and suppress specific
warning backtraces while executing test code. Support suppressing multiple
backtraces while at the same time limiting changes to generic code to the
absolute minimum. Architecture specific changes are kept at minimum by
retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
CONFIG_KUNIT are enabled.

The first patch of the series introduces the necessary infrastructure.
The second patch introduces support for counting suppressed backtraces.
This capability is used in patch three to implement unit tests.
Patch four documents the new API.
The next two patches add support for suppressing backtraces in drm_rect
and dev_addr_lists unit tests. These patches are intended to serve as
examples for the use of the functionality introduced with this series.
The remaining patches implement the necessary changes for all
architectures with GENERIC_BUG support.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled to avoid image
  size increases if CONFIG_KUNIT=n. There would be some benefits to
  adding those pointers all the time (reduced complexity, ability to
  display function names in BUG/WARNING messages). That change, if
  desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
