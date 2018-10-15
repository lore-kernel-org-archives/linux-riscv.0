Return-Path: <SRS0=r0AO=M3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCF6C04EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 22:34:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9AAF2089D
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Oct 2018 22:34:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S4uGrwH6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="BiHufblN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9AAF2089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=25s0Xwi8ghfvTs23hHORKHXUYfu85xtdSYA9oUSauys=; b=S4uGrwH6ifuz45zGIHzgevyCg
	txWwI2FUWz7YGoLp40/Zu3/YkGuharyqxksza08tvVzSQUuSmIuDR+vT0F7Qgy8VFXjGG3Y0UmiEs
	k71vUJenQrCM1qvPBabVmZZxUvGahI8TAVhcaINcKYe90g2u5disnF6NbJrXJEnPWqRb4Mf7/NZkg
	eXVd4uNLVC2r05LwMeXsP+lFzm2QYzxLT3R8XjF8+KUYveU2PFuBD5T7vnb2KIgDA5DiifrjGfljY
	cLNyRwbr41hUBtX04R6GHG8ngx6a9s2HXRgrCw9KZR7EHZtPbnDC0Js1c/4/2n+/SK8a24ASXPG5t
	kt+DPyBIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gCBRZ-0004pF-55; Mon, 15 Oct 2018 22:34:33 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gCBRW-0004VV-IB
 for linux-riscv@lists.infradead.org; Mon, 15 Oct 2018 22:34:31 +0000
Received: by mail-pf1-x443.google.com with SMTP id l17-v6so10395434pff.2
 for <linux-riscv@lists.infradead.org>; Mon, 15 Oct 2018 15:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EHz6jgAQmTeDEBKb0A3itU/6VsYN88Cy2bgc1nZfrBU=;
 b=BiHufblNRuAO8l/QI+G10pfhPcIocjyF7Gl2YIo0oBHvnBQaoXOhOPUlW9TwzILGps
 DZMj6PV8zi1uqALp4Y5V258eDQp89DrUkszN4UDPlzBF+YBcqrhboE3P1NFDNe6lWrhu
 WmA9oK4UaKxHxT2mL8ZWQCeIp3l7jwEpyyfDJU4O8n5NeD+BC3lxsBuoirUTKUamgU48
 /Gf5ZNLwh81EFZbun90mu43KXM+lgF7MCkzOd6sm6/WF4bKzyHppNKg06F7eYpKdrS18
 AgSjv2jKbUeBLmmDbXHd/BhRnkVYrQuy2rI4fTeM4WPC9QvR5B1Ozz23TBCc//VnyMpO
 j8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EHz6jgAQmTeDEBKb0A3itU/6VsYN88Cy2bgc1nZfrBU=;
 b=BBBCOJp+9I21ooHYdI99NhHPnzlDsuJpgCJWqUmX69t6IRwAYmunXtnRBAXjqlhgmW
 MPFq37qhEOSv0wtDz+/0SYCbCbf4sb4LlIE+IrnhQA/3m4Lh2PrEUU8X6b8EYC3MwCSl
 0h/f+btxc8I+sTGKoGos210rvjMTYuIs5SLIvVr6Li+iOSeiAIAT5fmVhDpTzUaoW01g
 VUeoxxXem2a99kWTEta+5qEjPHIuR78CBuVcMm28+GBVROzAZZZjczBtU0BZgtPeqnNB
 qQ6HteavpR7NsDp6nRTH+Gjtz+Y3ZVydO76qDKSOOuzyb5xGTTuOzhbkdZtnm3ZAv//b
 2VZg==
X-Gm-Message-State: ABuFfogIepKf9DwbTuJ2FzsFUUX82muxNS/M6KLrX55Y7Cm3iO6WcLAa
 Ee4xPq6jlRUAyBNfr5XjS7VBSQ==
X-Google-Smtp-Source: ACcGV61PiBIXYmSq6ebNMDbUQdQSX8XDbEyOoGAO/1IeDXk9wA/BUqSfMfo/IJlbBBBe3ylhy8sBuw==
X-Received: by 2002:a62:6f43:: with SMTP id
 k64-v6mr18812896pfc.87.1539642859671; 
 Mon, 15 Oct 2018 15:34:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id v83-v6sm23514518pfa.103.2018.10.15.15.34.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Oct 2018 15:34:18 -0700 (PDT)
Date: Mon, 15 Oct 2018 15:34:18 -0700 (PDT)
X-Google-Original-Date: Mon, 15 Oct 2018 15:30:33 PDT (-0700)
Subject: Re: [PATCH v8 3/5] Cleanup ISA string setting
In-Reply-To: <20181014234639.GA14835@andestech.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: alankao@andestech.com
Message-ID: <mhng-48e07863-dd56-4ef6-8342-aa19414bc1b8@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181015_153430_646877_44843758 
X-CRM114-Status: GOOD (  17.84  )
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
Cc: vincentc@andestech.com, nickhu@andestech.com, greentime@andestech.com,
 linux-kernel@vger.kernel.org, zong@andestech.com,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux@roeck-us.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181015223418.jWN0JwDJH2UWzTzcRfB5CX2B49H2MN1zXKtS7pih23I@z>

On Sun, 14 Oct 2018 16:46:40 PDT (-0700), alankao@andestech.com wrote:
> Hi Guenter,
>
> On Sat, Oct 13, 2018 at 05:02:05PM -0700, Guenter Roeck wrote:
>> Hi,
>>
>> With this patch in -next applied, I get the following error
>> when building riscv:defconfig.
>
> I guess what you meant was this commit:
> commit 0a5bee05fc67ce2044b8d91a18abbf14042da531
>
> The modification in Makefile was
>
> -endif
> -
> -KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
> +# ISA string setting
> +riscv-march-$(CONFIG_ARCH_RV32I)       := rv32im
> +riscv-march-$(CONFIG_ARCH_RV64I)       := rv64im
> +riscv-march-$(CONFIG_RISCV_ISA_A)      := $(riscv-march-y)a
> +riscv-march-y                          := fd
> +riscv-march-$(CONFIG_RISCV_ISA_C)      := $(riscv-march-y)c
>
> and the ":= fd" line was wrong.  It should have been
>
> +riscv-march-y                          := $(riscv-march-y)fd
>
>>
>>
>> What am I missing ? Does RISC-V now require a new non-upstream compiler ?
>> Or a special version of make ? I am currently using GNU Make 4.1.
>
> So I sent the v8 to fix this problem.
> Sorry for the inconvinience.
>
>>
>> Thanks,
>> Guenter
>>
>> ---
>
> And Palmer, it seems that the patch that causes this build error has been
> pulled into linux-next.  Any idea how to fix that one?

If I run into the new version then I'll overwrite in in my for-next branch.  I 
don't see one, though...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
