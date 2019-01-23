Return-Path: <SRS0=FsxO=P7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8367C282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 23:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A577B21850
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 23 Jan 2019 23:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cQV5dauH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="OY3tPaoH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A577B21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dJo93ROOB3topGRDS/d+SnxWQNcYg3p0x5se0htrCBE=; b=cQV5dauH+E3imtTVf4v8gUxFO
	3FH8kNws1gUWnqmL553WcmTBJhn5nlIA25EChaxy9Hksus6hSzm02kW++aanEq5Dy7iGHP4Br/01W
	tm9d7Zv0oQX1zvpBXnZ21rZ1stq+qWqZ9UZyuv5kfVvdOcItWfuYc6qBTP5v8uTaK+9+VyLy/ksWY
	5JqpefDc0alEI0hhzDyGT6I1IC4rJaklA+a4eC1aIhSGFlpY5KxbSGJyovR52nA4qoFhfqBXbDk2k
	E11Xdg7IBhR0IV9ARIhcRSIqCUo7dv6XH44bTpmccyK0cAPOIhhPOLMVw5mxScVxCDpNeVOeXeGV9
	wwknqOWUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmSPx-0002l6-D7; Wed, 23 Jan 2019 23:58:49 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmSPu-0002kP-8A
 for linux-riscv@lists.infradead.org; Wed, 23 Jan 2019 23:58:47 +0000
Received: by mail-pl1-x642.google.com with SMTP id w4so1987569plz.1
 for <linux-riscv@lists.infradead.org>; Wed, 23 Jan 2019 15:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GZJe5EbKNHuto8QgrVl02gFWkFbtyAX9mqXZe888OO8=;
 b=OY3tPaoHGnOjIkVyDB2MTfeVzG/0RH08tubCal8WACGBYmOPAtJ+DQnFHSmccr8ham
 /qNmDrTL19u4v9s5/09tMco2ss4pYkj1JJf9ivG2WrpUPvhpZSIH/IbtyQ1wqNqrXWZo
 Up80Ty9MFBIEjuhQgklwjo+HJOoQSV0I5kL3nK70x9MxvtjRCzLXadUnEKHxUNNI5O1G
 W6y72nPqeR/QCpuZm8bQ+VRfFbmUd2E4/DUZIU5akC/Vs1tEiLyOY/2wOfqTxqXO0+sH
 GKeI/WWMHtzV3U0kwjVvVqUlcS00Wo3SJLmb++C+6RXkQj1mFI2xj58aTmoFVt1bQf5J
 itng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GZJe5EbKNHuto8QgrVl02gFWkFbtyAX9mqXZe888OO8=;
 b=rWJiiFbN1XAxgCRp7P9SK1yqj6HByx7nCXyqDGgRHClJw2fqmASY0mQXIQuyjMAqTH
 l8IcAnQl39ZhZ/HEgQ3hRpNht417UQo4qW21/eHQ2sdWYgMTvkebdZlIEERXYGFcxTkF
 /+7aQHi/87Kad7y23IRwAkqeFuZe0zc8c4YCd+3bIt8qFxsWqlKGVq+m9+i4oLEpgveb
 JQo2EsoiMTOADZZHCPMYiuki6wfcjEo4U7e1E2aDJuyD0c3gu5uToZiHIcd+ryQAg//n
 L3t0PcDTzT2yWFE/WCSJRNEZQR7ctXYGzgggc8R3YyCGbIW5UFEDAXfMCmWA5ujWlaf+
 dvOw==
X-Gm-Message-State: AJcUukccYWxA7KytZtGeMkgQZQPfv5mxbCc8YZxOid6BWtuViosUJH8L
 f/tFoPv6X6AHHt1EtmfGCxzrFQ==
X-Google-Smtp-Source: ALg8bN545ZSLeJ/eysTaFxjJ03VGthSXs/Zpg/IM/sgTNv/TYcNVxhAhh+ZGHUb+t0Bf7ucAC+GNRg==
X-Received: by 2002:a17:902:9a9:: with SMTP id
 38mr4250658pln.204.1548287924007; 
 Wed, 23 Jan 2019 15:58:44 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id w184sm25022966pgd.34.2019.01.23.15.58.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 23 Jan 2019 15:58:43 -0800 (PST)
Date: Wed, 23 Jan 2019 15:58:43 -0800 (PST)
X-Google-Original-Date: Wed, 23 Jan 2019 15:44:01 PST (-0800)
Subject: Re: [PATCH] tty/serial: use uart_console_write in the RISC-V SBL
 early console
In-Reply-To: <CAAhSdy07AeWeMxQJvzRGzMQ84Sxc6O899T0dWO1vz0LB89ORyw@mail.gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: anup@brainfault.org
Message-ID: <mhng-2f2fd42e-7dc1-4a21-9105-e129d55f1e5b@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_155846_304869_F14A74B3 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: robh@kernel.org, aou@eecs.berkeley.edu,
 Greg KH <gregkh@linuxfoundation.org>, schwab@suse.de,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 atish.patra@wdc.com, linux-serial@vger.kernel.org, jslaby@suse.com,
 linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 11 Jan 2019 03:13:30 PST (-0800), anup@brainfault.org wrote:
> On Thu, Jan 10, 2019 at 10:41 PM Andreas Schwab <schwab@suse.de> wrote:
>>
>> This enables proper NLCR processing.
>>
>> Suggested-by: Anup Patel <anup@brainfault.org>
>> Signed-off-by: Andreas Schwab <schwab@suse.de>
>> ---
>>  drivers/tty/serial/earlycon-riscv-sbi.c | 13 ++++++++-----
>>  1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/tty/serial/earlycon-riscv-sbi.c b/drivers/tty/serial/earlycon-riscv-sbi.c
>> index e1a551aae3..ce81523c31 100644
>> --- a/drivers/tty/serial/earlycon-riscv-sbi.c
>> +++ b/drivers/tty/serial/earlycon-riscv-sbi.c
>> @@ -10,13 +10,16 @@
>>  #include <linux/serial_core.h>
>>  #include <asm/sbi.h>
>>
>> -static void sbi_console_write(struct console *con,
>> -                             const char *s, unsigned int n)
>> +static void sbi_putc(struct uart_port *port, int c)
>>  {
>> -       int i;
>> +       sbi_console_putchar(c);
>> +}
>>
>> -       for (i = 0; i < n; ++i)
>> -               sbi_console_putchar(s[i]);
>> +static void sbi_console_write(struct console *con,
>> +                             const char *s, unsigned n)
>> +{
>> +       struct earlycon_device *dev = con->data;
>> +       uart_console_write(&dev->port, s, n, sbi_putc);
>>  }
>>
>>  static int __init early_sbi_setup(struct earlycon_device *device,
>> --
>> 2.20.1
>>
>> --
>> Andreas Schwab, SUSE Labs, schwab@suse.de
>> GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
>> "And now for something completely different."
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Regards,
> Anup

Thanks.  I'm going to include this in my next PR, as it's pretty self contained 
and is necessary to actually use this sanely.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
