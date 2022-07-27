Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6E3C04A68
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Jul 2022 08:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTckJX3HGxVb2jmv5KJbC7NGsbiknYRMjXwvQ/GoA/U=; b=MnG1swsibIFULf
	V0ALd/m6CZHSJ6y96/EZjY94gp1trTt2bnC0ZB8Nbjkx+Y5hRFwwtyn/jRdfE9Fst4rlfcIiAcdEM
	x3QQc1Dm7qqM42VXNAsQS4P9H5An4C9TGlRn+tckI3STJ5zYfhZ1kEYYQ2DcmqbiALij6gNZtxI1P
	DN0pGWwO6CNTC63WczlN0GnifDlfeos12X52rVVujTKN6vzP9hRU/N5A/1mozwWYW5QT8BINbzSGb
	RYAhDRmdimIOE8MXwjJdMkrZxfF1x3YdfhkOh/ikerqF33GNPuktQNEKbw6G/USzQOlofAkS4Xvmg
	RKtlXOus7LMFVzDTSbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGclx-00BNv3-1u; Wed, 27 Jul 2022 08:52:05 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGclt-00BNoR-6Q
	for linux-riscv@lists.infradead.org; Wed, 27 Jul 2022 08:52:03 +0000
Received: by mail-lf1-x129.google.com with SMTP id w15so18107856lft.11
        for <linux-riscv@lists.infradead.org>; Wed, 27 Jul 2022 01:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=6Z+vA+GNURpYHtX5pWjPCTELZ9sRjNtldKU1aBthd8U=;
        b=gCpKpfwbUs1i1lCVcjEC6eLmFqeFnB3XJZp3ETEgFTyESF/HGjR7ds9XVtxIeRh1CD
         fGo/OKF0T6n2BvplmvrsZNZzLaDkTq3sP1hq+7KBfJOaee86JuvRnYU97hFyRLRPBefP
         reQed4KUV2lz+a4e4DxuL49sMJkGN1HA7y+erLj28RiTGqEzyO2HeGnja9lIDpPdqTE/
         uvWuUM0b2sj2dLQ0oQj72pc55Z1IH2j5kUB0LIbRHW0Tfz0dLBqHlQ7rwsLncrktFRqb
         QMgkh4PFj3r454rWLgfFgJ6IE+ioqwPoZOiRUJbarB2BgwMaBXbmzw1R2FFEibslxdgD
         3D9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6Z+vA+GNURpYHtX5pWjPCTELZ9sRjNtldKU1aBthd8U=;
        b=34dZPBPrS28KoXUSyC1cxq0KibhG5JNCowSHRuF+I1twGMcwHvT4GavY9tPk4mEUUH
         GP1puiF/7iQ/aDhKFv1fDrHFsDV+Yhx7is6Z4s++hOptK1mo2gSn4PINhaMrL2Dv4jUe
         OoutTePKxA2u8G9Kl23bRB06UhvgknTHaqwHHwtKrUB3YKrL455n7NYJJzKpqGc2td0O
         pUF/684qdGR6hpy5UNLGEWve1yDoXIdl2Kt86USHgBb7yLu1/GocdTYdiZ5Ag4nCcNl1
         GH5ci9+uA+067PLpaEu5A4eEtu7iNrrXzZapK1cdB7QkQbV/8/IC0NEWgLfoSOpiHGkw
         HHfA==
X-Gm-Message-State: AJIora9V5VRSzM4+M3C+bA5SePerkT1lFn0pjrY+vfmdesnXnMZ7nrJp
	YI45sExrn85S6uzZ0qDAzQSjhA==
X-Google-Smtp-Source: AGRyM1uKWKAi0yNUGeZG3IGpc3bRokpfDiAU0FPnEZjMGfIjzo35QsYVVN566ElrVQkWw1QEx4oz1g==
X-Received: by 2002:a05:6512:6c5:b0:48a:85b5:d55f with SMTP id u5-20020a05651206c500b0048a85b5d55fmr5937878lff.402.1658911915092;
        Wed, 27 Jul 2022 01:51:55 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id m17-20020a2e97d1000000b0025e11321776sm1079390ljj.127.2022.07.27.01.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 01:51:54 -0700 (PDT)
Message-ID: <f449cb56-5d16-1443-895f-cf2119c5dea9@linaro.org>
Date: Wed, 27 Jul 2022 10:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/6] dt-bindings: riscv: Add Andes AX45MP core to the list
Content-Language: en-US
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Anup Patel <anup@brainfault.org>, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20220726180623.1668-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220726180623.1668-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220726180623.1668-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_015201_411650_477910B3 
X-CRM114-Status: UNSURE (   7.54  )
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

On 26/07/2022 20:06, Lad Prabhakar wrote:
> The Renesas RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP
> Single) from Andes. In preparation to add support for RZ/Five SoC add
> the Andes AX45MP core to the list.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
