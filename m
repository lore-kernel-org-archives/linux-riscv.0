Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F74C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 18:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=0Hejh/uFq3R8I+/9tmvksVjo9pJHWDukCROrt/pAYc4=; b=GqAFkdVLzxvwd/mg+/v2A7n53o
	m6OyHx4icIZ2Rs+/PKxETzATY6sbxFY2do9UIVxF3p7mmelmM+4apBFltsI4mNiXV5mfeoD6lg9Q4
	fGjEItngH4Z3VOStPwb1u/4OnI7uFNL2BPgWrCKvymWTNS1cW8VZx05A1J8iNgJshj43gWLmRqxsj
	5cqLpLUN4/WLA/SnSi8LfSBqcpqoNjgn54+oFY3+4XmUIjBfSmDkpw1uHKwww2CCmBbjV6fESlHgu
	etNCNxihEBxhEFijxVN++gMPmhxHzwx2vTPc5D2SWiGO3WbyEFphqaoVp2RofTFHUdS7oSyWRL4YG
	dxYK+7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAc2Q-00CliL-Bx; Thu, 20 Jan 2022 18:19:58 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAc2N-00Clgu-7z
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 18:19:56 +0000
Received: by mail-pl1-x62d.google.com with SMTP id u11so5807215plh.13
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 10:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7I5OODOa5piQNsKmLmbhAnVs29y4MT3sx3I0fLDPy2w=;
 b=qAcObxObCDq1N919u4ec4prmW472518LnFhDPyYfYOqdct9Jvu/bgC6p9ASucwA6xR
 pKbhJ/cMqkrdIq00r96VE6qFmsYm0U+x8Day96Wq46xWEjKT+JNUnI8Sjs2q5BP/uagl
 E5iz5A8s/Szvs6xgy7BC6WS1V27HLVpTVkPrroIj8sDaxnU+18uGbeO1GN9HbCl2pW3T
 DYPaN/7V+BL0N6A1sAE8gWk1WzxljeeKtMn1Wd7FZ1IgonzdiBLmHtqz6TWl4nMgnCOG
 5cp5Ns4zrtkIPeVZ1ceUH9FchijSaTAlpNlLm9DlhQoF5cSxjr7sbHlz5YNaZwY/z8KO
 Dw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7I5OODOa5piQNsKmLmbhAnVs29y4MT3sx3I0fLDPy2w=;
 b=cFgVSSdjJUaonGCzzjnCdKTBN2R8jaK3DIAL1wgicT2vMIABkSvKN8i3oTnfqtPVrb
 QDgIOrmJHhvv5Qxkb4rIHJMAY75OkcTZUEy7ETgEE1/RQ3AvwQln6+FhHL7zxkTojow/
 H8WNcCCzhDnj3+FZZS2An+B5zb8Nx68LVGTjz5QGfw1Khtj4eVHC2oum4XWf3aMXJh+M
 Tlr8oE0ToFMLuwr5GBw2y7Yucnx3Buk8w1erjj8Y20kIxqQY4iT/qU74L8PvwVBbZZVt
 kEUUmzfUWL+tmm0mfWXZzEGahi0rWCd78dKAU03168Cvdm7titeKfMtgY2odX1DKXOsg
 FJoQ==
X-Gm-Message-State: AOAM533ePTuL2E0Ijk4EFYj7kpb77jbC6BH/Eza6htRWIMYNijs+4qXW
 MuA3+x7UyOGVQN1l+53kkZOkYG9cScFGVg==
X-Google-Smtp-Source: ABdhPJwb05nkzkp2TpQCijXSNYaPtKpZw3Qs733bSdJ9zS0nGG4S4+IbLGn7RLmphX1r0U7O10Ihuw==
X-Received: by 2002:a17:902:f54a:b0:14a:97ad:b877 with SMTP id
 h10-20020a170902f54a00b0014a97adb877mr203886plf.152.1642702792943; 
 Thu, 20 Jan 2022 10:19:52 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id t31sm4200143pfg.92.2022.01.20.10.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 10:19:52 -0800 (PST)
Date: Thu, 20 Jan 2022 10:19:52 -0800 (PST)
X-Google-Original-Date: Thu, 20 Jan 2022 10:19:24 PST (-0800)
Subject: Re: [PATCH 12/12] RISC-V: defconfigs: Remove redundant K210 DT source
In-Reply-To: <DM6PR04MB70816AD80E3D9BD56A59FEFFE74D9@DM6PR04MB7081.namprd04.prod.outlook.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org,
 heinrich.schuchardt@canonical.com, 
 Atish Patra <atishp@rivosinc.com>, bin.meng@windriver.com,
 sagar.kadam@sifive.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Damien.LeMoal@wdc.com
Message-ID: <mhng-f042ecd2-dc39-4212-a2c6-3ea842c20e3c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_101955_351537_6CCCFF7E 
X-CRM114-Status: UNSURE (   8.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 06 Jan 2022 18:14:00 PST (-0800), Damien.LeMoal@wdc.com wrote:

I just see an empty message here.  Not sure if it's something wrong with 
my mail client, it's always a bit confused by yours -- it's usually not 
this confused, but it is generally a broken mess so I wouldn't be 
surprised by anything ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
