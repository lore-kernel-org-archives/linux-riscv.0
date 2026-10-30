Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9212C606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 11:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R3e2Zvxk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EeaLjiDW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NhxB+pvU8WbZbAPJvzgNBPbfdcSuAJWjH84XbFnMGws=; b=R3e2Zvxk9740nCTad0gUumNCL2
	sF276Pl9j/j5FLnv567c5g9b+KLzBMmprQqGKmCrYdmhA7iStOZdUpNwpBIEXRQ6mB9hlUzEO6aBd
	lErKBUegY1ca/d6zh9AqBx5ob8rDl2feYA8Gdt/W5KvbK4eRrNvIwq+wybqMXA4mD+yyjpje9BO7I
	Nh5MugIcKECvqzcL+8IyTU9js+EHldTB6nwdnBWp6iHWxUHvGRH105OULfOSW30hRWrKuigIMHPMM
	1QRaJ7PL93WiO6psNScs+2sPzNpnMcpvfBCAROmpqQVPLManibEppUNdnIVkuO4UzhD8oOR6pEnJz
	OmuZO0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkw4-0000000BZX8-2E2N;
	Fri, 30 Oct 2026 11:38:16 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMkw1-0000000BZWJ-2ieP
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 11:38:15 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8a06b27bf9bso202421b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360291; x=1793965091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
        b=EeaLjiDW42Mi8315hHZK7ivQ0jyUL7PbYD7yRTkkxmeVZotxHVXQKLuWDNRy57JEfS
         s+kd6pCVNi2Cu1Tsbm6CvxDUQP5aS6mCqh+4A1OhF2wWQpajoTAzygjDce5S92fLqqdF
         Qj2qeOzujXpdnGPH7manV8gvfiD7460UWSnfQXjMBbB7VriVnzd7cCwb8wDUZ7YFcsLn
         JurX+r9ZaIkNoUpYT7viEE9GmNveiNkjjIPly5QdR3NamDUZzYLjubUbZYBmNRjiSB/c
         nCX/yvtqJa916G34o4TrxuwizAIxG95qPd8hf4YFIA0slDOyAqJ7vusuHpvLGXTH9bbu
         Ss4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360291; x=1793965091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
        b=J4Uhe9kJOZxYd+IdJGe6JYZBUQOrQILEQAOlfBk0Zkkt/q8ltAUELvCo1TQbgWkt2P
         z5G82w4SQWpZ8w/dxLXKmRBWDPMq+U1YeutJHuDwup5ghDeiII/gyDN19qSC66HiK7zY
         IzBpqsJPnhprMyt10erV1x9iOU12HZTQe1FO0p9XkAdtkFR/PFc1qSHIPvmUvN79Fsjw
         +7KFmvRgyb3ErifthBNjLONQYFqZxOnVGnkznijDG71Q0o0emlnTDMyzPaAdrPnZ0ZqF
         97mxbFSBEPeKkb1WUzc41O5GcejP7K5eUITK5FUpuZ+2H/POAZzs/7bxYQiFJjX+g/t6
         YUtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxs6pLkyi/T5OijZjMCGp4DE6hVJ/pKL6aj6mUFNCLQSiFcrfwsrVJXguWpLY6ATj48MfXtEUQipsSq8w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJac4dXM7DI4RIhktWAP/88bpsfEWQ5OVV1MSnqVLlXtHLZJEHo
	UldaBgiWroZVnBLO2oQePTe2zUde8yeklfdiqtVGE6JiBYqQ6MvPuldL
X-Gm-Gg: AYBFou1AyKzw2G5jeibjGdKtp+HtSXrLi/Q+xFkXVRaEWJcrT3ev8qd9IWte16QZiEr
	Jes6S7vM0GROc06X2Z9F7UUuR7iGkNVLBoz6fPnS9gmZtDkR5FgC82A/Z8sG2lUwpLDwJd1JD8I
	f4/A8ONN6SHwp0A+vAtmDHoDzcgFGoG4F8FDbOOvnJTaPGszFCBpzjcqA15uF/C2ONj7dMCYDWB
	j1eRUCJP/I7AlwRaeCUxODYo+v48Lwervp2rw9hd7B0m1jDO7pgTyPdJvE2G7fcB0IvbojRVMlO
	ahYPSmG2uh7SO1eFLyhbwMLrA1xXaV2MG5yfd+fS8BfnWdLq6Yvmv3nsVoVaoU1g48iz7JJ5zHI
	Uyj9Ilvi//4UUeEWKBCfYz5A/l7iZGyorNaADxJlAJyA2Y5b7CFDYaraSkPxkld3Z0FnKSLtbYI
	ZyC7Lx3lA6B/cnMBG1nSTQtARVe7zIoB6jdheCzSypm4FBy5tF2b0WdMDUykIzHJNu5x2toGXfS
	GCq5M/hVS8cNdWa9gEkMxxeFu2/xERZ/cqEekz6kW8AqO92CDMxrXYXzJyLZ8t6E+anxN3sjq8r
	o6567DH1CPjeQWS5ulc6uw==
X-Received: by 2002:a05:6a20:918e:b0:3e1:dfcb:5a75 with SMTP id adf61e73a8af0-3e928956abfmr1766192637.21.1793360291245;
        Fri, 30 Oct 2026 04:38:11 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ea4865c8sm679545b3a.0.2026.10.30.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:38:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:37:54 -0400
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
Subject: Re: [PATCH RFC 10/12] riscv: dts: bouffalolab: Add Sipeed M1s Dock
Message-ID: <auSBktpboye35BrU@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
 <20261029-pork-resonant-fb692b84bef7@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-pork-resonant-fb692b84bef7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_043813_702711_9C40C7FF 
X-CRM114-Status: GOOD (  21.56  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 07:07:00PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:51AM -0400, Kwanghoon Son wrote:
> > Add the M1s SoM memory and 40 MHz crystal, and enable UART3 on the Dock
> > with a direct stdout path and 115200 8N1 settings.
> > 
> > Boot firmware initializes PSRAM, UART pads and shared PLLs. The tested
> > firmware configures D0 TIME at 320 MHz / 380, represented as 842105 Hz.
> > Firmware using another timer configuration must fix up timebase-
> > frequency. The declared 64 MiB PSRAM range must retain firmware
> > reservations or be narrowed by firmware when memory is assigned to
> > another core.
> > 
> > The stdout path selects the native polling printk console; userspace TTY
> > I/O is deferred.
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                          |  1 +
> >  arch/riscv/boot/dts/bouffalolab/Makefile              |  2 ++
> >  .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts    | 18 ++++++++++++++++++
> >  arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi | 19 +++++++++++++++++++
> >  4 files changed, 40 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index 69d8751fb17c803f0efb8003e111ee24144c222b..294f9c119f8f1d608c878ca1f95891843301f07e 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -2,6 +2,7 @@
> >  subdir-y += allwinner
> >  subdir-y += andes
> >  subdir-y += anlogic
> > +subdir-y += bouffalolab
> >  subdir-y += canaan
> >  subdir-y += eswin
> >  subdir-y += microchip
> > diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4d63365edc095fbe9df31c4b12e29c4b624cbd1f
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c719a53c6e2de45f3718b48ba2116e99c70e559b
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "bl808-sipeed-m1s.dtsi"
> > +
> > +/ {
> > +	model = "Sipeed M1s Dock";
> > +	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bflb,bl808";
> > +
> > +	chosen {
> > +		stdout-path = "/soc/serial@30002000:115200n8";
> 
> You should be able to do this normally, with an alias. Why are you not
> just using what Jisheng did?

Because rust does NOT have alias OF yet.
I intended to post the Rust OF alias helper separately after this RFC.
But if this way wrong, I would patch for rust OF alias together.

> 
> > +	};
> > +};
> > +
> > +&uart3 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ae54e6e301ed2c5a1448d52c530c5074515ee38c
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +#include "bl808.dtsi"
> > +
> > +/ {
> > +	compatible = "sipeed,m1s", "bflb,bl808";
> > +	memory@50000000 {
> > +		device_type = "memory";
> > +		reg = <0x50000000 0x04000000>;
> > +	};
> > +
> > +	cpus {
> > +		timebase-frequency = <842105>;
> > +	};
> > +};
> > +
> > +&xtal {
> > +	clock-frequency = <40000000>;
> > +};
> > 
> > -- 
> > 2.47.3
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
