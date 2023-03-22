Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B9CC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 19:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=77RrVT1wN2XdPtT+l8MvwebkeneBM+cCUrZav2KeWUs=; b=itLmni5MT0MsYR
	/8UTDt88f2LfTUZh1A28DNjtkbKVh7m2bvTp744U4AU80pLBeUC5Usvk3l4Pj0VpcMxu80lgDOf9m
	+XrakGtw7svbSDjGirbqzvjWsSzHJA57CGzR/QDImuflOVwErXe60Wy58RnSh0FkYnYyuKew4Y0hV
	KfNuiGbWjDsgXCG/dcqcteSIy8P/sKUAAut8f8RjHxKCX8gBNB67+olHbjJ8bHNfLb/JETMVU0D+U
	mQ6h3LFJFy2O/8Ve3amxsZAlS9kTCTQ0JZV7yIV/zJKc06Yo0YQydFCEVCAZJWFVn7RJz8okWomCu
	2WALwyJeVx62WJSiRkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf48y-00HBm0-2L;
	Wed, 22 Mar 2023 19:29:08 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf48u-00HBiQ-09
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 19:29:05 +0000
Received: by mail-ed1-x52c.google.com with SMTP id x3so77308632edb.10
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 12:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679513339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1HvQLZQdPKNdJeLKbK81iJwhShUNhpZd0gdfjBwTA2Y=;
        b=QMaKAQSmXL5vjlXpSnOxhB+U0ShTyU7l/EBOjiQd4y1pognhMCOhE88OEKMf2muoeg
         ITaQqzjB5zoFpzD0EFHVq59TXWq0AhovfAnsU+6v+h6zwbRpUSGSHsOb13LeXHQjAWWs
         VaM2vUFcMJAkzAPPMf3WnY6C30Isk0HhVVfuyqady26LRzK1FkF5ghbAO9xT7Uki8nkA
         RIaN8W/FlFT06KIJ6sSDinyPHP3FkKnNEZ5WC555JHaLMt0Ux09tct/jHdp7Rb99vfz8
         kdfblPktEWJLbZkIa3OUdUMwGsKXMffWJPEwp9Ylj3XuHpM1wv5pBewc1FIrvoB1Nox3
         Yb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679513339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HvQLZQdPKNdJeLKbK81iJwhShUNhpZd0gdfjBwTA2Y=;
        b=P42yNY7gHMdgetOzescFv88K+XpPc+je3BpoVwHQVykY308Z/Fvvse88nZsKYnVPGM
         jiAmp68b9rCNvfvWrOW91DuB1XkTEQHEIpqxT0u2z3hTt+G02DuPat0y0B+B8mkvFycn
         j80dEVjLN8+WFS8DOKgTrpcPHR7LBuzS8tNptCk9nmdGqBnpsBpUO9uxINAADhBiU7SE
         4/Ir/mRRDbtIzfwGwoXLAsz4H9TeOceJkPCm4wZWsEa2I+UjRLth2KcwbX9LsVyAH1V2
         xjOKnEH0/HcXYuqWQQ30+7aSyqY3WU/8dlLK/cp03LTMOnLDeDaj7V1PB3Qw4PfAb7qh
         Nrbw==
X-Gm-Message-State: AO0yUKXTnALPjMFEzXoBDw6YIpl4U2zbLczlYSN+E2zABi04QSLdqaZN
	AjecGdf1UnoHdKDQ9MTHwAFHZ+61T14bdsTtOCc=
X-Google-Smtp-Source: AK7set+SkE5yi6qKZ1OUcoZ4Y8BL+sV9yLVOLfnpEQHUHmmoAJMybg4z8JBeeBJ0u6tJA5zXaNRMDw==
X-Received: by 2002:a17:907:a0d1:b0:8a9:e031:c4ae with SMTP id hw17-20020a170907a0d100b008a9e031c4aemr8201486ejc.2.1679513339740;
        Wed, 22 Mar 2023 12:28:59 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bv1-20020a170906b1c100b00939e76a0cabsm2657587ejb.111.2023.03.22.12.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 12:28:59 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Anup Patel ' <anup@brainfault.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: [PATCH 0/2] RISC-V: KVM: Require alternatives
Date: Wed, 22 Mar 2023 20:28:56 +0100
Message-Id: <20230322192858.1189272-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_122904_099297_13AC5274 
X-CRM114-Status: UNSURE (   7.25  )
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

KVM makes use of riscv_has_extension_unlikely() to check for the
svinval extension. riscv_has_extension_unlikely() is built on
alternatives, which means KVM should ensure alternatives support
is available.

The first patch takes the opportunity to cleanup KVM's select
list. The second patch selects RISCV_ALTERNATIVE.

Thanks,
drew

Andrew Jones (2):
  RISC-V: KVM: Alphabetize selects
  RISC-V: KVM: Require alternatives

 arch/riscv/kvm/Kconfig | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
