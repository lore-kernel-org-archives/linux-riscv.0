Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67585C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 13 May 2022 01:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JlIobywkvuMFSisTBWJSR2jT60Ea2lAHYOHm+aiuTAQ=; b=sicXIFKqTl+fxE
	JEWi8JWUbmhb+US/3e/qI06Wtby+mg5r28lP4p3oMzW9/YeqRo2mGBABU8pMr0xgRZ0YWRtlSdgwE
	JW2sBiF/eUIO2n9h1KSEVq4TmQi/fJm7Vo7HYpgKrcz+zYXOYA1XwwxZFW39Y2BnxnJ77q3lSUqTa
	UuSMePGf3hPEncd8KVIxW3RWNhmwQ56+X0iClPHgeIP4wFC/XPfmIOrYb+40R1VIVtYJn2uR7aVIu
	kkgdQCjD2eTSnYXQv5UiGzG2tVGvwnk3ulZYsSFdE5iRyWM0wvd/Si97nhJNg9AywlJz5vQSx2owp
	Nde0WHyD5U94cxd6Nnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npKWr-00E8K6-UF; Fri, 13 May 2022 01:55:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npKWo-00E8Ip-5K
 for linux-riscv@lists.infradead.org; Fri, 13 May 2022 01:55:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id s14so6591503plk.8
 for <linux-riscv@lists.infradead.org>; Thu, 12 May 2022 18:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPEvVQawtMrkm11guWIbHQuWN48oLPqKEa934UeXixI=;
 b=OUdFnQoy1yYd1NoSRCJk2pyQ6hi1nmqBf7Ib+88jkANZemvtdqmJwGA/SfrQroAfw4
 9UxP4luZJqDZ5cmvLZ2j56eghRdQUhkGW+E6Hpc+Tcc9+SHXBsSc9OrxSCSCzxIWdwM+
 dZOSu3amuVusm6hkP7SjBsfzYDw8AsdnzNRLer8SRtr+sXzkY81yNaQ7bO1RuKszSglb
 brpkXnm9alAjf5imgTqE9yy5kCNzfm3l8jIIO1rOTOOk4ap+bR/W03q1zOD1flfIFCgk
 AJJCowYIRUcM6HxtrRc9W1cz8o5sWDTeWm+NQ+F8TNQnlqkXSK0qhAgRp/oL9xHsymT4
 ltSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wPEvVQawtMrkm11guWIbHQuWN48oLPqKEa934UeXixI=;
 b=jNcKQ7EguWwbkO9pfbdz9pYo+udWIhF1KPMx4xoxNhPFVUw4ar0P7WYJKjHz7qzs87
 bCCIO7wHRZNPKBka317Ry2o/l/8xzXtk7rhLDJ4ZKdEIF5wp+MqGJVX6CfF757MoXcDH
 xD4hgeXY579YWcaqLKF3B/kDKgaZWpLhkWLlq+zl9uTtsuNCSABZEsjoet6qoLEoF/1D
 gTg1cPcJjy+K45hXNqe1mAba+W0o1V03KLcZd++KTLweM5QrJM2hm/H5P7ZHm1r/+4nc
 tuzNMRCYmSxScHZPbkctkVNqTsfULDSsCbu7vPBeS2TaHdJF+BqC4iQoEBVfWqYX3WCv
 CAxw==
X-Gm-Message-State: AOAM530R+kRgZe+tnZv9qxMgEvsjssof3uLrthuD91TNAK9AkFaRs3BC
 ZsjSrEEsybT8Ia7FNttN/xBmyA==
X-Google-Smtp-Source: ABdhPJyuYRag3XQsrMFQtADDv6YxIQZ8NbRFxwO+o2rfR179JSQMBL5GFszFiYmfWeVchkHESt/8Fg==
X-Received: by 2002:a17:903:286:b0:15e:b2f3:56e5 with SMTP id
 j6-20020a170903028600b0015eb2f356e5mr2574149plr.79.1652406935448; 
 Thu, 12 May 2022 18:55:35 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a6561a1000000b003c14af5063fsm365883pgv.87.2022.05.12.18.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 18:55:34 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2  0/3] Miscellaneous fixes for PMU driver
Date: Thu, 12 May 2022 18:55:19 -0700
Message-Id: <20220513015522.910856-1-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_185538_434609_EE79D1A5 
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

This series fixes issues PMU driver code.
PATCH 1 & 3 are fixes for rv32 while PATCH 2 fixes a redundant
user page update issue during counter start.

Changes from v1->v2:
1. Add proper compile time rv32 checks.

Atish Patra (3):
RISC-V: Fix counter restart during overflow for RV32
RISC-V: Update user page mapping only once during start
RISC-V: Fix SBI PMU calls for RV32

drivers/perf/riscv_pmu.c     |  1 -
drivers/perf/riscv_pmu_sbi.c | 16 ++++++++++++++++
2 files changed, 16 insertions(+), 1 deletion(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
