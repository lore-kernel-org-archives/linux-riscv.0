Return-Path: <SRS0=t+Pg=6V=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B97C38A2A
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 May 2020 17:32:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9D7920663
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  7 May 2020 17:32:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FGpX4zjV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="RepragYq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9D7920663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Mime-Version:Message-ID:To:From:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=XtORv2mseP/z/qKbzO4cxM+f4mvGOB4KlYPgfGWkB+o=; b=FGpX4zjVmePgDt
	LDH+QE7Ro1D35xRR0k7srAC+VVWw9wnINp0k1wclB195c5klIPoVod1l2HbdKpeD5RPYcsaz9TRGd
	TquRRvp+le4ZwQlDkrlCWhAmro74zM2r0rVWqYT+yzg52KgoL5xDAR1qYCNrWdibXdFE2Kn5xqN3s
	vdwv3q91ygmC38BW3p0pS3+vaqngeFLyIZsajsWLgpnjpSTdigO7b7UxB2yyEDyrpu9sokLY8fTQF
	VkEpaFKUaekzU+EeU7b+bh45iT4MWfyFqF9GQcEYbRiCoUyGL3BEfFvGcfd69md09vyg1YE2whd10
	LugUv2z/dryqw6TEpRfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWkO6-0005ah-2M; Thu, 07 May 2020 17:32:46 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWkO2-0005Zp-Bw
 for linux-riscv@lists.infradead.org; Thu, 07 May 2020 17:32:44 +0000
Received: by mail-pf1-x443.google.com with SMTP id x77so3339156pfc.0
 for <linux-riscv@lists.infradead.org>; Thu, 07 May 2020 10:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=XtORv2mseP/z/qKbzO4cxM+f4mvGOB4KlYPgfGWkB+o=;
 b=RepragYq+KiOcmsmIcmqxSoP96N7TEOeyskGN/yIXufJShFMvcA1eQxuzAOLD5K2ea
 MGDk1H9ASRw/fGrK8kBf+w55q3krR6u1u9uttrWyUXPAWoYDDxwgnyu0Vn2HP88R5gaO
 CI2ZhMUYSU7kmRsibEw0aYMqZlzdihQOLI5hHERQu0C2JVSU+fgpyeUKbA3G5MEmRKmx
 +JhjvLUGFcNh/TPq++qdwfqoP4EWP674+juvHCPQiAk6xY7ZMKfwhHr40ecpu+jNVZGM
 BqO34jZBLaRpxWWDRcI4ReOmlIGd4ViGu5/b1DclPioTT7QVf/auRpEkicfNT0i31WJP
 0WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=XtORv2mseP/z/qKbzO4cxM+f4mvGOB4KlYPgfGWkB+o=;
 b=mbVN2MhVtpSb3fBiGpcm1js0DKEDpKp8TtL5vTwkVucOKcsLwlf2UDptC9f0HmaFZD
 fTCw9C2hZywm7yo9H7n6jC2iRv78hOpbZCe/HsOZNgCLjegVS0PT1TkXgvoRU7GGdqI1
 tA33yiG5MjQv/G1737MXhpvCtQ+Yq+ZuSto6Eq5rwpnxpVA5Eri1w51rS+Q9q8R02oBy
 lMAk50OXzfArqqrB4PMF1D7cyUJD7Wi39rcSUkngXsTHVW/F7AO+S9zC5MlJkmY6hl9u
 5zIqFqa3+XSF3N/Ez0wZ2bRKfM5SBcnzKcZJJdlVHhK4gn0/u9CcWMCDEn6oMWPja58U
 yhdw==
X-Gm-Message-State: AGi0Pua3o4qwpa8BA86ejxSQZSPdtIrF7xVeBRX3Asd3UA4r1AP0YIdy
 lW7pUz/3opoqJ8DGWzzqMrUj3A==
X-Google-Smtp-Source: APiQypJe1D/GbbpqpG3tn8h3SfYU9egGetkI6hH6LSE74KmfgMmnp547cjjLUB0C/LNRDiBAG8rc8g==
X-Received: by 2002:a65:5ac4:: with SMTP id d4mr11522688pgt.381.1588872760647; 
 Thu, 07 May 2020 10:32:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y2sm5494857pfq.16.2020.05.07.10.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 10:32:39 -0700 (PDT)
Date: Thu, 07 May 2020 10:32:39 -0700 (PDT)
X-Google-Original-Date: Thu, 07 May 2020 10:32:16 PDT (-0700)
Subject: Re: [PATCH] tty: serial: add missing spin_lock_init for SiFive UART
In-Reply-To: <20200507064958.GB798308@kroah.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-3c2de0bd-d2fb-4b5f-be6a-accdaa1cbc7a@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_103242_467385_7C4059C4 
X-CRM114-Status: GOOD (  18.71  )
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 Anup Patel <Anup.Patel@wdc.com>, sagar.kadam@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 06 May 2020 23:49:58 PDT (-0700), Greg KH wrote:
> On Wed, May 06, 2020 at 12:26:52PM -0700, Sagar Shrikant Kadam wrote:
>> Uninitialised spin lock on sifive serial port (ssp) raised
>> a race condition and resulted in spin lock bad magic as
>> reported and discussed here [1]
>> Initialising the spin lock resolves the issue.
>>
>> The fix is tested on HiFive Unleashed A00 board with Linux 5.7-rc4
>> and OpenSBI v0.7
>>
>> [1] http://lists.infradead.org/pipermail/linux-riscv/2020-May/009713.html
>
> In the future, can you link to lore.kernel.org instead?
>
>>
>> Fixes: 45c054d0815b ("tty: serial: add driver for the SiFive UART")
>
> So this should also go to stable kernels, right?
>
>> Reported-by: Atish Patra <Atish.Patra@wdc.com>
>> Signed-off-by: Sagar Shrikant Kadam <sagar.kadam@sifive.com>
>> ---
>>  drivers/tty/serial/sifive.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
>> index 13eadcb..b061bdb 100644
>> --- a/drivers/tty/serial/sifive.c
>> +++ b/drivers/tty/serial/sifive.c
>> @@ -989,6 +989,7 @@ static int sifive_serial_probe(struct platform_device *pdev)
>>  	ssp->clk = clk;
>>  	ssp->clk_notifier.notifier_call = sifive_serial_clk_notifier;
>>
>> +	spin_lock_init(&ssp->port.lock);
>
> Shouldn't the port lock be initialized by the tty core instead?  I think
> this is the second time I've seen this type of fix needed recently...

Ya, that's what was blocking my reviewed-by.  It looks like the spinlock isn't
initialized for console.  IDK why that's the case, but assuming that's the way
it's supposed to work we should only initialize the spinlock if we set up a
console port, which we do in __ssp_add_console_port().  In other words,
something like this

diff --git a/drivers/tty/serial/sifive.c b/drivers/tty/serial/sifive.c
index 13eadcb8aec4..0b5110dad051 100644
--- a/drivers/tty/serial/sifive.c
+++ b/drivers/tty/serial/sifive.c
@@ -883,6 +883,7 @@ console_initcall(sifive_console_init);
 
 static void __ssp_add_console_port(struct sifive_serial_port *ssp)
 {
+	spin_lock_init(&ssp->port.lock);
 	sifive_serial_console_ports[ssp->port.line] = ssp;
 }

>
> thanks,
>
> greg k-h

