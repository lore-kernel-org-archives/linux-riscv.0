Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BC8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 15:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TLtDpQOncEMqkYw/2Pg5rQhXJQ9P8WEoMxrONRgK7/8=; b=OeMvh0uYkPSVlj
	J4A80xy5Z2qXV72KF484SIgw0GBS6qGM6AReiziQN1nmrx8E8AHtk7i9W4fInPJZf4ILoW36Rjncl
	U0bbO2n5Sdau6bvpuUhhcoBeyJkPq8c48kX75x94qEJwfy0RbGJUC/k+2SqKpo9cr7ne4FNyyunXI
	7ExvM1OM2CzOJlySRuHcNAyU4ePRoNTMR+yEQPcE6aaNeVxkFDLc5T+bKgZ9rT0DZ78xMy2FTcIm9
	8qDMDnMpkioXEzN1prT2Yi1QIXHJNCP4bUuK7oENlOWn28pYMvqLoJQAeeS/1oZg4++JZ6VCWnVHD
	JKeQSOr4SsRXQbJpgpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOiBK-00DByX-4s; Mon, 28 Feb 2022 15:43:26 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOiB5-00DBtC-6h; Mon, 28 Feb 2022 15:43:12 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M7s1M-1nKshC3IvK-0050C1; Mon, 28 Feb 2022 16:43:08 +0100
Received: by mail-wr1-f47.google.com with SMTP id n14so16094869wrq.7;
 Mon, 28 Feb 2022 07:43:08 -0800 (PST)
X-Gm-Message-State: AOAM533ssYsPYWqaPHbyjID3GW2XeaLKbiawfjgz+rDR+iQ2+yW2SpYM
 /wkaEQbPFjf1DlkdWGBmAp/w0BG4xY/NtYeFZdk=
X-Google-Smtp-Source: ABdhPJxy9c35EGGAS0iifgxjfOaWuz+Cg9Pw2HqEn7LFPLaX1taoWlH9BAHwhP/QqUpTqblafUJ9zpUAXON7IXLX19E=
X-Received: by 2002:adf:90c1:0:b0:1e4:ad27:22b9 with SMTP id
 i59-20020adf90c1000000b001e4ad2722b9mr16234935wri.219.1646062988362; Mon, 28
 Feb 2022 07:43:08 -0800 (PST)
MIME-Version: 1.0
References: <20220226124826.1564871-1-mail@conchuod.ie>
In-Reply-To: <20220226124826.1564871-1-mail@conchuod.ie>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Feb 2022 16:42:52 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2y2j=zSsPtAFDZxv9b_e2SG6V5DBy__voiHRnDw5n4Aw@mail.gmail.com>
Message-ID: <CAK8P3a2y2j=zSsPtAFDZxv9b_e2SG6V5DBy__voiHRnDw5n4Aw@mail.gmail.com>
Subject: Re: [PATCH] soc: microchip: make mpfs_sys_controller_put static
To: Conor Dooley <mail@conchuod.ie>
Cc: conor.dooley@microchip.com, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kernel test robot <lkp@intel.com>
X-Provags-ID: V03:K1:Q7D4DAInQ9kwHpOhEGNLo2AQ41UFTnAKe3hBkIpmX+WrRBUpehZ
 YN1XO/hgSfj3Ps7hbZsazoZPga812mcfXTMugbns22Ngmfb02BL/9f+VFVKmUNk3cCBxqc7
 ScHO5BVZsg/o77ivPMFTECDbDld6i5F0gRiv2COErB1SZKc3IZBUfA3hiQp0ZE3UA9A0oz+
 ax1AUheU3KpkdJQkfmVDw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TZs3OokU49I=:KKxigP8skirUkSPXy5cZDa
 6NqvmN3fr8xhw/i65KjtJss6S9T+LlcFCg/tU0Z3RK4zFAMWB6rObGYjfPZit63HcNjliOpBN
 9gedqHZgXKzUaAVMgM5yZeZ2We9ETDGP/oF19HXrh/iEP67n38M6bKH7UnFufhSa8CRQef/pi
 M9egPgcFPoTKldy+MM8OKkkBEegJa2ltTtqRUo2Wi7sdKpuLW7hN22s3p9BlAK+j/bSPSz5Wz
 V18NwXogpOgF4tjxvUgq9RlO4+AT43cjJWyP06ZRQ4lLDAj5YudxYBvZ0L+/9WMk4PIviJD3j
 T0rL7I1lr9Gmhe0QJEycWJ5UaLH/8bLpVQwFZXQKMvJKjWNw2JztEpDudBHRWy4oYbsEzBkN+
 bM1v3m//fDlSA8DrZNDt9IopbflE0fxLxPROB2FlCxm4DKYqnoFvEW5Vc7gwTKytxiMG5nAD+
 InJRl36jpz/dL6kuaS9hdUcpA3ha7g+hAOuue+NvfGX8Koyyc0viNhBVAFFXB7jxU7ScHg3Ry
 lcIz1TeM/F8R4WuzPEIFQBSjJLihD/l2ebObcK8ULWOox+YaChBH7xVLTQxew6XuipEg0nldS
 hYW2vod9C+lnbW88mR7UJ7koEeGn8Gt+bD5Q5RwkpdGlaoHBKYjoMTYjnrX5T6HnnCKNdcQZl
 f8Tscd0YWTqVPvKDpvbAuPIJC13TD7i672oGmkfKa5X5d0L9h0vwAWZA+HtwW8Oo3WS3pBVXb
 nqbyxSfZvcgtJ18UDaH9APG9Fjy9rN80IDit28js0Fx8LqEO4d7vUp/IQrJbCYnfPsWUBw8Wl
 kJY2gbCWU8ARhdp2domKYtl2yyWVyYQWAQ8Al/S4U6d4Il3DO0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_074311_563512_7389B7CF 
X-CRM114-Status: GOOD (  13.03  )
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

On Sat, Feb 26, 2022 at 1:48 PM Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> dsafsdfd0054 ("soc: add microchip polarfire soc system controller")
> incorrectly exported mpfs_sys_controller_put. Remove the export and make
> the function static instead. This fixes the "no previous prototype
> for 'mpfs_sys_controller_put'" warning spotted by the kernel test robot.
>
> Fixes: dsafsdfd0054 ("soc: add microchip polarfire soc system
> controller")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <mail@conchuod.ie>

For reference, I saw the same report and added a different fix for  this
at first, but replaced it with this patch now. No need to add it to the at91
tree. Nicolas, in case there is another problem with this patch, let me know.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
