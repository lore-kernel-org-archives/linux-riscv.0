Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6752FC87FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 06:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n1rj/pe9Yo04SqC8MbubmQvOxHouPpoD6Z0UyFz10bI=; b=iH6PjZyxqfPWK/
	+4cjBoHj+cj1XnF6NtbPwVU/IW0bFtoaC/ZYIZnY3Hv2omn/L/e+Q6oDmeuiNe1OCAezqoQRirFVi
	ebLhURjVi2vWylCELnRJCPGKPvBI7nDqb7ovhmRI4eA78/XTff5LWKsTBkL33Igu5D9YS0UFDOBD+
	QxBPhpT2CPl+HdoZVtfOzqadg19/A6NwPud4UWmAR5XKN83iit1Vmwexyt0ajXptmpxQL3/9CNvG6
	P4glqiJe1lxOIaHab4LE44wc7DkQwUZ6z2LGJLsVaIefYSYQzHP3kjeIUCO9VybiD023RTes2ca83
	xx3mCjKc9ChEwdM3nyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh01j-00000000m6I-0PMa;
	Wed, 30 Jul 2025 06:10:59 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugzxB-00000000ljt-1hhu
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 06:06:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2401248e4aaso37444775ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753855576; x=1754460376; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2RaSd7z98uCro1WOAlKL+w8mLWZF6xQx0RvfWxxYIkg=;
        b=RjjV68wsIDGERM2vqhu73qyQ9YkOKaKjHrnGkmirRfl1TVS9ucjiPBEwM5HJ+tgJ/G
         6AkxRhFTFCW5P8x1Z6qhf6drCqvEPU4mJcfBtp5Rx7w1kyyr2yVzjDpQHOuPn8XMoYWe
         4Fvtn5iLGkkb5c8zljviALryHvur4VxFKMfKOAePq4aJDQ82YkKH1eoMi1rMQOAmvLr7
         3O17uQPj6nIAqWk92JY8NrHnLTUsBECQVDB0hLP0PBw1AT+1ElrB12Z+6sU9U84gsjdN
         l4MlNs2GKGmpAugl6upGGWx85oEfmKcXAhJ3E70+u3h7t6UK7VgYppEYbrQEtUidhyLO
         uRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753855576; x=1754460376;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RaSd7z98uCro1WOAlKL+w8mLWZF6xQx0RvfWxxYIkg=;
        b=MeGD/wkI/J94ns23mkMXLXl0I9NyHefepnTp6TaUfI+4ciFQeYwTAZWczsrlS0tFpq
         My45kOmHiMx7a/Ak064bWoOIt08v2MrpBNztt3RSREFeJ6T95VjQLBZgjwuUBH0WhebF
         ogwasdoASyhVVuYqIIhOyGQ/lA+1lDgkVaIAoTdk65YMr/jjGhGox4ey0Tu0BVxvfyIF
         s9nJu911tQ2oO70i9NZNlC9rF1gJso/Kk59JlWdixxe6e4J49bWpXnycf06YFXrkibFA
         gEzWe9RJKg4up4renXe4dQrcHelfcb2eA69jxeOnX3eIGrS+WuUPbkMQqv3s63dot7cf
         jK2g==
X-Forwarded-Encrypted: i=1; AJvYcCVvoNIE6OnOg+yJRAUMQrNT1uiqCbUcXOgvc4kQ9Vuy4XzmQ72THgBhcKmqyBBadOlnWqWzy7ZyQzkpLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrgN6S2A4vhpXasBps7pSF4B0MenjhfqMw5o5+q0UVVQNCgXjj
	xmdOL6Iv5hs6o/e573F5NjEW71TQcVWlXCGGwt4GiiCYGOsPQCQE0CBW
X-Gm-Gg: ASbGncuJ47mN9qqtUz47WhbUpB8NWhZ5BRkqxoUhWIeKXrYy96M9uyYjHI/Cl7QqaXm
	7ZI4A8hc3WsluYJOeQHWo39RXUNp2ozNMfuQEaB5y2zpq3yeFhAbMOBSMeDeKuUBDXhoIpOO1d3
	unBaIaJI1IT9Q4546t026/he1tydShxLXlqHd8HrK89TzGBMjfR05D+0qrclOgaWJ9zZPswXdoc
	DTJChdLHKk+EfCO9mzflRB63I8IeRXkOtWSc573qpSIBbChm91CoGZbPze+yxRVT8CK6mNlglkH
	pL/zYtuay6UiT/xsGOFYVO1a1Tnj1jg4v4kmCiQgsmX5v0Q4ovTKfI3zVCY5TdaGd8YeOWYf8im
	tzrnUrj2lCnWcDvRF348UPqdg6j+MSn8d
X-Google-Smtp-Source: AGHT+IGOb7R6cAkF2XQtdnUrwUvguwI6b0roCbfnnbe1O66LzmjhYar4PM87eH98FGS0Asl/DkAKzA==
X-Received: by 2002:a17:902:e751:b0:220:c164:6ee1 with SMTP id d9443c01a7336-24096ae693cmr31488755ad.32.1753855576452;
        Tue, 29 Jul 2025 23:06:16 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23fdf58abe0sm83899965ad.145.2025.07.29.23.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 23:06:16 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:05:40 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Inochi Amaoto <inochiama@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: Add C906L rproc for
 Sophgo CV1800B SoC
Message-ID: <bfvsmafcsxy4gr4dsprn4z4yl2lltgje2oilsny7vanb7rsolq@t2prbsfisioc>
References: <jcpr5tg7jyyyqmaujegeuq5j3dqz4rrgxfz73rl55l3jibtq63@3w7bzux2b2je>
 <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1856eb4ef9c9b448.51cf78412ad49c56.737f9c77b35de27d@Jude-Air.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_230617_444438_30FE2FB4 
X-CRM114-Status: GOOD (  33.00  )
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

On Wed, Jul 30, 2025 at 03:57:09AM +0000, Junhui Liu wrote:
> On 29/07/2025 16:31, Inochi Amaoto wrote:
> > On Mon, Jul 28, 2025 at 07:03:23PM +0800, Junhui Liu wrote:
> >> Add C906L remote processor for CV1800B SoC, which is an asymmetric
> >> processor typically running RTOS.
> >> 
> >> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >> ---
> >>  .../bindings/remoteproc/sophgo,cv1800b-c906l.yaml  | 79 ++++++++++++++++++++++
> >>  1 file changed, 79 insertions(+)
> >> 
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..2061c2fd6ba343c09b1a91700ea4a695d2b57f81
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/remoteproc/sophgo,cv1800b-c906l.yaml
> >> @@ -0,0 +1,79 @@
> >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/remoteproc/sophgo,cv1800b-c906l.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Sophgo C906L remote processor controller for CV1800B SoC
> >> +
> >> +maintainers:
> >> +  - Junhui Liu <junhui.liu@pigmoral.tech>
> >> +
> >> +description:
> >> +  Document the bindings for the C906L remoteproc component that loads and boots
> >> +  firmwares on the CV1800B SoC.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: sophgo,cv1800b-c906l
> >> +
> >> +  firmware-name:
> >> +    maxItems: 1
> >> +
> >> +  mbox-names:
> >> +    items:
> >> +      - const: tx
> >> +      - const: rx
> >> +
> >> +  mboxes:
> >> +    description:
> >> +      This property is required only if the rpmsg/virtio functionality is used.
> >> +      (see mailbox/sophgo,cv1800b-mailbox.yaml)
> >> +    items:
> >> +      - description: mailbox channel to send data to C906L
> >> +      - description: mailbox channel to receive data from C906L
> >> +
> >> +  memory-region:
> >> +    description:
> >> +      List of phandles to reserved memory regions used by the remote processor.
> >> +      The first region is required and provides the firmware region for the
> >> +      remote processor. The following regions (vdev buffer, vrings) are optional
> >> +      and are only required if rpmsg/virtio functionality is used.
> >> +    minItems: 1
> >> +    items:
> >> +      - description: firmware region
> >> +      - description: vdev buffer
> >> +      - description: vring0
> >> +      - description: vring1
> >> +    additionalItems: true
> >> +
> > 
> > Why not allocating these region dynamicly? I do not think firware is
> > always avaible before staring. Allowing dynamic firmware give us max
> > flexiblity.
> 
> I'm afraid it's not easy to do this.
> 
> For firmware region, the RTOS firmware usually needs a physical address
> to link to, and I have researched and tested two RTOS (RT-Thread and
> Zephyr) on the C906L, both of them do not support position-independent
> execution or runtime relocation. Therefore, a reserved memory region is
> needed to provide a fixed physical address for the RTOS firmware.

I think it is simple and possible to add PIE support for these RTOS. As
the memory of CV18XX is limited, I do not want to see some reserved
regions. This may hurt users who do not need this.

> (In fact, there is already a reserved memory region for the C906L in
> cv1800b-milkv-duo.dts)

This is just preserved for vendor zsbl and I have a plan to remove it.
Always let linux take care of all memory. It is good to support all
firmware implementation for CV18XX.

I think it is always good to use remoteproc like this:
https://www.kernel.org/doc/html/latest/staging/remoteproc.html

> 
> For virtio-related regions, the RTOS firmware also needs to know the
> shared memory regions for communications at compile time.
> 

I think you should investigate this and check if there is something you
missed. I haven't see any reserved region in remoteproc binding mentions
virtio.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
