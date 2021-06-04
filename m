Return-Path: <SRS0=5Qc/=K6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BFDC07E94
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 13:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62337613D8
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jun 2021 13:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62337613D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DhTwrpPY+bJhQEYPd/bWXWyzuI9394oh/zMMH1FCE8E=; b=HyiR7+WFVjdL2i
	b6eXk4FcN66LvW1mIiKX9LfbzCNagK+qUGwiqLi+1/XMy8T/9LtjfiQFMmwnb1oX9/2VAE/9quZQ5
	aFtsxFPzn0v0ehMzXDTWjn/UrjtjZZe+y+ygxql375FxbE8KOBwDFmk6+cMeysgtFWE8ZBk8OOsKz
	umEUP1Im2gTkUcr6IJ6BcB6kHiT062bnPwfzdxtOEUI+ZWAZYGu+8A21d/PeJfCwEgvpnukxqZvyl
	c2hM7tonnK57PPcdngAuofwAa4mPpBvSHc+xtiEUvfYOphR9x5riOZczlLYjesFpjaUtV7gUZDaMF
	PMm1DyGIgFm9E7QAouag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp9eq-00DffH-RM; Fri, 04 Jun 2021 13:14:40 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp9aB-00DdTl-Q5
 for linux-riscv@lists.infradead.org; Fri, 04 Jun 2021 13:09:56 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MuUvU-1lXD3f1IMk-00rWc5 for <linux-riscv@lists.infradead.org>; Fri, 04
 Jun 2021 15:09:49 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 t16-20020a05600c1990b02901a0d45ff03aso4343877wmq.2
 for <linux-riscv@lists.infradead.org>; Fri, 04 Jun 2021 06:09:48 -0700 (PDT)
X-Gm-Message-State: AOAM530DOZ/K10XNPwR3wJkwmt86psSb/Mp00p//29pmAAYeGbHw4Y8h
 GAk9GXi2SgH/c+1BWxk5zkgJyYhLzCK1p/Q+vhA=
X-Google-Smtp-Source: ABdhPJx8ue47u+2ojqaxQh82xTDoIj4A1jS8LO4yWYCY2SGX6umqH0TLVpYxZ8XFEA31FUz7gYr0AljW1hTzcG9ZN9s=
X-Received: by 2002:a7b:c849:: with SMTP id c9mr3677194wml.84.1622812188705;
 Fri, 04 Jun 2021 06:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210604120639.1447869-1-alex@ghiti.fr>
In-Reply-To: <20210604120639.1447869-1-alex@ghiti.fr>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 4 Jun 2021 15:08:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
Message-ID: <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:546C8ZyrUoJs2n72U8C1G6kZMN7iQlzEzg/YTsKXM2Qsy1vi2OR
 6bTSPfSdqLCEFVxOnOnGw3klc3yg/pIfqC5jFUKpQm293kD8FhJHkrCt1K4zPxYKIBn1+aK
 IWu674K+QCdBP+n+8JznHxJhaH/+RsVOsm2EdNXgBIwqYX+8TZ8wL8KCo61iQHwF6igebhh
 zI1vkUEXK2yk8J9w76UNQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m1mCTadUUsI=:OqcDofHiZxKlHuJXC2baph
 grH4ESGUOZXGMlUI3DRQPg7YuRZtXrnwJGIKYwSIivU2YB5lcWPsm7OJMgO5Vw2vyyxPEnx6h
 yyjJM56r30YgfzfnIC/+lzuGyxg8Ezz0iFfL4RO+p99dXAwaEYMPhZSIDVhYUWUnmi3dRuf6W
 zhVbkeVestaf0JlnpwM5nNmeVqTqjzIFoAN07UyTHSe7sojDBQ6DsiuB1KFUAIgnTpFw2vx0N
 YzxMVmdrVP2O87UbmHNXd3wkNxXWGpYVZJ9jiC2NmNc9ODMa2mcYqwrhzU+geiZZ1pCep2sxP
 TLI9YJPgLcS7eSwvFHDwCeVriOCTlBXVnSEVehAvokDNnFAEMpCiwBz9OPX/rvRw5LVXC+/24
 oBH9iHKyGZeGSQfagR9t/6Zj8HIwyQKTZ0ji37KHgeenWKsmrSYeOZI1ftzbG2Q2jQY17OH4P
 m1Keaw+udUKJETEHWD8ojAWpJMMY/uQN9mvRYJGNM0AYzxSobAzA/BKxPLt5Jbsw6fFJJ+C7o
 9W5jYrT4nfIYX2XJn1jnjA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_060952_197757_44DBD28C 
X-CRM114-Status: GOOD (  12.53  )
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

On Fri, Jun 4, 2021 at 2:06 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Fix BUILTIN_DTB config which resulted in a dtb that was actually not built
> into the Linux image: in the same manner as Canaan soc does, create an object
> file from the dtb file that will get linked into the Linux image.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Along the same lines as the comment that Jisheng Zhang made on the fixed
address, building a dtb into the kernel itself fundamentally breaks generic
kernel images.

I can understand using it on K210, which is extremely limited and wouldn't
run a generic kernel anyway, but for normal platforms like microchip and
sifive, it would be better to disallow CONFIG_BUILTIN_DTB in Kconfig
and require a non-broken boot loader.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
