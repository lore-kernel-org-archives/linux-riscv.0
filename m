Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543B6C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JJiGvLuJpreGfwswbR5GSklnVL1NUcrgZZQeDjHT1nM=; b=3YO6iOHKFUu4LL1PRaAMmF/UTS
	n1Geu0e3TeQXnDYYHkCuQddod7oAroy5Dgh9rr6hpl5fhUvDpyi/nHlhsiMp5MjDCCtj19ZP1vfCU
	uNS4eVel3IWIcX/wNqrjb4hC7O/xJfeT7rBo++D6WyyQrOR8BXPhK5sPcAWG35Y1zLcFvAb6MG0nu
	wY0IwxxCd1ZW//oK+0+xz5TyfU14iZj1Jv3OMwBE7A/vkdj4/uYG42+ycZKs+pxeLvPbVX9aV0/xZ
	ty16bmRI6A04F99UJpfkKPMLm7R8WO2hW8bYykbUEkR3HKtCtiTTts7kHldpS8PmJf3cO+bmuOFCq
	2l/NO2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aPe-00000001Wn2-0NwU;
	Wed, 22 May 2024 01:05:02 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNL-00000001V0h-1gT0
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:48 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1eea09ec7ecso134848945ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339758; x=1716944558; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=EY5v4vW6zuGUWHn5v3Q67qpIi54gAcWCg0e6EyybCAo=;
        b=Vfk9xLAMh9kor+W7xemHTW5WiTNjAa5/nVspfzVjz55y7sJ/T4NSNicO0VJBTdSuNM
         wK2SzEQCytHWXWRLplzPhYhnP6aRefzVgjpDNzOHwQ4DoALsBe9snoTUqqmIUa5lgjgD
         mmXbZU0k2gPv5IaJ0ZjxHZUEBh2SeyPKXe20UuBM1DMrWthaHE+zZcA/7N5IigojdAtr
         LIxoRZ/C7yjVvWedanFry5Gm+XstUGXeUpYua5FYZWEujiv7/FPAKiZaQIM3F2AvR7WX
         wxnzFizhx2t0aZKnIoyP+9qJ9CKXLgcKuQcmwkCNDDNmWHhuYmz5cR2W5UcB9ZFv1VF8
         yn8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339758; x=1716944558;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EY5v4vW6zuGUWHn5v3Q67qpIi54gAcWCg0e6EyybCAo=;
        b=BMtatf60rAoq9p1xYX0VyCphsl8/tvCy8ZDxJDJCwQodC5wntYmKSDLr33fW6sPn8F
         eXSqwAGu9Um25UwIlHw6C7wG7TSOv8OnkaAV/DMbuRA6IMHrERI4bwOl8O+ba3H5gvsv
         8ZOKxtObX2ihZxG1a5JLSRaS/8jOyEFQmEDdbWwdEa0HmCrI5+bUGb3EN1F1jpl/nL+X
         YQBslNhiSQArQ+PKv8MORqWl0BcALSHO3G3dU0BmZBiOazvVSiLhKCZBRJdrOBHMNpp1
         0pI88H+llgn8AR2UoSyY5ffkrAXQjMQ/7IbXcSAFXqmdAQyBrhIZ1VE1WlCc44bqzJIY
         hFow==
X-Forwarded-Encrypted: i=1; AJvYcCVOlFT3kLvGMBrI79fs7KzBN1ddd85hZyJidsDCQMxhvMvORI4lBJg6c4mhzjXwhH4TQLKKiwrg5Y+S24xsl0celBxCc8RFiJ+MWGhz10y3
X-Gm-Message-State: AOJu0YxiIpcwOJBZf0AAt3SAE9cbnQCjCP4gs0kBCWwDWw0obD0MX1tR
	LdVogY4fW9eNbSnLY3opEDRx1XRkQuOaDChwYs0R5Ru/aDHKIX9fmEqEQtapFaVRCS3rClBcmoM
	Wyg==
X-Google-Smtp-Source: AGHT+IEx273+qW/DV4uOgH8Knay37/ukzBb9Gp8aRj7jknrJ931FW//nLLnnBAL0LEjWeDb8f6l1RtSdL7g=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:ecc6:b0:1f3:82d:95c0 with SMTP id
 d9443c01a7336-1f31c9dc851mr382085ad.12.1716339758083; Tue, 21 May 2024
 18:02:38 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:51 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-66-edliaw@google.com>
Subject: [PATCH v5 65/68] selftests/vDSO: Append to CFLAGS in Makefile
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
X-CRM114-CacheID: sfid-20240521_180239_569800_37594990 
X-CRM114-Status: UNSURE (   9.56  )
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

Instead of overwriting the CFLAGS that is imported from lib.mk, append
to it instead.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/vDSO/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/Makefile b/tools/testing/selftests/vDSO/Makefile
index d53a4d8008f9..fd36979435b6 100644
--- a/tools/testing/selftests/vDSO/Makefile
+++ b/tools/testing/selftests/vDSO/Makefile
@@ -12,7 +12,7 @@ TEST_GEN_PROGS += $(OUTPUT)/vdso_standalone_test_x86
 endif
 TEST_GEN_PROGS += $(OUTPUT)/vdso_test_correctness
 
-CFLAGS := -std=gnu99
+CFLAGS += -std=gnu99
 CFLAGS_vdso_standalone_test_x86 := -nostdlib -fno-asynchronous-unwind-tables -fno-stack-protector
 LDFLAGS_vdso_test_correctness := -ldl
 ifeq ($(CONFIG_X86_32),y)
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
