Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BEFE7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbjCm7/QqciIw4miRbQBB7X9vRo5rMbSjg0b4v2pA+w=; b=vfXblbNH00UHZS
	yqiFXkywrPZpgCi5EDdxp7VwKsa2amwvzT0pvO+hmCeAlvAWxtq12kU+uaogTAi5x0yG0slKIMC43
	tl931ftLYysM+O0U0BxwLCmYIM9zdbucdNL+HcI5O2TB6p+7aKr5F5Xl5z+ebZBr0tGjYotEW0OSw
	elyizT05WEarxjlYyaIxs8Jxr8W1PhyzDS+8MIwm0cSZ2aeyXSvXqVMWuWVQwOlCiOZyGck96RlFW
	GuhSZsfjx3nGf2BNXcX8gJze7fH7G0amuTFgtVjat6SuRlz5gyyyfq0C6WK9tnpFNTXbuo/FZrc6j
	WRl/oOJj6iJThPQ6Drzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUzh-0000000GHuB-3lcv;
	Wed, 11 Dec 2024 22:15:45 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLUz2-0000000GHq5-1zHP
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 22:15:05 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so6183892a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 14:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1733955304; x=1734560104; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L3bvWRkboCH041Q0f62pL6WYiocCI+DadvD/PAjyygU=;
        b=cSLXoaX5jdk2f7CpmqhjyBFHLn2kjn/q/3p0CwYCOjwUTPEaKQc2Wvr4i4jZUCkVyg
         1EMUk2RKyAtmhko9tuRbK2Oz7Xpm0HMUuAuB90win1huz2vmeO7TgHY3uG2EmhSgwDRa
         R2bcZnAqlJuzG5e2KMlRKeSd1SdjLLETzX7iMw3YwWzMClAjVPUEffhUrVke0ufXjYii
         mDGCMWOaNNBTQZmIRnlCRDu//bJahhlITDHIkFmkDh4klRXOVyDDjhsff3z82F994opq
         u+34rjZRPJI5icMzv4QujvMxlTVx7AVRfIPDtvDqjvJWY5UqXbbCdP+A6Xjnq4wfYpYb
         Yz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733955304; x=1734560104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3bvWRkboCH041Q0f62pL6WYiocCI+DadvD/PAjyygU=;
        b=pBE5cXvsANhHqW9G4jp8GDcBCzNgXZsVzlgTPkNsKArnXA4iiW/GZNTYikkNIBg8nj
         t1AX6RKtCYr4bS04wfD2dEHabfVK2vMXNQjW4b1fmd6b1+2TfMVzFqvETcC7X3tv4FzD
         cKX3EYPYGJtsnvIQPi29vYSzOPfI7Kc6HcvzVjnLXyJqbaaYLWCT8GEF0mYbDWR31by6
         NtFe4UHk8NIVN6D0tEeYIJtA2kTxgseIJuQ7xfdkNUGt58aY/m8cx0LJkny7KfoeBUvH
         Qvg6INW3gsOf1DL3OBfiWJpTW5luTFBaNB6Vph2xd83ZhB+RT2+z2r5iVGTCCZ16lAxl
         fu4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8BD423oFvRIwgJOPQldbd6rn5hdm4/whDeyk8mEJCPo9qUBS6ZBwe0Z4Gru8ObgVMx2asaq0viIrGAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDOgLLHavHKiaquTrU9kIV/OMGClM/wIQ9TU/G4I8ul1U66b/g
	ObUHmmgHH51ur09F5KTfrue29gdwt7Wrz1YeqLg2oltJ/Qxuobh4Nte4xbwgBww=
X-Gm-Gg: ASbGncsqFQtB6aUBPNSUulCFGLRAPSb4SQgB4+qeJKZBL8swaEEbcAgasQJ8yp8tAEJ
	2O+LZWvyqMnJFe2z6Dk5OD9vCAHrD/n8ZPXe+qNavBpz0xeCFVBmpDljoYyjilOM5YpAS82rabO
	MpxwySmvWWpdijFw4qR0wd9Y8OUuLtxtmddFiYkNekPvGnM2qQkXqCfYTNSNJ2QiBrOPIRyLftV
	8AsKIbAaw6RJFEjWbBxpo1OB2lDp3t16E6GaqqxHd9EJtfkMsscaY3huPhr73jOcdAiIOEWLttc
	MQ==
X-Google-Smtp-Source: AGHT+IEb6jrcS620SuawsDm8dcAts71In8z21uu+C1uHb7i7S2+w4kvORWkHg4Zn3dKoRKn7AByUgQ==
X-Received: by 2002:a17:90b:4b01:b0:2ee:863e:9fff with SMTP id 98e67ed59e1d1-2f127fa5c8emr7725668a91.10.1733955303743;
        Wed, 11 Dec 2024 14:15:03 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f12d32170dsm1630237a91.46.2024.12.11.14.15.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 14:15:03 -0800 (PST)
Date: Wed, 11 Dec 2024 14:15:01 -0800
From: Drew Fustini <dfustini@tenstorrent.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: drew@pdp7.com, guoren@kernel.org, wefu@redhat.com,
	jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, m.szyprowski@samsung.com,
	samuel.holland@sifive.com, emil.renner.berthing@canonical.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v6 3/3] riscv: dts: thead: Add mailbox node
Message-ID: <Z1oO5ewIOMFco4KI@x1>
References: <20241104100734.1276116-1-m.wilczynski@samsung.com>
 <CGME20241104100801eucas1p27cd0d7b9b5b4500604470664884c42fb@eucas1p2.samsung.com>
 <20241104100734.1276116-4-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241104100734.1276116-4-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_141504_508590_CFD828AE 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, Nov 04, 2024 at 11:07:34AM +0100, Michal Wilczynski wrote:
> Add mailbox device tree node. This work is based on the vendor kernel [1].
> 
> Link: https://github.com/revyos/thead-kernel.git [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 6992060e6a54..89de5634d3d3 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -520,6 +520,22 @@ timer7: timer@ffffc3303c {
>  			status = "disabled";
>  		};
>  
> +		mbox_910t: mailbox@ffffc38000 {
> +			compatible = "thead,th1520-mbox";
> +			reg = <0xff 0xffc38000 0x0 0x6000>,
> +			      <0xff 0xffc40000 0x0 0x6000>,
> +			      <0xff 0xffc4c000 0x0 0x2000>,
> +			      <0xff 0xffc54000 0x0 0x2000>;
> +			reg-names = "local", "remote-icu0", "remote-icu1", "remote-icu2";
> +			clocks = <&clk CLK_MBOX0>, <&clk CLK_MBOX1>, <&clk CLK_MBOX2>,
> +				 <&clk CLK_MBOX3>;
> +			clock-names = "clk-local", "clk-remote-icu0", "clk-remote-icu1",
> +				      "clk-remote-icu2";
> +			interrupt-parent = <&plic>;
> +			interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
> +			#mbox-cells = <1>;
> +		};
> +
>  		ao_gpio0: gpio@fffff41000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xfff41000 0x0 0x1000>;
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

dt_binding_check and dtbs_check are clean when I apply this patch to
v6.13-rc1. There is trivial conflict due to the gpio node label having
changed. I'll resolve it when I apply the patch to thead-dt-for-next.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
