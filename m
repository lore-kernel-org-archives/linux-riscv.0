Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B737FEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 23:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4M33U5tzErXjxoVIt6E2YdFWA6ZQhqmxgbTXuMcdE54=; b=22H9QytJfFgjMlfDC26JPDtfDh
	gnkGUXG1vf3D0dL4tnsfaRaLGJ6e1UITHqQLA76Hvk62c/0mJM/cLWI6LhMeTyyELmwsQ/fAeSkcu
	Vi6Ji669BeKexQk0mO14LNnkOL34icAD4VuBAz2CUMY1Hf3ijIVzjPuFtpI06T5gi4aGo9x9zrVjD
	8Sh4BTbR6EzYef620JR9WbWKMY1hvDSVkgfMMDLWpimtrMA1anJlUbKXO4nRsgJ86iLp7bkDpFa6k
	gILHHu9sjWHJYlWC2dK8Bv/mvIi+CceRiqddu70FCyIOrSLhVNHRc6p+WV0kg/IGc0LfDs/IZZj6D
	7RE0FWhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBOj8-009hw2-34;
	Mon, 19 Jun 2023 23:56:06 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBOj5-009hua-21
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 23:56:04 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-25e8545ea28so3150317a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 16:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687218959; x=1689810959;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVs4GZ+Uk0ye5HivrV52qoVsAKrFnxtINai6WrA4s10=;
        b=bnsaeUByEcXlvYMyc0xWRsGsq5X5KsQgHfS2Q8HQkhML7cQ+TQpwPamDechTjs34uH
         qjhluw+hW1+E3Bc0w5iBO2iBQqzLeU9/EGZjdKW5pxEPHhdlKfRRGomEwBdixLX4cl7t
         /fy8OSmL/rTd06qUB83TXKOk4Ut56Gj0HopDxZczzm7hmAXBpoKh3/QCjMeZNfFqNFYJ
         nB/QN3p14jrPE06jxdBl+QItEcVdC5eoF0eKuRC+PFFDpIHypISY5uZ6ABDBSnIMgs4D
         78EbUKJ9aORJDEo8cOpl8gkPK10Xr987b1iVXfW89v0fCFKoIoPiqOoHKfQPvuwdov7Q
         A83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687218959; x=1689810959;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVs4GZ+Uk0ye5HivrV52qoVsAKrFnxtINai6WrA4s10=;
        b=gx35W2dPLuE4y9iBQ+6oX1Q/17B8Dz6zFqpd76v+pFVMyQToZns0I5FjSu/JE+xUvS
         NY21vDdGW3/2mKLxdcqy+tW+EPpmRFVIhpfZY2U16Y3Fxtt1GTIe4HggOYbfrrOaI9UU
         RVTZGGmDCYfLTfCJl1JiC4Ug/wf4iG/u1nfq3Sb0JEtv8axUGQFFqrRwAJ0wcb0SValk
         hrZp4Ig1uHTjpP6c7PaOgIrOcopaxECDX3F98Su39btMwmtIPJx7xM56Eb2mKUlxn2Cy
         Czmg5etI0aZ4Co+5zh1L8fzjtEAxVdq/k5I4sDGX9TCgwLDP+wzjAj+A8m5/y1EogWxR
         KS9Q==
X-Gm-Message-State: AC+VfDx/6e+vpspoCFYuMVqm5tsMJkOUg8TNstRJIl23bONYnGsFE/Ts
	qV4o515mGlxjLxD8IbCIUksgszXO7Eoq1u+o8So=
X-Google-Smtp-Source: ACHHUZ7H4bBeRtg5noFSyoSmqZBkjh8GrAu4Bc58BQ9WL/NTPzK1axTjkkcFFvOw/eLdBjnQiPhdmw==
X-Received: by 2002:a17:90b:1202:b0:25e:a1c7:3a73 with SMTP id gl2-20020a17090b120200b0025ea1c73a73mr10645969pjb.2.1687218958757;
        Mon, 19 Jun 2023 16:55:58 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id gz10-20020a17090b0eca00b00256b67208b1sm6140575pjb.56.2023.06.19.16.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 16:55:58 -0700 (PDT)
Date: Mon, 19 Jun 2023 16:55:58 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Jun 2023 09:54:21 PDT (-0700)
Subject: Re: [PATCH v2 3/3] RISC-V: hwprobe: Expose Zba, Zbb, and Zbs
In-Reply-To: <2605015.k3LOHGUjKi@diego>
CC: linux-riscv@lists.infradead.org, Evan Green <evan@rivosinc.com>,
  ajones@ventanamicro.com, aou@eecs.berkeley.edu, abrestic@rivosinc.com, coelacanthus@outlook.com,
  Conor Dooley <conor.dooley@microchip.com>, corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  Evan Green <evan@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: heiko@sntech.de
Message-ID: <mhng-92d5d02a-ccb5-497c-b8ea-c57709b3df5f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_165603_670955_A14871BE 
X-CRM114-Status: GOOD (  10.66  )
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

On Wed, 10 May 2023 07:47:54 PDT (-0700), heiko@sntech.de wrote:
> Am Dienstag, 9. Mai 2023, 20:25:03 CEST schrieb Evan Green:
>> Add two new bits to the IMA_EXT_0 key for ZBA, ZBB, and ZBS extensions.
>> These are accurately reported per CPU.
>>
>> Signed-off-by: Evan Green <evan@rivosinc.com>
>> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

This one too.

> though a part of me wonders, what happened to Zbc ;-)

I think we all just keep forgetting about it as this round of HW has 
missed out on it.  If you care enough to send a patch I'm happy to pick 
it up ;)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
