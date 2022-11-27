Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A783EC43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ziGRdKcRncLfDDiMDjaFSV4Hq6MKJou1SsicfD1w2M=; b=RBRLMKDm+5xXXj
	cU8Pt/eZw+o+KZQ0p9VnZ6jSXPtm8iQ33GSye/MGABUh8JOxTRZQtaUUX7E/UUSNKyeaXPH0X+mJk
	acz1Y2mcqn1LDB7yYxiYA0TfTP+pYEysp1yg6UGW+vK9OtXVQPCd/zT+4HSK5rly+ryoI7qlLcvYW
	gELEa0UBPg9k0+1sRiBgPIN4LlPeYKYXW7xpi33G5mEOUq3jBWBeNSlB1/srS7VYmJe2QkiF2Lt8K
	EUYNnFgAAn9Ntr5pBrocAaIyeLZr/e0wuokszAgncKMaX/vcxdcWp+cxlAqXw4JkAvCB0oOUgkZRM
	fS24aW+6N5b5tPcSYSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLZl-00ChXm-2H; Sun, 27 Nov 2022 17:36:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLZi-00ChVz-HP
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 17:36:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BC04F60E33;
	Sun, 27 Nov 2022 17:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DAE2C433B5;
	Sun, 27 Nov 2022 17:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669570577;
	bh=KXjgMIIzjeBW/b+BUU54O+6KKHdrQhBefEjGsi6yglo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTs9uHb4YgSD0785JI5mzgYLquHrM9eYIbKfgfqb6DbI1McwaudwLVO9fge9apJYw
	 3qvj+TsE9DbcQ1Peyy9OnP+irQ+Sa1TA2o7lv7R8/djO+Z07OSqMiS45Thr6koxkzb
	 jPv3V3FlnX9VntLFLCA+yNz1/OD/3uuT1IvPLxi2VVG0t+yE+G8fBbO1HEzNN2n54y
	 lF9p0AdM+o/PyyPK7MkaaMOvf/2B1MHtsM0EtLJT9ViEQkA/kjBKcWmbRmNtsFLroT
	 pYC8dEPuzf8FrBtRYAM32dBoq30gYMzYmM/AniEY5KGpyvPvTwS6oPmCCQroday8Ff
	 vsKs92+Stz3HA==
Date: Sun, 27 Nov 2022 17:36:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 9/9] riscv: defconfig: enable BOUFFALOLAB SoC
Message-ID: <Y4OgDBSexibCJGBG@spud>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-10-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221127132448.4034-10-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_093618_628260_FB415276 
X-CRM114-Status: UNSURE (   6.78  )
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
