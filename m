Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AACC25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QJXb8tkdXXT7bIRuIvZjkL92yJQYfDfRK2miSLAU6+g=; b=3EHyO3gSw822eLb9B1y5f0dj4i
	SuO2e0LD1BAbcCBhTMKgWrYscirGBXBHJqe6MwMxjZ8jQ0CCar1ubNCjdJJZJ6yg3rpeagp6LpUDp
	p9c/bpxRKq/LXvhL1xkft9Nzo+gALnMmtl3XKDZKkPhMSZRwnzOZhuLhI/RpnAZ5G4pGX/Xjm4t1W
	b9uCCvYRdtMoofGoGELyHLMtYf9uAtvvKjV29qNXpkEDfwBZ0RFXdvgJMdqAwJJyjjWMkmmBhJ8h9
	Q6SBfKVkN2TkKNNOXxe9w41xhCtklz2cbvzP2cmrQK/5jRCO7GT5uP9bT3K9jm+RVsNGgYNGU5gKm
	g0tods4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8E-00000002uEz-3bDo;
	Thu, 09 May 2024 21:16:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59y4-00000002bl7-39Lc
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7gmE/+1tJ7Ep2oqmr2taMm5VZCwXrcQv9eKCkUAc/7U=; b=fdHcSCybVodYx5DyxeTQuz3Epq
	FaTO8fqnOUhEgo3cNA7ZWUSAvdhwX/Q7++F82+vOBmhPwx76MFbvOhOYc2cjHqPz8SV8DPdyorsJ/
	51Br/y8GspyrFZ1J9L1PXE4LvFvQZ2sWeeOlil+o07dPRc/xHHXig3VxkM28HM3SlxQ7UcnR6HETs
	jFyZ2IRDb0fTQb1gVax2Bd4IciMCGfFNDLRpr1SmoU1otndLqk0kDmR+Sf4a94GRW8biqKsWhPi/a
	stafnzKoCbra49RooaFzJuSebwElQkq5iheWKOtaLo7CX6h74br0pKAcM52h9pOAn1k0A2VWcE5kp
	pb6Nya+w==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xj-00000002zx9-3qLD
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:04 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b38f3e2919so1831142a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284910; x=1715889710; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gmE/+1tJ7Ep2oqmr2taMm5VZCwXrcQv9eKCkUAc/7U=;
        b=ekWwnCUaBA3lC7zmfakFTSsAwJwcw2Y/gxPWfMZjeM+huvcYWHU6A4L3HVn008IVPv
         pO+/xzEBat4CLpUXdYo+C93xB7PFTBBoOn7KdGK/ZPy+m2wgtXXIgjZmqmCQ7u/rwhfc
         nYvi34/uj+Z1dLRX8MZHXtjgfSRWU73kUcpFkDBjlBCrGjDkpYmQo+4Il56GgH2XCRpX
         GhOffEzSXXf/kEqi7qC05OGFCD2L6GvojqtXuK2P/wHIuSPdtJx0RxJIq5AkU6UmyY3h
         Hzk//r/WgQCn2LV81MoLNeALTizkHz/UV6ifRbHG9VakRex94SgoKssO+tz5uJqSFtky
         eClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284910; x=1715889710;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gmE/+1tJ7Ep2oqmr2taMm5VZCwXrcQv9eKCkUAc/7U=;
        b=bV6y1pLdAEFlAxESzais662N9DtHuW1DunXCuyAx1V/dRoqQV3kMp3wKCLkZAGvixK
         /PjW452sL0KeppEbJUAt9IO1MQn1nJRUVBYhvGtLsfWwx8TgmM6eg2W3mdiAUh6M6cOs
         y0YWUzQ2iW59xpiccSd6wj7KR3vwzin/KggM9wPspPG4XMUtXxWcBCxrONVes0/aEfPV
         3zDuM/Zn28cjLNMRiX6cIGHxgX1j0Olhh6eQwn2AgwCXpGVtY0rdJ+rsj867k6bp/04+
         3jQhPydfGsm+VeCFNXcwKr+Hbt4X4FT+sXCoJAL1oQehRIp+tV1M7kf2NxOP/KO1vYgA
         Lmww==
X-Forwarded-Encrypted: i=1; AJvYcCUols4NocvWn+/oyh2vcgPL12Z+HK1/pIaQVBWHtv6WVq5S3sGNfNCBibHWflhy30MJ2n/0OS/D7wQy2Kl6b2F87Qw8its1EerInUVVqGZd
X-Gm-Message-State: AOJu0YzUiVL1jJfEgGbTIdcd+KhZjY9KRyYeKpfKnPNwQrCvN6LBGttq
	URgZYME4P1iyxt8lNJOt9MHN3CmCgfzsC5utI6N/sapXCK6ywSSJgme6IVvXvPzrk1BAAVZBf3K
	jxg==
X-Google-Smtp-Source: AGHT+IF3buvEsw9DOzXJjxkw3k3YqiITNaAs3ILFq1pbZpyM91Xc9NI+NKd7Vfc3Nbg4dEut1dVjyl+bk+Q=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:ac12:b0:2b6:4220:159d with SMTP id
 98e67ed59e1d1-2b6c748112amr23447a91.3.1715284910169; Thu, 09 May 2024
 13:01:50 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:14 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-23-edliaw@google.com>
Subject: [PATCH v3 22/68] selftests/futex: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, 
	"=?UTF-8?q?Andr=C3=A9=20Almeida?=" <andrealmeid@igalia.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210156_701698_6026A0FE 
X-CRM114-Status: GOOD (  10.51  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/futex/functional/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/futex/functional/Makefile b/tools/testing/selftests/futex/functional/Makefile
index a392d0917b4e..f79f9bac7918 100644
--- a/tools/testing/selftests/futex/functional/Makefile
+++ b/tools/testing/selftests/futex/functional/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 INCLUDES := -I../include -I../../ $(KHDR_INCLUDES)
-CFLAGS := $(CFLAGS) -g -O2 -Wall -D_GNU_SOURCE -pthread $(INCLUDES) $(KHDR_INCLUDES)
+CFLAGS := $(CFLAGS) -g -O2 -Wall -pthread $(INCLUDES) $(KHDR_INCLUDES)
 LDLIBS := -lpthread -lrt
 
 LOCAL_HDRS := \
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
