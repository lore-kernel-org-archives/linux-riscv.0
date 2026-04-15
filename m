Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A66F9D0FD
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 00:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VTtJq5aJYwX8D+vCMsOLmJ3JaMmwevsnWsXgXV51hEQ=; b=p5SsefFJgwX2tT8Z13BgDrrB4W
	e/JOmYzzqxuseatq5/z5+NaGg3R1Ng4e1TprKNfM727IDDrxz8/fbP0fWwcB+8c/je6mKp2CBUs+V
	yk41eRH7Zi3cGfgYriD7p78MVSCYoCG28XZWTIj4Yhc7QkO9Z+JHN9OKaUWbnBOmGYpAWlZsJOj95
	OHNSFieRfs5qDe+aGuhq94o8mLLrUTvzqPzkktHYh2c4TqhdhHW7gTRDkXEo3D70AGPN/RxiO3+yh
	4ecBePkvIK97TYYd8glSQ5zQ2LJz/w31QiZktvwpujbs2ZpJKFq62DG94DePuNOka3S4S6vBpXuDO
	ofmx2KUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoQL-00000000OYO-1nl3;
	Wed, 15 Apr 2026 00:48:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoQI-00000000OY5-364t
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 00:48:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 520C8442EC
	for <linux-riscv@lists.infradead.org>; Wed, 15 Apr 2026 00:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED36EC4AF09;
	Wed, 15 Apr 2026 00:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776214086;
	bh=DWK2jqzjxVgqEHi6UvrmQGN4fzX3aAIUmoaTpj/VETY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=T/1P/hYSvCIhT7LQQaeKB+Ie7V2L3cbY9wjCWRSqKOJAla+ISg7DzJfV3MUPnVlLU
	 2T3Ye8B1sVn/NiOlI0LseAwdK7TxFUGUXNWGgNBXCvm0NyrvthBHzdBoLqgSl82y6M
	 H0KuIP8OKrxyzMvBFiDcYYHCfMOJYrYdecFuXv5lwprNG1GxlSiQ+ker/K5Rsr90m/
	 DpIMdT4qJ5BKqWOz6jUrLiWQkKJfDIaT8KDRm9r12P0mZVP0vZuNcrqiIi2IhDU5cj
	 o9ffZdsfhOhoBNSvP+8qMti46cx5g32rpD+aWKcdz0AqfhoW+fWlShunv2BQF+u6sC
	 vSsI/o6lCVvmA==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 09B6BF40068;
	Tue, 14 Apr 2026 20:48:05 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 14 Apr 2026 20:48:05 -0400
X-ME-Sender: <xms:RODeacsci5OuPgBZ-vJWOAsTViIa31tcfMNfmiP_3QuD2ltj_-y6Og>
    <xme:RODeaWCLCdtPcdNXqaFHAB81P3e0U7BYAUtrIpg05PNHMzAm_-Je4jQWnsKWR9URI
    MeYoxW3PGQ1FSPjNI5ookcMa-dCD4ah1jDuUy2dwhrZ9c27ZEQC-3g>
X-ME-Received: <xmr:RODeacPQbgZgAOdRPt1Pb32Yr0sdjtdvDfyLcjdrAhd8lesa8out_V0wsb5iCL6X5Kml7sOEi6SnsIRG4EIAhF4adgSLw9qQdSE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdeiiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elhfeiudfgvdeijedtleeltdduueekffejjedvjefhgeevjeefueejledtleetjeenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegujhgsfidomh
    gvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudejjedvfedtgeehhedqfeeffeel
    gedtgeejqdgujhgsfieppehkvghrnhgvlhdrohhrghesfhgrshhtmhgrihhlrdgtohhmpd
    hnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghh
    vghhrggsodhhuhgrfigviheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvg
    htsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihorhhkfhhlohifshesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopegujhgsfieskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:RODeaWAW9woy5wspRtwKduuU6jAD5TfVeiK6NOG_zcCMPmcYWdnMOQ>
    <xmx:RODead6e7OVVWWw1DGB5FTnfogcma0dXlPHpoqhOppoIorsl6pWtHw>
    <xmx:RODeaQ6QJU6A9uT6vr5dH3n6xPvvgfc0HhymvonwNPV-hd6E4dnTbw>
    <xmx:RODeafRSE4rFFNBKxCHm82sM5PHfrmmuRaA9PNFcANlQxd8dk2Radw>
    <xmx:ReDeaY-aI_oI-uyo3MBw9K7H9xviEJisqyjvuUPg7qRx5NnrrZb-puID>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 20:48:04 -0400 (EDT)
Date: Tue, 14 Apr 2026 17:48:03 -0700
From: Dan Williams <djbw@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 Dan Williams <djbw@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Message-ID: <69dee043762e7_147c80100d4@djbw-dev.notmuch>
In-Reply-To: <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <970434c647aa1e1e9a81c87b4d5fed934d4018a7.1776176108.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RFC 3/4] MAINTAINERS: add maintainer-tip.rst to X86
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_174806_848196_8CFE6326 
X-CRM114-Status: UNSURE (   6.95  )
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

Mauro Carvalho Chehab wrote:
> While the maintainer's profile for tip is there, it is not
> at X86 maintainer's entry.

nit. should this be MAINTAINERS since it is referring to the file.

> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Dan Williams <djbw@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
