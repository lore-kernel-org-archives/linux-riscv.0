Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BB2C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 11:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0eiUsb94uhWtGyGX1bHF972aCg364kL9RUHG/nwmoCw=; b=E5kiWHPtpb/6Rz
	8FtBsyTWYa6NjBzKTinksTUf7ChSrJOsaAoEBoMy3ftC+hUpT9k09ZjdUM6tgZRaorySN4Krefbjd
	bMuXq9zipKzVxC1lZjo7LnZLnRgkgpHqYLDMsVFC19m2SyUOc0w87syng/emakUEWav2xAOsQmC3M
	AfrpAqY1YGW+W4fGoFke816/9xhMTtsVIwzPdPlt9iXkQFjNm6GJcxoRr43BOD/lSaETvt7BvuV28
	x20ZsJo7vs5+UAFpGYje/cvop7bNw8dLeN8oEsZoOSU1xthW8b5PJ6347YEkYt3UnfCc8xmflyvNg
	+hB/mu8YWgdqF/E/TZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXdC-0000000Atyw-2QmA;
	Thu, 13 Feb 2025 11:43:46 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiXbz-0000000AtpX-0Yi8
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 11:42:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-21f49bd087cso10790205ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 03:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739446950; x=1740051750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3ojdEZyCKA9R+RW2rn8MW8hNuDT302evxkJ2MsqjvPQ=;
        b=QKnOXV4hobvqT4E0pxxZJFZzgwK52XD4Y8/UzK4V1obajRMF9Ft6c1gVLxk7Qt4ywk
         9C8H3nRV8+TY1QlW8cssFtGPEZFevBYRsJO0sgu1x+ZTfMM/5JuZjBzJw+97vvlHN1aF
         zC+Lv63uVsMrcGpXfPUXK2KijWhxpgDVWXo31TpiU+rcq8IfoiO5wHR6Qkt3UhIcE/Hz
         mSonyMlKiNzqAGFzlbuzC6ggoYdUVFM/lO4OQQ0YqrHSkz476K7iWsGeqqwFXof+3Tb0
         VY+sifdKXYR64gThQEr1QFTsw2gBgyVtHbwoqPcLf9f5x+3uAukRE+edePQpnoDZ+x8w
         1U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739446950; x=1740051750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ojdEZyCKA9R+RW2rn8MW8hNuDT302evxkJ2MsqjvPQ=;
        b=RyiNzFh8PpLFruQdNteXABZA2b1Lt0EYo2auRQBCCPHvubk+dHn/lio2ziqYjQzSXO
         UeQpbEHTXgitNWwwnN/eUVpkKj0vjRo9iHD+qA9MLg0Ykuwyk1hAcOG8PCZ5RNgSTX9s
         9nwaoxwl38QCorKmQzI/Rd+nnFIJWJZmCZCMEQk1Wo0pjlwkXQeemWhW5YpctqL0XMC2
         rmtyDcbMHK7w1SU3iVXIPhcHVMnCW5m50f3q+0Du1RZGa2mqgvKWrbTr6C9cxsONP1CI
         fR0gmjn7ZwPFpPiT4oKhkXRqOcmx8Iz06ouec+LcVU3oLKGM8x/tIojb+xtGfgqHprKi
         YelA==
X-Forwarded-Encrypted: i=1; AJvYcCXuOLqNmxqPmAt5YwWZNwBnmei1bloW2zIuBoZgl/3vbOJHu493L2tMGSHhyGnUZpRPsN55GJXTzqaM/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMu3FqfnUnifEWYeXqUJSQFpBtzbhf1xVjfOm2Fr6V1kapMlzA
	fCetGliUejphBytF/BXUDTlhPRT32Kuj4MPWaxHGrfhYg4RbFDtl
X-Gm-Gg: ASbGnct7zNM1E6jrSOXJmvmgIxnhdNZZ4ILyyJeIGMEBqo25ueFzDTibR9gr/YgYwN7
	MPyMr2jY5/4RhZKmZV+uqAbbcgsUL1CwRJW5Eyu4AF3I2y1l9MfXXDSYVU95J/dY2UwyIG8c3zQ
	1cXHyUECjJ8wMdnTyM8WYrWyGqctHFtIXgzWv5pf6C61k2wb4DvbLHupsjmjT8Us60PvPbKYzwf
	qGSuZmpsN2WGb+LVZEgoWppBUqJOkn119Jx5GnfVwVQjuCX+iPIvCb2iMzGLJKkDiP4sPuvr4M=
X-Google-Smtp-Source: AGHT+IEJgTUzMsTy5tza8GLT9Y3QszGc+72E5WKWmWleltnhdgQxDLQGjdRlQFiRylF1LwOh4jyFdw==
X-Received: by 2002:a17:902:f60b:b0:216:6283:5a8c with SMTP id d9443c01a7336-220d213f2c5mr47871185ad.39.1739446950331;
        Thu, 13 Feb 2025 03:42:30 -0800 (PST)
Received: from [127.0.0.1] ([2407:cdc0:8010::ec])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545d07dsm10570955ad.138.2025.02.13.03.42.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Feb 2025 03:42:29 -0800 (PST)
Message-ID: <f5f0c18c-f6a3-4189-aacd-71c7e26590c7@gmail.com>
Date: Thu, 13 Feb 2025 19:42:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
To: Andi Shyti <andi.shyti@kernel.org>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
 <20241125-k1-i2c-master-v4-2-0f3d5886336b@gmail.com>
 <mwpaontcdzmzwjay66cqknkxv4xzv364d4vm433pazajhbu2si@epzgjj77clrj>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <mwpaontcdzmzwjay66cqknkxv4xzv364d4vm433pazajhbu2si@epzgjj77clrj>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_034231_182658_C9F2C5DB 
X-CRM114-Status: GOOD (  33.83  )
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


On 2025/1/4 08:34, Andi Shyti wrote:
> Hi Troy,
> 
> sorry for having kept this patch unanswered for so long. I had a
> quick look and I have a few comments through the lines.>
> ...
> 
>> +config I2C_K1
>> +	tristate "Spacemit K1 I2C adapter"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	depends on OF
>> +	help
>> +	  This option enables support for the I2C interface on the Spacemit K1
>> +	  platform.
>> +
>> +	  If you enable this configuration, the kernel will include support for
>> +	  the I2C adapter specific to the Spacemit K1 platform. This driver ca
> 
> /ca/can/
I will
> 
>> +	  be used to manage I2C bus transactions, which are necessary for
>> +	  interfacing with I2C peripherals such as sensors, EEPROMs, and other
>> +	  devices.
>> +
>> +	  This driver can also be compiled as a module. If you choose to build
>> +	  it as a module, the resulting kernel module will be named `i2c-k1`.
>> +	  Loading this module will enable the I2C functionality for the K1
>> +	  platform dynamically, without requiring a rebuild of the kernel.
> 
> This last paragraph contains more information than necessary,
> please check other similar cases and keep the same format.
> 
> (E.g.: "This driver can also be built as a module.  If so, the
> module will be called i2c-ali1563.". People know already what
> compiling as module means :-)).
thanks :)
> 
>>  config I2C_KEBA
>>  	tristate "KEBA I2C controller support"
>>  	depends on HAS_IOMEM
> 
> ...
> 
>> +/* spacemit i2c registers */
>> +#define ICR          0x0		/* Control Register */
>> +#define ISR          0x4		/* Status Register */
>> +#define ISAR         0x8		/* Slave Address Register */
>> +#define IDBR         0xc		/* Data Buffer Register */
>> +#define ILCR         0x10		/* Load Count Register */
>> +#define IWCR         0x14		/* Wait Count Register */
>> +#define IRST_CYC     0x18		/* Bus reset cycle counter */
>> +#define IBMR         0x1c		/* Bus monitor register */
>> +#define IWFIFO       0x20		/* Write FIFO Register */
>> +#define IWFIFO_WPTR  0x24		/* Write FIFO Write Pointer Register */
>> +#define IWFIFO_RPTR  0x28		/* Write FIFO Read Pointer Register */
>> +#define IRFIFO       0x2c		/* Read FIFO Register */
>> +#define IRFIFO_WPTR  0x30		/* Read FIFO Write Pointer Register */
>> +#define IRFIFO_RPTR  0x34		/* Read FIFO Read Pointer Register */
> 
> Please do use a prefix for all the defines here, e.g. SPACEMINT_
I will.
> 
> ...
> 
>> +static int spacemit_i2c_xfer_msg(struct spacemit_i2c_dev *i2c)
>> +{
>> +	unsigned long time_left;
>> +
>> +	for (i2c->msg_idx = 0; i2c->msg_idx < i2c->msg_num; i2c->msg_idx++) {
>> +		i2c->cur_msg = i2c->msgs + i2c->msg_idx;
>> +		i2c->msg_buf = i2c->cur_msg->buf;
>> +		i2c->err = 0;
>> +		i2c->status = 0;
>> +		i2c->unprocessed = i2c->cur_msg->len;
>> +
>> +		reinit_completion(&i2c->complete);
>> +
>> +		spacemit_i2c_start(i2c);
>> +
>> +		time_left = wait_for_completion_timeout(&i2c->complete,
>> +							i2c->adapt.timeout);
>> +		if (unlikely(time_left == 0)) {
> 
> no need for unlikely here.
I will drop all unlikely.
> 
>> +			dev_alert(i2c->dev, "msg completion timeout\n");
> 
> dev_alert is a bit too much, please use dev_err instead.
ok.
> 
>> +			spacemit_i2c_bus_reset(i2c);
>> +			spacemit_i2c_reset(i2c);
>> +			return -ETIMEDOUT;
>> +		}
> 
> ...
> 
>> +static void spacemit_i2c_err_check(struct spacemit_i2c_dev *i2c)
>> +{
>> +	u32 val;
>> +	/*
>> +	 * send transaction complete signal:
>> +	 * error happens, detect master stop
>> +	 */
>> +	if (likely(i2c->err || (i2c->status & SR_MSD))) {
> 
> I don't see a need for likely here.
> 
>> +		/*
>> +		 * Here the transaction is already done, we don't need any
> 
> ...
> 
>> +	ret = spacemit_i2c_xfer_msg(i2c);
>> +	if (unlikely(ret < 0)) {
>> +		dev_dbg(i2c->dev, "i2c transfer error\n");
>> +		/* timeout error should not be overridden, and the transfer
>> +		 * error will be confirmed by err handle function latter,
>> +		 * the reset should be invalid argument error.
>> +		 */
> 
> Please fix the commenting style (refer to
> Documentation/process/coding-style.rst).
> 
> Besides, please, do not shorten words (err instead of error), we
> are not in urge to save comment space. Please reword this comment
> to be understood.
I will.
> 
>> +		if (ret != -ETIMEDOUT)
>> +			ret = -EINVAL;
> 
> why do we need to change to -EINVAL? Doesn't seem like a good
> practice
I will fix it.
> 
>> +	}
>> +
>> +	return ret;
>> +}
> 
> ...
> 
>> +	spacemit_i2c_disable(i2c);
>> +
>> +	if (unlikely((ret == -ETIMEDOUT || ret == -EAGAIN)))
> 
> is unlikely necessary? What if ret has a different value?
I will drop all unlikely/likely. It's not necessary.
> 
> Andi
Thank you Andi.

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
