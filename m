Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F02C352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 16:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s6vp8RoOFD+dVIV4WAbyyH2LyUAgzZ+7mEUllOZm3MM=; b=ZfsaYmn/J606rh
	knHVOROVsSSxGPHv1Y4mPW/rVCsHl38ECmZcNgOdKE0EeUd2hVdAGhygtH2psbHJQYJjmDDh7glA/
	P7XNaXTcVhW3D2GY0T5Cwiz5+5cIbKUEfheQofsNWZSHntkvfOPruKvMQCf1jDp2ks+6DhVi2QuHW
	PazGrF7Iji+FxQVxBNNaFUJa+csyLOOQXv33griu7/R7UmbgtvJRjhljGUm/smby0k04DXJ6a/AeD
	thbOU44xkWUf1oK4ZO3Y7mQTucfGonsluS97kGVr9/88AULsCRD/f+TnK2Ct15Efwhmwdi+eatsK9
	j4D5YgkMeUylOrvDZs1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xjK-007253-8g; Wed, 07 Dec 2022 16:57:10 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2xjG-00721X-Hu
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 16:57:07 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-12c8312131fso22014179fac.4
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 08:57:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjsoTXGri8JLvJW2T8GIZAWKirugVS34hV+s8paAZjM=;
        b=QQNi/cJxn98/DH/Kd1WT7rSFpUb3DL/imkk21L6nWGD/g8eqYEs4rolSYQGfSE8Wrp
         SXm44k4nOwTwmIN463+C2SkjhTkIW292Wkp5AAxbjGtgL56HfcsLgTngsIDwkioe18+j
         u2F/wsE/vgccA8ybJFzBdKhLoYsl2HvDAzDaJ2AAxJV1MEaUxuzo0U+rkp52XTwjRGnb
         jnE/0vCUS4miADDOX78JFkjjOC7+l1bF//7l2IJeg15LCL8+j/Ld1pyMRzi/ugxIqAw3
         7wauyPtzoVr0guG7W/UunVyanWoLXr2RXGQzVGGFNtNQxzPwXe3+g3OO5SW5wvFno1fN
         FR8w==
X-Gm-Message-State: ANoB5pmXf6kZ8qbtT8tDRm4JqUzpbq9k6F62Cn6yulGc2sTXVJk1G/5X
	8eg1S1Vm07ZgkkeAuQf9aw==
X-Google-Smtp-Source: AA0mqf7VORNFgWUjiYSUyWALvb0Vfyh3rcM9Jxf+M/TQedidfiv9ZxymKnscFUHhOk0EfWqVdzqw4g==
X-Received: by 2002:a05:6870:e99f:b0:142:d085:c1cc with SMTP id r31-20020a056870e99f00b00142d085c1ccmr44003737oao.29.1670432223084;
        Wed, 07 Dec 2022 08:57:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d6f19000000b00660e833baddsm10495609otq.29.2022.12.07.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 08:57:02 -0800 (PST)
Received: (nullmailer pid 2401862 invoked by uid 1000);
	Wed, 07 Dec 2022 16:57:02 -0000
Date: Wed, 7 Dec 2022 10:57:02 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: sort entries alphabetically
Message-ID: <20221207165702.GA2396480-robh@kernel.org>
References: <20221202110536.22230-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221202110536.22230-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_085706_618029_1717C9AC 
X-CRM114-Status: UNSURE (   8.40  )
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

On Fri, Dec 02, 2022 at 12:05:36PM +0100, Krzysztof Kozlowski wrote:
> Sort entries alphabetically.  This was a semi manual job with help of:
> 
>   cat Documentation/devicetree/bindings/vendor-prefixes.yaml | grep '":' > old
>   cat old | sort > new
>   diff -ubB old new
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Patch rebased on next-20221201 therefore might not apply cleanly to
> Rob's tree. Probably should be taken after the 6.2-rc1.

Indeed. I'll pick this up with the other treewide cleanups planned for 
the merge window.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
