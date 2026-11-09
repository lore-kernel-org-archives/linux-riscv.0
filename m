Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697BC6083603
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 15:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MQ8PCkSl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FeL5KHII
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=YDq3Cb+ZVU/77X0kakH98749BAEPzoZBvsW8zBtRp8s=; b=MQ8PCkSl7oYJlq+s8Zci02J4jM
	239kxz9wMENQSSsXNaiRV7SBK2MqnrhPMvgBmbo1UxE6I3uY0pYrtFlY7YevAfdV4VAnH5ZzDBz5G
	haStAoLYRB2ExeEgUSYrcC/gj2q/KEkbc/rgovcj13sgnJxRCFJ8J6jJU6JEe7MlwU6SxDdi5pgXi
	cImq1H1ga8o/6Y/QKVU0JFSNfaccIxXvHNO1TAWrUqWMTTGX5HY5zihNciib+BkSzct7M8y9JKvgL
	2Dby2EUb2Ar2xXpGLR3rnW7Btnlzz5vz2DF1cXrHxa1xMuzaxRHx4HT84QBUkhOBSs88pR69Sn6rt
	QIgsVyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYW-0000000140v-1tFe;
	Mon, 09 Nov 2026 15:45:13 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRYP-000000013xz-3L5U
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 15:45:10 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1689788eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 07:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794239103; cv=none;
        d=google.com; s=arc-20260327;
        b=kstkglD5g2YOe9ema1zrABHbFKCR9PbtYV8YDlN/IQBir50MBA6OwE92Oj9x13gBd0
         Bb5UWDiPhQkrbxqY22QsD6areSYHBrejWgfhORppKYo7h5KscBzWcPMYGKZynP0Uq7zm
         kDAHeB44zUMmnyRc4uS6WkcNQEtYPoMvRCM03nsb46jT06DLfxE80b23CmIs3cp3kLam
         +/36mfzC8AxMy972ML72DEUnIJIWZFJ4Al5yMeJJ8EoL3ru4mFrKc3mvYtfgWHexif8F
         Arg/LAvTAegOP98Iz76JAIF/QygXXl61rru0Z6Omuys4SnNXT3e+tweO1OchyAkXN3nQ
         6nrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        fh=KkfIPgkvWbzuNllNGcVB8VkJQZb1plm89F4K0ZxYwDo=;
        b=KcHe/XiTHuMhbz4YLwdfhxjsJGTNQtaEI1fMrLOjpgiazGQ62oz9qz0CC8Ms3WYzwk
         8w3RmedDoqlUl1Js+b2uT/eX+qLHcGewSKtHv42XH5IMq5mRxlUXvSN2CXJSm367DeWX
         TKVN1BdTB2PbLr1fJB5QLPQkH+pAClDW6pFG8XXHOo9WbMqqzGyel0vMjKMM4QlDktvr
         9six9/vr8n3uEvm1EWqvxDN6uPl0VUEexcuW699nteowONmG/MP3EapAi5IkoR1tiiWt
         01Vi5rTD7kk+9Ag/oSkge3RGp0hFP+k1aCUC0DIUQWQvSQguU5HjTApe/JgYk1as5o8i
         YAtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794239103; x=1794843903; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        b=FeL5KHII7NBIUpS1hEhs+DXASDx7NL297bkJ5dkZZ7vREZaVXAZGEVK/5kCAcMhWqQ
         nUOJlJB6qlj+rBB15ZTmwWnbSHKDa7EG6ChWgp2Jd/bZtMTbet+o3Wj+uC2c+9ZGnhTg
         EQ/FT+RCibueJnhWP0Yrq1RpX0RZ2gAmDLnMd3es3K5rUDenIWhPAtD9kLfpSACW9OsM
         OquQwakwlN1CNMhLK6s4cJv6Rq/DO98Y9MNLfXQWMiJGv0SHAVCViyWoMT+A9n1V2+59
         0F6O2KL4cd+GOObDEl30K9te44ahBzSK/58jpRreOlbHZ1buSXTqFgpy8UPp42EXkJnO
         Tkxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794239103; x=1794843903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ctMZmsxVPHwk1efT7mcbMQI5sey2JS1SJlSmKpoSEmA=;
        b=OFsnNGOnSQSSr6V6hYqhxXuEhVxM25GL2N3vUlOSCXVwp/dR4EfhqiccQ33/cB4CTg
         F4q1kffZU+dprW6V46S0WwB7KnvjpD6lLUDBe0WjW5aV1Sqn9rK8gTHgpD2FQC2TISgI
         g/bw0cJGd870RbEuEyU+pSlQPIOE8AzYj4y9ZDb1om+zdx2Mxh6mGibDkIfrzREBSWNH
         dUhEWjGyGv53p1S2dvlqCTUz8lWJr/NeFCi7cGPxZiNDgYORNmhLRkDBqehqiiAPwQWz
         +wUvbMldGk9yxqwjR9r5SSar2sQo3XOu5h+76eDoKJHeS/JHZDtMOLCaJAgRDe32QINk
         8jvw==
X-Forwarded-Encrypted: i=1; AL+hErH/2ucebBhzpE9FP/lkRuigpF9WKwUww/tDWbo/KISa7b0ocazUQNDrLWYY8WLFNMYA4/g/t9nP880wPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/fWfytfOiLFB9dEUcY2U8PU/h3XxytmwY57RH/fi3t+5RjAznL
	64Ye8FOym084aKd5YmbqGAyzjZ1dUdBNz+LpIHJjBQpEKt++aoLBhXo1hm3gwkac7FsKnIAEfeJ
	tJXc76ISE1jypXB5C+zW34JHxR79ul78=
X-Gm-Gg: AYBFou2U4kkXx79ernmDmm2k+5QTOXlIbX0cjDTZFe1gfeVo4PRmlWRU6lhRKBDAf7+
	aLaURks5nKRglBg3G4GzpVZC3/YUwXsI2MNrF9snSYztX90X7UQkQvM5kM1c5i6uJZ7Ok68N+Mo
	xiHNYSRaFuf8pnHo72tgtLMkwNrwAQTTJ5ozEGYWmGUHL92VzL+sX6uoQ4/QXU2yv6GyLPhGHE2
	YUgtfltVHVmR2ecHvmsAJ1cCte7ucgkLMvORRPNREAwuh50cJLTeub7Yl22ch5bY5pp9cSJ1rLj
	3vE5omV7pl2G4OAdeR+JcFcnGD7tyzQLdA6JSmPp3HRb1GHwuEo4/i1+Yg5AO0znRI2nOb0DyNj
	vrXkGIpHVFmD02qlX9GI+og3cHsNGMEcMp6FH3A==
X-Received: by 2002:a05:7301:7004:b0:36c:9b35:5d46 with SMTP id
 5a478bee46e88-372571d9ac9mr8099191eec.26.1794239102976; Mon, 09 Nov 2026
 07:45:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108212826.15890-1-oo.hehir@gmail.com> <20261108212826.15890-3-oo.hehir@gmail.com>
 <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
In-Reply-To: <ff0906c3-478e-4ad6-ac30-1e0a7cc35a41@freeshell.de>
From: "Owen O'Hehir" <oo.hehir@gmail.com>
Date: Mon, 9 Nov 2026 15:44:25 +0000
X-Gm-Features: AclHuK-AhO-ARD3koIln2PIQIf1KmWM7RSd3LNIFnaM6Tz5301_ColSop3oW-YQ
Message-ID: <CALp3LZ61ZYcWz8CPQZJbJSDfAt7cgyyqA_bp+Gwhyr2peBVwKA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] rtc: Add StarFive JH7110 RTC driver
To: E Shattow <e@freeshell.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Hal Feng <hal.feng@starfivetech.com>, "ziv.xu" <ziv.xu@starfivetech.com>, 
	Conor Dooley <conor@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074506_649362_C63D5DE6 
X-CRM114-Status: GOOD (  18.19  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi E,

Thanks for the review.

> Is this copyrighted work from previous year 2021 being imported without
> modification?
>
> If there is modification then I would assume it needs appended your
> authorship and the current year 2026.

It is modified, so v3 adds my copyright line below StarFive's.

> Align 8-char tab stops per Linux coding style, and then tidy up the
> extra junk clearspace on some of the defines

The values line up in the file; in the patch the leading '+' pushes a
few of them (TIME, DATE, CFG_HOUR_24H, SW_CAL_VALUE, EVENT_UPDATE) one
tab out. The extra space before some names marks them as bit fields of
the register above; as it reads as noise, v3 drops it.

> I note that JH7100 does not mention RTC in its datasheet. Does JH7110
> RTC have any commonality with JHB100 and if so then would rtc-starfive
> be a more suitable name for the code filename and module?

The JHB100 clock and reset bindings do name an RTC clock and reset,
under its Peripheral-2 clock and reset generator alongside CAN and
GMAC, whose inputs include no 32 kHz clock; the JH7110 RTC is in the
always-on domain. I searched for JHB100 documentation but found nothing
on its RTC beyond those names, so I cannot say whether the block is the
same. I would keep the jh7110 name, after the first SoC supported; if
the JHB100 turns out to use the same block, it can reuse the driver with
its own compatible. That is what the pending JHB100 TRNG series does
with jh7110-trng.c. I would appreciate advice from Hal or anyone who
knows whether the JHB100 RTC is the same IP.

> Review use of authorship macros as appropriate. This may be okay as-is.

The driver is derived from the StarFive one, so I kept its authors and
will leave these as they are.


Owen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
