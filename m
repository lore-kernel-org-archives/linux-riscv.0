Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89441C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0eR1E2oi1DQ9RrUSahr8ysyxIjwoTqOd0i6yy1LXWQY=; b=K9e9EXxAoVVSMwikfgdE0mshQo
	Oz5x4i0rTLdm+kV9HjSd6JI1w9P0S3ToyyhspHibKTguTviApawuqGFlcIKs5bVCoWRiF7lszJBJS
	Gy9Iy4H9qEzh7Xcoe8VTILux+XyU+PKvXJAVMWQzYOabNHm/waU3WcsGtolYHXfRO0XZiULOuvO7q
	M28LwJiRyI4CtOH4CFWCIW/dPp4Jt9SUsosocewglmHl9q88za39c0hvr/7OJQlSnEJQlUvHsljTe
	f2lvLO55+UxCPVMeRQA1fixDtIkV9+SZ8coc5ZW3Ukt+1XdvGU8P5DZjHwAeTAI+1ft2kVwYtrMPW
	nCjt06yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIk-000000036IG-0Glr;
	Thu, 09 May 2024 22:31:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zE-00000002cdc-1qor
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7Be7dPPNzCq96H6P3h1xjg92hf8ZyE2EcN1YZKe/vuY=; b=gysWm4olI2MBdKXRkwXCY0qOqK
	4aH2aI3vITFTELhziXSb2bNi3O+CyKyZl3hm95oQilw0E6kcKI467WSDtZXCcnV2oRZB7DtUCpoJF
	hJB+/SMrnzXxxqS6OGvRkQAiJE8QvD69sVZPr/GyxQqLGREW3lZYAb9q2/bKoTRvQEAWmTdQKVfjM
	e1tTE+r4ia3+18CzQFPPWygvN50VXTh9x2m8NzNKJbrj6aGOsQGOn5V+6e+fMaKfkpfhfpDKM35f4
	8QqOCBIG6/d5ux2wOJOnm9fllSnYFvjIoPDAo4DLYMMqk30a2aRU2NEQZIvMvhHfpU0p7hafCtQ7e
	xOojYkRA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59z4-0000000309w-28bY
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:25 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2b432dfdcf6so1102066a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284992; x=1715889792; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Be7dPPNzCq96H6P3h1xjg92hf8ZyE2EcN1YZKe/vuY=;
        b=295U7sF1XRykTXA6fuamD4vkmxkrE/kgyvopfPObv1nhGWMQrsy0qTy40wfQ7GNXOZ
         yUAslGg/73B4hD+Y3qiUcw/QoJoEfloXff/QTNu2AZe2a/OUF4UE5Z6x2xNZL8kWfW6O
         5okduHNTWMJ+un/ZbCrN38iBNPIXQ25rZ/i3UaAcYCL/wIde5rybZ9o21WJ9H6/L9Phm
         mPHpdMyYMU/7DK8kHyzqwT4GA8EqGXXl9dSMjp42/pvankZgtedCsQc82Jexh4YrGd9U
         8nk0iwSaZh8Hd6MRnYD9WmTBgFWJx9e6S7S3qc4feUGgJCNNl70AB5MXix2xGWQYfG2C
         Na6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284992; x=1715889792;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Be7dPPNzCq96H6P3h1xjg92hf8ZyE2EcN1YZKe/vuY=;
        b=lDzfLl6dFrsqHPezOptKaX6+oQCwrmopC/tu+iVk3PuA+AwfxIsNGnIcrRzvV7BoYk
         wrCUDflHFLGKVmHmhpmp+YdKS2aGgCScslZKoCCQfB1ObanpKyLS2twOxaXMVvMMZSm9
         7WlJvRDqYaHVq7XxIPa7lPydvvPsGDaNk6n6z7bSS7bmQPtovHCLimWf8Nz8eTlB5qbT
         4a8EIWRd2DmcuAqZ/QxOBfRZtQFEktw9LMl4TV8nf/JzPelU1H1Sa+oY3iw4eR0oUFit
         110i74/4MdpFK+7EU3TtJe3Jy8DijQ+ViF34kEvMdSI2xGakrIIppjZLVLZNIle3tVV2
         +i6w==
X-Forwarded-Encrypted: i=1; AJvYcCUSY/crR+hUCxc+TdoDdaNE4BpOuCEJtIUzXnp/C7GoqDuW0i4AmNLJc7cAbSfJ2Iql5wTeN3ymKgn0At5X/Lbj5QFsSufxZGt4hn8V2/vG
X-Gm-Message-State: AOJu0Yw8ufwk4PGZTIWonHu3Vz0MatbSaKN6907Uqc+afG7yIzDi7Uz/
	uD5m5ybg1J84W3ygmDNA4ONLOXKmM5rb0pIzFqFvaW2p/xYLyOddZFp6o3b5RitkaDUoq7rsisl
	2Yg==
X-Google-Smtp-Source: AGHT+IFCjwU+w1U0yj0TkNwI/1blZtBGHka6u+vlka6eFMoi+Th2FASNm4gAn2xDAZ/v5xVDapqUQKSY1gU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:d30c:b0:2af:d65f:f89e with SMTP id
 98e67ed59e1d1-2b6cb6c0d84mr2722a91.0.1715284991495; Thu, 09 May 2024 13:03:11
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:40 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-49-edliaw@google.com>
Subject: [PATCH v3 48/68] selftests/proc: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_210322_236842_74442499 
X-CRM114-Status: UNSURE (   8.75  )
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
