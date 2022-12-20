Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11F6C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 11:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6WhxaOPTliWkSjeOIZcVndwALCniWPbPdCFuT/zs9ag=; b=c2cWdLiNCPP9PE
	j2ucNRGmRxgbPMTYbBdVAeLh1Hg/esIhEkbczw3zC/azPHGCsr4N99KD/ielft38MLFn87htVHPH4
	5ae3VCU3n+VDHj2O9a9ZrhyCEObweBh5p9XtiS5jVwOD4y6ToGIruCgn+XakAvZQ9a7wA5CiXAfw1
	XltSyB3Ebh7hYfn8eBpUcZdowVqbEjCo8lfyhQgIzWOsSG5dZWY+Qo22ywvkg/dWBOO1uch0j7HgZ
	2lzwdhXJx+iXlZJMxKdFfPtuXmciBnIijF7JfUejnlfAMtS44zNZYfLjUtW9LPumHjm+pXUO+lu2e
	vUs/3pzsjstmTBRUs+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7bDc-00E9M9-RC; Tue, 20 Dec 2022 11:55:36 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7b7x-00E4rJ-Rj
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 11:49:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id n4so12034059plp.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 03:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYpfnq75eR301a9ZCpL6LLThVHDpnvJiz3jr8sFTlH4=;
        b=Lhx6JWqBieTtqKm0RNR6P5TTIu2+Rb090pv3h/gkNnKjsOyE3tOYrI1+WWM4a6zNIa
         V2JBspeMSB0Xtm/ySGkVE/BvSQ8793faJ6pmXkyol/HQoPYPw6pGjL8UUgoV/nPvA/yC
         Kp0y6Zyg0VZ6dHiXpJXGq3UmMPhsOdiWz5ldj59gziHCnZLf+EnBepmnCtbdKLrBajhu
         uqDbF1+jgOmjlR2LLDR+blJQYcU1PP08fmS9KgVawL3fRiReKYHG9YaO8GZ2aC351YrI
         BINhqDLdlOGpMECJ90g1PUIrhu2u+cQljxMGAHiibHeTtfYngWUAr9WlDw9Iorrtpa/A
         h3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYpfnq75eR301a9ZCpL6LLThVHDpnvJiz3jr8sFTlH4=;
        b=JclQM6WN1orKFZTlPJJyutWIj6YM0e9TNvI2Ad3wGchkuvbrgPDM5BgASoEW0g+fr9
         LOHlLszI91watiFxcJ3y/7+UB9H5oyPShFLijee+29W6MDreHm4lbHW1qubaKt4asqNH
         h8s1HmwZtNJOgoWMEsQNgDCnZ21KBCgMSJES0RuRszrVsosYm+XXfA7ONroCk4NFK+LC
         yT0t8kJxqnVjomn8mPKxIMPY0CVYRZXENDup02bB7q5fihuHv5a+Rl+gd52l14yHXCQ6
         zi3oKCoxiURHBdjMrsbfIGY6HEzIB5V5B8drJhzwHFtV4/3m/aDzm1iy5pm0u8oSE1SR
         Q5QQ==
X-Gm-Message-State: ANoB5pl6s55T/JNrs45EAJZyHqRDnBZEtbFmlsmBq+7fwX5BzJM1cxD4
	VbSPHa04vHLbYYAEPkAp2H8ZgvKO1pu6+amLo5l6G4yPzvNrwzybtw2SHVuJP9P18aejybxiwI4
	+hsuuRt06r83+SjdVSVeDwo8VkaWz6zjOEpmhl58rO7uguN+uX/xVVEwpW8ISj1RMIJqLhFogqo
	WK4u88kF3FMyBAQCD3WQ==
X-Google-Smtp-Source: AA0mqf6t+VDU/a6/fHVB7Ly32HgnMZVPV3kHQP1ROLNqMY4K/Bj4jKH5pqO7y9XWqoO5lMK2q5JRww==
X-Received: by 2002:a17:902:a38e:b0:189:76ef:a1b0 with SMTP id x14-20020a170902a38e00b0018976efa1b0mr47220992pla.57.1671536982595;
        Tue, 20 Dec 2022 03:49:42 -0800 (PST)
Received: from hsinchu36-syssw02.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l7-20020a170903244700b001894198d0ebsm9197930pls.24.2022.12.20.03.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 03:49:42 -0800 (PST)
From: Ruinland Tsai <ruinland.tsai@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: ruinland.tsai@sifive.com,
	greentime.hu@sifive.com,
	kito.cheng@sifive.com
Subject: [RFC PATCH 0/1] About adding new Z extensions in ISA realization
Date: Tue, 20 Dec 2022 12:02:35 +0000
Message-Id: <20221220120236.219804-1-ruinland.tsai@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_034946_027693_C9F0452E 
X-CRM114-Status: UNSURE (   8.19  )
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

Dear all,
I am wondering about what is the policy on adding new multilettered
extensions into the ISA realization mechanism ?

Currently we have plenty ratified exntensions left un-added, and some
of them are already being used frequently, such as the B extension
family - - namely, the zba, zbb, zbc, and zbs.

Being unsure about whether I have done it in the right way, hence I
wrote this RFC for adding those extensions.

Also, just as I have inquired on the list before, what about the vendor
extensions ? If a vendor wants to submit a vendor extensions without
reavealing the detailed sepcs, what will be examined ?

Cordially yours,
Ruinland

Ruinland Tsai (1):
  arch/riscv : Add support for Zba/Zbb/Zbc/Zbs ext in ISA realization

 arch/riscv/Kconfig             | 24 ++++++++++++++++++++++++
 arch/riscv/Makefile            |  6 ++++++
 arch/riscv/include/asm/hwcap.h |  4 ++++
 arch/riscv/kernel/cpu.c        |  4 ++++
 arch/riscv/kernel/cpufeature.c |  4 ++++
 5 files changed, 42 insertions(+)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
