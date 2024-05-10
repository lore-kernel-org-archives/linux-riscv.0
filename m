Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5BB1C25B7A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AJRaWZvQLcRywurh7H76T3EVxe7DtRzbA0qTWu+6lRE=; b=qAGVdSJ8bU9vkt4CSa3SrPHNRZ
	euOd+kW74+WXxcG2tRr8XJFetA6j9EEGOpzZpdviq0uZ5I1X4qoIx3kAT5vffTP9gytcEVEaifGrK
	WE7PRG5ysNVSpJpGVrvZEu/JxXqGrakpJBUK3Jgep6wLtNSzys+hHVs6Nwt9y2jC/PV4A1soDTs0f
	bduKp4/jUCrETUpF7bUOO7vfzC84SJzLT9ja20lsQm8k0Hf/oj7VDM7i8FpAIjI8nt3Dg0tX5iJZ5
	zkgI3S7wB8WyQ8DDS7+eR6xvZNsjUy+Ekc3GizCMdU/YKIcf9Yf3k3g8IsCLcneCySNxAfSAhUH6J
	/+BPKFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esv-00000003aou-24J8;
	Fri, 10 May 2024 01:17:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqe-00000003NfA-0ep4
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=61ujdbgBJA7hBaMw1FTkAkRU+wKgPIJAgQZjX0EE4ZI=; b=cv6+xx04mBbmpDCSd3891ncKi7
	q7iFvQFvRpfLKKx87PjgJcdeVKmX6j66F/UZpeMFBkJ2D3AyZFQhygcITsoaMacD25+Pp2Y/RoxUd
	ef1wtuaOi39l7j7ag5zSzRhONjMl5ZJFjHEq+Od4uT1FhAtrGLB0qAfMwuPkyb8sLwvaScfjxiLDK
	225JKbsqppE5v9k/8DOBHkrDxSVc0TS+UtRCUHhUBZLpuObIwbhCfxatWWiiiOmaiDkR2ECRbxn4o
	uMGzQijSZo97u+2B/TZa78O03Wy1Q3IYOQDHGbRlPGd7VrtxViw2ShWUVbkOVfW+T9UpUzotR4kzF
	OkEgUJ9w==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqR-0000000369F-2BqI
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:47 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ec620ccf77so10146365ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299837; x=1715904637; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=61ujdbgBJA7hBaMw1FTkAkRU+wKgPIJAgQZjX0EE4ZI=;
        b=Ua12/PJe+Gc00gPMXwPbBCxgKVF1jozyTxQrKPAisy9EHpMDYJ9a60VyFCGQ+pY8qI
         1f62sm5njBzEWp0T8aavbkYqHjcm1SMhAUytJIp8yIfMDLazOp7SJOEx3634y5ns3MrR
         CIiGZxxv9iHtrAE7xqlm3KHZflKHuQkgu5SxSGstzDqp/0txtTsKKgaXaADtXT6ye8ZQ
         hlBbR9Sk113hwSkmCxMbFgjqWz5/Nbssx3TrsfcByxOLi//pYyLMRCyJmgrgaDSb8JyL
         MIDGehMgB7BnkI/HGgOoWigviafO1sAWc5GNEigANUttZF5m9zn5vElHVQQMZEttbhm1
         eXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299837; x=1715904637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=61ujdbgBJA7hBaMw1FTkAkRU+wKgPIJAgQZjX0EE4ZI=;
        b=dNQaOAX9kSH4ufzVaAGO1Q182pZtROU/BbZ66XDIvE3H5D0c41Hsye4fUW7Z52WAnP
         tEx9cQVWw9PTpT6aWefsbGbOafxpdHMhS+k2rfYbD6RfglBDz83o5z7i7UAvDjtWH5nS
         9ztTojFR6++//8D2CSvnlsIjzACPiGu6esLFbyw6s1iPI/Mjv8LTSU37WrCf1sAJnGAL
         90lfLR02zUDlqPkx7aKE2sPt7SNi04v9MVYd292R9cOVbqOQRmtYtBb1G4H4EonKzdMx
         x2Ea5pn5wbVc8OTjesrGdc8e8319Z5OS/3ht4T2BNIEQZDVupNKos0sAEHFCHVG1MG0h
         RdTg==
X-Forwarded-Encrypted: i=1; AJvYcCXvJ1UmbJvQeZSKJPvNdFij40Zk6ZP8C+oVduP7GT/SxKumiQ6F5mimgH/eYXtznjY34kMDAVK7ZsChG+t6lan8bBLuMQjqbheFT1X7iAS3
X-Gm-Message-State: AOJu0YxG7bla1sZ2M1gG61DGxYcQ//7WbaGQIr0CSveYKbTA4UXKeSXQ
	KfAk1NOkI/XHvYyDu74sKiTcnQkhJdmvH1oJXzFim8fhUdZdWRM+7vcjUQl6KA4b6KgIf/AwxgP
	j+g==
X-Google-Smtp-Source: AGHT+IEX29rms0aLtTn1SZAsrDZtacJcRB8cxm1NLPKH6gECPB7aZd79XTYc9jRYmlM9BfQRpDg9N60T9ps=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:dad2:b0:1eb:53de:fb with SMTP id
 d9443c01a7336-1ef43d2a43bmr588245ad.6.1715299836952; Thu, 09 May 2024
 17:10:36 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:50 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-34-edliaw@google.com>
Subject: [PATCH v4 33/66] selftests/move_mount_set_group: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011039_815228_62BEA028 
X-CRM114-Status: UNSURE (   9.40  )
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
 .../selftests/move_mount_set_group/move_mount_set_group_test.c   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c b/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
index bcf51d785a37..bd975670f61d 100644
--- a/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
+++ b/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 #include <stdio.h>
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
