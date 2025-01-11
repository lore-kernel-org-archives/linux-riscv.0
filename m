Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA52E77188
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jan 2025 00:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4wbE9ZJDH+y+R7d0OyZ/tNsBt0GG78Fs0bYev6uF2w=; b=JLufNGFrrnIRCg
	Eh4XEoRUwiR4iP+9Ktrth/1POVB8cGbWn74LIT2ZUrat8AcGL8It7HM0lzjpn3K0XbNyQcS6EkMY4
	TpeDMicuoCFr/RiqcokrFu0lLYcdT75xfMSJsEz56N6O595zvUBv7kRKIHl3NNQut2uh9LF35d25e
	URhYZm646ZWXmaeboqjwBhaX/YBdOStPccm2iINaP/BAK8iKb75J7453u+vggsnAWtpmGIzJijb3B
	gsR8BUjiwe65G9iEhL8dujqwXgZEisvQ2gZQE77NvfAiNQTMMgUKfBT+li+VjKnBfmo8Wa9Bvv5rx
	YELcUaGygH3JTfcRtsdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPlv-0000000HRG2-3Tas;
	Sat, 11 Jan 2025 00:54:39 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWPiP-0000000HQMT-0MfO
	for linux-riscv@lists.infradead.org;
	Sat, 11 Jan 2025 00:51:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so4815126a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 16:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736556660; x=1737161460; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=j3Cl7emQhO0Gv8ADACM/NdBjmdKyvZlY2sfvUkjDV6PFQwegYBnWu6Jajr/MXZhTp8
         pPzJ6UiDTMOUhMVaMH8DIfLJeyFOrkJtzR8TkJcJ57NI5zY3of9cuJg6naCrwqIlpuHr
         V2ADM5L+WipPPTp/6mw23z9dscBQJ4M8xxd1Qtjoe6kBUTiQ+oEll0PtP1hU9N8/Eb//
         0ym9PNljJtv/zyXqjCmIesTnfiIEFZaTp7q13OW+5xuHLxHP3IeBaX0/Fzqc05JeU6yg
         dSdSE0jqbL8m9X2cYMu3mL4JmKXMr04KPqR1oJxN/jC3X/+CXZDdXtsNkyhT+jtCLAd9
         8nFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736556660; x=1737161460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQGXs4fRzhUjC9h6471rkcBzWgIFKg5z0MpBCPWHmMU=;
        b=HnVkRey/wejr9QhbqNs6K5QBzHm85YmymiVWMd3H81s0xGaZ1R0ZevYdxBvVsav0kZ
         ZhKGwpQdAaoT/9mtl4Stgfdfajb2HvL14L7RMsmd+Vouo/eQHCwl+tyjPvb2bkb5ogR6
         nDr7XrUjtESIEdCW1yNg7W3hN0fe5LQv/tlGUiL1FweLYcjoDavZjaioYOgBjNzM7nXU
         DG2bSl62nd8nyZHbnR0HY3XxwprxOOtL6AAW+pH5n6LRJeMFhfCRzglxnThFQ5hXScMv
         vnymgeEZCTpq1wGmAwpCfVxvrdWWNnlyUVxqmqHJGU2qz7RZJQvBzcfJWwbMCoBBc9hD
         3dSw==
X-Forwarded-Encrypted: i=1; AJvYcCVnFmvh7wa7jb94LCD/hkXt/Jm97Yxbkik9NSIQnoKTC82jQvIar6VFFntt0Y5ndecXkdkq53hUkXhAqA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1XdcfG6DSHY6/gLsfvRj5dOt6QXM4V7nE2BA8LXQBgI8Spogo
	1xelS4rjgxrBk2NDLWr1HGevvc5ZUZT75RfyhdlLDDaNCkPuxnSqWcwcx4CCn35eEiPMrekI78m
	Nmw==
X-Google-Smtp-Source: AGHT+IFkTOLXQinvGI8s6GviRk7XKu9XJa8etcXjW5yAd+8/VTBQJ+NHE0WBibUOfLnKYqGfPAkdUeiGwEY=
X-Received: from pjbqd11.prod.google.com ([2002:a17:90b:3ccb:b0:2e5:8726:a956])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfcc:b0:2ee:ad18:b30d
 with SMTP id 98e67ed59e1d1-2f548e98f31mr17356212a91.6.1736556660239; Fri, 10
 Jan 2025 16:51:00 -0800 (PST)
Date: Fri, 10 Jan 2025 16:50:45 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111005049.1247555-6-seanjc@google.com>
Subject: [PATCH v2 5/9] KVM: selftests: Add struct and helpers to wrap binary
 stats cache
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_165101_124369_DEDAF8B0 
X-CRM114-Status: GOOD (  15.60  )
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

Add a struct and helpers to manage the binary stats cache, which is
currently used only for VM-scoped stats.  This will allow expanding the
selftests infrastructure to provide support for vCPU-scoped binary stats,
which, except for the ioctl to get the stats FD are identical to VM-scoped
stats.

Defer converting __vm_get_stat() to a scope-agnostic helper to a future
patch, as getting the stats FD from KVM needs to be moved elsewhere
before it can be made completely scope-agnostic.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 11 +++--
 tools/testing/selftests/kvm/lib/kvm_util.c    | 47 +++++++++++--------
 2 files changed, 34 insertions(+), 24 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 044c2231431e..9a64bab42f89 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -46,6 +46,12 @@ struct userspace_mem_region {
 	struct hlist_node slot_node;
 };
 
+struct kvm_binary_stats {
+	int fd;
+	struct kvm_stats_header header;
+	struct kvm_stats_desc *desc;
+};
+
 struct kvm_vcpu {
 	struct list_head list;
 	uint32_t id;
@@ -99,10 +105,7 @@ struct kvm_vm {
 
 	struct kvm_vm_arch arch;
 
-	/* Cache of information for binary stats interface */
-	int stats_fd;
-	struct kvm_stats_header stats_header;
-	struct kvm_stats_desc *stats_desc;
+	struct kvm_binary_stats stats;
 
 	/*
 	 * KVM region slots. These are the default memslots used by page
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 21b5a6261106..c88f5e7871f7 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -657,6 +657,20 @@ userspace_mem_region_find(struct kvm_vm *vm, uint64_t start, uint64_t end)
 	return NULL;
 }
 
+static void kvm_stats_release(struct kvm_binary_stats *stats)
+{
+	int ret;
+
+	if (!stats->desc)
+		return;
+
+	free(stats->desc);
+	stats->desc = NULL;
+
+	ret = close(stats->fd);
+	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
+}
+
 __weak void vcpu_arch_free(struct kvm_vcpu *vcpu)
 {
 
@@ -711,13 +725,7 @@ void kvm_vm_release(struct kvm_vm *vmp)
 	TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
 
 	/* Free cached stats metadata and close FD */
-	if (vmp->stats_desc) {
-		free(vmp->stats_desc);
-		vmp->stats_desc = NULL;
-
-		ret = close(vmp->stats_fd);
-		TEST_ASSERT(!ret,  __KVM_SYSCALL_ERROR("close()", ret));
-	}
+	kvm_stats_release(&vmp->stats);
 }
 
 static void __vm_mem_region_delete(struct kvm_vm *vm,
@@ -2214,34 +2222,33 @@ void read_stat_data(int stats_fd, struct kvm_stats_header *header,
  *
  * Read the data values of a specified stat from the binary stats interface.
  */
-void __vm_get_stat(struct kvm_vm *vm, const char *stat_name, uint64_t *data,
+void __vm_get_stat(struct kvm_vm *vm, const char *name, uint64_t *data,
 		   size_t max_elements)
 {
+	struct kvm_binary_stats *stats = &vm->stats;
 	struct kvm_stats_desc *desc;
 	size_t size_desc;
 	int i;
 
-	if (!vm->stats_desc) {
-		vm->stats_fd = vm_get_stats_fd(vm);
-		read_stats_header(vm->stats_fd, &vm->stats_header);
-		vm->stats_desc = read_stats_descriptors(vm->stats_fd,
-							&vm->stats_header);
+	if (!stats->desc) {
+		stats->fd = vm_get_stats_fd(vm);
+		read_stats_header(stats->fd, &stats->header);
+		stats->desc = read_stats_descriptors(stats->fd, &stats->header);
 	}
 
-	size_desc = get_stats_descriptor_size(&vm->stats_header);
+	size_desc = get_stats_descriptor_size(&stats->header);
 
-	for (i = 0; i < vm->stats_header.num_desc; ++i) {
-		desc = (void *)vm->stats_desc + (i * size_desc);
+	for (i = 0; i < stats->header.num_desc; ++i) {
+		desc = (void *)stats->desc + (i * size_desc);
 
-		if (strcmp(desc->name, stat_name))
+		if (strcmp(desc->name, name))
 			continue;
 
-		read_stat_data(vm->stats_fd, &vm->stats_header, desc,
-			       data, max_elements);
+		read_stat_data(stats->fd, &stats->header, desc, data, max_elements);
 		return;
 	}
 
-	TEST_FAIL("Unabled to find stat '%s'", stat_name);
+	TEST_FAIL("Unabled to find stat '%s'", name);
 }
 
 __weak void kvm_arch_vm_post_create(struct kvm_vm *vm)
-- 
2.47.1.613.gc27f4b7a9f-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
