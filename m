Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4179CD8CB2
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/8bj+u+eIqpc8JPuEs7wDLkHyuW+m3JnwIHEAmOKPcU=; b=uKAHBs5mudJu8K
	MMhXypvdmj2ZkW7qG4I9HxEUemofNeLH0Bet4q68DPaTQW2SH9ENTxX8Y6KumGkTnmFg4n1JkW3WB
	NaVHHME5IkzdX6yoGr/DWDSAHk/rSLkJx0RYP7DBOK3WoUhFBOhV4shz9mnq7IblIWW8uN/cWZFRB
	IWMKeSFlLqF1MbI+RtJWGTwU4Gn61+4f7A6Vr/xi1+dNAZGKkzBT7APUdN7zA7AeQo3Idn1F9Z+9e
	xLSUbnrUFTP1PWSFQM784Dxdo4ilOe4OYP5WxM/ajnzAi/3Jh5qQZsj4CkmCVnEEisHj92eCgw/+E
	LrHpJq9/jvKBwYzPdmTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1MI-00000006D1R-3nhm;
	Tue, 09 Jun 2026 18:39:31 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX1MG-00000006D18-04cT
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 18:39:29 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-307631dbfedso12765176eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jun 2026 11:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=junsun-net.20251104.gappssmtp.com; s=20251104; t=1781030367; x=1781635167; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FH57FRORlpQ4VfYVu81d+iFGksd7tr1xxRWoLdX8Hu8=;
        b=ikkPFnNfwlm1S22zG5JTErlUcs0RgYH0CCrmq4iJcFStPiucSSKv0il6G674TkYF+P
         OyOygIKW7xV3v3mW6PCjGbvtFxmLNJYRbFzX+0qccKnVf+vQ2s1Bo6VNdRnYHplVnm0d
         hUF1CjAkvSICbxFh7EV4RNZahDKTjaVvWRyzFu4t6ONzGUeZGTcEfeBLUwpXmqXCktav
         0zDSu8wAX5fv0RMZR+krxEs2NMCY9E2zEfPCcmAnUAvMPxxUI8EI9P4QRx2jWIZasHnU
         RDPG3H9esxYr0SN2B/PMWqfb27ZidVxE5bbq7SXgRuqpCKw0ioXNhPPSeS43EXxRZJc9
         fWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781030367; x=1781635167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FH57FRORlpQ4VfYVu81d+iFGksd7tr1xxRWoLdX8Hu8=;
        b=pa8dlc3LosQVl+XX8M5BfN868LOX+a6H3uJ0T9ASnipMqDUqn4TY8CCM4P5lQXiZee
         mfnV6jOKqiPWcT+crZ72rPg7xceyNWgOP2vrb2dPwBrF8HEahD8n1vUGzEVbPTKZkNGX
         MnKSHmiWOSREmH/iz45eKJoNlVApXN/GsBXHs21vmVt29egeR349NT9YLO2rOuGWlmw7
         B3qmFGVbAQzrxrnxhQhKrumSvxCQ6CXcfyt3SH4jIilkQRk9DlVNAJZi0KD4PJHZ9FZW
         t7oDN4Ng45pdWqve5xoVUywGc6GdMXj/d9Ef2x7jWVAH5kjT028YKyCujOeWCKtLmb4q
         335A==
X-Gm-Message-State: AOJu0YxnMSjvjTR98iKaiqqmjpX5haWViLP101E2Ujw1MXXulfmMzfIy
	nTQ54tnA57fxceo9aMVqY2a8hFPG0UNc5jAo9yO1Y6Z2WYiKyveRwJopZ2WhIEuv5LhGiEsP79P
	vhby/TA==
X-Gm-Gg: Acq92OGxH7QRenNV/EimPRL+FIS9eRRVdOBNh5aDPIKyfNJFR2SsnGKXcLeUYLVBYry
	YhSh5mTIxwh5mObY5yGKaSCACaAzDJnKde128/y3yzgWA583E4gRN5u1fpnUeftnd1bMRcz5rwK
	o2/+A5VjNM8OneDjO2dCu4mN94slYxLiSmYF6gb+3K9n7x6n7BYo5Ia8rB/i1zhPw726fuVUIWJ
	9oHdsRYv1E+yvVo3JcbuiGc0zhc/P5P0JNDvj9THUxbA14Qwo3XOwEp4IU9rNvAQbpse+o/YqWw
	DAyhSPNAcRss2Aj7aT/8HkFfUAleR48spZhnMNYf7bUpXTuOwa8h+ndnxcLOlsf6I+RfPLUWUtC
	PMiCzB6n7a8VeyBJpcC7W1d6pCDqx+2YAnqTKHZkcK/Q/6xU/dacgAEQymbX3jtw+Bha1iN3R16
	hBYOmsKl61+9iKinerYgF4OwbwhH1bbFMjNp20TTl6VwMkYrrt1PFK1Oqmc+lTXoQApoxD4ICi5
	zgrN7BZ7tdeUhz8rDVF1Afb
X-Received: by 2002:a05:7300:ec11:b0:305:56a:c38f with SMTP id 5a478bee46e88-307d6319818mr3157790eec.26.1781030366940;
        Tue, 09 Jun 2026 11:39:26 -0700 (PDT)
Received: from ThinkPad-T14s.localdomain (c-174-160-255-66.hsd1.ca.comcast.net. [174.160.255.66])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074dea8e76sm21065330eec.18.2026.06.09.11.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 11:39:26 -0700 (PDT)
From: Jun Sun <jsun@junsun.net>
To: linux-riscv@lists.infradead.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-kernel@vger.kernel.org,
	junyan.lin@spacemit.com
Subject: [PATCH] KVM: riscv: mirror VSTIMECMP into t->next_cycles in sstc path
Date: Tue,  9 Jun 2026 11:39:21 -0700
Message-Id: <20260609183921.42043-1-jsun@junsun.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_113928_432964_434C5AA1 
X-CRM114-Status: UNSURE (   9.80  )
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

update_vstimecmp writes the new target to the hardware-visible VSTIMECMP
CSR (via NACL shmem) but did not also update t->next_cycles.  Between
the SBI set_timer handler and the next guest entry, preemption can fire
(at preempt_enable after sync_interrupts, or via schedule() in
kvm_xfer_to_guest_mode_handle_work / kvm_riscv_check_vcpu_requests).
When the vCPU is reloaded, kvm_arch_vcpu_load -> kvm_riscv_vcpu_timer_restore
writes ncsr_write(VSTIMECMP, t->next_cycles), which clobbers the fresh
shmem value with a stale t->next_cycles from a prior iteration.  The
guest then resumes with VSTIMECMP set to an old far-future value;
hardware never asserts VSTIP; the guest's timer ISR never runs; boot
wedges with riscv-timer counter frozen.

Without the fix AOSP/cuttlefish stalls on K3 + crosvm: guest /proc/interrupts
riscv-timer counter frozen indefinitely while /proc/uptime keeps climbing.
With the fix AOSP/cuttlefish boots up fine.

Mirror the value into t->next_cycles next to the ncsr_write, matching
what kvm_riscv_vcpu_update_hrtimer already does for the non-sstc path.
---
 arch/riscv/kvm/vcpu_timer.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 85a7262115e1..4e31a6a341c5 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -71,6 +71,15 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
+	/*
+	 * Mirror kvm_riscv_vcpu_update_hrtimer (the non-sstc path):
+	 * update t->next_cycles, and then set hw CSR_VSTIMECMP.
+	 * Otherwise, a race condition with preemption can cause
+	 * CSR_VSTIMECMP to end up holding a stale value
+	 * (kvm_riscv_vcpu_timer_restore writes the old t->next_cycles
+	 * back into VSTIMECMP shmem on sched-in).
+	 */
+	vcpu->arch.timer.next_cycles = ncycles;
 #if defined(CONFIG_32BIT)
 	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
 	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
