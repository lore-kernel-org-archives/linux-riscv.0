Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9746D711C8
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 23:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pPtBMxetmom3ANWW2ZqxKh3OtpPpdaU+EpcAVMbbWEo=; b=33jSzOA/ofVG5C
	Bfl7NWa3Zcp+DtECQT/w1J5bxNRiMaX5AYASKT++fbSkA/Xi0k08XxW2z9d1DqAilrB1Dr/1veGZS
	ErrYjN84QVkEYr5yAeoxeH8XEEtZXOf+5p6Gdr83FS/uOFfEni12nIj6Uii2MsKkiOqEQErdpZIP7
	H6vXb6mKY9+KkDB6VoNDCHxfYjv0DpJo+GPoVRj2X2NqPcQ2VRj3leuQibRt8WG9eRYR6OEc8QfT1
	/3tk2Pk9nSbqkhUc7VvMiiu5IuZfbdqcrYdRDp3qllSmAofaIVs3QXoRvkA2+jlSnLmU9fMQt1Qxy
	oGgvXWPFIlc0CkzQuoWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNYo-00000009M8M-3L5R;
	Thu, 18 Dec 2025 23:37:30 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWNYl-00000009M7m-1ebc
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 23:37:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766101044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=taL4VecI32GOlELm8+8Vnt26fKCO2BjXM3Lzuu9k69E=;
	b=bEjX6jNQ9YVK5N6BE8QwuKMKN09IHvdWm5gskXjYbU8ccNTMzMO5ofTwVl/bT7byXs2k0n
	djbROJznMLsdcuxMWEtpbH4/DblqZAWii71Pv1+IvKsfHjuUZju8mv9/GT3Ebp7EfkCN3o
	u/5AuwSvVHRgAQ7K3agwGl8M3drYgO4=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Zm9VMEhSMr2JBsPq5NV0xQ-1; Thu, 18 Dec 2025 18:37:22 -0500
X-MC-Unique: Zm9VMEhSMr2JBsPq5NV0xQ-1
X-Mimecast-MFC-AGG-ID: Zm9VMEhSMr2JBsPq5NV0xQ_1766101042
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a43d4cd2bso15708276d6.1
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 15:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766101042; x=1766705842;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=taL4VecI32GOlELm8+8Vnt26fKCO2BjXM3Lzuu9k69E=;
        b=Az9Wox6X1t+lvrJA+0E36rrfaK15rRcTeunPvg/CYJYn85pAQJLTeWNO2qhipU/8Zw
         9iIYPv12KNC1zV+pyyWSnxLZJdJ+2fbtbrqxgHMcOy9s+MftEYMkIn+/WGn0tGNWVOUS
         MffOjU9+UzxpLr1jpZ8pnbVZFlw9x2SatCfC4RTZiwj/0qElmBjECEV8ZE98mvumcb0v
         3JsIdsXvW876oO0Rxv+9hJx4qbZKxHV+ziliYXBv0gP/TvY/61rx/by3SE4oQ8KvyoMC
         M6Sbc7mkOFlSsFhKACwbMQQaFrzQE270k5vbwCOKQJdPzYNR0zqrM2ROfSqNkbqljfS2
         xtOA==
X-Forwarded-Encrypted: i=1; AJvYcCXEKsfSFA7pTISyUvNjO/szpE2tvZYneAHWEYMXI4m0+muoFB7bvGJrHXBT3p2CZ7mnRb2VyB8TAVFZ/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfag9Cafeyjba9kEHe6iHLt9Fbk6y9IyXsUKY+c5tmLsiGu7ul
	aa0zB+UyVDY9fRp6oqIscpRJ+WoVOsLoJBzzpjS2wOaKXBT5QAODxV9u0rA0h9p9f3m+/JaEfJ3
	55rzKHOPpCra213u5fmAazIJpBQqw3k1PNAGtGVwcOL5jVmsdhmOiAyKztX7Q3uwMegYwkQ==
X-Gm-Gg: AY/fxX7A2S3ehw2CrCRf/HtM2r3Mhuu7aZbP5bhzOUGWxjBZxNZDk0uRE6gVylS1shH
	ox6S+c+8xpo+cMXp3PE4bO4eXmPdGkVB6sb5nuaMPtFG2Ko2TejopchhtZtTDiS6Sqjen2xDb5L
	AZ5Sk72wTKOk3BWgGL0mInkfFxWrNcU4MHdMqzNpPJetvw9B+bF4sM80sUHemnECh79XTbthKi/
	eIXS3v1UmKMWr4pSbr8JLN3i/1SM1y8osZOcCuPlzuOEYlx5XjCtZiNBrT3QP6J4lbSWmJepu67
	vb0LAZR0ciqZB9w52EXV5+zbKLZk2VNsacy7Maf8SvLDEZKF3PSO7AFysMqTkumd71Cwmbd0MBe
	/ouEVWQk=
X-Received: by 2002:a05:620a:2845:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8c08fbc8df3mr229401885a.11.1766101041951;
        Thu, 18 Dec 2025 15:37:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3jIAaZOF2kHstHYRyO1BtEzZDtmYfFo47TmQj/apy+4o6oNz5pTegY6y4DTnGxbC+K1Y2Qg==
X-Received: by 2002:a05:620a:2845:b0:8b2:a4ec:6f5 with SMTP id af79cd13be357-8c08fbc8df3mr229399685a.11.1766101041544;
        Thu, 18 Dec 2025 15:37:21 -0800 (PST)
Received: from redhat.com ([2600:382:812c:5c2a:d26d:b7f:4624:dd34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0973efa97sm54606385a.39.2025.12.18.15.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 15:37:19 -0800 (PST)
Date: Thu, 18 Dec 2025 18:37:16 -0500
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
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/6] clk: anlogic: add cru support for Anlogic DR1V90
 SoC
Message-ID: <aUSQLB1fmYgQe_Fg@redhat.com>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
 <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20251216-dr1v90-cru-v3-3-52cc938d1db0@pigmoral.tech>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V09sp2CnvdYXsWy2waCjY5B34J9g8XsXxHXppqnPkoA_1766101042
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_153727_512287_2472A834 
X-CRM114-Status: GOOD (  13.78  )
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

Hi Junhui,

On Tue, Dec 16, 2025 at 11:39:43AM +0800, Junhui Liu wrote:
> +static long cru_div_gate_round_rate(struct clk_hw *hw, unsigned long rate,
> +				    unsigned long *prate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +
> +	return divider_round_rate(hw, rate, prate, divider->table,
> +				  divider->width, divider->flags);
> +}

The round_rate clk op is deprecated and I'm really close to being able
to remove this from the clk core. Please only use determine_rate()
below.

> +static int cru_div_gate_determine_rate(struct clk_hw *hw,
> +				       struct clk_rate_request *req)
> +{
> +	struct cru_div_gate *div_gate = hw_to_cru_div_gate(hw);
> +	struct clk_divider *divider = &div_gate->divider;
> +	unsigned long maxdiv, mindiv;
> +	int div = 0;
> +
> +	maxdiv = clk_div_mask(divider->width) + 1;
> +	mindiv = div_gate->min + 1;
> +
> +	div = DIV_ROUND_UP_ULL(req->best_parent_rate, req->rate);
> +	div = div > maxdiv ? maxdiv : div;
> +	div = div < mindiv ? mindiv : div;
> +
> +	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
> +
> +	return 0;
> +}

[snip]

> +const struct clk_ops dr1_cru_div_gate_ops = {
> +	.enable = cru_div_gate_enable,
> +	.disable = cru_div_gate_disable,
> +	.is_enabled = cru_div_gate_is_enabled,
> +	.recalc_rate = cru_div_gate_recalc_rate,
> +	.round_rate = cru_div_gate_round_rate,
> +	.determine_rate = cru_div_gate_determine_rate,

When round_rate() and determine_rate() are both defined in the provider,
only the determine_rate() will be used. Just drop your round_rate()
implementation.

I didn't look into anything else on this patch. This showed up on my
search for new implementations.

Brian


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
