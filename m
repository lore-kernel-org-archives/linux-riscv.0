Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8494FC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YsByibaAc3AzGNHRl/Sa/WpC//STJul8rzL18gPaGbY=; b=RL6I/pXD2Zqv+4AyiIeCOd6hHi
	ITMcIjZIGZ34moPl2HJijjNvIYIQjBRYvRV/hyGzrb3M0+zR7Jsq50VYyXUDdeuDfaED7oDfvY6Yh
	nMrZ8hYWuCD9IecSmTbH33u976P2sOyFVhsdSJVHyDjy5gw49flx7awEbBjtaHfDiwf17999SSM5l
	WaKDto93FAVK3K7XlHNMrrVGrj25XXIzvdKrXSzpfSxNv+PFGrS2ajyR4dWNJtPHaSO6IsKRI1DTX
	pNShPZ93cg4GuJ4NHRLN6lK2sJnN1QH0JQC7P9jv3U5zzkj3DOfnMTexxBgkthRcmLPEMLyXImSaU
	CMGwm1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5EtA-00000003b0e-3fA9;
	Fri, 10 May 2024 01:17:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrB-00000003O6O-2BRh
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZH/PIKk2jB1jyNx8bwLH0dpZjssl+xjC9urhdkKkpFc=; b=QewUxkI7wkiBKQEk/7zEvC2Eik
	V/IYXfWsYJdkbA0nkBtWoDvw8Hd9QJ2EULD2ljKhQ/gsUfRkXLEptKIR3a+WRtRw2RIaalBB2EFuP
	kV+JMmrjxyXBoRUonMvNvnONAzBoXAhYBQYthxNHJrU0U6ALElagMSC+4T/797REKtiUexdcRZ+Dg
	6ebE8v6Oh97sTH0qG5MQhPPOMkcYc9Olbp7n72Us/Q3DGjMMHfQsc1Tfo+c2sNEzzmuA+30InNg9R
	WwdATxJ3dq9XAOUjfnj+qbeJ2YT+2sgIvXib2TilEwDMojsdqu3zDVRdPebpM2vMa20ijmb6BbmXv
	c/NYlJ8w==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqz-000000036Gm-0NEK
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:23 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5d8df7c5500so1389933a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299869; x=1715904669; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH/PIKk2jB1jyNx8bwLH0dpZjssl+xjC9urhdkKkpFc=;
        b=WJ3lR7Hzuopfkk03b6RvefM64W50wN5EmvP5PdqFDqB1EJ08fduF2YPCRxxDSZmc5/
         ZlFra9qFFhMvs9Ees8hNWFCLyH5VOSvID8DB8dxeIiYk8mpVzul6Chq25OYBHr1wCpBg
         DgTOTtMBdNrcs999A5vX1Sz3TuU3OCzP1F/sKXp/rlEY4UbhmIaNhDNAFZYV1suNwtjl
         +Iy4IZI3eVLDr3BUdyjovuycHc6TfamXa2AibOo5zZnWa40XuuSwyQb19oGu5RgzK4pT
         3JK5PRkjSwGQo1E28FgAptBID+S94osEw2zHeWIMuB1vvYeLg3ltuO71umWjm8RQ2tiE
         5zRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299869; x=1715904669;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH/PIKk2jB1jyNx8bwLH0dpZjssl+xjC9urhdkKkpFc=;
        b=NSF2CEm9e2Dki2mL8QH1w/26S05Jg4dfAc2+Ft8JR3QkhHVwv2J+9ty9lYr9G2n59l
         8E2SktFA7De8u0t6vjv0hlrGEcCtxswd2WEuxF5HXgKpQW4m8jrdtO6ObSxKWN4z/EUq
         zLmWmWF5bx4a55IzL7OR6u5jwyYOMEN0xPl7TuYC43gHIGRPpglETm9aNXCALvD5aJ7F
         Q2pA0tPz82evuVIS4S5ca+DJmx+diXrUwPTbOKMPufbO3K3vNBh6K9VXpF7Yc4TQU9k4
         BQpHHkfdmQrnetaNQm+a042pk3/29JFtx0MhS6EsNe1fIoXewPtdPyrRWIz7+iYhO+GQ
         Dp6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW2jJyMbjA5a8KbECP5PnVAWbqTurA96HnFfVfiM6x1VGf3uKJqfHzYFo6UEWQ+7+NQq2B+4wqnLCHKC8EmJCSjHf8ApzskZ8eAIwH5K67t
X-Gm-Message-State: AOJu0YwunPCj5Qf/GGCrP11eMyZ16bX0HJ3Nk+saAPhJsLC4WHdAtz8m
	Tml8bB1FM93Js6qvkqfj7ztKwBug9AoX69KHamB85oTkXdzLIcbQvoM8yEh+mHAB77zP+JdtBvS
	Cnw==
X-Google-Smtp-Source: AGHT+IG+AWPXfoUCb1Oi86gOdIU3+gShVVbb026/H7Tu9SdBzskU+3a26qTumDrP4NKVHaPqPJ5R/T8IRu4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a65:534d:0:b0:629:b0b9:e381 with SMTP id
 41be03b00d2f7-6374183ee66mr2181a12.7.1715299868986; Thu, 09 May 2024 17:11:08
 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:00 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-44-edliaw@google.com>
Subject: [PATCH v4 43/66] selftests/ptrace: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011119_558785_DAF37BD9 
X-CRM114-Status: UNSURE (   9.38  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/ptrace/get_set_sud.c | 1 -
 tools/testing/selftests/ptrace/peeksiginfo.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/ptrace/get_set_sud.c b/tools/testing/selftests/ptrace/get_set_sud.c
index 5297b10d25c3..054a78ebe8b5 100644
--- a/tools/testing/selftests/ptrace/get_set_sud.c
+++ b/tools/testing/selftests/ptrace/get_set_sud.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include "../kselftest_harness.h"
 #include <stdio.h>
 #include <string.h>
diff --git a/tools/testing/selftests/ptrace/peeksiginfo.c b/tools/testing/selftests/ptrace/peeksiginfo.c
index a6884f66dc01..1b7b77190f72 100644
--- a/tools/testing/selftests/ptrace/peeksiginfo.c
+++ b/tools/testing/selftests/ptrace/peeksiginfo.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <signal.h>
 #include <unistd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
