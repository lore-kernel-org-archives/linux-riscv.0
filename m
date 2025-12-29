Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC3ED3B7E5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Dec 2025 09:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qn9xAUNl/tq7iaVBc1TiQGUCLNTzWcYNwvh+D1IqGQU=; b=A5ML+SbjRs8dMw
	OvluM7MVVrV0zzeX/ESdlr1MhzbL5XtfzC0s/QY1nlm94aZw31tOGXO7M7fTTRv9iF12yk7TdtBY3
	NN49cfoTIqao8fpfYeC+EOix6WKSIG+ErxWX43V3w0LqZ4zrzl1uUsttghvJRL+ZsTH3EFUn6AqE0
	6EqEfZeOEajl6OAHF+rMO60exD47wwf9gBMxYcwfpeQhH5R77hOCXxqmagarVn4G5bxH1S4sP9NKC
	vXSRjFPW1w9b7s8qK69WntVVae+sWm7axIBs6RcOgxl+nyXYpi3S9vyu9vOfoCN0kplVmxR3OWxp/
	3SWSVd1v/o9UgGgvLF4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9xU-00000003Wzc-093x;
	Mon, 29 Dec 2025 09:54:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va9xR-00000003WzC-2Ur3
	for linux-riscv@lists.infradead.org;
	Mon, 29 Dec 2025 09:54:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767002072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KSWobni4I8/LRXBXCGLU3hHGBFzvV9k0DPL4VmrN5NQ=;
	b=EqdfdfXazs9d/quMuGYRYGdmyc6c/319sbjoxrLW2aKuGly/DW/vDUjKMPBt03v7lQVv6u
	Z0l5m6wVXjXkeOBYnBWOKh0bhVSNPTpxeYVrMmVFuObEq6Z1ivuIVYfq1e6Xv/Yk5u9ApT
	at19paqsL3rmRHuanyF7niFSZCmbbIQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-g2BK8MAIOK-ejQI2-KEgmg-1; Mon, 29 Dec 2025 04:54:30 -0500
X-MC-Unique: g2BK8MAIOK-ejQI2-KEgmg-1
X-Mimecast-MFC-AGG-ID: g2BK8MAIOK-ejQI2-KEgmg_1767002069
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430fc83f58dso4982554f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Dec 2025 01:54:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767002069; x=1767606869;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSWobni4I8/LRXBXCGLU3hHGBFzvV9k0DPL4VmrN5NQ=;
        b=WlfczI8N4lWmdTFZ65BuJcLa3RVUWYHeFtFuA3P+SAh+fFSFkzOtoGzifPR11MP5Bm
         z3XWg8OZpLgBwTnNR4H4aAZuX+RYMAL6uzjtzkHV3CSVIRvf0WqZOWAYiKIOWeeiZqfY
         kii+uZJ/RKbKBX6SJxY4zcHFt3vdX1fzNkBMe3z4oVfu00NYoCCOECtyfjjGezT36SK3
         QzlI9c9UwZ0jK/nOWMywk+kcZBEZ/1BqaioeUESnvRu6OxseIYJDycf0gSAYpyqcVwWP
         MZU2S7zZJYenlKV0qzQnLGebZ6AhArS5fbUdae76+5zqI73j+9/C9WLN/RHIRAzjH2Yg
         HioA==
X-Forwarded-Encrypted: i=1; AJvYcCXv9H2zAIGc7Nh/TKIAloUoc96F+toJGXg2i5F4pM6Qo4pQmAUo0nLyqpdlH/jRc4SZcZ2FWO2mO8O0/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtH6it9Q8LA4kHWKwwIIEklJ26k60n5xqIWAeLYMiNOkXiscya
	fagUkpgfmLBeeQ7GJ4CP0IJO90gL+VfEChh+UsZt9PYLvsW9Kk771VXNsr1R2/9AHj/DvIV8DAA
	SfQ5PHJfvTUtAgj/wrcMpuJ0qy99gpxuCxXwv6l0A95DAuXWYNkYK9zaU97JkcPAE3xrNoA==
X-Gm-Gg: AY/fxX7FVKmjNV/YyS3Cj7pPiNxRrd3ajEtiEikz8m2rGDPwWldWJlfon+PDHf0helo
	cKi+7+x/v2Ob/0/CP3OejUggpzxs2CkStM8CeVL9SFmEgWjiJs7/Pjv4Joe4mb7/soIrHIR2HJs
	i4fnLEoam8kNo+Pof6FZVp1vN2PJLCwHgUkiX+a+XqKSguLef8RNFplOVPqjVLXoiCN9+qST7Os
	OZ+rwPI2FnToYOLcc1nrNAbesVHvwks3Z3jlc8fZKlBMl0pPNNSCTQ+G1tIwjtmShloccKNfa6I
	NM27BCp+TsOcrg1Inh6kUiddgmZf6LiwYzkyt5RWvv9pWUFeD9/ooIu+kCYCUlLDPYn6ciaxSXf
	RF0vlS8M14X9UtPD+XiY59ZEylW4oLfH36YX2tG+kZfBlaTBZt1pXPxdoDXy62NR2EHFY
X-Received: by 2002:a5d:5d09:0:b0:431:c60:c5ed with SMTP id ffacd0b85a97d-4324e4c1687mr36359694f8f.13.1767002069038;
        Mon, 29 Dec 2025 01:54:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsxoEoP95m6ReZSz6r1q2uhNFZf5kjQYBZyqztpeqeumiInWw6+7PbX5zUgH0PIl8ztva/+Q==
X-Received: by 2002:a5d:5d09:0:b0:431:c60:c5ed with SMTP id ffacd0b85a97d-4324e4c1687mr36359670f8f.13.1767002068663;
        Mon, 29 Dec 2025 01:54:28 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm62245404f8f.20.2025.12.29.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:54:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>
Subject: Re: [PATCH v2 2/3] mmc: sdhci-of-k1: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-2-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
 <20251223-07-k1-sdhci-reset-v2-2-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:54:26 +0100
Message-ID: <875x9phaul.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yAWN49oHYGSpdYDYCiivVo3Z0Mah50oSjyjdDDn61Cw_1767002069
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_015433_705926_DB0DB8B7 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

Yixun Lan <dlan@gentoo.org> writes:

> The SDHCI controller of SpacemiT K1 SoC requires two resets, add
> support to explicitly request the reset line and deassert during
> initialization phase. Still using devm_xx_get_optional() API to
> make the request optional.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
