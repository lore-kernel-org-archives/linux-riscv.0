Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A596C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 05:32:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29E3C206A1
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 05:32:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZqhxzyBY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29E3C206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PpckHaEClNuaE83i4mo5a3tixLYflI07SaL6c/owwz0=; b=ZqhxzyBY9otWen/+BHnKbyiPt
	MdX13QXupsG/2XApMMBEAviW4CpRl/VfAWlevo9dV0kmjuXpEuXk0/8ZCoSl31Ix/jP/PLF+0iKvI
	6LBHhOfePxmKHpWNoZJVM2a3VVessxHZior5ImQQ/ku35NLi7ToXvMpeL2kGEZW8Ptvc9LUyNv5dc
	Fn6LVyabQaq1L8Jn7ZYk7u9vEzyLa0k6Yrd4y+Ljb8QtZW7ih8OGPo/ZPLQuQD2WPmmc3MHSgXVXl
	8Sp47RnkrBbIOqmrElDzNt0wcZ38aJhbbKchGajbkXVOPvqPivt6dV3uh+2URw3go3Q2G1ZJCrlCz
	8l/Xbnuyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtPAU-0002F5-Br; Thu, 09 Jul 2020 05:32:22 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtPAS-0002EV-7p
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 05:32:21 +0000
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.11] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 6345740007;
 Thu,  9 Jul 2020 05:32:06 +0000 (UTC)
Subject: Re: [PATCH] riscv: Enable ELF-ASLR for riscv
To: guoren@kernel.org, palmerdabbelt@google.com, paul.walmsley@sifive.com,
 anup@brainfault.org, greentime.hu@sifive.com, zong.li@sifive.com,
 me@packi.ch, bjorn.topel@gmail.com, atish.patra@wdc.com
References: <1594269511-13340-1-git-send-email-guoren@kernel.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <5c7e9eb0-d811-2e08-87c4-12de9b869b79@ghiti.fr>
Date: Thu, 9 Jul 2020 01:32:06 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594269511-13340-1-git-send-email-guoren@kernel.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_013220_385695_4B0D5B0B 
X-CRM114-Status: GOOD (  12.55  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Greentime Hu <green.hu@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Guo,

Le 7/9/20 =E0 12:38 AM, guoren@kernel.org a =E9crit=A0:
> From: Guo Ren <guoren@linux.alibaba.com>
> =

> Let riscv enable randomizes the stack, heap and binary images of
> ELF binaries. Seems it's ok at all after qemu & chip test and
> there is no founded side effect.
> =

> So just simply select ARCH_HAS_ELF_RANDOMIZE :)
> =

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Zong Li <zong.li@sifive.com>
> Cc: Greentime Hu <green.hu@gmail.com>
> ---
>   arch/riscv/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 91bfc6c..eed6647 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -20,6 +20,7 @@ config RISCV
>   	select ARCH_HAS_GIGANTIC_PAGE
>   	select ARCH_HAS_MMIOWB
>   	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_ELF_RANDOMIZE
>   	select ARCH_HAS_SET_DIRECT_MAP
>   	select ARCH_HAS_SET_MEMORY
>   	select ARCH_HAS_STRICT_KERNEL_RWX if MMU
> =


Actually it is already the case: ARCH_HAS_ELF_RANDOMIZE is already =

selected by ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT.

Thanks,

Alex

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
