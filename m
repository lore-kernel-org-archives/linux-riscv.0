Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE8CCCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 19:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T/zYhCjwEyHkwyNzbY/zmiftYaVuGd/BUSZv5fLWh5E=; b=BzgSXqT+PG5h12
	eS8w2hxLNkU4lsvQ20Oz353SlvBer3riX1GSSoxEeG93ENwoiqWGi6jWb67eK44OzAQ4FzJsvcZEi
	8nlHo2EDhDy8rjF8jeWKTgm7PCyhNPygl9wAejR2qfbirM6t2RcxgdP0Lx3r4uB7NJeJ0/gUmncPw
	a6jVfVrSDt7xGEmt0woyQ9R8iisQZVMsQ2+8g6N+O/f6D0Fyj4w97A4d4Bwezpg+bCS2TiSl2CuTW
	2PFY+6WM3qFL499cJItJ11rjuNKKjxzfMkliWhNn49l6x14L0Y+APCagOfpVFltfHBmUxxBnGcNLh
	dgHdyeZOizI53IxltlgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7f7l-0000000AbVR-24CH;
	Sat, 11 Oct 2025 19:19:25 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7f7j-0000000AbUi-0Tqf
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 19:19:24 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-856cbf74c4aso513123285a.2
        for <linux-riscv@lists.infradead.org>; Sat, 11 Oct 2025 12:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760210362; x=1760815162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cJ5I2qU/WGgH3J8qqI/SaEyRmBZys9/OsHe+c9FD/hw=;
        b=B7U//wl5jdd3CrT9GbFYhslgZWUYRHKqrQqduTtGzLneAY1o0GMyypaM8nSdP8fc4P
         9ZHkyN3bFPq0T6ClVEWLunzGCGMMlUhMVLkH3DBRXM1IDt0R243BuoXUfeBVmyqfg7Zd
         GYpft9BdZP2PybrO/lB6ms0Br7lDQPYePeUAXmYDCRrMI/VSjEJqOIrgRP0o2ioozjWa
         lNXOoWG8QAB6mwTxQxCQyJNY8fnVoMtmrmGbVVzKovTY5+5KlI/Yv0mobb54HU87f0qP
         BuwfBXDFuEJhqa6wH2ZbXnX8crtMJa9hxEvERxxppJ/lGmmU+jY03v+fQUBWU7VVUDvp
         DS2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760210362; x=1760815162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJ5I2qU/WGgH3J8qqI/SaEyRmBZys9/OsHe+c9FD/hw=;
        b=pbo93JtPOf3ofcW9KBO+a9DPebE0m9kuoaf/TcNwhB/1QmFiHSbntemQDBM8I8eLpe
         u0k80nDVHrvEfH82EjxwsjlC+UbUg+OFQs66/QU7p2u274sCVhw2H+xyteUMtQ/6sqC3
         htjK/4MYYGqg3Rrg9sJ8vXQXnAj32nC8a+d9oUgzcBkx0ZawtWykaEpxY4bG8MDX6xtK
         hskT0rCQUqDpOzcVivigI2RkEbcSMwq0WQKR/925DKexEruhLHG0YzmBllL5WOcOtTzv
         OKGP9+yhhLAKe6F6QkukYqYoRbkY3Ge9NT37eKm40koqieNKv9nEdVYqauz14E/0rcDy
         upsg==
X-Forwarded-Encrypted: i=1; AJvYcCVEg7gQkSloiO2pv/WBzEvrxXptRdtU7z5LftUIS1C2MMWIyRjNLgTlJL8r9qQR0rHdPBpkbsJqUaUPsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv533mDNhx66+Dtr75ZPjPxXR6itWj0q+ZadPksWf6c/TN0Sl0
	rPcRoEvJcn9TiApr3D4kwUUMnyOiU+dvbibST05zs8a/ru4JjNVA1KOY
X-Gm-Gg: ASbGncsXiO/fAShAhp/RHMtH6zlGTZntaaEvtwVMPgJ+/8rWYbd5SKAQu4iDB4qp25c
	2Dzgodg1Ez5dGjriX+HtDQwHFJAXtoJgGp2udl9HIGGd7IsXU0WczXnlDVUw/SoXJOfQcClQXHK
	Qun+6CZwmufbo8gX28E5DHVZzc/pETUlI8seqe3JwoAbXqq/zm/AtYzHdMINxz2bo8AIF2UISRW
	WvbAOBVPsbfZo6bPfxa7nUnxL4bYTGtbF6X8HIMGq3d0a6y9bhiRpWepIS6+kJ2Zg7OnW9fW8uX
	UtsJrZ5xjQCOA7PFI/+1DKOQzQugJdyIcRElnFxMD8YNhXwoj5QvRmFGPDhqvinjJCHvTwSuLBE
	Z3UbPE8RkUq5U2vdGA9fFiSCl2a8a2E2TCIHoAbSIYNBX19q6BciPJ/kdu5cZ3PbVGcAZ2DgC8Y
	ArV/urS6UJgw==
X-Google-Smtp-Source: AGHT+IHpHxjrJNzOqbK5tHqMhgA5n1l4SV+seUg0G29TGsGABvLXeLmwLJWYLUvepxnNA5AGAnNdhw==
X-Received: by 2002:a05:622a:40cc:b0:4de:3a4c:15d1 with SMTP id d75a77b69052e-4e6ead6acccmr223084331cf.78.1760210361652;
        Sat, 11 Oct 2025 12:19:21 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706bde811sm44233681cf.17.2025.10.11.12.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 12:19:21 -0700 (PDT)
Date: Sat, 11 Oct 2025 15:19:19 -0400
From: Joshua Milas <josh.milas@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	unicorn_wang@outlook.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	alexander.sverdlin@gmail.com, rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com, chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <aOqtt7BDXxItrs7W@sleek>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
 <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_121923_160895_F15AB7CF 
X-CRM114-Status: UNSURE (   7.70  )
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

Hi Inochi,

> Only enable device that can be accessed directly. These devices share
> some pins and only one of them can be used. I suggest enabling devices
> that are accessed by default (which means it is compatible with the
> vendor kernel).

I decompiled the vendor device tree and will match what is in that.
Surprisingly most of these are enabled there. I also tried to check
the pinouts [1] but didnt really get anything out of it.

Link: https://github.com/milkv-duo/duo-files/raw/refs/heads/main/duo-s/hardware/SG2000-PINOUT.xlsx [1]

Thanks,
- Joshua Milas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
