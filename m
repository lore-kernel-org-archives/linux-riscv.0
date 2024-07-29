Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D27C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d95DVW1IydL2inS28OJXFQdOjpzAX0EI6iG6Wg93hlc=; b=NQi7lrpDtzZEkv
	mHq3xSo6d8ci7Uk8xjPatgZUljGZbbIpybwzEas0OC9Bz+BwZcGEvMPD/48Wj7vxh1oeOZTtaGjsX
	tJ3IyrJRJkwnhosxkScLMHVN5U0vuLMnWKF/WkU3BwmhZ8dZEG5+YJfSkN2QcdqSq0waiFC67bbGW
	oHKd2TMJdVS3SYF8KGb2W/wyDsGy9pH8Hp3ewUIjLww2HaBw33sy9/A0zBUKvOc5tz2lIFnuYS35E
	g0Ef3fSHCGwTNO8WMaR4uh1wklHlYfZZ0qet4m2cvfWgYiRR7o8ln7fZZcXcuOTI+rmKwWEDWejHN
	WV2+xRijkUH8O5eo660w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXTa-0000000Cixz-1ZFh;
	Mon, 29 Jul 2024 21:00:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYXTW-0000000Cix6-1Sh7
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 21:00:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fee6435a34so21760125ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jul 2024 14:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722286809; x=1722891609; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBWajwmBux3IySKTOndFyzMvC8g+ycc5mQWgLJDN1Es=;
        b=t3Ltarv+0KUDF6G20U+cgIrtEeMnr9erXL6xTCCR9mSEAqDNCg/e/vHmF03aVXZpee
         fddl4H7wnSZh1uQdzU5nWCGhMwdu6gFlKrQZ0LQWahO//lWt4Ts+h1whFVDa9SK8wxVT
         AZ2kBICvruRjgLYMiRRo4VuT2fkA8UhP8tEoemCqVDEQ6luQb2pKRr607s8WQ26dR+uP
         /fXsHk/fdr3C4cGxd5Iz/bYk9j9Hihb22ckL4aPTRZ6ZF6G++0axAoaV774+i7159e5g
         Ym7/VfWCqRGltaEYf9urOyfxgSt62iz8nvA7qAJYf8SaIiELoL6E7y0QbRak8c+3JIAT
         hwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722286809; x=1722891609;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBWajwmBux3IySKTOndFyzMvC8g+ycc5mQWgLJDN1Es=;
        b=cuTqJOibgs68TKIMqBm16mbVeCzMeNG1sJlENI7uW7AfHvxClSace9KylQM6s2ruid
         rXbGGMQ+mqpZFUIL5XUwjvk5Xaf0iY+DnPP4wd8cPtD+hqhNkNTc7/CUF5n0JFkm+E6V
         4IWhRKPp52Giq3N10PZvBzCBatk+/QnPe1x15Jm7I7m7yMeBEWTX+AHsQfL9QePJ3sN+
         zK9MxyD9KXCPOV7EbDPBSVCsodWfFoBPDNJmGXjmRCGhNAFWUtNB5P/FzwO0zgvF6dne
         W6/r0c9Um/nnpQ7Yv6o0XzHPSdW8QpFGmejTQi8liO7RiMYF5ybU3uTphVKIljzgMXsi
         T4sA==
X-Gm-Message-State: AOJu0YzCbStcOxaFOCXntCZkvTNFU87X7MzmuN7XzN4n00fB55mGBV3Y
	N3N18wyS5OUzupBU8SFQ0C9L4ZLxiO1TWsth6WnqU+PGJfs/N94j+fIIg6iqHhI=
X-Google-Smtp-Source: AGHT+IFWN7XJGgnRNOKYhAQ6RvEV2hbm7GBZQq7We5j4dQZlZ7s5wxd28Sb/O6a6Dv+4C1RDj/nozA==
X-Received: by 2002:a17:902:e847:b0:1fd:82fa:dfc2 with SMTP id d9443c01a7336-1ff048e58b7mr73464585ad.50.1722286808802;
        Mon, 29 Jul 2024 14:00:08 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f71d61sm87341745ad.225.2024.07.29.14.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 14:00:08 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH 0/2] riscv: Add missing licenses
Date: Mon, 29 Jul 2024 14:00:01 -0700
Message-Id: <20240729-riscv_fence_license-v1-0-7d5648069640@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANECqGYC/x3MWwqAIBBG4a3EPCekdrOtRETYXw2EhQMRRHtPe
 vweznlIEBlCXfZQxMXCR0jQeUZ+m8IKxXMymcKURWOciiz+GhcEj3FnjyBQzmltrW3bsqoplWf
 Ewvd/7Yf3/QCUEoX7ZQAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722286807; l=547;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=Yi6V9x43F/1uwHOEhequ+8ZQdQJjW4IKBZXT5t/IVaA=;
 b=iPYM7ZTwQPu/7qsVc2YKgUpqTXA5CKXRA7Mpj7X3IuVmrO/lZY/mb2jb5s4aswyC/c2c9V24P
 Qs0Ckwjy3CmDZ/Ig/qME1XhYeVxPTK4wlGtLNGejqBIMsHenESXLE1L
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_140010_426077_28BD01CC 
X-CRM114-Status: UNSURE (   6.86  )
X-CRM114-Notice: Please train this message.
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

I was poking around some files and noticed that vmalloc.h and fence.h
were missing licenses. This series simply adds in those licenses.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Charlie Jenkins (2):
      riscv: Add license to fence.h
      riscv: Add license to vmalloc.h

 arch/riscv/include/asm/fence.h   | 1 +
 arch/riscv/include/asm/vmalloc.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240729-riscv_fence_license-991133388456
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
