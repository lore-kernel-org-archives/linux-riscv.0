Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEB4EC3DA4E
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Aug 2023 16:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jLWWDTtIwsXB38QQirLfT04ibOp1viz59tq3D6UnGL4=; b=b8d9tUEADT09xE
	nrqC+QdJQyHOX7je3Q73kpacqw/9Fo2y5wRQZb30LeZWj7zw+1YcElfADgaPc6LWQ18ejSBREiQei
	Saze8kRtcl96EX0PxoguBidJlS/2mT5uAVJeSQqnnYXePBTLrkFYCJoM9HEcJodEEdJE4hYul0j92
	sAaOzVyHhLRoFXAiaR9aGNY9jIq3fJHkr7ajr/0psi62TYFjrKGKKu8QBwr72KibgVSWibHsffR4t
	wuDahUq4R0A3EgieIPSZjigNjMIe3quB3q0YBNff69Fy/Fj6YSk7HYuDVqKBhgoMfCYUy6qJCjVtt
	DIgPkwP3jKvhNBsm4tSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWfmr-006mT6-2E;
	Thu, 17 Aug 2023 16:23:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWfmo-006mRO-0e
	for linux-riscv@lists.infradead.org;
	Thu, 17 Aug 2023 16:23:52 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-319e93a1594so44895f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Aug 2023 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1692289425; x=1692894225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t1uFE6MzzPLkay3o0QV6wciOaHdcz4fsjCBptTlQWj4=;
        b=dMplc1FWanZhn49rcH22eyNBES+JWmWQm7NkZ5P6ZEduaTa1MgC+AhuX/LVK5hKtE7
         STPa+mNLfiNOUbB8dPFfWnTMylMIk0Erk7B+Lc90Hig7Qz7Argz8QEb3lU+ADzI4nMTu
         7kzhLbD8h31PXHHD65iNFMA2WAIO9RFkgX60uKXCXNyLw72UPIqUopAeeIody5/3unzs
         QGOanqG/wFk+eyKtcReEoPRqEHUN7TTAozve2BhlGP6rdrynJzK34U+pyNgCI0ERpw3u
         fGcFV0fZwMDj0XRJeQa7jXPupHNK/eMJsuRA/epzGOJLh/BVYL9AdAPIJn4acXRNAPsT
         kS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692289425; x=1692894225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t1uFE6MzzPLkay3o0QV6wciOaHdcz4fsjCBptTlQWj4=;
        b=h/RtN+NT3C0r4WIV7CEH3hcTnDIXsAvExZq5dDo9uxtHhOjIokLyLsgBGBjoTenEQw
         wwvh3TuTmrFwJr2R2snNGzzXiSWCrHdLaxg7c4gAsj1CtEeLlRCT7q3vS9RpQffdSGE1
         uoxUHsjOT2ZFM4zxnYZYDGURKcsStG1F8lF9XSXVjRzlYV7TU5fenIVIU2Oxg9BsHzSQ
         lVcsDHbDePdT8vm4I38uTjBF7DBweUnDS1MR0D7JcjGPovY6XaiijzeKVnWg/mGsoU7+
         DoC5X8qoU+rXRNVKOPN62dcKJbK2fz2SzvVxY7Rb385CjcnBmZyHA5sdJE7yBcZAW+mM
         2s9w==
X-Gm-Message-State: AOJu0YyG5N5FsCQwwCwx/t/8BO/995LH7OtPhFioyZj2oXnUQFwe607W
	4dL6IrP1I8C+sZn9oL+EG7xA0vcHNocpzFZFr1LX0g==
X-Google-Smtp-Source: AGHT+IGVagtm1RmTYvUiODNBMDdaGXL7vSVANISem2mHB1AeN9B9Atpeq+XTww47OdaQK8ROLJ5Sjw==
X-Received: by 2002:a5d:5692:0:b0:317:58e4:e941 with SMTP id f18-20020a5d5692000000b0031758e4e941mr4030178wrv.33.1692289425173;
        Thu, 17 Aug 2023 09:23:45 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id d15-20020adfe84f000000b0031ad5fb5a0fsm2982918wrn.58.2023.08.17.09.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 09:23:44 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	haibo1.xu@intel.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Subject: [PATCH 0/2] RISC-V: KVM: A couple kselftests improvements
Date: Thu, 17 Aug 2023 18:23:44 +0200
Message-ID: <20230817162344.17076-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_092350_235192_7CE72EC3 
X-CRM114-Status: UNSURE (   4.70  )
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

Add the riscv kselftests test dir to MAINTAINERS and improve the
maintainability of the arrays in the get-reg-list test.

These tests are based on kvm-riscv/riscv_kvm_queue.

Andrew Jones (2):
  MAINTAINERS: RISC-V: KVM: Add another kselftests path
  KVM: selftests: Add array order helpers to riscv get-reg-list

 MAINTAINERS                                   |  1 +
 .../selftests/kvm/riscv/get-reg-list.c        | 76 ++++++++++---------
 2 files changed, 42 insertions(+), 35 deletions(-)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
