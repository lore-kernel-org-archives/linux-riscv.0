Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF6DC369D3
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9epqWPxMd8xhaU1sZkoJnSD+MCfHfDmDh0+gpAXZNwM=; b=Qx0GFBD8qVVWZO
	oYE1I7XEApMSRThxeYtCDaJxPbY7fzNjxYOsyCfMY//tVeE7fTQzINKsJUdO05TS/Mp+O4xea88u/
	SUQAqLlO2EnTkghB5cJimIDLVCeKhivIz3oKEI2gEmDewmyhGW89PStXiIT8szOUuGirJoDbGVbUq
	TpXm6UaFPfrQiZeg7rL2j21ViOoTHf+rheiYQtjTOMTXANIxLIMeKepYxP9l930a598iLWt5rcXmO
	WruklGpoM65la43m3klxJQkFy9hNwjl+1QxnHLZ7KlH9i72psNJvae3pKOQQIbKHIqJnz8zrsRmf7
	12RLkO/qg4VHTrLDtzXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DnK-0000000GEOi-3PPq;
	Fri, 25 Apr 2025 07:48:22 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8DlT-0000000GE1A-2CNE
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 07:46:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso16880335e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 00:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745567186; x=1746171986; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yalr6Bu93K2GzLCvN0XHCxzUAzn2mCxagWptxLA843Q=;
        b=IyYnoLRnT4pj40sXHGVoimIbuM4UszMk3j9YpGgIl12e85IgCK3FuHRZb0rdbvTyQl
         svqDlMeTaV1R4lg1Axm9M9gGtKjTARa2Ay83OHeAoEym2A3IjPi0l27rGxC4zlD/eEuE
         GeMYo29tMbe/FXLatIvR+q8uTQtouUDMlu6hVfPAy1mqNNUlDly94KEaNJmCpqKkiz3w
         xEKvichE0/ItFKAZKWDwewrwmtYmy6MpjPQS8cxJhcj/7ZJryBv6jX8VgClVtxDrVeIl
         5eC0rs7blc0hfVwFAMsk21Poh0aODqB0oSO2eah/rIombv+joggSX1PEu/RhkWuLIiqg
         6OYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745567186; x=1746171986;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yalr6Bu93K2GzLCvN0XHCxzUAzn2mCxagWptxLA843Q=;
        b=QsXWXwy04/o9WrJ5yK8UlA0oLTAa5kD+4jc1gkyYu5OJr5My9jMZ06nOe8j5qyNYVP
         b4JeQYBQ6crhxQcsLAUXgsW9Bp4yG+YS4888kdIlKENh5y/hURejpAVTUb5ZUGXFsdz+
         /hheihSRuwhsjEc0VWUzmW2jUedmsOfIHtq5oQQYerq76795kTPZiz/Aq3nyGxovkjZD
         DQVy1JbmvXi4b12VPWAM7yfgLymbHM71i3ZSfCIEWJiB64Srm3P4MSEuA+GcUSaFKKnU
         8wPciQ8XtdFmnGJV8W3zt3nuDXii0cRLFwmqUTAWOZFFz2dHC/9+HECpHz4brQdnmS9H
         ozNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYksPr5dI/lqp7o4ZGW6yeh2CGgd7sSe9on8m2mGkBHM5q9szJkXtarulHkddbXJakD+t+QmIKBxOIRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMvy1PqQpm0wq5s+b4hV1YOKtz6NpQYDZ5jG9L6AH0wOQGKGw2
	Kw3vt4Rr2xyxTieEfe2v3c4ll/pRUtGVs1BRc6BEpvs0qdm6XI2Hrmo3TB9MPwE=
X-Gm-Gg: ASbGnctOH9lV8mvTmizwgHNp/GZx+wx/5Lhq1PsUNxSlIafYKoTO/lmqLZHRYQPbtKY
	WNEd+zb6Nn+JYk0mBgHIlrxaq9v5ujMI8wvUhm0bman56nK/BCSO32NbdUd6afuIEz2tTA38711
	ArcFLtZq4qX3avjkJFFo0aNyqOPJP8FyMfeOJiqiDI1Bif/pk219vIzSTEeQclc+WQYSL9mUriv
	j9O7BOSgpFj2/ARLcbTHnQ/sQUEr5GcvvKArKix8L92joXy2TkFgtzwtDWXZek5s7nDhfSOQJLl
	XZYMQTA2tighMjQGrMsQ0b6q0vne
X-Google-Smtp-Source: AGHT+IGuKsjAp/bE7iMICTe5tl7fZLkgjjuJMOyAsBGa6hvpBqMsjN2EfsDi9JbPSKmGTEeYZJEdtA==
X-Received: by 2002:a05:6000:4212:b0:38f:2ddd:a1bb with SMTP id ffacd0b85a97d-3a074e144a6mr901505f8f.8.1745567185228;
        Fri, 25 Apr 2025 00:46:25 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e46c23sm1496676f8f.75.2025.04.25.00.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:46:24 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:46:24 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>, Deepak Gupta <debug@rivosinc.com>
Subject: Re: [PATCH v6 02/14] riscv: sbi: remove useless parenthesis
Message-ID: <20250425-00fafd9027c5b1be3dd1d78e@orel>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
 <20250424173204.1948385-3-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250424173204.1948385-3-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_004627_560137_59D08F7A 
X-CRM114-Status: GOOD (  15.19  )
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

On Thu, Apr 24, 2025 at 07:31:49PM +0200, Cl=E9ment L=E9ger wrote:
> A few parenthesis in check for SBI version/extension were useless,
> remove them.
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/kernel/sbi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> index 1989b8cade1b..1d44c35305a9 100644
> --- a/arch/riscv/kernel/sbi.c
> +++ b/arch/riscv/kernel/sbi.c
> @@ -609,7 +609,7 @@ void __init sbi_init(void)
>  		} else {
>  			__sbi_rfence	=3D __sbi_rfence_v01;
>  		}
> -		if ((sbi_spec_version >=3D sbi_mk_version(0, 3)) &&
> +		if (sbi_spec_version >=3D sbi_mk_version(0, 3) &&
>  		    sbi_probe_extension(SBI_EXT_SRST)) {
>  			pr_info("SBI SRST extension detected\n");
>  			pm_power_off =3D sbi_srst_power_off;
> @@ -617,8 +617,8 @@ void __init sbi_init(void)
>  			sbi_srst_reboot_nb.priority =3D 192;
>  			register_restart_handler(&sbi_srst_reboot_nb);
>  		}
> -		if ((sbi_spec_version >=3D sbi_mk_version(2, 0)) &&
> -		    (sbi_probe_extension(SBI_EXT_DBCN) > 0)) {
> +		if (sbi_spec_version >=3D sbi_mk_version(2, 0) &&
> +		    sbi_probe_extension(SBI_EXT_DBCN) > 0) {
>  			pr_info("SBI DBCN extension detected\n");
>  			sbi_debug_console_available =3D true;
>  		}
> -- =

> 2.49.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
