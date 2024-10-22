Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF19D17151
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 01:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YwYKuGsA/m520qA6ZSu7RtPa2Yx9w8qRQCrXf8CYiZ4=; b=0HkYwk8sGuu4Jb
	CbhHm825Z+te1KKOB486lUJIT5qGfIiH9MbeSq28Pax+nf55lD7/GfU2QU/rH9ngvtScSewgpaOMD
	IYCHfIEzFxMaN7ZgOwUlFW/afXgNSai5F6MySm13sfQ9c3NlKryJ+r8c8X7vwzLipkMUiMN0apJRh
	6TfuyDVoQkRiLHXhtElR66U6mODhWCOfPGyM518Q6CUO2cw4XWqgi6RkQL5VH0gZIaKK6hmLmTLou
	eXfl4joMlcHakGa7YhlsBWTzFUVo1MimT2HIHzJ/JaHK6Lu1DC5j8nIHub01RpgUGrRzYy//FCsQ/
	kOZUyampjw8RPCFiaBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t33MI-000000099WH-3wjj;
	Tue, 22 Oct 2024 01:06:50 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t334v-000000097Me-1HFI
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 00:48:54 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3e5ffbc6acbso2330169b6e.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 17:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729558132; x=1730162932; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ho9z0/EYibqNU6D6zg4eN1k82sn+fVQ2QwMUjuMq4Kc=;
        b=aq7sYy6/QL2Aww+ihgbbdoi81jWqj2GZ2EoxXP6ABt03Sa5NlqWKop8reHivlzUyAm
         EwFJr1mxQ5c51DN0qr61AsuOk/1Awj2LgLQ/XNPROaTmi1AWtCQJSb+kNR/7SXWO+i5P
         AYO5q28njXhoMPvUOcjqEsc8fDrflo8zfxFV1vOYeKKyF2paaCI5hbFizlgjJkBGte4h
         ugPksVGQTq4bhrYgcxIvT9VQr22CPrSb4xfkxndZ3iaqo6ruIEFqe142zJQijyPwhqWu
         2DNyFlg4zSW34PcUFvBlCaBbtwi7LUhiCuqGjcUkZu63vb2YXJ2nUtZ0l9WDD9FcvAPC
         M6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729558132; x=1730162932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ho9z0/EYibqNU6D6zg4eN1k82sn+fVQ2QwMUjuMq4Kc=;
        b=X9+zgRCmX2t19s4KM8MSN8Aw5M0pY8hcXA8dRxrZbCDoIiR95jDy0BKsMsMexQ0PqX
         TNzO2E3FbCAwVYB+Xj/uDLH6/pVmXOHHYzsMMD3/dt90KrEeKKseODP3lDQkUk7rTWp4
         4ezZPSxMndHMQTPJwxx0zQhILPJ2LmIkFSm3+U1OpiiWrKMVxJMAbubn2ICGFoZD/f79
         x6xaT7li+3fR6OLd2sTGtHjbHxpXGhgI2kN0qaxQrJ0if42mO826PHUJYQbJ1vBvlNR2
         Uf8qQasWPc80cN85I8BJzuzNFPDyWLXNvs4uMrrZQM7c7P//PO7WzQm+NwA+cWb3ABOV
         9lbg==
X-Forwarded-Encrypted: i=1; AJvYcCWLomUEpQF5IynzSUyib0+N7hTbFMXyChyCbJTsHXEbayzaQYoJvYbWnQcP0xUDB4JcrVMES8EZc+9IUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhj79WrhIu3yeLSMSEvYg26vCRzSqy8mA2vf2yoSTS7aV71nUU
	KAg8LjYnN65FSRrGwhRSe4wOA4GfU9bLdKmkCI61eIln4S42bRpA
X-Google-Smtp-Source: AGHT+IHR8vksB3qvtmCF54R+Y3XoqQ3hLdiVVfiCsrYy9GdmGCJexTpDrdDYjcOCmNRujUWqNNrwiQ==
X-Received: by 2002:a05:6808:2020:b0:3e5:d8b9:fcff with SMTP id 5614622812f47-3e602da1233mr8951179b6e.42.1729558132067;
        Mon, 21 Oct 2024 17:48:52 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab48f46sm3785613a12.41.2024.10.21.17.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 17:48:51 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?UTF-8?q?Miqu=C3=A8l=20Raynal?= <miquel.raynal@bootlin.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/3] Add SARADC support on Sophgo CV18XX series
Date: Tue, 22 Oct 2024 08:48:30 +0800
Message-ID: <172955777486.235966.17435293788419031097.b4-ty@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
References: <20240829-sg2002-adc-v5-0-aacb381e869b@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_174853_361924_2A89738F 
X-CRM114-Status: UNSURE (   8.03  )
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

On Thu, 29 Aug 2024 14:31:49 +0200, Thomas Bonnefille wrote:
> This patchset adds initial ADC support for Sophgo CV18XX series SoC. This driver can
> work with or without interrupt.
> 
> Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2002-trm-v1.0/sg2002_trm_en.pdf
> 
> 

Applied to for-next, thanks!

[3/3] riscv: dts: sophgo: Add SARADC description for Sophgo CV1800B
      https://github.com/sophgo/linux/commit/45a544a62ef7cac9ecc69585a90da72ca68af898

Thanks,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
