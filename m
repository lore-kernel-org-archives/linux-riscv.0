Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04ECEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gkAYvCNygWb+e790H+C+qrTLSI8ppFxSAXoJcabA+yE=; b=HdMLk79+oCRaBH
	piSN+glV5DuefQIFXwFfAyTD5oJ1yW0Tw9F2wbxAI7tTRH9S0Ain7hONbCyHKcVhgtKbThOlxZ7uJ
	IT5ZGFeWvFnvdewmc9FmlaF32ModHdbzVXa1arD/h0UqzNbwJH8Sxd4YcEWMhfOK+JEp2kOlrtaog
	B0AYGzaUlFJfOj2c/yu3virIv8ASyL7poHE+weda4/vsg6xThJ3ch5XkzCjqmE3izHFYeGuRYVZ4g
	Mahdrqq5pRsLIZTE3Tta9aYR8ErgWcVIS0ufXZYdkQRTA7bdejzbl9cZ9YkReLHcf49MAkTseSK+x
	EQl8FT/G4+2PcxvW3ANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1lu-00AXcG-19;
	Sun, 30 Jul 2023 08:27:26 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1lo-00AXbI-13
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 08:27:24 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-522aad4e82fso2085240a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 01:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690705638; x=1691310438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AgkTGVmy1yK5uMTDHx23HyiSp5u5RN5VGXGJ2S44BGA=;
        b=D7A36QooQwlrSjyHBvTrdd1IRlPRuW3OyVBUIm+XLZwGMWi7IvLuNyCHB9ZfyyEJnq
         EOSIdhckzo9JB4SSYNoFITfpdPsqTMknm5pc5rNjyMJ/xsanss25Y5Ik+YvZ34dgLpp3
         ETrHXvlUFCtYnkTIC5HJ6nUpI06WLhQydOy8IcJYbck5yfou/dt8xwXlbEkoIdte3pM2
         t+3yMdNn3XGpRVc+3gAFVX0xTDe+jPDmHjzZMQq92tsb1DFJfXSoznV5HPNNejxgj5+V
         8FE20oVS/C/VbQvamu5396ak17TnoHmpvib2htQcOpdu8OV+4re7K9e/1ii/K7Sj9/Y8
         4BAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705638; x=1691310438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgkTGVmy1yK5uMTDHx23HyiSp5u5RN5VGXGJ2S44BGA=;
        b=hiMr7bbQ7gsqySiIhheMYXExZRruA7LIxPAHAuYz2KsaE5178rWYYIWilr1MJYmXZT
         M1eG8W6B7pUAHKxW3W5KHgVWR1sGRMCmsELVLcspTz7cPeP61+XPMxVOlSbdmGqkCzMi
         kjVWPPHtsJnUZtkPtBdFfEe3eC9a/DQid7nnlNPw2qOugxZZROQ9Z+THx984Fyn3WbN+
         PKUBkyS3cYqOkk1bleq//zo06TdQnSi3HEtAhaLwPKGyFVzb+JCZqro/rU/aBQa0H34n
         NgCEY2FJAjIdIgPIq9C/hnlepIn8A+VhiPZq469Qi3Fp01AJvvc2igKR90TfOtTbBmLR
         sT1w==
X-Gm-Message-State: ABy/qLaxFukGTphK+bB3Tg62ishvxHoEoAzz4V1N8fBxQsYe6GTeVfXC
	awnjZDbNPUi2SzYOe6AK4Zw=
X-Google-Smtp-Source: APBJJlEIVYcMyCNO2KnNQSXGP+fSbMHARvp0rLNvnGCrM8tnuh2RyaZk/CI6oGCvi/bq551+X3PfdA==
X-Received: by 2002:a17:907:2c5b:b0:99b:ce19:b69a with SMTP id hf27-20020a1709072c5b00b0099bce19b69amr3502474ejc.53.1690705638346;
        Sun, 30 Jul 2023 01:27:18 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id l25-20020a170906415900b0099297782aa9sm4322851ejk.49.2023.07.30.01.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 01:27:17 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH 0/3] riscv: kprobes: simulate some instructions
Date: Sun, 30 Jul 2023 10:27:06 +0200
Message-Id: <cover.1690704360.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_012720_365087_C4D8F965 
X-CRM114-Status: UNSURE (   7.92  )
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

Simulate some currently rejected instructions. Still to be simulated are:
    - c.jal
    - c.ebreak

Nam Cao (3):
  riscv: kprobes: simulate c.j instruction
  riscv: kprobes: simulate c.jr and c.jalr instructions
  riscv: kprobes: simulate c.beqz and c.bnez

 arch/riscv/kernel/probes/decode-insn.c   |  11 +-
 arch/riscv/kernel/probes/simulate-insn.c | 105 +++++++++
 arch/riscv/kernel/probes/simulate-insn.h |   5 +
 drivers/test_kprobe/Makefile             |   3 +
 drivers/test_kprobe/test_kprobe.c        | 265 +++++++++++++++++++++++
 5 files changed, 384 insertions(+), 5 deletions(-)
 create mode 100644 drivers/test_kprobe/Makefile
 create mode 100644 drivers/test_kprobe/test_kprobe.c

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
