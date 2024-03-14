Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD70C54E69
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 00:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hr/D/2ldYFdJkFldfG1MN8yFBnsRnDzJNq7y6+GgJGo=; b=1PUHNqzkdEKlU7
	PZzQAUOtR55BgqvY6I2d98Wa8R5krEYinyrPwyxVnon/cGu6xWRef2V2eivonO/gBTfFUaTPLZUuC
	bMsBB1aweALgjsOcZb3LMAIHctv1JcwSscm7hVmX9/SjTVLMiwjvs2xRe5Ia7cqpeoCRo/m4+DtXt
	y8WxgTNfEualzRAiC8F9GbT6OWlpD0AYmNPPwXJVW3iKJZ6Om7eOxZH0LIFdEoyVG7O0Ml9smzHfR
	vR9Yj6PRo6MRLyXI5dYSy0gko/q9fgjdVDEfbAOtEjEtu2X08Jia66bO36hPJO869qtQS/hYbM7OY
	ESCzAgcvLB9oqpbEaDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkvUP-0000000GAmA-0DHq;
	Fri, 15 Mar 2024 00:32:01 +0000
Received: from mail-yw1-f202.google.com ([209.85.128.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkuTR-0000000G019-0kPI
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 23:27:04 +0000
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a2b82039bso28782417b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 16:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710458813; x=1711063613; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=bGD1oHLzIwlI71Um3uWf9rz8YDkt0fT9aZFmZxidv5s=;
        b=PAUzV/vSfJRkljJvJJVdoBy+eFTx3Mo8vYwMHSjW4oBFmGYiSPZ/mN6KL43WekCIWj
         BBAPZuoiekVIEhGl4cVktgdly9h0Az7rvg1hbYPsjyZZ+Ja9I9DARa9DTnLnanVfD7Xu
         gfoLjyjpk9Ic9B5lR5sofpb6gdE2XtgqL2GveyQTNtrcrcr4KiUPZMt5SxZVm2w4TmM0
         BwLr/aCi2flTlHHUxEx/6pGeW4RdIJwjGlmfRs3vZ3jrvzi1wwKjtYFE1lVZc5Di1I0m
         4QgP6fHLPsky4uiOTm6K0Be0WRANahL3Ol/VssVJZtWQVhCGay0vOCB/4geliE1nAZZW
         DjHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458813; x=1711063613;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGD1oHLzIwlI71Um3uWf9rz8YDkt0fT9aZFmZxidv5s=;
        b=mrwKre8ILZQJjuStU96wlV8B5N9IyMKzbcNBFFNTgv9mXUXdDXZDyGolFK2L+cpE6z
         QDte1vP1vx7w3NzYaO/KeDVenc7a0/SwaS6wFzayJxDs+uSrc7ivPQXTdGYNF6jph/aF
         i09b2fpcqtiL0O4hU2R7ILXGhg48WSsHIuuQ9kQ6zVSC+npg93sZjwXDrnu9GOcRrCPL
         hd736tCx5B1lEYBZzzi6YC6MsgARbA3PO30e9jMmcPReB4xEOH4A7IxkcqEvo1l3yNzA
         zBn6MCxF0otr/dbZLaBLRTUptwK9/5XjXg2rrvCQ3Oj+JfO0iHfHbk/Q9hfFgh5G6Ll+
         bVew==
X-Forwarded-Encrypted: i=1; AJvYcCUwo0olzGAGMbdLYy4Hr3b7VKePjMj8nIwizje+SlJ/dLF/Ymm5rRXIp93Jl6oG8kCMLT01Md7jcMyeY1G9Dt3clWlHZJLoBRveNluNI/oc
X-Gm-Message-State: AOJu0YwGbrYtBBZYBREJMZQoMrvujvtVlYnWGCywTIfiVDBTGY/7OUqo
	XqstinjjGZNwIrlc0kuhDe79f7Kvwzq0M7aG3d5q49EWx+Y83TXGzjIGAfEtBNnVvDGphCqbzXt
	BbQ==
X-Google-Smtp-Source: AGHT+IEf2SHyoW7Ci/nXvsu/vvl6dD716Be1qw4xm14NPqmYsKQJNpbDJU6sbwjkwsuGTYDcc+4TPOzUy5A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1b85:b0:dbe:30cd:8fcb with SMTP id
 ei5-20020a0569021b8500b00dbe30cd8fcbmr188618ybb.0.1710458812732; Thu, 14 Mar
 2024 16:26:52 -0700 (PDT)
Date: Thu, 14 Mar 2024 16:26:26 -0700
In-Reply-To: <20240314232637.2538648-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240314232637.2538648-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
Message-ID: <20240314232637.2538648-8-seanjc@google.com>
Subject: [PATCH 07/18] KVM: selftests: Explicitly clobber the IDT in the
 "delete memslot" testcase
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_162657_587337_BCE24357 
X-CRM114-Status: GOOD (  12.32  )
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

Explicitly clobber the guest IDT in the "delete memslot" test, which
expects the deleted memslot to result in either a KVM emulation error, or
a triple fault shutdown.  A future change to the core selftests library
will configuring the guest IDT and exception handlers by default, i.e.
will install a guest #PF handler and put the guest into an infinite #NPF
loop (the guest hits a !PRESENT SPTE when trying to vector a #PF, and KVM
reinjects the #PF without fixing the #NPF, because there is no memslot).

Note, it's not clear whether or not KVM's behavior is reasonable in this
case, e.g. arguably KVM should try (and fail) to emulate in response to
the #NPF.  But barring a goofy/broken userspace, this scenario will likely
never happen in practice.  Punt the KVM investigation to the future.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/set_memory_region_test.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index 06b43ed23580..9b814ea16eb4 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -221,8 +221,20 @@ static void test_move_memory_region(void)
 
 static void guest_code_delete_memory_region(void)
 {
+	struct desc_ptr idt;
 	uint64_t val;
 
+	/*
+	 * Clobber the IDT so that a #PF due to the memory region being deleted
+	 * escalates to triple-fault shutdown.  Because the memory region is
+	 * deleted, there will be no valid mappings.  As a result, KVM will
+	 * repeatedly intercepts the state-2 page fault that occurs when trying
+	 * to vector the guest's #PF.  I.e. trying to actually handle the #PF
+	 * in the guest will never succeed, and so isn't an option.
+	 */
+	memset(&idt, 0, sizeof(idt));
+	__asm__ __volatile__("lidt %0" :: "m"(idt));
+
 	GUEST_SYNC(0);
 
 	/* Spin until the memory region is deleted. */
-- 
2.44.0.291.gc1ea87d7ee-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
