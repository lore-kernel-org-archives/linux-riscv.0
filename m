Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F791C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 06:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kcRjEEKs8RbqMYkLGYDtZ5t/ZbWp1YVsS6ZfRHGs7y4=; b=uvVze59TrGfWjH
	FUDUQOz80uubgSfegDTgtAMA4fBpw8XUav/5X0M9cqm/x4vjtmFs4aBgfqxGbi6vu3meE5+oc3Ymi
	B7y5BSVvuZxwH5W3LaSDmWzydhOUfFIlJ+veext68IDeYAQpLvrYXSSoBmArVAA2MYJIi8afi+mJt
	ltdfBz8GAn2Ta7oKTVqIPvb2f7/vkhevx7VGAkJi5GP4WMjMF/AxPa9QnPr5pHPXe1D4+gc22CyeO
	ivpjQksf/ubv/3C7aaRlkTqO90ILN8Ye4bOeleeYvqK9R4hleG0H0z31k+o63WQbQfVVwLVLLdU8d
	+khQfIh0OSjh0pvEAUQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0FYe-0000000BOHS-3lML;
	Fri, 26 Apr 2024 06:59:44 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0FYb-0000000BOFX-3wRr
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 06:59:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a5200afe39eso198843866b.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 23:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1714114773; x=1714719573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nJi2B9HW02fkMYGbO8TVAET6hHBVhmmZVgISXMQ1fkk=;
        b=O6UORRDitQVW9t/7dH1daVKB6pPuYpBLrDCZwj+hKldVi9VJ2MppEUZ6XtsI0I3GiF
         J8yKK7eonWOxTNNl7gPVW4dRlXhGMFp4NeFmrQxIdEl3r48a6ClqXn2dA6tSDt7rDvBt
         2+xtZRMJbGQ9hDI3ZkiRdjalq8WC1mCImO834LPFxg86fRY7VsK5HYcdbpKaK8wGBVst
         OzpPxlx3Yf6W2Qsy2YuGTEYYfk1vlckXRTHoAl0rqV84qNAxucWDP2wtf0TPAqa6HB0Q
         UnUcVTweXfKPFUjnE4iBx7mi2UjfN62MBOO60ZotnJpN0yD1gnAOenmF/D2HDXa/3Yos
         4dRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714114773; x=1714719573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nJi2B9HW02fkMYGbO8TVAET6hHBVhmmZVgISXMQ1fkk=;
        b=DJM2o7cm0hwPVFRFTNFYMVZXLvd3UvVzZWA6G6NDY43N1gLff7+OafTeSyzNmxuTQr
         9zBVhR1PryvMF6/WCIrcd3QE6Pq3KTlFV0MfMJyVtBHjbLG6nwgoeTiov2afssZuyPge
         fTxu1G4l2hdvf6pNKoZNHepZ0elnPpJCrJmPBvSt2c0gA2cnzdC3z4d/fHElt6lqb8u3
         gNG4HHJhqGAvIQqwLrWG0SGEomhZsIVcwA1Fv73+RWwlJc4MuQBPiuu4YOj3OU1g16Lk
         LXOd6QQlzPRXQ3m6wkWlAUx9AvI5/ErNc5Bb6P8BWgDPmJtHt6NtrtOeb2YIL3BeK3Y2
         3LJA==
X-Forwarded-Encrypted: i=1; AJvYcCVvtRApRBcmpg7GOdVapBhMMMBHcLOnyouggez2B0+8aHa2Y6AtsBlkuRvsw6GeWNIiqcPxWtnLVC//TMb9vscAGJku+v0iRT7mWzYzhTQw
X-Gm-Message-State: AOJu0YyHNI96H2B/pfXVlRhe5bYy+Y3guYyliw2SS0Ck4jFAA+EjEvUt
	16zLbs6lI4S6D191QhJowhlH+udrQDjhPB2XDuXi/2MKrV1nPjBzPuf6KwhHsJA=
X-Google-Smtp-Source: AGHT+IHUnMU8CxhFO5e0ybUeTeletpTSN8CoDzy9n/qhvKWDBbmouw24d1LdHfZWIXo2JhywDqhFJw==
X-Received: by 2002:a17:906:3614:b0:a51:de95:f592 with SMTP id q20-20020a170906361400b00a51de95f592mr1758675ejb.63.1714114773338;
        Thu, 25 Apr 2024 23:59:33 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062b8c00b00a58d438ed2esm183306ejg.139.2024.04.25.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 23:59:32 -0700 (PDT)
Date: Fri, 26 Apr 2024 08:59:31 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: selftests: Add hwprobe binaries to .gitignore
Message-ID: <20240426-ffd635ae77cff1868ae99206@orel>
References: <20240425-gitignore_hwprobe_artifacts-v1-1-dfc5a20da469@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240425-gitignore_hwprobe_artifacts-v1-1-dfc5a20da469@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_235942_001281_CA9DB22B 
X-CRM114-Status: GOOD (  15.71  )
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

On Thu, Apr 25, 2024 at 12:58:03PM GMT, Charlie Jenkins wrote:
> The cbo and which-cpu hwprobe selftests leave their artifacts in the
> kernel tree and end up being tracked by git. Add the binaries to the
> hwprobe selftest .gitignore so this no longer happens.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> Fixes: a29e2a48afe3 ("RISC-V: selftests: Add CBO tests")
> Fixes: ef7d6abb2cf5 ("RISC-V: selftests: Add which-cpus hwprobe test")
> ---
>  tools/testing/selftests/riscv/hwprobe/.gitignore | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/testing/selftests/riscv/hwprobe/.gitignore b/tools/testing/selftests/riscv/hwprobe/.gitignore
> index 8113dc3bdd03..6e384e80ea1a 100644
> --- a/tools/testing/selftests/riscv/hwprobe/.gitignore
> +++ b/tools/testing/selftests/riscv/hwprobe/.gitignore
> @@ -1 +1,3 @@
>  hwprobe
> +cbo
> +which-cpus
> 
> ---
> base-commit: ed30a4a51bb196781c8058073ea720133a65596f
> change-id: 20240425-gitignore_hwprobe_artifacts-fb0f2cd3509c
> -- 
> - Charlie
>

We can also consider doing what kvm selftests does, which is to just have
the top-level .gitignore which ignores everything except the code. See
tools/testing/selftests/kvm/.gitignore

But, until (if at all) we go that way, we can do what this patch does,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
