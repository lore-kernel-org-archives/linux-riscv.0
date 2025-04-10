Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6940CC3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 07:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V3QiXZK3dg2lDdqhkSVI8CvusS0vB5fAvtJr3UatccQ=; b=nEUJWXtKUF+Vcg
	9HOLuGMoIpZ3tclCj0bvJfW/7YQogFxtM8VeZV10fQ0w9cs/FLKF6ZVcpOuJWrWXUbstBhA/CnAVr
	TE0/CR1pCjWl4GDTAkpxnSHsIDM4XVALIMmPjPAZ8vE08dpQF+bluVwfAb+pkMC6DIKDaS2dgYNxL
	wQI/WwFVL7D32kc9YTgwrnopt2un9G41bEsa1AL2RESEdzPzQ4/xHQOf3g/ZkC6BZaDES2nVD4w2R
	SRNlRoqDfUFT8R55KRdE5lZGuXyXweDMjTh98U/hyPcYhtDfVNNDjUYm50tSlSMPeRWouj2SfIBog
	OS5LPpMADOVOuDUYqW/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mUQ-00000009akl-3DZZ;
	Thu, 10 Apr 2025 07:38:22 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lyb-00000009T9x-33rQ
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 07:05:31 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-72c019869eeso158368a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 00:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1744268728; x=1744873528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r4B+r76KGyj9PQoVMZG+CNBPOS4MHHbIZygRDgwNdE0=;
        b=DOXC6r5VPZij88nLu5rYXZr8uxmOSNMGM8/MdmT/VCP7l82Qm4W6EVS0R+dLte8M/e
         XdiAcz4+A7x2R8K2gzi455ivaneQGqcZNr8qJNj+MWh8yAvE3xQ/h//IYl2dbd4cqth/
         V0YvKJEW3ArwN2S16tSwABJP73rFO6FuonfHEvx+fi0nbgrNLu3QAwH/56sT506bhnuH
         0INZ2+1OmSDHl2nQ5WWuGSL4mGOKurZ7KDktx8UGmfuk1Vaf0ncXINi5SNJhH+N89Ike
         DPLizN6ElZnOXb6aXJ0a9Il2IqvVae3QcLUPHWMBAwPyMH0l+yEPPMQEO0KjA1i/vUp/
         a1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268728; x=1744873528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4B+r76KGyj9PQoVMZG+CNBPOS4MHHbIZygRDgwNdE0=;
        b=h7n64XKDTG5PnLrDwZRzBYKtzF44PEvXiBTYGBVcYAJaDRCFd0m6AOdXkDYyuWimry
         nAhcvkPj9ZfN9+7g6aUKNJDOW0jp5LdltAo/JN88YjQi+3kMtubh9p/d5eUy8qEwlI+l
         ZqU0ZwkQVObtmhzoModWuxkmPZAkQGc/3nl4m7fpAiHw2qr5I4hcfWR4OEPK0b0SPnA0
         BqhZGpv3QIx3FIZ5or9L6f+8YoQ6KOLpqslaiOhRcbFoqUu5HGmq3H6YZ67JpR044ZkK
         XDw4ApGMEUnAVFkP/Etus01h65EEoBIQEkVzspl7iC/qYM/N158BrTERxgTj5XeMaWAX
         xbJQ==
X-Gm-Message-State: AOJu0Yw9Vmpdoa5CCl+dW5Guqn45s2yirDToThoFBCW9C70uD4iSIKIm
	JWpxhII90yOzpBQy0uTx90vFuVqhn5DAlv7BNWAo8FNCosFaJ9E81gVyYfkvrw==
X-Gm-Gg: ASbGncupScT1YAkau8yGSSxeuL1EGTtArTvQDv+THxgX1GuH3Sz8PVcQ9HS+pSXaHGy
	6ySCwvMaKfbkdIcYMoFdQi1oaVGM6drYj/m0jUGDkrIKJokaw6clzKEhpJKWxGy1RQPK0Sz9eBl
	CiYdcjp4950lKNo8Zsuo0lszv7p4+1fwiensHMdpICSh6th7ixCPnQaaSNxze5I61/G3akU2ylL
	sFIbc2wX2FREnuXmyxZB6A3/cAzskWYkv8VW6Hsla2BDqwZTAZZiU6R3V6RTBXnaFOel4s++8cP
	QTl0l37GOkPXprKe+CXQV7I5vr+7r29ETi22lBAUS49R8o64kcPyTO8lhto=
X-Google-Smtp-Source: AGHT+IE0G4eyDdJwnFSAO15PM4AGl0rNOflCYe5zhewyGprP1/yMke440QYr7XRmFAHXObEZEqUpLQ==
X-Received: by 2002:a05:6808:170f:b0:3f8:acb4:8d8e with SMTP id 5614622812f47-4007bd5fb16mr847250b6e.39.1744268728298;
        Thu, 10 Apr 2025 00:05:28 -0700 (PDT)
Received: from aus-ird.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40076282ce8sm461369b6e.9.2025.04.10.00.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 00:05:27 -0700 (PDT)
From: Cyril Bur <cyrilbur@tenstorrent.com>
To: palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	paul.walmsley@sifive.com,
	charlie@rivosinc.com,
	jrtc27@jrtc27.com,
	ben.dooks@codethink.co.uk,
	alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jszhang@kernel.org
Subject: [PATCH v6 0/5] riscv: uaccess: optimisations
Date: Thu, 10 Apr 2025 07:05:21 +0000
Message-Id: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_000529_880509_57A13EB1 
X-CRM114-Status: GOOD (  10.50  )
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

This series tries to optimize riscv uaccess by allowing the use of
user_access_begin() and user_access_end() which permits grouping user accesses
and avoiding the CSR write penalty for each access.

The error path can also be optimised using asm goto which patches 3 and 4
achieve. This will speed up jumping to labels by avoiding the need of an
intermediary error type variable within the uaccess macros

I did read the discussion this series generated. It isn't clear to me
which direction to take the patches, if any.

V2:
I've taken on this series as there isn't any response from Jisheng. No
significant changes other than build fixes.
- Fixes build breakage in patch 3 to do with not having used 'goto' keyword.
- Fixes build breakage in patch 4 on 32bit not having declared __ptr in the
  macro.

V3:
Significant commit message rewrites.
 - Corrected the justification for patch 2
 - Better explained/justified patches 3 and 4
Minor code changes for legibility and more comments

V4:
Fixed checkpatch errors
Added a unsafe_copy_from_user()
Added patch from Ben Dooks to save SR_SUM bit on switch

V5:
Fixed mistakes in adding unsafe_copy_from_user()
 - Sorry about the noise

V6:
Reworded patch 1 commit message
Patch 1 no longer clears SR_SUM, just saves/restores

Ben Dooks (1):
  riscv: save the SR_SUM status over switches

Jisheng Zhang (4):
  riscv: implement user_access_begin() and families
  riscv: uaccess: use input constraints for ptr of __put_user()
  riscv: uaccess: use 'asm goto' for put_user()
  riscv: uaccess: use 'asm_goto_output' for get_user()

 arch/riscv/include/asm/processor.h |   1 +
 arch/riscv/include/asm/uaccess.h   | 218 ++++++++++++++++++++++-------
 arch/riscv/kernel/asm-offsets.c    |   5 +
 arch/riscv/kernel/entry.S          |   8 ++
 4 files changed, 179 insertions(+), 53 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
