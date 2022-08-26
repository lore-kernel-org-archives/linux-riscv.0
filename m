Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BE4ECAAA2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=owyAj+0Y/E0dGm2n+NQzM2LTwaehDnH+/VaQiCb9FXI=; b=rt3BvoFd6mi9dh
	1PjxZq6i4zGBG9ucQFaiC4QrMeRQ8IbCZCip/c4g21sZiu+EYiZXVbnKGObaDmkBt1F5Xx9sJQvno
	BJ2M37qRWAZrfPyk92U+M2YRWTweKeH40knANGlupYlEG58cClaT6fEcsOrixL5NYLutP52Ph15B7
	wO61mKq3ZCvxFBnm/8xI5yvELP0mjnE6yAw1+ZWLBv8JCi643szyw0jFBuurXOtC31MS7GzyHIC1C
	6s4Rlh/yBDm3r2LSRYjStTNNZeyD/agS1sEUIYqKW3x+dXxyjOAOMAfOZK7EDwInHPkWlrJx+g+qd
	vv9Fb52xEgQaVuBk9KRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRN0m-004QN2-AC; Fri, 26 Aug 2022 00:15:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRN0d-004QIp-Nk
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 00:15:41 +0000
Received: by mail-pj1-x102c.google.com with SMTP id w88-20020a17090a6be100b001fbb0f0b013so3529118pjj.5
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 17:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc;
        bh=A0gsvt1poQ+VylNfnig8Ot0cE//z5t+eeDWuqhE1fpQ=;
        b=excq8S0Pt6bKvgJnrWBZCNZ9Yh3t/50NeXMnSOTwuOBCtZsNIQdwl9ASMdPHIGNAaQ
         sOB/cpwuDO94Cyskva/FtB2eKHqYi4Po0TWlmF086nL4G6Fu35SwQTGmhJRMbeOzIW6h
         iT3icaST3kuPPU/vPzer0orCVtMNa0UtMmzL4lazp1JxEislW3UyGHcaQ6zIivhU7zTF
         Bg78IHc1JyerrGDMS07VytlhlOmtIdXJDTqcgQ6lhUJfiZpHZWwwSeaMCxDnoWMeO2Ek
         c6alIJXM6k5bHjt49FkTTO1dWD1YXpEVz8xCewz/Ox9A9T9LU4hrymagamHTUM0dTvjl
         PiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc;
        bh=A0gsvt1poQ+VylNfnig8Ot0cE//z5t+eeDWuqhE1fpQ=;
        b=kTPRj+06MNX/QNDCupBw7k4o5nypbcDWj+sobyAZtBgeKXIOCVTUTHnZQeKj4oN90r
         o16ttyMhmwnXep//tQdf+fxxpMgu04oCmrd5/jSjw8VCDjDMVMxz3MJLUyUi7sP2ANYQ
         1+0HiWbdHJQl2j2xoaAlXCEc6arvYLpvU6k9oBkoQeyPfheG6+XYHs+IdO1Vg4J1qwPw
         tB57CFYmbB3EaGDtxjxC3rtBMb7P5lup+my70NLeNlFhh2Rb59BKSry+tWtn9dXqmhhg
         Hxpn90HsRJ7LPlnJPqEtD/NJ7cM/Dlg6Ch8YOAUFeIliPLrpgDIP47Nzct6hPDMqUUjJ
         N0Gw==
X-Gm-Message-State: ACgBeo31eO32tWSoTCB1m9PvUXtyt9nOh/Ur3VU/CDxjQ6l8CbP+pHLE
	WYh4mZpCLjTuaR7HbVDkpcKKMA==
X-Google-Smtp-Source: AA6agR7avLLMBjCkQ+XBTGDBoNHD8IObfC9EMTEilFGiA40oEt07P4n5+N3r+nAhZXHYuS+LR+T0+A==
X-Received: by 2002:a17:90a:c02:b0:1fb:b69d:140f with SMTP id 2-20020a17090a0c0200b001fbb69d140fmr1520190pjs.139.1661472937514;
        Thu, 25 Aug 2022 17:15:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090301c300b00172cb8b97a8sm170479plh.5.2022.08.25.17.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 17:15:37 -0700 (PDT)
Date: Thu, 25 Aug 2022 17:15:37 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Aug 2022 16:49:08 PDT (-0700)
Subject: Re: [RESEND/PULL PATCH 0/2] MAINTAINERS updates for PolarFire SoC
In-Reply-To: <20220810140243.2685416-1-conor.dooley@microchip.com>
CC: soc@kernel.org, daire.mcnamara@microchip.com, broonie@kernel.org, wsa@kernel.org,
  thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, jassisinghbrar@gmail.com,
  linus.walleij@linaro.org, brgl@bgdev.pl, Greg KH <gregkh@linuxfoundation.org>,
  Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, mturquette@baylibre.com, sboyd@kernel.org,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, conor.dooley@microchip.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: conor.dooley@microchip.com
Message-ID: <mhng-9fab66cf-3d6c-417b-9233-8030c256aea9@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_171539_838745_49D1A150 
X-CRM114-Status: GOOD (  18.45  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 10 Aug 2022 07:02:42 PDT (-0700), conor.dooley@microchip.com wrote:
> Hey Arnd,
>
> Could you please take the following two patches via the soc tree when
> you get a chance?
>
> The first is adding coverage for "my" dt-bindings as suggested by Mark.
> I CCed all the subsystem maintainers on a V1 a week ago & I've added
> them explicity to the patch text this time as CCs. Correct me if I am
> wrong, but I am operating on the assumption that their Acks are not
> required here. Hopefully increasing the binding coverage is non
> controversial!
>
> The second patch is a resend of a patch that was deferred to later in
> the merge window avoid messing about with a 4th conflict in the entry.
>
> Thanks,
> Conor.
>
> Conor Dooley (2):
>   MAINTAINERS: add PolarFire SoC dt bindings
>   MAINTAINERS: add the Polarfire SoC's i2c driver
>
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
>
> base-commit: 4e23eeebb2e57f5a28b36221aa776b5a1122dde5

Thanks, these are on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
