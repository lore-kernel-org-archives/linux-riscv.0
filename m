Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE15ECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIX61Kacipt7QBFnBYEBxRul1t57bYcBU0Nhj7tSuLg=; b=Cn/idU8dIUzhO8
	pMNJZY8R04zkM5c46sSy+ySNEI4Hifre3T1XE0gXPYWnE5vSAs6YZq7OyS1zFt9QZY+woSrUooMUm
	kc9Lx/sdHnC1Fz5k4bZ5iGM4gkLChtTdnEY5lbmASuOO6qYQsbFveoLfK8Ss+eEH90vAa23UXQeYN
	T4No/luCFnCg7vRa2fUT0QHz5P8qkur8dN4aB1cVd1utvQzWotQIoo9ycrzdwig42df7yIfeb6flN
	Gk9Xyb4ldj2Y42R3PBXOdb2ke9Lr/yiMZW9ZC4+nafv/vygjxkjZTM0UurbLqOYNS2KD/YwzQxARx
	HIcyc8HoacaFLZgLMteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0f5-00GwB1-Kw; Tue, 30 Aug 2022 12:48:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0f3-00Gw6i-9K
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:48:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 3B343B81B32
	for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 12:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013FDC4347C
	for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 12:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661863686;
	bh=/cAJwBHtM/ZURW3cF5eFVB0hZFmtk7GamSbxXq9JtWo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=huSe1YohCQxf4H7e96UWv5Mjs28frLHyOt4kUHnkbsTPI9PHdVXBA90CE0nVX/bQE
	 6+ROles0scsg9L0csQEvv9KqOo6vcHjhicLtcimIyF63rlJl+cYcd2YknRk6WvSTqy
	 PQNB5BZvnI14eeJK/Lpk9Hyabjfj/6PBLls8VayuHXnmX80FRVtVH7DikPGiIW78/U
	 hXh4CSbPjXHRTH1eO1fJbEb0afdIrPxKvrEfkiXg1ZiJYFeT6qNFWxNog4gyugHIbk
	 8oGNDGLRR0r0OfKO40aejhv9Hpk0vDX4JqAJ4A6XG/b4U6qhZkP41DIVWR+9caYYD/
	 n8G50TLq5B5mQ==
Received: by mail-vs1-f46.google.com with SMTP id 67so11364815vsv.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 05:48:05 -0700 (PDT)
X-Gm-Message-State: ACgBeo1TMRCzevu7XivYYCNFIVdb1R7Y3W/jlKkYD3tj+3AaN+8MdsDS
	fUDaIc7Ua4+c2o7puI5WNedrWjVo6OaRcjWQFg==
X-Google-Smtp-Source: AA6agR4BFxbKvuMHCS56CHge6iE78gvzzPulVJJ1K3ptPrTy0eibGx4WI+E7FOdKqKeTEMm2IWkL3Jc05bfWSfSp3QU=
X-Received: by 2002:a67:b808:0:b0:388:b23e:8395 with SMTP id
 i8-20020a67b808000000b00388b23e8395mr4860489vsf.64.1661863684738; Tue, 30 Aug
 2022 05:48:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220829062202.3287-1-zong.li@sifive.com> <20220830083606.1681385-1-ben.dooks@sifive.com>
In-Reply-To: <20220830083606.1681385-1-ben.dooks@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 30 Aug 2022 07:47:53 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKo5puQ-nE=G9YPon2xFb7MRX5GGj11YPPjnbRJ3yVX6Q@mail.gmail.com>
Message-ID: <CAL_JsqKo5puQ-nE=G9YPon2xFb7MRX5GGj11YPPjnbRJ3yVX6Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: sifive-ccache: fix cache level for l3 cache
To: Ben Dooks <ben.dooks@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_054809_513917_DFE2B668 
X-CRM114-Status: GOOD (  12.66  )
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

On Tue, Aug 30, 2022 at 3:36 AM Ben Dooks <ben.dooks@sifive.com> wrote:
>
> With newer cores such as the p550, the SiFive composable cache can be
> a level 3 cache. Update the cache level to be one of 2 or 3.
>
> Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> ---
>  Documentation/devicetree/bindings/riscv/sifive-ccache.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please send DT patches to the DT list. Resend so checks run.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
