Return-Path: <SRS0=8FDR=BZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456A0C433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 22:40:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEEFD2065C
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2020 22:40:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dGJZAAXS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="VOLisn9l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEEFD2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=b5ZGqy+2yppIscuh3WevgtLb+1jyr/bMOopPOoWoR3g=; b=dGJZAAXSzRsJXClJj6tNOycTxH
	cqmR4cvBFg5FkpSIFkAfwi68gaxqVTgTMx+QiPlqG/6PVu8GKtoMB07w3Ure6yA2+B1taIVyVQrWq
	wsfyn9cDqx8N4sPFHM4V4iism6OqiMlOP+npeceDg9VXEseHoXg517BsHNI1Pdc1fmQB3UdNQBTM/
	wkBQjIzW5/0C0Cigvm0+bt8xAoh+OPU9oD8g9/pcDFG4wr4/5Mdv84gymggtk29vwA4vXGayjZN+d
	7hbxbqUKsE5g7cabQY/n8bOwA2LReXt/YVP5JRE32uYQ9xhLY++yFUEA3+REG48O/BsMB16ziRIBr
	I15qqwaw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k74q3-0006X2-L3; Sat, 15 Aug 2020 22:39:47 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k74q0-0006VV-Iz
 for linux-riscv@lists.infradead.org; Sat, 15 Aug 2020 22:39:45 +0000
Received: by mail-pf1-x444.google.com with SMTP id r11so6271095pfl.11
 for <linux-riscv@lists.infradead.org>; Sat, 15 Aug 2020 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=9FapJhQoBMtbwij74lQLZNQhsqQ3XULhrJx0z/bufEw=;
 b=VOLisn9lMLSxG5HeCc/GDPJVLhYXcUOkPQvtJVbMdZZ+KN13M7x+BfajJZodhzT5dh
 dx/AzKIqzYCj4dzEbB0aouk8GKslw2RKb9llv2xUmgAYs8V2P2ezXoHpW4lFKkVRh/op
 uZ6qGBWM10hVKVjMOQeH68EFZCrIp+ajGasRZzORZLI/+mskyOmVO06uulOFjyYRlZpf
 f23krKSnAncwQ3xBF809DKKLM6JJ4u1RUIs4KFvnJhiw4FsUcPwFjYmtNqv/M3rWzOUS
 LSPE5f3la1ZOovsXrM/rQTMOR6i0tfQqMTJgOguxcBcWfeaThOwX72lhvoiYndnpYDWz
 8Jag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=9FapJhQoBMtbwij74lQLZNQhsqQ3XULhrJx0z/bufEw=;
 b=qAza/O4ooVm02mE3dGy1GBsvD6I1vQ+qqkEoCYnk0wpbNGnkANyZ8lY9dkrex5O0yK
 O74iarIbOkFmHRgXqJG0yWnUuIPaPFXQIGz5pC90S6ne/vuPT81Tk9EZq/IfHAelQeKX
 96VPJWQY65SKRwpKLUAGmoPbRcJoeLFqRMXsxOkaaJAenwrdcDfI8H49EkmgC41dY5oB
 OiCMeVx0whwlqifS1o+GcihWYDO3O/91z6jzxAcHB4X/xR7J/eXLu4j3LhFIBRB4NCOx
 s917+9OdfCJQ+2tbQEGXw7mU0V11MiGi/33Pwls0BpvPxpeMfpa1Dw1tRaJoUfrlkkLc
 YfoQ==
X-Gm-Message-State: AOAM530zDSeHiMRjsShSVeCrV3i5POIhViQXi95HqCO+c68/F75e2q1a
 CDvQyoZr9yM6EwXt4XwuLYXh46wEypSN8A==
X-Google-Smtp-Source: ABdhPJzsYbLqVxLqhgxvTWlSgTVE59AvXa+OUOnRWknRroNcbhKvWE8v+384QzHP3wr3psM6BiPCTA==
X-Received: by 2002:a62:90:: with SMTP id 138mr6515631pfa.0.1597531182000;
 Sat, 15 Aug 2020 15:39:42 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id s22sm13136870pfh.16.2020.08.15.15.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Aug 2020 15:39:41 -0700 (PDT)
Date: Sat, 15 Aug 2020 15:39:41 -0700 (PDT)
X-Google-Original-Date: Sat, 15 Aug 2020 15:39:35 PDT (-0700)
Subject: [GIT PULL] A RISC-V Fix for 5.9
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-9e581f1d-3696-40ba-8a64-b0910d6c85bb@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200815_183944_658677_715A91B8 
X-CRM114-Status: GOOD (  13.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

merged tag 'riscv-for-linus-5.9-mw0'
The following changes since commit dbf83817315d9ce93b3e5b1c83a167f537245bd8:

  Merge tag 'riscv-for-linus-5.9-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2020-08-07 10:11:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-mw1

for you to fetch changes up to 76d4467a97bd8c4bb01e810a5129c8f96d7dcbf8:

  riscv: Setup exception vector for nommu platform (2020-08-14 16:28:20 -0700)

----------------------------------------------------------------
A RISC-V Fix for 5.9

I collected a single fix during the merge window: we managed to break the early
trap setup on !MMU, this patch fixes it.

The power keeps going on here so I haven't have a chance to give this the
testing I usually would, but I don't have a Kendryte anyway so I doubt I'd pick
up anything subtle even if I was to test.  The patch seems pretty safe and it's
still early, so I don't see any reason to let it sit around.

It's fairly late so if it misses the merge window that's not a big deal.  I'll
definately have stuff for next week, so I'll just start from whenever this
lands.

----------------------------------------------------------------
Qiu Wenbo (1):
      riscv: Setup exception vector for nommu platform

 arch/riscv/kernel/head.S | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
