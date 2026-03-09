Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3A7F41808
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 15:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JO2SPDWpjxBqvXAC1PCeIBAPW9QB8bgs2tnDYo6cE/Q=; b=xLQtBusMca6HCX
	1e4LF6JVl2POiOTJ5XpKLHg53yFgksIqPAZo8E4cfhJCbcWnmGNDNPNg+PML3WLk7U0lko8Sx3AsS
	03gxxwS7diL+wGc/KGNOwRR1W86vj1yZlR+bCUJAurhhClq9DwUo74k5J/ylAQBpHHLljN5W5lLl1
	Xabq3HW3jN3zVMvgRIjybVecKa9SM1kNHEXN8raEwaeOPKAU7kq7SloK967z21bMO+ktCfJoT+lha
	49ErYBQJlA65Y6FqzOHHR1hrNrJprs643MDiludyR+lYgp/pd1gGiCz/5rl3KTJDF2wMcD3tyzzSH
	BS8qaSLohHxVrDW7txWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzciD-00000007ceO-3mMZ;
	Mon, 09 Mar 2026 15:40:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzci9-00000007cdg-3R91
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 15:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773070800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e0jqr9O5Qe+QOiK/NfYBlUp6xE1Lwly1Kq1xM3BGau4=;
	b=Qhub2NDumGTxXdr05E5SxqJFRRBekBqtfY8lcsqMclA7lf/vee+g3evCZZ8wnUceE+RRaP
	tKDf5P6AhYjJnsBnKC2IKZaJpX3hWoXz0r8/eWbSIhkUUevz3V0XXcgZMLgp4npp/Pj1SW
	Rb9JIKeIs0YpwrvLJSkNMJL3MxBYZgo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-N7n4zAqBO9K0k52nZQCeow-1; Mon, 09 Mar 2026 11:39:58 -0400
X-MC-Unique: N7n4zAqBO9K0k52nZQCeow-1
X-Mimecast-MFC-AGG-ID: N7n4zAqBO9K0k52nZQCeow_1773070798
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd91c0262fso145437385a.1
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 08:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773070798; x=1773675598;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e0jqr9O5Qe+QOiK/NfYBlUp6xE1Lwly1Kq1xM3BGau4=;
        b=mBK1fa5iJ5WyCg7+sLzTNUY9eLOyZxrtgCI3liRF7tG7aPA/Z78dT5gObcxfyYYTHp
         LKtqQ0K1tsKvfgC9tedqCej3KoBU2YDGm568BMbWmhwMaYeFXaU1ue+Lyxce9O3FtKJ+
         klqoZhRxOtgT0LuGvftzbtTm4Cj+SfzbR0UohW4SPfLkk4Fzp0UL5K784q/56py0Rbxt
         qDsHRV0ipNJjbBRVp8D3jVsv6MLTdPQC304+/nO4Ufb0IWoKBXai/A7CilthON8m/QO7
         1cKS2S0dTjFjhImkKamtw7oOQ8rAEfRnKZg0R3ckKqESv2a18ViGvgnvcO/wSlk7/VLD
         4GhA==
X-Forwarded-Encrypted: i=1; AJvYcCW6vsfONS0sLJGhIhA80XbuMJd1t6YRn851t3Zt3RsjYbsYhQ7kgdBhVi5pmz1f45tfKwhJjGIOfBtGAw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9dUN+nMhaeqoto9qb7tHQn/iPsQcoykIp9wS6D8KTyQ6cQeGZ
	+gxOGYK2oY9/wfFd9944xXJ9U4ufGVLiezZvnGx7Pp2sGXIg1rA0q85JUQRosnt9DXg3N7y2JOL
	hMoZQ3rd4G42JUrjX72GcXMcBjIS86sv3D2fhigeLBs0Y0YmXd4/V42hxcr44pkOQ/4t9Dg==
X-Gm-Gg: ATEYQzwIzGL2qLTjEKQ7lUP6Vj/3nenN3lqXH8BfCIdwC1BMYP6T/7odUnDqUf5FkW4
	L0oyOswrKp0G2giF5toxQdYKSFegkoEbVeNYGncb9NabEzSAmqX+o9DUgPFm0Gib2AbEcX8DPX/
	eGgraZiF84ONWIiJGQdZBkpiFNVvU0XbRHJEzRYXt/AGWTwqD4OGcfguLSW7FrBwGAwzxs7R6tZ
	96GAw4nrAeLGDBpMLUFwK+gstlgxsRuqWsqvn4Qw/Ams3KbZu0sZJxB+krUaR3Hya3Cri6706mV
	iTWuDQyw4bAs1MGO45ZkyVRCbh1lhKmOV5qkk1aHMx9K+n8t+TqQT8UQSpXIsODk56HF7YQnpJv
	Tn/Thi2611hlLWkkUsgUlyn1BwwW7KsfFBZ/g6EZ7CeEEsFI0fRjUXS0Q
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr228536785a.27.1773070798144;
        Mon, 09 Mar 2026 08:39:58 -0700 (PDT)
X-Received: by 2002:a05:620a:290a:b0:8cd:8f18:d1c0 with SMTP id af79cd13be357-8cd8f18d44dmr228531285a.27.1773070797673;
        Mon, 09 Mar 2026 08:39:57 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd90aae418sm84839885a.26.2026.03.09.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:39:57 -0700 (PDT)
Date: Mon, 9 Mar 2026 11:39:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/3] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aa7pywbaB7rxLWwX@redhat.com>
References: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
 <20260306-atlantis-clocks-v8-3-6c9b14a4aa8e@oss.tenstorrent.com>
MIME-Version: 1.0
In-Reply-To: <20260306-atlantis-clocks-v8-3-6c9b14a4aa8e@oss.tenstorrent.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8UI9rjffLVgj42-CAMCoqWFNy72UT7LBj7RHEGBjC_4_1773070798
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_084001_953613_36824889 
X-CRM114-Status: GOOD (  11.15  )
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

On Fri, Mar 06, 2026 at 11:12:19AM -0600, Anirudh Srinivasan wrote:
> Add driver for clock controller in Tenstorrent Atlantis SoC. This version
> of the driver covers clocks from RCPU subsystem.
> 
> 5 types of clocks generated by this controller: PLLs (PLLs
> with bypass functionality and an additional Gate clk at output), Shared
> Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> Dividers and Gates. All clocks are implemented using custom clk ops and
> use the regmap interface associated with the syscon. All clocks are derived
> from a 24 Mhz oscillator.
> 
> The reset controller is also setup as an auxiliary device of the clock
> controller.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
