Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8909CC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ox3ZDyxZ3IYvxh3MO2dBJ1cqda0wT9Qz2/l1hup2oP4=; b=ONkgIoCDQluWjHakiA9pJZx3wW
	8DHvwwVCybrEZApqJE7KYBp5W/Mz8DzOUdrz0hOTnfLhtxC2doXGnzw2GwIU0A7/Ve8jyX5A28FMZ
	6Ws3tqVkymeL/PQkcXrpM7YY9tijToicoyeDS1cEobC0wcH7QF0KYVeNSX+o+LdKIBOEVaHwnBYBf
	bfiGrxsvHlqzkUWi4If42MHlIrX/Fn6PFa6CJXjjtqMusbX6VqV24ZeKzxkifwWuwwRv6Z2XAtdCA
	QZ4O70yuqSTeyBp+e+3LHvKai60JM4X+56Rvxtie2/jcjk39yQS90fgGl6QAy3roKJSZbc5iMyHY/
	c35E+cBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsP-00000003Oy4-2cNu;
	Fri, 10 May 2024 00:12:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrQ-00000003OJF-0DFt
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9uDFF+JWYl//M2d4lSrsSDaCKGHAotkO1fbl9/EIGoc=; b=laWG/gVuXA+B9HBa+K63ryRWoa
	qiNfCzys5YIcWne9OLNuR2KZ7LTUhbjNfcHDUs7ehKJ0cPBxUZQI4WvJJIS0FMFj2ROi1P2R24soC
	hj+zfLGG5RXF+OVg4moa4qvsGKxf01FIZ5o8HjU8fw1APehPX6n5wYl8YQAuvClL5p/wQDSrVVnQf
	SqCy8ePYuYom4a8ABwBm3rShcG0XinK8eXLYHtkxg5PuUdn3cCQ2ElQrZVl9La6EutOuOftk0AlSa
	iyi9wokoRBHuE7FdcrNvAMy9NAnQ3LRHCrxHoazjG4tjsdClFYZmAb1LymxlHygvBEGmZtPLru98S
	6soTljmA==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrL-000000036LC-2q3n
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:38 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f3efd63657so1426908b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299893; x=1715904693; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=9uDFF+JWYl//M2d4lSrsSDaCKGHAotkO1fbl9/EIGoc=;
        b=UXCAJSr6m6qTE4XhtSYFE5jKGIgY0M/isKKlVOehcGocBJ2JAb5RuQhFXDB3mvS38I
         /uqZehMdpMfCfnddpIYjfmT7mq+Ko3yZrbYmSt/Hm7kIjWM7IyNYurVNZEJPssFJh1/6
         P95m0Pa+DqGpQg3rR5i8G8rbJ+YC7Jl8tFwTj1nFqXAgjWaKI5TJ7xODExkeEfE8Rfzd
         TV4clwF/FGvxJW7MdrEVHa6EvtE2bQNPUAp/hsFW8SrMOoYfuu4hiLmU/mYl7TQZmcFe
         yRmkP06Zfy0AyAH2vVkMO4OZGt/lhdR6GOZj6T1IoLVpQgAVHK3tQBgli+HRW/VyMd7U
         hVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299893; x=1715904693;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9uDFF+JWYl//M2d4lSrsSDaCKGHAotkO1fbl9/EIGoc=;
        b=KN8w74PPvJ8lk7PjuHvkoSEF07FlJqb69z4AbEIl/yi339hNRaK3SLCtQl25g3BO35
         zfo0Ira3ntZlmIiRmond5URgzY3MgMHOVLd5Dbe/D3RsisH0Z/HOyi8SHh5qyfzMc8dI
         hsIosvvCXzrHmsOEibrBsj2Mbjg+m5n8MbjkIEEk9dl8TTzbrWatnD7RR0UA3FSgiy3z
         BGqBqjGTSidHa48QXqE7ydXJ//dVtVRWr8MG0b1JhqEH7qvQhZmmmoS0ZZtSvLolez/w
         HQuAsNvgNlVHfiZ0+yANklhsMkhOCkAnIqEswjjv2l2dGxG+jE7A9ZtQPWzLpLyXHLGa
         vBbw==
X-Forwarded-Encrypted: i=1; AJvYcCXZFEcvGD6vl9POqvMW8kLirWzO6eSgReGZ0C4+QY3McBFCjvSMHpKOrH6zOHfVVtnArJVhQYJI0m3lmiP3NtcIsWjXGWCq8ec0ID4qkjgT
X-Gm-Message-State: AOJu0YzDymMSZt2qpfCOZqhYrDFOAtaNRJmSS21cd79JfjTnss9B2qmO
	4D7WY/aGLzcW1jx4vpf8nd+AZn+yTI+h8vmilYn9exkXZZR2H3xMQahT5KDOA7STWYTxar/ZYLy
	V9Q==
X-Google-Smtp-Source: AGHT+IEdJ42TdgwwL6jMZitLCucOiECkZvqcMbyvNAdvNm+hAFnab+iaBg+Mn7Odij0H4KRyDB3AI1IKDGc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3912:b0:6e7:956e:4388 with SMTP id
 d2e1a72fcca58-6f4e015ee8dmr16017b3a.0.1715299893193; Thu, 09 May 2024
 17:11:33 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:08 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-52-edliaw@google.com>
Subject: [PATCH v4 51/66] selftests/rlimits: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011135_839866_974113FE 
X-CRM114-Status: UNSURE (   9.21  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/rlimits/rlimits-per-userns.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/rlimits/rlimits-per-userns.c b/tools/testing/selftests/rlimits/rlimits-per-userns.c
index 26dc949e93ea..e0b4f2af9cee 100644
--- a/tools/testing/selftests/rlimits/rlimits-per-userns.c
+++ b/tools/testing/selftests/rlimits/rlimits-per-userns.c
@@ -2,7 +2,6 @@
 /*
  * Author: Alexey Gladkov <gladkov.alexey@gmail.com>
  */
-#define _GNU_SOURCE
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/time.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
