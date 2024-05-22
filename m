Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47C46C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 03:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UIrzjdnKuc83Sr3jlkcehByk/ebbuwo85zK+kneTU5E=; b=3DpIYhrscI/CAt1vQP17thFMo9
	vIosjSiwRre3NgzXRrDzOE4HCQIK67/RMfqPZCZpfPcrT9l0rbfM8jJfUqNiA2DwNtG7a6nni5mNC
	YjeXvMQMV+k/glPSVFwkP+5c3m6Ens5bh+XhIGj7vImg7Bv7UgrQNxbCNuZ6f0Vn+ezEVCdgKKbS0
	Y0n822iz8iArRg97wrDDdY05CQmOTZTSUuyuABB8UCQ9mqwerpBtY2l2In2VlqpbN5B93KoeOMaDg
	ekIJej+LgZkimA9rsZQVaF0XfihGW6zbiP+qWfKmkzj4XPTa2ooNbBO/LXv4j2Yu6Q4PCyu9tnky9
	Naq148kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9chB-00000001sog-2XXi;
	Wed, 22 May 2024 03:31:17 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNQ-00000001V3e-2Pmk
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:50 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f44b2e0bf2so12433857b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339763; x=1716944563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FDddXI/rz5Uh/0hxgnIVyZ6+81rNdMnfIsgCLtRcH+A=;
        b=VwUvKh13ZdS3GJDOqw9z3hKkzA0361TqfOMp0sLaYgOtUJhaYHUJ3Gq8SPnTIKPR6W
         zImOuBauft5o6ila7/JEl28vjMSBq1KkvGRdmgxe1F+4i1Iq7HRC/K6Skm9zMxoay+MC
         Ohx+rRkhtRLx/PylZhq+sdbPSxs0tgfrtSasYjNHeEawWRxq1A0wa9oF5gyTBzR7zjKq
         RKsR2ANsZcijE4xgFRiNnuoZfWbEpE+Gv3bqYPl5ShHGL6UW3T/4NbOR14dPUkH9iJGS
         AtmZlemunl3qnrTYvB+q/2pHiJIfL7/vVl4rGTZMG5VfxJjREkfHIuliniI7RoFXahyB
         HW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339763; x=1716944563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDddXI/rz5Uh/0hxgnIVyZ6+81rNdMnfIsgCLtRcH+A=;
        b=Kw6elwW7rgvroFM9PxGW3w0dAt641X9OEkjwRfMeDtspr/CGLxxwCzCKv629mkax3S
         THAy4GYcSGH6YzghWDN/lbGYHS4evoG34b3Oup3uHfeFUI69+s0bzVk3njbtPzZP2SI4
         vwKaxeaTn+EWtOt9K3pPAGsKO0DGkBjQ5JOQ1+i5ZcSro99wVeLsFtj+ldma++CZTVIb
         KOjzi5AXODNhHyv+op83r9Ds3GKvSm2XGUl8ApGsmWSImt5hObb4MNMWn+J/A55mTSJM
         nO6G6OID5IsudfXPBiSPs8aBUGVRs23tx3DezpELONA16CFR23biAUzOqbF4lJM23Xve
         hN9w==
X-Forwarded-Encrypted: i=1; AJvYcCVNj4utSTHaWUYeGwnYr4tF1LAUdsqa38l/3NC8hNmROG6A+dOYiXknPSLx1xyLsjGXBoZkbyjU1xNi8TkQ6uOScsSSv6al9BUTrQKTfx7y
X-Gm-Message-State: AOJu0YxPONwfZQD+BqP/9JsK+4QKS0OqlGLuyESWjocRaCCaXt9n61Ah
	86rG0R9Gox2xZ9RkzkUM+xEJ0kDS1kO5Nrx0yY6Ig9qOIypGn655xidZj/pYEMrk95hKbJ0BCDz
	D/g==
X-Google-Smtp-Source: AGHT+IH8wpGwaawCict9Ep4Ub644GN8fYtHlm1t7v7pZuightlDMU0GhBoDAJQNtreKGztGUsjMmh0JORdc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3a18:b0:6f4:133:f5a5 with SMTP id
 d2e1a72fcca58-6f6d645c526mr21783b3a.4.1716339763429; Tue, 21 May 2024
 18:02:43 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:53 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-68-edliaw@google.com>
Subject: [PATCH v5 67/68] selftests/x86: Append to CFLAGS in Makefile
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
X-CRM114-CacheID: sfid-20240521_180244_749400_5313A156 
X-CRM114-Status: UNSURE (   9.48  )
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
 tools/testing/selftests/x86/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 0b872c0a42d2..3395a5d114c2 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -35,7 +35,7 @@ BINARIES_64 := $(TARGETS_C_64BIT_ALL:%=%_64)
 BINARIES_32 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_32))
 BINARIES_64 := $(patsubst %,$(OUTPUT)/%,$(BINARIES_64))
 
-CFLAGS := -O2 -g -std=gnu99 -pthread -Wall $(KHDR_INCLUDES)
+CFLAGS += -O2 -g -std=gnu99 -pthread -Wall $(KHDR_INCLUDES)
 
 # call32_from_64 in thunks.S uses absolute addresses.
 ifeq ($(CAN_BUILD_WITH_NOPIE),1)
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
