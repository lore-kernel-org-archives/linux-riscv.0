Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13631C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 01:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B05C4Y5PtGe6iTxxyFwe402S4woizqesFNhluTXcx/o=; b=jY8lDIk67d1CfU
	ufZYUmKDPhHi7zYm/MHnlwgiEQmI7IOUYoofJhKUJTRykwQB7PAKq5fgjk0ZT4UYjNXLRS2JEqGu9
	HyUTqk7wNVDKpBcW+l6uWjrtLBAMzjolscTDGmnyTb7/BvVIJdjZD7YdLXoBL2SGXfVgDV+7N670H
	NxuBlaLc6CcV+V3M7cP8XOXG+lQ555kSRr4VnJaxAgZlepMKST1y5vn8W6hhNADBHqHw6GQyRfBdG
	DNliFZM/K0b9DvDBM6HkC1YqQ5ptv44nT90PkEIyt89WQzEWkCU0n3b+8GGw14G991j5jHGM5sojm
	NrN5krZgFR63FJIcjBAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm3r5-008Lb7-1I; Wed, 04 May 2022 01:31:03 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm3r1-008LaQ-1l
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 01:31:00 +0000
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2f16645872fso1292937b3.4
 for <linux-riscv@lists.infradead.org>; Tue, 03 May 2022 18:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=dHwaVxq93hYLQygfvs2cv0JNSxw4/sjH10kGM95wEsY=;
 b=eQcBP0/2I03phLuCUByQDweNItowsdpSaXNxKGuKdb91LF5j7x23v8zrBjK6wIK3aI
 0sBMfpZxE/Y1UkQfFuiVy+KnuZKyJ5FWuW9Lq6ttWMg4Yi3OQHLh1kMQ7qGheyyzFaL5
 QVpAB/r4P0d7bBCbWDGsNYrrohInqSC14r2NM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=dHwaVxq93hYLQygfvs2cv0JNSxw4/sjH10kGM95wEsY=;
 b=uP3BtoQYIBEGS5AvshT8k0wIiKsqLvKuw1mDNBKBjahnSAS/HUGLLfaXP9RfLgabBR
 e6KDmpTyUjtcjZgeAXNi7iea7Sdss1roVjTl/R1+6kGCaswjCCNxwGjC0jnOsfOWr6hu
 5uQQhNOkUAKcoLBlqo9JXXMhH/Kiq2OTDa1WL7cJFut6tQr2D/Wc62ebNAWjcUCpxfXC
 u5Jwmvtiw2agNNuTpnhI803OlidAtwMo65p5IbQGwnW419POfujE9QASuaGFH1+XQYbo
 tvLnc1bCH2xLmEVwL01l6vRGtqOFV1Gu6Dg2nvrGrDSbAkJ46zlIjouKdgd2/tEllnZA
 IITA==
X-Gm-Message-State: AOAM531+l2tm0WTBbc3/xxpERbc1cQb2RrNqn1M4Bb7XTnPzCdtNxneq
 Aw3aCNbsGLXqSCG5AGCbIXumxbIU5fSnAHlNVriLz/PzU234
X-Google-Smtp-Source: ABdhPJyTcJFbo6EqmJfVav7wCRmm1DyV/+4PX8ja/HUIDWGMqn4lxaz9XK9GiB/9KwaqmhUZx02p1Tt1nsUpSm/QaJA=
X-Received: by 2002:a81:20c1:0:b0:2f8:5dcd:91d4 with SMTP id
 g184-20020a8120c1000000b002f85dcd91d4mr17895820ywg.443.1651627857321; Tue, 03
 May 2022 18:30:57 -0700 (PDT)
MIME-Version: 1.0
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 3 May 2022 18:30:46 -0700
Message-ID: <CAOnJCUKjSCrRNT4841MzO3vWmYszX5CSmvtPoRLydzG7FFm7kA@mail.gmail.com>
Subject: CFP open for RISC-V MC at Linux Plumbers Conference 2022
To: linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 RISC-V SW Dev <sw-dev@groups.riscv.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_183059_314112_1DCC155D 
X-CRM114-Status: UNSURE (   2.88  )
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

The CFP for topic proposals for the RISC-V micro conference[1] is open now.
Please submit your proposal before it's too late!

Here is the announcement[2].
https://lpc.events/blog/2022/index.php/2022/02/04/cfp-open-microconferences/

The Linux plumbers event will be both in person and remote
(hybrid)virtual this year. More details can be found here [3].

[1] https://lpc.events/event/16/contributions/1148/
[2] https://lpc.events/blog/2022/index.php/2022/02/04/cfp-open-microconferences/
[3] https://lpc.events/

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
