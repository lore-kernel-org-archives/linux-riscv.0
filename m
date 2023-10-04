Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886AAE7B610
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=534DXq5VH4qRcqVCo1VjIDbyuYTlHw9+ryVRxI+1jH8=; b=okvOW2v63SMHsl
	X3KwXRRIS0mqIUPc8lwq7Ln0o+1tALOBD+mGeejVBB3TSkqWKvkKYWxDCRFeVBCfGUqwTge1H+ESt
	UBxTInK2kIuOqzISjhiRmXg5C8oj6pkcVRcKxnL8WYI+e39JtYnL9u0SBxpzAr75h5EEnNQJfnQpW
	a3KxV0ha04I/QnJtPzDsQnWhOH/SmvuSqW/djBd21wzl3UEuCFKphyMwLdg9lBljRIceXq8Y5h3cL
	L+FmuuzhP66PmP5/6WAlccmQ7+Q9uiIeWUaWLYQTK9FAO7BnzOghdbyqawhHWJ6MXWw3A+FnupjfQ
	JcjUiJCBgYNxBNkhUf/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1U7-0004hY-2Q;
	Wed, 04 Oct 2023 13:00:15 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo1U4-0004fr-38
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 13:00:14 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9b974955474so12661866b.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 06:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696424408; x=1697029208; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9LA3z81dm8x/8yLvFD8FRfA0jwHx+VnSKrEfLe84ZDY=;
        b=PBTkqqwbyUUFaOHGBfy+NMeI92ZnK9sHot4nEZ1kLFZig7G8/qPMA+xSIEu5h3p5r5
         DiJFdqBpt09wJDPYoLLcpmZWWXJ27EiPR9dzdBH9ECqH/hA9IggFdJT9MYseeYFNGjfL
         3hHiNS/7HEHYt5APa3oO4cg6SilfK0IrajpfpHAqpccUBDt1qo6ZB4GnpQ6ddGBMXUOb
         I11arznKcGxjIZPtG7rd3U0efIGFZWWaApWBPvdZWtFUAj9ForBWcWmw4ppp+EOoKCnn
         snsYfNFPKkUpQNPu6LmbQTHOTzPDaoIUethvfa1Ybb5CZ8fTVBRJNFkyDg9F3UFtpKyQ
         0RQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696424408; x=1697029208;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LA3z81dm8x/8yLvFD8FRfA0jwHx+VnSKrEfLe84ZDY=;
        b=RIpf1PQhiKTEQM0Aff7ToyQKaL0fJQT08jdowkmEanXoEIMuqoENllQwr0UBrLnjbW
         mr2Dpb0V9/nZSi6Q5tXOK3nS91s76BUrtfuxq5ei7ACiR5KKOZHH5arahWMyqZZIq3hD
         IfsQNeyAdYxr8DSMmwuVHaWOHnmFEGZ8ZOxJBQ1j+hRCGeHMmdoeM4jXItWf88PPLGdg
         gqvJfSGpytfxJsFSHHaJNOHz2i3XcewBfRrnj1QiTh2iK2W59Neu6bNsCkRSAL0RdYwH
         gyoSnvgtLOliwbiffuElXZJIdByrhGm6pq2ahL/RnPJWmEkm9gDPzFgMTomr7z8AWn5e
         QJzQ==
X-Gm-Message-State: AOJu0YymbFwxiNhlVTP0CSxhCDdixfAj/Jyycox4MgIaIsTdCIruse8f
	GID6W4j4Wo+qL1iG5Z+hBmg=
X-Google-Smtp-Source: AGHT+IH8tyx7NrLsAWfLrTeFsQplGLPzPMsVk0D0fv5EBxxMQvFsWQwUjjUbM7H5o4zX0h2jhoXOiw==
X-Received: by 2002:a17:907:7850:b0:9a2:474:4aa0 with SMTP id lb16-20020a170907785000b009a204744aa0mr2184081ejc.48.1696424408174;
        Wed, 04 Oct 2023 06:00:08 -0700 (PDT)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id vi13-20020a170907d40d00b009b8a4f9f20esm1067025ejc.102.2023.10.04.06.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 06:00:07 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 4 Oct 2023 15:00:05 +0200
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org,
	netdev@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: Add uprobe_multi to gen_tar
 target
Message-ID: <ZR1h1ZWrsH9dtCLN@krava>
References: <20231004122721.54525-1-bjorn@kernel.org>
 <20231004122721.54525-4-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004122721.54525-4-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_060013_011429_4BD484B7 
X-CRM114-Status: GOOD (  13.96  )
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

On Wed, Oct 04, 2023 at 02:27:21PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> The uprobe_multi program was not picked up for the gen_tar target. Fix
> by adding it to TEST_GEN_FILES.
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka


> ---
>  tools/testing/selftests/bpf/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/tools/testing/selftests/bpf/Makefile b/tools/testing/selftes=
ts/bpf/Makefile
> index 098e32c684d5..07ac73cc339d 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -104,7 +104,7 @@ TEST_GEN_PROGS_EXTENDED =3D test_sock_addr test_skb_c=
group_id_user \
>  	xskxceiver xdp_redirect_multi xdp_synproxy veristat xdp_hw_metadata \
>  	xdp_features
>  =

> -TEST_GEN_FILES +=3D liburandom_read.so urandom_read sign-file
> +TEST_GEN_FILES +=3D liburandom_read.so urandom_read sign-file uprobe_mul=
ti
>  =

>  # Emit succinct information message describing current building step
>  # $1 - generic step name (e.g., CC, LINK, etc);
> -- =

> 2.39.2
> =

> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
