Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48101C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 00:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SrN0tS7q83fSMWhBQBmxkz/s9RiqxZymk18ck28XqiE=; b=dchNKkx2B/r2hu
	/3nKDxLWKCjxSbAUEn+U8scnK9oM5tgje96KZMnlBWvTS6e3WkH5mXDSSYUKzh0eb9pldY0PPrcbo
	rRQMtwS370KgOw/CQ7dhhDSlrM8Ch47l6aysuzbdnQcuKzCHJnXEh+cuHEU8a6TOqlt3j/i7LIeJi
	OnU5OioxRKjkpJCE/Tk8Wv9aRwUvz/Pswlx9rJ6w1BJDV4sZ1kuQi/zKF59TdVgcuCOXp0iOXUWwK
	jKhHnYhWLgjFELFLF5uaaTSc0+WHw0qOUPpSOW3Qsb48mprFkU5tkNw3gsxJWrSMQYOtrgdJwYiBS
	d4hqaC4WjDCZ18Ba99+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtJ6V-00HL8q-T0; Sat, 04 Dec 2021 00:40:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtJ6V-00HL8S-7x; Sat, 04 Dec 2021 00:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=RhO2eM2iBD51XAcs3FHaTn4vdZjIjPBsjygX6aDTNlY=; b=eSHMLB1xRxjDVw9DKqlPBAR9yp
 Yqrx75FNRoT77RKI0dF0PD6De0YW42GbJPUreFYgi2To8XprXRC6VqU9prtBhiwbiue1Iq5HBWr3t
 3F8XNkmkECLouyBz8C3AnNxX2RC8v7QBycpZ0UFBsUVcGQBX5+YzFQ+I5xtAsdQlEPtjxB53RU4dU
 oqe2CCJyKi7VD/1ofD6evkbAvF4xqc/ebajcsWIBImVoKPtSPK5dAb6mI2L3MyjWN0QeZulNIE/zs
 SV0YEODhajuqd16opZXTesJp2A3+eC4goG2qt1FKMtwBOrm66MR8/8ctxm8K6qdvc2lSXJjOhFRP/
 F8O11i8Q==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtJ6O-00Awrp-Kc; Sat, 04 Dec 2021 00:40:33 +0000
Message-ID: <d88c18e4-b2d6-e071-7007-bb5f2b5a042c@infradead.org>
Date: Fri, 3 Dec 2021 16:40:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [RFC 5/6] RISC-V: Move spinwait booting method to its own config
Content-Language: en-US
To: Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>, Heinrich Schuchardt
 <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Pekka Enberg <penberg@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-6-atishp@atishpatra.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20211204002038.113653-6-atishp@atishpatra.org>
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

Hi--

On 12/3/21 16:20, Atish Patra wrote:
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 821252b65f89..4afb42d5707d 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -403,6 +403,20 @@ config RISCV_SBI_V01
>  	  This config allows kernel to use SBI v0.1 APIs. This will be
>  	  deprecated in future once legacy M-mode software are no longer in use.
>  
> +config RISCV_BOOT_SPINWAIT
> +	bool "Spinwait booting method"
> +	depends on SMP
> +	default y
> +	help
> +	  This enables support for booting Linux via spinwait method. In the
> +	  spinwait method, all cores randomly jump to Linux. One of the core

	                                                                cores

> +	  gets chosen via lottery and all other keeps spinning on a percpu

	                                  others keep

> +	  variable. This method can not support cpu hotplug and sparse hartid

	                        cannot support CPU hotplug and sparse hartid

> +	  scheme. It should be only enabled for M-mode Linux or platforms relying
> +	  on older firmware without SBI HSM extension. All other platform should

	                                                         platforms

> +	  rely on ordered booing via SBI HSM extension which gets chosen

	                  booting

> +          dynamically at runtime if the firmware supports it.

	  dynamically at runtime if the firmware supports it.

(Last line should be indented with tab + 2 spaces, not 10 spaces.)


-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
