Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F3CC00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 21:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhEgg2K75aQXOU7qVfCvcv6T6npyNwV1UQ30C1KXOJY=; b=wERgM5JAFy1osH
	Md+nTa2Heh3HZzLfzf+pKk3lqrRygnOQTXKCAV8izVV5jD5TipuvVViUp03Itv9S6StPik6kB+vAg
	Fa9evgVFjEomb8oMo4Uh03kyqPE7C/r7HNe7lujHp0RJ6ND4zWA1T1IuP7zUtiCadeCd5M8iylMLA
	S2ypurwh6CTyei1gITPfbTWP48Y/PkF2oV6i6RDqbrIbzTzebwayHbvzVXatYA40Aq7U8biGDcy3D
	jB4BBOSmHFjmOfcvX3eCniOhC03oekF4NEwLyeSYCIn9clbRCHbbva9kLz2KsX7ZzMzqX5dQ50spv
	/JieZxP0zfQ9VJZIxNLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLAOQ-00GAiY-7j; Mon, 08 Aug 2022 21:34:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLAON-00GAfu-8X
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 21:34:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id z12so12261722wrs.9
        for <linux-riscv@lists.infradead.org>; Mon, 08 Aug 2022 14:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=9kRHsgOgJ6PrAYABPQZo5fFEimmGDPOkqaNSMbcJVyc=;
        b=TYEiGXwYdSs4KSceoUw0CONgMh/BCvSsIAkhexa4o4d8X0/H14uel438GJ7mB39Q0O
         IE1q8hV2gxxGTpP8sXz39FaGlVNq0vre28mLKsTHR71YmHlycqTUxLWbMDvW8G9zA1kV
         aIcKAijN6Zne3pHprutjgeaZzPmEvNOOU/9mPkehxyznxeoFODtYxiK/b2/16Cayl1VM
         rTq2CSDmDw/x9K20038uoWnRahYX9u1Vnd/MNldNaqz17kK9epaesrnTJrVd7N5gemCz
         Xg8i4j+c8J0AhUsr6FCPhlytlOXTxD48x+cdFRPhrYN6g7snYKStSUeycdlW4nfYRVVg
         vyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=9kRHsgOgJ6PrAYABPQZo5fFEimmGDPOkqaNSMbcJVyc=;
        b=bXIu9Zoq3lFE/h8btJsdAmEvOeZbuf+eY7T1AxTYWittGDdrgER8zd+ZPVpgegJxr6
         4Zim91B3YpI4J4UvoOMhkbtEfCnlv/vB7Kl7AhFRTtgEKUX8/OaxmxmqkkV/m4epa6fl
         Ms7fYafTBThvz8xNdAwqZiI3zx3pmnAqk0/l53SA68GMmXPAz2m1DJqTGThcyBrD2d5V
         nPsqUrSI5uEAA4q5cFX1PfO188CqFanuRyrzuo7W9s3uRJb8kzd4YI/LoPiof50Da8lx
         5YZMExoYeEZ53Wbf+6c5LqTdjUB+1rPyuLRQgtkCsI8UtSAWRbqTVmc3XYeDxBRUE+OQ
         fWvA==
X-Gm-Message-State: ACgBeo0t2UoY4AlooUPCkMWgOIcYV7ZWFEtAAPYF89ZTERmGINI5ZAMK
	tAb7Ff6VF1q9uud7eGzAoqvNp1vrHJi6Z8R1cZI=
X-Google-Smtp-Source: AA6agR5mFLBH7jdSMh6Rb2K0gPj3kWj9UbS6iuvGWq1LcSMGI6UaYFSJLp5u4ZP4z0ZR67q8PSvObQ==
X-Received: by 2002:a05:6000:235:b0:220:3a22:fe38 with SMTP id l21-20020a056000023500b002203a22fe38mr12675264wrz.419.1659994465738;
        Mon, 08 Aug 2022 14:34:25 -0700 (PDT)
Received: from Jessicas-MacBook-Pro.localdomain (global-5-141.n-2.net.cam.ac.uk. [131.111.5.141])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c4f4600b003a4eea0aa48sm15541146wmq.0.2022.08.08.14.34.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 08 Aug 2022 14:34:25 -0700 (PDT)
Received: by Jessicas-MacBook-Pro.localdomain (Postfix, from userid 501)
	id B48C929DB6B6; Mon,  8 Aug 2022 22:34:24 +0100 (BST)
Date: Mon, 8 Aug 2022 22:34:24 +0100
From: Jessica Clarke <jrtc27@jrtc27.com>
To: Conor Dooley <mail@conchuod.ie>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Sagar Kadam <sagar.kadam@sifive.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH 0/3] Fix dt-validate issues on qemu dtbdumps due to
 dt-bindings
Message-ID: <YvGBYKZyW0B2/wSr@Jessicas-MacBook-Pro>
References: <20220805162844.1554247-1-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220805162844.1554247-1-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_143431_347153_FD060D64 
X-CRM114-Status: GOOD (  21.87  )
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

On Fri, Aug 05, 2022 at 05:28:42PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> The device trees produced automatically for the virt and spike machines
> fail dt-validate on several grounds. Some of these need to be fixed in
> the linux kernel's dt-bindings, but others are caused by bugs in QEMU.
> 
> Patches been sent that fix the QEMU issues [0], but a couple of them
> need to be fixed in the kernel's dt-bindings. The first patches add
> compatibles for "riscv,{clint,plic}0" which are present in drivers and
> the auto generated QEMU dtbs.

IMO the correct thing is to have QEMU use a qemu,plicX rather than to
weaken the requirement that a non-generic compatible be used. Otherwise
you end up with QEMU using something that's marked as deprecated and
either the warning remains and annoys people still or it becomes too
weak and people ignore it when creating real hardware.

> The final patch adds some new ISA strings
> which needs scruitiny from someone with more knowledge about what ISA
> extension strings should be reported in a dt than I have.

Listing every possible ISA string supported by the Linux kernel really
is not going to scale...

Jess

> Thanks to Rob Herring for reporting these issues [1],
> Conor.
> 
> To reproduce the errors:
> ./build/qemu-system-riscv64 -nographic -machine virt,dumpdtb=qemu.dtb
> dt-validate -p /path/to/linux/kernel/Documentation/devicetree/bindings/processed-schema.json qemu.dtb
> (The processed schema needs to be generated first)
> 
> 0 - https://lore.kernel.org/linux-riscv/20220805155405.1504081-1-mail@conchuod.ie
> 1 - https://lore.kernel.org/linux-riscv/20220803170552.GA2250266-robh@kernel.org/
> 
> Conor Dooley (3):
>   dt-bindings: timer: sifive,clint: add legacy riscv compatible
>   dt-bindings: interrupt-controller: sifive,plic: add legacy riscv
>     compatible
>   dt-bindings: riscv: add new riscv,isa strings for emulators
> 
>  .../sifive,plic-1.0.0.yaml                     |  5 +++++
>  .../devicetree/bindings/riscv/cpus.yaml        |  2 ++
>  .../bindings/timer/sifive,clint.yaml           | 18 ++++++++++++------
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> 
> base-commit: 42d670bda02fdba0f3944c92f545984501e5788d
> -- 
> 2.37.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
