Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D6CC4725D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 13:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=x0gi8lFGu7xWf0fz7Of1Ig4Db5RcPf1cn2mgHiFxl+0=; b=1cLRlhR+GAoliR9D5HQUXCR0WG
	f1W5DHZN7nnnkkcamQtO/e13e6wrKi6OojqaBgyJWkRIFJ4WG0G+UHMT+ZQ7B1FkazEYR1c0XFx93
	G4/wOp1Wv/teCIjrwFl592hQ+n4qCUbY1W+KDxmlsZ4FvqU48QHthpN0TAyper2mumoCKgJjcma7W
	S3TVCCHdu4MvwDT40OdCRyLVr0gE7H4NKX+rBDZqgI8ByC2mMTXgqmnJh6lm/UPZBiHcNU08FLBdJ
	viJV1Onl7m30vtL9pfZyNDHhPym4RBH8ozaaOl0X+mrKJcVKB+I7Rko8EXx5aLh7Fk0PhBcoNNny2
	V926JsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuIp-00CHiV-2T;
	Mon, 22 Jan 2024 13:25:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRuIm-00CHgr-1I
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 13:25:26 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DC6F73F275
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1705929919;
	bh=YH8oe3j90TqC6EUcRLoZewEzXWg7T54K4/yaoqW2dG8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=I1Hboj50NBVRf/Ancb9KRXF956ETQXZNPO0JDlxxHjjusimU1dMIAgUOaTGi7rbeU
	 yyhdvSFpTwGzqujEl7EgXZHXdbjMHXD+8mBBZ8wqG1W2v5f4hTsRpeU0/neapPH+RH
	 MGpDYU6mYa0w2wPUhVfhvi+qRN8WhNSd2k92BUYLwNxeYiJVneY7cCY6WVIOcVcnQE
	 lVQn37VFP2UkwONCD+YdOMJG2GK3P2blXQsek+wOALpDSxKfwQr4JWIpmL7X4zn2s2
	 vlo1/qIkR3GNrVoOjSr+9VYznTgtSWFJFvt1IZCChGbi9mPBATyBSlaQan77hRnWAa
	 9z3m1+udseGWw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-429d0905823so58408251cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 05:25:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705929919; x=1706534719;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YH8oe3j90TqC6EUcRLoZewEzXWg7T54K4/yaoqW2dG8=;
        b=sQhJ+0oM+pjANV+gS7hP1Uyt8jMVJ394xRGEXk70hcmUsbPz0xzm296Q3W3pa0CtfO
         3BQ/aoIHfcL0Oq5CbjHZEKrklMSriMRs2ime4TE+tOQDnCB9CWpzFemIs5d2Jl2EL+Xp
         CkwhHV9Opsg9RtoqMpp32DBDeUF3AwgSKdo727Cms2dahtp2xTJPUaJGG0A7uslPKg8L
         +WAPG8HYpzW0RsRomgJBqyQXEUE2mLZJjNcoXz4KPE7AsvYifXKyuypKd3xUVW0O82fa
         ISOoEsEerpmHtNMFCcwQDYw5Ikcdy83U7zf8C5J7St+2samGXy4YgvdC+tQLH2Rx8Zjw
         IBiQ==
X-Gm-Message-State: AOJu0YxFr6xi/oCUDlIt4rpsXFB+I5jJ5AYNWhNxQaeQizoZ/hyAVFXn
	Gd3J36kfZbY87Ool0OEDoxkKamDJ9RTO8zZ6fYop6184+gjQbYmCwiNmbJOxxUNgZctDQkgUKh1
	Ux3IiSGqZgwnzWKC5Ivb+IfFxD9R6nh3nSnuF9mlCAnwVrgu/HPXgzRCKCNb0cTxl5Rg7+UE6rp
	yO12rMDG8ZJFZAytQxryUZem9yJRU9sYCgGUpvfRz581ATIpwgJHMce6v+
X-Received: by 2002:a05:622a:303:b0:42a:49e4:b37 with SMTP id q3-20020a05622a030300b0042a49e40b37mr119066qtw.3.1705929918837;
        Mon, 22 Jan 2024 05:25:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7+muAaQtx9j7uChxp/TBkqVQgMiOi15ISY7W8przRxn8y+BBacZEXgLJg7UZEG/dbFasUGtdYFB6HCnf8ULY=
X-Received: by 2002:a05:622a:303:b0:42a:49e4:b37 with SMTP id
 q3-20020a05622a030300b0042a49e40b37mr119041qtw.3.1705929918598; Mon, 22 Jan
 2024 05:25:18 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Jan 2024 05:25:18 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240122080631.2880-2-qiujingbao.dlmu@gmail.com>
References: <20240122080631.2880-1-qiujingbao.dlmu@gmail.com> <20240122080631.2880-2-qiujingbao.dlmu@gmail.com>
Mime-Version: 1.0
Date: Mon, 22 Jan 2024 05:25:18 -0800
Message-ID: <CAJM55Z_DFox9c_eDeHtx9H+9e4A6pjkCkt7po94j_mu-tQWywg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, alexandre.belloni@bootlin.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	chao.wei@sophgo.com, unicorn_wang@outlook.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_052524_588741_7ECB0E18 
X-CRM114-Status: GOOD (  13.41  )
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

Jingbao Qiu wrote:
> Add the rtc device tree node to cv1800 SoC.
>
> Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index df40e87ee063..0cd7eb9a3048 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -119,5 +119,12 @@ clint: timer@74000000 {
>  			reg = <0x74000000 0x10000>;
>  			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
>  		};
> +
> +		rtc: rtc@5025000 {
> +			compatible = "sophgo,cv1800-rtc";
> +			reg = <0x5025000 0x2000>;
> +			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&osc>;
> +		};

Before this patch it looks like the nodes are sorted by their address,
but this would break it.

>  	};
>  };
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
