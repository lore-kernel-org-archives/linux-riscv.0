Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916BA606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 05:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2jGhLZcF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JB3ZqkcU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hTagvBke+tjIcrXYh7ZkC0donyXPmGTaNQ01O8RwNio=; b=2jGhLZcFrKKdxvb1OCnAypk3Br
	5ZrMWYay8uNxPSJmO6QottnMs9oYLJ2k5HeHfVziDuvsSH4v8cFGOLCccpzZ6xZewftI4X8g2Wvza
	A3uzuRUTFZ1cDTP5+wtL6behpnvzZ/oaIiUIAy4P3WOVVYf2GDaW7riNTXtF1tvyKd47tzpLSSzo7
	U3tm1Bxdsyp1gFbC7UXgdS0JJmXACjI6ohf9cf2lJ+gC9lmRJZ7iwV+/cawVw9mcxVRNVk1Jp+yxs
	L9ijaCyXEfNOdO+cB4Y36uaxiRbYK5GdfI1cE61751NRj4zENWg+LRfCNChzN2Ql4C+y5DtbAIWnF
	/9wQj7yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfOY-0000000ArFJ-1X7U;
	Fri, 30 Oct 2026 05:43:18 +0000
Received: from mail-pj2-x07.google.com ([2607:f8b0:4864:39::7])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMfOU-0000000ArEZ-3osR
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 05:43:16 +0000
Received: by mail-pj2-x07.google.com with SMTP id d9443c01a7336-2e538951d07so2745725ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2026 22:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793338993; x=1793943793; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=JB3ZqkcUz/iHSht91b60Vrvk3LCWZtfRO2G54W/Kq29MLp9Bb1QiRr1GoaKNH+BT/o
         8K8qGryFRg+T8WGLAipl2yi6ovNcRxVFkrVNB4nQtKzQvUdfcQrDGIz8ruOJHr5vwMAw
         W9oijlmEV8lKvbOuzE4kHH8fCOD+JHfYg4J96NV19NOpT8hP0P/tCxVnlUC8sqKOOIlW
         ZB33vfg5Qpb6q/W149zkhLqaEQm7WZqBiQygcEgcIEy06mH8TNB1NKBqI5oV5RAdvJhp
         8KffFCFdp99CxZyUzo/1Lk0BpBU8WKdTvwoqMDsrBllhc3Jt0g4/m9qta9KqcXGgT8je
         QC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793338993; x=1793943793;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCWYMiBYjhAym3CK4+93yurIeQTmlbS6kD3ZxpQIRR4=;
        b=iNnl9Jv10HmSTR+btmC6m0u72OHXehQPSb+qCfz3bbQciuAfAHUBZCI172DsA8uwxU
         4qF4QXREnsZpBQrkpoPyiGHWVuOv6aXIsbQRchkgnNnB4yLGMDMJY5tu8HdmIL+Ztic2
         RzWunvagQteXKSg1gbUex5c3G1Ya0VrPoW8p81Qg2lg2UO2icWSmmP6zOQegL38HMBAQ
         wZJX8Fwrw+uMfgWZthifJc6LB8FGiSlDCAN0MArWkveGVlxonjm1jqfrBy6Ui4029PEZ
         uIkW5HK1apvZBcO2MNsq9Ys+goVoIhkNoRpDicNJOW5AlX3uGi9ivlTPwXrocraAXb+F
         LjIA==
X-Forwarded-Encrypted: i=1; AKwUvBy56XRVgFZFCz4qWgVRVcPHpZbGzxN4ub+lnhOtUcBjfHVs34393dGIcu8Z7qBSD0xkmBu+3MWs/Qfb9w==@lists.infradead.org
X-Gm-Message-State: AFq9FYJHeAoV8d0mBuq10dCkcdwqpFowwLAIYHsL/SvckXIR9jspaOGE
	Z0Lqeas9WuPzG7mDiaEQwKK28gkSUFFn2FGIVYwbRsvo/6PMeRNb38lw
X-Gm-Gg: AYBFou3cuh/BogSVoj3wyrbEWCLkyeT/UkvZLZ8O63Ze5nSeK0rkOBCFGevHbrIVrk0
	ie3CkCIc1arnvXx5s9IBVO0QDMgPX/9cTnqx3rA88gKRl8qmAs359mJVtZZv5z5r4395RRZWJIs
	9+4Vc73Oo9KWFmtF5xT/7pWJJtTbbsok9F4kaOBGU5/qr/lNLWXIKMd8d5VYQBwkjEBbJ5MgsFD
	xg496eF/c0Wbvuw9Sg83CYfdXfWarslH/47wMEVmkcEusOAi+0cN6gBD3064LmpQ4n9hoQXT/+R
	U8ZmfFS7ZmWVvT+hbJgvkyhKo4CdGeTD+AFqHnpetp/xNGXEpnawKZf8hBYb3rLN0/NeoWkIxmN
	ZRVMfsQCNPk9fmF1rpVq6wdpE3K/gxCL1XmiagChFIEekgdorZtn0PD3BqEtg2RzcLw4PWUETEB
	RkbKUGMqk2m2YMRWhU2oV6hXJLq424vNdfHyT1I4H77CVMrXgLkIUhrywbAqaMicwyL3K7mYNhO
	UjC9K8p+FFiVhZm7qQ9WFc/L9FZfHvn+kj9xcSiffiVydXmVMdqURePNb7A+1D0XDq8jmQp/Rzd
	NAf6wVENc5Yw2G6QygdEZg==
X-Received: by 2002:a17:90b:17c5:b0:3ab:413:49b1 with SMTP id 98e67ed59e1d1-3ae897c0a0dmr1047677a91.48.1793338992989;
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e2a703esm7084621a91.0.2026.10.29.22.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 22:43:12 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:42:56 -0400
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
Subject: Re: [PATCH RFC 01/12] dt-bindings: vendor-prefixes: Add Bouffalo Lab
Message-ID: <auQuYJqQNv4LMDP8@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-1-b736ee920078@gmail.com>
 <20261029-unpaired-viper-830e55436015@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261029-unpaired-viper-830e55436015@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_224314_960956_26098051 
X-CRM114-Status: GOOD (  17.76  )
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

On Thu, Oct 29, 2026 at 06:52:15PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:42AM -0400, Kwanghoon Son wrote:
> > Register bflb for Bouffalo Lab Technology (Nanjing) Co., Ltd. Reuse the
> > prefix already deployed by Zephyr, including its bflb,uart binding.
> > 
> > Link: https://docs.zephyrproject.org/latest/build/dts/api/bindings/serial/bflb,uart.html
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> 
> Worth noting that last time this came up, we agreed on "bouffalolab"
> because that matched the domain used by the vendor - which is what we
> use as the source for compatible strings.
> 

Right. I'll use "bouffalolab".
I'll also remove the justification based on Zephyr's naming from the
commit message and cover letter. (I thought it matters..)

> https://lore.kernel.org/all/20230607195027.GA3894404-robh@kernel.org/
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 5471a06f93f1012f08e26f7f105ad846ab3629ac..24c670ff75b6f482ede1bda3b59c70ed9116042f 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -249,6 +249,8 @@ patternProperties:
> >      description: Shanghai Belling Co., Ltd.
> >    "^bestar,.*":
> >      description: Shenzhen Bestar Electronic Technology Co., Ltd.
> > +  "^bflb,.*":
> > +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
> >    "^bhf,.*":
> >      description: Beckhoff Automation GmbH & Co. KG
> >    "^bigtreetech,.*":
> > 
> > -- 
> > 2.47.3
> > 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
