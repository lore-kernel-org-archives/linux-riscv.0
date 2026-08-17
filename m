Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F89C5B572
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Aug 2026 14:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:Cc:To:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ti9zSWeJMyL2R0uJEQbITQQ6WcGAyxl5FjYq/D926Sw=; b=WIVsxxbcj3ntIZ
	SKYs1/7WYssVmQT7YBnRMYlTN+g6Ay4bqMUazS2oc8DuquYiyDhxQ6B6ESHZo36TkdsnsAGYNaVid
	nAkJSlA9skBjjqLZuYsWbTp6XDEbWIYA3ZgKa/gTntD1tBC09McaE4lQGoaEZIqDtjBiGLmv69/wb
	oDn/n0q3cHFbG/N3Nh7xjz0D87Woc2p3Lj8JX3EGQDeMXBvEes3FsM32Zhno6KsmaMUXCqjy/ns50
	N+/f+qaGpiipss4icOQ7+lIGlcdcp3WiYS2X3SzZ79K6DduhmDV44DXYLbHiO7WIEJ9qWQfVSl4L6
	tweHDP8SJlGeeargqB1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyLf-00000006Iu4-3Sas;
	Mon, 17 Aug 2026 14:29:59 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvyLb-00000006ItQ-1iJe
	for linux-riscv@lists.infradead.org;
	Mon, 17 Aug 2026 14:29:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1786976993; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=U6cymWYYO7LXndn2y17LP9o0JEgyHfqvJ3ux/NfjYTSOMXA9NrrNa//Xf7fyJ8ApU7ucrKRdUE4kmzwLAl78KpOuw37h+MkKa8nrOwmwJXH4dcu5dsm1RC7SUqq/BKRiqi7zHMEsLCbErYtiijAwSbTvxw3iCrat5LOa+xe/A8w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1786976993; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=erKOPNhhAS8hOf6hp4YHEJXpYsPwwHn/G7aMOMRsfvs=; 
	b=b326afBRjI2Y2P9eyVJy7LReoDzFCGZHtShx4tTaWtLpjCsChBYMza7hOQelkfPYvuN6Yd72/I5e2Xhexti7QIYYAo4tk27hhIXv1lZDDfZsHUzrkZ2Bj+QLOuYKWllS5Paympsu2puZAdBuMMbLEpm3BQA2EmTIHbILlOky+Xk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1786976993;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Date:Message-Id:Message-Id:From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:Reply-To;
	bh=erKOPNhhAS8hOf6hp4YHEJXpYsPwwHn/G7aMOMRsfvs=;
	b=fdMCEkNRdXEkVujOyg8J8DBhqyPel9M9ywdjX7MUINuL94DuQuqnU6jasT85TsAL
	DwTqgFiE/h30SKmb+U+HnuwSRiGOIWC62ZttM228rEOIUmfnXYAlNibwHxramTW0aFv
	n//g1ukf93JAeIfmaGsp7kktWythK4+yjb2FbICU=
Received: by mx.zohomail.com with SMTPS id 1786976991076117.6855924745521;
	Mon, 17 Aug 2026 07:29:51 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 17 Aug 2026 22:29:42 +0800
Message-Id: <DKRAH0LTEIJ8.IFPZCP0258SM@pigmoral.tech>
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Guo Ren" <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Cc: <dlan@kernel.org>, <devicetree@vger.kernel.org>,
 <spacemit@lists.linux.dev>, <junhui.liu@pigmoral.tech>,
 <stable@vger.kernel.org>, "Guodong Xu" <docular.xu@gmail.com>
Subject: Re: [PATCH V2] riscv: dts: spacemit: k3: fix IMSIC num-guest-ids
X-Mailer: aerc 0.21.0
References: <20260817033038.2286436-1-guoren@kernel.org>
In-Reply-To: <20260817033038.2286436-1-guoren@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_072955_854067_C1916357 
X-CRM114-Status: UNSURE (   6.82  )
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

Hi Guo,

On Mon Aug 17, 2026 at 11:30 AM CST, Guo Ren wrote:
> From: "GUO Ren (XuanTie)" <guoren@kernel.org>
>
> The initial K3 device tree used generic/placeholder values for the
> IMSIC guest configuration:
>
>   riscv,num-guest-ids    = <511>;
>
> According to the SpacemiT K3 User Manual this values is incorrect
> for the X100 cores:
>
>  - Advanced Interrupt Architecture (AIA):
>     - M-mode MSI: 512
>     - S-mode MSI: 512
>     - VS-mode MSI: 64
>
> Therefore, S-mode IMSIC (simsic) needs num-guest-ids = 63.
>
> Fixes: 56f37e391a62 ("riscv: dts: spacemit: add initial support for K3 SoC")
> Cc: stable@vger.kernel.org
> Cc: Guodong Xu <docular.xu@gmail.com>
> Cc: Yixun Lan <dlan@kernel.org>
> Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>

Reviewed-by: Junhui Liu <junhui.liu@pigmoral.tech>

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
