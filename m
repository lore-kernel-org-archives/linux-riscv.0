Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC28C41513
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uzcZejt4i5IwrvwDYLhLyPEj46d503Hl9YnOGbgU/U4=; b=usYs/OKmXTnLXZ5YmO0LvNHM+/
	T4AHM+BOf/tHi7mkBXURgm2/eGZgx/7MUOT3zkZbYRIDsVlqNbbRI+Q8oXrFqvH+Ina3NxbeaVbW9
	El1shjhsf0Sm+7igUxHYtjKrUwRKIuPFNlcCx8nawqhfeGHkgVFlg46c7kVwffGawVaKpiucGcZJ7
	LsUB4a72GOGEnSvPDKVf5IhUxXhHMDFSBeUzQSqrbSL/t7RzfM+DPBZlDcGtIoIKOcu0RH8DYwqxG
	/fPLckmtARMVT2VkhOe1ytCqB/puHHnP/z0w3sA4ZZIzG4JqgV2aBoMIQUUDonzbimrm+NfDFhuKi
	LKlRg8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3U-00000003krN-3ZgR;
	Fri, 10 May 2024 02:32:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DsB-00000003OrL-26ts
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GO1gcoPElveUSPvl43PtsRVjcacyZcZsNQYTuVuo160=; b=XHS3W1LNZcQGp2U22fOkrEsSxN
	QpD7HZrsgKvW+me1Peyw0lvE5fsAIXWPH2L4JeAFrh5cUvo/bPsT8WrJJVmflaT0jrdQM/3YOjRBN
	Wbe9DVrMcReJcGlGm7iWRJlnUeCIxBejQnpRLVZA+KpdEINFyIZR1nnLmSVvM4gG08AG4UGktIdwp
	POwcKGe526/Z3VUAtp5iUHdxeqwEoqhNr+tm0XJWlQAX95/6mEMqJ7d/njgTCXDZSrlh+r5RfJmba
	mxiEDbmtkkK65g9l3iJaxkbz26S0A9IDPM6sxhl5N2bTgsIplnQjc4Zi0lY++Pbgm9Ytb69xoxnzQ
	O5wlWPhA==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drw-000000036Nh-3gK9
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de59ff8af0bso2286900276.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299908; x=1715904708; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GO1gcoPElveUSPvl43PtsRVjcacyZcZsNQYTuVuo160=;
        b=zuJbEUquShcVKB1lbKvJS51r8Sfn5qTuSRYFiZq1ijd1F3seQyXJ3fEDuBetmUYipT
         4c9fvlJ57/FIj+xGy+2VHf5QZi4D3yBGL7uFegL8+upq3LkU6XgkFhubyQm56vD4qG79
         zW4dHituWPjuJy+06MKzmHlGMFwsMV9N3KuH6pHttEK6CcTXo5DcgE7bvrZO4DDKkNuw
         5Vkszn7ORM1Ub6i27Uc5qHoKaJ1nq5h+Y9wwzTaFapV5cK0exMr071KAiLKbkfdKKjws
         4roGYotQR4CSSEERRlT4X1HdOu74DVwSEfoOQbKRnRiBDJJdmuX67fKDDN6To2XWQpni
         zckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299908; x=1715904708;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GO1gcoPElveUSPvl43PtsRVjcacyZcZsNQYTuVuo160=;
        b=Gh+AX3Dnndpv3mjPyWYOhz87Lu2d7AXmcTq/S0IdrQjqJu3r1z3rCX1pC1+EwBW6IC
         vPJ6Znc1qw6USNU4JMTgiNYVObdjZEjAO7i4fsALqOvWsaV9o2iwNSYCqhyUc0oKt++Q
         X4a3275ONOq9jWPX+rVElV7Klt8AoCF4OuSgY3ItA7BwVfZa4qHTpKQ1O3RIZBlRNGRa
         CuTYzj7MwqUGFZ+xT4UTltXBZ9tRqV6wB4xwru/z0UNXGHGQiIBlvAhHazV9R6A6FXH9
         oqdzHE3Vf83aTQTPD9bheuNcEf3vrLwzpSEmDcrY63S4gScVea4va+m1B1GOvw1jvvBB
         Po1w==
X-Forwarded-Encrypted: i=1; AJvYcCVYMTCaJj2ULeu/4OB9PQRe031rJ2zfFsvBf7S+GKswS+H6JWAvdAshuY7ND/aglNlXk4LnU8gXWJP14PLl+b+ECoZkxO6vNPuul1flL9Wt
X-Gm-Message-State: AOJu0Yw/QzTUFSrxAGP0HcLwzE5S0ibmlKoSf0VGAOiiBIx8tMOpmXJg
	C9V2Bj/BqKyU7Au+Bq9Oih/52Sgdeuz4RQmOtfGMYGEM4jQ6Hf1Eyv839KKn4n52xA9OaG3oiiO
	szw==
X-Google-Smtp-Source: AGHT+IFqVM7jCc9e9vcxx6yDQfRIV94q7wlSc89OLSLIs1UwhsdSZiFockGfx7o6DTxJG5odCLelmrAmBDU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:1982:0:b0:dcd:2f3e:4d18 with SMTP id
 3f1490d57ef6-dee4f364f84mr105630276.12.1715299908304; Thu, 09 May 2024
 17:11:48 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:14 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-58-edliaw@google.com>
Subject: [PATCH v4 57/66] selftests/splice: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011217_474713_34AF7F32 
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/splice/default_file_splice_read.c | 1 -
 tools/testing/selftests/splice/splice_read.c              | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/splice/default_file_splice_read.c b/tools/testing/selftests/splice/default_file_splice_read.c
index a3c6e5672e09..a46c5ffb573d 100644
--- a/tools/testing/selftests/splice/default_file_splice_read.c
+++ b/tools/testing/selftests/splice/default_file_splice_read.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <fcntl.h>
 
 int main(int argc, char **argv)
diff --git a/tools/testing/selftests/splice/splice_read.c b/tools/testing/selftests/splice/splice_read.c
index 46dae6a25cfb..418a03837938 100644
--- a/tools/testing/selftests/splice/splice_read.c
+++ b/tools/testing/selftests/splice/splice_read.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
