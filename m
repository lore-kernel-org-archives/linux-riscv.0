Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC049E909C5
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Feb 2026 16:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U48aL3pwDwo7Qu4APGuAnXeu1LtaCHgWOjOqZv9KK0Q=; b=W0XAoOLUSy0dXo
	ymoZWAMK220NZZYQnNESzo3Gy2VC2+K1ZhOZmVV9ygUpSwQV6JP1X6U1xVSYzCYqt4VDUaiR01u0l
	54kEyHRFZzFVzsdhh3W4NOL8HwU7B5IQLxO5mz3E6uTjXmy1EJlcqLQ5X6LRhJaN4s83vFpFpviHY
	PsMYJ2SO+rmEpm2wfpBOY5d1tGmxabOssJuhKfRDTAdzYVU9D8Z4hvFY704X0mq0sfGKCCcAj4LtL
	uZTj8K2OWo/tXRM8LJHYJVx+/Tz7Dzuz5Y3G63MuDQoAdsEfyd7TlGHCSjFd67otqjdiJYJyNNCVj
	xSJP1TGQm+d3hc523fdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNVO-00000008XOH-0q5Y;
	Tue, 17 Feb 2026 16:00:54 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsNV5-00000008XIe-2D4P
	for linux-riscv@lists.infradead.org;
	Tue, 17 Feb 2026 16:00:42 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-65a380b554bso6953671a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Feb 2026 08:00:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771344032; cv=none;
        d=google.com; s=arc-20240605;
        b=DsCT0nHcK8G34SL4VxWl6NCKJzTS7V3bHb+hc5kFsy45rTeczhKYTeYz1n0rTy9jJq
         LoxtEDZ8GhODkYhSTfNzN/NKbGYl02c0/8enpLdl/iFkn09h4GL3m9FaaMZMJOB9M/SY
         DqFOEKRP34C8ZzmxEUo/hD1zI9NmOwDMyxCgMHjkblVoFbY1QtqO/D7E2wter8QeU8Ne
         0FMgxB6P2OCJcwz4cTdPeCADfZU7ZW4c/gvc55EPt0EYcjeZLZns+HJWCAxdVlfEhfjN
         YsOW+tXUxvEgBu+kDLPqcD/TTm+dQnhuwoVKCehGX7Wi+DIKhKLPpkxDV7LqYJpjwILI
         0dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        fh=bfa8Y4Tq9PjkmNbC0Z4/S1/VZGHNpC+piph4ujgR5T8=;
        b=GjiaesJFNHL/L7oWnCkzUWMwcXtiv4FWqrfdaZjEHLMyW7ad0BirQ7EZyexNcdmbj4
         X+He/WYa+T28YCJ7aBiOZWmdQUmDwLexCR9pNWOkW7Mi1lPpV0TcA5x37sM3EBaom2Oq
         Wjf5o1EU8W2D4XhFiA2oMScJSchXBJxNuDlMAqHYJ3oM6Gagqj4kjcKFgZsbbXY8gZNL
         i/Oo7d0PSbZah7O32P42OIAphda/u+XCnEBf/l61Ql/rSlH+XUw1MWjxMk/1NEHnoXer
         CkrJBiWEnsl1vNlUbDPtxUAqmMKRy1o2wQW3Oj51TzXe3s0keupA2AF95A+RNmOp6unn
         L3eg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771344032; x=1771948832; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        b=feApMFWHXl52sjpLvjCze87o23nZ4YdSyF14ZBMh34MtHhq9lnsjfGE8QmsWB/UpTQ
         rP7ktvZeV6A5rLI+X5+65wtoOamtpu2zRAGjT4NVrSL4suU7zpEGdD1NxEgxq7S+61J0
         oMUeI51oW5VRt9K0evEMiMepVNAMIX+cbSz2/cDAk28lbZCdPMDrIaSYMldrL0BKhSu9
         48G4agR0vvAgUhDbaF0Q9fV8tUaIJDxwtm5aWL+TuJT7/Ulo6Yyao0UdtMw5rFa5p9jd
         Yfm5WSGKypSYa9IS6TvYjUOeFnAPaPWB5pezT9LJQyZZxG5f+OH/hh3CUIsEEpK3xGUC
         ckXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771344032; x=1771948832;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lBO6AhQqWag/0+NNJRZQvsAXIIMwJp6QA15wbRYbOcE=;
        b=V2J90Hs6jmOLeLTM0jszmnGftMPjIReSvIgYFnnh0dx8fpyBidzXwmouiPPRuP582t
         R5sHTRbrxOOnxfwn1Hmu66eblIVxR6vtoqEA9RMIvFPOf5lH6u4vr1BHb+YG7fefeJUV
         2noJH1PjEYVF0ur2MiISKOQxpTwYNV1YwkVdYeOmw7omCACrbp74HSxr3C7A0qa3rH7W
         bWnH4j+0s/j/c6PSYmEE4msWtVtWXeFQDCY4Rm0FriFFwEmW4maxWVYFLrGo9r4VEF+1
         ijBvccln5SiPMRp2fcLZubcbSS9T9USlYU9bThNYfkhielEp5wijkla2T3XCNB8vcIGm
         GR3w==
X-Forwarded-Encrypted: i=1; AJvYcCW4YLIrMbwVrqnqvSejPDXuIUA2T8LZr02G16Y8px5qt5z2jduy5y+a3sVCeyUUeGhIq3KQk1zwcCBo6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxZ/ZdO5e43kujFDuIdVwbnqe6l8u6J9oYl4WA1r+eDcupzfGv
	jWdKex5zzLNTyMgcc0TvCGq1drnKJIWyfiSNkVzTPf1k7ie+yOdExrj2NLAEXBa4mHeIyWs0/8v
	Lp9/cCQZ+GEltwNmESZbaHMy5LtQrtYU=
X-Gm-Gg: AZuq6aLjCfwSFE0DjsLMNL+P0omTyaJ4Ua5CE4jJ+Iu37gMR99E1xbvvzJqmBZjsjHI
	IbKnhztwv6+vstMMDSAD9nt+x99h21fwWBgM+92fraOi+xiOa7jXmTM2EjoorhWRYvX26mjkUHS
	s4DgGfezQmT50sa69dOtkMd/QVM1/L2ov79lbeBMUY8GhdhtfX+I+f2x78pmI9JRoCBzmcN7PRh
	bIrH4bt/B+DB0LlXuJhvE//FvJ1yvROveOyP0Cac+KW9hMPQj3jp9XstufO5cMsxh9ZNj2y6vdT
	t8885w==
X-Received: by 2002:a05:6402:1ece:b0:659:329a:bc12 with SMTP id
 4fb4d7f45d1cf-65bb13b7f0amr6896476a12.29.1771344031210; Tue, 17 Feb 2026
 08:00:31 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 17 Feb 2026 10:00:29 -0600
MIME-Version: 1.0
In-Reply-To: <20260130022705.1059214-1-inochiama@gmail.com>
References: <20260130022705.1059214-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
User-Agent: alot/0.0.0
Date: Tue, 17 Feb 2026 10:00:29 -0600
X-Gm-Features: AaiRm52I-Ps0aB0W3gGP80VOXo7IKX3SoIAUz1UAML5FnQLUef3qoiKkhjg5t58
Message-ID: <CANBLGczi6o4NwDF0fge0_RZ+TVX2dQ=vYD2PYMSupb5xSnabZQ@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/3] riscv: spacemit: Add ethernet support for K3
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <ziyao@disroot.org>, 
	Yixun Lan <dlan@gentoo.org>, Zhi Li <lizhi2@eswincomputing.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_080036_988298_4D0FF571 
X-CRM114-Status: UNSURE (   6.25  )
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

Quoting Inochi Amaoto (2026-01-30 03:27:01)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

Hi Inochi,

Do you have a tree that includes the dt entries?
Otherwise how are we going to test this?

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
