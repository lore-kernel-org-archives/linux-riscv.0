Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5468AD1D88F
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 17:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2TtvbS0iSDMgCy6GdXRkoJYQqP8Cp01VkLb41zkHuc=; b=tmUAUimOe5iC+U
	m/x2XjSiTGQGJWMrwGYICRecUupZ0WEYhp+9srj4+JdO7NO2aTWj0FWskzuUYV2D5xY6Qq6SxWtYN
	WdkhrFBucuPDPfwCf/A4hnhWWI7iCnmr96EquM66/481Xs4V5q//HRbkfFJh/t6mQWrGjtwYt9uEv
	wgNsZx4gh19W0h3Y6BCRDYXlU/yuKeNpIMH5wP3V1J/7dEtw1oCMfq4Wy+YC3JIzY2ui/5HtxIcQ5
	T07VmF2OfpJFVhOKLu4KecwVEN6a/mGtCK0aA6jaPOWqYNgate/YeIZQos5LONye73EjkhXpvKwOn
	sphOf5RWzH52+ItY4PZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lgF-0000000950X-0HtD;
	Tue, 15 Oct 2024 17:49:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0lgB-0000000950D-3quU
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 17:49:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so2294823b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 10:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729014595; x=1729619395; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rmroNsuhTr5GGQwwwUhm6ACalGPa0bysvUdakBT6cRk=;
        b=agblU3k2xx1fo8G5EkDX5NCaCWF+AUoPw96rwakxXg44EOPu69JIsDp64zR1QBDVX8
         M1B+wqunXEav7i1pDZpt8EqdOWTpbqzwAQ8TgQWZh6g+Ia/37y4RkuJjBbycCiZ3ypi1
         r+yozxLdeo/1x08QtPbehWLb9m0ekgRFjMxMNZ0yGDHpXB5gNLAm33DLsq3OK3XUUsQT
         7FTJmpEcqzeh1aaZLWZDRskL1uXkuXFPac3n/lHvM9aNK0KXY2UHjWZUPM+xHZyKI7mt
         IzcAMYHYy5RvEpq6o1LAXq8cpTJfW0AK2U2bdP59x/rqcCed3L97imRjsVO6WvUitjev
         Z4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729014595; x=1729619395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rmroNsuhTr5GGQwwwUhm6ACalGPa0bysvUdakBT6cRk=;
        b=ZEoVqZw8WOcPQaVEW65sOnddE4IOZxznlYIb0u3FssxaD2rCpVg5jbreicNYU/V17G
         j/YCAM5HuF4Pudfjk3vci7Doq7sczzZ/vQD4OmM2DrkpWvHFTQSi1iBQO5is4cUL1jiS
         /sq1iIImHoR009AxZeDPqU1R+yvnpMpxehfy+AjYgNIYZBCRrSR9s7B578BAgY6Dx0RN
         KkTosYHf3ZE9BrckRBDqqvjpqqX4GSjEJTRHNwc96w0cpOC9ZGCyuqrGEIO4JhNvvwvc
         LuY6hsmN3HUkGfYEHoRqdblTZ/6p5g2zM/bgCCit8KoYTyHl0iWWgiNNPv3eVOW/LBXP
         e28g==
X-Gm-Message-State: AOJu0YyBE5j7bzOMtqfykKCfoUJZnEa9YNqOvoT0XdiTbPaGm+TNrL4q
	Zmlr3sGkjVPM3o4uCtP+ZLmUVAlV31Qwzb7Dglmw9h7lQkTWiQg0mtC+JZHQTLE=
X-Google-Smtp-Source: AGHT+IHJ9URbclwa1UMVWESY6/yNe/xtbyrLfud2FYj1JvuzArclf48eM4tw0OYTtNis0lmfQocyqA==
X-Received: by 2002:a05:6a00:1390:b0:71e:ba5:821b with SMTP id d2e1a72fcca58-71e3806bfefmr23908680b3a.27.1729014594684;
        Tue, 15 Oct 2024 10:49:54 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e774a431bsm1541943b3a.137.2024.10.15.10.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 10:49:54 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:49:52 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] riscv: dts: thead: Add TH1520 pin controller support
Message-ID: <Zw6rQF+2SUtXi8Oa@x1>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_104955_977059_5AD03AEE 
X-CRM114-Status: GOOD (  10.17  )
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

On Mon, Oct 14, 2024 at 10:54:17AM -0700, Drew Fustini wrote:
> This series of device tree patches enables the TH1520 pin controllers on
> the BeagleV Ahead and Lichee Pi 4A boards.
> 
> Patches 1-7 have all been cherry picked from esmil's th1520 branch [1].
> They do not have the issues pointed out in the previous series [2] that
> I sent out which contained out dated versions of the patches.
>
> [...]

I have applied all patches in this series to thead-dt-for-next [1].

Thanks,
Drew

[1] https://github.com/pdp7/linux/commits/thead-dt-for-next/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
