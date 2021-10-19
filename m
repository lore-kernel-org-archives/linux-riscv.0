Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C21C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:01:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3244D61373
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 09:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3244D61373
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FcBZcIr6p6x9VIwQLUnQF1LPvGi8UqV5pwyfsMVrxjw=; b=xEv1PEdkki0FdJ
	Ib2j3okcNu4jYSQo34J94PyRX71dDq3Ulbe1VRb24Df7nRlYVKP63QSH5AoXjw0ifK1dMm1tyuXRG
	79G5uby6LXuwnsDYjZgFCb/Ou+TbmiwjswDhK2I8SjR0D7D4warseEBUnoflYWZkM5jWgHfXFEsZJ
	0Y7IES7ALOu1GvB7dg6BmDjDHZAW3QzZDXG8H0XVMxymlBWvemeKacfRq/qepMZ4W/Sqc4HFlp2f2
	hef2MeJA1zLD2T//lz88aK7Xz7vf5XP608rWLTJYnRvtQqsZEWD/8t9Kb0rRjOFoYoR0Gut+MZRgE
	YbTk46tH1lk6r1sllB2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mckza-000cRn-5n; Tue, 19 Oct 2021 09:01:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mckzW-000cQa-Cn
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 09:01:04 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1925740750
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634634061;
 bh=RMajkc4I3FVoI6+Wp3gZyvuOiuHKTewU/0j4GZxBxaQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version:Content-Type;
 b=gFzEK/XRGI3HivMKkmGKNMvrX0fWwBHOVT9r7ivFScNsSLvUy2nFPMGVhk/CM9/Pn
 SWOAp5oE+a8LP0ZJOZ5LpGkAuSiM3gNCIs5N0vbz3YXYHhxyNnsnrmozfAGuWVF+xW
 ZvXzPrMGwrEGgIbHX1upErC+94SvysvoiMYlPGCncYqBoJdN0RwZJmG9r1mCGmQK0r
 wRBpxhb9OQoLCy8AK/zEmrDXftf7vGjdYE7z81Qr8UxVSM6DlauGA9przTLOxx0Z2P
 estoEhJ6Vu1cfxX0S5xcHlDtIOvd6ssRWY9UH0IRLR0L5eoJCCJKjhFn/sCLyb1EbH
 ssh49c1IjznFQ==
Received: by mail-lf1-f69.google.com with SMTP id
 i1-20020a056512340100b003fdd5b951e0so1144976lfr.22
 for <linux-riscv@lists.infradead.org>; Tue, 19 Oct 2021 02:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RMajkc4I3FVoI6+Wp3gZyvuOiuHKTewU/0j4GZxBxaQ=;
 b=mlyNCPy751e1LrNcuNJJJ+f7WydRI6UOoRVsW0ENKcXDTjvEFXvAhV3dME5BJpCmIc
 9BlWWauoU7g/bowcBw3a9vxHNGnIc/Vz526w4HlnwWLTMRZDi3V4uXkgcOlLlImUd8FO
 liKbYHWQPyb8x1pdClXEzYRrU6qzlrga4lsLStIOusac+R8mRLMhomxO/glp0qpB42yo
 jk2MhLGiP/HxrrsGID7lfQRq5IjXnnPO5v2Jj1ae6ya8sWFxj49NZl0CbfPywiAUFvOe
 wwm4ixusXN4mt9dNA60NsQFmNt/L/Kt0GNB+gHs4J7L4EBLP4/vDuyLJ7pPpylTLKTVK
 qxiA==
X-Gm-Message-State: AOAM532gKSAVfFkpnS+i3ZrFl+yF20S3TxSbUnkUq+Ek3CerORUw9OZF
 OaDyDOHGUMFrNFgl6qAwq7dgSPPYgG8iwx9U154lSXZPXYXo479t+ZScoovwv2jCrE2EzCEAfKw
 GJoUElQkpQKHXzSesXOZTyOFISirm8Ivp15Dovf25GS02oQ==
X-Received: by 2002:ac2:5d52:: with SMTP id w18mr4990208lfd.598.1634634059732; 
 Tue, 19 Oct 2021 02:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyWpaMw9n1ML2pcTlEiTBVS2ylCobbiDUJAMaO3ELY0TCWzs3TrxcN8V8FoKgyui+ZytbYeZg==
X-Received: by 2002:ac2:5d52:: with SMTP id w18mr4990192lfd.598.1634634059488; 
 Tue, 19 Oct 2021 02:00:59 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 k18sm86727lfg.301.2021.10.19.02.00.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:00:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND PATCH v2 1/5] riscv: dts: sifive: use only generic JEDEC
 SPI NOR flash compatible
Date: Tue, 19 Oct 2021 11:00:52 +0200
Message-Id: <163463404795.23115.14748573491973282125.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_020103_392853_80D5B8F9 
X-CRM114-Status: UNSURE (   9.49  )
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

On Mon, 20 Sep 2021 15:02:44 +0200, Krzysztof Kozlowski wrote:
> The compatible "issi,is25wp256" is undocumented and instead only a
> generic jedec,spi-nor should be used (if appropriate).
> 
> 

Applied, thanks!

[1/5] riscv: dts: sifive: use only generic JEDEC SPI NOR flash compatible
      commit: 8ce936c2f1a68c3a4f46578eed016ff92a67fbc6
[2/5] riscv: dts: sifive: fix Unleashed board compatible
      commit: 65b2979d52ebf96ed8261d82d84c62acf737548d
[3/5] riscv: dts: sifive: drop duplicated nodes and properties in sifive
      commit: 20ce65bf89aab248886b80d1e7fa12277b2a0f2d
[4/5] riscv: dts: microchip: add missing compatibles for clint and plic
      commit: 73d3c44115514616ee9c4f356bb86d4426d0fc36
[5/5] riscv: dts: sifive: add missing compatible for plic
      commit: 9962a066f3c1d4588d0dd876ceac2c03ef87acf3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
