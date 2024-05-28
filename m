Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DD2C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 10:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JL7kkM9Eo+ZE5t2IzkKFxT4CyIZSW8ohrnEzkh4mvnI=; b=1R8ezmZ6GEPweDMNgw5iJTZDzi
	VjbuMXlXXBrpz4ntpltc3zzNU835H2xV3gMO5P8iDU8/L/kHCI/kz+wu4RuL/QKEUBGd9DEDE3RGy
	E35tL3YgdO0KaiztS5pN40Hq39rR+Nr0l9wuuO5Zu1ms1HVLuDx2Eb4iTGeBJekV+rtctD6MGyv21
	k0u/qdZGLoy8rNyl6nXTga7RZ98KnKxqP31jspaINcnQ5gdRFR6lUAUg5z7z+0eYM3qIFCnJoKAJw
	ZbRtUjN0l46cYxsQG0xQifQBxezJ/Ah1O6+OywfGM2ROSBfQNDWLWOlRSaYdPRe2tTeM6EZm1MTuc
	O6ExsjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuTK-00000000HJK-2v3s;
	Tue, 28 May 2024 10:54:26 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBuTG-00000000HFL-2dUf
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 10:54:25 +0000
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 525B03FE4E
	for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 10:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1716893654;
	bh=t+MxTuy89r1XuUchAjCOh9jZjiiQ9E0Lr8aKDQQ8Cs0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=dlrQvACEix3tkkCTVnzmCmdJr4ZfoNHp1zrfsk9beHxf4aQqnGNHibu8t2yWecSji
	 ghjebFTmZJzsgLux1g8nbSchrDVHa8WEoCWx2mBzxY/re0wJ307+4OERyD5nwieTV/
	 979lxYykQN6ZmMFjMiWVHM/ZBiKZ6Ta2XCFK9j6KA7dK5KuLUj3owmeJDyRknT+JpK
	 IY0q4v07Iq55thKlaT0Tq3U3wEjNUoLj2x4M7kFBFFRYL8bSWaO2vCYHwx7AkzENjX
	 naeF+J/bRuPXjWi1sxVDUAlf0LTlkGyD5hvbvFBmGDbhHdQYvIjfJxn+GokOvpp/nx
	 eiREY3GUrRXFA==
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3c9c4a2ae6aso764979b6e.2
        for <linux-riscv@lists.infradead.org>; Tue, 28 May 2024 03:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716893653; x=1717498453;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+MxTuy89r1XuUchAjCOh9jZjiiQ9E0Lr8aKDQQ8Cs0=;
        b=RWrauve9j0wdPDPoFrkVlCm5rbxz4XiJNxfLCxsAB9vgUUQbiA6RMgMj3qsQMXe2Ns
         XHGZsBA1fv4djsBN49QMLM/YhkXRk6VWSKzsAvbtCgH3ESHv31Fyenb3ATi9eH/tqpns
         mhRXPUo03fywU/CS41/ITGkz2n1bgMBdp6ejF9AnkeQwi9yeztvGEoPoM2uxZo5v/vFJ
         AexUodpcmzCxm4IX6dg6bSAkZVKW+rS9d07NNfawS6Pj35yPyyD8b/2q/xx2L27+f1NI
         SqkEd9Mr8eSLYh03owyegsLXuQuGKgVZ/hv5D0WFvgMs1TWY8/PJZDRHQsd+Zf/q2Dcm
         gzzw==
X-Forwarded-Encrypted: i=1; AJvYcCWG44nWYmw0oNrTi5tnMM+sr6DRuvWGhaYYfJmpB7MeJzDKFeMUMjr3R9OvINNHszwZcY6gB5niHPY/zjklbHrbYsR2Zv7tCsJRewH7Pj4G
X-Gm-Message-State: AOJu0Yz3Apsz0c8OTej977/5DEPWxryzcMXJaOVPpS7DUFIcV5t2Ozip
	YslnynY4Z1GaL+QAJ6pONqVSilLDId4F4o9Qd6ZFBBdIfKNPtg2H3pIcT+SXyYWg04QfxpQZuEK
	zojkPkKUf3XBVb2elD/Xpto4CZKpSL8Bx1ttWjvIBPj46QbrWjaeLqKOCzwqUCjqQ69ui4VAOyz
	uUd3eLBHgxT089ZKUS1sQprw8CY8DK4c3Ipa0rpmn/hbyDsXhHK8Mfy738
X-Received: by 2002:a05:6808:13c3:b0:3c9:6987:1799 with SMTP id 5614622812f47-3d1a7c30f2dmr14667504b6e.55.1716893651282;
        Tue, 28 May 2024 03:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRnQ2YYO2njdHSKr+gsseo2W9USVkHj8m9Htc1vxAMSS1DDFiKtyDLGfxlb2TUj9R9LX16696Z0LisylVtCkk=
X-Received: by 2002:a05:6808:13c3:b0:3c9:6987:1799 with SMTP id
 5614622812f47-3d1a7c30f2dmr14667457b6e.55.1716893649577; Tue, 28 May 2024
 03:54:09 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 28 May 2024 06:54:08 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240528015120.128716-1-minda.chen@starfivetech.com>
References: <20240528015120.128716-1-minda.chen@starfivetech.com>
Mime-Version: 1.0
Date: Tue, 28 May 2024 06:54:08 -0400
Message-ID: <CAJM55Z8KuzCMEqE4x2rsoiJTjkWhf-B5bCzaWMhbtDndZfNNOw@mail.gmail.com>
Subject: Re: [PATCH v1] MAINTAINERS: dwmac: starfive: update Maintainer
To: Minda Chen <minda.chen@starfivetech.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_035422_888526_52664052 
X-CRM114-Status: GOOD (  10.87  )
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

Minda Chen wrote:
> Update the maintainer of starfive dwmac driver.
>
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6c90161c7bf..2637efd7660a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21316,7 +21316,7 @@ F:	arch/riscv/boot/dts/starfive/
>
>  STARFIVE DWMAC GLUE LAYER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
> -M:	Samin Guo <samin.guo@starfivetech.com>
> +M:	Minda Chen <minda.chen@starfivetech.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
