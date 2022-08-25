Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFBBECAA2B
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Aug 2022 19:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bIBYqTZApT5AZshD9uTHXBWwDKwgzbwQTw/yPhnosOs=; b=s29UCLY3Jsl/Bc
	ib+jcu1GLHXMcnBzA2WzIa3zqPxWJzmvczFlThQicfAfxXvcLt5T2FD1DAQSaVpEvtcAj9nXzOZr8
	wZ84+sCfqh0LS9kAE4i0wycQLTWb7ACSGvY7O2X6Wai8F1Bo5SS3XIxU/qV4rRbp5DOwqgn37QyCD
	QnaAR0tCvXVNfaRw+YOwftN/lx0EkiBfvJ+n4wnERqHei3SXaPVu4K0GHW7prl/6PGWX7CSHgQb8i
	8hGldubc7Rfqq3kz+qpJ3MLM96DbkvKv+ZPXPnGAAfoum2X9+kmbQD/lKh2yM05JueU9W8bizt3wO
	zMB+SDnVl+IEOaLtNB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRItP-002sMR-04; Thu, 25 Aug 2022 19:51:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRItL-002sK7-HK
	for linux-riscv@lists.infradead.org; Thu, 25 Aug 2022 19:51:53 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DA01E3FFBA
	for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1661457109;
	bh=Q62BFbHdLMiC8G/bwUd9Yr2gMAz6rRKsbknA9dRkewI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=rtjLkwE8PV6EPJScXcrwwV91fPx1YNxDW/IFK5rCRFa7ryjhLUtQEcsuv5IZsY+xl
	 vIWaJLh9L1iWeLasLEBNZL8HIyt1Z9lytp82iP5tRKT/68pi0QAXWD6KKghs9qnYF1
	 ie69kSrKkv6QqiyKOHuy6cnXeXcWQzegB62R+9c3kdRhS+ASnaVmTlP6rivXychqEs
	 aERyE4brqMXZ+0CVtlABKzkBAIacSw10bSuNh9XeMUAUzjc4vCqMU+Hm5vsCfXHw5q
	 CVtkbKRl3SpzHmRqlzVb1VmoPGD51XgVaAG8PMIUXxquMSDuQqER6eIrb3q0qcNu9U
	 cXLcCRzm/rMtg==
Received: by mail-wm1-f72.google.com with SMTP id a17-20020a05600c349100b003a545125f6eso2885393wmq.4
        for <linux-riscv@lists.infradead.org>; Thu, 25 Aug 2022 12:51:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Q62BFbHdLMiC8G/bwUd9Yr2gMAz6rRKsbknA9dRkewI=;
        b=b7zxmNpZDG5Hffi1JtCOuFF1Wkzh1kpsvui6rdC3jRRldwOVKn8UvVQRMvhSJjBzvM
         AIF9h2mdtMXo8jHENRAOVm3DSj7pGX69nHjXPm2pdYAhx0Hn8igDxkmdCZY5+sZNciUf
         XMG1oilanNIlsl5Tatt+MRLiCNtRasW+hpMHvu1EMS3O+hDNDeRHIxuzJlOqZwn5LMnv
         UcvxLTlJHe0T6WVAQvMPl055DtV2juv6vp6UeGFlOa+CO9MJf7u3Z614+q+omPB6Us+g
         bMIrBDbzgKYFntE7M6aUaYQomOrBSyWZ2fY7cuBWx8fk5r1pBdebd+O7Hxa/tJVZsWUK
         ljEw==
X-Gm-Message-State: ACgBeo0Vlu9XFSMyid0+8SCrDXMh3XBBFs8HGsol4Vbbq8Sw+YA1L1mz
	piV0r5DZpf5fnHETSODWHEmRCC4cR3hMxCKSQ7HQTxcvSLM0y5bTyNdEAglR1x9ND7HCHjZ5R23
	L9lHEnw1ZIlvW4G+gsYLM/oaIzvmhh7K0nbmWUtvNoF4BbA==
X-Received: by 2002:adf:e199:0:b0:225:2f90:9178 with SMTP id az25-20020adfe199000000b002252f909178mr3172744wrb.318.1661457108841;
        Thu, 25 Aug 2022 12:51:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5gPIeNGUoC6hcPYARO1uBIm6Y8DVcE9uV1yA75S5qG3Gwf33wyGXkmtIe0/KVCGk8RLOqckQ==
X-Received: by 2002:adf:e199:0:b0:225:2f90:9178 with SMTP id az25-20020adfe199000000b002252f909178mr3172728wrb.318.1661457108594;
        Thu, 25 Aug 2022 12:51:48 -0700 (PDT)
Received: from [192.168.123.94] (ip-084-118-157-002.um23.pools.vodafone-ip.de. [84.118.157.2])
        by smtp.gmail.com with ESMTPSA id c13-20020adffb0d000000b0022511d35d5bsm130449wrr.12.2022.08.25.12.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 12:51:48 -0700 (PDT)
Message-ID: <18f0c833-94c6-616c-ce21-384492945240@canonical.com>
Date: Thu, 25 Aug 2022 21:51:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 2/2] riscv: dts: microchip: use an mpfs specific l2
 compatible
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Sagar Kadam <sagar.kadam@sifive.com>, Atish Patra
 <atishp@atishpatra.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <mail@conchuod.ie>
References: <20220825180417.1259360-1-mail@conchuod.ie>
 <20220825180417.1259360-3-mail@conchuod.ie>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20220825180417.1259360-3-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_125151_734639_F4D621A8 
X-CRM114-Status: GOOD (  10.29  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 8/25/22 20:04, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> PolarFire SoC does not have the same l2 cache controller as the fu540,
> featuring an extra interrupt. Appease the devicetree checker overlords
> by adding a PolarFire SoC specific compatible to fix the below sort of
> warnings:
> 
> mpfs-polarberry.dtb: cache-controller@2010000: interrupts: [[1], [3], [4], [2]] is too long
> 
> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
> Fixes: 34fc9cc3aebe ("riscv: dts: microchip: correct L2 cache interrupts")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
