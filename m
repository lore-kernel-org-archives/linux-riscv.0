Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369EDEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 07:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lstVKsUga4a/cIw0+Rt7+cPbTsaXQFV/s3Rp2YCuOy0=; b=0bi0KCB9ooBIHy
	QIrJusqmCQ6UFM++EdVRm4iXZhsWVOcIbJt7BM52JCifwJl9exADzWiEh3zYpSF3eOni8PbOkoin/
	yuLVKBKyNBD9njK+fgDK7uWtU29pv4tU3b06uX8hdUJVrVdWG/Gz1Inbqjk9sAtmMRaBMtMzhd7/8
	EBayklLRi3x8Cq0TA5tBFiXAlE1bqLpSF/ac9GaJSDbEWdtHfd2psTEXZZxxkFRX/X+njHNYEAicp
	HTSJlXDKWPBKvt/HZ5v8Rnca7fHCP7HsjOGbZXFBqYJqpVxXr6udwc2oOPdyYArlUXatTMH7T/ZX/
	MKS2t4Rmrv0zqFa3yFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyS-00DG3P-2U;
	Fri, 21 Jul 2023 07:54:52 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMkyQ-00DG1h-0v
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 07:54:51 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7679d444210so157183585a.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 00:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689926088; x=1690530888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bLt3BdgKa6ybHVbVhOUawWB6H+WYWroxrVqmBhqs/eA=;
        b=a8iWfQPG/9ZpPsHTqEXwwCUaImDf5XsjuQWlba1PQ4JBQHHHJytbZntuO25h7GbzKj
         ZzSHII66Kuy2T1nLWQyncOQE84Z+8aADA1/7n9iP/h+9l0luGboHXiiFgeoxJeFTF7Wz
         FfldRY0RHoKhhc3CkA8X8UzPynOkbRAr3OxvL21sy2ZgZCacTlzsvBYOD1rrS3tMpUg6
         khvbnZNrEIcIuB0LKX4+yAevUNKYqPOMIaiz0QPmI1aRT9brj9fEZRROBhqPuVTPymUf
         RS7U88I74YgmqH0pTpC3YTwOSAA8O3QoKTckzoVk8UK4IwTgr8Otk/No7+xUhx3qzaer
         cV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926088; x=1690530888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLt3BdgKa6ybHVbVhOUawWB6H+WYWroxrVqmBhqs/eA=;
        b=e/T5SFjtgMg6fRBaVMo+9Ne+N6n9pB5/XUnuI2aXhfxXe+0t8OolzXdI7jiI1K+qG8
         aXGCW4OAFuqFAUzwJbI+Xl+kRrIP+dbsyZtidlIGmZkinLSnDiILCwBABT2BXCUTqD8f
         8rGW3zY7V2DFt1jExlSu3A7Kbr8F5uw2ICprRgsQ/XgiaeWmmVPlGKih1zFTCorFtTy/
         MYjUMyofRTHSXiMJ3CZanunON9x0Tal0LID4GxqJJF3M66f6ux/TWodQY88vzXmSEry5
         kPP58+yA004eJYwcmyezJo8HGmAkFlPU4eHONr6QUjojYnk4ataiyQloskJw6iLIUMJU
         JvdQ==
X-Gm-Message-State: ABy/qLZl69e5KL2KbqUgrO/ljuyXltIIMOcFDp7YpyRh0EBn93E4xmoz
	zgc+XuCUOGlVig79fxD/AhhUVA==
X-Google-Smtp-Source: APBJJlF/uXScAs35zWnia9dg8eksp4GwjAU64RPTrhnF1Jyb9HG+mRRfIM+C0QD/zfBy+9z4ok5kzQ==
X-Received: by 2002:a37:9341:0:b0:767:82e8:eb88 with SMTP id v62-20020a379341000000b0076782e8eb88mr902428qkd.7.1689926087153;
        Fri, 21 Jul 2023 00:54:47 -0700 (PDT)
Received: from mchitale-vm.. ([117.99.250.48])
        by smtp.googlemail.com with ESMTPSA id gw15-20020a17090b0a4f00b00267bb769652sm2026354pjb.6.2023.07.21.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 00:54:46 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v2 0/6] Risc-V Kvm Smstateen
Date: Fri, 21 Jul 2023 13:24:33 +0530
Message-Id: <20230721075439.454473-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_005450_324308_D9753678 
X-CRM114-Status: UNSURE (   7.67  )
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

This series adds support to detect the Smstateen extension for both, the
host and the guest vcpu. It also adds senvcfg and sstateen0 to the ONE_REG
interface and the vcpu context save/restore.

Changes in v2:
- Add smstaeen description in riscv/extensions.yaml
- Avoid line wrap at 80 chars

Mayuresh Chitale (6):
  RISC-V: Detect Smstateen extension
  RISC-V: KVM: Add kvm_vcpu_config
  RISC-V: KVM: Enable Smstateen accesses
  RISCV: KVM: Add senvcfg context save/restore
  RISCV: KVM: Add sstateen0 context save/restore
  RISCV: KVM: Add sstateen0 to ONE_REG

 .../devicetree/bindings/riscv/extensions.yaml |  6 ++
 arch/riscv/include/asm/csr.h                  | 18 ++++
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/kvm_host.h             | 18 ++++
 arch/riscv/include/uapi/asm/kvm.h             | 11 +++
 arch/riscv/kernel/cpu.c                       |  1 +
 arch/riscv/kernel/cpufeature.c                |  1 +
 arch/riscv/kvm/vcpu.c                         | 97 ++++++++++++++++---
 8 files changed, 140 insertions(+), 13 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
