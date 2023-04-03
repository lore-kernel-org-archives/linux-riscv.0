Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A79C761A6
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Apr 2023 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QuW7vIrXL8SiihbKbQ8fuitjIdRp9stBJl5+kM+DG8U=; b=npFjVuuFz3sCAL
	v11ACa54b2nUinX5R6afag5E/GLeCL8YGT2DYTixuRzyV+15MVqoVVdqfpDE3ydU9ECqR2dZCSWDT
	Uo0kv1Oq5g3VtoFuq/Ocvy7xmNrjqZil3YPys6Q5krtHiWU8JW8nm/OmHuHsZhv9YlM0PPB6A3u5M
	Th+85rd9WLhd9cL7MCD9TGcmgiPiKiMpaYB0Ds0qs5h3S1JD1lARfFpYXiNmF7DKg9ZMWK6hpC0EC
	BDFwGRvFZYaPSyiCzLf5H3cIJqyMYgxKp3A1SW3ss+aHThw5eKwGjeWKobPOk5L/khfoX38LskuDh
	ASJ2Q4k2jPT+c/tCI8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJ66-00FEpd-08;
	Mon, 03 Apr 2023 12:15:42 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJ63-00FEoy-1x
	for linux-riscv@lists.infradead.org;
	Mon, 03 Apr 2023 12:15:41 +0000
Received: by mail-oi1-x22c.google.com with SMTP id q27so20794878oiw.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Apr 2023 05:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680524137; x=1683116137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TS4dMW3hhVrS92UnjrQfADuzhNuNJZ4W/UKQPMy/KVU=;
        b=IExzSnPyPAJHwnxo3Oylte7PPjAayTEknYvoCwnajbhtx5YetGon+QIEGI94KzY2Vm
         vPtyY6g3jIZ+BUd2HJAVHj4FE/5KCipA8PN5P0+UYdb5xfAmYfyS//AMn7M/UaQy5VK7
         FeCALgtrQoxEe2WVkRsox3W1r/mFLPfG+4JXmPz0LNphCfhlCVe2dxd5r0Lpd0O1gKz5
         Cmvq/k7Y904bcF1BbxxlImvP7yDxlUsW4Ylr/J0JcpaDIh5pFTgLzIB5+MEL1u6DtsZe
         t+CjxqlNyH+ZFt78KMPr1kDqwxUDN1UKTf0iiZYMMl2FoHqNa6aR/RG8GwBYe4TlS6tg
         fTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680524137; x=1683116137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TS4dMW3hhVrS92UnjrQfADuzhNuNJZ4W/UKQPMy/KVU=;
        b=aF6yfMGhYAiBDJetiMdgM97DzVjGXLQgra5NNx7YzCxRVfGu4iiO+2p7qvAhgxXMo0
         N3nP00Mg+a8WVvKfwch0m4MJ2IcvZajdFgChaGmoF4xwaGlTa/EC0TE5eQOXxyFh5vrl
         3qqONh9j6KpQKD/MADxjp5e/MtiY3oleumeUxqi8+RWfz8JWEnhTv+qou2l5iOZ1SFnl
         42rDXCnYvEyE4pDuzghouWxyKqOc7leWHQOjlu9X1bThJP1CbEcnUuU2kp6FNkvAmECs
         2p0OhmsLGR3msAY4Zfi5PrAD9MlXpHsjhFgDiVKozadYncBzSnSrz/9bnsQ66D5Sr20D
         QtsQ==
X-Gm-Message-State: AAQBX9cg1RX5lRmpeW97/jxxoZFv+DZbnfAzyI/qIakCBS9hGKSV3m9V
	70UO80656+bchAIGwjfwqMQqZA==
X-Google-Smtp-Source: AKy350a93rTa/oVPFxJKYmjl+NPqKh1OJsbT5rNPcxqR7/VE6ouSaH3Z+beN96oY3IaG85BTVTpTjA==
X-Received: by 2002:a05:6808:4245:b0:38b:197b:902 with SMTP id dp5-20020a056808424500b0038b197b0902mr2262654oib.21.1680524137523;
        Mon, 03 Apr 2023 05:15:37 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a1-20020a05680804c100b00384fa407a06sm3763695oie.8.2023.04.03.05.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 05:15:37 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 0/1] RISC-V KVM ONE_REG interface for SBI
Date: Mon,  3 Apr 2023 17:45:26 +0530
Message-Id: <20230403121527.2286489-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_051539_671097_CFA3371D 
X-CRM114-Status: UNSURE (   9.02  )
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

This series first does few cleanups/fixes (PATCH1 to PATCH5) and adds
ONE-REG interface for customizing the SBI interface visible to the
Guest/VM.

The testing of this series has been done with KVMTOOL changes in
riscv_sbi_imp_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_kvm_sbi_imp_v5 branch at:
https://github.com/avpatel/linux.git

Changes since v4:
 - Rebased on Linux-6.3-rc5
 - Removed redundant semi-colons after switch cases

Changes since v3:
 - Added missing switch case for KVM_REG_RISCV_SBI_EXT in
   kvm_riscv_vcpu_get_reg().
 - Return a bit mask of disabled extensions for
   GET(KVM_REG_RISCV_SBI_MULTI_DIS).

Changes since v2:
 - Improve ONE_REG interface to allow enabling/disabling multiple SBI
   extensions in one ioctl().

Changes since v1:
 - Dropped patches 1 to 8 since these are already merged.
 - Rebased on Linux-6.3-rc4

Anup Patel (1):
  RISC-V: KVM: Add ONE_REG interface to enable/disable SBI extensions

 arch/riscv/include/asm/kvm_vcpu_sbi.h |   8 +-
 arch/riscv/include/uapi/asm/kvm.h     |  32 ++++
 arch/riscv/kvm/vcpu.c                 |   4 +
 arch/riscv/kvm/vcpu_sbi.c             | 247 ++++++++++++++++++++++++--
 arch/riscv/kvm/vcpu_sbi_base.c        |   2 +-
 5 files changed, 274 insertions(+), 19 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
