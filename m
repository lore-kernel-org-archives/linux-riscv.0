Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BB4C71135
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoHbtzrMxOIymvZSnHpbL25PcAsQcZIcK63S+HmPCfE=; b=x1UlzcMCLRpSor
	DQ+TPO61h9oSf8E5Nc4xuYmYYk2RpxvmT3lcF0E3PtgfB2xxIdavLn7zXq5nVlnkRHJ8AT+B9fxyV
	Wm81FoTaanBP9ZFFq2FpMQ2NGqtfSUQxDdhOJGwi59gh+RA9KitormcB2zuN2aRBxp0CTfsIrBR+k
	qjhYKFPwDINM1T2j9z4ntzGogqMTCE2l2754J0XzOPbV9n8DI9Bviw9hRgFk35AUV8DITVIsfEbLS
	TZW6uUFeSZG8xwVO88xw+fcNBkeS7nDIJOp2vAAqD0pyybjlmiVz7aRl16PEGR5z2a3lpyLbvj2fJ
	dDfGVgpG3MSGKpxpdhbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwes-00000006XzN-0ikC;
	Tue, 10 Jun 2025 10:56:46 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvad-00000006OY6-2vf7
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 09:48:22 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22c33677183so42486485ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1749548888; x=1750153688; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=c4aXnXqL0rnBHw3Vacb/c5rPPCxEG3SLxJaL3UKu4DuyMcMcsoBu5JyU4dsk9DCsEt
         /+xniPqYs47VsFgkZgT28t4nPjx//MQh3Ac+s6fUwpsZ+teRKEeqTSsaIVlXxZ18HAfG
         G16lSykK7QrdZ4laJW28BKYwSzRA7v5NqJ6fI41pODyNy1kxwuJ4TSkVI7jD6Lbu4bZ0
         /CghDNuxexRLnClFe5kD45+sqfinuiXlV6Occjx5ZESIpfN1mY4olqvT0IoKqn87AWiq
         5VedZG0+aCBRCQYVzBMmLfYLwmlaylJjPSxLKWMBOm/vWET1UUln4sHhv56o6hWbBgiV
         Y9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548888; x=1750153688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zQmyYaU/03+AJvFIA5fRBrVmM4eOz2li116ucuEnt8=;
        b=YyB87CM0lsUYwKeoO5iPanPJ0Oc6CK3y+hF5wgHL7/6gxn7UOySCve17UQCBPPRQOh
         D75L5I2stckkcMty1JUEQ+ibdSZ9OoXQcYC5CxzkJK3av7Ije+eNBuuRVEmhlClnmtrX
         fv2Kb6VziyRXQRxOi57LWmNVb2+hg77pzYt2ObbNcC2VAZ41STBOMXsXbNkh6meRldjo
         BTbFZbVRU5j40CdA3EE9GnWEzOhzlMrpQxkPMf5NbovX3Wzw1jFOfbtQO1uGu/tg5Z7a
         zmUu8zfofaqJv7ghyjpZfoQnHdEaJq0EZS+lACupjqpLgMy6cq8mrx/GJweBl0O/MqGg
         rifg==
X-Forwarded-Encrypted: i=1; AJvYcCVRip4H26fxRA19UP02c3AqV+RjQJYO+Y9vYS39jwBTlTvvNt+chMcEsAbymI7KkjFyXdYyIAYHzdwUIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRTnwk0NKYLIOuZv9wh+H8U5zaC7Pfg0FD7uJ1LGWLrAUCARqd
	Hz2TJd+uMDoOL2JW0H0I+nsfz+FIXbGTB5dwMKK+LLLl5YghcNUwT+VGLDBbRG2/H4E=
X-Gm-Gg: ASbGncvq5KQLlrAgDP/xRvdYZIKQHImSGpPftSv2ifDOkJ4X/e5qdjKkfapo0ouwCwC
	G7tStIwB/jRoa79n+4U/vS79UPF5Hmpxyjvzzt5Sq1n4uNQkl30OwjXiQrVUEQXcrLqRezKDt1o
	buRJ9KTU0BbnqQ68euWj7+MXlkl7VB7DKndkPhAgrxuC7I0VGHZgkxjxThTnwAM9t/+rCYfl9OP
	klO1AqMgYbcJY6E6dRvIieUyb6MxEpiomsJBkJYXHv3g1GfE7S0zkw2OGp4I3WNTKJPEFL6SzEY
	p59C86157d7Qit6dzPTj2QH4NUl4LJKLJk9Vd8mjK4DCzzwf6nrZ0uJHCiiiI2ySfpbxjHXg6wo
	s1+0XxCRAiee8Lgz4TyrhoMRtqmUeB65U+leGCvPb
X-Google-Smtp-Source: AGHT+IFTJerKI7nLBzkfbFwxLiCZ8/O3FBsLBWB2rHz59j5SLYJb1rjqSHl7mrROaYWtZGs6ZS1rZw==
X-Received: by 2002:a17:903:41cf:b0:224:1eab:97b2 with SMTP id d9443c01a7336-23601df6a23mr244281155ad.53.1749548888066;
        Tue, 10 Jun 2025 02:48:08 -0700 (PDT)
Received: from localhost.localdomain (60-248-18-139.hinet-ip.hinet.net. [60.248.18.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603096949sm67293155ad.67.2025.06.10.02.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:48:07 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: linux@roeck-us.net
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	chiang.brian@inventec.com,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v8 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 10 Jun 2025 17:38:12 +0800
Message-Id: <20250610093812.164960-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
References: <156dc4d6-071b-4cc5-bea9-4579c140b2f9@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_024820_047514_FD10230E 
X-CRM114-Status: GOOD (  18.47  )
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

On Mon, Jun 09, 2025 at 5:44PM +0800, Guenter Roeck wrote:
>
> On Mon, Jun 02, 2025 at 12:24:54PM +0800, Chiang Brian wrote:
> > The TPS53685 is a fully AMD SVI3 compliant step down
> > controller with trans-inductor voltage regulator
> > (TLVR) topology support, dual channels, built-in
> > non-volatile memory (NVM), PMBus interface, and
> > full compatible with TI NexFET smart power
> > stages.
> > Add support for it to the tps53679 driver.
> > 
> > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> 
> I was not copied on the first patch os the series, so I guess the idea
> is that it is applied through a devicetree branch.
> Ok, with me, but I get
> 
> CHECK: Alignment should match open parenthesis
> #260: FILE: drivers/hwmon/pmbus/tps53679.c:151:
> +static int tps53685_identify(struct i2c_client *client,
> +				 struct pmbus_driver_info *info)
> 
> WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
> #295: FILE: drivers/hwmon/pmbus/tps53679.c:316:
> +	{.compatible = "ti,tps53685", .data = (void *)tps53685},
> 
> That means I'll have to wait until the deveicetree patch is available.
>
> Other than that, please fix the alignment and, while at it, reduce the
> number of lines in the description. Line breaks should be at ~75 columns,
> not ~50 columns.

Sure, thank you for the information, I'll fix these in v9.

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
