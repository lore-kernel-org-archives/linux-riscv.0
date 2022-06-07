Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093D3C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 16:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILBI+baNsJWyDRVKU0D28gBmZlo0sY9zu1MuFcpmaGM=; b=3/mz+8Mx4rWZcL
	9viC2QnFYUGk77La1pRMjrKY6dYzdyGnb9NczGu7D+D5Sfyqx25PojsUW9+dVIEyT57JyiDYKepDb
	DigzRIxDR2kIGrkseg66wWCfCtfLV19FHWLoi5nYcpzVOxDZKRQA53uZy0hFuLE3kpvtdImO5uu4l
	RY6oFOX+jidaMpV3f30A++eTFpntDhxghsUXO1Z28w796shj+53Y7GTVbWd+eMWtHTzIl7oHThO6H
	AbY6fnFp6dCNikQZA+k7NIbNWwE2gG930QrMpKLFFyTjVSyWdgSmIu4z6T+BN8BADiWe0J/NmlHXW
	ByfVUVk26l+fAixWyU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybvl-008PxO-IZ; Tue, 07 Jun 2022 16:19:45 +0000
Received: from mail-io1-f43.google.com ([209.85.166.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nybvg-008PwB-6M
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 16:19:44 +0000
Received: by mail-io1-f43.google.com with SMTP id n144so2948571iod.4
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jun 2022 09:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=T8bDFzFxvGKBXIa1I0lB1TI0RNvCh77l2ZFzrHICquA=;
        b=4oTCIpiIYhZK4xbYR+SPvB4pZSP1aE4XFZgvv1tFeZCsahVeq7I4fvwIeiIQN3bmzn
         1dyqa22W2Xk4Eio2BTWHouvjuAxbRmAXA10zVLYsn0EHmHIid0xaeOUs8MrEryRXKCcd
         +6a0A8s6Ak6cSwFaWGMapY/PuetdVLl8Op+0KGZftl8DXlfm/bYsAENc2oHT8j8cLIJ0
         DhftEc+dFtH85fNxPJqRk3oMnCwp1NvRrYI9UjGO+50Xlw10+3FFPyp+OOjUvGX0eduU
         YIwFB7GzEW/Ygrg0RT4Z4S6DML5j5g4u5gIOSSDeKehbZDWhgpNk3JQpJ0cIIcvPwVAQ
         M1XA==
X-Gm-Message-State: AOAM533AVJy+jf06ScrUbFbJy055mAs9q+cGjnFGQ22ghqU2Lzu21IEU
	RbdAwmcik0A8PDlWLmiPxuMFKtWu+g==
X-Google-Smtp-Source: ABdhPJznA3tBEmTJuk9dMlI0xK1ImseC7RMKP1A1Ss/doNhS2WbvIuDdne9RTEmT/Vyt1gLcxzNPog==
X-Received: by 2002:a05:6602:14cc:b0:669:7561:ee0d with SMTP id b12-20020a05660214cc00b006697561ee0dmr2260716iow.156.1654618776943;
        Tue, 07 Jun 2022 09:19:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id x19-20020a056602211300b0065a47e16f49sm1945360iox.27.2022.06.07.09.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 09:19:36 -0700 (PDT)
Received: (nullmailer pid 3370017 invoked by uid 1000);
	Tue, 07 Jun 2022 16:19:34 -0000
Date: Tue, 7 Jun 2022 10:19:34 -0600
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-can@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH net-next 1/2] dt-bindings: can: mpfs: document the mpfs
 can controller
Message-ID: <20220607161934.GA3369934-robh@kernel.org>
References: <20220607065459.2035746-1-conor.dooley@microchip.com>
 <20220607065459.2035746-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607065459.2035746-2-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_091940_270563_CB8638D9 
X-CRM114-Status: UNSURE (   9.57  )
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

On Tue, 07 Jun 2022 07:54:59 +0100, Conor Dooley wrote:
> Add a binding for the can controller on PolarFire SoC (MPFS).
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../bindings/net/can/microchip,mpfs-can.yaml  | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
