Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E865C71157
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jun 2025 11:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96aSqrWh4xsac8HUxFCcBKLc8PLibZq8L/Duh3lNPCU=; b=zQLFtQjiw2tdEk
	/4mYjwhjQgRN4AU5M/w2OZzt0XvI+B+2iidbHS3yCfeTKKuHQyI34kq0k4nc3CccQbdLx+ufhKMXP
	7pEOYqz52di4eNq9hyFKzLY6TVci3+TrqwUAxpjPYTo0mCpsD7Rd/wIGz/PMeEvFz97JCPBNjX8tb
	eaisWyoGgvTbjCY3yDk6pbvEu1pFRdsDOI/mMmzcAWkaOj8bNEbxkcJp16pEDOzsCQSzwDuF7hXL3
	Cjx5SEr3fiJqThOp58nPTKdIKeS+vxoqUv3144L87lWrZaRzXvECNZRcWUyKELwrPQdnAsCnrhg9w
	Al60GAXpA6b7CexLa+Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRU5O-0000000704e-2Qg9;
	Tue, 17 Jun 2025 11:02:38 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRU4S-00000006zz4-38Es
	for linux-riscv@lists.infradead.org;
	Tue, 17 Jun 2025 11:01:42 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-235f9ea8d08so53887855ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 17 Jun 2025 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1750158089; x=1750762889; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DHyU2R8WPjOq8eE9G+orQPQ64Wuq4IqqrSMYFwTCBc=;
        b=S44NZpXF01M2q0/o9YTlUqFvdntdFBkVeD119XmHpwRJKZd+OGoTS3yYBknMiElqVF
         MdoluY/o2lWGtHzEReyQS3LcEPC/FiNkpwYga06B1xrJ69lxq7zxyKWqbKCc5cNaBifX
         iRGYCk0crR+I6UytVCsS0+9Te7fMl8lRf1hXSifhxHl1N4N2ZTcNZ0Tk0f+B49Cq3IDO
         y6ZUAspg/uEMqd819XSd5dQZdpx8FRdIiItWRWUUYNlp8NRqosZ+GEJ3lVDKPlrUSiqZ
         Og6eVckUNGVuw+mRJ6yKhL3eRxp5I/MHB5ncWFYhwuatXkq8XDDekyLKimleMWAegEPT
         JDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750158089; x=1750762889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DHyU2R8WPjOq8eE9G+orQPQ64Wuq4IqqrSMYFwTCBc=;
        b=tWEbdt8JuKNVKn5ZvZ2CfF+gjrPej9pUnFJwBjpBg6dEPaUO83OYWs+8ZU80WpTNHD
         wazKoBxzCLMbvVWs1J3MGrFvEBCXsyDb7Uu0f5mwZYjaY/0jeO26SAU0fDxu89bUbRB7
         IhDn15qmXqEjkLAU2fXUrdmiRfjksY9oKwkU5GgQQi3jLhIn8N1/AogPa+8j97RrphPi
         9PImhH3XzGgNS7hf7uWgtLvxmlDFY5Q1tNI1w1xERRTjaaA4bqkYfBjs/uzfPycINHf4
         QCx0l5PpzKpEXoiJ5oT2hKAK3Ewl8rm5IBFMDwph0C3eBIh+9umhVlBWZVbtYS2dPeVf
         jp4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV44gbOpjpQ+Fk8veO3F1Xmg5+8eapSvcxxDQy46ioYEwS8QwcAw0inu5dkFWarx461kLSH4eh8FyN9YQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YweZEPZ96mA+cLnU0cPDffc1FVBf2M2S5YjKofmUN+w47pnGELs
	0WMeua8aeviBgPRlG8tO0tZ+1/PcO+x16WuV0FP7146suabsOWg05XbVEuWYRu+l/ag=
X-Gm-Gg: ASbGnctC3kzogCR7oppcs2e0gAMXR+3kwuAbpXX6Gqo08rjA9y3fEVlKnNIwFzfxCQl
	3CBYBpb6RpEdPilAlG1xgE7fQmBG45h4CX3fQTuB3aYUeLUUJ7cpCc+RSef2nmPfd4QJ+vWw9Au
	Q9ikGrNzArm12XMmz6VUJlHEDJSr5ahYlIyBA3Pza55L1ywG7mAjK4HbISbQW9Pl4dCurhDQI74
	4pYE30nXCHPX4coOyu06thMQCpqAycy5dt57T/BVoHTQgMS9PioD5NKiKW0RzWvamJJFzaZAP5w
	a/AVi0AlxssT5gM0/JtN5KNEm/m9fddjTFqP/VNIC5993jOL2Qgvp9tGZMJtpJ8XAFMSHfK/osR
	xcvqMXQ4=
X-Google-Smtp-Source: AGHT+IFhiIFZVVRkKW6KlPv5Ms3limyDQ3qCAx3P+UVC13Dsqu72f+r1sPGNNNtDItxGQ9ngdyMNEQ==
X-Received: by 2002:a17:903:1a83:b0:234:9656:7db9 with SMTP id d9443c01a7336-2366b122186mr205102705ad.32.1750158088915;
        Tue, 17 Jun 2025 04:01:28 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88f423sm77142515ad.12.2025.06.17.04.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:01:28 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
X-Google-Original-From: Brian Chiang <Chiang.Brian@inventec.com>
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
Subject: Re: [PATCH v9 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Tue, 17 Jun 2025 18:51:41 +0800
Message-Id: <20250617105141.4081335-1-Chiang.Brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b278e83a-473f-46ee-b353-3f8c14d03aaf@roeck-us.net>
References: <b278e83a-473f-46ee-b353-3f8c14d03aaf@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_040140_806131_7A67A678 
X-CRM114-Status: GOOD (  17.94  )
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

> On Mon, 16 Jun 2025 09:15:43 -0700 Guenter Roeck wrote:
> 
> On 6/10/25 03:25, Chiang Brian wrote:
> ...
> > @@ -263,6 +282,10 @@ static int tps53679_probe(struct i2c_client *client)
> >   		info->identify = tps53681_identify;
> >   		info->read_word_data = tps53681_read_word_data;
> >   		break;
> > +	case tps53685:
> > +	    info->pages = TPS53679_PAGE_NUM;
> > +	    info->identify = tps53685_identify;
> > +		break;
> 
> 0-day rightfully complains about the bad alignment above.
> 
> If you want this patch to be applied for the next kernel release,
> I would suggest to copy the hardware monitoring list on the first patch
> of the series. Without it, I get
> 
> WARNING: DT compatible string "ti,tps53685" appears un-documented -- check ./Documentation/devicetree/bindings/
> #296: FILE: drivers/hwmon/pmbus/tps53679.c:316:
> +	{.compatible = "ti,tps53685", .data = (void *)tps53685},
> 
> Since I am not copied on the first patch of the series, that patch has to be applied
> through a different maintainer tree, and I have to wait until that is the case.
> Not that I understand the logic behind it, but I mentioned that before, so I assume
> this is on purpose.

Thank you for the feedback. I'll address both issues in v10:

1. Fix the indentation alignment in the switch case
2. CC linux-hwmon@vger.kernel.org on all patches in the series

I apologize for the oversight, this wasn't intentional, but rather due to 
my automated CC generation only considering per-patch maintainers.

For v10, I'll ensure all the devicetree and hwmon maintainer lists are 
included on all patches so you can see the complete series.

Best Regards,
Brian Chiang

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
