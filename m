Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632ECC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0eR1E2oi1DQ9RrUSahr8ysyxIjwoTqOd0i6yy1LXWQY=; b=h+V9RahykS2dpAp945PlEBW8r/
	O0bS9bvM/mSCsJvMXE5qZ9Ea7aaLMClAIjCCHDMZJcnW9nJUxNoCvzY2zIw+yC/N3/XghxBO9xbUG
	N4Os9JegwIMuXJSqGc9G96Is5we9eblrXwo5OW25qExcHa5Hm2rKx0FBUoc/HhpBDnz102LgtQ8Jb
	54O+ODQqtb3GiohRi6UbgEob+WrIdYYrmNsGKxBBgiJsXDBgMBBToO3iOVtTodFQyAxXJEv6JPdlZ
	GeBdc0Fe0FkGJp7aqn82YUNj58E+Qc7b4DMGJ6TjpQXY3I+27sqlqkgBFNgQ8DWe5NakieSHw9uze
	02UrO4vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3O-00000003kpz-2YRR;
	Fri, 10 May 2024 02:32:12 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrG-00000003OAp-3M67
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7Be7dPPNzCq96H6P3h1xjg92hf8ZyE2EcN1YZKe/vuY=; b=N588CMQSzTLfrKCKBqnvPG0CQi
	aAUAKCP6H52OFXlv8I60J97N9PhFMMX1oP4mJjX+7rrMe+srbBmhn19NcN0usGgOumBOz2EtVh3l9
	IeJNY5f39sd4ilctx0sIa3PWQdRCQB5zsW1h8xaWAZ36yG4jA3edxEbN5i9uGuxMmsY4apOA3k8rT
	oybwVP40sUI5mCEGRY7eAztn+8QIiQQ+/V4M82QkEpSP2g6T03LS9KcpnwR3OBzNMtH3Y8pLyfzpz
	Lu5f7Zs3Pf5tt4ppLAUEdvCmLdsCT3KG1NhqyvBNl4hwIN0FQj5FxnbBpJ3WkT1d22X3oT0rJl24+
	wY9naNPw==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrC-00000001mOQ-1Erw
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:29 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61e0c1f7169so31443417b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299881; x=1715904681; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Be7dPPNzCq96H6P3h1xjg92hf8ZyE2EcN1YZKe/vuY=;
        b=WZY7tUtUmI0IZIDXsE8FmxP5yfjNngHI7rEGQhfN4mbXSwCOLgs18uVFJRwy0brivH
         ra6gZFfUSO1UVtcOFHhTkT07I0nZd47cxkf3iQGvrbcSMb3Cy+FP3M0QiTRNk7UPIA7y
         2bqP+BKOhwl1OLcpOgEQQTMSL5wcutcXBcvf1azKyYPXpUnd/M8Ml2RYdrZNzv+q4Kbw
         iLETsnX8KH9wYsMAuzlrBUS+D8PE1UtpDa2LX3hP6k1G6rw0qEWaYR62kbqsUkqSIo86
         iALTAXrZ96KZtT+PRLK7KKvp+AOIE0WGNBlNXp7pe931TNXrUZWxMpJkZgafRKD+QtkC
         +OZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299881; x=1715904681;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Be7dPPNzCq96H6P3h1xjg92hf8ZyE2EcN1YZKe/vuY=;
        b=bNgCM1NZTsCneNPx4oxP7gffwqIW7s9obV/CPcoOqdMfWYQiof30/6DUEfukCtTu9e
         lkDOgQUmNiJ8CLslixsxbKWHCBGA57A2U6pbGryd0YyctF/zTRAXqeQEFm+XlnSX8+NO
         dULEMiGR7FX9fmMEWFxzVfd620BV47kgTtyYROuiyhsmpHYAT+w20GNy+R+/OYlKzNt0
         vwI3HeMw8y1B5kK7gdXLkg8fGSKh8irCQu1Q1+Ke8xgbjJretkRGkvLcVUa8pCQBxcWm
         7MqJXfOBYngraDBd1ndK18b9VX0MNF3pXiFbqkoagOiNoIHZLnOjRBqXy714Px/WFD2F
         1G2g==
X-Forwarded-Encrypted: i=1; AJvYcCWaISxvD4hFkIokGd6uVGOv9QnlPBn2fDREGjHmal0Bs5HoHLL3hae2ZFjqXu60zN0GngFs798Pz8FPy/OICWTw9SDO+rBHZjwdj7hKdVot
X-Gm-Message-State: AOJu0Yw20rbz1lqNLXY1EoZ0PWNdAElE4Uy4hV6xrRULgrpM9AUQchFk
	CHe2KLCM7+w3M88iZto7uzZ1khzH9oJEn0Hxa94h8JKvc+dBSNLDutTg8Y1xW+mKommV9DmtbCh
	vSQ==
X-Google-Smtp-Source: AGHT+IE/x9wCS8dXfiCveNKLMUww3zuulXyRB+TBegOeq8yRgm7kXDMXOCAjHlMh4xirNEVxhfl/HnwXW8Y=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1004:b0:dbe:d0a9:2be3 with SMTP id
 3f1490d57ef6-dee4e558e2dmr363352276.3.1715299881350; Thu, 09 May 2024
 17:11:21 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:03 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-47-edliaw@google.com>
Subject: [PATCH v4 46/66] selftests/proc: Drop duplicate -D_GNU_SOURCE
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
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011126_361505_9CFFF2DD 
X-CRM114-Status: UNSURE (   7.43  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/proc/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/proc/Makefile b/tools/testing/selftests/proc/Makefile
index cd95369254c0..25c34cc9238e 100644
--- a/tools/testing/selftests/proc/Makefile
+++ b/tools/testing/selftests/proc/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -Wall -O2 -Wno-unused-function
-CFLAGS += -D_GNU_SOURCE
 LDFLAGS += -pthread
 
 TEST_GEN_PROGS :=
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
