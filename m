Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4566A606A31C
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 05:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PUAaWJUI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gh5146ym
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WCvPFyyRKQexNzPlAbkxQaUgBkBCFzq6dxAQHLyoIns=; b=PUAaWJUIjz15yIZfMtzhQlzfSX
	qACX9gDi8Mxl/RvZe5IBcejcPsDt1vgtps63gGJfATMR5bJTHGrz9RqPOefDiZR8gse76WbijOlxl
	2m62iyBDWUAOkRqtAnHY3kR3WuS6hbyORSoLQehT/KKDExsgSoBnGyoDLQ9TEFHij+CuAc7fKcLjb
	mUdZzh9TdYOwM0H89JQwxqpfEShgzLCooWz+CANITXpm4rrdoXmKyWJ+H6yzyOOa0uXP3YCz4Ri90
	42NHz2Q/CXGoM1T6fOyKVyLJobmdLThSddurHLwOaFY0LqovLjWfBeXejDyuRiOv+fNTWau4RbdzQ
	7NyA0cSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfbK-0000000Arpc-3YAI;
	Fri, 30 Oct 2026 05:56:30 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfbG-0000000Arp1-3viF
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 05:56:29 +0000
Received: by mail-pj2-x07.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so304500a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 22:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793339785; x=1793944585; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1anniFrPD+gJ2zvk7tqiNGRs4XaU4IBzFvazZsvzhO0=;
        b=gh5146ymvrBdPrJuePT0zVLL08BNCEGV9Z55ppZstXQ2FVWnx9nwEekSM2e516dVjE
         u3mQ8JHSAUZ3Q2hZT0bgX05RIhm7sPKZ9wWwLpM4S1b+p1Ww1dKG8AEv0KAnxfDcyyI1
         dvJyPitJVkjBlsrWfCUhhEoH3jouZq31hnzlg3VP6TopE1/xxK0DxZwxgCYNCVnmNMQI
         2kofGfpQk0NH9QJL5G3dNYD6G0OeWSGgG6yHJHl9MnbxpNTvTWCgbRANulTK+phLO6cz
         CugpwBZRIPig6HKOhe0Sn1WJ8b3Z33n1tFJ2iDx7FJm56D7m3S2uMd4ZeBiUervCrDP9
         rGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793339785; x=1793944585;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1anniFrPD+gJ2zvk7tqiNGRs4XaU4IBzFvazZsvzhO0=;
        b=Ql9OmULO0TkjTEGDlxceVBGZYAbvriJQ4wEpFI1fjyMW00QddRGYA8Bdh5S7elFAnT
         mxlqqajWqos8ExoeNiam2fEUW+lCKnsSjYnHRX+pBxsj2jsNZeHUlPFBjMf/uXwK3z85
         /NZNznU4nw3QO3nTQkdqAssQEVpGLxrmBLHh5vKHcQR2Xm1C7YIOUZ50Orz6lGGA6YbC
         ls45ZXIcE9pVbIQmlFoBUYIYpOD0yVgASvMw/3V23NJTw33Cm6MFlaRUJm/U4y0o+eFd
         Sw3XV+BcYrhu3lI3vYQAeZf7yxyeMaKW9r4ce4Uz0US3y9PtXiMZdHhS4ZctXBMe1zXg
         Ficg==
X-Forwarded-Encrypted: i=1; AKwUvBzoC37bCkxdkgK7phRKDM3cZljF3AX4TCuQWJL2UWoR44AwUkEkSGyqASL6uQZx5DuVrtsm/A0kFyrM9w==@lists.infradead.org
X-Gm-Message-State: AFq9FYLXppBm+26dju9+pUgKwE9mPrsfWQfmhuX3karBPKIhzp73OO7R
	KunconwMUlmbvhjIzEZP6qn/DT6soK1QTglOXvXjDHlUe5IXuXhNKnXa
X-Gm-Gg: AYBFou382hmQOaFMc078Ss5+BO0r4j3ThGcSL5uP6jPtnkr6i04y1zEg+7jSwjYQBip
	nbE6g1TQuzhx/YlBt8ePz1cELNT78upMfxD9ZIavwsvJ62Brp+H+IUTHRuyO40obLySiN0Dcpz6
	EQuVwaqjVbISL+X2IqefhHtVNibILUM49pnuGx4j2s+C1dcwchl1nahjz8KMGGJoA90iSX6xfaM
	DvPhjLZ+bOjkzBfQ5Zq9raWdwDqJ0gquAdB5y7rBqdkxZdri+9kcseOON4+XCcfR3I8U7zU1Zc1
	paNNNrSGuQ3dW6uQU2LZeaLOvUxcCkpBxKiOWUxNyyVVjzj2S/tAQiCpKwGhqEP8eDWIE7xllYc
	HIg68cgKrkIgSDTrrLIcqAX5BTQx9JwbYhVFTy7gHrYrHEw1tj6asaIEpF4nPOhQWWSwuYuMdWZ
	kwxd6M/rHljagz5PQ86/67Iw6jx/8djXV+VMaxHQR9frFz3ft72099sgyF4iRBlZw9ofMtFWVTE
	FKYwhjo6edA6sXAK2dXkR01RRn11dTQVMg3X7/sKTvpsOFGDYqvhT8zNrLcsP54LApe4P39jPTu
	pChIa9EwOETZu2zT8RDwBg==
X-Received: by 2002:a17:90b:3142:b0:3ab:4f1:4f7e with SMTP id 98e67ed59e1d1-3ae897f3919mr1033345a91.28.1793339785483;
        Thu, 29 Oct 2026 22:56:25 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae8454327esm2520564a91.4.2026.10.29.22.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:56:24 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:56:15 -0400
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
Subject: Re: [PATCH RFC 05/12] dt-bindings: serial: Add BL808 UART
Message-ID: <auQxfw7NgnfnVi2G@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-5-b736ee920078@gmail.com>
 <20261029-pouch-enunciate-e74cf84e42a7@spud>
 <20261029-sequester-countable-6a7b597c2551@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-sequester-countable-6a7b597c2551@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_225626_978345_AD4832D6 
X-CRM114-Status: GOOD (  24.80  )
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

On Thu, Oct 29, 2026 at 07:18:38PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 06:54:49PM +0000, Conor Dooley wrote:
> > On Thu, Oct 29, 2026 at 01:05:46AM -0400, Kwanghoon Son wrote:
> > > Describe the UART register range, interrupt and baud clock input.
> > > Initial Linux support targets the BL808 32-byte FIFO and reuses
> > > Zephyr's bflb,uart compatible. UART3 is D0 PLIC source 20.
> > > 
> > > Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
> > > 
> > > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > > ---
> > >  .../devicetree/bindings/serial/bflb,uart.yaml      | 57 ++++++++++++++++++++++
> > >  1 file changed, 57 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/serial/bflb,uart.yaml b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..df29d258f0a1c6d7bb283cf19c4157436991b64b
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/serial/bflb,uart.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/serial/bflb,uart.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Bouffalo Lab UART Controller
> > > +
> > > +description: |
> > > +  UART IP used by Bouffalo Lab SoCs. Initial Linux support covers the
> > > +  BL808 controller with a 32-byte FIFO. The compatible follows Zephyr.
> > > +
> > > +maintainers:
> > > +  - Kwanghoon Son <asdfkwang@gmail.com>
> > > +
> > > +allOf:
> > > +  - $ref: serial.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: bflb,uart
> > 
> > This needs to be a device-specific compatible - please just use the
> > binding already reviewed and agreed upon in Jisheng's 2023 series.

Again. I'll base this on Jisheng's reviewed binding which is
"bouffalolab,bl808-uart".

> > 
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    items:
> > > +      - description: Baud rate generator clock
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: baud
> > 
> > Drop this clock name, with only one clock there's no more need for it
> > than the interrupt-names or reg-names that you do not use either.

I'll remove clock-names from the binding, driver will look up the single
clock without a name.

> 
> And additionally, I see no value in picking something to suit zephyr,
> when zephyr uses things like "bflb,clock-controller" or "bflb,pwm-1" and
> "bflb,pwm2" and so on. Make a clean break and do things correctly rather
> than try (and fail) to be compatible with the zephyr dts.
> 

I'll describe the hardware rather than compatiblity reusing the Zephyr
name.

> > 
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > +
> > > +    uart3: serial@30002000 {
> > > +        compatible = "bflb,uart";
> > > +        reg = <0x30002000 0x1000>;
> > > +        interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
> > > +        clocks = <&uart_baud>;
> > > +        clock-names = "baud";
> > > +    };
> > > +...
> > > 
> > > -- 
> > > 2.47.3
> > > 
> 
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
