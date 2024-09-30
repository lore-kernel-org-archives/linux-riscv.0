Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99515CE8341
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Date:References:In-Reply-To:Subject:To:From:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRZEkz3iWSlZHicVJ0D84l+9k049Ktl66rwruhWaqB8=; b=GTH423mCqsDFCmSV70/l2crfH5
	6eHU5d9d+PsTsnrpqAc+1tSaNLbMX85KyP80aNfubka6BIaskyRPl2anySYr5LP1MlPLQCub/PwVF
	roubBHGSOmb/aMCgSXXTXMJ93S88jHgduwfzIy9Fs2ThGrKGYIRmjYKuTEjx0YfvBpc4recVc6+6S
	FmAA9TgTLS5ksi60VylB2Dsse3HQLT/OJHj5diqHMz+fizhQDUdnQ4w8nIPEn/tuKA30gEz/JzGPb
	yYiHNntVr2KY69EOveovuR+Ji4fVgJFz10JFzoJh/fIUkrBSoudsA8y1xcI0RhmaiPfayHoX0lOoR
	A1WCZreA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGAc-0000000HDYt-3PN1;
	Mon, 30 Sep 2024 13:10:34 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFcQ-0000000H4V6-0RTu
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 12:35:15 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-37cea34cb57so481597f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727699712; x=1728304512; darn=lists.infradead.org;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OGgx2QXm49+i80fK6ZIYDqvCO84UtWAPd1Twn8qWUeQ=;
        b=e3aApdUXTr4Z/5AzYbUYmpIrQHWp2EWDiNgsYyfFow5vSMk11+llI3Us/IPgOufh5e
         na0MQu2spzfzlzvTCtBiLFSmvI1i8jVPgHkmV9pBK44VEvkETrTGgyDDU/OFeNZEkIC4
         BEb6uYvBbQclt7SPWoLwVXizTgz1YtjvB3OkBNzbEsEa2SFBOMk7CsMOhr2WwB/k69Rj
         VST78uSTBgTBwTIwH08APZ8sN8pynmSpPT0yoXh9t1ohmtMV+hieZx2J+4OgLYYzjx8h
         nXwNkjNQrcMQl6dSAz/TuRdYqoVRt80nX2qVrIpbOyBJSPc+pU7YkWax3IxDX5iEj7bV
         iexg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727699712; x=1728304512;
        h=mime-version:date:references:organization:in-reply-to:subject:cc:to
         :from:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGgx2QXm49+i80fK6ZIYDqvCO84UtWAPd1Twn8qWUeQ=;
        b=UAeN2BMVmJbYbe28Sto3iH9/VvSOsRmxG9MaFA7SL2zYdx/2J1qpMsraDK5p5LBYke
         QdHcEvqogsqqj33u0Jpot+64LlPW0QakqZX+0Ht4avrHZoB+5TSNw7G3dZwTpSgFuH6z
         qwxe6PrA59kSRI7m2kuX6Hk8OOwqOOrA357IVHkJAmNFixSH7on1iFu0AYwuRi0nvvLC
         E7icK8+sHTGyraycsjfNYeecZIh02bpGfMNEPTgr30BpTvCZE6t7JcKHhMDB0f4H2LH0
         4w1VfxPYBWO9+dpmXkbc+K1QtwOkLrYEsKohi81KRosOYVDPvg83tlet+rAnMutLRtq0
         sADw==
X-Forwarded-Encrypted: i=1; AJvYcCWa+nNOP1iu3n3jX5HFHcDyFqnyTNe/mDJLUFrAFAeJnUXXctqqkLSXbOJsSOQHDYPaoJ3hjnePlZAW/w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQs+Qltu8pY7YT9ubXdKjhcxahxRsAh69NohDSEo5bE3Xwl3iI
	Lrxsmc0Hw/0cA2pMG4yALLMWJEyzTX0DOi3HfryRdMHZNNyohTbl
X-Google-Smtp-Source: AGHT+IGdxnRytaWoXEmdGqzTGQEIqbuCAatF9kA3GstJSTZy0Po9aooxiBqYhVWD0jF4P2dPbGYMew==
X-Received: by 2002:adf:cd07:0:b0:37c:d20d:447e with SMTP id ffacd0b85a97d-37cd5a81f7emr5754201f8f.21.1727699711355;
        Mon, 30 Sep 2024 05:35:11 -0700 (PDT)
Received: from localhost ([37.72.3.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd575dd04sm8940397f8f.114.2024.09.30.05.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 05:35:10 -0700 (PDT)
Message-ID: <66fa9afe.5d0a0220.323a97.bfb6@mx.google.com>
X-Google-Original-Message-ID: <87sethpbeu.fsf@>
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mikisabate@gmail.com>
To: paul.walmsley@sifive.com
Subject: Re: [PATCH] riscv: Prevent a bad reference count on CPU nodes
In-Reply-To: <20240913080053.36636-1-mikisabate@gmail.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9=09Sol=C3=A0=22's?= message of "Fri, 13 Sep 2024
 10:00:52 +0200")
Organization: Linux Private Site
References: <20240913080053.36636-1-mikisabate@gmail.com>
Date: Mon, 30 Sep 2024 14:35:05 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_053514_171442_5FADDF01 
X-CRM114-Status: GOOD (  28.82  )
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
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, jeremy.linton@arm.com, palmer@dabbelt.com, cuiyunhui@bytedance.com, sudeep.holla@arm.com, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6344800382300306418=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6344800382300306418==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dv., de set. 13 2024, Miquel Sabat=C3=A9 Sol=C3=A0 wrote:

> When populating cache leaves we previously fetched the CPU device node
> at the very beginning. But when ACPI is enabled we go through a
> specific branch which returns early and does not call 'of_node_put' for
> the node that was acquired.
>
> Since we are not using a CPU device node for the ACPI code anyways, we
> can simply move the initialization of it just passed the ACPI block, and
> we are guaranteed to have an 'of_node_put' call for the acquired node.
> This prevents a bad reference count of the CPU device node.
>
> Moreover, the previous function did not check for errors when acquiring
> the device node, so a return -ENOENT has been added for that case.
>
> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mikisabate@gmail.com>
> ---
> I was wondering if this should also be sent to stable, but  I have not se=
en
> a report on it, and this is not responsible for an oops or anything like =
that.
> So in the end I decided not to, but maybe you consider otherwise.
>
>  arch/riscv/kernel/cacheinfo.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
> index d6c108c50cba..d32dfdba083e 100644
> --- a/arch/riscv/kernel/cacheinfo.c
> +++ b/arch/riscv/kernel/cacheinfo.c
> @@ -75,8 +75,7 @@ int populate_cache_leaves(unsigned int cpu)
>  {
>  	struct cpu_cacheinfo *this_cpu_ci =3D get_cpu_cacheinfo(cpu);
>  	struct cacheinfo *this_leaf =3D this_cpu_ci->info_list;
> -	struct device_node *np =3D of_cpu_device_node_get(cpu);
> -	struct device_node *prev =3D NULL;
> +	struct device_node *np, *prev;
>  	int levels =3D 1, level =3D 1;
>
>  	if (!acpi_disabled) {
> @@ -100,6 +99,10 @@ int populate_cache_leaves(unsigned int cpu)
>  		return 0;
>  	}
>
> +	np =3D of_cpu_device_node_get(cpu);
> +	if (!np)
> +		return -ENOENT;
> +
>  	if (of_property_read_bool(np, "cache-size"))
>  		ci_leaf_init(this_leaf++, CACHE_TYPE_UNIFIED, level);
>  	if (of_property_read_bool(np, "i-cache-size"))

Gently ping :)

Could you take a look at this fix?

Thanks,
Miquel

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJJBAEBCgAzFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmb6mvkVHG1pa2lzYWJh
dGVAZ21haWwuY29tAAoJEJa+jG/YnWVlIz0P/iOz1gxRpTCXjaOBthmKUKJtPEJm
xj/aakUpA/l/uxRv3vVMs4S6h3Fv3LFL0pTqrpxpH2BKVLrhDTHhMuxLYf+TBeKI
TY3mUBUbW+YVjzvNNaaUcGjjDdA0PhWWzZUTsrQRrU2afFEJeeK8EbEPfPcMt7sI
hUIXZ3jm52W+Ifzgp+2za6cJtAodUDtYRRFb/gE3X/BmSFO2WaO0YTd0RRAoj0+M
qhe6XwfuObJ3nEKMMikqfH9QJ1tpWAX+gMRv8zbEk9GYSbKrg/8QMLiczc73gbq6
70ppXc7TLmXPO52MiJB6YeXv/TaUplPUVGde5WEbRgUqvLjQv2yEoSsVgQRhEuU6
CFzDwQU7NVEo+0x9ovZ89d8Hw1xLxGfZE0qpCL1Ir6JF8n5zMI0/eKdB893AToiV
evgkj3AuWrUV14l85jwLFDqRB7ypv3vBAkKl51iquv3jZ/uW5qdGQQRLP92SW7cZ
23yjVpxZSowcuacLebaQzPIadzU5b73isc6/szs6wefy8hOUIlpQ4fVd0dSQRyNf
Vzaxzxl3gN3ENsDVhvxjRTp4o1tu3VkZBRmczVnDAKWvmpaSwIzp4wd5VwanWiIe
LZ9UM1pCnDDQaqDyIbZA+tPNUXKEvCp0867lqeJCu8JrtpXu+EqY7r8rh/H/w02E
OKDlOyd+hvSHoGBr
=UNJG
-----END PGP SIGNATURE-----
--=-=-=--


--===============6344800382300306418==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6344800382300306418==--

