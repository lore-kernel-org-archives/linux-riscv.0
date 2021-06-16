Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41914C48BE5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 03:16:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0960560240
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 03:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0960560240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7a6Gg8w68S7G1YKWEgw8ykQBQNm0JaIssCq9rf/AsE=; b=zjm57cO8z6rNvN
	pLPKoRf7TFEO8tLSI8Ym0eeqtcvp4rZFH1Rq6+xIfNBxnxeqbDMo4+TX4BKhYb7upObUpOy3iFUB6
	clXyIh9tShDGqpF4HxbjJTEwv8GLmwfC6X0yAMrSx08kd09ZqidAWrLT3k/92teJcz74w4kbgCz8Y
	m+viNzmJlKnSjCO4R0iCk+MsGYJ6wGgUZ4HUh7lM2k17Jgbw1ChDH+/cMktbwHoxPNOTYm1brDvMj
	onapbGh8vsUEw8wZimiV9cZwZ3LYalxU7hEJasl7jQDHrFyCVdKbyOi4dBMvvemm7Rjk2KghSW1G0
	lpyBO/NwthM/yCzbRRKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltM2J-004Xa9-W8; Wed, 16 Jun 2021 03:16:16 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltM2H-004XZK-38
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 03:16:14 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id e10so892212ybb.7
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 20:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M9xlk2ZBsShaAsqV3orNyPJJYg7Vzz29UtFHXqBDhAU=;
 b=opAbog307i2ZykhXFdHafYS+f6jxVLUCd+pHtDaC4XBZS3dHF4cK8XN7eCsK02Ouel
 4H58j/iKjyoXplkV4RqPpedtDy8f+wKm9BNi+KV6vpKY3NUeSGL2vjoqT/aedzXEk2ib
 Q23yU85p/blkIX1JwpFIuitJIsZA+G0IqLuITuOTy5YPAzc+cEPfuDa1eXXylM/gPEhm
 R9wOCDuEXt+wQVMnf55ueYKrfu4cGJqF7K9EUdil9mJvw04DIVKFTjwUl99pdxcYxaHy
 Wi+g8uDDEFu8zw9mlEeSV3UWo9jopBqVFmSUGrN1YZFXk9+pC+kiy6sVKp5wjcrMBkxi
 Xjcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M9xlk2ZBsShaAsqV3orNyPJJYg7Vzz29UtFHXqBDhAU=;
 b=ntQGRI0096oWUkpt7Q/JuZWaH3Wdt/WjjJL+24mqhUi05IPCh80Kk8DYC7yqLLmP7m
 Y/YCGLwk4V9hR7KVaq4ZG7H0aCb09UVCiOIok06LL4lsiMbGG3QTroAS6Ef4v8++rbsL
 m3lgNDrA9+BftSWehk5suiSFhT2Km+9wcFlurOYslFEVWG38gqo1pAjkAnWRYfdpHWQa
 0XxNAhHhYsgQl8AuA0QGHmNHTfn5QE2fQm6qR318YXT4VHikPLddKHbX8N/eSiy2WN/A
 7k7Y91Vo4S1T0XSXr/YIb9f1seUk8GHMQUOvVXMESqAeJo0TDXdstdsc+sn3X//ybRxA
 0XlQ==
X-Gm-Message-State: AOAM533+9wrOcJy/z6iDhUDBsoVtCXtyC6WQjED6kghllqzp2JHpZj8n
 tCOD2LdZeueJ0YHiKK0qoTCXliBXnhh+WoCfeNo=
X-Google-Smtp-Source: ABdhPJz8un0SBnoHgopqh1bk66DKwxdavj3eROY61VihfQjpDSbrsP0wUC4Y7WeIRKmBuXe6ud85NftBDyOGg1F5/ns=
X-Received: by 2002:a25:2e43:: with SMTP id b3mr3233353ybn.152.1623813371213; 
 Tue, 15 Jun 2021 20:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
 <1592308864-30205-3-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1592308864-30205-3-git-send-email-yash.shah@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 16 Jun 2021 11:16:00 +0800
Message-ID: <CAEUhbmXKdukBwd0OL2ApOD67aQ9ytSPns3z=COtXTSP_mm3wvQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: fu540-c000: define hart clocks
To: Yash Shah <yash.shah@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Rob Herring <robh+dt@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 sachin.ghadi@sifive.com, Albert Ou <aou@eecs.berkeley.edu>, 
 Green Wan <green.wan@sifive.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup@brainfault.org>, Alistair Francis <alistair.francis@wdc.com>,
 lollivier@baylibre.com, deepa.kernel@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_201613_191052_49F3409A 
X-CRM114-Status: GOOD (  11.83  )
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

On Tue, Jun 16, 2020 at 8:01 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Declare that each hart defined in the FU540 DT data is clocked by the
> COREPLL. This is in preparation for enabling CPUFreq for the
> FU540-C000 SoC on the HiFive Unleashed board.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
>

Any idea of why this patch was not applied?

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
