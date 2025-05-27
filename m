Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC11C54F30
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 08:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDx1QRe6ni2r1gNATcvvALXqnZz76PDW8i7KJ1r1R0w=; b=xIWpL0cbNI0XUQ
	vMS9oEA2l+adKqz23TrmSsYoQE6fljRLlzssU012NpLWvFnukQXoJkvCXtplcnXdiFqQRjagwXj3T
	a8eLtqwPf6ri4yQa2mVUfJiXGeolSjLdl5yHv3qZltSjZbuJ8/kxEO07mSUtLMmszxw0ZYJhbuKVj
	fRkDRPhTC0bsKmhZ7bKOeQyyCvZhecx+2U1zIJTfdIM2+0Q6sIt6Q1WFl4WqTeZpwHfbTQMXwsDiF
	wK9wVqWbAZEer6AI20BlfHwsxZ/CuCwTI5PXUG7piofDN5Yh4DBOkhmCkodNXGAE13bfAxS8vnsWu
	cPqnxQbKCIEv4ZzHKGXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpEQ-0000000AClH-3XOF;
	Tue, 27 May 2025 08:00:18 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJpEN-0000000ACku-3QEc
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 08:00:17 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2347b7d6aeeso13762125ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 May 2025 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1748332814; x=1748937614; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69mSzDBjctUjkk/D5FpImgqRo3X987asQpikl13S/kU=;
        b=2+judXSvZ/abQzGDlJANaHxF7zR9AA7x0XEaHg70I63linBqx1+xuQMkY0VmNXqIkz
         LuCZl3205Z0kiHJqUYo9scox9lj1kAHra3saXlg10FdDXLEiHoap8KCSDimPhTJvCdcs
         wC+W2/5dvCD4C4VyJQovj0QrsdaqrKKC38ZOHGx4v1pzyL9O9SU9Fwq1iWWpMAZsAbo1
         4vslSWVZ9YZqAM4T1Ep64Q6cGuEhi6dTRmmRBQEQDvWRqQdzRK/MAKk68GpiEJ2O2USZ
         xSJP2Su2aMQV0tZIYTvmOE/6KXhrba/UzJ0aU0a+NF8IKCYzfh3LLe/aHOetB0PSdats
         /Zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748332814; x=1748937614;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69mSzDBjctUjkk/D5FpImgqRo3X987asQpikl13S/kU=;
        b=bvQcx2VeKU+dug2m4pztT9vRQfJi7BaysesV2ll5CScsKJG0tuo1CpsvTkbrVMH/Ze
         2GElgGqrCO9UXfTEjutkqVwDNjlmuce2P+WnAA0wyVyXtlNPE6EZmaiZ+s6nxI6P/9IN
         /Gc6v8zYMet/FlfC/tvBre7SMQ/fS8jSyGmdwOMHPrAJHRBGjHayw7kJJc/c75PcCAQ9
         ex4Z0jBnEzB2gDlTGfBCZQlH7PT1n3EtCpU4YyDk0dR5A60jGUebwI1yS4vbwxhssNHP
         qwijGrvVLbR8I8IjoSIzZaelD0PR+V7vSuCDkFCukPkBoAGQVrXKdl9i6m19PnW3ANGv
         JFLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHysUS6FOsCjptKmowyDgYpKGpX4R74vMk8Hy6W0RKfEXiFFtNAtTX4WizZ37+sDNoFgOOr8BHEhkoLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLrJR19f8yUKs9KIK3houxkXWk3EDe6mEWJ00lLOAfyLmZ9hA4
	6Pd3UfVHeS1i+CgqluNsEFE06iDrkv/nLa0wbw0BTP6rejcl3hh9IjgQkx1yWHIU2Mo=
X-Gm-Gg: ASbGnctR7gEkV4DM1sRKx0e8JpBHYb79WFpc6EVF/S4A+WyKrWIS8wzUDXIcK06b6rz
	Z8xDJDn5Q6CQv2oADbCBZtQzZJc//Qzaoq63Mct9drTRa94EOve2l2yeVs486tzpNww5z/sBXdi
	q7wG7cKHgUVLEYr63fWOi3PmQfdY3zDw6A5YIE9Y/WZJgkix6PcXxLkyrszJxT5Z7JC12/XlrxV
	cLGYpJJxUnkpJ00dicdeODUlyOgf9tDQeZkxCNu5EZuNx0WVFYc/9pfpTsz4BaiMeXk9HYT8vp3
	LRx2hsRHMEpJDc/UsYjeunEcGGruiHvVvhnm9qpir7YLE/yh3OxxQkFh94+BAwaeowhGJ5vQxg=
	=
X-Google-Smtp-Source: AGHT+IG/9w9RYy8XeVSB35Aj2XQw0SQ1Z8HiupqD9XgJZnnAgEoB0hzA2HUmbCT1F6TH9+lzKYQesg==
X-Received: by 2002:a17:903:1a45:b0:224:23be:c569 with SMTP id d9443c01a7336-23414f80419mr226841935ad.22.1748332814563;
        Tue, 27 May 2025 01:00:14 -0700 (PDT)
Received: from x1 (97-120-251-212.ptld.qwest.net. [97.120.251.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-233f8b2dc89sm65321825ad.114.2025.05.27.01.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 01:00:14 -0700 (PDT)
Date: Tue, 27 May 2025 01:00:12 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 5/6] riscv: dts: thead: Add PVT node
Message-ID: <aDVxDJi0KkWXiPCK@x1>
References: <20250524-rust-next-pwm-working-fan-for-sending-v1-0-bdd2d5094ff7@samsung.com>
 <CGME20250524211525eucas1p244963b69e0531c95a9052e4a7a1d1e01@eucas1p2.samsung.com>
 <20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250524-rust-next-pwm-working-fan-for-sending-v1-5-bdd2d5094ff7@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_010016_058649_09749BEE 
X-CRM114-Status: GOOD (  16.26  )
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

On Sat, May 24, 2025 at 11:14:59PM +0200, Michal Wilczynski wrote:
> Add PVT DT node for thermal sensor.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index f24e12d7259fabcfbdc2dfa966d759db06684ab4..faf5c3aaf209b24cd99ddc377a88e08a8cce24fe 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -648,6 +648,17 @@ padctrl_aosys: pinctrl@fffff4a000 {
>  			thead,pad-group = <1>;
>  		};
>  
> +		pvt: pvt@fffff4e000 {
> +			compatible = "moortec,mr75203";
> +			reg = <0xff 0xfff4e000 0x0 0x80>,
> +			      <0xff 0xfff4e080 0x0 0x100>,
> +			      <0xff 0xfff4e180 0x0 0x680>,
> +			      <0xff 0xfff4e800 0x0 0x600>;
> +			reg-names = "common", "ts", "pd", "vm";
> +			clocks = <&aonsys_clk>;
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		gpio@fffff52000 {
>  			compatible = "snps,dw-apb-gpio";
>  			reg = <0xff 0xfff52000 0x0 0x1000>;
> 
> -- 
> 2.34.1
> 

I found that on my lpi4a that boot while hang after applying this patch.
I think that it is related to clocks as boot finished okay when using
clk_ignore_unused on the kernel cmdline. Do you happen have that in your
kernel cmdline?

I need to investigate further to understand which clocks are causing the
problem.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
