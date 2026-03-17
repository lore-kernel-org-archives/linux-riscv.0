Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AE1F3380B
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Mar 2026 07:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zvi8m9hrLeCbNvTCW+YdRUdXnXZnYFx0LLx9HI1CQHw=; b=M17CpRJDH/bh1q
	4KdRMcL6RB1JT5sgB8KGyC9KVQx0K7xP7LT/6YDjBLaATMvwbL6YQORjx0KlAz+q5ZAlO08svjGvl
	gmgcKc9HVMiSqVbgq6rrgV8fYCUIF20WP5LMATayLovPr0Pi70s110SkVkKWwvYuBWG9Z0T6ST6w3
	aHW850sxZ2QrLVXvEJWqStLvzrYgaT/ePMUCElHESZygeK/7yP04MnamH9iILiNBjfZzqH3nSDMFO
	X2AGD2+ZijvX194kGMthKlBX8Wd/hwp2BU//zedXUE3SFMv6H0vb81M8JL/LVeltR7kwRKfSgqzgL
	Oiv3zHCZ1AYCC4tyoMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P48-00000005aqp-33Jd;
	Tue, 17 Mar 2026 07:42:12 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2P41-00000005aoC-12Tw
	for linux-riscv@lists.infradead.org;
	Tue, 17 Mar 2026 07:42:06 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-829b8b6c4d0so4348054b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Mar 2026 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773733324; x=1774338124; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3gTRwPvoaoGKMWruMLfYdpsxbqLbc2avIWpIrbVdsbs=;
        b=NZ4mqTne0r9czJGz5+Z26+xbFd8DSpZ6/WItfszsp2fMnbhL60uGm0KiZ3hxDOaaUb
         g8KNHNJtElSVY58RP3zCfke0rLwZhQyOvQb62cXK0Scf+BdTajDkxl7RrllwiGbsLH9U
         w23EFydO/J8Xva4fQNGhQw73PAM/cmcmh3jA1Di9ZWwv0YZh8XYk5w3eqg5RHAJIVoEP
         FiTiMZByXQJfjiKtiQXK3YSuraift5yQHYg02SzoqyO2Emxc2DxA8OR546W76STKyQhT
         yaYsj/yYgwmQ/71NHcwo695Rp6LlnodayMx9mvh/X4xKuDYuWZjei2pXxjxrsBAc6ogn
         NW+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773733324; x=1774338124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3gTRwPvoaoGKMWruMLfYdpsxbqLbc2avIWpIrbVdsbs=;
        b=HP3PF4Zfv386CNLanPs09H2ozXK9ldsBRjWgoA06iezloW6R5S9tJl0LDpVI/LeUBX
         xLR5BPOrYIlYCAjFgxsFFi5SuM34tQ9XrhXQhUaGrfB1xlNB2zHDqHQRCKVgx4DMWHbO
         MeLAMU4095pm5UpovpLKlwJB1BFFYibfTC26NPdO5s0Jb3anpsQIamRAjKKlabLoszyW
         TjjXdFqZuAElLhgpnvl2ei3r0rUBR8KVoHtShGBSbGJQCN/bT7VyPfwfuObuCtWWJn9+
         ujSoGNxYpyo5FFH3l87gXRG5HdFu3hv1FbsIaU9yeR5EyEsE5PAeRg2ZN2yDz2l824Dx
         81Aw==
X-Forwarded-Encrypted: i=1; AJvYcCWoG+XZd+V0nhizjXEE87rd4+h/rD5ZXpUIWrwU7So6QB0Vy6JVX95p7WrR0Gj5a/VWiBtTrUgAOIHiEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2E+8hWLXXvyo0vu1jXTxcNUVp2WDJpaR8otTuYrZhWWxDyrbk
	K1G3XI0d3h7d/aEMjQgMSV02vbPNwT9ptQS7veOo8Etj0SktIpbBZNmV
X-Gm-Gg: ATEYQzym3SmZYZUHr9iDgcQDH3B8Ajv+PadM7BMmUkC5WlU6vAWp/SdQaHGNNM/ZePP
	HhFxGJRsgvOhbETVp+jC5a77F7XHBx/UEotmbMmSFBmY0G08dp4ew9KTEUghFP1Qc1lQq5M7JFU
	YL7knuITZyir2su1WVmVfSwHZj88/V701OAglU9KCSeYwASEliSRSvbhPPGLDho9z3N3kFubbzD
	XAW5ZS2HWe4R41gRIsL3Rn5zWXa4jyZ4ph8HiN9f5OYcjbGea/ZWjuKffRCuyuuObDTF5hXQgDB
	TWxsHqG2uMfgElpzImikhf5spIlCaLGWlYWt9N3MYWLCj2qrtF9vlJ5chZcfDINwiiS2GLOwvQx
	C739WxZgCvEC+yR4udaT8AIxlp+0RaWfHQX0EgJ+CK9kMzOQ6gWr1UdnQMLZbJubpVsB99sffBX
	CafAqb1tpE87aRXKxHQxbiSY0=
X-Received: by 2002:aa7:88c9:0:b0:81f:4675:c2a9 with SMTP id d2e1a72fcca58-82a1957f3b6mr14731969b3a.0.1773733324070;
        Tue, 17 Mar 2026 00:42:04 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736deb4sm15367325b3a.44.2026.03.17.00.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 00:42:03 -0700 (PDT)
Date: Tue, 17 Mar 2026 15:41:56 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
	Yao Zi <me@ziyao.cc>, Yanteng Si <siyanteng@cqsoftware.com.cn>, 
	Vladimir Oltean <vladimir.oltean@nxp.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Shangjuan Wei <weishangjuan@eswincomputing.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Zhi Li <lizhi2@eswincomputing.com>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v10 1/4] dt-bindings: net: Add support for
 Spacemit K3 dwmac
Message-ID: <abkEPCRBkQIgx5rx@inochi.infowork>
References: <20260316010041.164360-1-inochiama@gmail.com>
 <20260316010041.164360-2-inochiama@gmail.com>
 <20260316202147.431d9aeb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260316202147.431d9aeb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_004205_300987_6DA01F1C 
X-CRM114-Status: GOOD (  19.54  )
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

On Mon, Mar 16, 2026 at 08:21:47PM -0700, Jakub Kicinski wrote:
> On Mon, 16 Mar 2026 09:00:37 +0800 Inochi Amaoto wrote:
> > The GMAC IP on Spacemit K3 is almost a standard Synopsys DesignWare
> > MAC (version 5.40a) with some extra clock.
> > 
> > Add necessary compatible string for this device.
> 
> In the previous version the AI reviewer complained that we're not
> adding the new entry to the select at the top of the file. Other
> compatibles appear in 3 places in
> Documentation/devicetree/bindings/net/snps,dwmac.yaml
> 
> Also I asked whether we can drop the "default m"
> 

For the Kconfig, I think it is better to keep the thing the
same as others. And I guess this question may be related to
some compromise that I do not know, and it is a hard thing
for me to answer.

> Did you disagree with those comments or did you miss them?
> stmmac is a strange beast I don't really know what's going on in 
> the binding, so just double checking this is intentional.. 

Oh, I have forgot to reply to the binding.

Currently, I disagree to add something in the select, as a
new binding is always required for a new device. Even if it
is already supported in the existing kernel, the new device
is required to add at least a new compatiable string for it.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
