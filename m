Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4CAC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 06:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQbE+ZnLHePTfTXe4Fcdz7mRue19vZn9WDblViHbc60=; b=ulQwRI5tnXIpbH
	WDEmVwzqmkrjGJOSvf0knirMMu1vtnm0MzUaJ9uMa1MxWqnjhcWTm/eFUQK4WEEbUN7UoJ14Kk6ow
	r6rgRiBCsXXagpUf+vKMzrXmmSGdQeKgUTVh0c8XdD6r+C4g/FwKItx7ey0HF6doiMUQe86Lb9+lw
	mZgEQYs6/ebe42Tyz9AbwAnWCwWXrX1m5J3IV4WIGjOV3Tn4TLC2JJ1DrppDS18b8zc3A+KP32XvI
	PsLAOZ+XmS8XS779wPMFuT0ILIKpxtZoSuPeXs9d0vtei9s73sDT5UH0UfgTjSEOfuDloDYay9JKd
	HaOPti4bKvg+T3BVjtIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oggc6-007YNJ-IU; Fri, 07 Oct 2022 06:13:38 +0000
Received: from forward500j.mail.yandex.net ([2a02:6b8:0:801:2::110])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oggXT-007WDq-Dx
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 06:08:55 +0000
Received: from sas1-78334f65778a.qloud-c.yandex.net (sas1-78334f65778a.qloud-c.yandex.net [IPv6:2a02:6b8:c08:b21f:0:640:7833:4f65])
	by forward500j.mail.yandex.net (Yandex) with ESMTP id 065F76CB6733;
	Fri,  7 Oct 2022 09:08:46 +0300 (MSK)
Received: by sas1-78334f65778a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id gnALNBxKrX-8gi0sD8f;
	Fri, 07 Oct 2022 09:08:44 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail; t=1665122925;
	bh=/dZOB0OZJ5ewGOYu6Vfqo3dohgfS+f5k8XzKDbToPI0=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=iRCL76I/Z5mJWT4zaddxYfALWpgqZn2sHdNjdOuO/IP5PzDvVxEcsgiKDEuKMl29I
	 DSnX1ikLFGBDZBU9qGlr5A0yGMRzjZXRmh7Fghn7MazWYgaw77in7dHvQLLLizxlaa
	 td9mpUR0go+l/s8gTdV06Bgb3ipi06Spsx+Zg48E=
Authentication-Results: sas1-78334f65778a.qloud-c.yandex.net; dkim=pass header.i=@maquefel.me
Date: Fri, 7 Oct 2022 09:08:42 +0300
From: Nikita Shubin <nikita.shubin@maquefel.me>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux@yadro.com, Nikita Shubin <n.shubin@yadro.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Heiko Stuebner
 <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, Tsukasa OI
 <research_trasio@irq.a4lg.com>, Jisheng Zhang <jszhang@kernel.org>, Sunil V
 L <sunilvl@ventanamicro.com>, Yury Norov <yury.norov@gmail.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix multi-letter extension compare
Message-ID: <20221007090842.69272c4a@redslave.neermore.group>
In-Reply-To: <20221006070257.11632-1-nikita.shubin@maquefel.me>
References: <20221006070257.11632-1-nikita.shubin@maquefel.me>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_230852_701945_BD9E3B24 
X-CRM114-Status: GOOD (  17.57  )
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

Hello Atish,

My bad, i somehow decided that 'sscofpmf' should
be 'zsscofpmf' in device tree, but it's 'Sscofpmf' actually.

Sorry for noise please ignore this patch.

On Thu,  6 Oct 2022 10:02:56 +0300
Nikita Shubin <nikita.shubin@maquefel.me> wrote:

> From: Nikita Shubin <n.shubin@yadro.com>
> 
> Increment ext pointer to match letters after 'z' character, so it
> points to actual extension name.
> 
> Fixes: 4905ec2fb7e6 ("RISC-V: Add sscofpmf extension support")
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
> Hello Atish,
> 
> Sorry to blame you, but i double checked this and i don't see a way 
> how extensions from device tree could be successfully matched with 
> encoded ones without incrementing the ext pointer or prepending 
> the encoded extensions with 'z' letter.
> 
> I have no idea how this could slip through review - am i missing
> something ? ---
>  arch/riscv/kernel/cpufeature.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c
> b/arch/riscv/kernel/cpufeature.c index 3b5583db9d80..031546052dc0
> 100644 --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -199,6 +199,7 @@ void __init riscv_fill_hwcap(void)
>  				this_hwcap |= isa2hwcap[(unsigned
> char)(*ext)]; set_bit(*ext - 'a', this_isa);
>  			} else {
> +				ext++;
>  				SET_ISA_EXT_MAP("sscofpmf",
> RISCV_ISA_EXT_SSCOFPMF); SET_ISA_EXT_MAP("svpbmt",
> RISCV_ISA_EXT_SVPBMT); SET_ISA_EXT_MAP("zicbom",
> RISCV_ISA_EXT_ZICBOM);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
