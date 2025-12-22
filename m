Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4970AE67811
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 18:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhqLos/IuW+sk8qGxJue38cxBETud7azl5M/n2nxh4Q=; b=jgxh3DO/hlz39w
	IwUu9LZqc1ALr/iWWFm19QEUhw0wD2+j/dtZMBJpU5pLkFCLCMRf3IIRpOUDaOx4qi0T6yB8sRTpP
	FSB4+KUMnOhSJVAuJ0ah+V/NSWXdGeIh5UBxw7WO7mOv+L/WJYuVi9r6KPPBzeCUUvGA4HpIcTOMX
	Yc6qdc5Uc5xhH4Swr4M6Q5csMyA4UI/YnJZIgOo0BMazEHVBpl+XTIPZgn8fnXFGXUi/foeUAPgV7
	enH6g9nBNJcwmh3xTWtw0i5GOGTNASbQ9b+Y5L0r8LcJBzX0TzFALvsZmSnync7A38sO9/OOSY38/
	t6F+plUxOskJ8uBschnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkxn-0000000E52w-4AR6;
	Mon, 22 Dec 2025 18:49:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXkxk-0000000E52Z-2EbP
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 18:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766429335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u+4D8Tlj01NwbwJ7Sfzz7JxK73l3sJ2lS0F6Yeexu9o=;
	b=gnTZhv0wrkXncNyU+fM2DKA+wiLjeD0HgrunQE5+tWQKjWxujHeattXYpChdukLoOM1KNX
	N5TxwTZJXx8pEWiGZBy1wGQItDnIXUBdvM/a97D2p3dUrw/iF6AZWnv6eSnBDA4a96ur4I
	HYzzkS0pJlhOUlZx6VLKSLvOMVsIa9A=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-Z2lPXoa8MDCYAHXjXy8Cew-1; Mon, 22 Dec 2025 13:48:51 -0500
X-MC-Unique: Z2lPXoa8MDCYAHXjXy8Cew-1
X-Mimecast-MFC-AGG-ID: Z2lPXoa8MDCYAHXjXy8Cew_1766429331
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a37ca7ffdso62993016d6.3
        for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 10:48:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766429331; x=1767034131;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u+4D8Tlj01NwbwJ7Sfzz7JxK73l3sJ2lS0F6Yeexu9o=;
        b=Bax32UITEjaoJyFKQq9Pmm4NUN6H0MHE7N9kohsi6en+QzTtFEQ3T5xYlojs6Ekft6
         ORZChSyCQQvN3mjMlC13kRHbizngw68VaW/7cpa6CM++WbPgrOuzOsy3qiI3Z8l9oQwO
         749fhNXMg2xhm5QfpP8Q9ObGabIdWfedWXSZwqY0MuzAHIVEfsOC4hm0OA9Eay47I18G
         m0eapg2xQ+Yjaqe/qu1Z3QQcXvOaB1msjVFs/zWW0r91xPPZU+xEsf7Q7AXvNTOoXe52
         VzSWy4CnxliRq0/CV2nDByDStUVDybq5Z/7ybbi2bisxYwRTlvKjx7AVkNPo6NUXr1R/
         /GmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/ZFC6dp8IOjR7WtzL4i0KyxiqzI0XUG+BvCsq84T3DDr8Fe0w35/WfP+fBsjNlIlrKcUp1xj8oo5Bog==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQfqYYShfkPIlIsfN453bmadGHULXDUfyoMAexsrRUXWXrx7CO
	vIMinKtFtZMSJFqcrci0ITehVKobY3NSqTAOHWptn223ImDcAesit5DiyvkFU/FK62CNlFRxedi
	izC1Rfw2w6BMNFk7+EBDyCAhW1Ab5DLMc98/EI/wi/N3yEt4Vc0pJDxgCIYok4+9/y3a1Yg==
X-Gm-Gg: AY/fxX7tCJD2qiuCZeB8H2IYz3C1LU/NwfxZTaYi7rTRAXX72QnDcmyYVw6XXeVsxU2
	hIRmx1ssQHvo0yrcbZF3AX2pSkIGvOz95IfzRGiRhD7m/p7tAlSNTpJzbb/GwkGgO9S0m5dPIkF
	cmoprb0qR5BoQcR8qI/DpBKytaqV6qdMKeNjjbmwOsB0rmwtRxHMidB606CHIKOYi9MMGYHscGI
	XGxC3TEO2F1WCZYBoPltKtFao2xkAvKi599OAE784wE4OZxYWL2d3E0nIq/49f+ZZN9l09tiHHj
	OeWhLoA44jPBUT6Mr4L5Smbo9lVI5tq/o1iPKLdGiPCI22+gJm8jRQrpI7O1YWpMw5zbyU7vl97
	3nSvHB/MoC/S/Bpk76QIv9NIS6zuSHSXjc6/xFkOB7Hll
X-Received: by 2002:a05:6214:4308:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-88d8166608amr169685016d6.8.1766429330766;
        Mon, 22 Dec 2025 10:48:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFijTdoPJMxUAie0Ei+GEBkM/RdlFRvhMDa4MJTrCaVw2VpeAozymdzb5LdL3eiKsbDMfDUhA==
X-Received: by 2002:a05:6214:4308:b0:87c:1ec5:841e with SMTP id 6a1803df08f44-88d8166608amr169684816d6.8.1766429330363;
        Mon, 22 Dec 2025 10:48:50 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d9a44e26bsm86467836d6.47.2025.12.22.10.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 10:48:49 -0800 (PST)
Date: Mon, 22 Dec 2025 13:48:43 -0500
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
Subject: Re: [PATCH v3 1/6] clk: correct clk_div_mask() return value for
 width == 32
Message-ID: <aUmSi3mSDjx7cmpn@redhat.com>
References: <20251216-dr1v90-cru-v3-0-52cc938d1db0@pigmoral.tech>
 <20251216-dr1v90-cru-v3-1-52cc938d1db0@pigmoral.tech>
MIME-Version: 1.0
In-Reply-To: <20251216-dr1v90-cru-v3-1-52cc938d1db0@pigmoral.tech>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bfVTaC7dkaK2FEpIfgAc2ysq2V74XalcPZastgXEx8U_1766429331
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_104856_646422_43A949C3 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, Dec 16, 2025 at 11:39:41AM +0800, Junhui Liu wrote:
> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
> 
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
> 
> Fix this by casting 1 to long, ensuring proper behavior for valid widths up
> to 32.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
