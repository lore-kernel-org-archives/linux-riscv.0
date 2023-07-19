Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64359EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 15:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiNC1mOpGr8LoaDooUGeKPJKDIdNEG+hrjsEBTTjNNo=; b=ThuMRYR4kOZVqg
	bRMhbjN/ERtSzFWIrV4XzBkWBbR0o21L+Cvh4K4/zJavO12EKyeyNn3aoTNfO3n/3j93N86WUQGMt
	Vnljudl80KxCtr1293tSJ7FWXHDkcqcEvporvFwN3ZsoWNQOI8bVs32b61onRAog8TZScLgAdQ1jZ
	fMaP1wK0i8f27nr0Zymnf9wd/qbEp/0trRtsy4yDuKiLAtnT0jk7aoq91hij6dTxmsA67Q1fHn98P
	qK1uOTVvg0n2n73TjblRC9NN7zDEKyqQcWFfZwxgyjRbqFbxfMh6vEaiSFKSV9oWbpOH/u99ebkQY
	UjZXCb7B7v1eRtl2RGuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM9Nl-007zGA-0M;
	Wed, 19 Jul 2023 15:46:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8JD-007kUY-1g
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 14:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oLiCt95ygV41kuZf9pX1cXwrEnN2OwQXL7Y8MwA/vjc=; b=bi+x4gAq0Au35wzf9Bg9KM1DkL
	Xy4WzOpMu3ZqBy6vkVv9SlJBz/doBDUUBOQGcyIa/3LD+Bdrn9UJmwJMqfkEk19JlHPnxF1pZgwGb
	tpZAn3OyqdV+LGBUNCwBHfGkZrbuXCpeYJm/ZaWtr0vCN7dqewp0YUMBt34I66Rny5NAFSxRhemvg
	GqZ5eB7gPlsVhNMlLBrYTckb8V5KPsDv5X4Mfk2a/cVHZMrJ1CnX5JTSMut4SuHJagzPZYxsoP5Hk
	w5Xp8tQ3k9ThfuL7qlAR45VULS4JVOqH8Oi+XlKwKDZ+aCJZ8QSeD8pI/lczS092V8wK3erhgF+lA
	9730hiDA==;
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM8JA-00DYZX-0R
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:37:42 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-98e39784a85so189785066b.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689777458; x=1690382258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLiCt95ygV41kuZf9pX1cXwrEnN2OwQXL7Y8MwA/vjc=;
        b=OyLcAVb026kFo928Hy3s1W+mPe+iulgMNXBvR9EpvChGg9Gydpc9dQDdcU7AEPRriL
         ighvJf16NYasg4aV/9TjA4clHitRmHAisnla+yi5FyN6dw0wPq4bAINmZqyjhSwz5kpe
         gZ801AHmgwGJ/iSbUpwUyBgiyhJFuR5m1DyHqkiyqFkOvrqhHaWqC6BejFbZ+pSw2ffo
         C79R5Osz6/qKjz8y7faz8knUyBl51h9WHcLga9OEKb+y7Kt5lLYp+fCmW4trCWdYogbR
         gqFYnb3IHsDOiU0+bCLYOKPdHLnmOQsOIWD/EVq7s1mtfap97NdLpUjH3VxLFpRT5jlk
         lW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689777458; x=1690382258;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLiCt95ygV41kuZf9pX1cXwrEnN2OwQXL7Y8MwA/vjc=;
        b=UVUg+GzC0N1Ewn3WKD6RON8huwdOWGFrIOXjXFJYEe+aWQHZ7BbYncjzVCsv9XwdIq
         440pU7OogqUtNTAHTML1K3F+P82kJwg7+2kyat4+l/xgETb841YHJl19/DxAabr41G6i
         43bhSXIu/ds4ExtgdV1+c77cB4S8K4Zr3ZZhj9EFSV+ydK41b7ORA5AK0Uqn3nT76Rtu
         ncMtCKXNn7rIthXB1qeCciuxNJaeqPC35ARzGE4eOOPyAg26+0GH4P5H1QC438vG805M
         sW7uUsDg03/4b4NzNeaF+0DtHypOldO1wVCa+eU2p9KMxJ16hH93h17QucFGnoRuWuto
         HH2w==
X-Gm-Message-State: ABy/qLaC3LgMTTYqn/8v+h+IqdseuZ5P57bnLKysHOeFq7lyFzO3Wl7g
	O8WQI39IRVx1t/h0xJ8xYvp8LkSFNbw1ZZJBM4A=
X-Google-Smtp-Source: APBJJlHvLAd11eHo8p4btHRTHFKMuq/1+lumsya3iavDjF5xiaMW7akyP7F5aQv7cVawl2wAzQxcsVt2Jm3RMy8ClbI=
X-Received: by 2002:a17:906:64d7:b0:993:f127:2391 with SMTP id
 p23-20020a17090664d700b00993f1272391mr2767082ejn.32.1689777457867; Wed, 19
 Jul 2023 07:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230717205357.2779473-1-samuel.holland@sifive.com>
 <20230717205357.2779473-3-samuel.holland@sifive.com> <CAJM55Z8Q-kGFKhFc57_Ew+0VsmBqwLrBAaiaiJ5zYdu_OG-wMg@mail.gmail.com>
In-Reply-To: <CAJM55Z8Q-kGFKhFc57_Ew+0VsmBqwLrBAaiaiJ5zYdu_OG-wMg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Jul 2023 17:37:01 +0300
Message-ID: <CAHp75VfxGP+N3KmAb2wcCZiDypsXBKxKwC9H_4WZ5ByM-Qo=5Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sifive: Allow building the driver as a module
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Samuel Holland <samuel.holland@sifive.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_153740_350633_C9CB17A5 
X-CRM114-Status: UNSURE (   8.44  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgNToxMuKAr1BNIEVtaWwgUmVubmVyIEJlcnRoaW5nCjxl
bWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPiBPbiBXZWQsIDE5IEp1
bCAyMDIzIGF0IDA4OjI2LCBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNv
bT4gd3JvdGU6CgouLi4KCj4gV2hpbGUgeW91J3JlIGF0IGl0IG1heWJlIGFsc28gYWRkIHRoZSBN
T0RVTEVfQVVUSE9SKCkgYW5kCj4gTU9EVUxFX0RFU0NSSVBUSU9OKCkgbWFjcm9zLgoKKzEsIGFz
IG5vdyB3ZSBoYXZlIGEgbmV3IHdhcm5pbmcgdGhhdCBNT0RVTEVfREVTQ1JJUFRJT04oKSBpcyBu
b3Qgc2V0LgoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
