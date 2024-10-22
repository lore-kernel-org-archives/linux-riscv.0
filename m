Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B55BD2CE0D
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CHef6b4h167qiGPDryOymNX5pVJUBGc6yrrwe473bnk=; b=HKqB5nK0AgTJSkaSdf/AEyCvRG
	YWNmLuqDo5iYKAYOyZj9QetlG9PJqrUfrAsUN4e8a0RNEV6h2OUF7v7tejhDHne/BRzwP13iKDnae
	THBceWoeKqimbbFkFWoeJJvC3i6ytoBt/fc0R05RfxI1fSyWZ4NHIIiwkRNK4gH0ROzP3a09Ih0WZ
	e0HxS8Zs8O4uzy3AWRK1iXgU4J1PF8vLXvCArSKGgptA6LlQmivwBkHP0duTfpTx/a/RDKOBK228X
	FZlglJW5/OU634LiJ5PDODF50SlzpYYlzOkCLrux4VNuKoeySN6kykenr1rjsBMxz6FHTCMY132rE
	JqKKT5tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3J13-0000000Bizh-320N;
	Tue, 22 Oct 2024 17:49:57 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Iqh-0000000BgUi-2ZbO
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 17:39:17 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 96FC73F18D
	for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 17:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1729618751;
	bh=gIp82CbtDDICzfhljA3RfNnMq4WLw57LTcEeK1RhMvg=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=DZjm3ev3T8lJpSVQb/o+TxLml4FINUXQ93RD7uCoIdF4rK+Eal2cawAG9+huSiT7y
	 /ppRODHs1xQIW9IzbyzXTUOLi34/1Nv6ntaoyjz/lj1kaQIz1L3uJZ2nKAfrhjRvEM
	 wnR/h8l263+JBOxKbFQQzrlHkjl7DCLaIftI0sCJSd6fkOvMCGs/vEZZEjQdyJSJeH
	 6gqPbBn73f031jnyafig91mrjMzCvpfp0PlMHaC4iWutbNgW+Z65aaVoa8t9+0ssLg
	 yQBF5dy+bh/s/VEMs8rEo0mUbBvF0eKJMJ/Q1nd23eYires3YLmAaHTzBVKMwamusk
	 Y5CBtNm9FAzyg==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-288b904d3d3so4278058fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 10:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618750; x=1730223550;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIp82CbtDDICzfhljA3RfNnMq4WLw57LTcEeK1RhMvg=;
        b=rTZgQO9no5I8Ie/jKBS6iu+gd6TBD+zVLJ3kpRMID3quAll12SyqOcLpWg8iDbgiYe
         tGL6FxTjUdmHYIJhAYPRt5lC3tJ18Q/M67o3Kp/bthMCS8/3Ox+AqF+M+E7ei/UkveYP
         saiukjfwHQ/y2Zeqz1S8L3alzUn44gFcIdR8Eb8LJ2M8CZxZYFhCpHST5jnVoaV/7l66
         qBCjG+CV/djxqQFmT/tkX6vq8pH/mOXPlbbxxtMmfbIQzQd8wqzyF7UT8OxHwkIesJuA
         OXBBKVKZSHwf4U8RdMJFEeCE7Chhrp6n3t7ZtBEbq/D8X6nsgBQAw7+bkQUOrwQEksZ4
         ZOlw==
X-Forwarded-Encrypted: i=1; AJvYcCVKwona3FKxUKnotrP0HirGW86bwXfJ7rbgYNpFDkQavhIz4TCtkgjvFw/2audhTSSpBYTjtABENhBnqw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw89rR6g83AEHKXyhxkiroRU5qeN8FdJ/NL7eNmJfbUQXibBegR
	raZhgwsLX01JkjkTuPf/T0jzwBF5nKFQNQaJIIEGYwpDOrvE63cQp2ZJkI6xUyPiBkWklHwhDGn
	+LXe9tLBlwTiW1evixuZMVIB29V6PAea+4fGxeCW7q4Cx589+/zVFeqy8MXk+2lkAMbI3OJe6YY
	KAtx6akUtO9EM1QmGxAiO3jsjAfmZDaGfGSutJ6udyjRWTFPxJojj1F9Kv
X-Received: by 2002:a05:6870:14d6:b0:270:184b:ccd9 with SMTP id 586e51a60fabf-28ccb63856fmr15125fac.39.1729618750418;
        Tue, 22 Oct 2024 10:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp2eOIro3rmG5TpkZ8Vs1zAmqxePU9Yf+aTCteWKwLEX1pSdHkee4wAR+DRJadUrVYphpsbkFcpqUY2k5VgeM=
X-Received: by 2002:a05:6870:14d6:b0:270:184b:ccd9 with SMTP id
 586e51a60fabf-28ccb63856fmr15106fac.39.1729618750027; Tue, 22 Oct 2024
 10:39:10 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Oct 2024 10:39:08 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241022061004.62812-1-e@freeshell.de>
References: <20241022061004.62812-1-e@freeshell.de>
Mime-Version: 1.0
Date: Tue, 22 Oct 2024 10:39:07 -0700
Message-ID: <CAJM55Z9ApObth8AD1gpNO0ppxUmvYW3m0q1dAyqekRhXwVxb9w@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: starfive: Update ethernet phy0 delay
 parameter values for Star64
To: E Shattow <e@freeshell.de>, Henry Bell <dmoo_dv@protonmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_103916_093811_D4ED9C99 
X-CRM114-Status: UNSURE (   6.34  )
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

E Shattow wrote:
> Improve function of Star64 bottom network port phy0 with updated delay values.
> Initial upstream patches supporting Star64 use the same vendor board support
> package parameters known to result in an unreliable bottom network port.
>
> Success acquiring DHCP lease and no dropped packets to ping LAN address:
> rx  900: tx 1500 1650 1800 1950
> rx  750: tx      1650 1800 1950
> rx  600: tx           1800 1950
> rx 1050: tx      1650 1800 1950
> rx 1200: tx 1500 1650 1800 1950
> rx 1350: tx 1500 1650 1800 1950
> rx 1500: tx 1500 1650 1800 1950
> rx 1650: tx 1500 1650 1800 1950
> rx 1800: tx 1500 1650 1800 1950
> rx 1900: tx                1950
> rx 1950: tx                1950
>
> Failure acquiring DHCP lease or many dropped packets:
> rx  450: tx                1500      1800 1950
> rx  600: tx      1200 1350      1650
> rx  750: tx           1350 1500
> rx  900: tx      1200 1350
> rx 1050: tx 1050 1200 1350 1500
> rx 1200: tx           1350
> rx 1350: tx           1350
> rx 1500: tx      1200 1350
> rx 1650: tx 1050 1200 1350
> rx 1800: tx 1050 1200 1350
> rx 1900: tx                1500 1650 1800
> rx 1950: tx      1200 1350
>
> Non-functional:
> rx    0: tx 0  150  300  450  600  750  900 1050 1200 1350 1500 1650 1800 1950
> rx  150: tx 0  150  300  450  600  750  900 1050 1200 1350 1500 1650 1800 1950
> rx  300: tx 0  150  300  450  600  750  900 1050 1200 1350 1500 1650 1800 1950
> rx  450: tx 0  150  300  450  600  750  900 1050 1200 1350      1650
> rx  600: tx 0  150  300  450  600  750  900 1050
> rx  750: tx 0  150  300  450  600  750  900 1050 1200
> rx  900: tx 0  150  300  450  600  750  900 1050
> rx 1050: tx 0  150  300  450  600  750  900
> rx 1200: tx 0  150  300  450  600  750  900 1050 1200
> rx 1350: tx 0  150  300  450  600  750  900 1050 1200
> rx 1500: tx 0  150  300  450  600  750  900 1050
> rx 1650: tx 0  150  300  450  600  750  900
> rx 1800: tx 0  150  300  450  600  750  900
> rx 1900: tx 0  150  300  450  600  750  900 1050 1200 1350
> rx 1950: tx 0  150  300  450  600  750  900 1050
>
> Selecting the median of all working rx delay values 1500 combined with tx delay
> values 1500, 1650, 1800, and 1950 only the tx delay value of 1950 (default) is
> reliable as tested in both Linux 6.11.2 and U-Boot v2024.10
>
> Signed-off-by: E Shattow <e@freeshell.de>

Thanks for working this out.

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
