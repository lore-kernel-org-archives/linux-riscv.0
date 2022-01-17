Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA8AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 17:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nKZ6+dz7McDbdPzAIAkiTalTrb9xrIt9b5wzTn0aLRs=; b=cCQaCyjjbAUhHm
	7GYhAMaTo2Mpc8DkwA0m1LumoBT01paIaf/TWAYgMmmXNeC+0zepipJYzZ7UWYl0OHg4sV+6LzAYo
	/u4Wpzmr4P5hy35GKYVQsUklS2cunMlhPkQSyJ/8oTECUHNwuiMlot9TYBiEhfP1DY1THHWBcmFEy
	S5VrFu5EAJ8OXdKjcceaNPsYF6yRIUlJSljSjMGMWIXhm/ZZJP/O9Qr/SLknudeJediDDZg0mvQyh
	gIMFjt1Ur2FrZAmk06PIqjZZQZCemkB2nfDhHj3YNrHSGgCI54/gRYo0h81Q3zZ1Lp5Z9MjjQmCOT
	X1BWMDa9D+RhG/aABXbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9VzQ-00FyJe-ID; Mon, 17 Jan 2022 17:40:20 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VzN-00FyIT-Ck
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 17:40:18 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c71so68731890edf.6
 for <linux-riscv@lists.infradead.org>; Mon, 17 Jan 2022 09:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nextsilicon-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=iMDcO4eQs2H32+Kbc66oNL0zWJ0+FvDKW6SSqWa54SI=;
 b=yVdlIArwbEyBhX9EurbEYpxUWqYQekXu0WHAbS3snTlYWwsygEozbTHawRuzOipRhx
 Mt/b2zZprkzgXcsgGMHftbrQH7XPPnFD2kIIC+aCesrEovFHd3q7aSEwWibJXY8eSJw7
 U68zZtquUMWCkguzD/aWoKbSyy2bgZuHtlxY4YHS772xt8uGJbF3KBJmXfXVI3yK8XrX
 LOOATW7qCS+89FqN29k1ia8LwCOKvCv/igMEgV2mzh7QkWlqULeNhAWWH4PVxIFiRa+p
 7bD4zjERDA09W77IkuwlvteV0rgf8tk/xiZP4U7F+DFAeO5hEzNRNtVopOR27n9n9edb
 nFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
 bh=iMDcO4eQs2H32+Kbc66oNL0zWJ0+FvDKW6SSqWa54SI=;
 b=ojsz9IL7avVGzh3qQ5nF9LteYXWpp22hMvhP7TrsOY13VmAcKIROBvKxZwpHEu5Tjn
 9sxZRcf+4g3OpRi/FMo6H4OIBYrjtU4Z6cqWFEw1yuLrcej8xBakCyu0EbLVW0BMd1Li
 0x06lvRkZ5jIazz6L1ifeea61Gem+kQ10uRaqBLwruzgecF6K1DAt2a44pyBJ73PCmJo
 +tHgtZe+CxN/HhJTq4udt5KwD80bBrmHNSXah86Y33nRuztDSU6MInfYh8kEyf+E96ke
 8t5rVxnXYP/5lNjVRD+IboZ4R9UG9sMS2vmWYdgjtBHvPtBnY7qrX/2o6JlecteHQT4i
 doWg==
X-Gm-Message-State: AOAM531heoxcq/xc1D833BmZlB83ifpr6MVs1LJ1ccxNloZ2PU5d6ChK
 m6UR0ZsmfikrvgTnbWOoTw5qWjJe9A9gDVYox2siZ8GVcL1qamw8nWBLRNLx4oxGbh30HHXerFG
 BFpIuV0x6uWEXTlouyZ1S3A==
X-Google-Smtp-Source: ABdhPJyMHLR13A06MB84gUPWvlfcvYAjaUNkEczNoGxC2FbbeSS9ayJlaS9/sHgEsl+3ftB6ITE+5g==
X-Received: by 2002:a17:907:97d0:: with SMTP id
 js16mr17429657ejc.577.1642441214770; 
 Mon, 17 Jan 2022 09:40:14 -0800 (PST)
Received: from florian-Latitude-5420.fritz.box
 ([2001:16b8:c2de:b300:c4c9:2ca6:b54f:5c7b])
 by smtp.googlemail.com with ESMTPSA id gn36sm4651779ejc.29.2022.01.17.09.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jan 2022 09:40:14 -0800 (PST)
From: Florian Wagner <florian.wagner@nextsilicon.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Cc: yaron.dinkin@nextsilicon.com,
 Florian Wagner <florian.wagner@nextsilicon.com>
Subject: [PATCH 0/1] RISC-V: Make stub compile without c extension
Date: Mon, 17 Jan 2022 18:39:40 +0100
Message-Id: <20220117173941.3798325-1-florian.wagner@nextsilicon.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_094017_541601_E1D0D0EB 
X-CRM114-Status: UNSURE (   9.43  )
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

This is a small patch to get the `head.S` for riscv compiling without
the compressed instructions extension for riscv.
Specifically a magic number in a signature field was described as an
instruction instead of a constant in the assembly. The patch changes
this to encode the value via `.ascii` which is closer to the original
specification.

The generated code should is byte-by-byte equal.

Best Regards
Florian

Florian Wagner (1):
  RISC-V: Change signature header field to use `.ascii` instead of
    opcode

 arch/riscv/kernel/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1


-- 
This e-mail message and any attachments thereto are intended only for the 
person or entity to which it is addressed and may contain confidential 
and/or privileged material. Any retransmission, dissemination, copying or 
other use of, or taking of any action in reliance upon this information is 
prohibited. If you are not the intended addressee, please contact the 
sender immediately and delete the materials and information from your 
device and system and confirm the deletion by reply e-mail.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
