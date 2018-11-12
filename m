Return-Path: <SRS0=EHGE=NX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C2CC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 04:10:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DD0820871
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 12 Nov 2018 04:10:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I9CcINVI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0ZeVMqh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DD0820871
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bEd0d/cLh3DQEI2L1VNq68+ydOQmMcJ67idDZx6pXuk=; b=I9C
	cINVIL9Lpp4COtexRPDr5mL6DsY2gVY4Wn6kyP0pJfWZaPwxB+jq/hONKdNMWgXMkdqpvNOoyTZCN
	XsZ5k7nvdleHmUFt0e2p+Q4azFD/u33lULBfz3C9Jkho1GK/+pXsQqBFD0D7zVR9i/qwl0Pjr8oVB
	A1hjo6TTe37D1qT9ISU05tkGb7pogtJTS/f2wUikWD6R9Nz6Qm+iCuuTdIh8hmtA4xAzM5TKitrpq
	RT4QCGqIUyNc2Y87APJ6Ge2c4q2QjNlknlmMEjEav8ZdVjH6n7k4K5fI522hI/nfY7Bps7puog/xm
	xU83jWLkSkfSO4xlfRnwghrEiH9ZMdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gM3YA-00016b-1C; Mon, 12 Nov 2018 04:10:10 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gM3Y7-0008Cm-A2
 for linux-riscv@lists.infradead.org; Mon, 12 Nov 2018 04:10:08 +0000
Received: by mail-pl1-x641.google.com with SMTP id p4-v6so3652577plo.5
 for <linux-riscv@lists.infradead.org>; Sun, 11 Nov 2018 20:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=U/YrlSOjfoby7Mh3Eo+o6RvHJVuLKIojmafn2+XFADM=;
 b=N0ZeVMqh/GxvW7RY+OFORG+5CcvBR0f3CoXyYFUVt3Mmk7sKyncT43NfN5IkE/esyQ
 uVOuGToZNwKI7GCbCgAePZuhrY5geZSFT+963W5Ssmy6ULSDYkYisTsA+mtMCHv2LDeQ
 L8l2jvgvvUZW04X4jMQXJmnGQwJw3qROQfL5kbhCXS40f7Wr+4rqTtYgNNXjqRHv2xMu
 RlnEUriSUAdFYLePAUJFRijeXrzdvm9PEOk98995f07dn8clela/LWKnR/9uh3FKycBr
 ofTOGXJFk2ux41OeqOGJBOOd+WRt85bm5oH40ggj5+9S3aDGnwqc9/NqrspurRn6qFJi
 MS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U/YrlSOjfoby7Mh3Eo+o6RvHJVuLKIojmafn2+XFADM=;
 b=d1E65b7hf/kPBwVZvR0tFLR4XZQlGAdRsPckPmmwZJJuhSxOsuksFMxtxUmWHGBPhp
 zHwKF/34N0yDFDE7P4KeTFm8LI951OzCLpPFnck3X8eC5V+BROV/7TtJe9TReaaDeG1y
 eOL3wGL3/f1XfVtY47UNpmfgclh0y0JuqcI7bKEv9AO1brdCAklKr1BQ/PGYOIU3i8Ey
 sEoOHE6w9Fz88OTpZDmqqQmfATNq9w3g5KnbbYRTZiizLhnisG+chzi2hRyQkRNAN1A3
 WgFVSb9vLR/dvfnQYD6vOQUWeho3jD6r/4zk5Gsgls7XPBIYmRs40j/FunNzBoLzE8yU
 x7wg==
X-Gm-Message-State: AGRZ1gJO7y9rTcwLBjJ6edXFFIhcdVWLK1023KS+R2SIZV4V+ezM2gxG
 eTG87uVZRmI5r9hYBsLlVpk=
X-Google-Smtp-Source: AJdET5f9ZwFywKSWEbvLmCmGDyrrXyl6ezjc1ckvoaBe6bnFVWikKKkDR0gWzII6h2QcZnov4xTmug==
X-Received: by 2002:a17:902:32a4:: with SMTP id
 z33-v6mr18000173plb.168.1541995794071; 
 Sun, 11 Nov 2018 20:09:54 -0800 (PST)
Received: from app09.andestech.com (59-120-53-16.HINET-IP.hinet.net.
 [59.120.53.16])
 by smtp.gmail.com with ESMTPSA id i189-v6sm27536599pfc.16.2018.11.11.20.09.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 11 Nov 2018 20:09:53 -0800 (PST)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, zong@andestech.com
Subject: [PATCH 0/2] Fix some issue on RV32
Date: Mon, 12 Nov 2018 12:07:42 +0800
Message-Id: <cover.1541995312.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181111_201007_369167_BC20F401 
X-CRM114-Status: UNSURE (   7.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181112040742.o1AqWNyt8wGjsQBoe2MXne9Bb-E890gFn3kemZukGEg@z>

This patches fix the build fail and kernel module install failed on RV32.

Zong Li (2):
  RISC-V: Request stat64 on RV32
  RISC-V: Support MODULE_SECTIONS mechanism on RV32

 arch/riscv/Kconfig                  |  2 +-
 arch/riscv/include/asm/module.h     | 28 +++++++++++++++-------------
 arch/riscv/include/asm/unistd.h     |  1 +
 arch/riscv/kernel/module-sections.c | 30 ++++++++++++++++--------------
 4 files changed, 33 insertions(+), 28 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
