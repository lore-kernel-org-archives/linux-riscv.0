Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC88CCF9EB
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Oct 2025 07:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y33XNvCdBYObyIYWH+O/MlMitLkvFGWwRAmpqsWwNlg=; b=yW/aleDud66AfJ
	zWnnb/bjsgeBP9H9urEpOh1oEVewbt8L1DyTb5hHtMaW/4W2EQXgSv8WLaUTgrGID4GItqaNyPaBv
	/TPi3dAaytd1qo/rKNTq7MUnH67kxjBivmllyf+57YVq9mKJtMMN20gDh+cSMise468ed2X9jD5cz
	lzoE7o2rbqcGDJN/v0UNfdLDIbH0ksjLD6ujc5UAnmJ4wcErOggTCeXwLa7WgXFPVkw6K+N0VQGv9
	FFeZx8uAFFCGTyzI6HXWCsi6EIfO4+7rViq9msjZlbkqSVcW1PfiltWQUsNERRbL1MZoXHWGzMJzX
	OuDujOd8muSAVS3C2b+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjL3-00000005W9a-2ucc;
	Fri, 31 Oct 2025 07:14:21 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEjKz-00000005W8b-3Xda
	for linux-riscv@lists.infradead.org;
	Fri, 31 Oct 2025 07:14:20 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so1226073f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1761894855; x=1762499655; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F01LUjN81T2gEebzFvJeRYUSPOsICmfNBzp6TVdzeN0=;
        b=d9wsR2eOIJmdxn4j7LWxE5iNishs2E7QjgI1XI7SaiuHoQ4gBhuP80EqQ/8vdyImzW
         mdH/ipfgFgfeVHUWyJU3D5uXmtEOMxDRyHWD5OCH8I+KaBTCoY41J6wPr9eBkza7HXMW
         iUyWOnmzq/tkYpjHOD7C7ruYLFmI8izzvpYeCFM8K71pcphJ81lnIJ1O/Ne5Zdog3mvq
         f2i124TyI+y+xP9/axOlBSTq8gt7/UBJzQM/JUESo4avQslDO1joA0Nn/byRFBkY8lw/
         mGR3aBiXJazKbuh3BFKgbfGbR1DP0nDnM2G4LK9kIX1Qq1edXmI4BxJyBMgOIvrHAxZs
         YPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761894855; x=1762499655;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F01LUjN81T2gEebzFvJeRYUSPOsICmfNBzp6TVdzeN0=;
        b=utdbMkD5MZl/l9K+D4hDzCYz34XPOgeNZq1r/J6dqtv3nSI/bVPwZrKCYoheEz2l1c
         Ci3nF6sqUo3bCMDX2Q9/bf7jEw5CM05fkfNe06szaAIZXGTtYOpjSIoxRvvJus6+S4hi
         wVQOoHQptts0zSDQdY08MrHnYDPFAj3yOFGmOWIvpDoO2pjQMECkLB7/x4OceK2YCRiN
         G4jJgaN0Uk1LSQCxmdEeq4vNTBz/18AaBc191SoJBN5bYkcCMbcf+5zcU4E4ugRy1LZX
         WkFCL9EkSv5Zi+5FFHuWRrikUBQQdlReT6TLDcIC5sHnPor9nLj3KrAqAYEpkwTFkpNw
         TSNA==
X-Forwarded-Encrypted: i=1; AJvYcCW8EzfhP0h9JZn5tLhjJMIhjU21dqhX8flWoRegbcAzTHudRlFExYABeOCkwTILeajbRTkvFXfDE3kx2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwT/VI5tO44cLBokhF12Z5E2YBT20wAOsFzbDwd+8GW2KGyvSi1
	Ul6kOy+L45HSeZz8JMq6H7N/tQ4VDF0MObh1xtbJBhXI6REMzzdnDf7lDIDozDGgNvE=
X-Gm-Gg: ASbGncvt6a8o58sTM74ihz0UJuhD18m++LC/awwIsPBlCIFJ32Mt/JWpPHEEOqEPZDQ
	eQyAdyagWCdjRVBAVfiXGMEKf0qylG6Nm9hFA+tICj6qfMein2FQOQ2LSff7Knn1+OiG21O16Ap
	irM8sMd0u+nCw6gsstMozYHsaJCIwSTH7KoZeF9wo4VvzrkpVYXT/o+z0EbF/iuJxMvyZ5CrkPQ
	BeVRiKPHqbTyhWE5hG3sc48j1aFLFT+p8MKNK0J3pbu55+zvEHHDKlFvCt5z3gG63CU8jl1ZtaZ
	60Tve6g1ZCVlL/Bo4ml6s3UUi9QEpeTPF8yE9daz1S5wCPe9QMsfL6f1KshfLSKXi3a7yDZbJ9+
	QZIkeZvLHHAgCEq2pa2hNBYyQ6j5bU+eEGiD3H6+BwL0OlbSt8M30kX5HqHX4AxJK4Z699y26eq
	fDii1fccY=
X-Google-Smtp-Source: AGHT+IGFXoXIYQM0033JrSO0/egQMm5kDokRkBfCt8uk6iJ6QGivvStg+2qhnCmO5P2IzbdiAPo8og==
X-Received: by 2002:a05:6000:2288:b0:427:5cf:a284 with SMTP id ffacd0b85a97d-429bd6c2d51mr1752732f8f.60.1761894855232;
        Fri, 31 Oct 2025 00:14:15 -0700 (PDT)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c114c944sm1868250f8f.20.2025.10.31.00.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 00:14:14 -0700 (PDT)
Message-ID: <62133fe3-cce8-4405-82b9-8ded092c7eea@tuxon.dev>
Date: Fri, 31 Oct 2025 09:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/7] clk: microchip: mpfs: use regmap for clocks
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 pierre-henry.moussay@microchip.com, valentina.fernandezalanis@microchip.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251029-chewing-absolve-c4e6acfe0fa4@spud>
 <20251029-surfboard-refocus-ca9b135ab123@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251029-surfboard-refocus-ca9b135ab123@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_001418_111182_8CC433A3 
X-CRM114-Status: GOOD (  10.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 10/29/25 18:11, Conor Dooley wrote:
> From: Conor Dooley<conor.dooley@microchip.com>
> 
> Convert the PolarFire SoC clock driver to use regmaps instead of iomem
> addresses as a preparatory work for supporting the new binding for this
> device that will only provide the second of the two register regions, and
> will require the use of syscon regmap to access the "cfg" and "periph"
> clocks currently supported by the driver.
> 
> This is effectively a revert of commit 4da2404bb003 ("clk: microchip:
> mpfs: convert cfg_clk to clk_divider") and commit d815569783e6 ("clk:
> microchip: mpfs: convert periph_clk to clk_gate") as it resurrects the
> ops structures removed in those commits, with the readl()s and
> writel()s replaced by regmap_read()s and regmap_writes()s.
> 
> Signed-off-by: Conor Dooley<conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
