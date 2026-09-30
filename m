Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C8BCA5FB1
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 13:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTWhbz3LCj2QHP4vpnv8JOdvmrSfa5lKrF8j2pA04zA=; b=oEPVQtkOZNghVM
	RB87PHkAQ08L4Mq23AeIfRrvvAC3kom93B4lzZJU8J3ZL2XIz5mbCCYWcL07PkAGw7wbipUMxon/C
	VDgO2vPbPm26i0xwumo3NBtHw0BFPb4KlpjB0LXi4HXyduK68O3rKGeBhZ6On0uckXiZFZ1foBgdA
	66HEgYUEmEKXV8Y0nyaO/hiP49q2YXaRT7Ys+FQjG959ylQodhhUkDMEiW5A5VhGBKIQW8TP2xB7i
	Y575Mse8D98V1sJ2x3JWpbgAFziUy48C+u1NiT+A2tebDsOUX06ax1sq4BFE8dt85Wh4XMboAJPw2
	3EkEpyB7bXyqgQkQslig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtxL-000000065Cs-3vlT;
	Wed, 30 Sep 2026 13:02:44 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBtxH-000000065Bj-38oq
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 13:02:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1399006a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790773358; x=1791378158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=gv+EQhpCF6i8MEvTmBNXcXg8fe44gnlOlnM9gVNG8sdJUZw7tuPf4m2uUy5glEQNls
         caWVZ+vs5n8iJg3vSoit/1XDDJ7Q6P7MVci9gaatpYItyBy6THemCgPPEYVtuwYIfSMR
         amBjGF0KSjsUXDdca2zCPhUGvq83MYY33BfQWKgHI2iTE7VrvByFCct8NuGuwClreK9g
         A4ysyq4j7eJBGzshdARE82YohHyjk/4cdBGyAtR/KhiRtR9pLE3TRpWuSJRHFG+Y0U3T
         E2atO97Jiu7cFjm6lY3WYdTdKATKeS4nlQbN8B+DGSpVI8hIMgkrbMvRk8YuhsnPOI+K
         TZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790773358; x=1791378158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4vHh8MmN5f2Z9XIEwQh0PcQ24VZUdkZZXQMWG9k82N0=;
        b=qli/cVxgnRmjMJjZTa59Brf5Z0fjiiF175FfPf+JWdLeqJRqtn/xcHTKgETqlEQHg+
         iWMbZXfEtK7hW97s9iMXnD4Atu1+gKntQ4LS4iF+ghdnbGyzf3wnzoL22vYFuOzAOmNY
         84A7VSLTDQWh2a5aCeictHJM4311Wb8i35t34IwMBtRNvm6n4vUtb6MwUAaRrWzCwTS8
         ld84LFRA9xQVxwwX5cPz/1s3m0cHw/RLMjwtDnjBholn1CJinQtS7vcTaqq7holGD9Hn
         P/tgTeqRjsi/6pp8vebbwnpNNT2AKF8ZHHtYgrtr510hgQi+VCPm+NpiuRdAx3sc4Zzl
         thww==
X-Forwarded-Encrypted: i=1; AKwUvBwx0hJeO3QCNPtqaOskTw+ex7Rr7fpeckld02EO81JbmyidHO7XwvO2XXFh63NDIIhcppZAWYZ5G+fqMQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJb6P15Ky5GkPfNjZA4BZt9e0trS11xVQzab1prvg2PtPWV/f/U
	Es/AVhOZ5WnP8qqqsXCJ3UUFnGHi/kgQ9HrOiG0ItZL4nvcrUyaTJm5AQ4iiErxPw31k
X-Gm-Gg: AYBFou2xV1/BkmyjRx6x54LQdH1nozbBvbdOy8qh3ZMf1skM4vElRyOlwHHlq+tPNbO
	ExLzHgvVmWdn2No9CKEYpY32oWQ6ytNK6UW6P0aN3jf8RluVn2LoEuh5yZ7VaU069tw7oL/BG89
	2EFExqSrbAeu26ntI0R+O/fr/i+X3yC+gU4IgD/0osXg9eCW7Iow1MA9/acv3koudQmXGRoATaP
	2Cx1e40iOTFUvpeIk22aXofctlxeYSjbThY79Yf0+aJBmhdFjRsknadwv8Kq7ASgrsESZ9VJR3z
	as22mm9V1aHiITwMxd1xkFYvIO5608nOxHrNmuCyOEC0/+CwrBfa7A2gy1Klle5dmjhUEv+FGDq
	fm2EchUxoDijFdDdZMrvAH8HcdPIboJht4maRr7vhdpfVIr770KteJOi+S3a90iDlIUiMzfb60w
	YhxvAAoXbni0YRo8S34UgIMDy6It6vN/URyBhsMVqVTQ/ifYus7/wcVcGmdMDLteCjUmIRlSuON
	mHbA8Ra
X-Received: by 2002:a17:90b:5343:b0:3a0:25f0:d89f with SMTP id 98e67ed59e1d1-3a4d18e3b8dmr775583a91.54.1790773356655;
        Wed, 30 Sep 2026 06:02:36 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7dab424e8sm853583a12.32.2026.09.30.06.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:02:34 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
Date: Wed, 30 Sep 2026 20:02:21 +0700
Message-Id: <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927132707.5f484946@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog> <20260927132707.5f484946@posteo.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_060239_793086_63F0197E 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Wilken,

> Wouldn't it make more sense to add the "allwinner,sun20i-d1-hwspinlock" line to
> the driver in the sun6i_hwspinlock_ids struct, drop
> "allwinner,sun6i-a31-hwspinlock" here in the D1 device tree and update the yaml
> file accordingly?

Thanks for looking at it. Bjorn hasn't replied yet, so I looked a bit
more at the naming. I'd like to keep the A31 fallback: it's the usual
pattern, other blocks in this dtsi do the same (timer, I2S, LED
controller), and Conor already acked the binding in 2/3. If Bjorn
prefers a driver entry instead, I'm fine to change it.

> Oh, and I may be able to test it against the D1, I own a Sipeed Nezha.

That would be great. You don't need FreeRTOS for it: I tested with a
small Linux module that takes each lock and checks the status
register. I can clean it up for the single-core D1 and send it.

Thanks,
Tien

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
