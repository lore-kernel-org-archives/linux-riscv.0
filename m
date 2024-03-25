Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A17C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tsxYfo2X+i2YFuWQGrx/rGKo0yN9imNsOnHr12emU1Y=; b=4GcyR9xhh9nsSQ
	gtT3hXHt1qmIB5BYWmgrfCCTdVq1rH7d0gST/n7GjOUY8F5Xn4LfwlAf9F5pqDaT6bD1kPOr96ek5
	Zs+Y/sAGm7iPYqmeUiBbYfs7uXg5p3t+r49jHL6FY+PSKDHmEzWqlwpzwPl0hUNtqD2FHDOvS3dla
	OkEE3BUXn8u6d4GAlHAMlfgKZr24L1I6gm5iOG6YMR1OEhO5t/xoAagi6ylLzbsxzdw50KfXd+DwK
	xYFjtXqU///XzeuvDFJmJtSrS2sXsXj0krrIcY3Jwz/analCEiQoep1zddLkmp4zUbZzLlAxaKTQ9
	Cqs8KdHJujavEizmT9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVN-000000019n3-3VBC;
	Mon, 25 Mar 2024 17:53:05 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVI-000000019kP-2KAz;
	Mon, 25 Mar 2024 17:53:02 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ea8a0d1a05so1723153b3a.1;
        Mon, 25 Mar 2024 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389175; x=1711993975; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
        b=lfD1J+gKB8vST6+lT/gzYCiAl8ufZE0/Qbhv5tfqxcSs3sP6NoKvOgaWOzp6wO8M0b
         Em9ZdbFZLIKOy0OpEJUgQDub7rg8q9lHZuPo9l/pT7xT2gjrRDRFghppM6idEqPkHsfB
         gZulZD5Ibhhn4TGV+NHgDWJXYa/vdjY7s2nCZcrBIqd+0ypiJJesr4C3/Vhdgw+gttui
         KDbcDFPO5iLMAdGMbNnwWGmhuLbK7UAiVmtsXnimMp+2ffBjzEv0gzOrf/OjFlkHMrdC
         oL9/Bx+ZCT87tfBm2feO4Q2t5xM0BvFJ73qIpourmjJxwJ5EqzyWxeqWvsddDrttj510
         sGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389175; x=1711993975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNSADZIa55EnhS6o0yIL3ifpTu+GjUejKXDxEmLThHE=;
        b=r+lcOgguSWaoWhr46b03Wba2t17xlC81GYUzhnKe2bK/OMUtvJjFRgoNag1tIjMz4f
         zZvrXnz5PNLl/xKL0OWYIPZtMtrZ/HYC9KQHik8b7LbScjKMlE0SNYh4tFkjsneLybwa
         2PF1FUuIgo76sA1iRA3mF1R0T8ShHUN79ZeY+2Yj8P3PfwWMGHT1BjFOs1O2p+OB1+gT
         uoXll9s1Fc/H0OZ/OYN0nx6Yxxh67w6z//QobE9k05V+EKy5K2xTr3bTCGI87S61QBdQ
         zkjFnkRdNYiypsI4HuOl94muc6INXZTVozZMY7VhbudvpQBsXCo4eYC5Np6IOKh6mZQZ
         plTg==
X-Forwarded-Encrypted: i=1; AJvYcCXTU8pUa9dqkmnTiHb1AHJNCipb0v7+AY1JxGiQxOvdxOqgeC3o11HePmKadpzRy/TNbjZSEnfIIIkLjwjW2UUBMmoYqvckqy3Fs7KuBEajdpxIe7JXknwB+NTBsT6obliUhDfLvTRfqev8tdaDR9m5uu0di7s=
X-Gm-Message-State: AOJu0YyulRYoAwsfAy56kLdphd0LvxNxMxrewt2vMw5EkS3OWv5m6jY+
	zFo7XWj5JoqvyCKLcajVSrwYQOUEatFJe7n9pdzY0v+BiBzBDld0
X-Google-Smtp-Source: AGHT+IGIDWtPHdUbX+7LWIxScptU3Z3k9sozN35URR01B7XvfxcUzrh1Z1HYjZAKi2mO+Me8ITFPPw==
X-Received: by 2002:a05:6a20:6a0e:b0:1a3:c4ba:a453 with SMTP id p14-20020a056a206a0e00b001a3c4baa453mr6509702pzk.7.1711389175417;
        Mon, 25 Mar 2024 10:52:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id dr18-20020a056a020fd200b005cd835182c5sm5239787pgb.79.2024.03.25.10.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:52:53 -0700 (PDT)
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
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH v2 00/14] Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:34 -0700
Message-Id: <20240325175248.1499046-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105300_643388_72C80815 
X-CRM114-Status: GOOD (  19.52  )
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

With CONFIG_KUNIT enabled, image size increase with this series applied is
approximately 1%. The image size increase (and with it the functionality
introduced by this series) can be avoided by disabling
CONFIG_KUNIT_SUPPRESS_BACKTRACE.

This series is based on the RFC patch and subsequent discussion at
https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
and offers a more comprehensive solution of the problem discussed there.

Design note:
  Function pointers are only added to the __bug_table section if both
  CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
  to avoid image size increases if CONFIG_KUNIT is disabled. There would be
  some benefits to adding those pointers all the time (reduced complexity,
  ability to display function names in BUG/WARNING messages). That change,
  if desired, can be made later.

Checkpatch note:
  Remaining checkpatch errors and warnings were deliberately ignored.
  Some are triggered by matching coding style or by comments interpreted
  as code, others by assembler macros which are disliked by checkpatch.
  Suggestions for improvements are welcome.

Changes since RFC:
- Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
- Minor cleanups and bug fixes
- Added support for all affected architectures
- Added support for counting suppressed warnings
- Added unit tests using those counters
- Added patch to suppress warning backtraces in dev_addr_lists tests

Changes since v1:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
  [I retained those tags since there have been no functional changes]
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
  default.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
