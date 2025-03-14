Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9D8C282EC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Mar 2025 00:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLEwudrfuDm2u6zb66QXKfd5LoCY5UR4kZ05lr0h3WI=; b=DP63GtZrvB7Fje
	bMFEJB8EGcMM6bXs5pBauVcWnCCvEKfisgeRMqNWwsiIsmwU3LfT4u8T4xWMQIm89gtEmHurlHVIi
	a+aJWPGs2jmbVNbzlmwoVQ3lpGIA9EoEqfTbgzpLMdw0ifEqZNpFYzn/E/2rNTqQxKVL9WIHv44GS
	ShnpwqZzXXeK+k0mIkgANNrzt/UQAHqOaCmGQiBmK3apOt5CEdVeIhScSntKAHEYQkMWkr8TChMUz
	5QP4jD6/FrwZuEJ6cEh7kTDnncFSpXvt+JYXuB2xvENymfZ17CijqHX7yJAg78/lzho2rOGy7rIs9
	HbQNzdFq6g11E1aO8ewQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttFH3-0000000FZuN-0QcH;
	Sat, 15 Mar 2025 00:21:09 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttE7F-0000000FUba-1HMG
	for linux-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 23:06:58 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-54298ec925bso4075827e87.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Mar 2025 16:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741993615; x=1742598415; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
        b=u8NphJ94Pi4zwDo2FM9/tKVsD0imu21XRKV57gCuq//jB/rNsLHXuIXKplmb99BXUQ
         TwFj+qw42H0niYRGjzJMsG4A3I8oDgYtfwFXWH+e/vzMsjg6FdjaAedRjeXmR+OyhC1I
         PQfcrcK8GynkTsh0cf42YImrD7P6iipyd7kdBMm5DCb7xsG4RQgCKV+5aMwZM7FYIIRv
         KkI02H7Xmj7Hov4QDWombOOS0yHheWVSn2KkYerdFGQf1aW7g8HLNOxajvXl+k9xl/qF
         nEqVUNAWgtXk31EPe3gPHb1cbXhK17eGl9XjxHfkB3fW9zmwkFYdEoc3EvQjIrV+XJds
         Zoqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741993615; x=1742598415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EQLBP+fmJuD1+AN0yT2B3IM5f4DABvwxjMDb0xsLweE=;
        b=u5A9vS1tQ/kQyMDUv4mu4OISkL4hL5nFqv5MWGWVZu6zLnA3caP5VMzZ2KRAx1l0lj
         Via/wGcahDKbnd6A1a4rvK8vJLD4sWiPxRe7I+AOUGxZ1Ic69qchfNs4BhdaR6fetSpp
         Ga3Bv2mdenSRekWd7WHyaCEp6AFL0e+ykck1q7bsRmFEfKQc/+LvW+S8/LFv22DtxQvf
         PXBr33bOX75DUmVZGN1H2gs5ElfmAIuKAf/2CxE+zjD2AQ6NqHtIRkSaFWD7WiioO7gP
         7+7NASoHbAcFa0fvuKEUm8jBnkLmgkUFoZWOT8HdWZdjFzbG0/8sf4+YyFu3O0P+lN6A
         G9UQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN2S3pae4WQu59YG8hBg1d5KMf7LKpQoHwElwo1a8pjq6qfpUKoUKOG9s57OL/pXUi0ZrewSLTptJ9kg==@lists.infradead.org
X-Gm-Message-State: AOJu0YydKnrMC9+I7k0+bAZx5YXC9tQtkWeoJDxbIUgyD3OM6h9aIu8N
	dv2crnTYfh8W52M8geBlY2//TJ174O+w7xXT5N/+YQhuUi7t8GA01eVBKYWGLw2qt7EPh/P3LQx
	HtIOPPX2cMuO4c4Pr5/9h5x/xiSNxL9csIONrig==
X-Gm-Gg: ASbGncsYQAhx8Zby7g/Ssaje6WbqjoJEGo9JVpox03eJWdxpIP7eHM3Xbja1F2RqSv4
	yXC8ZzjTuT2xmJSuZ3UZF75iZZkFr1spv1zi9a90O1Ujj8KlcDqGPdmSeOU3TLBcI8bFW0xIYVR
	PknD4Si1xegjbMvFrFyDrLi+4=
X-Google-Smtp-Source: AGHT+IHuC1J1Yai2jxQeHMWFOi6OTmbD9XMUMWazPqqGxbglq+6gRZz39mX62xhHQPo6JQAFPJkP4DF+ZOLbOQK/cmQ=
X-Received: by 2002:a05:6512:b0e:b0:549:4f0e:8e28 with SMTP id
 2adb3069b0e04-549c39002d0mr1743882e87.15.1741993615226; Fri, 14 Mar 2025
 16:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
In-Reply-To: <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 15 Mar 2025 00:06:44 +0100
X-Gm-Features: AQ5f1JreJjRROiVW-E27I_Wa53A3PnD8rRVkk2LLMQxZb6Qre-JjpCb6QRbcc7Q
Message-ID: <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
To: Arnd Bergmann <arnd@arndb.de>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_160657_361593_C1A95D22 
X-CRM114-Status: UNSURE (   6.88  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXIgMTQsIDIwMjUgYXQgMTE6MDXigK9QTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKCj4gQXJlIHlvdSBhY3R1YWxseSBkb2luZyBpbmNvbXBhdGlibGUgY2hh
bmdlcyBoZXJlLCBvciBpcyB0aGlzCj4ganVzdCBhYm91dCB0aGUgRFQgYmluZGluZz8KCklmIGl0
J3MganVzdCB0aGUgYmluZGluZyBJIGd1ZXNzIHdlIGNvdWxkIGRvIHRoYXQgc3R1bnQgd2hlcmUg
d2UKYXBwbHkgdGhlIHNhbWUgcGF0Y2ggaW5kZXBlbmRlbnRseSB0byBib3RoIHRyZWVzIGFuZCBs
ZXQgZ2l0CnNvcnQgaXQgb3V0LgoKU3ViamVjdCAiZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBw
aW5jdHJsIGZvciBTb3BoZ28gU0cyMDQyIHNlcmllcyBTb0MiCgpTYWRseSBpdCdzIG5vdCB0aGUg
Zmlyc3QgcGF0Y2ggaW4gdGhlIHNlcmllcyBzbyB5b3UgY2FuJ3QgcHVsbCBqdXN0IHRoYXQKZnJv
bSBteSB0cmVlLgoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
