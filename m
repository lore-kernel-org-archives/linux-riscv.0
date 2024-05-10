Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343FDC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=w2dJoD/ENjFvt+cyt4cd2NRQNmmGdg6C0HRSXkJwros=; b=fv3QO5caMyahF275s2CT8oj2e/
	jRgBS1o9U8IS0Tb4dsqhinjhOh14lrlKs7B10Zvqg5TNfys4dfEEjQstWbWWKNSIcdBDipkIb5slK
	jY9TxhAD9NGPyqhM/wztHfoTnbL2GW12cnTywHNfArDluCAOiqaFy+ZbtV3QCxFRVXZbtVHHi6p0J
	itsCRtnASgTvns527GhXZmbhdoCIaPyg3VCEDQ5fe9ZEz84QNb+f+P5nCft1h7WfODeIFfPQaDBCD
	5pxRUreoBF5ROAG3DA3pHrDR4V6Y4ue2yzxPoUc8ZYqEFmTct0wbBj92e1hK0wv2+ywO5tpRK8B7W
	TkG/0dtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dq5-00000003NBz-1Hjn;
	Fri, 10 May 2024 00:10:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpo-00000003Mzb-2Il9
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nD4EzUbRtbWK7TkNHEGymGoceFYTK3zje1jRLglZ42M=; b=rOJAW1aVPIsImJgH6Z2evT0X08
	2QRwZZ05dbdpKdVDkzUQPDNQjXwBOs4WWUrvOcV4WJRv9zC1Rg3gaDPeMVK/AMfkVKqUsZm8DZGYt
	OJPL813EKLlbJMUkjIg6Js2a8nv1gtKDV6RaxFhMmimTTMS+ylnw+Zd5udtiYE7GuBYqL8ssva1n8
	+RJKs63H3a6r09SCbhKu0V5KQmJmO2hag42W75cxwKa4xWD4bDnrF8/D9L6ILOXAvNzwvOjUcI+5e
	ksDMieWf/AicCs2A6FVdgPXdnNcjfg+AMK4yruETayekPPF/KDN2+Nw8I0xtDwn0TkOngJXvYTlCb
	TXnXXwAA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpd-000000035wQ-39rz
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:58 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2b3fbed1a03so1381980a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299784; x=1715904584; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nD4EzUbRtbWK7TkNHEGymGoceFYTK3zje1jRLglZ42M=;
        b=KWr0jAIjiyJtXYkWsJR4huN0b/TOFKti+ySsUCS6jE6WSmgFvywK8+aOqS3xAWW5N+
         xz8BmC/Y7RGhSs5Upjr4If/oozqIH+zswuE3kpfqvHN/UfKcXM3ZrCpDb88B44q+YkEY
         yAbbazPSDUyV32fKs90idqqPlehriBRcWJ3E79lQ6dowR0H0SVfsKu5qC3peYH5ps10+
         UM+hW9XMKHGwpalJTVDJCrllGjEzt3J5aSWwG3JelRVY5tEIowTo37ky4J7a7pzjjrmC
         5F56ZpO+GM9puIvVl+FyfcOGpoa/uOvtn7YRKTfSGKmDTcTDtX6iqaGPvGvLWsT1wriZ
         avbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299784; x=1715904584;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nD4EzUbRtbWK7TkNHEGymGoceFYTK3zje1jRLglZ42M=;
        b=ubWu5o9Z0ZkG6pnXtjhMi286vvoc+wuq6vKf9i6vlJ7cDeACJ+bsVn6My/btrTPeDE
         0M2KL4Vub2Z5yULyPxHn1EIE2KEF2H2Rowv2k4mCHcDj/nPU1d5aDBlFiB6xxJ2fabrb
         369zrllyUJpLvNDYilXFUe1aeDrTBkzwOKWAWl69wP0zHsFKSOSPNzKFzFB5PZpMQJjc
         2Im8AGLjRnpslNIx/9VIlA9ZVRc85CnnkNKpWLbdWPcihnslDvBoRR31oHdNv8n2RtwH
         oqjATdb7mxcoRbHdfc2mjtRfPxsGiYPEkKqxX9viEO9kvUDAItS0pxd8ysv+lW4xgGik
         Oifg==
X-Forwarded-Encrypted: i=1; AJvYcCW4Nu0RVkxssUKkFhr4/Z6QS+hrgenCkOJKHd0FLnm/qraW4MOFObYbvJpt0L8pbxAWmzf7KIr46IqEXuaXupj5S0a/cq56/CQLdYlH3BKT
X-Gm-Message-State: AOJu0Yz6NzQPCuD93NlKqbDa83SjLhjaI9Wf5qC1aDCjy05fUrNzo7/0
	GLOTWjG41y1DR3+BCnKW7cwFOsy7NHX4NXDbQg8NFqSXgDr6MC9E8nF07x/hDYkaG9496hnnaFV
	FGQ==
X-Google-Smtp-Source: AGHT+IHxMR6Pp5SkTVMeBaev3opCRzONt5mntrRWzWl6NBUoxiLz/a/B8LNHqFeHKuHis4padRNmU+oftSc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:488d:b0:2a0:40df:2f57 with SMTP id
 98e67ed59e1d1-2b6ccfeee89mr2677a91.6.1715299783557; Thu, 09 May 2024 17:09:43
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:30 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-14-edliaw@google.com>
Subject: [PATCH v4 13/66] selftests/exec: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_010951_543911_A1C9E365 
X-CRM114-Status: UNSURE (   8.49  )
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
 tools/testing/selftests/exec/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/exec/Makefile b/tools/testing/selftests/exec/Makefile
index fb4472ddffd8..c5bdb653422b 100644
--- a/tools/testing/selftests/exec/Makefile
+++ b/tools/testing/selftests/exec/Makefile
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 CFLAGS = -Wall
 CFLAGS += -Wno-nonnull
-CFLAGS += -D_GNU_SOURCE
 
 TEST_PROGS := binfmt_script.py
 TEST_GEN_PROGS := execveat load_address_4096 load_address_2097152 load_address_16777216 non-regular
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
