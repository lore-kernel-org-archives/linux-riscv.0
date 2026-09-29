Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7284ACA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 18:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVm9Z39hV2SE6ItAwBv/XtS1f5KqNSuUqVGkRmRILlc=; b=bEZxIwGMnn+R9/
	hu5YbWl47GugeYP1oD0kW43/mxnEgLCT1AX8u9Q3NppkaQL1wGbeBKdetXWJzviQX6KyTEkYKnp7X
	uOLMWdzVAT6hCn15di1CgP1l0BFZOyXlM8UKtOAUjJoWVxNBDaoLaEiqyAI3gAHvR9UvG1W6i/Ox6
	SSzRSFW1xVDD2tDC/WDOj66igW2B8eWgnNu/9uMKwBoPTCWhizH0D65b4/ezm24ULU4GTquQacLNb
	beYPwlkdwIbPka/Y6FwbE3qIdXGpnOJOPEQxrRQRgPCnfpr7+1s80EIc3ThQMBhFQhtSLasoMgi5i
	Rnm4NYT+yOd2P0c3Wc3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcKl-00000004G6J-3V70;
	Tue, 29 Sep 2026 18:13:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBcKj-00000004G5s-2FRw
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 18:13:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790705620;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uvO3TYbPdD9gThArBooSvH6FsyLY/hrMXSQjkvo3u0Y=;
	b=bPes/M5MLuetmypeFPFeiOUysT1zJSgxVHnavUqH+ipm0qBDsOHB5e4GbXJEPmiXnPmb6z
	MIlH+YrnRX0lB9im37aED6A+bzo/W3Qah0fNcCqcej/0oYuHrcAIdiBMtJ4TkqhKaxeiHk
	9F1HCeD1MybeMMk49YyA6OWzCesgG5k=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-wFIxkj68P1yD9ZB7ReU4AA-1; Tue, 29 Sep 2026 14:13:38 -0400
X-MC-Unique: wFIxkj68P1yD9ZB7ReU4AA-1
X-Mimecast-MFC-AGG-ID: wFIxkj68P1yD9ZB7ReU4AA_1790705618
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so942917385a.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 11:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790705618; x=1791310418;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvO3TYbPdD9gThArBooSvH6FsyLY/hrMXSQjkvo3u0Y=;
        b=owvm8U06lgFZtxD+E5Y3BvK9eh3QKd+qgUMOC2zGkHT3llDssBow3Te3VcLn3oKpxY
         XPJyVs/n/oyVgK372PNm4oHGYtNLmZ/Dk8hYA+i51s9zBTwrN3B7NJYrHodtAnx+W8AQ
         OBI3dfIzFuC38E3QmDZ1SiHqJE9ZlrTY+LrRagkiDMtI6BQPVf1UANL6VJvGiTX0X6LO
         FolquaFvx5uVTYOZRN/0LjHxJAVEDvnQK2uWb2wf0pxEFu0XWF4EBdwb+s9FCgMlmsBE
         Yw4Kc8s1rEHGC37sToA830CRikJfMtGJRlPXr9pMZjlLiJln0Xrk8NkLbqZLLd20rYsn
         tpYw==
X-Forwarded-Encrypted: i=1; AKwUvBwr0kKDjeTvKBhuglcC09MTOrJFTHXY31/4vTeOfwTGnfDSxvovgOLr89qSIzJk9F3oo5b3/QT8DcFZyg==@lists.infradead.org
X-Gm-Message-State: AFuF++kYkOji4IU5DSTySsmTc01CWzjIJtm8orC5F5HwN4PH3tPW8rzn
	u4DqAYSxHh7mT7jGmP2mGPpNKLj0J5XFuaFXMu7vhOaTDBSdfbYC7HeETREp0aj8gATdALlhD6W
	HHoITfLzncwDM5gnMCefJ/AzBwaT+bJh9XG7K+9K77wkrroKq5j+8yNNEF/+2Kh0r04CjxMNYoj
	MRbw==
X-Gm-Gg: AYBFou1bb9+96dvTwRPGsKutUvushB+nwsPTyJK5VllUK7skLOE7QIsQfbi95JZ1R5d
	J/7BM7sKMLOoGRUnE2MHuvRWjF8gBsGYofNids0wuOS6zOXdFXP7RLJD3/5SP1bqjp3QxA0KrCO
	VcAi20xxHxdcKoVTobaHY9RD6n5j19/2VENxSnsJ9rzNgHdlIxhEKM7KmtWzTEiPXEYybArgmRj
	O1p+hT0+6B3Vu5VGUyFnelIFfjqpo3jRLVNpqrypBTNi0kr7SKwLriUf5g8VBZOe1I5gUIQLJxe
	Ww9Bi4CFH46oLQ3jGFRosYt3Y09GOCFEwXHKTL2T12LFRXjMsjmIA3e/pwRU4ioU9a7g1N1kZtw
	G6IYTE//obxcHXBvXFIRY0I6d74umRwRFlZOVP5vikNVnzFcU0Fs=
X-Received: by 2002:a05:620a:4442:b0:93c:23e4:359e with SMTP id af79cd13be357-93c9faa90eamr68417785a.50.1790705618168;
        Tue, 29 Sep 2026 11:13:38 -0700 (PDT)
X-Received: by 2002:a05:620a:4442:b0:93c:23e4:359e with SMTP id af79cd13be357-93c9faa90eamr68409285a.50.1790705617547;
        Tue, 29 Sep 2026 11:13:37 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f564879sm28222085a.42.2026.09.29.11.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 11:13:36 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-0-34f3021aab51@pigmoral.tech>
Subject: Re: [PATCH v5 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Message-Id: <179070556430.244235.18030041151516795666.b4-ty@b4>
Date: Tue, 29 Sep 2026 14:12:44 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1274; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=47wGTHOwHNw1GkHHo55d/Ij59Ac962ww2JNiZgwxSsM=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ2/z/JcHHvrsKaC5/+sXzUj+kL2Cw+y8pY4GFhKluZd
 Vvai7hfHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWwIF6cATKRoM8M/m8wsXed3DY9ufUnx
 6tm7csqlfc9qp35WLN11Y+qBFVdmSzEytGUuDfm/9O3h/q8lASaMnn/3d6X0WdRERRpeTwrd+5i
 PFQA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lJVj8A7sJHVZ3ANNHay_AiNBhdSlf8ivD0DQ4UE19qE_1790705618
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_111341_647818_613ED138 
X-CRM114-Status: GOOD (  10.44  )
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


On Thu, 14 May 2026 17:27:16 +0800, Junhui Liu wrote:
> clk/reset: anlogic: add support for DR1V90 SoC
> 
> Add Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC, as
> well as corresponding dts bindings and dts integration.
> 
> The CRU driver framework is built around the clock controller as the
> primary device, with the reset controller implemented as an auxiliary
> device. The clock part refers to the vendor's code [1] to determine the
> structure of the clock tree.
> 
> [...]

Applied, thanks!

[1/6] clk: correct clk_div_mask() return value for width == 32
      commit: f036decc4434323b47b58ad9508fe27d8c9087c2
[2/6] dt-bindings: clock: add Anlogic DR1V90 CRU
      commit: 155d900e4c7d124dfc1fef598fecc6d17a1ea693
[3/6] clk: anlogic: add cru support for Anlogic DR1V90 SoC
      commit: c4e2f5e69ba4298c10ab5a64525379ca48ca921e
[4/6] reset: anlogic: add support for Anlogic DR1V90 resets
      commit: 9fd565971072d2d7158e15178f84b0273e294e70
[5/6] riscv: dts: anlogic: add clocks and CRU for DR1V90
      commit: 7849521aaac26b17820642010ab7f7a222ec73d1
[6/6] MAINTAINERS: Add Anlogic DR1V90 CRU driver entry
      commit: 5795c6059d10afbc0fbcfe3cd95676be69b30bcb

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
