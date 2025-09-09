Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36602CAC587
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 06:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OrptTXdO25yW54MUdfWV/kJguM4DOWR0hmu8LqVxWH4=; b=FMslAYODeILtQT
	9Im0O35gUlVosmUg2rO52hM++v3W7JCBhZrm6D/Qs49qwRVXi+a5JDrvt92id5aW4/u5g4ifqvz75
	6VaZ/9Y5FjyMVEfPEqAv5CgFN+mPkkzL+YpJegpJ9I98mMkhXPKmBymJdJnSnNPlrNcQTGDMAfVZX
	DT+bZxsmsNiWtUl2L9bGYEgrwUtQNRlddQ7LcHMRWFJxrcgDnY/FDChz+kXkZKuCK2rDkjVpnc8ax
	fR616aEZdB91pjE4fVEZykqx4mzY31NPVhwz9GuAarkJMEo3MT/JjvtI+JLCzhesL+T7ZcRhtRaa4
	q+MeFvqEiQ4n9EFvXnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsF7-00000004tZq-3TF9;
	Tue, 09 Sep 2025 06:54:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvmJE-00000003Fmq-135x
	for linux-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 00:34:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C1DF60051;
	Tue,  9 Sep 2025 00:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76D48C4CEF1;
	Tue,  9 Sep 2025 00:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757378047;
	bh=kIlv7QbzYjMgSwCBteRli8sNX4QzCCtBptBcgT5oOPY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OhlXHeuQg/FbLmSazvb/q+WT5wZq0bM/SbOFD0i9lLCn5AjwlpMg4hSG57YM1QTpE
	 EDNivgEg9GxQNuAae4aNPp/l2oI5inaOXK3c7ktYmAeYQaweAvTxtPcHNnGWi/BtWL
	 4a68szBvMjRlKjemWt4JONgSNgSf62Z8SQvrl/YTKourv7S3ryguvWISptRNrfLq6U
	 YW0ZUYif/g+X2Ltxx4F8RxgjBSwujkjhwIemWoLxh8lLPvE3upk5ylgc3IBzk1nLqm
	 4fMFRh2STmgQZppQOhCcI4EMvvDXrufDso0gKJ4IuNtoKZTFhZlO8+t/NmUObEsi8s
	 2gIuU7LYZlV5A==
Date: Mon, 8 Sep 2025 17:34:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Vadim
 Fedorenko <vadim.fedorenko@linux.dev>, Junhui Liu
 <junhui.liu@pigmoral.tech>, Maxime Chevallier
 <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Vivian Wang <uwu@dram.page>
Subject: Re: [PATCH net-next v9 2/5] net: spacemit: Add K1 Ethernet MAC
Message-ID: <20250908173405.08aec56d@kernel.org>
In-Reply-To: <fbcc1ec3-7ff6-4891-97e3-9763355326f7@iscas.ac.cn>
References: <20250905-net-k1-emac-v9-0-f1649b98a19c@iscas.ac.cn>
	<20250905-net-k1-emac-v9-2-f1649b98a19c@iscas.ac.cn>
	<20250905153500.GH553991@horms.kernel.org>
	<0605f176-5cdb-4f5b-9a6b-afa139c96732@iscas.ac.cn>
	<20250905160158.GI553991@horms.kernel.org>
	<45053235-3b01-42d8-98aa-042681104d11@iscas.ac.cn>
	<20250905165908.69548ce0@kernel.org>
	<fbcc1ec3-7ff6-4891-97e3-9763355326f7@iscas.ac.cn>
MIME-Version: 1.0
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

On Sun, 7 Sep 2025 16:22:44 +0800 Vivian Wang wrote:
> "dstats" is meant for tunnels. This doesn't look like the right thing to
> use, and no other pcpu_stat_type gives me tx_dropped. Do you think I
> should use dstats anyway?

You can use dstats

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
