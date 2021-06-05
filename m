Return-Path: <SRS0=INRY=K7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06E7C47082
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 06:34:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B1506135D
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jun 2021 06:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B1506135D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QPG7VPRheMv1LTZOKRw7KYxpg5CSvvdKe8AvvBMOK8=; b=mK9j4AAOacnRgdaUV9hILgVvYI
	5kc41tXMAqoZQIqznHcVl+gMzSslcONviH2dPZwd6PVh9VvIJKu91WfBQUH+WIqLlXIsqIYoClLJi
	ZenGxaKoIFrZLmQ30G5W2uzoYYnao1p8CDjldhhHkg+jWirQ6m3f7BnBXqjCaaAH+vEkARffkMFgp
	LZ5qTMGnuocD2zQUKFToaq9tgOJJtlmvLsyAjFNoxHyav270zxRXmvn4KuRgUeUKfMAz/dvDI8K+3
	dK3To3r8wSThK3CCpHcCyPWekBu65+3wIC7CGquw8lkjHXRIEuIdc7Q8qGntlNBOji1kwavGqATUq
	i3eCIwbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpPsi-00GA03-FM; Sat, 05 Jun 2021 06:34:04 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpPsd-00G9yz-IY
 for linux-riscv@lists.infradead.org; Sat, 05 Jun 2021 06:34:03 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id B33C91BF206;
 Sat,  5 Jun 2021 06:33:26 +0000 (UTC)
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210604120639.1447869-1-alex@ghiti.fr>
 <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <1287f6f3-2f07-3269-9048-8f7d08eecc09@ghiti.fr>
Date: Sat, 5 Jun 2021 08:33:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_233359_777979_E9800282 
X-CRM114-Status: GOOD (  18.50  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Arnd,

Le 4/06/2021 =E0 15:08, Arnd Bergmann a =E9crit=A0:
> On Fri, Jun 4, 2021 at 2:06 PM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> Fix BUILTIN_DTB config which resulted in a dtb that was actually not bui=
lt
>> into the Linux image: in the same manner as Canaan soc does, create an o=
bject
>> file from the dtb file that will get linked into the Linux image.
>>
>> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> =

> Along the same lines as the comment that Jisheng Zhang made on the fixed
> address, building a dtb into the kernel itself fundamentally breaks gener=
ic
> kernel images.
> =

> I can understand using it on K210, which is extremely limited and wouldn't
> run a generic kernel anyway, but for normal platforms like microchip and
> sifive, it would be better to disallow CONFIG_BUILTIN_DTB in Kconfig
> and require a non-broken boot loader.

I kind of disagree because if I want to build a custom kernel for those =

platforms with a builtin dtb for some reasons (debug, development..Etc), =

I think I should be able to do so.

> =

>        Arnd
> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
