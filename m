Return-Path: <SRS0=5TGz=XP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07738C49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2019 13:29:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD95020644
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2019 13:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LNlTo7Hy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AF1H2hPL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD95020644
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3odJlCkpLC1Wvqs5Dgrf5MMAENnGqRJjqQFnwFC6Z8=; b=LNlTo7Hy6w3fMc
	z+0QNG1k6hpeiKW3CmPEbosceRjPGlgtGFY+uPsIOVWIPm2Kw6mLJfylrKh5RUQXl3i0i8jarl7eI
	925M3dPlEqqQh50D6P97w7/8FE+Yk70rdwerxmi/1a8UOIssZcWhJkpF4usFnlaFO1wOB6CiPYIhv
	8SD+2AzG7X4nzpoBxmXZ2eQkaK93a+3l1uBBCbHFoKA6jZ5Z9+FuKG0I4IrHvKLJ2wt1tG7T1wHHo
	MwIj+yDiUDbkEPrD7xOjDQCDV1yr2jXmbN3W5HqFOkGIqoY23BcF2YSeSbBufP2X/jqLlJ0oocPpS
	RNkr2sBcPhWPcJlWTcsA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBIy8-0007Kw-Gh; Fri, 20 Sep 2019 13:29:04 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBIy5-0007K6-Od
 for linux-riscv@lists.infradead.org; Fri, 20 Sep 2019 13:29:03 +0000
Received: by mail-ot1-x343.google.com with SMTP id s22so6177316otr.6
 for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2019 06:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e1EFKSI2taSOuRAW19A6gM/LOvRhsiSAjxhmMibFXx8=;
 b=AF1H2hPLVVGNc+OiNsqAjyKg8k+pL+BHKPOnn4mgK/uS3ttkHlL+v9rg5rnlbRuzYW
 6GAFAllYHLe4G5GMp+MxPWpyWWpZvDcLb6yq6VydzUIE+r0SyCY13Z0SkkqjPor5odeg
 nE4WRem05gKBGGA/aESGTm9OV2DQufZk18wN6ZD5n5mNeWGSxntxtCtOppZMOVNPotgZ
 Nvbjg/AkYxhuAL7guoueUUHYygUNzmv4uKHDLNgggyvnbdDVczwqeUMRUv0D80/ndspo
 At1eaFi2Ci/Nd4QodoPs9JSqKQ3s3qjiTbKptc3Ur04E7qR5kwGHLS8VB9novgt4gId6
 FB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e1EFKSI2taSOuRAW19A6gM/LOvRhsiSAjxhmMibFXx8=;
 b=rV0Prx4bFsnJzFxQQpSz3PpJ5dqKk5x4AkVcOMi+8Xpc+at0FhBgMspvwFPnk6WO0y
 veq/ipIY1pBP43hQYclJIRuRdJ1IC6hx1UyMp9EnTTJfmzwCiDR2e1nu1AKQDC6fEvTv
 WyqsDwGWnJbTVnRxuqt0XCDt1nVO87lcMgqswpWTZYO3/NcBqhVhq9Eqf10KAqprYSmQ
 FljtE0gg4ygUBjHKp2PlW8NxF5pcSGw7m9FkWcEtLk8WcGv7h/x5itWtZ4Ymco2PUPmL
 KW8JH5lC+8KY/zR0whqMxYHliSePh8ZYYzj7LK89KdXOoXrPc6MFrzZG909pAC0UYViP
 QSiQ==
X-Gm-Message-State: APjAAAV4OXpERQ+WWRes+0M+0woSXzbXYaMmgRrcz2xHlNh4xAJxtApd
 +89AXNRvs9XA3wvwtUch1wAJMpQASRcg7+DZNhmGvQ==
X-Google-Smtp-Source: APXvYqyPEEVYGqYC4zvTbO/6W6S45SlzHK0YpaI9OdY6IVv6zKDyKISjMw/3lHYqjdiirbdck92GKcdyAa/1P07TNGc=
X-Received: by 2002:a9d:4e1e:: with SMTP id p30mr11740947otf.224.1568986140111; 
 Fri, 20 Sep 2019 06:29:00 -0700 (PDT)
MIME-Version: 1.0
References: <3c0eb4e9-ee21-d07b-ad16-735b7dc06051@bluespec.com>
 <mhng-df6c7aad-d4fd-4c44-96c8-bf63465e0c97@palmer-si-x1c4>
 <20190916223323.07664bc2@why>
 <alpine.DEB.2.21.9999.1909170525170.30255@viisi.sifive.com>
In-Reply-To: <alpine.DEB.2.21.9999.1909170525170.30255@viisi.sifive.com>
From: David Abdurachmanov <david.abdurachmanov@sifive.com>
Date: Fri, 20 Sep 2019 16:28:48 +0300
Message-ID: <CAPSAq_y8x7AxU1jA25_9DRtHnup1w6AZTjgj-iQ1F3n-FH3+DA@mail.gmail.com>
Subject: Re: [PATCH] irqchip/sifive-plic: add irq_mask and irq_unmask
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_062901_866769_66A554F3 
X-CRM114-Status: UNSURE (   8.58  )
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
Cc: jason@lakedaemon.net, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Darius Rad <darius@bluespec.com>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Sep 17, 2019 at 3:26 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
>
> Just tested this on the SiFive HiFive Unleashed.  Seems to work OK;
> however I did not stress-test it.
>
> Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # HiFive Unleashed
>
>
> - Paul
>
>
> # !cat
> cat /proc/interrupts
>            CPU0       CPU1       CPU2       CPU3
>   1:          0          0          0          0  SiFive PLIC   5  10011000.serial
>   3:          0          0          0          0  SiFive PLIC  51  10040000.spi
>   4:       6266          0          0          0  SiFive PLIC   4  10010000.serial
>   5:        102          0          0          0  SiFive PLIC   6  10050000.spi
>   6:         37          0          0          0  SiFive PLIC  53  eth0
> IPI0:      1134      21128       9024     220261  Rescheduling interrupts
> IPI1:        10        143         18          7  Function call interrupts
> IPI2:         0          0          0          0  CPU stop interrupts
> #

I have applied the patch on top of 5.2.9 kernel and tried to stress it
with stress-ng interrupt stressors for 2:30+ hours.

# cat /proc/interrupts
           CPU0       CPU1       CPU2       CPU3
  1:          0          0          0          0  SiFive PLIC   5
10011000.serial
  3:          0          0          0          0  SiFive PLIC  51  10040000.spi
  4:      34240          0          0          0  SiFive PLIC   4
10010000.serial
  5:        102          0          0          0  SiFive PLIC   6  10050000.spi
  6:          0          0          0          0  SiFive PLIC  53  eth0
  7:          0          0          0          0  SiFive PLIC  32
microsemi-pcie
IPI0:  32013933   28068736   29345256   23346339  Rescheduling interrupts
IPI1:     78514      78586      63144     100317  Function call interrupts
IPI2:         0          0          0          0  CPU stop interrupts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
