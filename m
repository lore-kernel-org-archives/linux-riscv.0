Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BADEAC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 07:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7TlE6/M+9TMaLO6b9GU8N0HWQXHSyZZURW76B3QShgg=; b=DJ/hIQIo5iqrgP
	nK0CiAY5umNX6/m6UpenZnOMejVdoI8Yif5Nxabcp6po8TgJPh2vmJ2/Dy4UHT54AUNLnzhiqV3V0
	idDoBtubGMWPkVsXhk2OxgWXUZPRe12xmYB1zyUOeKUubz+SJ1xA2+JRhwp4Vf2d/YfSQBemGFJkB
	+WA85Q0q3kQqpbZg6dRwfbUMWuzVe+x+72gYNZat+gCOu9u94QQt4xxtWL6CbbDk/cnkqQBCORd6e
	f1I2NwV/ch0prePBCagZCW5fmYTrkTQzotmYowgK6x7OAoEOlAhyQ9TZgswslyyRkTii6UoOgK/k5
	4Ec9AuyG/4A1FFb9cEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6II-00BK5S-3S; Tue, 29 Mar 2022 07:29:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6ID-00BK2n-Qd
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 07:29:31 +0000
Received: by mail-pf1-x42c.google.com with SMTP id p8so15137316pfh.8
 for <linux-riscv@lists.infradead.org>; Tue, 29 Mar 2022 00:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UTbD7jGgh/KLDDWua+lhKitl7ix/55ibmUsyIxaned4=;
 b=UEarIBkXggU6f1IDuuLRahcOyLDmhoTwhhFad0YQS6tczcmbGtfopV40XNg0dlMLV9
 5kE3fh2S0koV0yDrG3x5lFHmuc5mobUwE5bD2DMFbDfCAzYfhhYeRsrprilqKrN3zrHq
 1w7Pfts/TuEemwSOWKOH4G1E5Qby4wB1xCfe+Pfj/zWTaGpvk0T1OYPiQRsTGDfyx9id
 Q/x2xfJ8PJUeYs5uvJC7i9NQ4aBP42ucW5mOFhOvtXsT4966C9S3M2Q1WYSslEJ7Akdr
 pUEtEkn6i7WTWvf1jywickNrM6pC0HcBP+7Skped0Jwd/GAdpSxARqtAAqyPy2EpqVBv
 ediQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UTbD7jGgh/KLDDWua+lhKitl7ix/55ibmUsyIxaned4=;
 b=gcbp+hWSlqGZItF/cD5gI4sozjpch9icQZPpbSkISttRQ++rqepKjs0/i1emLZNB2a
 eC9KJfWCrlySPra8ehVv4ZPgznm6xt+daEH8W6CtSbORm2NE9seVH1zT/NDa07+n5DA8
 iDzB33p9+ULMQ5JfFW9VN62eWf6J3Di7trBX5pJAp6KA8/CtVj27GiKwpP4hzB5i5WHy
 9SRGToQyW6AG3OdfMD+CyGIexMvUcBCJYt9Y0quNDwOdgXOOVz03RFIYLFj9g9aPQ5qO
 HnTFouylgXdhVf3Tmy1CRUjfbjym1Cq7AouxK+PL21cZgQ7a6MkNL+V0ErJDNnlHml27
 ZmEg==
X-Gm-Message-State: AOAM533bUzOaqm0DOW/HLUOmlbuu0DGGiP/vLgwFMkKvopYY5H3Uf6sC
 lCOHTU72tFdTpdDq3QdUi1KYnQ==
X-Google-Smtp-Source: ABdhPJwIkpl4g0Z0faxh1E9Z+gpMHgVpjDzUMRtKVIvn6DAguqbIiaRi5u4NO2ReAR8iEzODdyEFMA==
X-Received: by 2002:a63:211b:0:b0:382:6f4e:3408 with SMTP id
 h27-20020a63211b000000b003826f4e3408mr1061874pgh.515.1648538967322; 
 Tue, 29 Mar 2022 00:29:27 -0700 (PDT)
Received: from localhost.localdomain ([122.171.166.231])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm19440564pfh.177.2022.03.29.00.29.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:29:26 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/3] Unexpected guest trap handling for KVM RISC-V selftests
Date: Tue, 29 Mar 2022 12:59:08 +0530
Message-Id: <20220329072911.1692766-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_002929_902703_C0A258CE 
X-CRM114-Status: UNSURE (   6.47  )
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

Getting unexpected guest traps while running KVM RISC-V selftests should
cause the test to fail appropriately with VCPU register dump. This series
improves handling of unexpected traps along these lines.

These patches can also be found in riscv_kvm_selftests_unexp_trap_v1 branch
at: https://github.com/avpatel/linux.git

Anup Patel (3):
  KVM: selftests: riscv: Set PTE A and D bits in VS-stage page table
  KVM: selftests: riscv: Fix alignment of the guest_hang() function
  KVM: selftests: riscv: Improve unexpected guest trap handling

 .../selftests/kvm/include/riscv/processor.h   | 12 ++++---
 .../selftests/kvm/lib/riscv/processor.c       |  9 +++---
 tools/testing/selftests/kvm/lib/riscv/ucall.c | 31 +++++++++++++------
 3 files changed, 34 insertions(+), 18 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
