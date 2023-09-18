Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44DDCD37B0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EkfA70/gLa4exbWld7Vxj1ztipA/gFCkV/O6PlygCBY=; b=fZohoCMcn0hI+h
	709HU1hkkojGDcceZi5eV2jYPr/lgcUzWbZu0GyRPOa88TmCP/XQvne3HK2hkWUSYhZjzo9wk+a1C
	yqXEVJaFJhRVzGAF4OTtaFecF8daxnEcKOTKyENyxdbbkoF/QtR7Sc71Sz3vO89KPvdb8HHjt/lU+
	+9jfLUXw6B7oQFtKekhZDHXemSiKbftpBu587tF68snKyu7D0i/GvA/KxL2/7zsEBh8qWZY4AM7IW
	jb1s2OB53lRaoPC2CI/4LgH4ejAdpWyeSIOpg6hRZNPCyvNk86ENIs2VCc3m4yD31CD/lDYBBtilC
	qJ7uQ51TUnjOdNSELQYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeE-00G2S9-0Q;
	Mon, 18 Sep 2023 18:07:02 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiIeA-00G2Q6-35
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 18:07:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c4586b12feso12809065ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 11:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695060416; x=1695665216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FCpDJhkkPZXZzEKCkdvjugeVs9PL39Lrqr1o9f4MEek=;
        b=acF5Nnb3DLUGLtDnzlZEQz8iYC0BO+hGVry0UfL7cjjVRcRZQ25/7wMTf597fT4U6j
         rOm+ZQyMoLw6R5ZBJJwbZ5ihYQLIs94PC6x83GNx4/vnjiPeEoHRhOnbJIXJnDiZsC0T
         opc3ndDvwZQU/ffTknl+bIcgC4anoRwbfkA1otkpxh58tPextsZp296lT5aYa9fwJYMn
         0zcpIH+e68CjVWD1l5npLHv6W/3H9heRlFrGxTJAI6uwYo/3kFPo+d6mrPtxcJ0mUPsO
         mog12/sUv97eyWgWRRY+vwNPXsQ7/uB4Ia9NMqdbP4xVLMp02GCYIRNIu0UnzxyRNHdD
         GJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695060416; x=1695665216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCpDJhkkPZXZzEKCkdvjugeVs9PL39Lrqr1o9f4MEek=;
        b=aGQ9+XbYRGQf9x9aP+nlx1t+fKUdjcOM+l8KLG6I+FzzOgWb5spW8/rDe3FuJdD0nJ
         705/7ydZjAdTfU7dmRm7WSA9YWVn2XOZ8pMguHmmuRn6sucdjFnwynTmIwaHadcONI6v
         BSYzPPmMoSldQIQ3FyTY6AGO8rxoeiZBTl3b8oO+xOvWE4n1abU1bFyJNCJWxtBD6sZG
         v/jiEkKII2CBrWFVkJzH3E2e0f54PJyyF6NHIu4aYtytrPHmkUoS+kIkwDUXossUxLeQ
         Fv2hBfHsQudm8ghTTegWwtFrePJSJHuIt0r8U1JGpixCOxB4NehLO6Q44KxX5Ad9/Prl
         T8BA==
X-Gm-Message-State: AOJu0Yx9cOKihLl5De18KJmtNFuX27dtAD+tSH6o5q3XpJrNPpTrNBv7
	9bK7gdsbRDr7CFzi6JUjSLc9Lw==
X-Google-Smtp-Source: AGHT+IFZaa75xea6Y0dv1G3itQYg2C5MEWq+6lS/hOtngOACcYMLEDGNJM4QBXNYaWpu4NJMe3mq/Q==
X-Received: by 2002:a17:903:120e:b0:1c1:fe97:bf34 with SMTP id l14-20020a170903120e00b001c1fe97bf34mr10291276plh.24.1695060415995;
        Mon, 18 Sep 2023 11:06:55 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902704700b001aaf2e8b1eesm8556720plt.248.2023.09.18.11.06.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 11:06:55 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/4] KVM RISC-V fixes for ONE_REG interface
Date: Mon, 18 Sep 2023 23:36:42 +0530
Message-Id: <20230918180646.1398384-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_110658_997923_342DE0C8 
X-CRM114-Status: UNSURE (   6.05  )
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

This series includes few assorted fixes for KVM RISC-V ONE_REG interface
and KVM_GET_REG_LIST API.

These patches can also be found in riscv_kvm_onereg_fixes_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (4):
  RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT registers
  RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for missing
    extensions
  KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
  KVM: riscv: selftests: Selectively filter-out AIA registers

 arch/riscv/kvm/vcpu_onereg.c                  |  7 ++-
 .../selftests/kvm/riscv/get-reg-list.c        | 58 ++++++++++++++-----
 2 files changed, 47 insertions(+), 18 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
