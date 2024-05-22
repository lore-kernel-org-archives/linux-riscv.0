Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 924B6C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 00:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DSynInphoUnNRAM0g8FLGkqpmisAGwLQbTYqaM8UYvI=; b=dqqing4aYKKaFMzGvQ11C8fntB
	V5uqnwvA+7TV1KCSH+gF9uqSV0CRqYCpP5yEnAxg31uTtsht0xawoeFRJ4OyxfMYSUkwwdIU9VWlF
	gjVfJXxYUYKoiviEqazz8K60qnzW/I60KAFdnnzhQRO1gOMSWZz+kAE/oIdmHQEpCGnzvsV+/7w9w
	lWQhAbmTIMgcTy/e3oiYIoqEhcvx7Gmq4BhOCklxeTE33EjViTkDHWOHkrGABXwD9pDjPU+xWyN+H
	GqQ2td4haslVp8sU2eaGDoHzr77DL65zWrj7PX4JbLrbjvcmABt73roJX41PwQ8CAcosxYPVkuh31
	phVQS96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKO-00000001Suh-38WA;
	Wed, 22 May 2024 00:59:36 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKI-00000001Ssx-3q9M
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 00:59:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-df4d631a4c1so1243517276.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 17:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339568; x=1716944368; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iZfRAHT6JEYkQgkQi9RSt0VBBFkg9g20KHoFp+lD64Q=;
        b=ST4p//LsP1PnNTGFcRGbJbtsfey1VAIOiyDy6f7netbQpKqxS3k8yE8p2awsLJvUeT
         axEUWGKfXC+hJEkfNoMGKaEOcQfW3piuLTSiwn6/DHJIi8g+P0bj1AxnblIVuuKd0uDk
         c+CdUEcUnq6FwUXfcZegnBhFXernLZmzDQLWCzyN/yVhWzI8yOA2h7ZfXEf12ombVWev
         3STnTbBOAe9JUnyziPL401f3+nUON/EY1Rg5HHGI5G2dHReYp1oj7ya2MvS6ySseJCc5
         hgQ639aEdhoKp3mHE5epyLnlxTom+N2FfmO2sZICFW6rKvsgTI+cErwmpCpo8ir1pzYp
         QNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339568; x=1716944368;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iZfRAHT6JEYkQgkQi9RSt0VBBFkg9g20KHoFp+lD64Q=;
        b=bpv2Dv+LbpVWN+GjwEBTyX5odCpw5O6bWngHzFu0Dti8E0485mTFziAjzlQgvG5D04
         rBWV/hkf4K14zaJVSgDBkOT/jxOG9SCoKrRDINepFK40RxDKUZJKA/44/TqonBntxPlx
         LhcEibOLVD9jZroeBHu4v+jRYeZHoLJ7zYXK9hTm3IeaQWaa1l6FX404s8XuQaxC2qzx
         ljN/9ZZajNG9REMAYQio3T7dShk6fIMy00AnbpPKp6kNPPz/jX7KGZCmRkMT6Z2arSg+
         BY2+jbPXq1uD4MxF2uSfTs4R7bYnU8nt6IgwY7N98I1QRc+SiCeCqN6MzZbVxfZbd/DF
         NJqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgNusth4uWKOJ+5sLlmmDBVf5B4d0PifuoCFV/JBzCEeRwooTLsvZPwH2y+Af6Plw4fHzeg3OVNxyC3axpZfyrgZWbsCMduo5NkODBYCDL
X-Gm-Message-State: AOJu0YzwumFf/KowU6nIyXMNz+qUq0yelqrupaEen9wCaegTKxZCtB4n
	POvab390CYfCwE7kr6Y7TD4d80EBhMxFk4rBwl7QrObarT2Rso6eMF6xBOtpUhaN/vv8+KvX6jr
	o5A==
X-Google-Smtp-Source: AGHT+IGHXu+2VGmFaeast6zhMZ19NE5/92wXoClK1c06+eobhw7P/LEdr5T/7eLijAwtdqou/skFpj5TJBE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:70a:b0:df4:628c:3045 with SMTP id
 3f1490d57ef6-df4e0e130ebmr75748276.8.1716339568433; Tue, 21 May 2024 17:59:28
 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:47 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-2-edliaw@google.com>
Subject: [PATCH v5 01/68] selftests: Compile with -D_GNU_SOURCE when including lib.mk
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
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_175930_994508_6846A3A2 
X-CRM114-Status: UNSURE (   8.63  )
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

lib.mk will add -D_GNU_SOURCE to CFLAGS by default.  This will make it
unnecessary to add #define _GNU_SOURCE in the source code.

Suggested-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/lib.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 429535816dbd..e782f4c96aee 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -188,6 +188,9 @@ endef
 clean: $(if $(TEST_GEN_MODS_DIR),clean_mods_dir)
 	$(CLEAN)
 
+# Build with _GNU_SOURCE by default
+CFLAGS += -D_GNU_SOURCE
+
 # Enables to extend CFLAGS and LDFLAGS from command line, e.g.
 # make USERCFLAGS=-Werror USERLDFLAGS=-static
 CFLAGS += $(USERCFLAGS)
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
