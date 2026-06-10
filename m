Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B355CD8CB9
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzkuYZfMZRyKifP+itG3F7MzsyeJtVQMZODY1pRI+CM=; b=DEUoRPpIF8oLhY
	w59/pb1OjRJRboh96enp5bjTN1KznXC7bbdLMx0lAu9oEYjkkPJYl9kULgRgu2PztnZV7d8rfeMej
	sQaN6fRe2EuAK3a65Sl0cmkVSlz1pSJv5cIHZtNSd9BfihFbqYWlBqKuEyF8M4RnRrAyFD3kUZ0kz
	pmfwRTdnn7Bvu3GB0Lj2vjjfRs4/5W+cj0NtoPpyqBGMjzrGo4NQw0G9ggn43dsGphzJc/Zrfz0Aa
	LoaLEH8wAIlLf52ID/2B8DvIQLoZL+xrwLjFVqjCzJQEROHjSTHiiqi9CMd78wGf4sYDatdCXHOw9
	PEyggVWr0fYrloR44n5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEsK-00000007AuS-2TfZ;
	Wed, 10 Jun 2026 09:05:28 +0000
Received: from fhigh-a4-smtp.messagingengine.com ([103.168.172.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEsH-00000007Au7-3qWa
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 09:05:27 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 60EA214000AF;
	Wed, 10 Jun 2026 05:05:24 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 10 Jun 2026 05:05:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rembrandt.dev;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1781082324; x=
	1781168724; bh=JAlaVnjyPfxtCQ+F1tfSPATwilC1zLcKiaeqvCkm9BM=; b=K
	RzJ22Zds8BI/NZV8ycJIO2yH5rTNLEai2f57YKc2MECpWvZTt3eGjdpWnzF2LLnm
	BM9qPPtFmItP3KfMvFW8l6LQj/ZNlS6JK4G5KiydlYf1cyoVRvgJYG8Z/dOgJ0Mc
	NtcI8Ut+RKmdbrO7kVhd4j13moNfJYCzbMcQRg+HJs3wiiCZRhTDTED9h13EF0XJ
	Efy8BPeFS/M03LX2jtbqox2ctsIXb+mM9yucR9SLOpFQDvohvIzYkaD+AMXy5Lp/
	Frie5ViDPRuNZTpvolgMqK9/5tVS6T2mpNfihW8Pd5X/vcDuVzDMpweEj1qO+p6j
	+IbrF78JiAShXEKrAnB8g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781082324; x=1781168724; bh=JAlaVnjyPfxtCQ+F1tfSPATwilC1zLcKiae
	qvCkm9BM=; b=iIz1e+Pwf97Qh+jlKEQAB5Quxv7gUQjtxtDzMZ1q9VrtET/Sa4Q
	243I4WMtIps44gCK8nwtAfKl5D8epWJ5TrTWhDkMeBM65Uc3JSAI3m3mouNRDXyo
	kkrE6TWV/DKvKGbUG6t5MX4IafvQTvop12j87d2bL9FXq7GNL4u+D/mUw0WE7Ps0
	QcgR1hByV4tM+DRoVe6/a85cMcwwxI9rbDzFHSEGzUHIy+lrnsE7URsOcb7QyugZ
	w4NU8roPxA9RuLMv/0ontae/Ig5Uze8IsRrlpMyXlR0S4vhssfAHvJ8UO4uUimM+
	23lKR5Qj9YF9T7FIRfVemHgjjDRsVqrMkVg==
X-ME-Sender: <xms:0ygpaq9WV2Gxd20BWhgU_WLYXUAs4kkZYcUSMaszlwbk9vYE5gjChg>
    <xme:0ygpajp8YZlATZJsyecf47ZY2Om-3wpdJ5ULycSyBa6hBlrc0jSrSJs9_YZg0OCde
    axlBMew9kTRpHd6hLwFSUFTLTLDiuY8eHZDE_D2TEl4B23uzCY5rW4>
X-ME-Received: <xmr:0ygparlIzwvHa7ui4Wguj6LB1Orxwd1WLHy_3EhU0b9xVQkca-F5ZjGpebo>
X-ME-Proxy-Cause: dmFkZTFEL2d6g9IZGj/RA7JvevIshyosZJdvIAocBRfpMf8lDE6YngnrCJJlXX7lB/FpTM
    2SuPMGYafK360S6+wj9c5tlIJiLgpTwqS+EyzPluUfWWAoHPnhcREoYejyZdmfBtwtuZd2
    /S5j/BOI7dRnGNmahxNQ4QdsfCFgRPxTBhC1kY9ftcZMNBNyG3/976Gyq8x2MZTWEEmAu6
    4THMQgyKynVhbhEVC0i90RBHYKcer0txEroFLWb6yBQwnK3PptorQONWojJq53haWiNRAT
    Rga8NxCrfEI2JUlRwvKhIMLDePsJ4lD6Z8MAvNBzYdTnnw3g8lMnZOkd4FU1d4ryOZ0hs2
    daTybr1NNFz3Yq9qlAoTIXakFjCz7dD1EtqtHvRJuXdLD4D2oIEHf30zFkV5JZRi8+WlY/
    /dQhgpmxLb4jH5lQHxfvoGIzly2jgXEQHfytjkWXunP0JrCdd4gtjU/zlNyQgj0WSGCjq1
    pyZH9RPf9zDFKQo3Yfq0EEc6xcCXeTrLfw5Xd11h86dCXxLjfORdwxR4YL+bgfri9lIr29
    jcMKpHwHDKAAB8X1KYzD997A541c6a9UMZuyfKIGTTqi4O3PXIt0Zud7gf22XQOzOuqxdJ
    XIF4sC+IvxtOq4ymbyHS0mlYlpv4g3T3LMgRP2sdVhqCJOtXW7u7tDVOxvfw
X-ME-Proxy: <xmx:0ygpaihulbIoErmhGmHna6Ow_LiX7fgXIBRrMUzyx5aXwll4VhXc8Q>
    <xmx:1CgparcxO9C3j4wyx5jlvDd-dxQc6VrCOvW93YoIlHnU3mKtMDd9Pg>
    <xmx:1CgpaqgEgEIOjzEEzScI-ooAFVmQx8VvzFKqjZetWTPqHgxx7vNUEQ>
    <xmx:1Cgpary6BrY4XznFq6WCtWVh-JvMkhNsaRKiaHKSCbZzzXUn8atlQQ>
    <xmx:1CgpauPfVk6WoV4396MYp8YLTZHaIrVe0orj4Q8NVvmCAlKbQoHXg_A9>
Feedback-ID: iec564b6b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 05:05:23 -0400 (EDT)
Date: Wed, 10 Jun 2026 11:05:14 +0200
From: Andrew Rembrandt <kernel@rembrandt.dev>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3-pico-itx: Fix non-functional
 ethernet TX timing
Message-ID: <aikmOfazxdrhpty7@mcmanus>
References: <20260608182358.170489-1-kernel@rembrandt.dev>
 <aiemGajqcQeY9avz@inochi.infowork>
 <aihYftGNcpUd4UUR@mcmanus>
 <aiid4Y6x6Dbbwszf@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aiid4Y6x6Dbbwszf@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020526_455201_74F8AA77 
X-CRM114-Status: UNSURE (   5.36  )
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

On Wed, Jun 10, 2026 at 07:14:56 am Inochi Amaoto wrote:
> Do not do this, just leave the rx-internal-delay-ps untouched.

Sounds good, I'll leave v1 as-is. Many thanks for the review.

Regards,

Andrew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
