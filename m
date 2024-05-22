Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF08FC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=N0sFXXeu7OXi7F1DNoCjkJaUZAIdaEH0v+bO0Gjf8/I=; b=i6550xSovYFooqlZqoiZyMIdy8
	n6WuJegl21z/ahISaylBt7myhIiI5A5by2V1b87ZRlUllvp7l4VcwWEL7m7Q2+RKg7E6LSd14m7g8
	WiB+8DvUAv3mBoDtU7HlM8RE0K7um88iY488QfIVjYXGrgGtRZo+Rw1KBNNXEQ6NjU24uQr0L+Ez7
	c0tfcMSJmhMl5VZ1SmOFIcQqxDYEP1VxHjCV082lca3Ezgya3R6ESDkzxC7N6S5a54WUwpZ3G/L0H
	JUDxas67WxrYswkV9GeTuOfzvG6q/YOuhRjwu6PHOtzASr5BbDFDYGksp7vHYi5hwFWFVP+48rE6x
	kXXLPuwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aRQ-00000001XlA-2crv;
	Wed, 22 May 2024 01:06:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aP3-00000001WIm-37rx
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=euH6SpNkjpR6Tnz6zGeol1ij+1qgoiYexMkc8Ht33no=; b=S2Rf2oPGl80iaAaE9Iwpc7onQt
	ZDcK/M8tZh36VQeEJ2p8Uu4EpcJSpg4IhcKxwETZd99BjJj3XaesJLC1gVeig0+x57uG+8bZODmNE
	oRum96tos8pmQgsGjap7swlFIvXko/IYUZLb1glxZNiZjvIFx5rUhusA1jC5tWAdDzFNl1FCnHJQD
	k/6aW7GVyl2kdOjDzh2H6+jpzXWWY0kWNXNOkt298V5IXxYLdCiVcLWuAMPbaPQS5zJbFk2W6wWBb
	ec/Egpqop9U7KvkudcjlyGKHVgUY1Jf3vLHfd+Qd5bkdY2VNdIMmWl7sdt/jrL71P9S1lX1Ke6071
	6bFO8CwQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLa-000000087m6-3mze
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:04:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2bd92c367ddso1134705a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339617; x=1716944417; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=euH6SpNkjpR6Tnz6zGeol1ij+1qgoiYexMkc8Ht33no=;
        b=P5r2TxgS/4+1s/tkyPAlTqOcVNG7+NYSJdOEBQHfq7hxyD4IoNU5Cd76zKMV2F6W4i
         GDGm+PSutf5nEY4onMzFXCcGlkzz+fnEx4Yzxz1CxidywAnVYmRagqRbXsLYLDsvhEXW
         5pZsdiDXaC0JldbaETlI+vh5PP9K0lHxNweKrpbCXnqu77QAogY8CWpPxdI5t2voCOzD
         0xsJkyxfwoIaLFsHb9c50VGo3Dh3N7dFR8JZmCFBk6hKAvj03kcIo15QRdF8Wyw4DJnY
         bC9GiAH/ci2jYlkau21bSgPwZwpSkJZ0X4AA+jb4wrXAdSC8s92jdFvh5fcWq5dVDC5r
         fB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339617; x=1716944417;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euH6SpNkjpR6Tnz6zGeol1ij+1qgoiYexMkc8Ht33no=;
        b=aYIzFZIKLeo7xBwUKn+CfcJkOOiefVWxUZsaYNrnhMibSefKyq70Fpw9Z5/fPOZKdY
         lyYyIZTkxgrUmy0S7mkQQqZFdlOc5ctztQ3GEw/18gOIknS98zWzOP+R89+aitRjvJCM
         y4oxNgqN8BRT3fpn5vDDyOYB2hHFka8g9NqoAqqdWxo5ZloHJ1b4vNzuhCiayOAGHXHf
         eMRTLKSFxzA71fknNu6zsjgJT5NIBGqiTfzxZybCyz4komhU5GeiVPVzKbZtbR8wfioC
         f2rL52k39mOYQxADQ9ATMz/ev471Z0jJAu6uWoApjsyY8NpQAgJG3EDioVTwLbI/x1Na
         Y7uA==
X-Forwarded-Encrypted: i=1; AJvYcCVllbgIKkES+gw+TV8DOQHBtwbO+jtbWUT7SlPvWnXyaz9tUDJcd+5ZHo4WgtgI29KqEJZXwpxx2p9XNG91v+dpcOHLMCban1G3M+O88yNn
X-Gm-Message-State: AOJu0YySIbQoNVRFSIXZUFWKhxqjz3HayZ08YN2sAxsroBJXIWE1/t06
	W2iDRIAJSBC/4qTXkbQvt8LRHgzmPO2vsoUsbsYssq45tGdNM7IZQm0MbksYqHgrpf0PcwcXBP8
	/EQ==
X-Google-Smtp-Source: AGHT+IEB0tGz6rHOMHOchoEOE8oKcrvsoJF0sE+ZwOacZzPYGlJR211+G8KBWntRy0FMBqnrHhJ3voNI1kw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:695:b0:2b6:208c:8520 with SMTP id
 98e67ed59e1d1-2bd9f5cf34bmr2018a91.6.1716339617419; Tue, 21 May 2024 18:00:17
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:02 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-17-edliaw@google.com>
Subject: [PATCH v5 16/68] selftests/filelock: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020213_140931_08884835 
X-CRM114-Status: UNSURE (   8.57  )
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
 tools/testing/selftests/filelock/ofdlocks.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/filelock/ofdlocks.c b/tools/testing/selftests/filelock/ofdlocks.c
index a55b79810ab2..301c63ddcceb 100644
--- a/tools/testing/selftests/filelock/ofdlocks.c
+++ b/tools/testing/selftests/filelock/ofdlocks.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <assert.h>
 #include <stdio.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
