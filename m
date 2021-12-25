Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108ECC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GtGM9R9qDZeZpU3NqO7WVyRst2BmgAeg/dz/C9jvPQ=; b=4kkSB19rLUYunI
	39hdiAPR8FKDlu16MaiBftwleLX071d2A5YGOjTJE/0FvOgNH0ImELem79zD4EGpurA6LSRsYCD8w
	WMzdyjMKvzAFtCXdRodGAPdomBG0Rk30/kcQ00AsW75bX5HcIrSlBL2PsaoFCmiwcZ45BAQTvA+hU
	Xv2RNHgwZRG5CdKKPYuiQjVWvoSVOYYruScg3iEYAkH0jOGVVIcNKuolcPx3UOscpaQjk8CfW6Sy9
	jMOqhtebTBFUdF92o58fTwnBAboma9QGFbUdvAoHwS6810ju3B8ihsRaj38mh4cKMquD2thsNfoJm
	dtQkHfyeMoFfVdHVfvHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n18M5-00EvDB-7k; Sat, 25 Dec 2021 14:49:05 +0000
Received: from mail-qk1-f177.google.com ([209.85.222.177])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n18M2-00EvBx-Bz
 for linux-riscv@lists.infradead.org; Sat, 25 Dec 2021 14:49:03 +0000
Received: by mail-qk1-f177.google.com with SMTP id e25so4863726qkl.12
 for <linux-riscv@lists.infradead.org>; Sat, 25 Dec 2021 06:49:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ZKo4CuVNE9aj6YktgJ2/0mQdTIBC53q4u65AzxojkOI=;
 b=ly4hQiWe0BTPg7WbRj1kkvUR74ZKKiDrwN2t6Z7LmnkEISBW7MAj+7FtvAEveWtlnr
 Do2dtdUbb4bfwIScTXDGTl4qSG66rnG75ZCv29oJLOHd17ZPCZORg7AJHD5cGeK8bLDK
 5r9h4rFzstcvLrRASRCtYJRhU/L5Dr7zxgA6PJk/xtryZmngnYvQqjkxXwBK+H0tdbpc
 t0GMW8v3B+eLs7lE9hrC6UJeH7A6WFbK2jdNOwb0idulLEU0Fv29sQ20Qt0r1taINJxE
 pXsJ/83E5z5aBnwM05LPJmmTEAFZLH9k/7WcdqFzl8BLiBSLokrSoymS6kq3nFtlc9E3
 f7dg==
X-Gm-Message-State: AOAM530dbzy5b/9r82Px8VdcM4RKsC9FXdUjSNr6TAWLk+o0jcUXXhj9
 YAb2bzQ7kYE7XEzRlbI6KA==
X-Google-Smtp-Source: ABdhPJxbEwWOAh1OuwX92qa21z32NQ6vc/Q6XUc34IMLFdh/n70CHypODZCeYjxxUMlkjawTK0+Z+Q==
X-Received: by 2002:a05:620a:14ae:: with SMTP id
 x14mr7451582qkj.347.1640443741093; 
 Sat, 25 Dec 2021 06:49:01 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id q12sm8962160qtx.16.2021.12.25.06.48.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 06:49:00 -0800 (PST)
Received: (nullmailer pid 363345 invoked by uid 1000);
 Sat, 25 Dec 2021 14:48:42 -0000
From: Rob Herring <robh@kernel.org>
To: Atish Patra <atishp@atishpatra.org>
Cc: linux-kernel@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Atish Patra <atishp@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20211224211632.1698523-3-atishp@rivosinc.com>
References: <20211224211632.1698523-1-atishp@rivosinc.com>
 <20211224211632.1698523-3-atishp@rivosinc.com>
Subject: Re: [PATCH v1 2/2] dt-bindings: riscv: Add DT binding for RISC-V ISA
 extensions
Date: Sat, 25 Dec 2021 10:48:42 -0400
Message-Id: <1640443722.919526.363344.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_064902_431068_ABC4F3C0 
X-CRM114-Status: GOOD (  11.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 24 Dec 2021 13:16:32 -0800, Atish Patra wrote:
> RISC-V ISA extensions can be single letter or multi-letter names.
> The single letter extensions are mostly base extensions and encoded in
> "riscv,isa" DT property. However, parsing the multi-letter extensions
> via the isa string is cumbersome and is not scalable.
> 
> Add a new DT node for multi-letter extensions.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/riscv/cpus.yaml: Unresolvable JSON pointer: 'definitions/boolean'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1573119

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
