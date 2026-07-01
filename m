Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68874C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 16:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeZ152hQoYFQ36byIlLJajw4MOgyh5uNNMTLK/Tx8m8=; b=CdmXZxEAeqIO57
	JW5/3f7LRpAd5HLLaoNegpeHCfzk+7BuGShOXQgIl+/W3u8Xt63ESsUaG6hkT00a/jaDRO6gRWzUl
	27DjDLAP82A9iNWV7sEV13dUXBCGgDCbUEK7WasboUwo1TN5yDk1yEbbWNf8lFXDAQzOUB8I2lx+6
	jEWM52DeOV1N1JBQSLHrOu/5J9MbTt/AM/ijm43COGQVxgj3e1F2qcXHkXgVfD0n/WHamzuWcxn8P
	mR+jnprEEdILpxyh5VpI36efZwCvC2uYsb2hFln4CHUCJoc+MDryGtMLQJ/bQ6R2fA4+kuF0kqKzA
	hEp7gAVJpLcPnRkCQ6ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexUm-00000002Ujl-0Xiy;
	Wed, 01 Jul 2026 16:09:04 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexUj-00000002Ui2-3VP3
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 16:09:02 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-804e46366d7so11480197b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 09:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922141; x=1783526941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=dyTWpuvjqi+Tbs36lUvgqnHmkyiYkmbiVa5S8Xo2c9qigvaeMbQIfHCjhhp2hB2ylA
         bsrsVD4IXUYneGENWus1frGZQofXc4BFs58KtrEjsUAslFMFZmXWFb+ZwDPwrFNgOHsw
         4j7IczQtnrm/EmSUiSyQPD5Tkl7K9uTuWkUDxvBm/X9z09Ii2S2XIGbthKi7Ga82WIiJ
         uZCoq/tk/8u6xIq7xYftES1lstLGrnG+0o0M6abQS8Ma7zTw7BjjaxzT1cae8ZI8J/4k
         TqbK5UCDrZ73B2Vd4S+86bjf0mwl7KzITSLO2A7OOxzjT6bzsT+qX/FV9vt8ZxNSPAXH
         XhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922141; x=1783526941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI6/1jl+FwxwLNBhZZLYlzz42SxxurAYoSgW8BhCBSU=;
        b=ZoTGUAUtuHXmIT/ZDZP2tH2zV2FTfV163lCrLg77fCMQKkEnUtZwoqN0t5ygzSK1aI
         PNDntnCn0Inp0/RLdfkmH+I9gvX3P42qyS18Mzz06jEoW4cgrTMDX6jpDfpf2YacqcSr
         LSGalFpzdnEPQWotnW1KKlEmFzUkKDfroZ4Q+OUfiVwe4JpTz8nhn4wiDvJlIw3EkkJb
         4xGy5vsOz3O7bIK8UgFNVsV9AQnQpurPg4mVpu9a2gh2WOWX2vmKDh2X49oxRrRm5i+J
         DPf8HzQv12APXdJ431jfTQs9Pnum2g3EMj11NXRaowIoYcTeGNPntPSmSmJ5cP+bs2SS
         CQFA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8sUwYgEc3H5U2Tl0FVmBE5Wlwc9GUi5sCQoVGwA2tisn27J0Vo28VrHJbBnCSVCLtT+GTUJBLHrqNUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXuW7Kt5l6PKKiYjLZu3Ql58AQLQ7E46FJt0M/3g1PPpogxdOj
	8g7EFaeBdO3m4qzZV0inJ3p+7nSsLaw96ASOdJ5/bRa4My/ocDqN2G06
X-Gm-Gg: AfdE7ckXJYZfSWIZAGVES4rJ5JfMYZ48jm/0ZoER+eb2hMlq52cOdGNlVOGbMqj0kMU
	jlNzjsJvMftocuYVg74b4hVVD1VGGlSPdPavHSPUPvANu9bjvCCuf10U8PGH7QyBvh96U+7ZpIK
	Kf/k0rDximHQDWx7cimyYQmzxmjBJHuas9epU61inH+qdCyKx4wsvCBlmKQduOt+x3g20KJlaMn
	yEm+I9uipUNrq3OVdsrOMSBJ6GbFyiszGyB8IpaUNQ1MKlCP4KE9KU/Y8WPb+zAkKv8Doh9car0
	BX4aytMLXSW5xdOgkDNkYjbKsEelxpm1qSAev7LnqtvhO2/gNqaT/iHRWqfX2S9w0/V5uYgxNSo
	v6gqC9KjV7+liQGRbqq+9xaVIDI474GN3qZh8cAAHAsdWhfk4EUuefU5nr667Ncu/4BpVqjoe9W
	Qe9X8ZDwKlG6KCgMKQSMDRSbZvpjsoFe0/QBkZXFV7gowTduTTVrFs+35Hj4fy
X-Received: by 2002:a05:690c:c506:b0:809:fd83:a88b with SMTP id 00721157ae682-812e8dfc9dcmr24185557b3.3.1782922140430;
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144af50fa5sm1682067b3.27.2026.07.01.09.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:09:00 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH RFC 0/8] clk: sunxi-ng: Add support for Allwinner A733 CCU and PRCM
Date: Wed,  1 Jul 2026 12:07:44 -0400
Message-ID: <20260701160055.320000-a733-ccu-status-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-0-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_090901_883557_30D41D3A 
X-CRM114-Status: GOOD (  12.03  )
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

Thanks for the A733 CCU/PRCM RFC v1. I've been reading through the
series and the review feedback, including the NSI clock/reset handling,
the binding naming and ordering comments, the SDM macro cleanup, and the
question around modeled but otherwise-unused clocks such as the GIC clock.

I do not see a v2 on the list yet, so I wanted to check in: are you still
planning to take this series forward? No rush at all, and I am happy to
leave it entirely with you if so.

If you have moved on to other things, I would be glad to help carry the
series forward and address the review comments, keeping your authorship
and prior work intact. I have A733 hardware here and can help test the
changes.

Either way, please let me know what works best for you.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
