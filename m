Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A01CD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFtbvFdx2cHCyOVwJ1T8GBCv7J9R+fV7QVtcqnO/gus=; b=VhwQ2rBvmrrrqA
	RmYfyl2Jaq+vY7bHHIzbGOFoGX0jz9v19w9/McDMjPRFUcCQIe4v361jrSgHjbAaNg6u529Eb40JV
	JUgdylRqeU4yQWLz/VwZWMbTH6yIBqkQv2j7O6znVHP6U4PQtyoB83wivxnfuPG2rQDVXD7BltUYh
	sW0T8ujGidynKZYg8IMh/VkkZS4cwk9zRv9+M4SiLXQrw9aGODNtIZSGCmB7yXKrlFmFz23cIVwj9
	JbVeMxC+c1jaJTiEINFHWjZEmUncrpZ5fScWZ5VssA3vS8NxM+YjNfNwUDCPJ5U3u3+qyV8LwjLMe
	X+YQ+iKFMs7l1jCuxiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0Hf-0000000GE8Z-3T5v;
	Mon, 18 May 2026 15:53:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP0Hc-0000000GE6P-40ku
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 15:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779119610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZCyUkEWRjyv2fKKDGGvW1Vl+jU51oCsDzDIRpAen0g=;
	b=Vo1a6AWHDhTTDRFMHiAjHLE6/+GjNE3nEeSWvm+E0uUYh3i6XMiP24x9ykwU3+6Qez1kdt
	6I9Bu1rdgpb8B4w+pANgswE4vgr1NTNCN77ZaDOWe92HI1QXREYSPdg47GUtHeR4NEBcMI
	wVHP/e3JLaEPPVJb2DYq7P7LDM8MeDc=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-226--124MimKOWmMoCQbiNs-ww-1; Mon, 18 May 2026 11:53:28 -0400
X-MC-Unique: -124MimKOWmMoCQbiNs-ww-1
X-Mimecast-MFC-AGG-ID: -124MimKOWmMoCQbiNs-ww_1779119608
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8baa173eacbso39897296d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 08:53:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119608; x=1779724408;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wZCyUkEWRjyv2fKKDGGvW1Vl+jU51oCsDzDIRpAen0g=;
        b=P2nvnjdsSMM3aRKsE4wnyXICUT2i+F0CzRv/el5pOFzahUTmQOMXGsSXKXKyLFS5G9
         CeSeWF2q2LTEYhEElH09cWC6RN+Rz0tdj9uk2oCxV0gYGhxmgKHLI8QeZThGv05KodEA
         Oo/gRqfsLkkpf6OWR9yj7jM3na+HSqLiMdIron0NJVWtTWgefebjkpHVfB8elLCngSgu
         AWJ4nxgDtSGfcsH/mVIUgIVKv7hWjO6zTe48l97lTwxref987uXtC/KUow1IXElc9ENi
         B6KPgW21K2FefRKUCjaMzYHkYK0Hu0+YDEVXG3054Gde+3a/zwrWehPqOAidcyoV8+qy
         5mig==
X-Forwarded-Encrypted: i=1; AFNElJ+JEDI3W6kEv/I/YkrgvT8iWkvSqKE0R0anLSJ6kLyp5z1qFj5VRdWxmAs1b4Gw9Epy6TPmlgXIbXMiKA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNgsE4kNG0C4jWhHACTaVVxknmio17WctJiu9ezcblAeHKM8xF
	2cSJ4khiYfRFh9+Cl1+1XG1108Q9qFnmvRl6nqa1OoEIg1y3CzrK9T3rwS5vJ3SRxoej4GCD/jp
	huvbRnm6ShaRgqBqw3HsunYk28FXJZwLkhTcE+dM9b0qBOhAASp3BgO/lZkX+mC02FEtnjg==
X-Gm-Gg: Acq92OFr/wed4x7aIxHu8cb1crwyByk2DJw51NcF+qbLqq3tVF6NRmsQRgrYcnFmKzq
	2a8eE6PehrphbbYgCOmpS+bg2vMmPlTS5QjrFhQJSQzhw49k46piSqR7nJcYDGuifz6ypidvhxr
	1wPRJhkpCZdtGZJ6hdRepT5BWryp8yV8dIylag6x8H0kMi5vT63k7CWNznjsFH4gctPPUvmmkJw
	xnAeBG1Kno7s6ozwh16YBHlKf/TLzSyO6FuexEybJURoFiR/kjJJKj9By22OhUda85R9PYb/h0A
	tixLj4dugMVaGXrI7vaBu47fVxOcAo8Itlt7BIDW1nyZsSr3JbUlUr6f1lPcx0/XQvCAvjkThRl
	9KhmHgceDt886Tsl3oO3DsnrxRS/KXJo+qyxSuomRFbWBWFrOV/WBKwvk
X-Received: by 2002:a05:620a:4006:b0:8c9:fb69:e708 with SMTP id af79cd13be357-911cc6aeac9mr2295180385a.25.1779119607769;
        Mon, 18 May 2026 08:53:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4006:b0:8c9:fb69:e708 with SMTP id af79cd13be357-911cc6aeac9mr2295176185a.25.1779119607260;
        Mon, 18 May 2026 08:53:27 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910baf2236fsm1529569185a.20.2026.05.18.08.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:26 -0700 (PDT)
Date: Mon, 18 May 2026 11:53:24 -0400
From: Brian Masney <bmasney@redhat.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v5 1/6] clk: correct clk_div_mask() return value for
 width == 32
Message-ID: <ags19ABMNAgtao-k@redhat.com>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
 <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20260514-dr1v90-cru-v5-1-34f3021aab51@pigmoral.tech>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mr2O6a_B8qemCiS7HYfAhceIEn-laoYi_IwI4rwZveA_1779119608
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_085333_065594_DE7E1AAC 
X-CRM114-Status: GOOD (  13.34  )
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

On Thu, May 14, 2026 at 05:27:17PM +0800, Junhui Liu wrote:
> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
> 
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
> 
> Fix this by using the standard GENMASK() macro. This safely resolves the
> undefined behavior on both 32-bit and 64-bit architectures, while also
> benefiting from the built-in compile-time type and bounds checking
> provided by the GENMASK() macro.
> 
> Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Cc: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
