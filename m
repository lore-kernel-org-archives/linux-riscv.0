Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E426CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Feb 2022 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8OdyiJAZ0ex2Lpx1By5U+M9TIod7BCYdotZOM8GUdfc=; b=dYsuTmb5NwYaIF
	/C/TWu+3JTVbckkCwDrIzfRPGsQx9ueX24f0Od6Lq+uM8TV1RZgkk9A2tSIH9j3jDBzmsjopwQ63o
	1/RD0jXTPB8xRjPmMEjX9Ep5W4hWdgNGSd5yyBW0kG/Qt46mo+fxT/fCRjXJeWfDuXM+tOkEhgHnd
	F+DVNc9hu8cFnm6UG9zW2QdRTojrDcFINGYPz56FvUGiZ24UaNeJx+mE0SZsiLJFft58KSxn7LNLz
	Z83itnHuDagQi3MJegadmhgrjpVJWuOyi9pmuO5cBkTcAhGplI/lwhTouX/Aq5Bs98xBk79m9fBbs
	o8UKN6MqV1oxUVQsZVcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFH5G-00Fr7p-Kf; Wed, 02 Feb 2022 14:58:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFH38-00Fq9g-Dg
 for linux-riscv@lists.infradead.org; Wed, 02 Feb 2022 14:56:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id w11so38809987wra.4
 for <linux-riscv@lists.infradead.org>; Wed, 02 Feb 2022 06:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ZrDOk96xIXTsGTfo9/ILISPypk5mowtPM4WNMZCWfgQ=;
 b=ZdJidn9E7ICenT1d16RsYRVZaqa2zhHEEXGEAFo2LGCKDiTcJIBYeFJrZvNfhsUAYb
 j3zRktgiN855jXtddVnr4XIxZlwdtSiQNZjRpHmCjFB2jTS6NdCvZPWZK4OwNbtnNXUT
 nsKHOVrI6VrZfR+QG+amXXS4iZWdQBViWITe/92eYozY9rXHr67g2Z+6wpKUa3YWi94U
 ow7o85flDptOsRm2XfU+zDYsO8HoFkfMn7i/IDQjXHofVngzZIhOv4fumzkTf64XZFEz
 kBStSYyqBE4XMGfeeZyiBuW3/lPHYXntwOYSxeKZSXaX0FMDnIfXKtpKi7NWg3nfggCA
 A5dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ZrDOk96xIXTsGTfo9/ILISPypk5mowtPM4WNMZCWfgQ=;
 b=K9yncTDMNmwtC5kGhanN2CV5i79mWJTK6dIo04uWDvdDztQldJgcedVpd+SfXRB3XU
 IhXMW2dggBRxKS1WjfyPUipz44TP/3vkI/P326gQuFUx0XdTSjLIXhGmpHJM0jByVIcc
 iQKCxSP52E4At7eXU0dT30UdNvBaxsC2N98Yh8LLMSWlE1oAI+s2vQW/k1pEE5mVvywa
 tZcrKnRCOKHYiRHSMShWFdu0jEKFqn1JlmnnQYLkYCOzwZB6bNeNGgdX9HzraYDNvENC
 jmzCdmvetAQVO2P/HbXzFvdvO8W1hxWVyjCZcjcGNRkxQvWprzQFY7JYbMwCaoSDQq+H
 BJbw==
X-Gm-Message-State: AOAM531WEakYmoGBRyvbOast4qhTpZ8QWsV+z9w7DdzR2cu4xZXSfnNu
 FPNTOENLoMox1ROJsAumzqkdy8tfq7cPvYbtBBEbj4PCB3gviPnN
X-Google-Smtp-Source: ABdhPJyWyV1yDWmsFpu5+qSL7ud2Pox/KB7M7ZuabShU/yZR1x02qeWJ5TJkyHvk7pKtf9lMAqr3k/P+zhXZLyp+JYo=
X-Received: by 2002:adf:d08c:: with SMTP id y12mr26168596wrh.346.1643813756620; 
 Wed, 02 Feb 2022 06:55:56 -0800 (PST)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Feb 2022 20:25:44 +0530
Message-ID: <CAAhSdy0C_RMVShk=vv7FRgmVRspBkVQfiCLx-4B6pYtLU10vZA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 5.17, take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, 
 KVM General <kvm@vger.kernel.org>, kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_065558_621448_36FA30E6 
X-CRM114-Status: UNSURE (   5.77  )
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

Hi Paolo,

This is the first set of fixes for 5.17. We have three fixes namely
guest entry rework, sbi implementation version fix and counter
access fix.

Please pull.

Regards,
Anup

The following changes since commit b2d2af7e5df37ee3a9ba6b405bdbb7691a5c2dfc:

  kvm/x86: rework guest entry logic (2022-02-01 08:51:54 -0500)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-5.17-1

for you to fetch changes up to 403271548a840dd4f884088d6333e09f899be5ff:

  RISC-V: KVM: Fix SBI implementation version (2022-02-02 18:58:06 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 5.17, take #1

- Rework guest entry logic

- Make CY, TM, and IR counters accessible in VU mode

- Fix SBI implementation version

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: KVM: Fix SBI implementation version

Mark Rutland (1):
      kvm/riscv: rework guest entry logic

Mayuresh Chitale (1):
      RISC-V: KVM: make CY, TM, and IR counters accessible in VU mode

 arch/riscv/kvm/vcpu.c          | 48 +++++++++++++++++++++++++++---------------
 arch/riscv/kvm/vcpu_sbi_base.c |  3 ++-
 2 files changed, 33 insertions(+), 18 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
