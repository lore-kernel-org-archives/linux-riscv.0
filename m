Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8735CC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 01:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=jkXix77H2peLny3Anpx0E4JoEd/9Dxs8NepBaJ7XdJ0=; b=SzhhZFkdVvixL5WaSuOiZnhZgA
	lacoXZiANBALI42a6ufHpRWI4ts+y7q0/vQhQXxhhQFdd49b9iL5Zpf9OvTU2PTnHrfUGD+1cdVad
	LuXikfDssJxWS62vUz4gyHSxA2SMzs6Hn7HeFgRilyO1ajJ1ngdlPD+BttjUSgy6v8pei18C6eSvq
	PGTA4ELZvfkJBTvobV3WQSUdQyfKxPA8nDl/yr4KJ9uzA+It24D6cSDItEqOxyrTv9r5sO+4yhVYL
	qeMVXHhiZs7dI9hI1sN2IKs6c5HuxzK64NeM/q1J308TxdqUuWEBHnC2lqy2UvD440CPOcoqJUhh2
	mqY+PC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcGCr-00BzBb-2c;
	Wed, 15 Mar 2023 01:45:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcGCl-00Bz9p-2g
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 01:45:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id h11-20020a17090a2ecb00b00237c740335cso327311pjs.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 18:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678844719;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQqeZSUpX2ANWQCyU7UoxGLqZhx6/F6T9Own5KUL63M=;
        b=V6Jj+wxcvH2Hyng5utJCOGWXhtyo8pCMQcYf3gwHXi0X5PWp5DqfwEpDZr9gzUdHMm
         IGffHnQPlori1oAiy2u0bwMjDBifsCFd1lnt4vZY/+nV0NHckA8xawzZ/OmjGfHRMnBc
         BCZyiO4F/qXF1OhgQAJLxy2nNQvhl5mOkXFzGJv/psOStrVr/1rn29w7a4CEf8i/DqZ9
         u1dPA3YDx0A76x0VGSgFBCV/MtfY3wYziCb97H2ZArBzOciPKMH1ntGflYlMWQ+lWc+J
         pp+3kpBMAMixq32LAFrEAoiSJxZPZPoIR0cidRVEEkh1fMurCHyiZ25hKt/0eBeAZxGn
         Pp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678844719;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQqeZSUpX2ANWQCyU7UoxGLqZhx6/F6T9Own5KUL63M=;
        b=iKjis8ZrYEf0+OVHFSVtEAQvsaXeV3KvLOkq6mJ9RTkyu9Ygb2CDtvpJ0/2NcL6Twc
         bS7Ic3MtxL6IEzlXgzJr8a8NaMWeif/DYGniJtdRMt8tL0gGnB0Wv4LV3g7e47I5L2+r
         fuuHnFlPtyhcIsOyCrSZTfmscTxv9SMZ4xTsuGoD/QahOCLN8kawmZzvw3+2GcK52LGb
         vHeWgc7GRKmYATbHLVxqFq4kceGeRk5ApiUPTE7BMKos3FTfaauNrRKVOr4FIqSxnYt6
         0InIXAQ/ilg4ZX6PLxXZnR+EkjFOfCsWt9BXdgITYniHJXG1ZLY/hPenqisWJLJaYQHC
         QoWg==
X-Gm-Message-State: AO0yUKWMp5aa4rda9t17eu+QRaiLOpf4Hb7tBnlI0G4Dhrmxi/k8oblK
	k+YAyyAek5dhRkjHwGv6hWGYnw==
X-Google-Smtp-Source: AK7set/zbsmcLhFJY+8MsiN5QjmiTaTrNiZtMAVnOhYkCrKl13ehjJZ6SZ5K8PZTFRYIFNTj/tDqYA==
X-Received: by 2002:a05:6a20:548a:b0:cc:d891:b2b1 with SMTP id i10-20020a056a20548a00b000ccd891b2b1mr52532757pzk.35.1678844719415;
        Tue, 14 Mar 2023 18:45:19 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id j6-20020a62e906000000b005a8f1d76d46sm2191064pfh.13.2023.03.14.18.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 18:45:18 -0700 (PDT)
Date: Tue, 14 Mar 2023 18:45:18 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 18:44:27 PDT (-0700)
Subject: Re: [PATCH v5 3/3] riscv: dts: starfive: Add TRNG node for VisionFive 2
In-Reply-To: <20230117015445.32500-4-jiajie.ho@starfivetech.com>
CC: olivia@selenic.com, herbert@gondor.apana.org.au, robh+dt@kernel.org,
  krzysztof.kozlowski+dt@linaro.org, kernel@esmil.dk, Conor Dooley <conor.dooley@microchip.com>,
  linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: jiajie.ho@starfivetech.com
Message-ID: <mhng-348475f1-5880-4951-9692-78210a17acd3@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_184527_896316_4ACD2BF1 
X-CRM114-Status: GOOD (  12.64  )
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

On Mon, 16 Jan 2023 17:54:45 PST (-0800), jiajie.ho@starfivetech.com wrote:
> Adding StarFive TRNG controller node to VisionFive 2 SoC.
>
> Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 4ac159d79d66..3c29e0bc6246 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -455,5 +455,15 @@ uart5: serial@12020000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		rng: rng@1600c000 {
> +			compatible = "starfive,jh7110-trng";
> +			reg = <0x0 0x1600C000 0x0 0x4000>;
> +			clocks = <&stgcrg JH7110_STGCLK_SEC_HCLK>,
> +				 <&stgcrg JH7110_STGCLK_SEC_MISCAHB>;
> +			clock-names = "hclk", "ahb";
> +			resets = <&stgcrg JH7110_STGRST_SEC_TOP_HRESETN>;
> +			interrupts = <30>;
> +		};
>  	};
>  };

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
