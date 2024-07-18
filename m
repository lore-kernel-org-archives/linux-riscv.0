Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F58C41513
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 00:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tkFmeEHPemjEf6aO4O/d2tQ05aE7JJwyrSi3E/mOb2E=; b=y3UqQonqK8+JS6
	ybQ9+KOvvXgyHp9fctFeZLDb414+PManjUZl14F/xsth9QCkh+TU/hUj3+Cp1ko0na9mdA4sfKfPv
	ziVSLp+US/vbn5RGzVm5j18cVrY1ucaIvtRVIzwGU5mJ8ZJMLWnD2ZgEpXkSsoPn8/wBRG7GD0zrW
	7rAg844goabXRC1MMC0qAc2nsfWmNJhDk4qwLgWhy4qUKhput8QYgGgnQGnuENsPQBzQe5wDzbU/z
	I2q5n12UrUGhwQQLmJYeLUUe6X3FegTW6T2zcHswqSzsOwRGj4SGj72JsiEZwNJn8PNjShqHXjBXT
	kIEwVT1oRl0CyvGrhWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJg-0000000FIEm-0YUE;
	Thu, 18 Jul 2024 00:48:16 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFJd-0000000FIE7-26hV
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 00:48:15 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3d93147ac6bso181766b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 17:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721263692; x=1721868492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yO8u7feQtTPE3PCvQPR4qbXkbE2vIT4Wuff8+z2M0YI=;
        b=ggm3B8uTxfi95rvwv76I+hCfFMRO/VBvpUs/aVZqpTRHAzS1S7a7woS9ATVxt/9BMA
         WKxSnKP3Ef28lD/Ok/29I3zG/tN1SbXpkps5wSh99BZEZ+pPOwVUpTUrn+EntdqUVnSo
         Gs4/cO7zwdY70+YlzMI1b0Xwv+DvMxRhX+EDJzea+YJWqS1ddHheYtbvRKnOJ/9+Lywc
         +N/0Pl6BNgUY0U+dwlQUpqzuoUZOjdJecGZ5Gua00HuZbfZ1PgSRHN5W7QXSTwiM1Ex6
         k/it82FnxEpG1fHx3eLrmwn17M/uYgJ2VMLIPplCdtau0gnf5rW4j3tGkZ7XMg+dmoV2
         k/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721263692; x=1721868492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yO8u7feQtTPE3PCvQPR4qbXkbE2vIT4Wuff8+z2M0YI=;
        b=RFSEJn0LerwEvNHbYy39whNlu/5ZPxnhQtVzmKRxP6dHw+bZELp4PQNGU/cCHUp1Wn
         q8LnBjxXP2ZB8uBgnGnNNaO242kfYIS2HdJ5uTLbL6SxYPtQW9gBiYiEp7+usMnUMGJp
         qhY6HtSKdnRkPJU7mnnUGHg1AKitjtqgpt59WUGNdXzAwzd6MuSu6vIk06gSQ7skzg3D
         Z2u851+iC1/nHUEPse/rF6hdbGNXFR2l4J0k8oghf8rD8f6BRSWkRFhYWG43j1wAxYuv
         NN8E5MhM4WWv3blcJB7miD05vAr8lGsW4XatqVERxgzZk65UT5ZU0v3IPB8lzFpqe2Da
         xfYA==
X-Gm-Message-State: AOJu0YzjPDQeI6kWUqrtcmDoiAWw3+rnLq7zb1zA/LP2Ou9IBpjbz0MZ
	+QsvuzgY3thmxcLQiceLSJ8eXUnXatgc2t8dZdUlEQLa1mfAFi7JFyJs1gUXBUCBrV4+GoTZIeG
	y/VGnpd7fuPs76f1VhSyV02iH1MDB4MAW1pUdGPVW7irO/6DdRqlAduNNExpYhjBvg3b7ZkMlSj
	xV6a7GbR4BsJegeyUP6dVgl3QR86R3RvIX93JUzpyso+/u85r00FjQxF8C
X-Google-Smtp-Source: AGHT+IG8Db+vpjTLP5x2kBGQGwCa7A9kOBQT1MH6jTIi/txDh7CI6c9ITvdZY9lwnA4eek8sZRMj8w==
X-Received: by 2002:a05:6808:152c:b0:3d9:33d0:cc4b with SMTP id 5614622812f47-3dad1e3eca4mr3653854b6e.0.1721263691639;
        Wed, 17 Jul 2024 17:48:11 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e386d53e4sm5694300a12.70.2024.07.17.17.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 17:48:11 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v3 0/3] riscv: Per-thread envcfg CSR support
Date: Wed, 17 Jul 2024 17:47:53 -0700
Message-ID: <20240718004808.2246354-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_174813_574324_44C6950B 
X-CRM114-Status: GOOD (  10.49  )
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
Cc: Leonardo Bras <leobras@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Xiao Wang <xiao.w.wang@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Guo Ren <guoren@kernel.org>, Andy Chiu <andy.chiu@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
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
