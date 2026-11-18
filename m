Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90173606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GrguKyaz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=E/GnAvcA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yxgMyzBbiBQVSGFM1GRtI35+3vEhm8b8Z1kijnxKtGI=; b=GrguKyaz8Cd+pE8GQjbFrJqPtQ
	xPflqo9t0CNH2dJMAs9bsJ44AH6w+HXw9N2xZlI0nvdrf/gPRWJ6FsK6bv5hKz48Nwqlddv/Tqg4n
	lNOaK6ZW17CMcRYVTIfrSr9cMSjABFzpOH+aRtGlwrEXJApVR8KYtWSN9Q3XmZ1O93ek+p6qmBToh
	X3uiRP4EsJoBX867uZDhV1NRUMFEv2g3ToB06L336za3cpKtHjcEeM97XzdGjQizNmWqiSDx67Bcw
	dv991aNPjErC8eq++p8eIkGHHQhAN+62aHBYIDCsvt1E0SmdFQYWBoGb8Yw7z4mB90k77j0h/tUMO
	4d7/NadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd58-00000008ad2-3NFU;
	Wed, 18 Nov 2026 10:40:02 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTd55-00000008abn-3eyL
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 10:40:01 +0000
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DD95A200878;
	Wed, 18 Nov 2026 11:39:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Is/Xjej6ADaYpv7YxcowFZl8o9RxTiehNx4Z4i/N32g=;
	b=E/GnAvcAB7wIoGgCFhZ6ArRkq2vpgI0TEixnQG/sPauxDqX5ginvHdyQn3/Z6HlchzVgUj
	xTctZAYyMhJoHnOg9ToFVIGkVOUKOATzDOv8ip0y6sbxRTrlxmZifbRrGyX8AfTR5BpuIR
	Y/L92mY9WjP1O+JP7HD1POg1An6qPTOE6UO7o7Qc3O9mHUrO1sCWJNwplxuNVrtu6jweEO
	qM68bYilGIK+HpH8Lxh5dt23HgUZb6d9QvsVuE/nLd6VCWsWog3v92hkC5YTGbL5xwAcXp
	A/rVOT7nuV9TZAshsRbhWYjNXu0rRdehqbvoOURWgaFV6qYxuUQSODEIgxVAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794998397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Is/Xjej6ADaYpv7YxcowFZl8o9RxTiehNx4Z4i/N32g=;
	b=G7DOJ0d78CCHrJaRYwLbO83fU8GXwXgL9SO2TxzpFbhQwb4ZeyADi5TbKmvf+ElQhbE1wv
	//6xy79MAE4XNyDa2ftEH+lYCa7uqoI2cvpsgz5lTnJdgRtexIMxRx3+onnpAoLsjWnoeb
	/CJQKRr+fsVc7SET+mk7V7ah2XgJh7zOUhXVguHiZAck6kc5NK823sJTzdEzIOQ3dYWtG/
	kqsgi+5z4KO+tQGjVyoBlSIQJwVtGuptLST+3zdhmmB5JSBnPh/ZDtbO0mjqlVpF8yi7eU
	+iqnbn6Ihrzb9UEbEL3+XzNK5qPkfB6gPXhgttAZhfwReRFeGcSwaz7mEgzQig==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794998397; a=rsa-sha256;
	cv=none;
	b=GzE+QoI/KqlGQ4VhyjAx71km+eSWXKnFhULQcrl+x8amwMnULwo17haGckk0Lk0J9fqdol
	JNVPPZ7s+GiBN2680blVqgOUKf0in6lXSFr0KjHNRnkGMLFzywppfR1bgQIdK/2eYpX5sO
	BF1jGQ3PfAizafEdp1EdGdoEVPdPF97bPqyOYrD/KaFCQ2IB/y9Fqg8/enAO9C9W2km14r
	ogonOVhU7l6/O1WTUzVVeuc1jfrj5Aki+5gsgstM4MpKrDqZqADcSELjtdn4iFH6TtspaF
	9F2hRaoqpSTIqCaOvNGtjv3r07wcci19Kq1RYIC+37Qjh/+L7agLwbiD4RGLuw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <5f38e679926affa46ee96bf431510dd0a0ddf36c.camel@pengutronix.de>
Subject: Re: [PATCH v2 6/6] reset: starfive: Add StarFive JHB100 System-0
 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Brian Masney	
 <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen
 Boyd	 <sboyd@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	linux-riscv@lists.infradead.org, Hal Feng
 <hal.feng@starfivetech.com>
Date: Wed, 18 Nov 2026 11:39:57 +0100
In-Reply-To: <20261118100523.11395-7-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
	 <20261118100523.11395-7-changhuang.liang@starfivetech.com>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_024000_063258_4BE496C8 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mi, 2026-11-18 at 02:05 -0800, Changhuang Liang wrote:
> Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
> the auxiliary devices registered by the JHB100 clock generator drivers
> and uses the register base handed over as platform data.
> 
> Start with the System-0 clock and reset generator (SYS0CRG). Its reset
> IDs do not map one-to-one to the hardware reset bits, so the controller
> is registered with a reset ID map.
> 
> The other JHB100 reset controllers are added by follow-up patches, each
> right after the clock driver of the same CRG.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
