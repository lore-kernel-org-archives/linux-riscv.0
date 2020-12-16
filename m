Return-Path: <SRS0=pf/r=FU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F86CC4361B
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 09:15:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E001922DBF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Dec 2020 09:15:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E001922DBF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AIJ6loN7CHX9Ok4wnRlz+vzJbanjcrFTQotOWJY5pTc=; b=mf0yG7KGA3XnFEeXPhbvk4wOQQ
	deDMS2xHrJtfJ18muSanzA9P3Bnkx3bV+boHmcqJKgoodFBD6N4ZpXn+OF6Z956T72G5gB9DG6JmZ
	I3o6qivau3/M8+C2BnNcZjm17lgVEk9JgRcP0J6M3h6Q1Ah2aj5EMGXKOD0Nc/gMIVbWtRFS2e9oE
	O55zLxZz1tpTBRFVd5YdDx87ayyq42b1RJcBu+XqDUbguHkOVuIEkqLX6F7s3FY9sYNmQ5MBwrK1/
	QSUa0rnIfqZ3BGOrtJOkMV1Sn51orDzW0VaUHv97DU/SqBnaCSebumlVnXah8+VsuPWZzuMe5o7ok
	Q7QfP+6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpSuV-00080Y-KB; Wed, 16 Dec 2020 09:15:51 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpSuR-0007zS-0X; Wed, 16 Dec 2020 09:15:48 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 82so14817263yby.6;
 Wed, 16 Dec 2020 01:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=W0LXqv5YrqIShnAJ3j/zRhwKpy8jwb9vaREIG/ChG9c=;
 b=EDmnCHdeeslnwFBXDnjQxisodSQ+2tet7hb2eI+g/TS8FWeN3D95bm5k4ALUksfAqI
 zkHdeewnuq01Yw5Ib/Ogk8Qf710QFMt+ET18cJ2+zqsE9OZevPqYXxeT/jjHWm7s4Ct+
 K2+dXZHEI0QzIlb/szTqkBh6ST7IfMdrwvdO0YD0xE3DLNpfYngIU6d92AbxfjWjpbdP
 G3TIETT0c3ZtgoE0tPV6CYK/Fppg0Svutr+H9SHAvlMtpy8TSi/O46bn07UymQoUISCn
 nxC1LCj7XSmn4BKSAGpQYxSQCvX9HbA0m+xyo/dO5u16jrEsaYxjV0PHeElVo+cFQJ1v
 dmcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=W0LXqv5YrqIShnAJ3j/zRhwKpy8jwb9vaREIG/ChG9c=;
 b=RVkOu0CaqqF+TxCgUl5II0ii1Y+FyaXZVf8mmdAxw3PnqZBEUH+K2+UJhxF1qtSsnm
 tM6JXI/nyJ8et6FnelYVJqIsgyB+kEcbuCtu3heAmTaD5vRwxc/zSnX4Bnvr7XrR/ZeK
 ZWdJK06CB9cQlxduaxOrSqm4yi1v+heCrfFFuGtZIerRR3c4BFeIQ9pRiVsxOlK4R32a
 4z6E7sAwe2LIVuUE14qpR5Oxq369/wR9yxuRTS9rnd6WM9VlMMfC03CdXuOx19s66f3s
 NyIl8suzt/WHJ/hO5bLIrsOjlP3M2XyVHmXQv2j8EXf4tLiyiYiAwXNBbuUTSL+1BDQb
 hapA==
X-Gm-Message-State: AOAM5319Clsubf6RCObg5gVaDZzk2OmZfcxctk4wi3QoHrwrPY3RT1IF
 MgSE/bPAP214dGjCPgk1emuwpkSMYHnE0CzXDMozU1HjEKs=
X-Google-Smtp-Source: ABdhPJx414pazVSH07VBlqNumnWChCa1Vi8stoWiNcygFiqEWZfvi1aoz/+uMUVoDLw68KofbEM3X1P9V8KP6PTHxQQ=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr52665046ybo.387.1608110144920; 
 Wed, 16 Dec 2020 01:15:44 -0800 (PST)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Dec 2020 17:15:33 +0800
Message-ID: <CAEUhbmX1_3FTO4LwSN37p8itHhsLfUHaJF9qauESEx1E3B1UfA@mail.gmail.com>
Subject: OpenSBI fw_dynamic firmware does not boot 32-bit kernel on QEMU 'virt'
To: OpenSBI <opensbi@lists.infradead.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_041547_123788_A14B952F 
X-CRM114-Status: UNSURE (   8.28  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Hi,

With latest QEMU HEAD, 32-bit kernel with the following kernel commit
reverted [1]

1bd14a66ee5200d6a24419cbd2e0a0fccd4da36f ("RISC-V: Remove any memblock
representing unusable memory area")

still does not boot on QEMU 'virt'. However explicitly specifying
-bios to use the fw_jump firmware will allow the kernel to boot.

When QEMU switched OpenSBI from fw_jump to fw_dynamic during the 5.2.0
development cycle, I remember at that time I tested this on 32-bit
machine for both 'virt' and 'sifive_u'. See the following commit
message as it indicated 32-bit testing.

2cacd8414daf6a0643926392f05fd397ed1e9b66 "hw/riscv: Use pre-built bios
image of generic platform for virt & sifive_u"

I don't have too much time to do the debugging. I hope someone could
pick this up and identify where the problem is.

[1] http://lists.infradead.org/pipermail/linux-riscv/2020-December/003925.html

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
