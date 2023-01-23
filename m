Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF3BC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jan 2023 16:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhlYLjbGf8K3y3A20vCajKGrm/GYoq06PDrCHYAXRkg=; b=v5B4bAnX4SqEJQ
	xsIobTFV/Qfwb/hqVVkIqqzy/8x+7w6PIB3UC4VF7XzvJrMDUyemNIgLmDxODIVWyFSTu4u2EkBLI
	mLw06y9ygnL26jb3/45Ct1hkdBYJ2DR8LSnGW6ZxapvpWS6mgQ3JwxWmSCwJXQcntuUZlvECjctoX
	ofVLchVYZxtT8H54uK0kdLl+QoOMlQX2SqGtYTD+oDin11gHqEIHNbQSO9WcNVHvU+5SqUrR3+pJa
	GKpNsXjRkEfUq4DnozJTlE8jzXYLQDJECaN9RjiH16lfuvlJ01Xo8yXkFHebkLN9DorB4B+H0Yz4i
	14yP8Paprblo/9U0xrYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJzLQ-000QOX-Di; Mon, 23 Jan 2023 16:06:52 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJz98-000Lj2-BR
	for linux-riscv@lists.infradead.org; Mon, 23 Jan 2023 15:54:11 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d2so11226838wrp.8
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jan 2023 07:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+T/G9k15WOqcnm5NSoRREaF11y8Ho69NMw/NwpRfAK0=;
        b=MApYfB0o72zvfWFm+POIdyCrXsaavHTfAUTjsNbY4up+53rhpPBSRhUB0ICJFEZxfj
         BjKT7XWKlo5R4+S6tYi+ItQ+o3xEY2M/AOvBUwcEBO7fjIOzblAzqhitRzTQdspsq4gW
         MKX8TpZx+KSZ0oPbJvdnqQb0n8lhOjBOW9esLgrJPe36lfj6ovO/PQcMXERYQTB2j7iH
         BQjQ7Gf5MLKV2zWm0qOK5jC0K8gd9a5t4ZVIDPPuA9t4NjqighOPJVAPGccKG6ZGaxCW
         mr/ww9zxKvPdeDWXiDn3tKB4rfHwrNj6msyZEZip/mpJt+o5CD05mdEhnZS6nMk7PTPR
         n4LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+T/G9k15WOqcnm5NSoRREaF11y8Ho69NMw/NwpRfAK0=;
        b=qeuEY5R0peDY/iWZ4/v6JMPc68tg5UtrWyc/gwsrQLZhCCBZ9GUZHbGUJHj7H5Rag7
         m1UEbVVP+pSY3YGV++s36bgYoUhFqbUplqAnHVH9W1zo530sPUQh3eFqElvOKm3cOFdQ
         D1Nb+WcqoRlGZwNsG5B3VvyCwaxMSlLioyze+cOkPY4O2/d8YMjweXFyhEjMuy2TxJYO
         FNrKhHvPHs5RiQSC2ofhUNk917fZlvAx09uxjk73NcH0+zRhiQ1T/ZZtnLU3f3iFjU2v
         0CRlSeFfBoHziMc67bYmf98fPmu21UcVcdJeBu6XJmGCLWrd497una2+6JckAIyF6FNu
         OT+g==
X-Gm-Message-State: AFqh2kp9xSexIQpweQfA7hSFEOutvyz6gpCDYUkOfEuR5rmtQxS4ulnG
	RwMfcYEjn+I+yt7eipVOY9y6FQ==
X-Google-Smtp-Source: AMrXdXvwcU0oqIZdIzFUzY0n39UD6sn2j3DukAGMDcoBpW0CyrgNDqr9OSGfP40XyWPsZdMO/5qW6A==
X-Received: by 2002:a05:6000:98d:b0:2a5:6244:329e with SMTP id by13-20020a056000098d00b002a56244329emr19441398wrb.40.1674489245906;
        Mon, 23 Jan 2023 07:54:05 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id q11-20020a05600000cb00b002be53aa2260sm9689429wrx.117.2023.01.23.07.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:54:05 -0800 (PST)
Date: Mon, 23 Jan 2023 16:54:04 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Anup Patel <apatel@ventanamicro.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: riscv: Document cboz-block-size
Message-ID: <20230123155404.oqcfufnot4f2vjw7@orel>
References: <20230122191328.1193885-1-ajones@ventanamicro.com>
 <20230122191328.1193885-3-ajones@ventanamicro.com>
 <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+SqFOVYZdf5YCELNo7nnU-T32V_Ec1C+RmUv_eLiR0Ng@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_075410_436291_64751E82 
X-CRM114-Status: GOOD (  24.75  )
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

On Mon, Jan 23, 2023 at 08:33:56AM -0600, Rob Herring wrote:
> On Sun, Jan 22, 2023 at 1:13 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > The Zicboz operates on a block-size defined for the cpu-core,
> > which does not necessarily match other cache-sizes used.
> 
> Please use get_maintainers.pl and send patches to the correct lists.

Yup, Conor also pointed out that I forgot to update the CC list when
adding this patch to the series.

> 
> I have no idea what Zicboz is. How does it relate to Zicbom for which
> we already have a block size property? I really hate one by one
> property additions because they lead to poorly designed bindings. So
> what's next? What other information might be needed?

Zicbom and Zicboz are both RISC-V ISA extensions for cache-block operation
(CBO) instructions. Zicbom defines the instructions cbo.inval, cbo.clean,
and cbo.flush while Zicboz only defines cbo.zero. While it's probably
likely that the cache block sizes which Zicbom and Zicboz use will be
the same when both are implemented, the specification does not require it.
With that in mind, it makes sense to me that Zicbom has its own property
and that Zicboz could follow Zicbom's pattern with its own property as
well.

That said, having a generic block size property which is used in the
absence of the per-extension block size properties would allow DTs to only
specify the size once when they're the same. In my reply to Conor, I
suggested introducing a cbo-block-size property for this purpose, but Anup
suggests we just expand the purpose of cbom-block-size. Expanding cbom-
block-size's purpose would allow its size to be used with cbo.zero in the
absence of a cboz-block-size property. Additionally, we could defer the
introduction of the cboz-block-size property until some system needs it,
which may be never.

As far as to what's coming next, I'm not aware of a plan for more of these
types of properties at this time, but the CMO spec also describes prefetch
instructions, which are defined under the Zicbop extension. If Zicbop
support is added, then it should follow the same pattern as we agree for
Zicboz, which is either

 a. Add cboz-block-size and require it (as this series currently does)
 b. Add cboz-block-size, expand the function of cbom-block-size to be
    a fallback, and fallback to cbom-block-size when cboz-block-size is
    absent
 c. Don't add cboz-block-size, only expand the function of cbom-block-size
    and use it. If a need arises for cboz-block-size some day, then it
    can be added at that time.
 d. ??
  
I'm not aware of any additional information needed for these extensions
beyond the block sizes.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
