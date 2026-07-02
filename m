Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC4F4C43602
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YUXZnHswf9XihshhrCYH/ET0T7oHCmJDdFPMWGkNUQ8=; b=0o14fZbHTANbaA
	nlmfJaq6qoXME2vZ7w7pv8eGLwUVnhDNkxCn81Y/EomYIRCCjyh36FudqBdcuF3VvQGX9C0oxDNgf
	98CBGzCsBcKKo9CzcMsK1xzrVazomNYtvrwsuy6eeMPDJ6Tz19LmiGe45ld/YmdNq1dOxnhukqKos
	0fifZMVcOLSQEbyCFVOb8uVLZQCcpmqB1ctSXYNfUGaUMCfhmfOCjIlwUNwV15eHJDLG5Sp5TdhrL
	mw/kbpRL1AQm/6nZxsYcjE1jGgcRmViVJQz13gr8bhu3LBZONlOhR1SB0LjgPnTD4eyEwPK8wUO12
	RCrfw1eV6dViii9qcDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL9s-000000058Ek-3Qkz;
	Thu, 02 Jul 2026 17:25:04 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfL9q-000000058Dk-0alJ
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 17:25:03 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92e6391b114so169151685a.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 10:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783013101; x=1783617901; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=KOw7ppQDPkhINy70o62RXonOIAI9DGVEYq8rLsXDL64OHb+mZAOWdxJJZZEYox9zTG
         oz19Rl8qp4JaQNzIg2Fua5Z+0covcBawxVOsG/tHy1/a03PWsa1fXQooFLXxO/4ilu/t
         i8BGN52AaR5BpbMbebTC6wxVZYFk7oFkGITx+Eva6qD08RZTPmUkvXeRgg9kMwcMnGGi
         D9iX5ESICAlPvLv71iICKw7TjJvPBEWg/9KrLIpsdL6cCK9SE3fGgX7Gorh4p+3nlvkm
         CQ/hDgoy+wa0esA10N6bnsDKWUwDq+xlAeF7iH77SzwH+qc4a1XCqTUpp+WR5AnHrBjr
         4x+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783013101; x=1783617901;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wYofpd20/2MAY28qjdWeuTMS8chWG/vFjgq7i852FNw=;
        b=ccCiCHPf70Wkrda7LiPxUjLPX5FHE4lzhjCcg4T26wu+Hrfhgt9D5eZDp2WjyYXzAY
         wAJ2vLYNapkvSu9WyOtaLsvLwrwoY4V8WP48jEiQTI4Mlq4AejRhxJl6+aYMsCST4E9Q
         G7YQy61XDL5SFC7io/G/V9njZ5gBXiaCu8P4XOQKHavCpkd7F73LF3SJT3FgXkKIk9Oi
         SOB5+n57Mugc2jELJSMuR7chowO9WdBMhyzOsyZJ98kMXnaAZIphebEa9uL16gNpYzX1
         1rweP47erleMKr5iR+mHmku8v8zYNbsLPVXfRxl+kXh3fhLCdfCga706IkK2FlF6/I6J
         PvWw==
X-Forwarded-Encrypted: i=1; AFNElJ95KMa9fpUj2aCk4VQ0bXDsbzcGX5VTY4ZMC/4LbzM8uXuJZsiL84js9fewDZmbq1EWi/hUp2+nZVnAXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhdPgavsYCXBV3JZ3BzAsOfx/4cLXblJfiz6B1sMMxjhLoeM6k
	4CQjuvRQnSWU7C+okKUhv07PMRUhRsjBeysBaDh/BP5b6jxXEZRrOgew
X-Gm-Gg: AfdE7cnSLJctm76+lwWO+jHdqKtKE6CdK96e2NWhNIECcawo965BxcVtN6ktjta9MC3
	PVyRtdIFmwaVV197HjvNF52ukpuTCIOygS8TS2ZiYz0dnfuz1tHI/CJq4u2pDJKk00srpQ8MTex
	Yg1zFaTgtD6fWXKiMuhmVWN708OjpswybNS5E+IsaYBMXSuMutm1sq2Iolnk1g0lq2nNVJbtZdg
	fhq0FBTNlZ1/FGAsevNBNpwvrl1b/LYMOQUP+u8wX9mYhzebCdj/nP2ndfXk4AtTu4Xnc7YX2+h
	Qkf73YmfQYwkDRn03WQIYy1fe8dnGi4eFniEsqsUy91W8mTQ9NjfF51pzsjPhNkIppdBfpBXkvV
	BerkFhluyzIC9jMs8RIuzpH2OoxcdB8nXutPHhkrxONh6gWBMFsksXi3O6WtapiKhusbDZaJ1zM
	bw3MdftSMfCSpgjfuYTatiD8zfEZ2EayFRyH2EXj1tD0Uv0Ov7X9TpWNnRTmqV9bysSPi3D4I=
X-Received: by 2002:a05:620a:4555:b0:92e:44be:bbd2 with SMTP id af79cd13be357-92e7afb2399mr780848785a.9.1783013100344;
        Thu, 02 Jul 2026 10:25:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801948a8sm265545285a.35.2026.07.02.10.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 10:24:59 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 6/8] clk: sunxi-ng: a733: Add mod clocks support
Date: Thu,  2 Jul 2026 13:24:56 -0400
Message-ID: <20260702172456.848487-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-6-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_102502_185315_B98A95B8 
X-CRM114-Status: UNSURE (   7.42  )
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

Hi Junhui,

Register check for the mod clocks in this patch against the public A733
User Manual V0.92: 88 of the 94 mod/mux clock entries match the manual's
register offsets, with the documented gating/mux/divider layout at each
offset. The six that have no register in the public manual are the set
already discussed in this thread for provenance notes - avs (0x0880),
spi4 (0x0F28), sgpio (0x1060), lpc (0x1080), gmac1-phy (0x1420) - plus
one more: tcon-lcd2 (0x1510); the manual only documents VO0_TCONLCD0
(0x1500) and VO0_TCONLCD1 (0x1508).

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
