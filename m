Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55696CEE326
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBk64IWcK8+Jx6p86jhDBg/jktnaReD9rdLwWnhSRMA=; b=aQplLEV2NDIweV
	8xQfGncdDHGYZkD1KbiQxOQxVeLbek0kurr9h8ACdy+Fq5OJjEZuG0Bz6J2kaEEBUk+G1D7kLRte5
	G2ufDWhxgFgUgFqSKPPbWe9u657aAuJ71W6abblXM2nt6Mu6hySNDFS99yPBOPE+3IkLzLrflmm1x
	pAHL15DbJjmvRC+A/ZIfTmFDi7j2FUhINmqRnR0mUNyWPbYw0OnWfykwqAtMgmh4VWAj8kTCoRQ2+
	qCp+VVj4lyPcz8agyHenizvnlNI7Zdvnn/IF4Eufxrn9B3/9XlZMZvkFWAWedQ/oJ0vNii3ii5X04
	cZNZA+0enOqs2K++43aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syZ74-00000009qNJ-2KAv;
	Wed, 09 Oct 2024 16:00:34 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syYwz-00000009o6s-01uY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 15:50:10 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e0082c1dd0so146325567b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 08:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728489008; x=1729093808; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9+y7oelTnk6r5KXO5BIzd9TWGjZrwMN3AFTrylQnTmc=;
        b=NMfKRTMamCUEO2rdugMcs9J0mV7FJGfTaQfhsuQlni9+NjxNyk/ZquVcR/bTUNHen1
         AiHTzcGCcokghKTaUMCPgMXCsUZ9oBrYFYmdXHoHmgDbD5WEoXuuYdYqakUodMZ6SxBT
         Ez6MUz4v4vD82nNlmWS0DlAjS4M6a+/tul7Qqh/zdIHnknSFunusfqqDd1dJbjiuFEDl
         sNWjJnTeG5gf0QcgU+DqOW0ZzrRBigk3jN/Dd+hzJuYNOHqIQZFLCLs/3JzHnb0ymfTT
         5bXB3lsTfY1Ue+clrWQqyJBgG1JMyXnDbncqd6LQ2N/DuDvEPVwUDQMt5peT37weOjmC
         LVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728489008; x=1729093808;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9+y7oelTnk6r5KXO5BIzd9TWGjZrwMN3AFTrylQnTmc=;
        b=lsRZcv8llvetUinIPYu2ruRe68VKEBfVuYPBeHqdTgwrU1m2SzfKhvGJk3GsIxuJvU
         VrtKvC+Cu8Nfa1jFvdgxzsuLPQGN9SGWL92lWlFC+WGoCNm9UWyaY4ZSVt+QtCzCSxOk
         M4eO4S6w4hW86zlx6k4OsOVGJy+iQoAOyBbJPq0PMNUjb7M6fbEWNna0LvH1EoP6ki7J
         KeFnlPy0AEndVRh4jEpqdtKZDTGmybLSmn4Z8QBknfhU2ZpV3kGcL1laeFc0TSirSTHo
         BGkdDB0hXdXmJmvbmbyvXJU8p0pFn43FofiDTC2Fd2EVbLf8TQDDBwCsP4Z7QZ0kqEKB
         0saQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3thLPPMsRCkHAmViih5BDqKqT77TNHBb1BCKUTgw8JjISwLB8Tl6FHnEhKzKl69yWTGuFXhmSkIY1QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YykxdPDwl3qA28Ew8H2UMCPjScTUfd8l12iJGX9/l1WAUckw6y3
	IY6LB7G+qsc+8q5HiO6KL3AZBc4wxAMmpN3u405q+k/J9Oz2UpBVvBAHgAU/Lekgu2lSH3LKjFX
	4GQ==
X-Google-Smtp-Source: AGHT+IEnOiEr/7ufmCoIIHo0RYjnE1E6sJgU5IKNyLPqmQLuHnTee5V8zvUGQ36LhzFM/1nmzHnRUzKqVBw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:4b08:b0:6e3:b93:3ae2 with SMTP id
 00721157ae682-6e3220deef6mr671277b3.1.1728489007658; Wed, 09 Oct 2024
 08:50:07 -0700 (PDT)
Date: Wed,  9 Oct 2024 08:49:45 -0700
In-Reply-To: <20241009154953.1073471-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241009154953.1073471-7-seanjc@google.com>
Subject: [PATCH v3 06/14] KVM: selftests: Rename max_guest_memory_test to mmu_stress_test
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Andrew Jones <ajones@ventanamicro.com>, 
	James Houghton <jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_085009_151708_FC288B65 
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Rename max_guest_memory_test to mmu_stress_test so that the name isn't
horribly misleading when future changes extend the test to verify things
like mprotect() interactions, and because the test is useful even when its
configured to populate far less than the maximum amount of guest memory.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/Makefile                            | 2 +-
 .../kvm/{max_guest_memory_test.c => mmu_stress_test.c}          | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename tools/testing/selftests/kvm/{max_guest_memory_test.c => mmu_stress_test.c} (100%)

diff --git a/tools/testing/selftests/kvm/Makefile b/tools/testing/selftests/kvm/Makefile
index 6246d69d82d7..8c69a14dc93d 100644
--- a/tools/testing/selftests/kvm/Makefile
+++ b/tools/testing/selftests/kvm/Makefile
@@ -139,7 +139,7 @@ TEST_GEN_PROGS_x86_64 += guest_print_test
 TEST_GEN_PROGS_x86_64 += hardware_disable_test
 TEST_GEN_PROGS_x86_64 += kvm_create_max_vcpus
 TEST_GEN_PROGS_x86_64 += kvm_page_table_test
-TEST_GEN_PROGS_x86_64 += max_guest_memory_test
+TEST_GEN_PROGS_x86_64 += mmu_stress_test
 TEST_GEN_PROGS_x86_64 += memslot_modification_stress_test
 TEST_GEN_PROGS_x86_64 += memslot_perf_test
 TEST_GEN_PROGS_x86_64 += rseq_test
diff --git a/tools/testing/selftests/kvm/max_guest_memory_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
similarity index 100%
rename from tools/testing/selftests/kvm/max_guest_memory_test.c
rename to tools/testing/selftests/kvm/mmu_stress_test.c
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
