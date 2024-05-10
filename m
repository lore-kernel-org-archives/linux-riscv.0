Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A9EC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=sWOmytKxqLxcAFinc58iwet3sAzbEYAGrUmQ3F6y32c=; b=GPXfRL2ibWPYaOq5vXQHUdzjL0
	uP5YK7BAT7Bw4zGv9EEDQ9cXUp2a4KRSZn6sLPuYLdQFOIfMDakktVD0GIVSnyw7Wn/mMyHgRUcAj
	S5jeydWOeApMGDZ1S73uDOveCZYhP+XUP45UM5k8S6g1XgosR4laYRV/0i5XHmgpliFUzypL64L7E
	G8U2mibkkz82YUXtSLnf/P/dXsZFBQkEsYUuxLOHIHKHyuozbPeedPm0Bg8jWSuRC738qUv8wPOgH
	luLv1PbYS55tjzvIyziK53r5c9dumk7HGstkntnwqhvQrU+MUNnzpgzRXPdW/F9cAJIfgrld0F3NX
	ho79+68w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esx-00000003apx-1Seu;
	Fri, 10 May 2024 01:17:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqm-00000003NmS-3t1x
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AZj1Bq1Ph7aHtca1pQR7ov3s7eEPL/cFrYRcMYZmLbk=; b=CCKoL1PlWgM2BkP0P8S5fvzoNm
	iSuu97NQNN3T1XxbChuxYRo21sAi1xFZbN11YYzwo1K15Zu/uZo0dyOEZrRJ5HPMh4a2cuUldNZ0b
	rjMtBFdJkg2sBgVqHRPA+BZcMwD0YaWohkzp3t0ib9SRStXgFc4hWB4f0jVicXRoxEECykZs9lFwS
	e8Apa6lfS09POJ+rG01dqIqqkreSS6lCci4qkddXSYRw88k8apix04M6xLRB5mye2PM8CGHOBx/g1
	XGnftJ96mTqVNLIXFRIp7ADuXj9zyfGKANJAYoWt09pZGR3BTFqv1agU2EJk+zWFF838opLUR/XLa
	G9iNDUdA==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqg-000000036Bt-3Tgd
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:59 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-61dc66c4989so1397441a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299852; x=1715904652; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AZj1Bq1Ph7aHtca1pQR7ov3s7eEPL/cFrYRcMYZmLbk=;
        b=uyQ9P9rcFr+AzAcDjPl1nk9KXaIl8uJ9nRBSVUMcAF+DXTl0ExRiibV7HGRp/4FmU+
         wG1tUDNQrd1lCFPAiwHxY9sqrS4liAS49Zj75agkKWUkEui16py1OWf5Xy05tUujNu9U
         jHwENzU0VwTL909jR+BYPH9Bb9fewR87ciK5StHJti9B2q403C81cLGXJQGb28dGJNlA
         2laKVOKY673zLXfp17YQ0nrMLCB5osjvRU8VdN1vbm9Po4GVhZh1whr3qHkZ64dpB6fz
         drMqc9zt8Q3BSuS2ATBArTq2MJMA3/tDthR3tb4k/XYWhvAXGc/YAhvzGGdq7JQGlJ2w
         /gVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299852; x=1715904652;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AZj1Bq1Ph7aHtca1pQR7ov3s7eEPL/cFrYRcMYZmLbk=;
        b=P9QRCg5/aT7+Kvidomq1m2bBEVcdyL036ZGQreb0HN8BcgObZlXGlJiMxS5IHkWZbG
         RMwcXPsr5eolkVZgAjeVRfLX8OLTvEKuBLO9X/0vzjDAQS+VvC4eifyvUXCiMIRZsHE7
         ZrTO4hSVGAYUtHGnPUUl5g786fGb/xGdXX/qp8PHwLnsCWG49zruWWsCjTtGx6rH7nGA
         xj8N+IdFgdSHbsU5LgbIMkJBQzNBfh+RTGHn866F0VVMux0Va9TO1us0VRyNcZy49Iv6
         8U8TDqbiF4L1G28ZTeu+08i9pRbgWHp70hvo5TCOeOu+XANhyUBAduawigkXBPgarB8S
         BQCw==
X-Forwarded-Encrypted: i=1; AJvYcCVLz/3TBKdNLJ7r1x3GJ9M1vSftgINjsMj6zrlqgacVUecA4yBuJi0bUuYCrqrkLOqQSK+JuWRmyLhrGAhYwXUjSHQaRQPM7j3f5ONjEGMI
X-Gm-Message-State: AOJu0YxfZsdk07VLkih55+neHmhxg6sYWULRqLgOCQB3RJduor38H+kr
	vHXIHQ6plyJ+gXc4eix71EC0zJqBuCJj8WNpJPg3YH1pNcbygBixEnrwLkhRB6U+yffH6LxLdmi
	cJw==
X-Google-Smtp-Source: AGHT+IE6gpQE9CIWWmmdDutordyNQu9Ic7NAss89CUXczRtxiQuBxUodgnUyhLai/71SPfiQgvdkopFQ+HA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:3f8e:0:b0:5ce:13a6:3c36 with SMTP id
 41be03b00d2f7-637427aa267mr2381a12.11.1715299852354; Thu, 09 May 2024
 17:10:52 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:54 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-38-edliaw@google.com>
Subject: [PATCH v4 37/66] selftests/nolibc: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Willy Tarreau <w@1wt.eu>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011055_281573_8BCE0548 
X-CRM114-Status: UNSURE (   8.61  )
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
 tools/testing/selftests/nolibc/nolibc-test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
index 94bb6e11c16f..a28813f4367f 100644
--- a/tools/testing/selftests/nolibc/nolibc-test.c
+++ b/tools/testing/selftests/nolibc/nolibc-test.c
@@ -1,6 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-
-#define _GNU_SOURCE
 #define _LARGEFILE64_SOURCE
 
 /* libc-specific include files
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
