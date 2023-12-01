Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2ECC07E97
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Dec 2023 07:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WsVh5/V0i1aifWXnGCRXEvMe6VmuUIWpHsiH8ZU1zTQ=; b=lu4LnW07j6+zpl
	0YBv9mt6D3idkS8WM4shchQdjVKj7D/ebowgu6doUGUDb9VKw9u0fuX3ZvPHWx2XEthWbJ37Q0SRz
	Q7HJXmvXyqZFvqQsYAEcp3+1WACUPtw6mbM7IsPBdxtLPFO9kNt8dlAWd0T4FAcr7a5CbmatbmFBo
	hd7MvyneUHzBTNQklgrmsaqEH95XNNdTPf4pYvKAaMSdIMp7Ua8MmlzTwxDjpq8g2qms3KLyzdhJ7
	zdDaWNfsTqjOLV1o66EEBPsA+Ee/oHo2PmsdJJgjJ9sGNlhE1LLswYMVKLDdsG1OfN/U67ZhuVe7d
	Nqga33nAbWDAhlrBcWnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xqN-00CsOK-0p;
	Fri, 01 Dec 2023 07:21:47 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8xqJ-00CsNC-13
	for linux-riscv@lists.infradead.org;
	Fri, 01 Dec 2023 07:21:45 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6ce2eaf7c2bso146518a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 23:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1701415301; x=1702020101; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tya0TWa3RItcX8nqIYUWWzzHkzOVOpUqH7JgJB50qPo=;
        b=oOgHKq+Z0Jo2pM3dLx1mSqHDscP8Y5pjRnC6FQbMNC8Rhha4t2Do5UtrLYZvtoX96V
         kjmqaob6z1NMN4TgjxSAUL190oxWaVr5eQ4CCGdOOWyflwAfdQAA8nyGKc5WzlBbU4Vu
         uqLN/k/X3wWH86OnWOOmWaMWKINmzyne8vRHx3B5NbBbwApK9wG1NBrH+jEuxMpA3VLK
         6B6WB5aLchju276k+c0W+R0yeSYSMBGSQHsgJ6A8OaYJyTbUTqfDrE6qoAQGM89DFZYI
         2U/ttL70RjhlKdsN6oXA0J3CMMjBBSPesYngplhNuIzK5fAkPSi3/PqHTNX6KLyoGnAY
         CAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701415301; x=1702020101;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tya0TWa3RItcX8nqIYUWWzzHkzOVOpUqH7JgJB50qPo=;
        b=wQpWOHUvwNJXyM8mrGGzvrWdNSzr8A+V8QHUl5OIIT8ukW5GcpsQkR027OBuBI/tm6
         1y91I8MUaH3qSI8T+OGAc0IQJbXtvvwvNf9l/+3xHbDondi/YyHCjshPXUNRcNCyMUnT
         Gjh/ZMyH3Lz5OYFGkthQHgm9x+E186vQuxOn5TXq6ECciUqnhgEDOuDtukF79IH044AP
         VQ+MgeEJ+uiZlxLDFyhuUfPyZ/+DojUpDedw4as1IggU1THAH53XooolDeqGEjbyEabl
         /MrnQK2nVHEZSvg80kqvoY+6Kciw8aBdCKbqSiIEW1PWxIjvw6bkP9CsnRRWXNZrIABC
         CBug==
X-Gm-Message-State: AOJu0YzL98BWvsIc9XQuHkn7s3n1BTSoTNm6Zc9zvseNHSM7Pm0if6s8
	8isI3x5HjMjrIYDWXJrsjmcU8g==
X-Google-Smtp-Source: AGHT+IHinSg3Zb9kf7EJbJUB60bwZkBnSz+AR6pXi1DiHaOh4toVAr901y3hOTXt6k2BGn9lyMq4wg==
X-Received: by 2002:a05:6830:2099:b0:6bb:1629:ab44 with SMTP id y25-20020a056830209900b006bb1629ab44mr2124999otq.7.1701415301509;
        Thu, 30 Nov 2023 23:21:41 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id v23-20020a0568301bd700b006d7f8da1b57sm412662ota.62.2023.11.30.23.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 23:21:41 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/2] riscv: Create and document
 PR_RISCV_SET_ICACHE_FLUSH_CTX prctl
Date: Thu, 30 Nov 2023 23:21:34 -0800
Message-Id: <20231130-fencei-v2-0-2cb623ab1b1f@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH6JaWUC/zXMQQrCMBCF4auUWRvJjGKrq95DuminEzsLE0kkK
 CV3NxZd/o/Ht0KSqJLg0qwQJWvS4GvQrgFeRn8To3NtIEsHRGyNE8+ixp3dyc5td3SjhXp+RHH
 62qDrUHvR9AzxvbkZv+uPIPoTGY01k7DtEHkipD5qDkk97zncYSilfACkqQconwAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701415300; l=1252;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=b2zSSjTaQJ7sjFJuqSSx5uHyDjW7oZfa+GC3felkcT4=;
 b=QuTLw6KTUXYWFveyBXw4+Jiy8hHpNSCmoo5bYnYjdnPJekg5cZnQ28amZhiK1f6m2FMyTRDKt
 iANhxEXAhkjDM80OIdzE4k9cK34yLk4RYHWS8/zrvh0/ZkK+pMYkZ1q
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_232143_681113_47A8ED15 
X-CRM114-Status: UNSURE (   8.29  )
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

Improve the performance of icache flushing by creating a new prctl flag
PR_RISCV_SET_ICACHE_FLUSH_CTX. The interface is left generic to allow
for future expansions such as with the proposed J extension [1].

Documentation is also provided to explain the use case.

[1] https://github.com/riscv/riscv-j-extension

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
Changes in v2:
- Fix kernel-doc comment (Conor)
- Link to v1: https://lore.kernel.org/r/20231122-fencei-v1-0-bec0811cb212@rivosinc.com

---
Charlie Jenkins (2):
      riscv: Include riscv_set_icache_flush_ctx prctl
      documentation: Document PR_RISCV_SET_ICACHE_FLUSH_CTX prctl

 Documentation/arch/riscv/cmodx.rst | 98 ++++++++++++++++++++++++++++++++++++++
 Documentation/arch/riscv/index.rst |  1 +
 arch/riscv/include/asm/mmu.h       |  2 +
 arch/riscv/include/asm/processor.h |  6 +++
 arch/riscv/mm/cacheflush.c         | 37 ++++++++++++++
 arch/riscv/mm/context.c            |  8 ++--
 include/uapi/linux/prctl.h         |  3 ++
 kernel/sys.c                       |  6 +++
 8 files changed, 158 insertions(+), 3 deletions(-)
---
base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
change-id: 20231117-fencei-f9f60d784fa0
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
