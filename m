Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3FC5C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 18:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAZb91u5A+rMTm0q6iX8dXkSkwKqUwPEpMnMbFhl4hk=; b=iNjlZLMzQWO5vB
	37sEAB4aTji7fIUnBaiEfU7w6yPX6LZ/Z0tFFf5Astq1q5yiWiDzeMwyrn2VUgSUcKKmqCl/Jm6RD
	wLxv2SGDe0J/ijjcQ6ZFGhJEQYHxa+OC0ty+tff+4TC7/dM+DbgThczcBGmXG1my94YxwVEqFSkSQ
	c4reTzBjxcfitQYfSQGs3nZyZU4bBW2KkJtdcZZGDzepB9A9RUYa/Ea04TOgG6w91XmiOoaCJc7Np
	vA+kV3zgNgLzUkpjhUhm7oYWQeY3JIkZMEAHuhTTKl1Mowpvdm7UYNxoYqsFC4ivSDKuwJppYBle4
	ji2TrxKDqgHxMx0W5tNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLt7-00000005Dw3-3Wy7;
	Thu, 02 Jul 2026 18:11:49 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfLt4-00000005Dts-0rl8
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 18:11:47 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-92e5c9211d2so156448385a.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 11:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783015905; x=1783620705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=fhj2zusfVSru5+nT/mLL2z6V+xBq4r3XphDGNda6FNlPgMRpTOp/q6EgaCECspxZH7
         TrEwhTmQhunDM13iDQuxIzanP4MoBRtu6KwljaoYqS1D718u6T1aZbwPKLNFpn5EGWTS
         Bucbt1QgYMeXbcIK+UsqsouMBVzD7yXnycOM04oMRE4vrFhhC1/jcJMZZOzbGW2KArKP
         tAyE/Irn/ddPpTckMHMbw1kws6H1tIQFU/eWup/5LCmuZWTQHJE9WXsx4Nd1QXpdrBvH
         pUug4MF5TIxcZ6EvPbrnZDYDneCJ9xGd/8Cf8q1z5U7wxmzSE8y2TFm7G2qUZh/CPp/N
         XbWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783015905; x=1783620705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wtCCML4GCtPrAf6qduQMkfSK95cYT1SxvrHR4pZoPOQ=;
        b=fnZ48GmVcQENUwyJ+vYPtABbXpQCIah6Peb636UWO1JKahuTB4Z7PbAvmVGrdGR/A7
         +13Igox65NEIvSdh+DqX9jZC3bcGTHiIPufmZFgBUmNekC/nlvSxTG2+pQpPJ9kawkL1
         e/sSbQ3EMW3PwIsmMZIh6GgTWPz+jh/W3e3PBpIrfKeBb+7v+eBxAmDp3BJz5RvtXgbA
         elw8Sj16f+3qLjFaCjic8f8uCyJf4yLEZ+xF/LqeIo4VPYLhZOgakXQ4OF6olTq2Zytg
         5fFnOGuJjL0VGscv0Sr1C99tuyqL7de6RgI/iAPz80SYkaXrytUBBmuw5GIJmvSiQ+OJ
         aLCg==
X-Forwarded-Encrypted: i=1; AFNElJ++qCffc0JDIC4JAOZhW0WHH5jD74hmwBdva0q6OTEHIQKHDWbj5KFKU4TNBGLkpPwF1qWFM/03LCs/xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7IMQdzn9oKs2+97P9MbTFjdZp7XXeN73wagJdyFCvstWwwUd9
	yYNG4Woo5H0RYH/shq0mEVrS8BwQsDDQFMVcFs6QncHV+073rbrIztkG
X-Gm-Gg: AfdE7cmwwwf3lnVVDBRhBRX7tQ8fKdlwp49Kjp9Y5AtcZA1xHUjx+bwkT56CKS4IodC
	SWaNXfS1hMaaoRWlnp3IAQDlBNZMtYIYyP6ZohivVwcUfzHpOng3oUJLnY8sWiA85/aOZDatn3j
	GyoP0+kZS18oYnZBf/vyi2WrO3wh8x1KnQeSoG3dr0bmAxfL2h+8y7gzfKtA5mR/6XhSqnkI/a2
	ncm74MirkN8gsyFUthEddr8mdj9ZCV5oTjmVqnlNPqbpOpa7BQqnw644ynPFrpFgdSTWlfTV+EW
	pZRqHl7KWmGXGObXphAwSBOEqwLywlY1El0WTQCto1pJE5HVU/dX+NUUNwVl0XFQzJJtf6bDPB/
	ogtPTnkIpP+2JEEnKAVpE90BXQN6fzYok/K7dUPyb0r9h5uv7UB8OSUN3mpv+aed9IHQHvIf+C/
	F+BFgVVLYysF5o4PYfebIrCMq8+5/TqnMG05U0MnebwRZNKlcjsLyCk1UFMYIpoVREjOYwLYw=
X-Received: by 2002:a05:620a:3722:b0:92e:4927:1ffa with SMTP id af79cd13be357-92e7825b2d6mr905846685a.24.1783015904823;
        Thu, 02 Jul 2026 11:11:44 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e80194291sm274217585a.37.2026.07.02.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:11:43 -0700 (PDT)
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
Subject: Re: [PATCH RFC 8/8] clk: sunxi-ng: a733: Add reset lines
Date: Thu,  2 Jul 2026 14:11:40 -0400
Message-ID: <20260702181140.883070-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
References: <20260310-a733-clk-v1-8-36b4e9b24457@pigmoral.tech>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_111146_253778_CFA771C2 
X-CRM114-Status: UNSURE (   6.80  )
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

Same exercise for the reset map: I compared all 121 entries' offsets
and bit positions against the public A733 User Manual V0.92. 115 match
the manual exactly (including the multi-bit GMAC0 entry - 0x141C bits
16/17 per section 4.1.6.212 - and RST_BUS_SYSDAP at 0x7ac, which is
what makes the gate offset in patch 7/8 stand out).

The six that have no register in the public manual, in case you want
to add provenance notes near them (as already discussed for other
undocumented IDs in this series):

  - RST_BUS_SPI4       { 0x0F2C, BIT(16) }
  - RST_BUS_SGPIO      { 0x1064, BIT(16) }
  - RST_BUS_LPC        { 0x1084, BIT(16) }
  - RST_BUS_GMAC1      { 0x142C, BIT(16) }  [GMAC1 question]
  - RST_BUS_GMAC1_AXI  { 0x142C, BIT(17) }  [GMAC1 question]
  - RST_BUS_TCON_LCD2  { 0x1514, BIT(16) } - the manual documents only
    VO0_TCONLCD0_BGR (0x1504) and VO0_TCONLCD1_BGR (0x150C); there is
    no TCONLCD2 register set in V0.92

Everything else in the reset map checks out against the manual.

This analysis was done with AI assistance (Claude Code, claude-fable-5)
and each finding was checked against the cited sources.

Thanks,
Enzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
