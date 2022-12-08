Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05210C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F+8IF++nezNgdS1U3011ieJg3yP9tt0t2Eil5TQ8Tlw=; b=DBX2W7NVMGpZVNh1erau4LWh9U
	juGRniwXRm0VZ+xidoQzgN2guxfe/ohFYFUZNBCh+w2sIbBFvZNeN9yqA+dOw/r9aQa1tO8WaCnKt
	3LIOD6K51JdPUepIYd/mhKw7gDIANgr3DIueCsSYe6Htu5ggI7ibQkqqcOWgTEtwzQgsn66PYuENd
	/okN/Fel2IeU5dWQlW0oomjIclPZsNXOPzq3XKQVA9QuMk9Ggikwirn/EF9nEevszoVDyz/leUT6n
	3zylMeZwUzZ5BEDkp9OzML5k9a5zO28oRAS8JTRk3SkZ1H6nr6POnY/Q7llK1Er1ihoYNuVpJqTAk
	os7Bpa4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NuQ-00B115-3j; Thu, 08 Dec 2022 20:54:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjx-009rhD-7g
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 19:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SSdGxEhCr0RqVU7mTEekOKbILUbkr12FLBfwU71mUxI=; b=F+XT8wz6ZyllLxbinEwHSYeifh
	jPSs6APnN/i7u/3yixjRXHU/GzWbhnPCUJH5wLzh+vco2KIxRvLsAzs9j8TAcqnhpSxZk5bcbjFR5
	ps18u2p+8Z4R8CWM8tgox85FXKXFJanWal0hRKr6uvVT0Y3acT9Qke2rlwu1jwIgkMu0nhGraEy5h
	BxQia7/P+nRjEN+wUs44wWY4zxSSCGKqWmmF4rJgIQduPMk6DSid24W0XG0rPkUOqhvP446WMhHeL
	FpyZNsA5vUPaQQwOjTEIOrlzuqYMwZ339c0tOl1cDr6LLcNaPum6lQE/+y2Rbb4uqi/a2YRdOpDJQ
	1mo/3a0Q==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjz-007FwH-Fu
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:36 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id t9-20020a5b03c9000000b006cff5077dc9so2551647ybp.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SSdGxEhCr0RqVU7mTEekOKbILUbkr12FLBfwU71mUxI=;
        b=ASwdiNISwi39e3pN7oE2KNZFMmRKqmr3VYiit4wIyv47H88t6EbCKRpQMvgIGjb8Ee
         rJVPUEvW73NAo8aFV+BbV0Vr3OSkq29yA95vS5SMRxjzWXbnV3DZI/1DBZWOB8qdIrDl
         W6zsADUJr9yTIozq12aJEIz0+DdiTk+hebpQwi9Spbwq0O7+Rp/AhyZ8kHc6W7GbLEQQ
         W0hWYQM1VKgOje1FPxZ4mA6ztD8KMzpQNn+h5VJfv3SoW4uFDeXDtliLmzD104DdQ5jS
         RPnONZy1sj8iUseTf5J8a4CjaI/8JgGCw7ZrAZK92Qp419zeHoy00JFMymW+m0ow9uJP
         AA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SSdGxEhCr0RqVU7mTEekOKbILUbkr12FLBfwU71mUxI=;
        b=NY0n0JkgjsUau7EhFkJn1aC41oASbOFZDocHTM6fzKBQ2j9strYNR10ITouDIHODdh
         0oXuuxaWMDKPPrgk4S+0U3kkIvZ+1VHp9Ni8KMSWZK1toUDL/GfZtEjFDmtP3TvefQIf
         MoPCpSn0KO0LPIeD5oYH2EUKYFs6pK001ZM98/G3MqXcD9nSNAqm595uWQgarF6I5cuP
         /MgwXIex+SN55AHj7v9gL5em92PS7g8BFvamdmBfMwPIGSKnBMGDYOeEAeUBlwz4W6Pm
         FhkwWy5bRZ/h0kTk5u5H/msfyWGaMvF8lZ5zFKLL2bpLzjdJj8WW+vQ7h+ZjnWwGtIBX
         g4qA==
X-Gm-Message-State: ANoB5pmQ0PZu/qBKVtkxBlMfSNpByUy/YeM6I+l/S9u/TXZHv54rmptR
	+Jmd15CHxyzQySBWLSVIWczgtlxU7l0bpg==
X-Google-Smtp-Source: AA0mqf47fCCsz8lLNEesw2/yjinjmb5c0Q+BVTcOByCxMnOsH1R3SmOt/A4xjy4bk2xWJgLDn+u8z1uj6TTwRA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:9943:0:b0:3b6:79b0:c10e with SMTP id
 q64-20020a819943000000b003b679b0c10emr62215766ywg.87.1670528360357; Thu, 08
 Dec 2022 11:39:20 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:28 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-9-dmatlack@google.com>
Subject: [RFC PATCH 08/37] KVM: selftests: Stop assuming stats are contiguous
 in kvm_binary_stats_test
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_193931_541661_C6C5AAC6 
X-CRM114-Status: GOOD (  10.70  )
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

From: Jing Zhang <jingzhangos@google.com>

Remove the assumption from kvm_binary_stats_test that all stats are
laid out contiguously in memory. The KVM stats ABI specifically allows
holes in the stats data, since each stat exposes its own offset.

While here drop the check that each stats' offset is less than
size_data, as that is now always true by construction.

Fixes: 0b45d58738cd ("KVM: selftests: Add selftest for KVM statistics data binary interface")
Signed-off-by: Jing Zhang <jingzhangos@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
[Re-worded the commit message.]

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/kvm/kvm_binary_stats_test.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/kvm/kvm_binary_stats_test.c b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
index 894417c96f70..46a66ece29fd 100644
--- a/tools/testing/selftests/kvm/kvm_binary_stats_test.c
+++ b/tools/testing/selftests/kvm/kvm_binary_stats_test.c
@@ -134,7 +134,8 @@ static void stats_test(int stats_fd)
 				    "Bucket size of stats (%s) is not zero",
 				    pdesc->name);
 		}
-		size_data += pdesc->size * sizeof(*stats_data);
+		size_data = max(size_data,
+			pdesc->offset + pdesc->size * sizeof(*stats_data));
 	}
 
 	/*
@@ -149,14 +150,6 @@ static void stats_test(int stats_fd)
 	TEST_ASSERT(size_data >= header.num_desc * sizeof(*stats_data),
 		    "Data size is not correct");
 
-	/* Check stats offset */
-	for (i = 0; i < header.num_desc; ++i) {
-		pdesc = get_stats_descriptor(stats_desc, i, &header);
-		TEST_ASSERT(pdesc->offset < size_data,
-			    "Invalid offset (%u) for stats: %s",
-			    pdesc->offset, pdesc->name);
-	}
-
 	/* Allocate memory for stats data */
 	stats_data = malloc(size_data);
 	TEST_ASSERT(stats_data, "Allocate memory for stats data");
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
