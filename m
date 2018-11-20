Return-Path: <SRS0=wErq=N7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93D5C41536
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:19:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F3D020684
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 20 Nov 2018 16:19:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V3mAj6bV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="S5tyt39m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F3D020684
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=NSG72gskExOn6Db4Fs3De66YGvN2jxAGmo7YrdBkv/A=; b=V3mAj6bViWVfQNf6PHQRWJ3v2
	oOPa8mDKtZM9ixlBcGzyVZ5fDfndXZRK0C/C+zf7Qdn/f1ceLPT9Mcgh+02v3eirJl7s9SkvsPbiL
	gkZMtWtM0ZHFSY36+YeaWlpJSQRiM+8QzoH/Wp92rYu2R8oyJTNnllLdSJD+AKhW44jQcdGMraSqU
	6x620/5LoWXxeysv1pnGKOkFDU0QkHyECc8SB8G9Tr9fwbGsPbEvWLlcgqN2LtGE7ofdMM0gENANR
	4H81E0Ehoh/95kupLIwvX/wYW++MT7wGDWKoKpls38hMXy7a4qeiRK4cEMef2yCWtmJId+2Fb/geZ
	PEz7BkaEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gP8kP-0003Eo-1m; Tue, 20 Nov 2018 16:19:33 +0000
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP8fo-0004T9-3X
 for linux-riscv@lists.infradead.org; Tue, 20 Nov 2018 16:14:55 +0000
Received: by mail-pf1-f193.google.com with SMTP id b85so1224728pfc.3
 for <linux-riscv@lists.infradead.org>; Tue, 20 Nov 2018 08:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=eVdDR9CX9nmr2vwqYWcoSb7B83XKAw+k0tDAHcjN4Vg=;
 b=S5tyt39mI0Zg/VtHvXB8fGIQOhDPe5ibUqPaK6jo/TxSY6KvT0+OyzVZNTpqrh2e57
 CE8ED64nwbAZpGKgPKrZ0yC5ves9bd81SqDsL0llSnze/f3nka8FGj/niWOs1BnevNaZ
 hwlZC2Q5tKDJmjmSGVZ7zW4H2r7QhtMLkqYlraiyZ+sgK6G6Q9hUXUWiJG2IZoNQ3Qzt
 /qwCwrRSYIW8TQIqZ9xCH3ij8C57mEi/tHyJW+4h5fO+7F7lJcRTQEo0Qs15fkfMK9zD
 CvW4pQcbbS6azxtHLlYjLZaXq5Ow/DY6sxn+uTfVtC2Iq33i5n3hwi/iTsKBTffKTc1t
 rXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=eVdDR9CX9nmr2vwqYWcoSb7B83XKAw+k0tDAHcjN4Vg=;
 b=fumArdz4Z8QF4eCc1KhlMI2D6xqgGe7frVGxsIiyXjZkIZpsRY0ZproDG6u9t7Du99
 K5h3XvtLYUkPARIUo90f/pUG1qgnhcixPgYqs+YNVnbXI4bnTxgp6h09xl2TPzYkuu+Z
 zfynr9itmdLUI67iEXU7JkamwfFGkZWARpq0yWMN3r9R9mUGpMAT9+AQ7lIPQIUKTgCP
 azw4FAq5j3OC5rqEHeaR/xqpUfb6Xa864U0TtJH6jv7ZDDoCBXyBUXFFXtuQxhatOMRb
 Z1+fP99IgG4A6rLBxSvROxHwyuk9jJdZJC1Q2vCMTlglCeHUt51kMePCy/VqowT/9tDU
 IBrQ==
X-Gm-Message-State: AA+aEWa1RRAhh1xmugkePa7u6tysTJ+kFNA+IsqXk/XJcULNknkVFuKE
 8rSyMB/ywYda3pV+uV3NY6ZzCw==
X-Google-Smtp-Source: AFSGD/XDfb90PC+7weaujd3FisOTarJZcXArYYpHS8uly1iJ4AznHcGyXNfoppuGxCoN2TKRJUTM2Q==
X-Received: by 2002:a63:2f86:: with SMTP id v128mr2346538pgv.407.1542730417291; 
 Tue, 20 Nov 2018 08:13:37 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id 123sm47272022pgd.75.2018.11.20.08.12.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Nov 2018 08:12:59 -0800 (PST)
Date: Tue, 20 Nov 2018 08:12:59 -0800 (PST)
X-Google-Original-Date: Tue, 20 Nov 2018 05:30:36 PST (-0800)
Subject: Re: [PATCH v5] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <95449dce-5bca-1034-e6ed-947055a37abd@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: atish.patra@wdc.com
Message-ID: <mhng-69ab2e8f-e03f-45c9-aa15-dc6784f07911@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181120_081451_136764_0BFC2BFC 
X-CRM114-Status: GOOD (  23.29  )
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
Cc: mick@ics.forth.gr, dmaliotaki@gmail.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181120161259.u6pTpMvnqzq9NcgHOLxfSpN9jHGd4KW7RD7KA1xuZ-A@z>

On Mon, 19 Nov 2018 14:37:40 PST (-0800), atish.patra@wdc.com wrote:
> On 11/19/18 1:10 PM, Palmer Dabbelt wrote:
>> From: Nick Kossifidis <mick@ics.forth.gr>
>>
>> Added a menu to choose how the built-in command line will be
>> used and CMDLINE_EXTEND for compatibility with FDT code.
>>
>> v2: Improved help messages, removed references to bootloader
>> and made them more descriptive. I also asked help from a
>> friend who's a language expert just in case.
>>
>> v3: This time used the corrected text
>>
>> v4: Copy the config strings from the arm32 port.
>>
>> v5: Actually copy the config strings from the arm32 port.
>
> Why not use CMDLINE_FROM_BOOTLOADER instead of CMDLINE_FALLBACK in that
> case? To my ears, CMDLINE_FROM_BOOTLOADER made more sense given the
> description. If CMDLINE_FALLBACK is retained intentionally, then it's ok.

I don't really care that much about the names, so I just picked what Nick did.  
In this case I think "fallback" is better than "from bootloader", as when the 
config is appended it's also taken from the bootloader.

If you feel strongly then you're welcome to submit a v6... :)

>
> Regards,
> Atish
>>
>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
>> Signed-off-by: Debbie Maliotaki <dmaliotaki@gmail.com>
>> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
>> ---
>>   arch/riscv/Kconfig | 57 +++++++++++++++++++++++++++-------------------
>>   1 file changed, 33 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 55da93f4e818..23ac6d6f9ab2 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -227,39 +227,48 @@ endmenu
>>
>>   menu "Boot options"
>>
>> -config CMDLINE_BOOL
>> -	bool "Built-in kernel command line"
>> +config CMDLINE
>> +	string "Built-in kernel command line"
>>   	help
>> -	  For most platforms, it is firmware or second stage bootloader
>> -	  that by default specifies the kernel command line options.
>> -	  However, it might be necessary or advantageous to either override
>> -	  the default kernel command line or add a few extra options to it.
>> -	  For such cases, this option allows hardcoding command line options
>> -	  directly into the kernel.
>> +	  For most platforms, the arguments for the kernel's command line
>> +	  are provided at run-time, during boot. However, there are cases
>> +	  where either no arguments are being provided or the provided
>> +	  arguments are insufficient or even invalid.
>>
>> -	  For that, choose 'Y' here and fill in the extra boot parameters
>> -	  in CONFIG_CMDLINE.
>> +	  When that occurs, it is possible to define a built-in command
>> +	  line here and choose how the kernel should use it later on.
>>
>> -	  The built-in options will be concatenated to the default command
>> -	  line if CMDLINE_FORCE is set to 'N'. Otherwise, the default
>> -	  command line will be ignored and replaced by the built-in string.
>> +choice
>> +	prompt "Built-in command line usage" if CMDLINE != ""
>> +	default CMDLINE_FALLBACK
>> +	help
>> +	  Choose how the kernel will handle the provided built-in command
>> +	  line.
>>
>> -config CMDLINE
>> -	string "Built-in kernel command string"
>> -	depends on CMDLINE_BOOL
>> -	default ""
>> +config CMDLINE_FALLBACK
>> +	bool "Use bootloader kernel arguments if available"
>>   	help
>> -	  Supply command-line options at build time by entering them here.
>> +	  Use the built-in command line as fallback in case we get nothing
>> +	  during boot. This is the default behaviour.
>>
>> +config CMDLINE_EXTEND
>> +	bool "Extend bootloader kernel arguments"
>> +	help
>> +	  The command-line arguments provided during boot will be
>> +	  appended to the built-in command line. This is useful in
>> +	  cases where the provided arguments are insufficient and
>> +	  you don't want to or cannot modify them.
>> +
>>
>>   config CMDLINE_FORCE
>> -	bool "Built-in command line overrides bootloader arguments"
>> -	depends on CMDLINE_BOOL
>> +	bool "Always use the default kernel command string"
>>   	help
>> -	  Set this option to 'Y' to have the kernel ignore the bootloader
>> -	  or firmware command line.  Instead, the built-in command line
>> -	  will be used exclusively.
>> +	  Always use the built-in command line, even if we get one during
>> +	  boot. This is useful in case you need to override the provided
>> +	  command line on systems where you don't have or want control
>> +	  over it.
>>
>> -	  If you don't know what to do here, say N.
>> +endchoice
>>
>>   endmenu
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
