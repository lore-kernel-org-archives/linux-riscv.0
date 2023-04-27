Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B755C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=17Btd6+VDYpLtX/XwsFw/4klZBYn0hzAMKGkQkpHr44=; b=tulsAeiMDu9lAo
	YrEnsZ5TeJid06OemNTwJ1DN9UYr8vcOHCoMfNBEio0F0kMgg0we92q0ao5GPAqVs6dgGrGiOtoDJ
	oyXBkzf2HijRuuLh94l2MzQ44VOk1cN4j9PyIDKRBhmrrJLwv3lqYsuG0sQAZlJywSiCJ5kQ/Bqwl
	B4UYvBSRLtbirQDXvd92yzSxeo4fHJCztaYlmp15lRBonyoWNMbsrsc8aV81Pum7L0zEgewG3KnD+
	k/KmOG1TVcU8XS94yX26H9307+BUuVkJitIdzOAMsczHygkegkigC5oJ3wIvb6Ms0DXSKmsztRFTw
	aLBnvy2l1uIJZ0C7qBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps48b-006xIv-2g;
	Thu, 27 Apr 2023 16:06:29 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps48Y-006xHp-22
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 16:06:27 +0000
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6a5f03551fdso6542588a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 09:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682611583; x=1685203583;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UL+TgMFr2dGX/yxyLBzT5i3pWvxRT4g3cHsVhb/RPR0=;
        b=dPtAxaYBm6sq989Yx7QGyJ3D4phP3aC87g1UEDy1sfauoo0mWCx4RMoinqBgppeNHi
         LG4iaMWRbGLgfT9IOHcmDJNXd42/UAn50+gQR0Osmi3qgXPVqM83caGMCmXm7k1j/aRw
         MBWV1X4CQT1Sa6vDB5u59mTUe9abGspOcGbP5SmBaD5NFe2gwLsqh0wVpnSOcEO1Dwg4
         jFvsaPTTcgH8YSLYMUCOjI6Msxigx5/Z188u+N7xHcAbFikmTYqf73pkudAmUEVG6SND
         qE/38+KUTsbLJkmDG4ONOYSAlV9g/h//RNwNzKn3Spkbh1/04mbmPaU45d6rF2QcE2lx
         KTCg==
X-Gm-Message-State: AC+VfDwoKDPKaP/VZu4XHcOQtZpLCPVqj2g9RY3d6dHUSXaOvM48E3+L
	4+QbqtCOGbSeLL8oaHnBaA==
X-Google-Smtp-Source: ACHHUZ4ed5DlUjKWgsvo/1LufvyDhn1AGC/56srInr73TfXBi9O3ZzpDEiDjI0gMtFXFXVV/m1uxkw==
X-Received: by 2002:a05:6830:1e93:b0:6a5:ea63:b9f4 with SMTP id n19-20020a0568301e9300b006a5ea63b9f4mr1048223otr.15.1682611583617;
        Thu, 27 Apr 2023 09:06:23 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m7-20020a0568301e6700b006a5e0165d3esm8202046otr.19.2023.04.27.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 09:06:23 -0700 (PDT)
Received: (nullmailer pid 3107383 invoked by uid 1000);
	Thu, 27 Apr 2023 16:06:22 -0000
Date: Thu, 27 Apr 2023 11:06:22 -0500
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Soha Jin <soha@lohu.info>, palmer@dabbelt.com, Wende Tan <twd2.me@gmail.com>, conor@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Hongren Zheng <i@zenithal.me>, Yangyu Chen <cyy@cyyself.name>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 2/2] dt-bindings: riscv: drop invalid comment about
 riscv,isa lower-case reasoning
Message-ID: <168261158214.3107331.4410018416833510357.robh@kernel.org>
References: <20230426-satin-avenging-086d4e79a8dd@wendy>
 <20230426-payphone-nautical-7098d15035c8@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230426-payphone-nautical-7098d15035c8@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_090626_666050_26B42C1C 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Wed, 26 Apr 2023 11:43:25 +0100, Conor Dooley wrote:
> "Ease of parsing" may have been the initial argument for keeping this
> string in lower-case, but parsers may have been written that expect
> lower-case only.
> For example, the one in released kernels currently does not behave
> correctly for multi-letter extensions that begin with a capital letter.
> Allowing upper-case here brings about no benefit but would break
> compatibility between new devicetrees and older kernels.
> 
> Drop the comment to avoid confusing people.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
