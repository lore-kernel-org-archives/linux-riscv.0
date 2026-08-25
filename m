Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2083BC61DBD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AKAe9U53dQbQG/LdcOk3U1cfUjQTDGBeTgh1iXEUjZ0=; b=K72C2gNleDNQLg
	AtofSInMs5W7YClTgyMD/GNLbPJqH2FkbEJbK4ODNy+9gjz7UkHBY0Td+VMMLdzT7OVFUpOaw5QLN
	jhRBdUNhlZMxpGlQWYnD8Qc7z6/zmZgdsVK0LWCUn88XvLocoD3ebX6lyOKALDwXv9vmOE85dG3IC
	Z0gEnCTtLZG30lMLSzA6kNCvRWt6aYQgCSEJWERcZFxpToXKbknF3UhJdCxAFcSYn3cZcEBus2Wj6
	V/U3S5fYDS0kqqm18+TC6h32S/7ddJQ86UUmr55V6bQ/5eLc6ro6wB2kgPEQAN8EDzDBHNp2kekEp
	mCQ4O1fK4krvfRzaN2aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymf8-00000000Oo9-21Zc;
	Tue, 25 Aug 2026 08:37:42 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymf5-00000000OnE-0o2n
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 08:37:40 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so3247989a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2026 01:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787647058; x=1788251858; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rTiqxajFCS8JhT00U7QUj901RHFXVk9RFW4qrD2ZWqc=;
        b=n6eYs0k3dsmQDS8AzNMsknuIakC5ulwN/nuHdt/c+/9HfYt0Z46qBL6uzB2wp6rm07
         aoHIbkTEbMQlvkzlea+kwT7JGQGtAn3fPOnMfs+15uNsZXLu69O5zIKQyPjDLyWjvGum
         Z+arOAzBdnn4Rjs0jlJ7b0UaqOAmMMVuBlPFMl01jFamNObZEZbGqmWzzdwOZktLFm7b
         5EL+kFoXleC+uJ0IAopS3EhbDSp8TJFNBd3tgAFqphvxZB9c+NUrJvJGHg43yUsNekLk
         jDIiDoIIDpvt3J2l3jZVQ/qzof64uGWfLv0VGs8UK0EW2vffRStyidbt+TXYUFYk2gA6
         FbYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787647058; x=1788251858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rTiqxajFCS8JhT00U7QUj901RHFXVk9RFW4qrD2ZWqc=;
        b=mBXbw6RSdhO4mxwUE33xnPqIWtWsGOqwpd3x+DPRVn8mzbk8GXM5vDIKRk5ySVrOXd
         dN2rm7w3HOwt4zMKwX9Dq38mWrlZUaEbP0OCL0xqudB8Eb0j8Hkti/ePUtUSgeNSFuX8
         PdU/johj2CL6NvuPHPFRlDP4zGph8qT6E4uQNlfkk8+9+6WVpUvQjEyu7jBaBjDe+LKi
         0bZYDgVoAjHdOxXgtP2mgPciI1ivfn6ok+muYyLObYDrItaO2YIZhgeuhzEm8tHuq/0z
         63SlWflK9OyJ/gzTE6ifSDOWQPuSlOeygoLa9Yas+zmmHPPqz3Dh1HCkKziUtbvkk2cK
         ut3Q==
X-Forwarded-Encrypted: i=1; AHgh+RobZuezCUrGJMwHPoQYbskGEL/DLvbQaqGA+6E/zMfNVxP6th27vZlLZa1MkG0/rRpo+um9daRS+ZlyYg==@lists.infradead.org
X-Gm-Message-State: AFuF++kEyZrjTVGgPDTpK6zAVudHQy13oko/Ruo23HjW8kjAdmjKsHJ2
	UmwBcpourTeFCbnDrjQVNF5VRDLz0fm2uE5O1NweV33R7zXrq8gfp89N
X-Gm-Gg: AR+sD13NNTPsZJLPGmI+Cwce9psn/8H5PQMKjusSaxrqtxbSRMtSFM6PzAHylpsUPx9
	qnzyO3JPBHp035jG1hdLopgpov3hjMZDS3sOrKWQYw3sCZTkcGQTDFa9dUxLmnfZu17aVUNh9iA
	qZdmDAV0hJwXVUmmQKwK4jqT07QQkzaVBsNYXOyCmQploWyDuzmvbj6YbJxEYNYCi7S7czb1aVX
	DRHOboL6cXxSgk+a9o26QLy8s4A8VTX+hB4Rfo2ul49HozJLDPFUpvy7vlULTP5u5Nonngh4jrV
	Jo1s+z6zsy7TZsSZGcYlZiPBWD9OGLPD0B8113avGsFutI/K5Jn0oEBNAPYL35m3djB0BKVDbby
	5nmF8ZhmPE7bEtFJhC46NVtCiHYiEipqmE9O+BXYnvum9xarG+yn09lYQro+sAbwiuNbNbeE09A
	nxGm+eO4CzZxKy3s9Xvt9nNuKsM6S7SR4gluUzbM3D3kpfVO0axgxwi9ONyv86Xc/a3vFt8cdVR
	6NiUe0s2fd9
X-Received: by 2002:a05:6a21:320b:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3cd9125ad6dmr10437900637.9.1787647057741;
        Tue, 25 Aug 2026 01:37:37 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199e60abbsm1835887a12.23.2026.08.25.01.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:37:37 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linux.dev,
	me@brighamcampbell.com,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 0/3] RISC-V: KVM: Fix PMU counter handling issues
Date: Tue, 25 Aug 2026 17:37:16 +0900
Message-ID: <20260825083719.643970-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_013739_230535_C935883B 
X-CRM114-Status: UNSURE (   6.95  )
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

This series fixes three issues in the KVM RISC-V PMU implementation:

- preserve firmware counter values across stop/start;
- report failures when writing snapshot data to guest memory; and
- fix perf-backed counter accounting across read and stop.

The changes were tested with the existing KVM RISC-V SBI PMU selftests
and additional tests covering the affected stop/start, snapshot failure,
and repeated read paths.

SeungJu Cheon (3):
  RISC-V: KVM: Preserve firmware counter value across stop/start
  RISC-V: KVM: Report snapshot write failure to the guest
  RISC-V: KVM: Fix perf-backed counter accounting across stop and read

 arch/riscv/kvm/vcpu_pmu.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)


base-commit: 0a0d1d55dad570724bf8c7ea83409639cfb4be9b
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
