Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB0CC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=65SC5DB2QzMaDNUTwBoqKlWB3PH/FLipV2E0Ea4RUzA=; b=PMR64qwk4ZxITHRCJEM4+juZRK
	Ey5IIl71FVjE/gZ5jyu8LAvmUvF/Fu4P6d5eazfaFu1/X6iLOJRx0GTsyNXHyfrqooopQ5DZr/XYg
	4nUTCw8U3vKAB9mlGfgK/N9UTRDeZRvb8FP+3vum5KvhFRCtbTpyij9cwjw8ZZTPyibKvfBFfB8PT
	9gEuUzL+sbuS/v2Z/eEP4BdRF2cWH5j6I+xarKydlzmGaGtaHM7neGCO6xNFGy9wcbEmZj9rd38Co
	uqJUJLnHolkUBQ5J4F/1TdMq0hR4UMtkhxGkpSkj8nM8A2itcGdWravxftj9+AsfVm6zMPIElAkQE
	Ui8jvt4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59y8-00000002boL-032w;
	Thu, 09 May 2024 20:02:20 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xP-00000002b9i-0xkE
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:42 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ec5efb0a33so12234075ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284891; x=1715889691; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SARWn1297sTaPTixNcZ2P/NfR3z6dYPtI+wY0CAAJVY=;
        b=wR/ufXdUShsQ6CO0XZffgbOdbQ+cEaeT3ajjvj/m+6FOHuPlaW6xfaytqFYIyvuv3b
         RdztXvqkLpAwNhJ6kR5O6r+Y8jZ866kjK/rfba50AQzQTN10yyxE7cUWYtGxQhnu/Yg3
         xc8juuH2FkEfpz7zsK73Jmr7NYcyA2935wocEAanXJYZl6puoJIZK5LU6AduoA+BAwFO
         O9nDUQd2GNJC155hZnErvYwCv0svUSQFQL4v8WR/jKZXLlOS1mWUOjmr0Jt3fzp0iPph
         oGnadTW2dmj+xgzzK0EnrpkLRIIkaYR2fRbqskzmqmUdAFIFHvkx68tN1TepP6URv+Iv
         6K0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284891; x=1715889691;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SARWn1297sTaPTixNcZ2P/NfR3z6dYPtI+wY0CAAJVY=;
        b=Y7lDemVo0iwU6QtMTAuI/drHMYqYHjz9yOmMf77zbv4PYpvSCGA+y4MoM4lSlnFbnA
         mMb483vEhy7+3M/LA7rdbHT6FSlaJBPzGYu2MS4kPlfInhYqkNGMZozQePjPkjr1+t/D
         dbD5SoBUPK5fkLTU0mw6O0K7O3OvkPbfNlgGrshtq7Y3IIqfLF0tlqH41Iww5m+prw/m
         l9SxcDY42IKymQtdCBKfihsfRB3bV53krxRRJST/2REDwU57nix/8gyRTFSCINRni32y
         ejaWMuECoFMDF7mWW3yYB5Zi6wF5U0GVZC00pK8c3NT+uBV1ORdh7oroQzZH/7KpM5dd
         SpSA==
X-Forwarded-Encrypted: i=1; AJvYcCVjyu9NCGjvJ+nmuSjNt5kE1C59LO9xEdoq6E7hd2QQOO6NTyv1aU39gwCBx1Rm80vwWbtDYbfOqthWaJUyg6SFhpiqSa/Hv5lYd365PqXU
X-Gm-Message-State: AOJu0YxCkKnXCReIUInsk4h/PooFG5Xd+UXQbJ0sgOdzba/Bzb7L9m7U
	fErATycIWXI3ZTw+fGYyiwyZEvNL1e/j8r2ZbGIBPqAvwwNJS8pfI9ZVwqoKjrscMyWsKuKrmmK
	tew==
X-Google-Smtp-Source: AGHT+IGdQihvGYGHF6PdjZpZUUK6gc/kNAnaTsu4e7xw8HeMCFzPLsdZMDhNcn3aU3W22mZMcXJG1JBkESE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:903:110d:b0:1e5:62:7ab5 with SMTP id
 d9443c01a7336-1ef433d9bc7mr28285ad.0.1715284890584; Thu, 09 May 2024 13:01:30
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:07 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-16-edliaw@google.com>
Subject: [PATCH v3 15/68] selftests/exec: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130139_162732_D0521BC3 
X-CRM114-Status: UNSURE (   9.03  )
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
index 3c79ec9bf780..18d7a1e5a416 100644
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
