Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07000606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 14:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XM78RlE/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jUaVmQSG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7WbkkldsM82QiD8ejyHp8pwvvgwRAY8i2SvQaU2eQx4=; b=XM78RlE/9F36AH2iTC5KE2opPD
	jYhk5C4kZ7xPLwqeMAgmdVWq9/k/xHK+w83NxUejs3+vKfFJ25S0dg/mV4qkRGeNI7NgW9CpMWseP
	DFeIsaueSeiu3Nlq8pfv39RqfRgeVadVVajHLTUAzcaAe0r0FiZdPtY4M25qS+ZCtA/pyw6STUbub
	seDf5IbF6O8YUQUIb3TM6evGIiednl4I/geQKUuzeV4LSmepWmRZEkq3O6OFPiOe8X9mgSTxO7ptz
	r6+T1QTSqsgZhkaAQfEKamm1P1R/7lRzKstx46So8Q2ncuMHxBtZgCr3eCNM4R7Iogj6KU+oapvUG
	6HbxS3HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGDb-0000000GVtx-0NQR;
	Fri, 23 Oct 2026 14:26:03 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKGDY-0000000GVst-1mUI
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 14:26:02 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-48b060ec084so628097f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 07:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792765558; x=1793370358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8/9qb/C5YzBF9wNJ+pPwlOlLNA/YL7ODqh7qU0jpbbg=;
        b=jUaVmQSGPcGiVHFUBW04/wIUw5L/EUrpQuNedry0nsorBZeKCf4cjZD4ZYmJkhQuPt
         ce2X0WyrqLrh7t850gvoRQ4zbM4VzmM47VYvSSgPvNqZURlCs2qN9p65gq0WMT6Z8hM0
         7YUYE3s1X1g+oQYtNV7UZTGf32s+f/oxPH3UTyY69rScwPdhGA0/6kB9kNLlGxSc34pc
         rZ4YqdIIubtxYk/eg/cIgFyNb2u0OxiFzTaBFJ5ej6ESfMfPLZIXQQcUDL0rAtEEnXKT
         pkQ5AAq8lDwI6J9iY+1k+PoPxIe8oDOKgoDhpfqdxiDkXRrUj4rz9l0MIxqaD98xUMRa
         An8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765558; x=1793370358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/9qb/C5YzBF9wNJ+pPwlOlLNA/YL7ODqh7qU0jpbbg=;
        b=OQZYulaVyWQxZBT3o2uHPrMYtvqtjNGSwxYpqnqnUXVYvMKRkCRwf4Ol6ZUGSMuq1s
         K/eHm6BxSOhjTo8D/zUIhSajvGdhu1nbsFZoaHWWwZtZAMpL+M2hZOyKIgYbG5HDvDC0
         x2Tm5iTyZ0R9Z5U4Kj/AtTc/PSFt2wsCWN42FKT8M107ekkOXNiTPxWbv5xJfyS/VOQb
         RVhTTmk4WNTebaRdB1JNc7MDeNsHmjSkgdnX2iNuQJ36ca2W6Lc5CIkdqpBMueLAxhsr
         8UKpZ5OQUevlEKMcLtr+u5w3sLt3jr7aRgIujE6SCuhJKgNRQe8Qj9d1bfMlbCs8JrCC
         +pFQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9JnT4ifomWUGzJmWmUAy3dGnssn8nZBsDrwNLYn+NKz9HCvcCmVOt+n/suEKsDzc2ypbQsE6Ne6+nZA==@lists.infradead.org
X-Gm-Message-State: AFq9FYK98afSv0hOPpxbFSD49rZslqWs9WhqDLapMgVePll3Zl0jsqxT
	Dl8hqUImXBXMrzay3w314DnwAgNxmQboXPug8WBFQrYbA2Qr+C1uq/ID
X-Gm-Gg: AYBFou1XglrXS0mgTwLieTKiL1rWTXoJ8KnmHsmHYRpKPC6cNTvp8LhlWUCNy5sFjWR
	BmqiPlv5Jj3q7s1RzZ73f3pK7qQE6fBIKqlACD5n+u41He9YnoKnUQdP5q5sDpg6DlPxpdoSzgC
	hTjclLuCQkVLNDUpN4dEJZmbQBHGp9yv5/NjZhZYOH1SRk4gbsVeBIzQG6gjcpxerw56OIBqPcs
	99SE/pu/v8hZP/C9kfKPye4ZQHIdXnTRdQmVbDD/p+v4DuFuakEBSa7r+h9wV9+yDNL2cFcdQSO
	PUjFD02nyLJl4KjjEv4gQqFJr5kC/pelZcgtTdY3pjfyXW+f7kPTMJM0f/nT3fK/ZVh2olTCnhZ
	9eH5qxpyI9H7XQkB92uzuCp9EDecLaHvjdLVbOdFKMLeLdAEx1itNE0EcML9R2k5qkS/saWfcsf
	5TUQ6yughCTcnlYQiK2YxzKmebqLTde9zPE1n+p/zK+gHyZjcmAqU1O+/v00yBaXxF1ekN6Mm02
	kicRWg6rzw2vRlkvFU1tK/81un3qpQaZnBjANEn0nZw7jREOXYUeorYeFkCirjY+4EF+Plam1LJ
	Je7cv3EPIFYKY8HHcig=
X-Received: by 2002:a05:600c:34c5:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4a2148bced7mr33045025e9.8.1792765558311;
        Fri, 23 Oct 2026 07:25:58 -0700 (PDT)
Received: from fedora (user-109-243-67-71.play-internet.pl. [109.243.67.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2b064fc72sm7917965e9.11.2026.10.23.07.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:25:57 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
Date: Fri, 23 Oct 2026 16:25:50 +0200
Message-ID: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_072600_482542_873277A9 
X-CRM114-Status: GOOD (  16.26  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kvm_riscv_vcpu_aia_imsic_inject() writes the interrupt identity to the
SETIPNUM register of the vCPU's IMSIC VS-file while holding vsfile_lock
for reading. The lock keeps the VS-file from being switched under the
injector: kvm_riscv_vcpu_aia_imsic_update() and
kvm_riscv_vcpu_aia_imsic_release() take it for writing to move the vCPU
to a new VS-file or to the SW-file, then read and clear the old VS-file
and free its HGEI line.

On RISC-V, writel() is followed only by mmiowb_set_pending(). The
trailing "fence o,w" is deferred to spin_unlock() by the mmiowb()
tracking, and rwlocks don't take part in that tracking:
queued_read_unlock() issues just "fence rw,w" before the AMO, which
doesn't order device output. So the SETIPNUM write can still be in
flight after another hart has observed vsfile_lock being released. If
the old VS-file is read and cleared before the write lands, the
interrupt is lost. If the HGEI line has already been handed out
again, the interrupt ends up in another vCPU's VS-file.

Add an explicit RISCV_FENCE(o, w) after the write to the VS-file, which
is what spin_unlock() would issue via mmiowb().

Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Why RISCV_FENCE(o, w) and not mmiowb():

- Since the mmiowb() rework in v5.2 (e.g. commit 60ca1e5a200c
  ("mmiowb: Hook up mmiowb helpers to spinlocks and generic I/O
  accessors")), mmiowb() is an implementation detail of the spinlock
  code. Explicit invocations were removed from drivers by commit
  fb24ea52f78e ("drivers: Remove explicit invocations of mmiowb()") and
  from the documentation by commit 915530396c78 ("Documentation: Kill
  all references to mmiowb()"), so adding a new direct caller would go
  against that.

- RISCV_FENCE(o, w) states exactly the ordering needed here (device
  output before the store that releases the lock), which is fine for
  arch-specific code, and it is the same instruction mmiowb() expands to
  on RISC-V. wmb() ("fence ow,ow") would also work but is stronger than
  required.

Scope: this only orders the write before the lock release. Whether a
write that is already in global memory order is guaranteed to have
taken effect in the old VS-file before kvm_riscv_vcpu_aia_imsic_update()
or kvm_riscv_vcpu_aia_imsic_release() reads and clears it is a separate
question, see https://github.com/riscv/riscv-aia/issues/172. If it
isn't, these paths will also need to drain the old VS-file, and such a
drain depends on the ordering added here.
---
 arch/riscv/kvm/aia_imsic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index f17dc559a709..807bb73a129a 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -1056,6 +1056,13 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
+		/*
+		 * rwlocks don't participate in mmiowb() tracking, so order
+		 * the write to the VS-file before releasing vsfile_lock,
+		 * i.e. before the vCPU can be moved off this VS-file and
+		 * the VS-file read and cleared.
+		 */
+		RISCV_FENCE(o, w);
 	} else {
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);

base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
