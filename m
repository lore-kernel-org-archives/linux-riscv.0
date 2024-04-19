Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9245BC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 22:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NDksjYb3Ri2u2x+9s3ykKR4bVplS/8HZ8SDwjVKCePs=; b=zTuU3dWGOBScdwUsWJzPdAYagg
	iFzaWnEJNkCqD16TGaff2RxI8Ewc+tfit0tsZuH2yrTEWjoC+KbnR7tIOwey/x31m+jL5JUfPeAmT
	Z1XJcmlhhpw/Bt5jP3QhxKszOFxnm3gDUDWGDV73PN/Vw4MIE9wDEDHosvKsZqut5vNyFj/wNG//n
	Q/3YKHv5eQOTPzwoGNbAoGUNrMIfeDTKHGmg6jQvnj+QUdQHkpJ4XOl6jnxp3OXVK3o2Y2NF/qHhN
	Nd/iZEbbbz1LkiuO1mrLr00voV8eSDN3gh9cZYS7gplYhDf4Gg1nUcV3+CnxAmCMStUI8lHNUlWns
	W5cPy/Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwLq-000000075y7-0orD;
	Fri, 19 Apr 2024 22:04:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxwLn-000000075xD-2BSn
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 22:04:56 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4DCB140AB1
	for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 22:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1713564294;
	bh=59fbk9mdCDiZMMkdMPp9YypNs4kQzE7DiAt8CISNemI=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=qCJAg+8Etkoy6vmMRivxlaiXKKETVib6sq29VUUmX7GlCQ3+Og5iqesY94w+flals
	 h8v4kXwMmVVzDHwal45sgD6v9UXBScRMJE6Y9gBYorJdcGhmrnsgHNlcPnsxgzf7QC
	 5zms4ChiRRCjg7ujPclj74PR3HtASp83Ubpcy6A00OepA4+ZrtbD2NAp2AwwiFy2DU
	 yWdmNiySi+CSv/fSRykyemLWf3c3aRHLwU0z3xqEnb27zSkrutOpQHXltc6bhgI/V/
	 owZYrKK7DrwH4kCvQTDcB35fGmjXiJyrNQaW0Pp7G+na0up/E7vWEyfN9haMh6uwat
	 e2NRwMAbNkU1w==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-43478c4884bso36262311cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 15:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713564293; x=1714169093;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=59fbk9mdCDiZMMkdMPp9YypNs4kQzE7DiAt8CISNemI=;
        b=CdQTv69ZM8qDpPge3w0FHrzat0soo1R8ISi68CsokzFcVUJBdanO0iMLBnFx3PsGlu
         0/VLOaOUPrFR/tHvf2K+Aq889Mq2AMP5blSvMEad2nq4cc6cPY9sMRy1v6dvFPofnRDD
         rU+SD89LZTTM7v+U6KKhKsT/m5gTPE7jwoYj0fbLG8+cOfE2tNzJvDK9F2UhAL1ooZ9g
         ZUen7TX8yvteqL1W0RugJq0+HVBKXQ2Qta0FRjQ8IwB6HteQhhZONO3NmIa16nWN8uBe
         OBzO5zgMIQVXxq9oxKOBa/BZUg5OE9TCa7VCvPdWc5vX2ArWIYIqZrf1p4n9h4UZkZ1t
         pIPA==
X-Gm-Message-State: AOJu0YzFNjk/2SY6/Ky+X3fgQdzkz2pn8hNAUrnxhZpMuSmVKExOYzO1
	v2CUntYyxzCbwEp3FkIBAW3kfiCP9IFnWljYra4zbgBzBYf62msCyn0Q71hNEb+GiR9RtHuVf+I
	JNNmkBD+rSaeVlbudliELOcnL32pDw2NrE7s8mxfruLP2iJ7/x63BDWsNW63rmfHPoxk5/3Au6R
	LOc7IrPZ8VGpz7xtqOaJ8kpK/rY4maH03F7yFo0AkWwQv2ynqh5Ybz91e2
X-Received: by 2002:ac8:7dca:0:b0:434:fea0:656b with SMTP id c10-20020ac87dca000000b00434fea0656bmr3860608qte.12.1713564293117;
        Fri, 19 Apr 2024 15:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi3nRK9n4HZbD6JyrijRrJFNNUSTVrZHpqTxSgnaAa2BwTXIiXei42zsuP2X92+g6FGGYKm/L/I58UAPVbBx4=
X-Received: by 2002:ac8:7dca:0:b0:434:fea0:656b with SMTP id
 c10-20020ac87dca000000b00434fea0656bmr3860580qte.12.1713564292792; Fri, 19
 Apr 2024 15:04:52 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Apr 2024 15:04:52 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240131132600.4067-3-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org> <20240131132600.4067-3-jszhang@kernel.org>
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 15:04:52 -0700
Message-ID: <CAJM55Z-n4N1Mm_iiYngaJ3jrb2eoXTirH0qDXMV=R=QTH-d9_A@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: starfive: add Milkv Mars board
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_150455_705025_EC300449 
X-CRM114-Status: UNSURE (   4.02  )
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

Jisheng Zhang wrote:
> Add device tree bindings for the Milkv Mars board which is
> equipped with StarFive JH7110 SoC.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
