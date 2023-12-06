Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B95C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 14:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7EjXCrYAixgiZ5frxk9CMSR2nt5bguGM2FMJNisJOw=; b=ePtuI2gALLcpog
	uh3NJQ65MdP0lNuwzsUkhkQIpw7wDSiOmDdLyD+HZkeg7rF3gcRXDgcYfxW4yXaUAUGuZnpS7SYPT
	O1IrJcKYP/a5cFa2T3+cef2v0Znx3uJK6BynCw57SiyT5m4CftRXuP1Bjcs85fMSSvjNaXvvRmHLb
	xW95V7IJt0kznWbixvxDO72QHFB6PItCt+YEXblAH28qHYnMScTem0rSP+odRrDXcYGDK8o+5qP4l
	WpPHswseCO8R4WtiNd1M0NJOxlz3Q5psOd5lhBaamsd2xzGUMlhMiRznjTE7gaQqSgkOwSX/Ft1Qb
	Jyll9ddV+CxxcvuswsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAscR-00AScM-13;
	Wed, 06 Dec 2023 14:11:19 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAscP-00ASbw-26
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 14:11:18 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50c0478f970so2313568e87.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 06:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701871873; x=1702476673; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XNzSYcIp8QiaOcjyvcNVi0Ch8I0a7jbAWmfX7Yhtpd0=;
        b=bQMpJR+ONdaQptlTtxpQXwm6R+K2H0Tt1Xomjqkvt/mCEwMEkK5WThspI6F7ryoasQ
         CE3P6/gjQRLLUBILzfeNZBCXsCDbW6GjBNhnm6JbJIw5b/bVr+D8aGE3PqCmPHejym1L
         M6mijeavWGMOa5fTrpFT4yda11oVeUVig9E5v7Eyl5odWY7nE6pyFJzVU08Be0gT1zsv
         3BKFsL4JYLI7PcaqKm+IVuTUolWbSnF4DNI+zPSgvBC1podxjSw6UH7tQZxb+elIiMzF
         5kEbyMlj4rNTUV7r4BvYYd8Y5eRAlwCvOhOIwksgmkTJhpPafH+o3fe4va4wVo4mULwA
         tMOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701871873; x=1702476673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNzSYcIp8QiaOcjyvcNVi0Ch8I0a7jbAWmfX7Yhtpd0=;
        b=Z3KU+hup/fAXqn+ae8dNuyL+wvPO8WLWYWFb5aqVhU4JfOarC+eukj57QFu8f+arD4
         TvsjvAv4SSn2FXM4e7lZZAPm0qFU81rvTEcUCC8C5eotNtkKeVpMSMKwYlnUrFbu8p2g
         Qr7Lv2q5LF8FElJC+3eWXv9gFoW11rUaWTsvR/Kp50YtaKUjNsF4NNdFiRYae2k1i4iK
         z8Fo7/ekhADd7Pq3BB1SpcTIt+UWtGSNUFcc/NDQkMuHt8O8sxZeUWtnRJDWfizpjXni
         VOrfurp3rF1oq/7hbOcrXNhfLZcpBwfI+TZIImocUMqxOwZ+FrgMmD7/2ai+AY/bC0JB
         fNDA==
X-Gm-Message-State: AOJu0YyE0v/1sSCxauSbX9N+jQQyRUE13AjRMD10QxkeM7ad2A2i7cIq
	Mx0NHMFwrEARJw0l3EjxG8Q=
X-Google-Smtp-Source: AGHT+IFr8mTzAYUk/xKHbWpYQfDpnWc+Vbj0Hs9YDHLul5k8eoZUKHHTYZrUliaLKJTpZbBsj2McDg==
X-Received: by 2002:ac2:4839:0:b0:50b:f82e:6d5a with SMTP id 25-20020ac24839000000b0050bf82e6d5amr580036lft.73.1701871872294;
        Wed, 06 Dec 2023 06:11:12 -0800 (PST)
Received: from andrea ([31.189.124.152])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7c0ca000000b0054cea9f91e9sm16557edp.20.2023.12.06.06.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:11:11 -0800 (PST)
Date: Wed, 6 Dec 2023 15:11:07 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mathieu.desnoyers@efficios.com, paulmck@kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	mmaas@google.com, hboehm@google.com, striker@us.ibm.com,
	charlie@rivosinc.com, rehn@rivosinc.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] membarrier: riscv: Provide core serializing command
Message-ID: <ZXCA+4WyI6D+Somy@andrea>
References: <ZWe+ljzCUQQVu7oD@andrea>
 <mhng-40f43849-e610-410b-92b5-7571838ce9f5@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-40f43849-e610-410b-92b5-7571838ce9f5@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_061117_729191_D46626E1 
X-CRM114-Status: UNSURE (   8.67  )
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

> I see
> 
> $ git grep "config MEMBARRIER" fab957c11efe2f405e08b9f0d080524bc2631428
> fab957c11efe2f405e08b9f0d080524bc2631428:init/Kconfig:config MEMBARRIER
> 
> so IMO this is just one of those forever bugs.  So I'd lean towards
> 
>    Fixes: fab957c11efe ("RISC-V: Atomic and Locking Code")

Works for me, will apply in v2.


> (or anything in that original patch set).  It's not that big of a backport,
> so I think it's safe enough?

Indeed, I think so.

The final version of this fix will likely depend on some machinery/code
introduced by 3ccfebedd8cf54 ("powerpc, membarrier: Skip memory barrier
in switch_mm()"); but, yes, nothing we can't safely adjust I think.

Thanks,
  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
