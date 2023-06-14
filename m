Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1C3EB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 23:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JgxixW1ShKRaXGG296GTtT7WHgjZfeSlKCRKuw2Q2Qk=; b=1IK7GQ1PZtCadX
	z6Y62Mmup4ZbBQA2pZl2exQWaBmQCFoGHHPmeXQl8k1CSS2QON3JQSDh/n6T1i6sfOvu6fIvgsfgQ
	0vlfi6mPfwkQBKFxXXJ3qi3e1+FTotKWFga+dnIovTHR2VNyAtGfK3nRnOwl1BWAH62Mvy0+lZpI4
	AVaMwS4ANx7Cs8paqAgLZ51EZhiW2pOPU/czitpyNMIahW0QQnZyeCWX9/34VEUV97fZKLLAF6poN
	FX7eSihu0cqHwWt1uSeUZ9rE8MesJbBDpaFz7b9lwOsiAKjJS8u8G29+JP8ICAf95qnDvZnhbW3sS
	u25XA2XyBz7q2NERpzEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ZVP-00CwbR-2A;
	Wed, 14 Jun 2023 23:02:23 +0000
Received: from mail-io1-f45.google.com ([209.85.166.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9ZVN-00CwZp-2C
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 23:02:22 +0000
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-77b6e2f0c9fso82080339f.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 16:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686783740; x=1689375740;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+oJArc8uAvSjYWuHWPF0atumRybtBa7bAhsBTMg56c=;
        b=J3TGjnl6IO6BS3FpEdo05uXqAiwVU/7u7MwexCgIjszKFLLIKbQo94wofj3jZsX9o1
         fbku2NULmRVlVkeLRYCyM4fTSAcER53VY3lAfTA1E/RoZN6WjLA5/3X77B/10RcCSVVz
         HVN6ar9iKLZBwH+0FGN1MNewnCPIVHXZji5+tGFVdRDlNx4vS9jUORZy4m7evz2VFzjw
         RtiMl5ecokk1CD5iYYrUxLSdJ+cva/iR7CDRrEQ2y5t4bGa/0SMdTjXnGVo/xxf0LUEa
         zI88Oh2x0AxzCC3HdmrogDihnzNepBpQSaKP2knrS67K5C5oYGjk426pwLDtCicGCxFy
         LXYA==
X-Gm-Message-State: AC+VfDyvXTaORfTAUen1ZTsi7LJ3cCks+Hc1zaV00HAus+xt3D5Gdleg
	SZ5b7FWFrC26qHV2ZTPWKw==
X-Google-Smtp-Source: ACHHUZ727/hpgCodL36K3eU8j5Yekr14/ouFU0Ez4UR3lmvKKtDazpT2aDUicH0AkvAs2EUoL4W/ZA==
X-Received: by 2002:a92:c806:0:b0:33b:f0a0:8dea with SMTP id v6-20020a92c806000000b0033bf0a08deamr13206590iln.26.1686783739818;
        Wed, 14 Jun 2023 16:02:19 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id l12-20020a92d94c000000b00340ccdac682sm226266ilq.84.2023.06.14.16.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 16:02:19 -0700 (PDT)
Received: (nullmailer pid 3026833 invoked by uid 1000);
	Wed, 14 Jun 2023 23:02:17 -0000
Date: Wed, 14 Jun 2023 17:02:17 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Subject: Re: [PATCH v3 6/7] dt-bindings: riscv: explicitly mention assumption
 of Zicntr & Zihpm support
Message-ID: <168678373679.3026773.4984572337017783163.robh@kernel.org>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
 <20230607-rerun-retinal-5e8ba89e98f1@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230607-rerun-retinal-5e8ba89e98f1@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_160221_720759_48894630 
X-CRM114-Status: GOOD (  10.78  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, palmer@dabbelt.com, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 07 Jun 2023 21:28:30 +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Similar to commit 41ebfc91f785 ("dt-bindings: riscv: explicitly mention
> assumption of Zicsr & Zifencei support"), the Zicntr and Zihpm
> extensions also used to be part of the base ISA but were removed after
> the bindings were merged. Document the assumption of their presence in
> the base ISA.
> 
> Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
