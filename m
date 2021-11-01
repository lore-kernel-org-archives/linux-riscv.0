Return-Path: <SRS0=LL44=PU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4ACEC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 05:11:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 996A360FE8
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Nov 2021 05:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 996A360FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WzVwWzB2beF2UNJNUuGOl6C/1bOfGDwWL7c/5tezcaI=; b=oSUjniP3VIYn87
	kjOwIXPibLvCPffRaGqs54uTu97K9mymr5w7TOxwf2RoaNwVo2G2I8u2ErStK+6leXstnpVnx1T0+
	9h8iaAoPlh7DFkCPSVTBFwQWndRDAqD8sq9NW1uTJynuf0Gff+t7ZekmzJjCsJkc6zgDqVs37/QT+
	TtD1gvbuFzg9vBd1gu70qqEaFS2/3duFBzMo0CQGafW82LHJYhRSZ8EBeS725jl6bZlmO0wPkuXP7
	Dfy9rRCG37zcH4pt7uRT25FKz34pu1RYxT7+ukLYtQNErioK2NolMDK4GkA4CoT0fNN0mNMne84iU
	etABjo2GoGMFhmiWeQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhPbh-00FKvQ-Kf; Mon, 01 Nov 2021 05:11:41 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhPbe-00FKtm-SD
 for linux-riscv@lists.infradead.org; Mon, 01 Nov 2021 05:11:40 +0000
Received: by mail-pf1-x434.google.com with SMTP id s5so3729201pfg.2
 for <linux-riscv@lists.infradead.org>; Sun, 31 Oct 2021 22:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a+gy4ZHgkNOY/BP2CTwX/6iD0OJ4gwZx+tJZjl+zW0M=;
 b=SL+XZ93QCYUn6g9HxEgUJ5QNZ6q4ALMBhOcfw9P2nerr2sVsHn1ggyEGqOBo4CKqre
 oZxZKFi9XdHbtqxdBi/J/MHYhk7qlWtxD8eXpdWHHmRFaST58CmNUYmBVecHcscV8ZiL
 82vKxfVbCBaaZe8LOBQtryXAP5/zRNxVoXxTiRUrfWWztrBd6Rd0OuKFaiu0p1Zi1BaR
 cvKn+hWH6JXz5qaIY0Hg79aI+YOl83QfFmRKuMGFX7NcF0Ny/7ofILY6c35LJm2UuXJm
 c6SNNREkRnOMWHQyV6EPsPtejY83OsfWllIbSJtBTI96x9d4dZWgULeLPiUHqSrB5ZAz
 RB6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a+gy4ZHgkNOY/BP2CTwX/6iD0OJ4gwZx+tJZjl+zW0M=;
 b=h4kh92DIXJQ+9m/X4J7ZwCsXiIDtfIwwRTf2plh15DI5psH342xF+/a+5L2VdiNbhd
 1k2EULM5cnvIRB71rWiasN4xrT0VTOIIrYkJlZLGwSSSGhuFUhBrUIAMc/6IQ+XiIkg+
 VlMsOhu6ij3QJ0UPLVcXlIY8sfA7UrkrYh6QTHFgqmZS5MmsEGl5QC7QVs8mx4FB09Oa
 tYFxRmzzdYTU0/Q7Pw1zvd87lFxq5FHhtktDg//kt99gr1iygcK2LxVrTrJ7XcL+myeT
 74KSAYsaD3nTt0R9mHIaXpGx/ckrZm//FAxBKuGheQZw+yebX1VSXTOItkKpfL2o40yr
 qVIA==
X-Gm-Message-State: AOAM530uCTM5/ltL/Vp5dICuYQwVk24Ru58+2iQ6HgfmHUPoJq3sd1fD
 RqxJiiiMJlqSFLZOp6meYbY=
X-Google-Smtp-Source: ABdhPJyRTTGtedZA4Pexqtrk2YQjxluNocy/QJmN0OSJJ8pvytJgcNLwhdDwYQ31kGg5E8J4lVFVxA==
X-Received: by 2002:a05:6a00:1147:b029:3e0:8c37:938e with SMTP id
 b7-20020a056a001147b02903e08c37938emr26472239pfm.65.1635743497328; 
 Sun, 31 Oct 2021 22:11:37 -0700 (PDT)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id 1sm13332702pfl.133.2021.10.31.22.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 22:11:37 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
 by localhost.lan (Postfix) with ESMTPSA id A48D5900823;
 Mon,  1 Nov 2021 05:11:34 +0000 (GMT)
Date: Mon, 1 Nov 2021 05:11:34 +0000
From: Vincent Pelletier <plr.vincent@gmail.com>
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Marc Zyngier <maz@kernel.org>, guoren@kernel.org, anup@brainfault.org,
 atish.patra@wdc.com, tglx@linutronix.de, palmer@dabbelt.com,
 heiko@sntech.de, robh@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V5 3/3] irqchip/sifive-plic: Fixup thead, c900-plic
 request_threaded_irq with ONESHOT
Message-ID: <20211101051134.447647af@gmail.com>
In-Reply-To: <20211028135523.5cf4b66b@redslave.neermore.group>
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-4-guoren@kernel.org>
 <87a6ixbcse.wl-maz@kernel.org>
 <20211028135523.5cf4b66b@redslave.neermore.group>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211031_221138_967420_256C0571 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, 28 Oct 2021 13:55:23 +0300, Nikita Shubin <nikita.shubin@maquefel.me> wrote:
> This indeed happens with SiFive PLIC. I am currently tinkering with
> da9063 RTC on SiFive Unmatched, and ALARM irq fires only once.

Happy to see someone else having this issue. I hit this issue in July
and tried to get feedback, but nothing happened and I gave up:
  http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html

My uneducated guess, by spying on the registers behind the kernel's
back (see the python script I attached), was that this could be
specific to level-signalled interrupts, where the IRQ re-triggers in
the PLIC right after being cleared but after being unbound from any
hart. Then the "IRQ pending" flag is set (causing the IRQ edge which
would normally trigger interrupt handling in associated hart) without
anything noticing, so it will never be cleared and never be handled.

> However
> with changes proposed by Guo Ren in plic_thead_irq_eoi, everything
> begins to work fine.

Great news, so this issue will be fixed in a better way than my RFC.
RFC which can hence be discarded in patchwork, I believe:
  https://patchwork.kernel.org/project/linux-riscv/patch/8c36c1a28ce63b5120765fd3c636944bfec8bee9.1625882423.git.plr.vincent@gmail.com/
(I'm not sure if I can do it myself)

Regards,
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
