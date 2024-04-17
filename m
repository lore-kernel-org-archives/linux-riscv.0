Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8294FC4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 07:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FAus1e1mp7jqN2IYgeoJFqy2KkIks4SRp4VYy6EYstg=; b=ne3u4H5fT0LDUY
	bO3vAAgpAtNE0RLJjpyTgkCxa1jgDHgcgD/SMCFAio2hHU1Fa+evZQHuEjhIytRjuJ3C5wD5f9psG
	At91MJup39/57ZIbHtXxHcuuT9t8J6ax14KlY3IM8BZjwQEFvewuHxaYJfAD/96GiQYG80nSbCfHM
	xbMVeWkln5lGVcbEiVjLNHMjdfH4GWr/HAH/i0t2lLZxg97w3WqNsQ70o0RjMj/AcPc+eT99UkXfo
	ldDpNHFZjf1Ymj857UtJVcNQcZEcwOUow5Wt8Zh2OBLltCYdJHjtd/+aVFEH/sr+C8ie6Yewdx7d+
	BN5S/lIbJS4Bm4M+efJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzz8-0000000F5EE-1JBU;
	Wed, 17 Apr 2024 07:45:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwzz5-0000000F5DG-2Bn4
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 07:45:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e83a2a4f2cso637605ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2024 00:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1713339933; x=1713944733; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPoAWzbhZDDol+wYAq5fuI0cDfPFo9qJjJEMHZ2Oirw=;
        b=KAUrZMH02WVbEzVCrzWDtgjtwZCP8mI88A0ejxSCrwyGbZAv+1iOQ7WRwmuRV0PyC5
         +ynzAvLjrEb6CxkAO80S3RyJr8oQoZRMRxIBzq+ydcCvaHpuohSujLT0lGA067jJmfWG
         1i91HZUVpJsHbzA0V835/Xa31fbWgQGtXHWS+u/oqmD1kFX5hw3hsXALIFqmvd7oEz3b
         qnb1CJTcpKLPGf3Ek+BtubsriqIrSen7sEOALUtmaY+SXeVLP08eMNwuwMRyqvZf/k/M
         mYA4xZGlMdyr/Pqm9Pb5eV8yIy/lie4+iQCTTvaHdEhb3No4Op2hj9RzPMiodQowgPCA
         sm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713339933; x=1713944733;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPoAWzbhZDDol+wYAq5fuI0cDfPFo9qJjJEMHZ2Oirw=;
        b=XYu//B9clofsYdqGJUWB3Xqf8T2FsVqwAgLAALUVEu2utfW8POqOxea4xE76n1DS18
         VjY/uTQtA16dIJTwWiG2h8UbghlximSpcpf4lUZJkkF0ZoyurTJ3DLR4e+Q+89pGYy8n
         k75E0HPOrus8vwW6MHmTTlYhzWZY2KfgQM2EhiM883MCRvsHlQvSh+J9/2zAkZ8iDYvs
         W7TCHqsTZM46/dyMGr3SRHXyDh/FPucZViWIfjvFn60tK+4lY/AZVhzBANNjI8Sg7D3a
         NKfWLG1jzdMQf2DwADujLqQad5jnreLgSvDqvoYpeQnEQ2Ai8Zk5a+s3NmRSADGddwH3
         aotQ==
X-Gm-Message-State: AOJu0YwqzdrhYnTGfSvrG84oQAf5gVn1qWcuJwvDkEQzWiRjKz8ZlP0T
	p2pQYMm8S/HbLdS1EsSSkHuFYURXOTt+oH6HVJEau7BtDqgknu8cFLGCaRBU7lNGLR2vGp4Q4WL
	SenkPHusH9KhW0OOSfmBuAOwe8BqF/GodFJnx6S8lgfNL6Jxa9jXBzXKrF8sb9aGP69BkZfMtuH
	J69MJHsGvSmUamsDQSvFjiGqH87ozI6YV8ldXvtHq/Xvi1V4v1Lc06wByofg==
X-Google-Smtp-Source: AGHT+IFR1b6z12QUhENSnxpg4sEOSZJTfDBt75s7Dwfzk8g2spVAGKxFZ0v8/ABEyJRPTbu4tmXlkA==
X-Received: by 2002:a17:902:7285:b0:1e5:4743:deba with SMTP id d5-20020a170902728500b001e54743debamr14119071pll.58.1713339933346;
        Wed, 17 Apr 2024 00:45:33 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id g21-20020a170902c39500b001e7b7a79340sm3166065plg.267.2024.04.17.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 00:45:33 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2 0/2] RISCV: KVM: Avoid lock inversion in SBI_EXT_HSM_HART_START
Date: Wed, 17 Apr 2024 15:45:24 +0800
Message-Id: <20240417074528.16506-1-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_004535_571581_B8DBAB15 
X-CRM114-Status: UNSURE (   7.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Documentation/virt/kvm/locking.rst advises that kvm->lock should be
acquired outside vcpu->mutex and kvm->srcu. However, when KVM/RISC-V
handling SBI_EXT_HSM_HART_START, the lock ordering is vcpu->mutex,
kvm->srcu then kvm->lock.

The use of kvm->lock over there ensures that only one VCPU can update
the reset context and call SBI_EXT_HSM_HART_START for the target VCPU
simultaneously. This patchset divides it into 2 separate spinlock, and
replace vcpu->power_off with vcpu->mp_state.

---
v2:
- rename the hsm_start_lock to mp_state_lock
- replace vcpu->power_off with vcpu->mp_state in PATCH1
- add vcpu->reset_cntx_lock in PATCH2

Yong-Xuan Wang (2):
  RISCV: KVM: Introduce mp_state_lock to avoid lock inversion in
    SBI_EXT_HSM_HART_START
  RISCV: KVM: Introduce vcpu->reset_cntx_lock

 arch/riscv/include/asm/kvm_host.h |  8 +++-
 arch/riscv/kvm/vcpu.c             | 62 ++++++++++++++++++++++++-------
 arch/riscv/kvm/vcpu_sbi.c         |  7 +++-
 arch/riscv/kvm/vcpu_sbi_hsm.c     | 26 +++++++++----
 4 files changed, 78 insertions(+), 25 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
