Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F4BCCF2C3
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 21:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKurpGKBeCQ/kOFwGPrQBkwFOQc61LXI6T3OvDakIg8=; b=3GQYw3PfDwbyzU
	bkXeG0T6naeXyO+tFClw3Jw+Xry7AGr5UkajBtwfWF23QaiiEBTsQhyQFhE74SweG4mf8K/XDwckF
	JC3/HF9awXN9RofA8VYPKP7pQkrat0fJEePgctjpC85BKbfFsMjqFPHNH+WBeGxlrcmZU8uPkbZSY
	QPQssyv9Znar08y30wfoa/a0Zo8xfHHhEu3MFucz7FNOoXgd8CY0IINn82yGyCXe6x1BdCVX0tIM/
	4Jixou+P6yMf30DdHX30CL66jUjf76RL3tPV7BJ2S9msGA0VGoBKL085cDcoPZdmznMOFgPVqLgJY
	Kbh4CBjWoE522Js1LBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHp6m-0000000438M-1JJ5;
	Fri, 16 Oct 2026 21:04:56 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHp6j-0000000437m-1dpV
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 21:04:55 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-8b056d58f2aso3373207b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 14:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792184691; x=1792789491; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zPYtnw7XMhC+K825KZRyBEk7V8O/GHGxvexBoWflVF4=;
        b=N7A+pW2+S3F0+pq94s3g9BxvdU1S8VfjCKJ0r1OavESOr12RTx3lBhv9H70KXMlXfI
         xNyPB66DYMrRwjz6JaqfelkQpU+cwcAOKqSdNoMFiylo2hEcqeJVcS2eBYEisWg2mA1E
         uq30F34PdpgnquU5TZlktE9SRlv9Cp2gR24MaHPTc3pLRHa/1khwovVxGEI8K5Vy0dBH
         p4qxKKeFDqjP1UmLYQxo5qSAUKELJkolTAd8XAuJtnR90JZx6doJDT50VxuTFtNBt7YP
         ypuH3U272GYct39H/9B/XBxxLpabLLmCLAu3PTLdPOdc+F6Oovx6opk5/lMH6Gk3YnoD
         4bGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184691; x=1792789491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zPYtnw7XMhC+K825KZRyBEk7V8O/GHGxvexBoWflVF4=;
        b=2UJcWMKvNL5Wj6lZg1QfM48xPjQ3jLz3Hdm/21lueG6tKEVJuOmGpwYE5uNK7hmP7i
         FtXcI2LhcPuaVnlgEolYnxLiPuQ1RSerxQ9NBDZVkAaaKnGKKXmnNZda4d8qfuRHJwjq
         JSkhNpiMnY2HtyAtoKl1AY80PM53Dte/wLg+7ZqS8BQFFIU30NixzQdDWerZ/c3LLWUn
         ZnbDjjP42f2jGJTqf+OYOH1tfN/JRWW2SQjEWO2UTCGiFQFYdpDWkWokIujV7/Uny2XC
         jcP5ZS9u6Ew/mQpbZL5Qck9n/B0f0PiXpzlj93JUAlo+NbhMfxdBmu1gebnSxmoNk774
         KuWg==
X-Gm-Message-State: AFq9FYI4kDrBS8vENKjUyEPZBpC8Ig0Kyi+bTul5xTFiVhrG1F+rqrEn
	xvQA7Pc0KF3SF+xNYYQYijgJStx2YT7kKE/zuM+JCnusMiivYms4zDyIp57ep3PxFps=
X-Gm-Gg: AYBFou3XEDNGxXuIICYJI8OiJE/0m+7Pa5IKP2BtWzeLu3+m/f1cKbdHoSlKAOfGDQB
	SICnNjAaSMh5JosNjDhBVz0kbEdWoJ+hBl/GICVFk/mtK4j9D9ZA5WMq6wGCSOcOiQEJlfQzs1t
	gXpk5l5Nf8qNk4B7kkwBMwx8HfCEWlDpIyfh+nqyZsUSIhtiwhHIpHNtJDkoCAOoidCS5yusKKw
	st7xclrtAHZRHH97D2Lf0506fWkCgMpIbIxGDAnmCReKBzxDePWx9NilGwkltXqxD4KQIs0Vw/v
	//bm1oFaRYdvTBzpJH6e7kslu9Qf5yvuHHM9H+G0t29/9v05c98PAU8fzDftO0bzpsBt95b81by
	nf0wahHp9l/vLEA8zWSRb6GIGPgpnqAM7khD6bhQYyJEvpAUh8BVAJDI0NpjrS3YFhPNBN4twY8
	AkZRXqgRzalB265x1HThJv8C945lvQ9+J9Q7EEB2WYjnkVPyax53atIM68YWrqOlkdxxHHL6Y8/
	imT66JS55UKT6mg0nwz
X-Received: by 2002:a05:690c:39a:b0:8b0:a8ce:5794 with SMTP id 00721157ae682-8b0f216360emr4473887b3.26.1792184691414;
        Fri, 16 Oct 2026 14:04:51 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e5889c39sm14125007b3.11.2026.10.16.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:04:50 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:04:50 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 1/6] riscv: hwprobe: Report FP extensions only when
 available
Message-ID: <atKRcrG4CxqgFZix@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006075303.205216-2-radim.krcmar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_140453_871755_92EB399F 
X-CRM114-Status: GOOD (  17.03  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 06, 2026 at 09:52:58AM +0200, Radim Krcm=E1r wrote:
> User-mode use of Zcd, Zcf, Zfa, Zfbfmin, Zfh and Zfhmin requires
> non-Off sstatus.FS, which we set only when has_fpu() (CONFIG_FPU and D
> on all harts).  The vector floating-point extensions Zve32f, Zve64f,
> Zve64d, Zvfbfmin, Zvfbfwma, Zvfh and Zvfhmin require it as well, but
> hwprobe gates them only on has_vector().  hwprobe otherwise reports the
> extensions from the per-hart ISA bitmaps alone, so it can advertise
> extensions that are always disabled in user-mode.
> =

> Report correct environment to user-mode.
> =

> Fixes: 2e2cf5581fcc ("riscv: cpufeature: add validation for zfa, zfh and =
zfhmin")
> Fixes: de8f8282a969 ("riscv: hwprobe: add zve Vector subextensions into h=
wprobe interface")
> Fixes: 5dadda5e6a59 ("riscv: hwprobe: export Zvfh[min] ISA extensions")
> Signed-off-by: Radim Krcm=E1r <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
>  arch/riscv/kernel/sys_hwprobe.c | 31 ++++++++++++++++++-------------
>  1 file changed, 18 insertions(+), 13 deletions(-)
> =

> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 7818e1d32622..b57ccd116bb1 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -146,15 +146,8 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *p=
air,
>  		if (has_vector()) {
>  			EXT_KEY(isainfo->isa, ZVBB, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVBC, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVE32X, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVE64X, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> -			EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKB, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKG, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKNED, pair->value, missing);
> @@ -163,14 +156,26 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *=
pair,
>  			EXT_KEY(isainfo->isa, ZVKSED, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKSH, pair->value, missing);
>  			EXT_KEY(isainfo->isa, ZVKT, pair->value, missing);
> +
> +			if (has_fpu()) {
> +				EXT_KEY(isainfo->isa, ZVE32F, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVE64D, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVE64F, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFBFMIN, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFBFWMA, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFH, pair->value, missing);
> +				EXT_KEY(isainfo->isa, ZVFHMIN, pair->value, missing);
> +			}
>  		}
>  =

> -		EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
> +		if (has_fpu()) {
> +			EXT_KEY(isainfo->isa, ZCD, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZCF, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFA, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFBFMIN, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFH, pair->value, missing);
> +			EXT_KEY(isainfo->isa, ZFHMIN, pair->value, missing);
> +		}
>  =

>  		if (IS_ENABLED(CONFIG_RISCV_ISA_SUPM))
>  			EXT_KEY(isainfo->isa, SUPM, pair->value, missing);
> -- =

> 2.55.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
