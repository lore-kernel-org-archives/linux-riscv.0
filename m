Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70B3C43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 23:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0WfCt0wxswZ+W2t/zBZpcXkmIR1Mh0Y2buZbRfc6CM=; b=c66DhVYj0vCicm
	YXWh09wCc/2tYkPrEqI5NX8dxnEeiVY9YwRA1VSFpL3DFLRzDLnuapkV09r+Bdk1tL6W4C2xPpGiT
	HqVDeDW1GxTW6z+tWxCOX1tAFFwYTh9pLfdSqKvG2MHClnBkfD5cnel9MXRNaehKITXIa7+8x3pGR
	mRdpPVFi1tYYB7Jk4uyGcuApCKpf1ooRlwcOD8e6YccJLq25Iz6Kxrk3vqw74ng+9vYOVpv5wMRl6
	uDYErIwD3NdEBXFmqH/1qvrLApC2vI2r8bLuvaLegv3BgAbECSu2R3BdTFCMz09uNCFTKrbzrU3sd
	IIdFtb8AR4/2mxDf6KGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRBz-00000005lIp-3Qdd;
	Thu, 02 Jul 2026 23:51:39 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfRBt-00000005lHi-1Plm
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 23:51:38 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-92e6c4a867cso369085a.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 16:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783036292; x=1783641092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=TQYqmGjmK3WOa1ykjlPWsrrHw0vHxVTm3tStc8Y5HqMiqxMdJh3NJOJ85/FkWkxFh9
         efOlclmSxcMsP92EPwMImKajmOZwGBfvpGqY4AfyqugiENVczkijkJieRGbKdDDHHFGS
         DFbAK4u/yzzAXchiMGFvfmJLK1MDmZIESryde3r9CxoijX1Bc2q4rjx9YOD/X6jKKeSP
         eUQ8xrt8GZz6hkZXabLPjauJEvJiGJ3tAJRGu0q9oa+y3HIaeecZsbblj0n8iNzITrMD
         MPfkImrlfLbXUR18TPMlgalOlE/0qTsp8n0iwEFnpmMUj/fMr6AoC/D3opXp7BiHeiSL
         NjNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783036292; x=1783641092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFReXlsu8fSc3FIw2rtMwcoHtkhhlcoHIpQXyaO1YRM=;
        b=PF51STG9qgl5Z5N/JfxtxrtvOaPFqSksrhRqFBgA7MdIuTpCEBDMz27GjFUxNp/lKU
         LYl+7XJAWF1F9NOdIToACXFXN/UBI8FeBHxBgeyaoh20GMLri0mRBAxw2wB2c6YWHali
         7CJ0ugUcrZi7RPHX7LnaPAgbmWYdqQXA6HPetqHGBZkg0r7UaLR1xkkp16xGpbAM/pdm
         nMk1Kl7HZQ5rxiy0nq/ueeVWxrnPxeJ7O4R2luLrjzEcUKPnnYZfg5yIYVmEwqmV+9JK
         Aljr1CgpTr64nUct7MeHxc4KnGjpKoleH2ZfWQwHhzTy6K9kdlui5n1gsp1SlcMWzMNW
         x7UQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fn7gwYe1LQmncCgq725QEjqvzEPaYKYBMNFKX0PTQBY0wtit2YkO2JX9OSV3HMi1wFHVHxIdxHoKc+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaLtHR1Fs/QW9k7GUXEYTKSFwP3gBPeN99xTtCCW77Tl6lBGPj
	dlD4LYAy8793X1x2V/22IY2XVeRnsMiYGuCvGftTEnz1bpsyDLdrNB5d
X-Gm-Gg: AfdE7clYhpXzjpFeXskqmwUOWb5FASPS4r2knnlvl5IyNpcK2tO+Vpf6LvJaRdzVWgl
	s1HHWo6c8L4E/FTQhQDYhwjyUNXFGR9V+7pI22Pd7idpqXO02SCuXrHtPbiCpGkPj67ZXZVCC35
	aRofAk4HKzuGJwDYViCPlKnTdYhoqWHyaPwl2cYY7a8xoMVJEzqJYTkEYMZ3m3GRFd/sFat4OyJ
	L6N/q/YeXJfOA+4PDkAG04TcjFJoO6dnrYmtmSwGpZz4019WLeQshvHjuQf0g5lIuLJCayhh25n
	Ezy3DcsK7ujoUv4fqHdONHQlKFeNyXccv8IZiUPoKWhW4ez9G0BTO5p/Yatiw5JXbwWH1l6s1r0
	95CruuhMQ0Gd0NIKehLADG0WQS7FsokZsOBposTHzirdAaatojhxkHb7G1qA8LHW5sLCSRAjFq/
	pYe2z3S0aevTX6nxux7aOZuUx6Joy0k96eNIF99AF7rwtq+gfDQr0wLXVRoAdr
X-Received: by 2002:a05:620a:4410:b0:92e:76a1:96d3 with SMTP id af79cd13be357-92e7b3e82bfmr983241085a.34.1783036292031;
        Thu, 02 Jul 2026 16:51:32 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b80785sm11476585a.3.2026.07.02.16.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 16:51:31 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Thu,  2 Jul 2026 19:51:18 -0400
Message-ID: <20260702235118.1225793-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
References: <DJO79318OW0A.2RDQOAXRTHNCW@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_165133_386109_B1796CCF 
X-CRM114-Status: GOOD (  10.25  )
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

Hi Junhui,

Good to hear from you, and glad the series stays in your hands. I hope
the move went smoothly. No rush at all from my side, please take
whatever time you need to settle in.

For whenever you get to v2: I posted register-check notes on five of
the patches earlier today, so they are on the list to pick through at
your convenience. Take from them whatever is useful and ignore the
rest.

One offer, entirely take-it-or-leave-it: I have three Cubie A7S boards
here with serial consoles attached, and I am eager to put them to
use. I can boot v2 the day you post it and report back, if that would
save you time.

On my side I have Cubie A7S board DTS support staged to follow once
the clock and pinctrl pieces land, so whenever v2 arrives it will get
exercised on real hardware right away.

For transparency: I use AI assistance (Claude Code) for the register
comparisons and the test harness, and I check each finding against the
manual and vendor sources before posting.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
