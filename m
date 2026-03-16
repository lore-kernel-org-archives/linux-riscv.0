Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F24F506C1
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gso68CIGviKpmt6eTmKnHvN9mg7aD7CFKv4t0ha5QmQ=; b=AlKQphnSVZsr6l
	dpqWH8hb4g9dolcfyJCkWqaZPGsxwEm5t8KfHLAy8sMM33+Bi2RpOVpxNOP4IT2u2GBfhoiGia5QJ
	78xsYV+DkQwPiLvwLJmyAyk9oC+386Ms7GhqUZ8q37QDjJdbz5gudvaub6WMKWwzhndEQWNEnGKsP
	bKEQYPsQQM4fP6eOlE0GPBOarQFy1VIV+tEwLM6gYZHW+DCdGrJV01FNsJUZOu2Hs2f008yqlC8VU
	MV3gDcrR+m0VR+sM5u5vlnpEgGA98KzaSwW0hmYxhH0UCRzwYqlK/+GcYgFkrz6fyIlkLOGiWyRTY
	XYDQfi57A9U14AxiNqJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27Db-00000003yGw-0x7J;
	Mon, 16 Mar 2026 12:38:47 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w27DY-00000003yGZ-2yJD
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 12:38:45 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-89a1347051aso71361896d6.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 05:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773664723; x=1774269523; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBvUzLH0uz26jQRAjkurWhWn8KmiumiD3Cbz8sGkBMI=;
        b=Xmis3GCYu2zBdIFw2I6SHbKKIuH7PHw3nBQEXhF7Z+N//B70sh1ai6hccIh2JZXoiO
         H1XDBJDMotD7ODdoQeRchk45Q8s/h3cMdTWfehcH81FZeGi9fv3pFM1EIwvJHN74Kz1h
         v6Uy7wTVcvB8zaqgf7mOFzTrexo5hyDgRU4mk3swQtCnkwGW31ot2VEz73mfh0HW5FzG
         h5acVn4dDv5r8Z3zrU0lQm77SflI0tuaRweicM5G+zkdTpZmddqC4GesnwrhW1FUSoCx
         tquJ0Mz7L6I5jtmd2JybDsrH+tPCB0F+tPsbtbFPirgP9b8I+otBNGJu1mS2zOa392Wh
         rm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773664723; x=1774269523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBvUzLH0uz26jQRAjkurWhWn8KmiumiD3Cbz8sGkBMI=;
        b=CCgUphGpb8CteeJzM1339PJnI/Pbbp9eTO5V9f86cGxW3NyFzoUGMnCeBj2T0stZpd
         X0XR1LhHuLEp/waNdDCG9ibt1F7LBswcG+1Ru8bTYuWlvALQ3dmcZn1AAZ/I8rTLjDeJ
         NZoC0CZXKG1qQHBqtRUKkqBN68YBKtYi2+EXCl94jCnh8+E+FSrhem8Fh4Ie2Jx6d9I2
         0lQaGkDsk9+lOn16BdfkUbh80EevJSOpTpxCmkYL5sQwvnY74+3uOk4e/CUItFG5J59L
         pApYdhMCs8WbGJSL67zqSuZqFaU6eTBhGhTUuE9HnuTAQBGFmCCPenVQ8nTzQTbw4Z72
         VFDA==
X-Forwarded-Encrypted: i=1; AJvYcCU4jfW5oEmfX+GLCSLUEoFD9y3mHyAwYVxYpdHipMkXI3Np2N6ST3J/R2UXUL00rdAyAeiGrDvO0Ny9pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwF6YQOGJ2Xiu6NeAfKyCcyucy2ONPf6j3KV2mFDnm1AOF+orIb
	yW87b12zuMFQJDIP7rhCRTAEgBV9v2sz2w/qYN+nLwnohddJD+vilP+7
X-Gm-Gg: ATEYQzxyudQgqpCDpa8xcre+shbFTUx41DnNUo1dLyBLiSbOwjPZw53Txp0cjndmcUg
	0nWNxI3TeQtD4I256RTqJgSRtl6+H+Arm3/MIWltNOvqnXd2os706Qd46ChQW3MU3AZ6fP4a/a7
	JysoTnylayPN7pbRoKFX+xzpMDDcWvpzPmeGIZ0zrMsgU/Ktkf0owww1KbOpGZeT3xjZyz7zl2O
	rQClI+pwHMehILykltCASikLnNXovwhlrtbl1pNJ1zcOiOW7cmY/p0Qr+JPD5A3s0UXSihhYhHv
	qCHogjvs2FMeBJDtaVXG019dboZjrn1lHBSxvKwQDv9cL9CRu1vpY6RZp5zV6MzkPgC848jdRGj
	I2V97r19N2Z0uvDS48rVLawvmI06At+c7ycT3Ev8mDIHPHHgR3lrQB34AnUiQPFY50sxVhkFkt6
	4KJ2Dg+nhpsJl3yAiwrZYenSAj0s+fFvId/kUfnLOiNylDwfPKacITbKIk
X-Received: by 2002:a05:6214:300f:b0:89a:1bd:233 with SMTP id 6a1803df08f44-89a81d4518fmr193199906d6.1.1773664723207;
        Mon, 16 Mar 2026 05:38:43 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d0a7b6sm121853296d6.44.2026.03.16.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:38:42 -0700 (PDT)
Date: Mon, 16 Mar 2026 08:38:40 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com, inochiama@gmail.com,
	paul.walmsley@sifive.com, samuel.holland@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/5] arm64: dts: sophgo: add initial Milk-V Duo S
 board support
Message-ID: <abf50DaYQCmrx_BG@sleek>
References: <20251029001052.36774-1-josh.milas@gmail.com>
 <20251029001052.36774-3-josh.milas@gmail.com>
 <4b1b2580-63ce-4ce8-b4a9-1763d3d3a253@rootcommit.com>
 <6e4bf564-07e9-44a3-a18f-69bc716ca575@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e4bf564-07e9-44a3-a18f-69bc716ca575@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_053844_751777_4BC17519 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

Hi Michael,

Not sure what is going on with your eth or i2c as I donyt see those errors,
let me try testing the riscv side as I have been running most of my tests
on the arm64 side and have not run the riscv tests in a bit.

I used pins 3/5 for i2c4 using `i2cdetect -y -a -r 4`. It seems the docs
might have SDA and SCL reversed, unless my i2c test device has it
backwards I have SCL connected to pin 3 and SDA connected to pin 5.

I am using an SD card variant and have not touched emmc myself.

Take care,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
