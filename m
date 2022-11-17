Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD2BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 07:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyP6TTEXfDrGQxn1ZKwytzMU98qt2adnbywgo2pNpL0=; b=p4sczx5NYyuzN3
	jijIscOTU5FUg7ZrfccHei+/PDmTYD1TNFuxEq9u5y5BtvHycoyZpUWyOm4ks7uAKy2J0UBnx4P+7
	oU5ypdmjeJA7RPSPdWau5so6dusMgsXfM8+8sUqBGCGFZA71W779b/t90tmFSadZErhV6P18/lxVM
	9CwSphSPeTwMzfZQbqqNWbwRRMCG+MsPv2RsNi7eqIg9pIZSpAsQn5iJ6anPTaEWl6+u0MVYMyCRV
	HpDZPawwL+oFgodKEQY5EYigpM4OT+3P+JifgHvGIltQ4wl5V55MJzmHz9Z00RZNSwnt07EAkePp7
	r/CzAQaoBG03oGxCwwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovZeC-00BLP3-TU; Thu, 17 Nov 2022 07:49:20 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovZe9-00BLN4-Hz
	for linux-riscv@lists.infradead.org; Thu, 17 Nov 2022 07:49:18 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n20so3184297ejh.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 23:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xk1oEmkTU9H7VPwZGQRzWhMrFXqC/l98G+URF+zUWzQ=;
        b=p3bqfivjdCBVThsXjPyPdiWmaaJ3KVtlPvlz5ibGTO97w+eHWVfn3ztrpX8+02RK7r
         /n5JnlCLCI05orLqcPnBRJK4R+bPsH9DYMeal9vY8O/vOzLc4mmwCZsA4wliTfZTD/1k
         PEe15RfyOHC4LfhRlJjzmgGqh361hWndQ7IlH7s8FKh4uPggrazp48fXqGNPgix4TK4o
         BDKKQojgrChhZSy7opOWSyzmfD7tDHYpsxqrcg8YAGkZUNJjKsmbIVZ0YHQOXERzAL1O
         BoAEt7xZmV9I6scFQJ2TzP/tB/Ldx1CfxDktxIjwHv4zP90v4Hi+bevI+uQoZIZDbgWC
         NPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xk1oEmkTU9H7VPwZGQRzWhMrFXqC/l98G+URF+zUWzQ=;
        b=Njsnzo8VaR4fKqHB6UR2xCsvEUsekMXZHipgDcTLPW5PC2hW8GMRWqeB6NVvh+8SUo
         qfA4VR77Kop5MrEpsE4C2cP/0oZUU/G57I/4JdH7WxvS40fo1ZJYThYifjHzgFF9BEap
         3R6Y9jTTkYlEROsHfh64IWRqhsTKOHTVxRlWAQb7fm/0HTvUTXt/4j7IwV4rtuJF4Ccg
         LjqTPbWW3uQg6rxDjkcQDNEVMKF8Mhf61TI423Vyi84xw0UMWEEYBtRODHjdqlwIqkru
         iez0KrIrl9BTEbWomy7T9OPdRnKgIJPWme7Sh2W5JaLs6JWx8iUfg8sTlNU+zPa8OLjJ
         6pCg==
X-Gm-Message-State: ANoB5pk6tCHqhI40Ahann6T227SgbSZ35abjJCiY5ZO7H5+g7nSYGcL7
	zfr79lY18Qtiq1ZgH3oSI08=
X-Google-Smtp-Source: AA0mqf6j48PnIuhUBdYjPPrRHGMG9asjsCw4Bqww/C899ryKZXZBQZkhjhSprEaQLgVNwgiNzYA7ag==
X-Received: by 2002:a17:906:a157:b0:7a5:7e25:5b11 with SMTP id bu23-20020a170906a15700b007a57e255b11mr1120322ejb.254.1668671353636;
        Wed, 16 Nov 2022 23:49:13 -0800 (PST)
Received: from krava (2001-1ae9-1c2-4c00-726e-c10f-8833-ff22.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:726e:c10f:8833:ff22])
        by smtp.gmail.com with ESMTPSA id bk14-20020a170906b0ce00b007ad69e9d34dsm19988ejb.54.2022.11.16.23.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 23:49:13 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Thu, 17 Nov 2022 08:49:10 +0100
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: bpf@vger.kernel.org, Andrii Nakryiko <andrii@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>,
	Mykola Lysenko <mykolal@fb.com>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf 1/2] selftests/bpf: Explicitly pass RESOLVE_BTFIDS to
 sub-make
Message-ID: <Y3XndllQ6kmFbztg@krava>
References: <20221115182051.582962-1-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221115182051.582962-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_234917_635126_6D4612D1 
X-CRM114-Status: GOOD (  13.76  )
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

On Tue, Nov 15, 2022 at 07:20:50PM +0100, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> When cross-compiling selftests/bpf, the resolve_btfids binary end up
> in a different directory, than the regular resolve_btfids
> builds. Populate RESOLVE_BTFIDS for sub-make, so it can find the
> binary.
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
> index e6cf21fad69f..8f8ede30e94e 100644
> --- a/tools/testing/selftests/bpf/Makefile
> +++ b/tools/testing/selftests/bpf/Makefile
> @@ -200,7 +200,7 @@ $(OUTPUT)/sign-file: ../../../../scripts/sign-file.c
>  $(OUTPUT)/bpf_testmod.ko: $(VMLINUX_BTF) $(wildcard bpf_testmod/Makefile=
 bpf_testmod/*.[ch])
>  	$(call msg,MOD,,$@)
>  	$(Q)$(RM) bpf_testmod/bpf_testmod.ko # force re-compilation
> -	$(Q)$(MAKE) $(submake_extras) -C bpf_testmod
> +	$(Q)$(MAKE) $(submake_extras) RESOLVE_BTFIDS=3D$(RESOLVE_BTFIDS) -C bpf=
_testmod
>  	$(Q)cp bpf_testmod/bpf_testmod.ko $@
>  =

>  DEFAULT_BPFTOOL :=3D $(HOST_SCRATCH_DIR)/sbin/bpftool
> =

> base-commit: 47df8a2f78bc34ff170d147d05b121f84e252b85
> -- =

> 2.37.2
> =


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
