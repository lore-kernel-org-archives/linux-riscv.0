Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAB9EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 19:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LxEW+KQE3BscVeLc476EB+sS9xbFz717aIl437n3Pgo=; b=BDugmp/yxlCV4O
	ctBxHJZyoPPtyrVAxMTiXrxQUzqOzzWXceePyCGZnz7A2h/ZaxueStPZ8+dY+GryDOkNZK7tMJCYh
	me4I/xHH2IObo3EFmS0UCp5KE7sGW38uR16OM24CJMKpJJCPRgaA1wAtykB7JLr1wzesiiYL209pe
	Q68+Do8t1ViKPucoqy0twVLApT4YD9jtiWH7DIQh609hDHJLM9l8R6jhxw+yt4sYevmqK6tXOaKpm
	4DN2q7BZ8WoE3jYuxBbHSS5CAAmwEarHNeTB+npRYiHZ/F8dN1FgQNDv7ycSPxv+o2nIilNqz/1YK
	DMAAsH3ggvc1YdolNJ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK9i-009GjU-1o;
	Mon, 19 Jun 2023 19:03:14 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBK9d-009GhO-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 19:03:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6682909acadso912072b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 12:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687201389; x=1689793389;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=pWsaZs7eBD1XvD16zd0aNHBIT2Ry/yrm0V7tNWNptps=;
        b=1H1qrVIBFcolEl0LADEzdl0F64jZCR5YsAImxxsvBqcqzhsPU06B1uJ4AZntG72NB5
         tCXfQ8j030MwouiNLBvJ+cyBNatrACxJ88II/4qoHNlAfMqC+vmpBz9gfAa/2UTntwGL
         4AtkFdDHxsncK8Niroj7kHSfkIxrr/UdnnwGgvULlBtjsFXzm5p2FmahnKF0GwD/QdGt
         G2ghM6VQD1Mu7eHJzMWvA109eZKIsPeI7mRubPv1FIQW+pTkD39a7D2uPkhLyFlQBEhC
         5MCnSBbnkBH5dXk6T6WvWrMHLhYyBSix5xZ7K6VWeIZtKMTSHmAcNrZEuzSPnipJJjrJ
         4UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687201389; x=1689793389;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pWsaZs7eBD1XvD16zd0aNHBIT2Ry/yrm0V7tNWNptps=;
        b=XL3Kf51deVl6SpSk5Dn4Mq9hyRNJA9dWjiy+SfNf9ZeQ/DtU6GAojT+wwb3Xa6bWcV
         nP6Qmeoqc4CNsyy6sOK+0Z9TNtBXY1kp67Dj1K9JXXaGlYvhKiyD+pKxPZfKOz+VQqec
         k2MoNAaXQ0cic8ayjOOImEZNavJyFj9FuEbuxpWp/12g93GbGp2vCFH3Jw/D6JOdMkkj
         zQcovrcrfYiTX1rXFlPb2aJIocJNHyMlEQGW8avKIWsPtXZhA7EwOqeR/JaZHA9nqXwB
         k8sS7L1nlecBCtsEnOhXLYIRBAH0hdUPLJlDKy3bxftJusk1DIw+BZTLD8b6v0R5qfgJ
         EoGA==
X-Gm-Message-State: AC+VfDyEx7v29Vd5nW+fWyZtdGD05dOudDvTHVsKsh/QDUtiIgtqtVvV
	Z6Vz/15Bcu1oDpXxy5sxw2nyBw==
X-Google-Smtp-Source: ACHHUZ7ast8YAb174Rej3KLXm9cwfVjlQGcUxBHX+tNiBvV/Ax2yKiHf6WRUBK2gUqzcIg5D6gnFOQ==
X-Received: by 2002:a05:6a00:2342:b0:668:71a1:2e68 with SMTP id j2-20020a056a00234200b0066871a12e68mr3736878pfj.11.1687201388710;
        Mon, 19 Jun 2023 12:03:08 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id g25-20020a62e319000000b0064398fe3451sm12001pfh.217.2023.06.19.12.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 12:03:08 -0700 (PDT)
Subject: [PATCH v3] RISC-V: Document that V registers are clobbered on syscalls
Date: Mon, 19 Jun 2023 12:01:43 -0700
Message-Id: <20230619190142.26498-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, bjorn@kernel.org, remi@remlab.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_120309_831764_EF51A00A 
X-CRM114-Status: GOOD (  11.00  )
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

This is included in the ISA manual, but it's pretty common for bits of
the ISA manual that are actually ABI to change.  So let's document it
explicitly.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/vector.rst | 8 ++++++++
 1 file changed, 8 insertions(+)
---
Changes since v2 <20230619180411.12946-1-palmer@rivosinc.com>:
* Add a link to the V spec's calling convention doc.

Changes since v1 <20230614163534.18668-1-palmer@rivosinc.com>:
* Remove the code change, just update the documentation.  We might still
  want to do something in the code, but that's still under discussion
  so let's get the docs sorted out for now.

diff --git a/Documentation/riscv/vector.rst b/Documentation/riscv/vector.rst
index 48f189d79e41..165b7ed0ac4f 100644
--- a/Documentation/riscv/vector.rst
+++ b/Documentation/riscv/vector.rst
@@ -130,3 +130,11 @@ processes in form of sysctl knob:
 
     Modifying the system default enablement status does not affect the enablement
     status of any existing process of thread that do not make an execve() call.
+
+3.  Vector Register State Across System Calls
+---------------------------------------------
+
+As indicated by version 1.0 of the V extension [1], vector registers are
+clobbered by system calls.
+
+1: https://github.com/riscv/riscv-v-spec/blob/master/calling-convention.adoc
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
