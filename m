Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B4C606A31A
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 02:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=acwlImwr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bciaoLia
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZqOgB3DbM89FGb87SKxIyPg1cHPWD8ELhOpIbLK1XQs=; b=acwlImwrLuVOXJSBixFLrPheAc
	i0OhHnM0grRyI2L4XNiYatqjV1VGHKQt+1B61K3067WxV2xeyzoHiyqrTWH7c/mK4K/mv9GRRjLJ5
	x2huAYLd6aeIkZDEaPFVGlqNb8S1/7leFjWRWHpcr27Cpp6nlk9Yca5Ed760gY+8nvYQpWzGQrM6h
	017vhvfSqvZSgCmO0EFhwfzYQKRybDfEY5BU0m4YM1jXW2a2iU5HcFofbuUC0HWk148njcLDmpW75
	1N2cFsxd039LuzWMXCc/h3aPfwdBQtWitr0IefEVHasDqo2BT27loT3aZ4FpKKuXljWFFdVoOdF/j
	RnU0kRAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsdV-0000000FcLM-3kjL;
	Sun, 08 Nov 2026 02:28:01 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPsdT-0000000FcE1-1D6n
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 02:28:00 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-1b2513decc3so100397c88.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Nov 2026 18:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794104878; x=1794709678; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=bciaoLiaEsXEbrSYA9jeCKUJBkPTObBvAVg/g66uQIDt7NlwZJT/yTqWiuROU4YRDh
         Khy+LdPRB4JJF951TOlT2zO6DFqLvzBahcvyfDtrReuYT2/5LcLWD8xfcmnWFfhgjFo0
         Csxncp9v5Ebw9BZlIqta0XIt/H+QNfEwNub1uicpBUz1Hv5+IQ9wM0Zz7SN1RoRO0TAr
         bfvjmqUOblugB+3XWm49oT6UhE8lrWxPMaVytwmTixG/e+02H74VWXryl9ZGpfHOq+SK
         P81QqfQadpCqzwktb1DKMwoaFeN6qM/ZUQbEZunWAED0DjLqsTxFI2FS7uorWTJv70CJ
         bfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794104878; x=1794709678;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CgFyMsoiKO2B1HX2AvfFumGFOpktUiaDt0kSWOji51M=;
        b=sHoZMn60MloUtQgf4EkvBQX2veP+almOq+0wEUi4h3Mk34bGSQvjDQDwageLTqKjlb
         Q5dTKg5dLFLnnqbyn7VY6x30hTaKq53JBNHqcWRBdMtdtROZU4LT47IqVKQu8Iep9sOb
         GRBCwFaVn9OtF6IYBmZXksmRlbgEcGKpoveGXA2++NDZpJXQdAn6xLh+Ck8IdWlu4RP7
         2px3QVrEVoXa9JLIHJogyRHjL+ypAcY6Dhbwvd90KdZJmG/APh1CbTyXiHGyYhhZiDDd
         BK94HWnQCMU8yTY73RS6vODizfKRVjXTSOkHwB8pY5THjqs3g0EfPd+gx/1kY3TzAX7W
         BqyA==
X-Forwarded-Encrypted: i=1; AKwUvBw9LzgteJc5s/MpJEeu44EWfpcZj65WV5TPE1GYRhPdBCnve/4PQ1gaoiDAGG3Bb9bma9xcgBvMRbky9Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+5pD2fOOX7N6jtZ7afwwmXqJl6ZK8n9LCBtjB5Y6Acb+t6SkQa
	oTzQVchhKN1WbGSLadPbH//NCLWKzP7nYoDXPjuRR5jfF5aG5uYnYeoh
X-Gm-Gg: AYBFou14VUpMYqaKGj/MwTK96WkgTBLU6Qd/yQN585D38yxppEQwi0B6Wdpk3lkFK+2
	QJs2q+uqx3Q+mpSVFW/CRjwIKx8cDE9rj1S+4pbuvSL8AgvkXEv2PWZ02ePu+TqzLOYCev0jYKz
	yPTLhl1PotEPs2GFHONATyO/XnyVYoVP6z7lgYY4aSjMkxq1Od5SXNMHIpgwCxc7/Z4+t72jMIw
	tCiJ5HG7jOoaLn+W01SEHcrZd6sGSP6ViEkTDDT5Ob9Asldqx4h6KxxGO3e/j/B2n4cwtgFpwvX
	0Es2H4eLbaSHDieKnf0sKnnYI1MRtzJTv4MBltnMFoUztMQo4gcCCqgvHtk7hLg/7wcrortpRTI
	hvpHUPmb0XnxaJpxBquJNCQBiZL1MptUf4rsmcyx+hRzsGrKPm5GQMqAqZ1k5p7b+9NemDRHrNH
	Pmuoj53F3ZB6fPSfHfBhAPjd838WrpwFOsM8bPHa2r1frKq6G9Fnp4AECULp6ANsGSgRcrWVWPk
	MrX6Hr67HweGZKejlL2M/MMDx1QY820wFAwratbQcNgPS7bM02SNWsL3/0Re61oEX/b3RBjOrtL
	vP9nsF2yoNQYhUxD2yIm
X-Received: by 2002:a05:7022:b0c6:b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b39ff2dademr463410c88.45.1794104877934;
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm2390172c88.18.2026.11.07.18.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 18:27:57 -0800 (PST)
Date: Sat, 7 Nov 2026 21:27:32 -0500
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 12/12] MAINTAINERS: Add Bouffalo Lab BL808 support
Message-ID: <au_eFNCt54nlCafy@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-12-b736ee920078@gmail.com>
 <20261029-spyglass-evasion-772697094cb9@spud>
 <20261029-amuser-savior-6a6ab062f471@spud>
 <auSDJH9V31wmbrYv@debian>
 <20261030-slider-finished-360b10521e0b@spud>
 <auXQaY25XfYzxEb1@debian>
 <20261102-throng-botanical-b244058ecc37@spud>
 <auqC9jOIQTyieQUJ@debian>
 <20261106-dislike-despise-91106ac848dd@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261106-dislike-despise-91106ac848dd@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_182759_359114_C4AE1717 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 06:00:13PM +0000, Conor Dooley wrote:
> 
> Cool. One thing that I noticed, and felt it was a bit odd actually is
> that the uarts are fed directly from the crystal oscillator. Jisheng had
> that in his original series though so I assume that's actually how the
> hardware works?

I carried over the direct crystal reference from Jisheng's series.
But will change in v2.

UART3's baud clock passes through a mux and divider. The current M1s
firmware selects the 40 MHz crystal via MM_XCLK, while the APB register
interface runs at 160 MHz.

Following your feedback, the UART node in my v2 work now describes
complete form of clock itself.
two clock inputs:

clocks = <&uart_apb>, <&uart_baud>;
clock-names = "apb", "baud";

uart_apb: clock-uart-apb {
    compatible = "fixed-clock";
    #clock-cells = <0>;
    clock-frequency = <160000000>;
};

The fixed-clock providers currently reflect the firmware settings.
I'll add proper clock-controller support before submitting the DTS.

Best regards,
kwang.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
