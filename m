Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2F3C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AulTcvJk73x9lJkaWew9DktDpU7A4uVJD8wjR5LqNr8=; b=J0ln3KcBFMfjai
	mjYSSo0Io/lrr9liTeSH28/i0RY8kr2/G0GUF5qbNJXcfGnuLaJSOAhUIooKKb0T0dxajyhWNuMNA
	HFT5MbkywXsfjbvhZQzlOTheC4tsb/7uROqejwtZMCrNHE6KLpjHhvxrL8FZNVQ52RaTIZT52t8tf
	h72F7ILe3LKU7voFTI2bwhqcEY2LIACuNwC+Z3cUB0+XByDIp/A8yRQ89cdurLl+CLdZj240+AE2f
	D6MNVw/8oWcmKBNUFogrb7PKEvyvanbXHDUD42nUl+zvGfmZo33QmdpqHC+/lNQX/xV+HrPGsGQLq
	UWJvZC9gslXgHhouhp/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96U-00000006BnU-0Whv;
	Wed, 14 Aug 2024 08:11:34 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se96Q-00000006BmO-3a9O
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 08:11:32 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7a103ac7be3so3932775a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 01:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723623089; x=1724227889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9csSOaQjk+D5knfqXhaywQ5Jf4PXMtmR5mb/k/VxzE=;
        b=XYfOD6OLRgzXo55ccAX9hKCqL9p3GEE6Vkq++QxVij+X/Khbqvley2nAP7zS93Q27M
         9izXHFeoJ03b7Lnaf0uYmLGESvdUZbAWtrBKmI3WIxEGxoj33AMv+xME1HMNTB3XCUHa
         3N4WYiBPfqQilUgY1/DTWrRCCPBotCkrZJ2lWmazVkpMmh9yiMBjtaqnvsu/l9HVyYjX
         f0l/YMpYUPj4N1Cs6uHA8Z891C7t4EsRCUDxbZ9r6ZVP3xQSNyOvs2fTHpfKVQHGxgnO
         bFenNPSOIPcGupKhl/9n0HCBi1Y/iBQoELxSUEL8LOBPKWiFy7VIF12QQADvRV3qJrfh
         UbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723623089; x=1724227889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9csSOaQjk+D5knfqXhaywQ5Jf4PXMtmR5mb/k/VxzE=;
        b=a8NsWLG/CmVvZpIj/M9wzgqaW6h/koReu0O0rZNPAMPyrbWx3y5Vxw0epFFXvvTTKB
         dbE8vFIOo2dmuW52iYlqduBukeKzUXTGYU1CpSzLTXoVkFgOhgQ1CDlpJh9ohvgwA00V
         ZlSzEH7EcchRyMl5ZXTKOKg8HD1ey/XYdO55xm2QpvD+eE3aEQyqg33TQjOyhO77Zdq8
         Zc33TBufFa7WBj4QGj9aq7WEJfUss4Hrp/zkE0eho8CasSwOUqui8+7qL2EMmh99T4hD
         8K3wiIiQS1qHpzYx6LwtCxPWawUH6c/4kz7zRFzlpDCK65eS+1vwe62tSAPuxJpx5uZc
         xnhg==
X-Gm-Message-State: AOJu0YzGWdGd3NmsNO56jDCDqVnIn9x1rYiWc5ijQXHyDKHCGPwLfG8v
	TY8IQOGXrV227Braz3u+CaIaHZT/efoP2a7wjpUKviNHxyqdpxBZF6fS924ZhWxCipSKAAHOrvC
	yT+LdT1u2tO52NLVcC+AcGgYbKgL20eErAQdUyRpt0vDh91C9yh7llPYjNpBXlZvU3Ij9oxVWly
	zqIR2RJMq5cBQhnchUj8I3PKxS9SGy3O7oXnem9I3+UvVmlPqyUI0Ne287
X-Google-Smtp-Source: AGHT+IH+z9GtXP0j3ifWM3c3Z3a2K9fF3Xmtqa9Q7oc8AId3QDYK1kLAdUBc/ST1j5TIFCX6+ap++Q==
X-Received: by 2002:a05:6a21:b8a:b0:1c0:e68a:9876 with SMTP id adf61e73a8af0-1c8eaf8eb81mr2488803637.50.1723623089406;
        Wed, 14 Aug 2024 01:11:29 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1a94d2sm24559955ad.127.2024.08.14.01.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 01:11:28 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v4 0/3] riscv: Per-thread envcfg CSR support
Date: Wed, 14 Aug 2024 01:10:53 -0700
Message-ID: <20240814081126.956287-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_011130_953651_4F4AAE6A 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Leonardo Bras <leobras@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Xiao Wang <xiao.w.wang@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Zhao Ke <ke.zhao@shingroup.cn>, Deepak Gupta <debug@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series (or equivalent) is a prerequisite for both user-mode pointer
masking and CFI support, as both of those are per-thread features and
are controlled by fields in the envcfg CSR. These patches are based on
v1 of the pointer masking series[1], with significant input from both
Deepak and Andrew.

[1]: https://lore.kernel.org/linux-riscv/20240319215915.832127-6-samuel.holland@sifive.com/

Changes in v4:
 - Rebase on riscv/for-next (v6.11-rc)
 - Add Conor's Reviewed-by tags from v2 (missed in v3)

Changes in v3:
 - Rebase on riscv/for-next
 - Drop use of __initdata due to conflicts with cpufeature.c refactoring

Changes in v2:
 - Rebase on riscv/for-next

Samuel Holland (3):
  riscv: Enable cbo.zero only when all harts support Zicboz
  riscv: Add support for per-thread envcfg CSR values
  riscv: Call riscv_user_isa_enable() only on the boot hart

 arch/riscv/include/asm/cpufeature.h |  2 +-
 arch/riscv/include/asm/processor.h  |  1 +
 arch/riscv/include/asm/switch_to.h  |  8 ++++++++
 arch/riscv/kernel/cpufeature.c      | 11 ++++++++---
 arch/riscv/kernel/smpboot.c         |  2 --
 arch/riscv/kernel/suspend.c         |  4 ++--
 6 files changed, 20 insertions(+), 8 deletions(-)

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
