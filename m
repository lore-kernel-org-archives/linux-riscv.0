Return-Path: <SRS0=IJcX=SV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7E9C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 19:18:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBDAD204FD
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2019 19:18:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="prCWIt4L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tRFstsV7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBDAD204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0MTdYwW81i/c+TljOrqomSnFUYVm0KEup6Vvmp/moNw=; b=prCWIt4LLX+eMc
	+Xwcl+k0uXrT7jgyX4ekhhqL4aWcjEsKBhisLH9IWCYxry7Kj+J8b/K1E4FKVJTacoDiuTgOjFaun
	iBM/CGkSM49bSOTL3TxU/y8jRj0VVEaz1taaeTWNkqgLMQ/V4iO5PqauUYhx/79xfu9lSgqXB+bTC
	GBGyyYMJG3lACeM3x2ZaqxqO4YDV0aSKgxjPIkmhnOq2DtKcH1mGYorcq4BcqHKtF+3acGMpUR5ME
	wHXI7s8nM7aVnTZkH3yqlp9YhANP/SzfoD/YcZN+U2vaY6SmuXUR9OvqdThseVDv4EX6G8PUM5mNW
	rOLRst6b4Jw881gdyYng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHZ1o-0000IG-MY; Fri, 19 Apr 2019 19:18:28 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHZ1k-0000Hi-LL
 for linux-riscv@lists.infradead.org; Fri, 19 Apr 2019 19:18:26 +0000
Received: by mail-pf1-x444.google.com with SMTP id y13so2921177pfm.11
 for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2019 12:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:subject:in-reply-to:references:date:message-id:mime-version;
 bh=htQo5ULp1r9WrGxwNnWzafOVFDLMMLJb0v1Sl5g4wrQ=;
 b=tRFstsV7JsxedOaa21pVSKpbOigtWYRXdjXt0XpHtU1RqL6aHuTepaEbN/vMhlAcuS
 NrjfX1pres/nyK8PozNEdIsGw3Mgjt31Y1EorPozX5ej++FB+Kbf3YDjkPlyZeLVeq8x
 5xaEp0HruLP/wAXFJFVvqSxt54ROSP/Yr1h8xKCCcX6vBi+NbRJMdSTcstU6TmViqliF
 5jS6I624KEkZ/DYFWC8f1E7EcFO+nCZ5GC24hn7EpO1+Njqp5d2u6QrCeypUuBYmlXxl
 CleR7/E0P0gGw5TiOUxUSRRredgPXZkCRiTboZnMXTD9wmXZF8CqnlnYrw7sii1ud23L
 FpJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=htQo5ULp1r9WrGxwNnWzafOVFDLMMLJb0v1Sl5g4wrQ=;
 b=P5OvePAsHRvzWXPbgZIw8SJDX3zciDuxbvaRKfd7o86wFedCZJ1jkLFfeUhyBxdAke
 6zxvn5UymitZMQRP0N0WsfoL77R8g5huGwOwqOX7VQ8JRUOIuu5lRxFYqHojoLMI1CdF
 FQFoh6nwxLMWEzvLrYCKFPk743a5L3ZuQgPVoah8ILBlXpj8+kH6IgXT36pLTwdSbimr
 vRj9QLR7qAPTWK0YfMNiRWBxSU++YM/R3wCwdzoJHIXkFSJN2OwnrU7dvZLWUCQ7LZeU
 YPkoUWkqBv4ILVT2eOCqmXQaGnmU5UI3HSiBp7ThcRUxj82R24zRWwCAO8nyVFVEYYdd
 1t5A==
X-Gm-Message-State: APjAAAUyUHbXn6ynogCtCKWyRG2lX9Jm74TugN0FkBEGwfo546nbusny
 YRBX8VsYTVoGBgw5zGj07FtJ8w==
X-Google-Smtp-Source: APXvYqxjBAA4uqPIpSyZfwreiIjZo/1gxP8H/bj4leRVysHhL45uquM7Adx4dbrM7zqyU0bXnt9DtA==
X-Received: by 2002:a63:f40d:: with SMTP id g13mr5551465pgi.345.1555701503422; 
 Fri, 19 Apr 2019 12:18:23 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:6d49:9ddc:13aa:21c9])
 by smtp.googlemail.com with ESMTPSA id g73sm8119521pfd.185.2019.04.19.12.18.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 19 Apr 2019 12:18:22 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 "linux-kernel\@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial\@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-riscv\@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "gregkh\@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v5 0/2] tty: serial: add DT bindings and serial driver for
 the SiFive FU540 UART
In-Reply-To: <883f3d5f-9b04-1435-30d3-2b48ab7eb76d@wdc.com>
References: <20190413020111.23400-1-paul.walmsley@sifive.com>
 <7hmukmew5j.fsf@baylibre.com> <883f3d5f-9b04-1435-30d3-2b48ab7eb76d@wdc.com>
Date: Fri, 19 Apr 2019 12:18:21 -0700
Message-ID: <7h5zr9dcsi.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_121824_700447_5AB4C494 
X-CRM114-Status: GOOD (  19.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
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
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Atish Patra <atish.patra@wdc.com> writes:

> On 4/18/19 4:22 PM, Kevin Hilman wrote:
>> Hi Paul,
>> 
>> Paul Walmsley <paul.walmsley@sifive.com> writes:
>> 
>>> This series adds a serial driver, with console support, for the
>>> UART IP block present on the SiFive FU540 SoC.  The programming
>>> model is straightforward, but unique.
>>>
>>> Boot-tested on a SiFive FU540 HiFive-U board, using BBL and the
>>> open-source FSBL (with appropriate patches to the DT data).
>>>
>>> This fifth version fixes a bug in the set_termios handler,
>>> found by Andreas Schwab <schwab@suse.de>.
>>>
>>> The patches in this series can also be found, with the PRCI patches,
>>> DT patches, and DT prerequisite patch, at:
>>>
>>> https://github.com/sifive/riscv-linux/tree/dev/paulw/serial-v5.1-rc4
>> 
>> I tried this branch, and it doesn't boot on my unleashed board.
>> 
>> Here's the boot log when I pass the DT built from your branch via
>> u-boot: https://termbin.com/rfp3.
>> 
>
> Unfortunately, that won't work. The current DT modifications by OpenSBI.
>
> 1. Change hart status to "masked" from "okay".
> 2. M-mode interrupt masking in PLIC node.
> 3. Add a chosen node for serial access in U-Boot.
>
> You can ignore 3 for your use case. However, if you pass a dtb built 
> from source code, that will have hart0 enabled and M-mode interrupts 
> enabled in DT.

Hmm, so what you're saying is there not currently any way to pass a DT
built from source using OpenSBI + mainline u-boot?

As a short-term workaround, is there a way to make these changes from
the u-boot command-line after loading a DTB built from source into
memory?  If so, I could at least script that part.


> Not sure if we should do these DT modifications in U-Boot as well.

I guess so (and I'd be happy to test the patch.)

Either that, or the upstream DTs (or code) should have those features to
the right settings.

Speaking of which, I tried to patch the DT from Paul's recent series[1]
to make the necessary changes.  I can see where to change cpu0 from
"okay" to "masked", but I'm not so sure how to make the PLIC change.

I was hoping to be able to review/test Paul's DT patches, but now I'm a
bit confused as to how to do that.

> I also noticed that your kernel is booting only 1 hart.
> Just FYI: RISC-V SMP for U-Boot patches are merged in master. So you 
> should be able to boot all cpus. You can ingore FU540_ENABLED_HART_MASK 
> in OpenSBI build as well.

Ah, nice.

I've just updated to u-boot master branch with SMP enabled, and build a
new openSBI (also from master branch) with u-boot payload. Using your
v5.1-rc4_unleashed branch, I see 4 CPUs booting:
https://termbin.com/kg13

Thanks,

Kevin

[1] https://lore.kernel.org/lkml/20190413020111.23400-1-paul.walmsley@sifive.com/T/#m77daa2857b76ec7cbca0672ad03ae286f61ca0e6

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
