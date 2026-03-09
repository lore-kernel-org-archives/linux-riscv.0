Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969BFFCA19A
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 22:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n//CCcE1yr07sE7wwU/AJUvN0xEHdtVho/H+zEgl2eU=; b=CWbJENC6j2b5Ca
	Bn2SB0zF5lN2QqWO0hvAIuKSScLwOWuUKp0tDL3cVzeOhCelyCSjNkzkr/0uHoB+pUQQf2VIqeZmH
	5tIK60+vPNbCj+mFdN+WufJlg10YakiLm1USzt2k+ffIw3NqaRJ1ACnGW64TaxZ1oyaucrVrep2xY
	gEO67GbD4OQTjTtMHWETpgJ5OxlftlNzFN6GtdJXrlBw2jVWh4Cefr4HXuWwcbyEf/O4ZN6igd2on
	1KEtKJebCn/FtDu9J8NgXCL9zCpuANbVG3vJZlDD5eJItMHU3LT0CTNmI+jCHcUuGysaSrTTrCdHm
	T/gCEgdU57K7ayApXRsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj3p-00000008Dro-1EAP;
	Mon, 09 Mar 2026 22:26:49 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzj3m-00000008Dr9-40QS
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 22:26:48 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-8cbb6d5f780so1228267585a.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 15:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773095205; x=1773700005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=b0qmAnC6DnZWfkO5AOHdxhn/T13J7DQN3esTSP9cxW4=;
        b=Sv8W27fNaelMqW3EbQeHaL5PSCKPl7iYzQY/fwXpTBwPEcIasJxZuWisoI9zbqebfn
         yI+Qe4H/5EbEJ7JgggGgRXo7+W/oxA+ihvKICC16kMUJHruG9TPMHhFhMK7f83XoLd1b
         InvpRp8p6PgiVwygaEzTlUPAs3rAtc72lYxANO/hn3T79ZCaTH6xA51cokw7Sti8XqiR
         u39yd1GpCk9gLIXjLOtqxRAVW+5KRniqZKd8eJ55TR/1M9/9ax+ks52jcEC1yohx/O7M
         5z1C3KIdXiY/rzZ9IUaJExvJXuxpXO3CFLLdMVcNoQGS8cRpoweMPJbfj0YPuJdpCDoH
         TGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095205; x=1773700005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0qmAnC6DnZWfkO5AOHdxhn/T13J7DQN3esTSP9cxW4=;
        b=ou9SggOSvHLb3hwk/TpymvUjvImZ8UxVWj5vv6b0oJoncb2d0PEoe916TLChg+n9jr
         Am+TdAXsp7djP2yhTM7D4LA2r8YeJLkDxbTP+kaJExBFEplCSdP35rlb9TTiJ2niSphM
         /FOhlT+qTpukqFncxgFbKeK0xNa0R0Lweksdi7w5dXMJtAAPg8F96MvUNLkNLLksbb9/
         Ud5GOvzB8FWc9CGsl9Qq/jS/aQKko/MTWQp8vUPHthXcera5m+ZresVd9evTlsy37/Y3
         gGkRPNSCIdOac3jF6zN764HESSRJjNgcsCxZIQJOGJKnVLpW0N5GxjznTcqnghD1TP2p
         YdcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVCFcPJj5a+Rtsir2y1unNHrGWfNFQ5Z0HLsVsYpY/i8lBJgl/47q+9l0fIbh42EHjpBuCD6Y39TEwlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7GYGQVdka4kulV+TxgQaoXguKN5S7aaFJ1Y1dxzSp76hAtS06
	P4Rhu9h3L71XYCtKXtsFmvfflkKQ9WwYamf6qBjGfgyCrKE18JoRXIFd
X-Gm-Gg: ATEYQzwjn7WZS7hQ5U/pbzhDdYT9VevljEVcm80k69PVxgeA7XL1kZS4+b/uI/R8iPc
	U0MpUXdBl2b9kvnu7FZHC6Yll38+Hz8rS8HaQf+rHJp96FA+PetLW/vR89xLqyp5nsBVFwL7Qvs
	cem5WnIRVpXiWm4EQhh/8U6N/lsmRV8dpv3JIYAMuVt4/R/1ZIXHiCHse5uwXrzTT3o01hD5/tP
	mkT1mZVceJMpaDOb6+VKbqPK5w/C1OVwmfMx7SB2Da9mD3730LevQnk9LA3S+8HVlsiejQYawIE
	PmGVXIdPxxabV/aFGRsYI9Qw++Bk4qaLphXO4+c8S4z/ANrs0LjcdUW86xA6CXQtlTnEPq8MYKJ
	qUiJGBO7HbwslwwjHh8mO7O3nFF0zkezZPGoaKhgUrMbKTOLCwfRgu3Kn3KRxvTRupm8/2hxppB
	otsJRK03R0mRZRYKace2mE3c9CwrDNE2r4SA==
X-Received: by 2002:a05:620a:c55:b0:8cb:4289:6c1a with SMTP id af79cd13be357-8cd6d549b1fmr1572894885a.75.1773095205343;
        Mon, 09 Mar 2026 15:26:45 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd866f7074sm325445485a.6.2026.03.09.15.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 15:26:44 -0700 (PDT)
Date: Tue, 10 Mar 2026 06:26:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v8 3/3] net: stmmac: Add glue layer for Spacemit
 K3 SoC
Message-ID: <aa9I4pIZs5-TDdXo@inochi.infowork>
References: <20260309004305.315018-1-inochiama@gmail.com>
 <20260309004305.315018-4-inochiama@gmail.com>
 <aa62FTHMOJGhVKTv@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aa62FTHMOJGhVKTv@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_152646_993933_254D2A2C 
X-CRM114-Status: GOOD (  10.53  )
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

On Mon, Mar 09, 2026 at 11:59:17AM +0000, Russell King (Oracle) wrote:
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
> >  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
> >  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 227 ++++++++++++++++++
> 
> One last point, please add another patch which adds a MAINTAINERS entry
> for this file, so you can be Cc'd with future stmmac developments.
> 
> Thanks.
> 

OK, I will add a MAINTAINERS entry for both this file and
binding file.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
