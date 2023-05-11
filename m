Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4518C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Lk099m9WIKwzHoP01utAwg0mEIHNjV1PZmnLsJLCLGo=; b=xtytVWmuUdzzTbF/VB5Zu24S5v
	5oz80UwQG4jxLWVwmEpeCbYNPKSJGhWwNRlWElpiuic2/lqsasmy/YajugT3z9RK3LyVYcA3z5ICN
	QKz0EXic2dwPhKFmVRs169OGtyguH7+luayScWJd/P1TMwLfrHyYez4SNajuv4WMvrn7kjXZk/LST
	Y1n42ibYi6T4moWeINsSKG0jNkyWUCtq8EFhm+veCu3PZDa2s5vfu5P4/x/j0pzBlDzYWL7nIrIWg
	tLQltwlvPVLSoxPT/j9tDIxWIyocbnqlh848ZyhzDMAEW6oaZHrxu96e0vcqy48gwVaj5dWdGeq5q
	3nDogcRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDI1-009xkd-1i;
	Thu, 11 May 2023 20:53:29 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxDHy-009xjQ-0y
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 20:53:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1aaf2ede38fso88125705ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 May 2023 13:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1683838404; x=1686430404;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmqiYN6k7kNOHcOaFBtfG/CJoGmGnLxuGsiwVK55cYc=;
        b=QMR7fofFIz7UTDWgIWfb/8kl0kAphqE7lnR7CJeis2c94cLuhg3/r0tQz6eL/sMqfr
         q5xNDM7Hyo8pCRISro7QIUqhbV0mD85g5HYjAcBlMXOYLVpaVTD13xfZjSQmD8E/djLw
         0NPo8sFeER6dWIgeC+RaBaTHqqemzXR6zPA6W3ilnRtavZimjUbZ1Sa22tPEWq0Toe8y
         alpjDn886e8wtA1bMsiOvg1d8k7nW6tnvOIrrs3/Gymhm4LuaTtX3LuZ5jrexsSsXg2A
         PA+LVL4p9c22qmItfYfCYjj3HB682Ah3O0gRd7XS5qTuZaG9SwNSfX4TZgWWPy2lHlYp
         2JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683838404; x=1686430404;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmqiYN6k7kNOHcOaFBtfG/CJoGmGnLxuGsiwVK55cYc=;
        b=hlCgsqy61/jNhfiaHpbo3hwJAt341E/v/IV9LCswrwvcKK7fdWFIBonauMbbZl9ZYv
         KjnXnWA6PPjobdOxmk3X9KI/agzrYXD0mX9pvftpXK6SOMpUtLlC3f+EPJ+V5RauBgdV
         HXoOsBT+wQUOqUUU4LYcY6R6VIsJWE4YBcjsG9sNZtVWq8Gb9Aj5+wyIDIwdWrhJpqpW
         6+UPcCNw9TF5XB+QS00xWR+iUy/pBA1LLxufbcPvL2Npw0o44Yd2UIN25+vqCakKZdJQ
         f8QGzHOc/JXs3zNmUU8h586gxScp282uIjKtd0FeB63mM2o2Ii+lgXjQ1GRRKWKtf6FG
         26Ng==
X-Gm-Message-State: AC+VfDw9MfWk1bmy4+g/HwBgDo9/8ZPYrmzv2kO39Tw5/uhIwXsQ7R+u
	I0GVTkpV5a4J88hfscxBeQ6T6g==
X-Google-Smtp-Source: ACHHUZ4RrmTAXKngjyn+GYqfCF3MaY6lhqY4LbQJaq1mFOhwPgfCLqhai76N7zGoZNwWLze23GeF0w==
X-Received: by 2002:a17:902:ce82:b0:1ac:95c2:ed75 with SMTP id f2-20020a170902ce8200b001ac95c2ed75mr15028551plg.53.1683838404455;
        Thu, 11 May 2023 13:53:24 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id a10-20020a170902ee8a00b001a9873495f2sm6366920pld.233.2023.05.11.13.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 13:53:23 -0700 (PDT)
Date: Thu, 11 May 2023 13:53:23 -0700 (PDT)
X-Google-Original-Date: Thu, 11 May 2023 13:53:02 PDT (-0700)
Subject: Re: [PATCH 0/3] riscv: sbi: Switch to the sys-off handler API
In-Reply-To: <20221228161915.13194-1-samuel@sholland.org>
CC: dmitry.osipenko@collabora.com, rafael.j.wysocki@intel.com, samuel@sholland.org,
  aou@eecs.berkeley.edu, apatel@ventanamicro.com, Atish Patra <atishp@rivosinc.com>,
  geert@linux-m68k.org, heiko@sntech.de, kai.heng.feng@canonical.com, mcgrof@kernel.org,
  paulmck@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com,
  yuehaibing@huawei.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  tangmeng@uniontech.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-59817569-7525-450f-9bfd-ecb34a30744c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_135326_556838_62275642 
X-CRM114-Status: GOOD (  20.30  )
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

On Wed, 28 Dec 2022 08:19:12 PST (-0800), samuel@sholland.org wrote:
> I want to convert the axp20x PMIC poweroff handler to use the sys-off
> API, so it can be used as a fallback for if the SBI poweroff handler
> is unavailable. But the SBI poweroff handler still uses pm_power_off, so
> done alone, this would cause the axp20x callback to be called first,
> before the SBI poweroff handler has a chance to run.
>
> In order to prevent this change in behavior, the SBI poweroff handler
> needs to be converted to the sys-off API first, at a higher priority.
>
> This series performs the conversion, after accounting for the fact that
> the SBI poweroff handler is registered quite early during boot.
>
> The first patch is a dependency for both this series and the PSCI
> series[1], so I would like to get at least patch 1 merged soon.
>
> [1]: https://lore.kernel.org/lkml/20221105214841.7828-1-samuel@sholland.org/
>
>
> Samuel Holland (3):
>   kernel/reboot: Use the static sys-off handler for any priority
>   riscv: sbi: Share the code for unsupported extension warnings
>   riscv: sbi: Switch to the sys-off handler API
>
>  arch/riscv/include/asm/sbi.h |  1 -
>  arch/riscv/kernel/sbi.c      | 63 +++++++++++++++++++++---------------
>  kernel/reboot.c              | 10 +++---
>  3 files changed, 41 insertions(+), 33 deletions(-)

Samuel: do you mind rebasing this and resending it with the reboot folks 
in the To list?  That way we might be able to get an Ack on the generic 
bits.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
