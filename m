Return-Path: <SRS0=HnHo=DJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86DDFC4363D
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 21:38:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B95206DC
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2020 21:38:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPx0VjoD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="lsQYj1Lm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B95206DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=DInxwhGB7q7qEMNfyVsQPcmFdzmD4UOE6OgQKfcA2S0=; b=dPx0VjoDQXJJ2RAG1OKRj3QSX
	QeHA10MKUsVJmHHWlmQ3FrQpCPePyeOymJcZqJaHx5nT5687Ngby5a3kIouE19oyPxWHf3ea8QlQZ
	8Ts9DSt4w4HlJdI18DQtiGLJ1F5IHMnwYQ7XEGHj9w0UbB2emyiFtd1m9GIHu0D0y7/5gDB+e50sV
	jErk00xLDPRNEUB8tgpDcsUbac40tVM94/U8a1yLLHVwW95nqjw/kZLCSOYlNk2/2ErNGHgAj4q+E
	OBCApdijBPJecRcuuwTSF6Pg3W2AftZBXW9BkT537/Xh8zUTP21gHdHsFnZAweyyKR5QDYxBt9Sd6
	KP0JKfS3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOSkw-0003Vy-K2; Fri, 02 Oct 2020 21:38:22 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOSkt-0003UB-AI
 for linux-riscv@lists.infradead.org; Fri, 02 Oct 2020 21:38:20 +0000
Received: by mail-pf1-x442.google.com with SMTP id x22so2214547pfo.12
 for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2020 14:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BkeyaNc379+rmFlMxKoqdtmCXLr04UwoNjZDGrW9WDQ=;
 b=lsQYj1LmYSATIcKw7t6GatdByUeYFi5qTGn4f786FZZeCAMKp7N1ihGZCBSlR1VWSM
 btHAOWptJmuBoCYFE4OqvK1a39O6Uk5TGn/Q4An6wKsPNWkijA4bNTPTURIeRgrbt7NY
 jLfNbrD4VUdNSslW+ZY6lP0urGwBuZU6dxbJo/PMRnnLDxL5+Nu8tQMje/CgGylP4odT
 DDX24g8Ij/oip1bsh+sqZJDWYOTugXsBPqLdRmVOCjnb2vV475HK48ybKMjncwNWKzIg
 zhgV3zLaW1yIh5TVzp+G65itIv3YB2oFDuGY+hfDre1caw1GjT9LCEx3nFtTCrQvlTqv
 7Wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BkeyaNc379+rmFlMxKoqdtmCXLr04UwoNjZDGrW9WDQ=;
 b=q51J1udjda0NjVi+es/O0bW4uKFZZEyNsNN2Zd5WMKSTFCHnYqHHLVByDHEeuFC2JX
 sxkMmOeAAFD0snotTV6YmKxkQJzJCszm0XUCUpAUrHYrxzAi5xIys+tCYesOVschLoOH
 r7+IjfF5wusCP3EAXF/P6pAPFbkixv9SSq2KcptPLwNOWkimnXr/jSFhgyUgRC5DZwD3
 1xELpLKiItcyCEpGQNHWBeSU7u3vJViXeCgiLSjBLvps66hnMmQvIb7SxsbAu5MnF7+F
 gddO5KBFDFA4uNis0cthDmY9A7/11QtZiNXjxONLYed28+/5TrmsvXfw1FgGU1rH6Y7A
 dwlQ==
X-Gm-Message-State: AOAM533BWR1LYHieQeNlFWN0lsNJEZYUFG+W4DRTW5OmU3AjugQDzItm
 svZpT7XPYc4sYp46zp3327ctmg==
X-Google-Smtp-Source: ABdhPJw62mh5fmOWbiRdQymV1NGzb23R7SDPtopMC0852HpRC8jYwfUpY38HlP84dOHcD233rrlf3g==
X-Received: by 2002:a62:52ce:0:b029:13e:50c8:499b with SMTP id
 g197-20020a6252ce0000b029013e50c8499bmr4829715pfb.14.1601674697178; 
 Fri, 02 Oct 2020 14:38:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id n125sm3064404pfn.185.2020.10.02.14.38.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 14:38:16 -0700 (PDT)
Date: Fri, 02 Oct 2020 14:38:16 -0700 (PDT)
X-Google-Original-Date: Fri, 02 Oct 2020 14:38:14 PDT (-0700)
Subject: Re: [PATCH v8 0/7] Add UEFI support for RISC-V
In-Reply-To: <20200917223716.2300238-1-atish.patra@wdc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Atish Patra <Atish.Patra@wdc.com>
Message-ID: <mhng-12da283b-ad4d-4a55-9196-ccd91ca08c8b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_173819_375057_1CB97429 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-efi@vger.kernel.org, Atish Patra <Atish.Patra@wdc.com>,
 nivedita@alum.mit.edu, maxim.uvarov@linaro.org,
 Alistair Francis <Alistair.Francis@wdc.com>, zong.li@sifive.com,
 linux-riscv@lists.infradead.org, mingo@kernel.org, masahiroy@kernel.org,
 michal.simek@xilinx.com, ardb@kernel.org, greentime.hu@sifive.com, bp@suse.de,
 aou@eecs.berkeley.edu, keescook@chromium.org, hca@linux.ibm.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 Anup Patel <Anup.Patel@wdc.com>, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, akpm@linux-foundation.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 17 Sep 2020 15:37:09 PDT (-0700), Atish Patra wrote:
> This series adds UEFI support for RISC-V.

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
