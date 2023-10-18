Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EA7CDB482
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 18:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPZcSMHXR+ImrDtPiBxB8CAph6aEqQCOPysnPwbd2nA=; b=Xtfx8btKROiJSE
	k/7HwY1AS6OzTtcBTNobqFwMHhsQE9akBg09Q8tpOqUXu9XS8ny7YXr8NPr1VgQcXBoUQqQ2SQSba
	p8Mpdupnx3Sp7V26OFS8qrsD+LQ6LX125y35SQuXf1Kx2WQPbGm1SYRZ9v/qvMaEgswu64pD5hwbU
	RDG6KjqkvMNMM6wgxg5YxNet8Mkh8xe4S2NFrCu53JoPBJDDvvQwMgmZGi/LVdr+qrQKZLW7XNzq5
	ZK3VROkmxU/asmM9r4W6BFc61f6Z739cUM+3sf2GoZORONLAhsNAdo3IEmqc7GOE4aQeoQ09qEv81
	+E2e11Sgg7GPG5F6vlnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBV6-00FTyH-2M;
	Wed, 18 Oct 2023 18:42:36 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBV2-00FTxb-33
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 18:42:34 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-773ac11de71so466799485a.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 11:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1697654550; x=1698259350; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GR7iCsfOqmk/YsQYs6hEpnqdo1XSKWN5VF8toyppFfQ=;
        b=ez0Orpk3xmLxnMj13AyN1d7Mz2x0SLh63bQ0NgpbEdKCmNOoOdu5CVwNhriPAJPoN2
         7VqKtLLrExna63eNVy2Y1Zb4/zBZNjWKpIuqsxDcTeXnaW6x1T9f/HT0//je3Uoat1Tb
         FFg1OTy5uBwQN6ttJJdzch3iFzouaYwvpy+HRK30lkDLbCCHUKaovvixkLFOmr+LYiOT
         KODUFIrYveNvaPPpK9nWg4QSaFkpu0hUHxWa98LKzZ0m4LmgY84GmxbYd2zOkBrbOosw
         wfgc+kIycgXQb3CxWLSXkZrBRd1ilq/61bKGWWaDfhHnVxCduFBrjwKIeM/LWWNyBEaE
         QPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697654550; x=1698259350;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GR7iCsfOqmk/YsQYs6hEpnqdo1XSKWN5VF8toyppFfQ=;
        b=lEpgSxZakE7c11pxLnF4e7GGI1wsXYbnjNimt5VJJw/eQT9xrqH7ruVggXLY4wXf5U
         d2bWfONOcmBMZxHf4iyHabgbI2PUhb04EvNK9H/4dbk27mAUx0lU3m2EZCodOVzx6ber
         1wfOP4NBMyYgSzs6NWM2sGT2B/n3sOiwzan0KdgjxsYs0go51QkXbOmkUgYXVJOaTP8R
         9xWSdAol6CGutxjiLxfgiUCatyR9CXNd93ym3tPVK5zGkozviSurs8AfW3wtG5FsEmtb
         CzbWbJTB5YnYUwBlJheFPO7DkO3xSrwNOpmHEJ1nCYfRaSWqx05Co6ClBOagsmTT71MM
         cTUg==
X-Gm-Message-State: AOJu0Yzd+P3gTCTJuFzLAlSmZ+njEx1juBW2u1Z+wFwmEHIon0xy7dOl
	wKqoYPC4WGmmd4WdJzKW+fNDtyAtCsmxEWaVMINuFA==
X-Google-Smtp-Source: AGHT+IE7GOtHup87DBOstRNLEfBKDd2I9bFSv9NbERsSCQhVnQubPTor0+HCepugXoTa4Xc/jeyWaA==
X-Received: by 2002:a05:620a:4147:b0:777:2aeb:7dfa with SMTP id k7-20020a05620a414700b007772aeb7dfamr29123qko.38.1697654549991;
        Wed, 18 Oct 2023 11:42:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:f59c:efa7:80ec:8da0? ([2600:1700:2000:b002:f59c:efa7:80ec:8da0])
        by smtp.gmail.com with ESMTPSA id qp13-20020a05620a388d00b007770d47c621sm159647qkn.66.2023.10.18.11.42.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 11:42:29 -0700 (PDT)
Message-ID: <f5b854a2-befb-4649-a448-c1cf95e6ea2b@sifive.com>
Date: Wed, 18 Oct 2023 13:42:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: only select DMA_DIRECT_REMAP from
 RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
References: <20231018052654.50074-1-hch@lst.de>
 <20231018052654.50074-3-hch@lst.de>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231018052654.50074-3-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_114232_990841_E59656B3 
X-CRM114-Status: GOOD (  11.10  )
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

On 2023-10-18 12:26 AM, Christoph Hellwig wrote:
> RISCV_DMA_NONCOHERENT is also used for whacky non-standard
> non-coherent ops that use different hooks in dma-direct.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  arch/riscv/Kconfig        | 2 +-
>  arch/riscv/Kconfig.errata | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Tested-by: Samuel Holland <samuel.holland@sifive.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
