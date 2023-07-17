Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD8DEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=a2aH3/yEyh0TARk4LYXfhm6qj3Htsng7+QqAVuIMM00=; b=k8xrkuWavPO1HS4owi0IinXwSR
	VdBYDMx5cSrjn5+2XDQUe8mLpjhvMFXvJaWnHx9xkVeAsa0fvqQz39yMt2TaAFkhIJ7Ozg/6Ac9kL
	fkdD2CTjZ/c/U9O8FXFMkjYxXwSI17gKkxodN8MItcSew/+b74yQKFtdiNyyq8g0dVXyEzCjqdxVY
	v2frEDMCJM0W44WP+saSc1rznCYl+d+c3wiPuzSwbGRUgvFD/RkW6revQYkgh5RXaxCD7gJIGMbOy
	ql4tUDDKZQC5XZkndrnkXOwpAAwz5Zsg6Kkw8U8jgKjL5q0pSR7iw9jg5aNDw6q653YxtcNpMknfG
	PH8drRbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0VZ-005eLM-10;
	Wed, 19 Jul 2023 06:17:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0VX-005eJz-2i
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=SD4BjHPOaPvPr1/ZZH1VcvVcxozEk2rDCyg0WbaFdM0=; b=eu20WfCje8nGEnoWkYBiThjIiK
	nX06tr1Bftoy82xcrZ6pJVD6kuodnLJHECQuGpIjzsJukZZflBl9H+LM4RviBr5QaWB30fztFUDQ0
	LO5cfhqUwd3AMIk9EFolKvsaiot6E3fdOfrgDjEBeSxep6ePUyIREpl8gMuwdadYiKO4CSseX0Ofx
	cGLOC6DPcq3LH9vjzb+zYm0WC70nwLi/acI1qmcNBJPj6lIcB1Smz3Dq+cHe/vNPjwxDnTvtjtjo9
	B93Rh5d6apAaNcMkPhwS1yhV8FLNMykZ7qc80IEsISLmfb3pq+kZycHIUiDTgjnecILrWM6cifZGk
	6E+LN7og==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLWaA-009Q1E-0q
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 22:21:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b8ad356f03so29584125ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 17 Jul 2023 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1689632319; x=1692224319;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD4BjHPOaPvPr1/ZZH1VcvVcxozEk2rDCyg0WbaFdM0=;
        b=P0WF1YT6TGsaFEWgqBv08ewKB8xwEdZEg9JMzMUhxhccMCQlWJs1RPXBugo1l1Esgm
         zMCTrtGFsH/6BeNxOi2NdkagZL+pA/5SN1tyaeEa80JAJJzox3X8lSAOc2SMELKc8lof
         EWX26II4ftWwgh+tTplHKpcvu1sC2BvPy7y2S2dIarEt2Ego0gqe86sjQ9hzyqxKvq+y
         eR/t0BkAYuh7i60QIRSavSMy6NKTlhTG3aJ7oJ0msPnN8sM2ILPEHWJh0K4O17c633WQ
         0QSJPKzlL6Ac9lud4HV8a7xJlYXP2iRGp3FqvZ/+hcehErVk5Z1prOYhSuc4pPKDi/ht
         oJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689632319; x=1692224319;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SD4BjHPOaPvPr1/ZZH1VcvVcxozEk2rDCyg0WbaFdM0=;
        b=iIjyKJrw0H+IlPxEn4DU+iV5kYEM0Cbpy3IqsnqVScczXxMXnKjici0EgGd71Sr9LG
         W7wm7BNfTdeO/+UFYIjv9K80KBLMZjkpMxMx+4Fq4BwUWYl0qMf70lzPLj9oZJJc2T+V
         0jxgIMtYdMZ5Gt10FvRXhgzXJWSt2ylk36lEe3MgLAMklbTwr+31kNB7OFnEBkVeKYk/
         3odxHIRT95DCRiNo5qszd/efnXnNCmkgmz4q/1d50j4MGXZxf8f1/TpdzQS6al0pvIR0
         gnfRW75dmTNe41vYJ2TZeJD2B3zN5t9a6V2I5CKDyivBfMTUOKJIxih0rPvORbGjO9ER
         6KrQ==
X-Gm-Message-State: ABy/qLYg9yeOCrit8OWPo91LQfHLNQXp8Q6+MUytHVknVI3NmHpWqJmS
	SaDdmdaI0bMdvEsd8/jcwsk7Tg==
X-Google-Smtp-Source: APBJJlFCoJLDAUxqFw0dB+P8rAgMXcfpmuYuSibNfv2fY+vaqMAXJSMIot/x+H9QjSqYhbia0z9zzA==
X-Received: by 2002:a17:902:ab8e:b0:1b8:30d8:bc45 with SMTP id f14-20020a170902ab8e00b001b830d8bc45mr9837542plr.47.1689632318070;
        Mon, 17 Jul 2023 15:18:38 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:1b01:c1c0:7ab6:977d:bcfe])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c11100b001b80d411e5bsm329926pli.253.2023.07.17.15.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 15:18:37 -0700 (PDT)
Date: Mon, 17 Jul 2023 15:18:37 -0700 (PDT)
X-Google-Original-Date: Mon, 17 Jul 2023 15:17:49 PDT (-0700)
Subject: Re: [PATCH 0/2] gpio: sifive: Module support
In-Reply-To: <20230717205357.2779473-1-samuel.holland@sifive.com>
CC: linus.walleij@linaro.org, brgl@bgdev.pl, andy@kernel.org, robh+dt@kernel.org,
  frowand.list@gmail.com, samuel.holland@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>,
  devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-af1916da-8846-4b63-a3c9-4bc3a50c0646@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_232046_606845_E247BCC7 
X-CRM114-Status: GOOD (  13.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 17 Jul 2023 13:53:55 PDT (-0700), samuel.holland@sifive.com wrote:
> With of_irq_count() exported, the SiFive GPIO driver can be built as a
> module. This helps to minimize the size of a multiplatform kernel, and
> is required by some downstream distributions (Android GKI).
>
>
> Samuel Holland (2):
>   of/irq: Export of_irq_count()
>   gpio: sifive: Allow building the driver as a module
>
>  drivers/gpio/Kconfig       | 2 +-
>  drivers/gpio/gpio-sifive.c | 4 +++-
>  drivers/of/irq.c           | 1 +
>  3 files changed, 5 insertions(+), 2 deletions(-)

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I guess we probably should have just done that the first time around?  
Either way it seems reasonable to me, aside from sorting out the OF 
stuff.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
