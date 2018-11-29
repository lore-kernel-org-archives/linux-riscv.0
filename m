Return-Path: <SRS0=kIcs=OI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F109BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 03:01:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4842081C
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 29 Nov 2018 03:01:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e2NFyLMS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KOA+xIQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4842081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=TmQ8efplO62WB9tUjm/0e4BAiMUX1LFwD7qnUNaypj8=; b=e2NFyLMSZab6w3DRkGYhM4uRM
	0MSrzSV/j92qBwWDQtsZtF555uvK4IOBNe++N1i1z7OPK9VvErvJ2iu8ea6g5lU8CWu297cOfW2aC
	pKu+tuRZ4ag2z2WBjsaAPh1MrSTUfaxZPiMD+z7q9aChQr++uKnvMh5Q3k0mZVdGAZ16dfKTkmS5n
	heoxrCsJt6icuyhTTalu8FuyzeCZtIX/J9rL5Dwdy6rte7D1UHI/X0xMSeP5JUAq+hi/fKIDZoprm
	hMNbLEnoG5idTBAxX5BcdOf0K8NeBnPrL9UcWBZKDLT5VFSuJGoXsCh4d8/9KQjgrn9lw30GOzyZU
	2fy5f37AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSCa1-0002Zh-S2; Thu, 29 Nov 2018 03:01:29 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSCZy-0002Yo-Dl
 for linux-riscv@lists.infradead.org; Thu, 29 Nov 2018 03:01:27 +0000
Received: by mail-pg1-x541.google.com with SMTP id 70so232301pgh.8
 for <linux-riscv@lists.infradead.org>; Wed, 28 Nov 2018 19:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PmvdE8m0FvNlBUvqM3GJLcyCwV+VfWmHN81+mwJltJw=;
 b=KOA+xIQeYzAv5zIJYODzTUR3bwhJapiqnGtfCXltOtg6XfAPa7Y5HG+mGcA96dFxoD
 Y/W0tryalnTxqYMsqxop5zfP5HdxpRwqcp/XlPO93zJwNDkfMyzlJOIIOvU1doWmcUAL
 dEIhIh2VqqfJf8IZCoqm4MOQBOusaIQli2PsZMz6oQwyG9DQ+XWcSf5I9G51ROvgXT2H
 jq4B8UXHgYCPd5wN60dlHlk/7VDHeg90aigzHTrvi+0q5r0DjHprYug1/UlnTzHxEbBm
 yjY7/SrwSkCCkqTWW44/wYebOMfSUU1ghymDSWw/P4M4XwuP6bV2rmhVQpGqPN+putAs
 Tiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PmvdE8m0FvNlBUvqM3GJLcyCwV+VfWmHN81+mwJltJw=;
 b=TyfqCAFRaiIe3mh2X9satS41Rd9CjTPp6KWDSRPoRK2g0q5yi7j8/Kv9U9nZv/cA7n
 N7IvmcLrfbp+64wRNB2ViHbZ5o54+Ss5fSB6uWyE2frn5vRxiw7LT6FFdbkbKUw1ivQZ
 0ekhAaDesq3zqLK32MQljIQ1F8hWbGTSVzDlruT7cccY8svREejIBV4ixGauPsuQLcAf
 FBl6md9PwFXWESVjvnOSoVdmJzSLxg7UFHSWu79USnx/B1myWus7D1tBhN5ar/wvvYSV
 aRSNxUfhMfnbmYusC6kZBED0tgsJNEKFQ9tkfGBoGn9B38s2qnfzSnQMI2DIWKByVtkJ
 FjVw==
X-Gm-Message-State: AA+aEWYlx26E3y7RPAkUDMSat10tk/qLaVzKsrlspG3OiMhn/YsGDptb
 DgTLSvbbfK2jy0gS4JxQfgWRuw==
X-Google-Smtp-Source: AFSGD/XKYZGZGchLFEQcCG8Qocxjt0XWI1aYh4irlCZ/O2Pw5hkI84KC9/rZZdBkrFFxq97Vswt6WA==
X-Received: by 2002:a62:69c4:: with SMTP id e187mr33591672pfc.50.1543460475482; 
 Wed, 28 Nov 2018 19:01:15 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b7sm467198pfa.52.2018.11.28.19.01.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Nov 2018 19:01:14 -0800 (PST)
Date: Wed, 28 Nov 2018 19:01:14 -0800 (PST)
X-Google-Original-Date: Wed, 28 Nov 2018 19:01:10 PST (-0800)
Subject: Re: macb: probe of 10090000.ethernet failed with error -110
In-Reply-To: <20181129022858.GG5037@lunn.ch>
From: Palmer Dabbelt <palmer@sifive.com>
To: andrew@lunn.ch, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Message-ID: <mhng-0f0b5208-8aac-4563-a2c0-921a0f5d9084@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181128_190126_467749_3B55DC39 
X-CRM114-Status: GOOD (  17.74  )
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
Cc: f.fainelli@gmail.com, sergei.shtylyov@cogentembedded.com,
 netdev@vger.kernel.org, nicolas.ferre@microchip.com,
 linux-kernel@vger.kernel.org, atish.patra@wdc.com, schwab@suse.de,
 linux-riscv@lists.infradead.org, hkallweit1@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181129030114.h34srTWF_cuYL_PzPqyYu5eh3fhBT6DI_1XCYK8gyjY@z>

On Wed, 28 Nov 2018 18:28:58 PST (-0800), andrew@lunn.ch wrote:
>> This is all fine as long as Linux doesn't go and reset the phy again. Until
>> bafbdd527d56 ("phylib: Add device reset GPIO support") was the case.  After
>> that commit I believe phylib is resetting the phy while attempting to enter
>> unmanaged mode, which is now allowed in this particular chip.
>>
>> Since it appears the phy is not usually described by the device tree but is
>> instead discovered by probing a MII-based ID register, it seems the best
>> place to put this is within the phy driver itself.  I find it's usually best
>> to describe things with code, so I hacked up something like
>
> Talking to Florian, i was under the impression that you could not even
> discover the device when its reset state what wrong. You could not
> read the ID registers.
>
> Your suggested change assumed you can discover the device. Is this
> true?

Sorry, I can't tell that from reading the code.  Since our bootloader resets 
the phy into unmanaged mode I think that just deasserting reset should be OK, 
but I don't have much confidence in that -- once I run into one unexpected 
feature I start to expect more :)

It looks like there's already an expectation that at least the phy ID registers 
can be read between falling and rising edges of a reset, as that's how the 
fixups are handled.  Since the error message that shows up with a single 
(single as far as Linux is concerned, triple since a cold boot) reset rising 
edge still lists the phy by name I think that probing is working well enough, 
but I wouldn't be surprised if there's something in the middle that's gone 
wrong.  It's possible registering a fixup that does the double reset can get us 
through the probing sequence.

Maybe Atish or Paul can help out?  I'm a bit embarrassed to admit that I can't 
actually figure out how to boot the board any more, it's been a year since it's 
been my primary target and since I just to arch/riscv stuff now I rely them to 
test on the board...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
