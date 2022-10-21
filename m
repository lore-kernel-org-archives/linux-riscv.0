Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1477C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Oct 2022 10:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FCMn3riQUiEUWLaXTREi3pTNSWwJyCqeKmt2UreIj7U=; b=dK4fMbcAczFbFO
	h8Pp0SbuoTvu5cMlQeXcXaC/VldWfHAsUOBk3f5Gy06q7q4M2Td2UsCLV0NtnSFYLnhdIBCm1phgT
	EqXBvpDIPmY25BpMt/P2ghmquhdTiNn1H/kHHxMdlYmlS2y5QD98bcZQvJYbjmwz1R1efmAqqD7JE
	Y4F32InKWj1n5dme8PVBeX0X+VJFfTybwUL5PXa0QyAOd5GxQQcYHz/Jvfq+cHZQ/5Ds6FqvdHwlX
	MYu+TDvunSiZb5rbdeQtRHOnx2TwRP+D8fsdqDPl6jhpjsB1SRyL9mCbbIQRIE6wB28c6IH0AblrJ
	2LMN/3GQ3NXmB7vqBT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpkB-007FgN-24; Fri, 21 Oct 2022 10:59:15 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olpk7-007FdT-Ie
	for linux-riscv@lists.infradead.org; Fri, 21 Oct 2022 10:59:12 +0000
Received: by mail-ed1-x531.google.com with SMTP id t16so4386252edd.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Oct 2022 03:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwDaTFySsjWJJd/eGh9ubocA2Oni/Giy9OhMlWJw3No=;
        b=ec+7XAJ4ICngLTZgOAUBv7mrUolJLFJTXVHOhAfvFqF0g7Xd2ok0NEcOcXXOTGZSof
         PVhs91f40p/LiAugy0x4EWD7Wu5vZNMYu7RtmO6Q7xjX6E71zWBJSgUzN89VMK2+qTpZ
         p28WILB8P35XtsKK2Vi1pNWtKQ4/uPpCsUc0GS8KoLkvc/POhSfN4e5cZ3q7sKE5cfvt
         obyB2ZgHQ/p9JIxnNU5vytft8QDO4miyNyl6nhibXxN/paMIaajvY2PbW5u42zfrDcZw
         v9A9WZHrM471RGhh+xgumPYL2qAb1DYuI8KdQHnzW+Pqsj6aHOeEGHuN17gKoEx30niB
         wRfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwDaTFySsjWJJd/eGh9ubocA2Oni/Giy9OhMlWJw3No=;
        b=blwMUBIjFnTKeIPdoCanzfWVkGh3JgY3UlOxIxloIx/X1vS2s5PMvBTqZFDJRak80D
         kJPkNWJt+ee45UP2zVbTrt21reMTj4QGCjljAyUIyLalaw8QY3jSI5VEGsuF6QVddW7e
         VU8EVmpNRXhN9Iqn2ZwpDZcOCD74DdZ/HNeE2r3/ycs01QaQz/LEm1NxGfMiSO8Ryh7Q
         dLFIBDxiOu8Acz/2l2vmInPYGIR8md31+nHBp9oJWRVQa8C/yeYPXoVcdevkFyJrsmwn
         96CHC5rt8TUA+Qsfr6KoPoib9w5/LlsmNNxVyGrrq+EEAb8eBn9XBoqALHNGXDxaN2yl
         +bYw==
X-Gm-Message-State: ACrzQf2vOejHW0s+xEYR0nnnkWTKxPOQP9sGtun6rQkDLn+uj5aZJVq7
	F7ipe+dsujFEg8o1Ded0s/chuVnrryKYpw==
X-Google-Smtp-Source: AMsMyM7eTaRB2wjtmqJpQeQsnrkNlOzERxvxwPHPfyOIqDps2K4sy58D9Cxe6Ar1PdwQo7gumVkSfA==
X-Received: by 2002:a17:907:72cb:b0:793:30b3:7f89 with SMTP id du11-20020a17090772cb00b0079330b37f89mr9694205ejc.259.1666349946935;
        Fri, 21 Oct 2022 03:59:06 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id f20-20020a17090631d400b0073de0506745sm11412685ejf.197.2022.10.21.03.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 03:59:06 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/3] RISC-V: Ensure Zicbom has a valid block size
Date: Fri, 21 Oct 2022 12:59:02 +0200
Message-Id: <20221021105905.206385-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_035911_633965_85536BAE 
X-CRM114-Status: GOOD (  10.30  )
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

When a DT puts zicbom in the isa string, but does not provide a block
size, ALT_CMO_OP() will attempt to do cache operations on address
zero since the start address will be ANDed with zero. We can't simply
BUG() in riscv_init_cbom_blocksize() when we fail to find a block
size because the failure will happen before logging works, leaving
users to scratch their heads as to why the boot hung. Instead, ensure
Zicbom is disabled and output an error which will hopefully alert
people that the DT needs to be fixed. While at it, add a check that
the block size is a power-of-2 too.

The first patch of the series is a cleanup of code that crossed the
path of this work. The second patch prepares for isa ext. checking
and the third finally does what this cover letter says.

Thanks,
drew

Andrew Jones (3):
  RISC-V: Improve use of isa2hwcap[]
  RISC-V: Introduce riscv_isa_extension_check
  RISC-V: Ensure Zicbom has a valid block size

 arch/riscv/kernel/cpufeature.c | 45 ++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 10 deletions(-)

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
