Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A60C46CA0
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lrIU7ViIKwCFq03Tu/t2o7hfh0aeFOfRsY9Bu768xq8=; b=k9xxWgTA4d5BPl
	kh3ZwW6zwQrwQN8kk3En65fN/NHCSNKvQ1H3nIXQ1XYABJQzJ6PknzCXgVXJyLdcArD78cbwl6t7V
	qmN1EHk1C9+Q+3Lmp/NLKU5PrdrPxB8bB22fdcNqxU15LddIlrw+A0TCcLbpHkuNcLlsIIGDlRfbD
	anbqo43M9567Ap5bdOYDraVC5Pqe/GmNdcssZmp5FklorDLap5L+ybsVgLYldnMMT0nVg/mm7LTL8
	+RAeLkOwxbNZzTAvUZiMGzV2AionNEQEVwBC029SHyzCJkg0Q+bviXFtIQ93g1Ie9oj+GrD0v2R5P
	UW3/UkTnWAxJi2m6kNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVp6-007XGt-0f;
	Tue, 05 Dec 2023 13:50:52 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVp3-007XFK-29
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 13:50:51 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6ce6dd83945so584576b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 05:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701784248; x=1702389048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5tYmQsqbSCasY24iJ5yb8DOXoFWsecoLxSrfb0V9jc4=;
        b=c20iU239SDOETmPDPQHtij+tm+KBsS+A2g9HjLqZXFvaOZSt0FyW6TrDdLaLclBEIo
         Ks2Fgg20NhuSdaLjZz9LxxJ9W/IFPYH+pYYYMYq9fYLUGRn55ZJzjrMh3jzHLtae2xX9
         tgjkGYvYAL3tFAIkF86ODFW5QgBSRhbOVG7esefHrIsVn0nfKVxLT+YDgkTTOBLCNIHg
         NPEYFQt/3wBky95mE2wU3rBAEPuYdcP+aeHFTaJYzeAYm6uZQPdfEwpjTSU86weoCHOB
         HJIbNrSpuXwEm0XTGbAyPLYL26OG2ApgGhCwTzp3dLhFJJqK0GnOhs4Ph/DCnCocLcYf
         FRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784248; x=1702389048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5tYmQsqbSCasY24iJ5yb8DOXoFWsecoLxSrfb0V9jc4=;
        b=IYo/ZljHEHYwJInep55UPWSSEbbc8OYWTu+LIKyt0s4b8Bz7yqSn7R01Dmy0+AjFFL
         k/ElxPmF5V43IkrihrlhMvO//LRtApfjEdc10nX6Iu49NqHyXlzW3KmHGVK4CqjoFDqM
         +ARBDRUlmE8kjgD07GEy43zoHLexFsE29pzZuWFyL6rjLTXkpLE/z++k6sq4IbHDcwNi
         cnQtgckswiIuKHdmLIPaM19Ryly5/FYfCHiUDK1m1caTfb+oR9b9baSxhdtcbzPLB47d
         aQR5dKnzj0fpL7u7heAmNjvWHaFKQ449iHOcfoQ+EY3gQHz/uHTGJUedVutjvs2ZxYBX
         AnTg==
X-Gm-Message-State: AOJu0Yxnj/iQ28U67Bg4izoI7b1Ktj7kgYNS95b+9yMUxyf2kBPc2hgt
	8dr0+1CW1QlqSbOrFG4QrArOUg==
X-Google-Smtp-Source: AGHT+IF58FDgCNhIFgf4+jcYpbFJRPEkybjdmIZdZej549U3kiTnM5En7t4y+alYXvh+9RPZN62oTQ==
X-Received: by 2002:aa7:99d2:0:b0:6ce:725f:7da9 with SMTP id v18-20020aa799d2000000b006ce725f7da9mr521727pfi.59.1701784248583;
        Tue, 05 Dec 2023 05:50:48 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78c16000000b006ce77ffcc75sm673641pfd.165.2023.12.05.05.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 05:50:48 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 0/3] RISC-V, KVM: add 'vlenb' and vector CSRs to get-reg-list
Date: Tue,  5 Dec 2023 10:50:38 -0300
Message-ID: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_055049_706340_A408E9CC 
X-CRM114-Status: UNSURE (   4.55  )
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

Hi,

This v2 has a build warning fix in patch 3 found by kernel test robot
<lkp@intel.com>.

Changes from v1:
- patch 3:
  - remove unused 'cntx' pointer
- v1 link: https://lore.kernel.org/kvm/20231204182905.2163676-1-dbarboza@ventanamicro.com/

Daniel Henrique Barboza (3):
  RISC-V: KVM: set 'vlenb' in kvm_riscv_vcpu_alloc_vector_context()
  RISC-V: KVM: add 'vlenb' Vector CSR
  RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST

 arch/riscv/kvm/vcpu_onereg.c | 35 +++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_vector.c | 16 ++++++++++++++++
 2 files changed, 51 insertions(+)

-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
