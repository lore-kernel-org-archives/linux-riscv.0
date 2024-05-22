Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D45C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M9R4lNj6JKTzA1zGHlAOV3vKtMEIft/oA75c8HNBSts=; b=c9/U6f8uM2NlEVqzy+dDLersKT
	H9XyacqJSS3wVEyq73UMBERaaC7t314eH5gZ/vw1EegKLQnzW3fvBLh1xEavdPB8lJmqnLPjCkbql
	1ZMgYhox8+2N2VTIEY0i8x+NQ7+dZINZtgytYsjVPf1KoLylj3acX/SktLyBe5MfUX4y9zSAmjTpH
	Rxv3fz1v/cubfyeTHAuWdkFvcT1Qt5JBIpMbHh92uOJ9PIa+s03C696lvvuWozsB1btcmXW505/hM
	eubNOvu0AQrxpp7Facv2hW/0vDe5HSae1qLRWO4GK4T8qoXb892DvUJrzfpFFMKiGm6qG28sbxlBU
	DMBmd8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aPL-00000001WXs-2GpZ;
	Wed, 22 May 2024 01:04:43 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNF-00000001Uw9-3NZZ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:40 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2b3773153feso11296617a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339751; x=1716944551; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a/alAv/4/ktSZrlS0Fd5uW+NL7frJ+JSUceLln6ipw0=;
        b=i7/+oV2nvZJUyYoNi6kayA2SXgfFQgio4qBhR5q2+3bEcny9A+cLoz6QScNcxgJCMW
         gOQWU8BEUQZS+N/oPjsow82PlcL+xMUikHebM4YPUXb8UuJThzoOWpZI3DQOZ1BQnCnW
         u6b7Es/iJogDZCnQRSGkkfz6FzpV5wVHT+m2irOfhkDWCqCFq0tInGYBjmYuS7xqUS94
         2Sz1nihzCu1YtkMT9AgZhbt4OvOkmCc2Zre5IiUNYnx5/UxSnbcZbzRaqEKVb03RDrgE
         0m+5YEswJw5VoAViECQI38ioaFydkfRDvzEt9dVbHpFbbiuftYVavfz+or3YPCb6raYF
         ahFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339751; x=1716944551;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a/alAv/4/ktSZrlS0Fd5uW+NL7frJ+JSUceLln6ipw0=;
        b=eembNukPzA0wttkW4btRNFAM0geZtiTPzq8Kg4zcfOyicXnmtv5dPGPbne6+ts/WzJ
         rWhVAXGIG+3d7EDydm2bebLei0ZtS1BIL7O6rft7o0Cx2LxVnJ6DQyVms1oJAsaJUFZN
         ImSzEcm68SY9iXPgZgWW36q+nU63uSNQE495LaD++wpWLtZJDUm3dA9G2xTtZ0bNSBne
         WbGXpoG/XSBiHbVJdhj3i/E4TpiIJ21UVs0kGXwRKIgykD9apqHpaui6feiJiniML8AV
         twH5sLcCvaxoM4Df2o+BfBLvQCY69g7KfsIOpc/XUUOddIzo4ONRKkCaSJbHPNBt5e5k
         giYA==
X-Forwarded-Encrypted: i=1; AJvYcCWn2cKjpXAEI4AAJVTWqwl59a4rlUVm7DHOaDcn9CYfGgTFRVRD4sNnXSplRL8SuwRhPQUqQk8nxao+9ZNaNThUNClmafpIH11PKsyp7Uop
X-Gm-Message-State: AOJu0YyNnjf9I08Oa6rmtweE32CdxO4i2z73M6GpU7aO4i7cmqV9vR7j
	73skcO1+9Lq6N+WAJpxify/9Yu1akLIlvJHS0UIuUo0i6T5BM/AxosYBoaYVl48F2MziBGS9fij
	SXQ==
X-Google-Smtp-Source: AGHT+IFKRYUemB9bQi8KmbkmxRhMBRRK8qY6EnK/nEzjCpEKdmTU9GKLzNY+XB779KpN4GXjVpxm8X7d6Ns=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:3008:b0:2b2:804e:fbb8 with SMTP id
 98e67ed59e1d1-2bd9f5d4c18mr2338a91.5.1716339750670; Tue, 21 May 2024 18:02:30
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:48 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-63-edliaw@google.com>
Subject: [PATCH v5 62/68] selftests/tmpfs: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180234_017959_504B2985 
X-CRM114-Status: UNSURE (   8.20  )
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
 tools/testing/selftests/tmpfs/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/tmpfs/Makefile b/tools/testing/selftests/tmpfs/Makefile
index aa11ccc92e5b..3be931e1193f 100644
--- a/tools/testing/selftests/tmpfs/Makefile
+++ b/tools/testing/selftests/tmpfs/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -Wall -O2
-CFLAGS += -D_GNU_SOURCE
 
 TEST_GEN_PROGS :=
 TEST_GEN_PROGS += bug-link-o-tmpfile
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
