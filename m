Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D677C6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmQDmnKkcEvzS4/r4Al3u8u7vf/f5rDSQun1BU4JaD0=; b=sGp9LQ5CYJ+o7a
	UtIn6lusesdKfjuv/jkIZtLTtzH5DT2czn0leXAdUID+aQJSowsCl3sD/ZeVAmUFL9hfe41P6ZKw4
	g1I7fAeTprwmBN+nFJldy8zSP8kJUnuCxVisBgh2n9UGoKGrPqLcHWnrNyJOH48VlDudSoHvhhutZ
	oe6AVtGSQ8ouF8VMzjItSciaTjVn+AtIzNSy62Ngy9o6H6LhuygXMBqsYEG1IChuK7jb3zSJTzTI4
	Ee7kwX5WsLs0HfayKBwN4ZsIjCmPBBwwDqTaGNeaDnS0Jr7Vhcu2+i7M9Ay1tDo1A2ZQaRj1RjrTb
	EBbffTvlHcYgpV7XivyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUS7l-008BGO-4W; Tue, 21 Feb 2023 12:52:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pURdD-007w90-LM
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 12:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676982026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gziN/XKTmlqDV7Elwm8JhOAFtvAWBXGN7UBs14HUdfA=;
	b=PImWLZUXZei4BksOIm70S2jysagDLmqPIHGAEVIU8X3Pci3MjskGSykCeUjio3SxOWucAc
	72QZRbY9xxfJ5QZfv1DSdJcKx4vIflxi5Rff24y5Jy/BQ4qL2MVlSHUPZo0bdmY9W0E1Gn
	cF1cktn6u0nzQaDg3YlA6AwnpBIT/KE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-zBk6Slw3P5yXYNrk2OdVOg-1; Tue, 21 Feb 2023 07:20:24 -0500
X-MC-Unique: zBk6Slw3P5yXYNrk2OdVOg-1
Received: by mail-wm1-f71.google.com with SMTP id h8-20020a05600c314800b003e10bfcd160so1680864wmo.6
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 04:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gziN/XKTmlqDV7Elwm8JhOAFtvAWBXGN7UBs14HUdfA=;
        b=FzUqdyRr4PQL8MkN5bbFtoX5ORtcOFUMM5opXDygH0PRmY2G0qEoB6TinLhbDibgSZ
         N2DihPfMoXFNHy68wbNbu4GL8e5RTR3p10EzqWpPpw4G2rwVmb3loztBDMsmbXuralQA
         LleOhznSEVFRPq0i1RaDw0PLdfqiDjKw7GsURmHi2V49uS0gQ/iqVefpfTyChNpWGfgM
         5fHC+fwJ7ysLXH7slq7n4Uuf9wIy2X3qXUIT3KNYtdkMglKdU1FhOTARyQm9i06fcus0
         OkFZN4lyYNYE076Ra1zsFqo+B8RsUjUrTRWcGDVDHN0p8AGXu/PqoHxyISzHGxlLeHVh
         z1RA==
X-Gm-Message-State: AO0yUKVOLivOzfdwxNLUrGgJ/kj4X3WLgHEUaVJA+ijY4zAgOALiCecu
	JhOvO9yA/KuoqDs55Grt20AXajpUKmNVyCHVf79qsL2/vbfVVq2oEX9V3pmBxcrNT6nLPiZlS9D
	VUZ8wm09KJUWLyfYDevwfJuogB57F
X-Received: by 2002:a05:600c:1c9c:b0:3dc:5ae4:c13d with SMTP id k28-20020a05600c1c9c00b003dc5ae4c13dmr4846842wms.4.1676982023777;
        Tue, 21 Feb 2023 04:20:23 -0800 (PST)
X-Google-Smtp-Source: AK7set8lbV2WFcK+o7DtrFByZVT8litE+mTmB8ikeVTsesdZtnbGIUjq/rZ+QzGc2zwrHjOleTptLw==
X-Received: by 2002:a05:600c:1c9c:b0:3dc:5ae4:c13d with SMTP id k28-20020a05600c1c9c00b003dc5ae4c13dmr4846821wms.4.1676982023499;
        Tue, 21 Feb 2023 04:20:23 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id t23-20020a05600c2f9700b003dc521f336esm3904036wmn.14.2023.02.21.04.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 04:20:22 -0800 (PST)
Message-ID: <0d080cbd157fba352ea035611fa44354b8f875bd.camel@redhat.com>
Subject: Re: [PATCH 0/2] Add PTP support for sama7g5
From: Paolo Abeni <pabeni@redhat.com>
To: Durai Manickam KR <durai.manickamkr@microchip.com>, 
 Hari.PrasathGE@microchip.com, balamanikandan.gunasundar@microchip.com, 
 manikandan.m@microchip.com, varshini.rajendran@microchip.com, 
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com, 
 balakrishnan.s@microchip.com, claudiu.beznea@microchip.com, 
 cristian.birsan@microchip.com, nicolas.ferre@microchip.com,
 davem@davemloft.net,  edumazet@google.com, kuba@kernel.org,
 richardcochran@gmail.com,  linux@armlinux.org.uk, palmer@dabbelt.com,
 paul.walmsley@sifive.com,  netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Tue, 21 Feb 2023 13:20:21 +0100
In-Reply-To: <20230221092104.730504-1-durai.manickamkr@microchip.com>
References: <20230221092104.730504-1-durai.manickamkr@microchip.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_042027_813457_4629EC55 
X-CRM114-Status: UNSURE (   9.62  )
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

On Tue, 2023-02-21 at 14:51 +0530, Durai Manickam KR wrote:
> This patch series is intended to add PTP capability to the GEM and 
> EMAC for sama7g5.
> 
> Durai Manickam KR (2):
>   net: macb: Add PTP support to GEM for sama7g5
>   net: macb: Add PTP support to EMAC for sama7g5
> 
>  drivers/net/ethernet/cadence/macb_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

# Form letter - net-next is closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Mar 6th.

RFC patches sent for review only are obviously welcome at any time.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
