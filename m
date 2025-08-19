Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F22CA0EFB
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 20:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1YtuqKvAHHxsKa3kDtLZQZykF6gAwzBvXETGgEc2oc=; b=Re7P1AoiSv7GYu
	e0x6HQgsqH6vbJoxH5KMMJbEoxWWMmBffJ0xFwge5MLJQF0ils3xFXGr3jj4iLS/WvEv4sXo2zja5
	o2b9asGXs2CRXFJ6+YiuhydO+6tXDAFGqn0qyvqstyd/iHuK93Fhldxiog/ZCWlzLpP36k6x26Hhl
	RMlGVAjHblGjf16lZr1BKVM1/Y7CazoeMNhDdJhXKijNuANLVB9iBM476F36VgBvd+rqqCsls0awq
	N+p2Ln+VLKGDYwxsk64igIURRI4u6m7ePWSaMXXFYmb7aOrfiK+nJPmW4E0YcS51fgbBAmLAqRCct
	vRS8NuN+6PfQC86nssyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoTAQ-0000000BYsO-2zOX;
	Tue, 19 Aug 2025 20:42:50 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoR9t-0000000BJQU-0dcL
	for linux-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 18:34:10 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3e66937e452so12460265ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 11:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755628446; x=1756233246; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RIAFx2sAZr1aaxi1LZMuk62XnAozlnUi2qc60mZCUPc=;
        b=e7n2CD3SRO+4emoyFUnEEQmA2lSH9lSmDkufEk7dvtAMZki2VJJfjKTid7JyztDWTm
         PdJhqVnbwDbM7irz7bLYMhT3+AHZj85+1AxPCY6AMGYlA52FdrcKhcBlb9olUnJ1KoQH
         a2lriQ6RlbktDVmV7W/4jJGJkH7emGhU/v13WNAyv7M0PlXOJYZzL+Tm6tEFoSWneH9Y
         E1x5C9DeCz9QPXj4VmIfZIC589UvZExNT3cy9yJDyp+Qc0lZz0dy5eqtLam7qjoOGSXV
         fnuPt1kt6Z+r24kxxOov0fNv6OR3q3JGZts3CpktXCw9FOT4uKbGqc2zElmoqmBLel9p
         2bOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628446; x=1756233246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIAFx2sAZr1aaxi1LZMuk62XnAozlnUi2qc60mZCUPc=;
        b=DnBoFEzQSAHSq2v8vPLw3QarUw1xd6VIsDv+XI+BD5fwozZEugc1UjdSStUWtBc/tl
         n7ucIRMiPF7ms3UlI4CgT1EArgVoYw49pbTnvdxLzyJitTx+uf8inGx4MjOiJRfyFrwA
         zQkrTPnQZk/Z2IaX0GYuaw6pMAGu3c/6XJvtRJGW94tudq+WMAsazub+lgp93lr7CO/+
         t4ZG5UwCOXNsAMOVZeIoGjwDhxEvSgfPlVchd7K7lr0MOjo1omQssAr2KgFG7MqeKTPK
         3bntZ9Xw24WpkMh23RQh+VyDcu09TFqN6R5AAc7TIPA6g9esPZ38TYLXzcjvu+di8uEE
         7ipQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHQAZR/oFcgBmXxSGRI1smCkJpB0wriphyByob5d4Py/sbx+2r6RkRju12+etpync1fDhOzVIWQ5Iu+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfKKZwEM804fb1pz8wdEay7mfjSUb8Na7rVWLUWzdWW0INVtTe
	uCWhvphCiV2FG1ZWHUzju6OkHMbTne6Jwf2jY1ncEGM++FJ6jzUFato0q4utCM8v0SE=
X-Gm-Gg: ASbGnctdukl/GphwvM2U8pT8efwyHcQJ1JJYF3gkbJqZuhUalvL06p9SJdR4mOx/Cce
	eu6GWl8KaHf2x6+5LktOl5A+nFxGYqf3Dk8aj2qDo7ReR+oApLg+iHXQsHtj5+gAFbPG6YpPBZZ
	GUj408s5Mq6ilhhcc8bZs2GwKjjV97z2D5IAwszgpOLSxsjICvckm73f7JRQCyz/L4YMBDS61u4
	HJfKJJkIl+MpmkjPxS5JvJS89EMuEgjO/QoM3Al5HLeQ8LA+NMEdj6XFREeZZ2vGqRQAotkPLla
	g6sHlXAlpybEvTOpAudiBYAgwHjEcIVSROX7/W0DXsLmVRwTZ80T/jcSDZTezqkZeIdXAfwpfB8
	UN55+cmMIf9MWJWZUDzLTiBwS
X-Google-Smtp-Source: AGHT+IGjSJksXWyqg1XL0sVPSDYoY1K2vCLq/4dy3SroIh5LK0eS+1A0FfIsKIXyrpSD/vuDEKpP6Q==
X-Received: by 2002:a05:6e02:219d:b0:3e2:9ab4:3ebf with SMTP id e9e14a558f8ab-3e67ca22bfdmr2488955ab.19.1755628446014;
        Tue, 19 Aug 2025 11:34:06 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e6727848bcsm16495005ab.7.2025.08.19.11.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:34:05 -0700 (PDT)
Date: Tue, 19 Aug 2025 13:34:04 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: shuah@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] selftests: riscv: Add README for RISC-V KSelfTest
Message-ID: <20250819-28695c586656c926fdfd0468@orel>
References: <20250815180724.14459-1-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250815180724.14459-1-reddybalavignesh9979@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_113409_192055_B6A5F834 
X-CRM114-Status: GOOD (  18.35  )
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

On Fri, Aug 15, 2025 at 11:37:24PM +0530, Bala-Vignesh-Reddy wrote:
> Add a README file for RISC-V specific kernel selftests under
> tools/testing/selftests/riscv/. This mirrors the existing README
> for arm64, providing clear guidance on how the tests are architecture
> specific and skipped on non-riscv systems. It also includes
> standard make commands for building, running and installing the
> tests, along with a reference to general kselftest documentation.
> 
> Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
> ---
>  tools/testing/selftests/riscv/README | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 tools/testing/selftests/riscv/README
> 
> diff --git a/tools/testing/selftests/riscv/README b/tools/testing/selftests/riscv/README
> new file mode 100644
> index 000000000000..443da395da68
> --- /dev/null
> +++ b/tools/testing/selftests/riscv/README
> @@ -0,0 +1,24 @@
> +KSelfTest RISC-V
> +================
> +
> +- These tests are riscv specific and so not built or run but just skipped
> +  completely when env-variable ARCH is found to be different than 'riscv'.
> +
> +- Holding true the above, RISC-V KSFT tests can be run within the
> +  KSelfTest framework using standard Linux top-level-makefile targets:
> +
> +      $ make TARGETS=riscv kselftest-clean
> +      $ make TARGETS=riscv kselftest
> +
> +      or
> +
> +      $ make -C tools/testing/selftests TARGETS=riscv \
> +		INSTALL_PATH=<your-installation-path> install
> +
> +      or, alternatively, only specific riscv/ subtargets can be picked:
> +
> +      $ make -C tools/testing/selftests TARGETS=riscv RISCV_SUBTARGETS="mm vector" \
> +		INSTALL_PATH=<your-installation-path> install
> +
> +   Further details on building and running KSFT can be found in:
> +     Documentation/dev-tools/kselftest.rst
> -- 
> 2.43.0
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
