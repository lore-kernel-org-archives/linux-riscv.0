Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0265DCCF9E9
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 21:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kv5aYaWFqPEn5Fur9uZqZZkbofpaTn85UiKcqVWXQv0=; b=P0l8I40fYNzuq5
	jT2G3v/FK8PzpKttyRtIyaybkKWpZgO64yBSnrySJXkCDyDJ/kHV1goRWzV6r+cT/Bv6uQjdBSdlp
	3xdlyEib2US8JUqroYEIl2Otjuaccl4moIhYijBluKi8yLCcifBpE2EWzeRAlllatwsM+5ngORH3m
	KXse4glUil6nm/ANS55ofbS9PUF3+lH+nG+bxr0a3iFq6tvtme2Va8/UPQBH9dkeu7q15IAw9qP2O
	xVJQKTwpkMzrDUsyvu1UWx+SrVeflP+r8I6kgDZB73zyyP26byBvp8ewnvoT98fAXNfB9BHyrRgZZ
	DBpe9nDRuK0iLM84n3bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8Om-0000000Clej-3JlQ;
	Sun, 26 Oct 2025 21:35:36 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD8Ok-0000000CleC-1tCP
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 21:35:35 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-88e51cf965dso581216585a.2
        for <linux-riscv@lists.infradead.org>; Sun, 26 Oct 2025 14:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761514533; x=1762119333; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NYDZOsinQgPFYXjckA1jriCx2zkd+8vOIx52Ygv9OCQ=;
        b=Gw/QkCOBo1OFpFvJrPYR8F69fASCj3/TfQ4whWGQxzlnQsijqOBAXBi1uKifWl5zRu
         ++k/A5tK9P11STwpalzo5TMGQSD/E2xxNSRC0yaHYRHpI4c/gnhCpON3QVL8ktZV8c/Q
         i4vNkOipAldnPSkFqqty9n7YYWi4rWBR7aidk8BtSqbJPOFcb1HyQH4dGNGfD1uuS1Be
         7QDlCSKAEiAGkDOS2wCSdyhOBibj9YsrNxF5O1UXFkp9eFUzj0R8RW/K7TOAVPl+ZrqU
         3QCyoN5Gj5ZoYAzurBJoyeoPB+iaUZS2l/FXr+ScpN+/oyPYHa3rGhfEyQ2EVSRGckO2
         ykXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761514533; x=1762119333;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYDZOsinQgPFYXjckA1jriCx2zkd+8vOIx52Ygv9OCQ=;
        b=tVWDPsRo7LTzx0+PI0ktFFYl4pOvY1uturS4XfjcLk/yPgCQMWbEYC2GiRs4ANUABK
         n2sK6mCwOfuhj3b4zIy+osr3FuYHiFKGUznaKYXY0zM+7sPoOzD7iVP41Ui8m/TcP1xb
         Y1YqodzM8TVkQV0TrR2plyGlpT/7xVKfT3KOGcVFDAL791AgkqGz+SBC8qgDBU2c4Zbl
         yIxfALaiFtR1QOzbOFxHJ3eTsIC3ShryWWxi3Ftgwq4mDyhbN2ME+bFF7y0Lfxq6gRDg
         TFT01FtATZZReFY6Eeku6oXC3Sz9dlVqChtFtUJTvUrW91HoYydCKvaxbBoH9Qz5eQ8A
         lHQg==
X-Forwarded-Encrypted: i=1; AJvYcCX79YjAvSfBpTgR1xbYH1M0KG4oJzi/wfFEWyo/0SKi+pVvt5CNLJ8J2vv/bbxOzOqHGfo4vFXecqzr0w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVLvQ7yq7iFIB2ugWMYSxLdVYnApdd+f7ruCnPJDf6U4+gqGfa
	92X4ENwPidUfQP1hk25c2neKrewjkPa3ns2aOHU4vjpVYR3Rp+FxE+RZ
X-Gm-Gg: ASbGncvtQtvxjESpWoUZxNraRLr6qToVmZoidoAYdJQWnCTdwAsQpgA4icazGE4QG0V
	H8eHB3+bkdhNb+hhKa+DVcXFuCdtRslKCFEVAWlEniNmf0xc0rQTyJEg9HixL21YnH/raIGtxb+
	MJit4h5c2ybeE37/gGJO/b9neLxKTw3ec49xL568uyr01+7nE7I5F4l2G4H0+ZlwcPe9fHiOvPp
	uBrg7JptujzJM8LxnDy8HuENqOXg+0srVUG7N/qKxpQU79k25MImGREo/1VDAEW0/D9GSi1PSjq
	1JepFHgop5A0LPnx0dsQfHV3C/wB4MDP8uJ0cVv2o9M9IVkj1H2TTgbV0pms2744stknSUjames
	lJ9xncwd+ZB0vV9TsZ21P7QgkwbGhxxvDmLeveKKKAomDTMw9y7xLIv4kF8btToscMSUpDIcWGc
	mSxvHqK3Q5uCx3L/ctj/FUPEA/tdr1IAYBVwQDmsdGZE/y
X-Google-Smtp-Source: AGHT+IHt/luqZvANRgRcr2vtzwDE+8CzdHe1TEyhm26Gx0eGps4kw0K7r0eBfcuENU03yCMR5zjOaA==
X-Received: by 2002:a05:620a:a1d3:20b0:8a3:52f5:3533 with SMTP id af79cd13be357-8a352f5383amr171252385a.58.1761514532909;
        Sun, 26 Oct 2025 14:35:32 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f2607f05csm414685685a.53.2025.10.26.14.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 14:35:32 -0700 (PDT)
Date: Sun, 26 Oct 2025 17:35:32 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aP6UJFPP-ReYPzmq@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
 <aOqtt7BDXxItrs7W@sleek>
 <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bsol3uim4brrrsdmvuk6f3uzampbki2pyhziap6x4rw7txl435@rwoxrnctkf3y>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_143534_492971_79D8E8A3 
X-CRM114-Status: UNSURE (   7.67  )
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

Inochi,

Thanks for pointing me twards duo-pinmux. I was able to use it to get
the default config which is uart0, spi3, and i2c4. I can change the
dts to match, but...

> I suggest enabling devices that are accessed by default

Would we rather enable anything that can be accessed by the pinmux?

Thanks,
- Joshua Milas


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
