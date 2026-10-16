Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA95CCF2C4
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 21:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+eBDWDDXbfbn5f9F2uBrGhMCwZCWxdUVhtP3Ph4Zg4Q=; b=kFvaknOAr+xdjg
	RtnOmcUZC444Kgs8THjaWGk2Nb6buR6pIIYGzVKtEBM3XhA/HjRwwSHiQS3Uek0Y9OsUQVvD2wEb3
	z8XO5M4SXqtFTbiU+STWeNHRh9dSSfQn5DxU7UEAby8JbckibpglSficr1Te6CfQ3otOyr812sdbz
	0gPfB0PlIu+A7Zfyi3BrhzPmMomfXnjCheU2UlexpnHHWD6MiNT7bjFVFQKgAqyfyRbSFuDzq/YYH
	jgIqueYSZIhrk0tPqm7Y131/bBHR9xvfCwuxiIzvd2/8jk49z3NrRqQgcpbXdhoo6/uZuDggOC4m5
	pvgs+L7af6Y0jOo4+csQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHp8o-000000043OB-2FsZ;
	Fri, 16 Oct 2026 21:07:02 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHp8l-000000043NY-0y2V
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 21:07:01 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-6798eb0d190so357212d50.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 14:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792184818; x=1792789618; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5uJsfOfOfTjTwCAELnZwu530q6Z1HdI+8JO9XYfcC6o=;
        b=JJYAhOU3583whi4LNLYmrJ0zU0ax/bpiZUofv8mmazyudmvifyIjUtD7kdZXOx5Hbi
         nrnT0AlIk/hQmqnHvNPxdcZ9j34gF4nNwBjWxXT96DgaIId00eTc7jwUFzTIiJZTVQXa
         9yw3lyS65JcXoYhF4Eo/zyB9JzBl4DAeIDP/K9OZqUwRKpKr5VC+K1zLlC97Z4Hai4lU
         xUjpV44yTqoJCQwlHHc4p1RumjpG45qGGQNlVBe+EqSXaknLVPBPs02cwtPZndn9kL15
         E8KT9KXtRqrjCEmZqCw59Xm3hZnF5ILWJ2XKGZCSkyEKyaRRwIOodI9HdPeX6bqnUjNH
         rLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184818; x=1792789618;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5uJsfOfOfTjTwCAELnZwu530q6Z1HdI+8JO9XYfcC6o=;
        b=BssS8zpeXZmX6SZw5l1TPBhHCIwWnhGLEOEpBHsByvixJIG2w5ctPd7JHOFQn5DtxT
         hAKKN6llFUPyfqDmkx/6hkATNwLA/OPyLf3XhRv5adXkH0oruD0Z4yVvPJcX7Dvs9DFI
         RgfkjH+Zy65hD81uyiSMoR5NWgIazHkjzz/MD9jHO0KIX21JMOtVNW7vuuzzDEmNQ53R
         AY4CKBFvkorHpk+Jk8zqzdg3XJQ1Q0pXVOCu8tiFbusdaZ97Ik9Vikqf/eZWgC9IwYZ6
         1D4x8cfpMA3k6e84GOL85hEpItG05TEw+fqEndM4Yspq6DYbh+0oaspd4U+0chnVEZMp
         klVg==
X-Gm-Message-State: AFq9FYKSk4A3zfiTVevXAzIGS60yfDZqRbzVc5iixKeGJmkxy8v4ffQj
	IllxvJk2Os6T/QByF/z4AMdVCjIIOzBfanpBgKr6MoIqn2Nv0GSzrADmm3DOy7IziRk=
X-Gm-Gg: AYBFou2NhkmSu7tXrM8gXBhcGDXLltDQHZB+Rdnk5srAbgePEn9aGFMWHpfdvpM7jTA
	bMulf072zWGwCmN1jSiNJTGdXO9uYAyAjkR/N1/S0dupPQO4DPShEfAQKrqJ28r2oNdYvBbQC/1
	0E7C2hjbUxDmtnYyvOzPoLmI13y4I5HZ0f6SIMpinP9yu/D27lGaB2c2z/pLZWbSzFfZ9LwZVi/
	5yQ56QjT+axfOvEfTAR/IsSkR3hpSpqv5ZI0n0QQL8h5pGurzAkLB8vwR+xQf1XULjDWvSTP/Y+
	MP0L5EIn6FTbKlVfEF6Yqbj7HzY5+lknbkoRSSB2/99uIamYovUPAOh68x3xNe0Jgd2OFk/9bWG
	WHOnXQxvN88G3Hr9n90DGsbDIFo9kDujgo98xlTL582sfXA/5a/fuL8JEcmc/KBpKHf070Fm0Fn
	4gCjj8iRGhWySAtUOuthhcyCHgXk+4wmjky9fLmWqopJYTJHbetB+AdDA0F2CSNFAXnpGQWTmpr
	xNb7jM7Thv1civPHGou
X-Received: by 2002:a05:690c:883:b0:8ae:b617:7135 with SMTP id 00721157ae682-8b0f21978a0mr4730247b3.43.1792184817948;
        Fri, 16 Oct 2026 14:06:57 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e58881f3sm13891687b3.8.2026.10.16.14.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 14:06:57 -0700 (PDT)
Date: Fri, 16 Oct 2026 16:06:56 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Radim =?iso-8859-1?Q?Krcm=E1r?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andy Chiu <andybnac@gmail.com>, Guodong Xu <guodong@riscstar.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH 2/6] riscv: hwprobe: Report Zicbom and Zicboz only when
 available
Message-ID: <atKR8HnbkSf_xZAm@Tao-Chiu's-Mac>
References: <20261006075303.205216-1-radim.krcmar@oss.qualcomm.com>
 <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261006075303.205216-3-radim.krcmar@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_140659_277504_B5695CC7 
X-CRM114-Status: GOOD (  15.95  )
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

On Tue, Oct 06, 2026 at 09:52:59AM +0200, Radim Krcm=E1r wrote:
> User-mode use of Zicbom and Zicboz requires senvcfg.CBCFE and
> senvcfg.CBZE, respectively, which we set only when all harts have the
> extension.  hwprobe reports the extensions from the per-hart ISA bitmaps
> alone, so it can advertise extensions that are always disabled in
> user-mode.
> =

> Report correct environment to user-mode.
> =

> Fixes: 1b57747e978f ("riscv: Enable cbo.zero only when all harts support =
Zicboz")
> Fixes: eb1003970940 ("RISC-V: hwprobe: Expose Zicbom extension and its bl=
ock size")
> Signed-off-by: Radim Krcm=E1r <radim.krcmar@oss.qualcomm.com>

Reviewed-by: Andy Chiu <tchiu@tenstorrent.com>

> ---
>  arch/riscv/kernel/sys_hwprobe.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index b57ccd116bb1..c74e36e8fcdd 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -91,6 +91,12 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pai=
r,
>  	if (has_vector() && riscv_isa_extension_available(NULL, V))
>  		pair->value |=3D RISCV_HWPROBE_IMA_V;
>  =

> +	if (riscv_isa_extension_available(NULL, ZICBOM))
> +		pair->value |=3D RISCV_HWPROBE_EXT_ZICBOM;
> +
> +	if (riscv_isa_extension_available(NULL, ZICBOZ))
> +		pair->value |=3D RISCV_HWPROBE_EXT_ZICBOZ;
> +
>  	/*
>  	 * Loop through and record extensions that 1) anyone has, and 2) anyone
>  	 * doesn't have.
> @@ -120,9 +126,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pa=
ir,
>  		EXT_KEY(isainfo->isa, ZCB, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZCLSD, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZCMOP, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZICBOM, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICBOP, pair->value, missing);
> -		EXT_KEY(isainfo->isa, ZICBOZ, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICFILP, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICNTR, pair->value, missing);
>  		EXT_KEY(isainfo->isa, ZICOND, pair->value, missing);
> -- =

> 2.55.0
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
