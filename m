Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9955C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vJiKMgNz19aqw1PtTh9u8zcm/PkZGbfSGHgTA/MIKxM=; b=C/sL4WztteUG7zVQel9KQeqjTf
	Wq+P0ipL9laaPsAaBJIZkj9mQns3E5M4sh8WG1zkpTkHCWXvAJW2Iw5ZmlgEwCIMMFJWgyRIidVZn
	Lxob1YDQYifkf/kwTfl9TZ1IjaV/20p57S1Ohn88H0tWg3rZCMovIBxnAFTHc7c3J0rPalVnMDAvb
	T2z1R4bWB0sc61uDYDSwtT9MGWvknPr6vwGHjQ8KmnKA0cbUOh07Z/iXSSHVFvP+yE0Ybl8X8PNJz
	4XEFF/JZznzL/Ifu1hJcpl5cLDAFKwIpBxUYBCnSvi3XvBllCKmRolWmkdjjUwWEf+kRq1P7hwVOQ
	A8Fnwdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aP2-00000001WIJ-3Adc;
	Wed, 22 May 2024 01:04:24 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aN3-00000001Upm-3odD
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:29 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-622ccd54587so217023217b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339740; x=1716944540; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wlialQE3WRWR1pwtVktV/TGzvnI/Kx+cCanCgGp3ksk=;
        b=YvaHBm3jZca/vzITscGWQfm+CvtS8K8BBRskFBhDPSyvdiZ0zfOv0azPrw68zMLsBK
         gRHTT2bfEkYuCfDDxoK2CE9KsFlghNbr+reAuRj4Y7t5SkUyoPB6wu5j5eqn58wXoBhI
         gzH3mbmZTovlUJCjyDJx8616Fsmw9f/pztOu1gQUQmAqLAQKJuGkBDLN3f/8kVVIF8+i
         x5W2lLQtc+jWdcrmdEaa/JuBPWU9EPS1SzSwXSODkzkiDzPptpwUnl8nic3200oV2GNK
         sIM3b1lbnuDUL8iX62ZEscTfptLkIPvwYqKQbvwL46yQa3orFl4kv9JSOdiu12oEKyO9
         OT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339740; x=1716944540;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wlialQE3WRWR1pwtVktV/TGzvnI/Kx+cCanCgGp3ksk=;
        b=XLBxjk9j2bpSQJLC8smvuwGPq6OLzxmO1y6lUeaks88S9VftyghYcnF7ww+ZnxUYze
         I32mgNg9A5zfYuCdCP4P6Tq9HAzk3rx/rBTxKQnUmCWhMywqCLNyLW1Zu9M4m+diRZTc
         Y4qEYZaOA1vZqZuOd0e6R42/FlOac/zCpSx/QpEP54NYPYiZ4XQpn+8qpOOz0wCfNtwo
         HvHrfyPkRv0/rN8VhuCEMDURSBp/juupQvPbgDbul/8HwiZRoJEbWjcRr19v/4bMwDVW
         KMSbEb9pqKKe4RNbnAqU3SNbdTPnod/fh442E7QZ5qNrzRERzTVnZ75VG9x1dwvAHwqF
         ipxA==
X-Forwarded-Encrypted: i=1; AJvYcCUndSRytJI9Hknjrq4cRgSKYnqD69p0WCm8dt4odnPJPlCy7CjQgKPwDrmiwPG8YZrJlRYYhUyEZtUAGYJWWWVBycllX+YBypNR+CvpQCOl
X-Gm-Message-State: AOJu0YwEbZ7310ihKZPqT+ZKoHWup7q2EPGStaqwlztMV2CPcdCGr7Qy
	IibCs3LswwzO+A/qodyzi/p70haodu7dpeaNpia5KoSsBJdexuCJdoQzcrlA0aYe8Jl3hHcMUVN
	AMA==
X-Google-Smtp-Source: AGHT+IHHzL4YxLE2AEcSk2fAIkbtuKw7ZK5BSNmkghB0hZ3ZZbutYPAUIbkCPCupmeXDdyNkLsvPeNDVP3A=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:df15:0:b0:61d:ece5:2bf with SMTP id
 00721157ae682-627e46ca886mr1794187b3.4.1716339740171; Tue, 21 May 2024
 18:02:20 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:44 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-59-edliaw@google.com>
Subject: [PATCH v5 58/68] selftests/splice: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180222_225437_14E30463 
X-CRM114-Status: UNSURE (   9.34  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
