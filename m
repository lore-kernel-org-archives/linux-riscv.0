Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494E8CFC265
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 11:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L10Wf6YuGuBVnLq0MmpeuSYrS+nhk5gyilxbBC/FyJQ=; b=FLRp/hMwxgsWPq
	hzfXQ86Mndp932d78Ce23fA1MFg95SaoAjI8YvKvbRWhjXFXUgwJ4S0niOBHrOU/sBMtI0azDCSp4
	G4Ml76cV2DjYN7s0n8zHfx9qFQU2kd5Y+jHAuI/iSpvH+Au9gVMF0edrTrXhouBO+VryaY51LoZxx
	09jVPrmcN/VBmX+xmx08JKZl5DBNoUWccUMMUOzQF+d8QjNDqFrwcLcA4srDehu1z6BtGoXSVJ3H1
	gKluqtuWHcTeNIir+9CXUAMb0k0xIsMk7l+IppCBvLBfP93hnw+jSsWOXu7uBVknE+Rj1FIB+0nZ7
	NUzTFb5pZtPJJqoMW9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPgw-00000008KVK-0ZMN;
	Fri, 21 Nov 2025 11:52:42 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMPgt-00000008KTe-1bZN
	for linux-riscv@lists.infradead.org;
	Fri, 21 Nov 2025 11:52:40 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F2FC33F945
	for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1763725958;
	bh=uNAEm3X6ApLejKPLr0tADG67AwERYnvN3fzQ+kDZhZc=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=CtPZnTzE7MvI94L+l+ZnesimFZxbmzlaEPWXALHNTEponnwSz6DMMr9dXP9xOrLRl
	 lbmMGylETLC+VGO02BbAJ+V9KFH9XDQfy3rfgwZ+qPbhKFWhcAhuunulUDbhVmajZ/
	 szicxrs2f2BA3PefGV0GkjxlP6+vPZOWfPKZfScf9GjWDmeVbRGINmhsBet7UXvA3T
	 3DItah1lEI6OCKdL1tR8JKybGALkw/BsBjTbRp2ELqjN+6xZhBoNNC9lVjnSi0uhN+
	 F5ETxqxFjaFB/tjpaZgik3h+I1GInNsDNqbk1iySFIld06Z+F341at5/PKesVgyfrz
	 RN4iMVujljeyqWtrKryVJvDyLCJ5yj9TSKHo/O/8AscoEn3SFUBirXB1F78UWb1Dx7
	 0ewJLIqmfJbkG1xdwJHp6TxT9LVPNdXHkEc0Ezkq4Su6tzZHTNgEuSwrP53PMPuGAK
	 nLsVQWsLt8n5P1uX89PuIjJ3vrTPu/VzCBG8U7Js4ElvgqVuwu0faKyrCQ9eqrBI6Y
	 W1NLxgPZvzbJYguthcmi6s4D1gkSjV+c04smX6SpgtuV//oqINv6ar7fXw6zmH4QTu
	 RbS0IKuthoFH+5bgc7p6l3HYALa78QQKaVl9UWOxUpj7pcdXHOzUQ40gd2bsPQU4IJ
	 yaA1amJTJptQ49Sld05a8tac=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b739f418149so184321966b.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Nov 2025 03:52:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763725957; x=1764330757;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNAEm3X6ApLejKPLr0tADG67AwERYnvN3fzQ+kDZhZc=;
        b=BnfwAJp54lr/Ff7DAkWifI/uty+66PSA6Wyf1g63fhHwKLTum7ymP1+8JLnz3Jk0hT
         WZsf5WW1CXCHz7Qby3SugSjf35jY/1NBHF/ZbUkSg8P4M2dHrqTx96N3xrPXkwJTdtNT
         h6BSXbG6A2wKCSOsTHijDblZlv/45biA28eqZ/nx1ETkDYzj4247vCaaNuz6ERY3ODqM
         XpZJtLgFPx13wpWoozw0tcXOHQAPK6qbFg/U8kiahL0Vjdc0RVAaUSpAjxCGjeFJWhs/
         //UFKYnFD57zj5Uh9Dtfoe/FwwdwXuJ2cctgRCxZjn3EvYtG9tRvAS5bZUBUBG6UEMGu
         M03g==
X-Forwarded-Encrypted: i=1; AJvYcCUNqVnfThl2CwDLgcw1GyOuirsDaYFgduZXnIFeNZtzl/lx2zAp4R3ojU3n+AZ3m6mBYU9QjY+Aqy6ARg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJ8lwdoWKWYa584GByIgrP4OeHcaLEVjGajFcvGS5sl0M0ewj
	OMb6i8kNTT7mEiaQfpfrtpOAW7AR27rbjMQ06r9lAHEnp6k90w4ko8gxv7XOr4yiieYpBliyjbR
	6RSvB8lwwjkS3LTJ8HlfZofoRxaX+BC4vFKhfzGtcErMaIPM9pxbU7Xj4lUSnWd+prmEa1keALi
	Fa+85oeEbUgDWOfzapASJqE9OVaQJ9fowJi/qfdACa9fiFB1T4NGd7qI56D4RG
X-Gm-Gg: ASbGncscQtiyLt+s5a6DIp5ayttgWS2Wsc9Nl4LdAcyLvHVF5oyXtbAtkf2QMalm1Y3
	Dt2cv4uFTQusDimMB/EXUrb+Ydvr0mXp5FolCfERnEsQmPVomag2NN75ilqm7MPJvByJ2sUfgeu
	tDiZVujH/CgU6SQHukYgmOeveDDtrpB29B60iFRV6TEa/QSRIzebeowE7eSBmWsOAN
X-Received: by 2002:a17:907:724a:b0:b73:3f7d:3df with SMTP id a640c23a62f3a-b76717099ddmr221800266b.41.1763725957433;
        Fri, 21 Nov 2025 03:52:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEo3/R0RE+QajhIcex7ztFV+fE9g8jRx47lb8D/Si/wq/K1MoyobYB9iEdo32Zga+8FHLJyvmoqrjQgKT7dmcA=
X-Received: by 2002:a17:907:724a:b0:b73:3f7d:3df with SMTP id
 a640c23a62f3a-b76717099ddmr221796666b.41.1763725957069; Fri, 21 Nov 2025
 03:52:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Nov 2025 05:52:36 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 21 Nov 2025 05:52:36 -0600
MIME-Version: 1.0
In-Reply-To: <20251120082946.109378-6-hal.feng@starfivetech.com>
References: <20251120082946.109378-1-hal.feng@starfivetech.com> <20251120082946.109378-6-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Fri, 21 Nov 2025 05:52:36 -0600
X-Gm-Features: AWmQ_bmJmRpQ-BCAoCJ9zUrsT9I6UmPTJNR96lDCmCqUfiOssoO5uKHnrjCPwC4
Message-ID: <CAJM55Z8HqpDuTM_ByDy4uANc1LqULA8--LVUa2kpCmSAdBMD6A@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] riscv: dts: starfive: Add VisionFive 2 Lite eMMC
 board device tree
To: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	Conor Dooley <conor+dt@kernel.org>, E Shattow <e@freeshell.de>, 
	Hal Feng <hal.feng@starfivetech.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_035239_545424_A972573D 
X-CRM114-Status: UNSURE (   4.84  )
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

Quoting Hal Feng (2025-11-20 09:29:46)
> VisionFive 2 Lite eMMC board uses a non-removable onboard 64GiB eMMC
> instead of the MicroSD slot.
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Acked-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
