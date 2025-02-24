Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAC4C021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkBEL3/A/bf2z4FFQsac2+cieuxk+Eh12i2MLTSARhI=; b=UltIubj3DXQ6IK
	McL4UuSUT267Iiz4QjaaecGNlipikXjpiiCChk/BHMX6SZImO3BSVzKuZ7bZGeq986n4Sq+kyGg5P
	aAcznAoNFQTo6V1PpDs9OvmZSVCAITsH3A57B0YYy0EoGMiyi/OVTnszWSS5Qercy9gPDwFEKBcmv
	v+1Tj7lG8nNJgj2LsbNKZjfCKsy4i0qsPLZH2ro+zpgOu3HP6bxTTz7Ms6PHPlSVwRJiPfd47iHMK
	YZrxTBKMGuGR9LYDlieWc0HILn4pAuBxReiIqbzgVNS+OY63+F3Lhp4p3oJ4ooHKnwijM15JONJYJ
	G/BbeQOtNAPVFCCt5eEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf3H-0000000F5Vy-3CoR;
	Mon, 24 Feb 2025 20:27:43 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmf1m-0000000F5EA-1Dje
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 20:26:12 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-220ecbdb4c2so19241755ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 12:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1740428769; x=1741033569; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgBgqyu4tKatdMND7+/18VtL/05cP3jlzOPJySx+wMI=;
        b=t/83BnntH4Qnx0mg7Bq32IU3KP2xbJA4LIcvN/ZAt+cXBhuwdoQgcgClAi4dSkYFna
         KAM944/l1HuBqrisdbJ0OzbX8+BgjhC77lLNQyWtErZhDipTXmTOZSDZMLiWMTQIT1HG
         ljzU5TTIUZHCs09sOFlYRcPBIUHsuVZAhA3srTj8IGEtiP241YF04jNarECyb5yusokG
         wzm+NNQBJUFI5fifvI1aXzYRE4Uh/+YFwz7ExtW97ARufkY5f/j/bW6+ZHty2rjOli9R
         E2VgzZUYMQ+buKQ+9MjvIZBXGI0TGWyOWx3XrDLCKhAi9fL2x95QS5DBHaBixVKPaK7/
         qKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740428769; x=1741033569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgBgqyu4tKatdMND7+/18VtL/05cP3jlzOPJySx+wMI=;
        b=YEQLZSa+rlnM+uTJ2uUqajcdxR+GfIUzaFo9EkAqQfymdwISq1ht7QskZEx8Q/PB3F
         P8tl0r91jIvYbgytEJ7pNJiIVFEg/OK5+5WQbYCCqCI8vSbBdxkwAwShxaheWysHnP/n
         V0WUoNrWgG+CofIEUzwTWQacFzLuvj3GcR9eWsm0qkjmSRl1ynvrme0cDmDdPUR/p6/t
         bHpObctttQffqcvq33n3SD45QCzEohvGYUJXQy2kmMBCc+swXv4E6CDTGsSIn4r7p6wY
         U9DtPkCgZnWifBpQAe/xheHftRgYhbmaRitJkG+nE55Iab57oOm9K4Itg0cREMw3pojn
         /Lng==
X-Forwarded-Encrypted: i=1; AJvYcCXoYxH7qh/47FQqTdSLz8s/xLnjNprVLgrOZzHOeLUZDL5BcXfC2xmxFPJNkeJs5vXV7kC13sVnl1B6ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvg13ZOPeoRt0w5aZpzlTwvp1k5AdcIL9Nw992LmqDnPAaWZ8k
	AQQNyTvleowoRAzaj0TNH59CYVqykcP/hdCpMkUlrf2prVmhP3LNvUh/q33ftfA=
X-Gm-Gg: ASbGncv05NOqMOvzo0RnyglSP1bxx4tqRTxqwu0fDZgYsKi6lWpGOfFx1AaJT4dmUEj
	y5Qgu09kJ7qQxjW6wBDFL6U2hd4IThB03TPeSpk1OlAH4oEh+MESEV0ny+nbeeGG0XiOh0fIPON
	GKCJO/JGRp6LzgkcspO01g3yXsB2vxe2yULz6HTpIaewMf25cPuZPjwQt12sFtGbJk5p0dZZJUl
	AVDm25uwExevoGQrfY4+aHe+hnVtjKsZ3ZsKeHKpdi90+6UOBTIFR2wb3tLrCDKGE5828bW78rO
	E2vEXD0=
X-Google-Smtp-Source: AGHT+IGji8X4JW99D82J1gNUv4VGOe8Di1Z0iUYkFrnt5DobfIi0K1SZsszK6YCNFA/kxOX0YVJuVQ==
X-Received: by 2002:a17:902:e80d:b0:220:f069:eab4 with SMTP id d9443c01a7336-221a0ed87cdmr259370375ad.22.1740428768763;
        Mon, 24 Feb 2025 12:26:08 -0800 (PST)
Received: from x1 ([97.115.231.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb12e4casm7009510a91.48.2025.02.24.12.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 12:26:08 -0800 (PST)
Date: Mon, 24 Feb 2025 12:26:05 -0800
From: Drew Fustini <drew@pdp7.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: thead: clean up clock rate
 setting
Message-ID: <Z7zV3Z8L6PQCLKnC@x1>
References: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z7iKdaCp4hLWWgJ2@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_122610_580017_C8F33298 
X-CRM114-Status: GOOD (  13.01  )
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

On Fri, Feb 21, 2025 at 02:15:17PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> This series cleans up the thead clock rate setting to use the
> rgmii_clock() helper function added to phylib.
> 
> The first patch switches over to using the rgmii_clock() helper,
> and the second patch cleans up the verification that the desired
> clock rate is achievable, allowing the private clock rate
> definitions to be removed.
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c | 28 ++++++++---------------
>  1 file changed, 9 insertions(+), 19 deletions(-)

Thanks for improving the dwmac-thead driver. I've applied it on top of
next-20250221 and booted on the LPi4a board. Ethernet networking is
still working correctly.

Tested-by: Drew Fustini <drew@pdp7.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
