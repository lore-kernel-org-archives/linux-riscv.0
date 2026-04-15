Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD23F9D0FD
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 00:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NI2GKFGyjo3oM9RaJxEL8JNVq7QIBGnXVhMeEIwfCso=; b=ZQHBFddy9EJ7+zMx4nm6KShsxm
	jCVED/MLljImXtpWwfjStSDl33HOYxNSqyFnPjedcdSg8aMPfnYed7g9pYFl3jDnnM6D+zZ4u1rO0
	MSNBfa0IRCBihyvbmyPuDGIlpPuDzeTBWSDEijhu+yjN+ux4GP1lZQi/GEDOMjPJSNjosPIzsmhoq
	8ilmBHCiSkHz4luiIv/cwAvsg6KN9NnVEnPbKjfdde0uaRSWa5PkPNHFPMgHFKkdekyaWfuIEn56F
	T0dpzv3zwqljNgIBsA9Wwo14fSzN5CQmdIIig6o+HHi/NMvpOnUxiinrH2T156mH0kV4v/Nenstu0
	x7726BvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoNY-00000000ONc-3fu7;
	Wed, 15 Apr 2026 00:45:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCoNW-00000000ONB-2LDx
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 00:45:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6697944265
	for <linux-riscv@lists.infradead.org>; Wed, 15 Apr 2026 00:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDBBCC2BCB3;
	Wed, 15 Apr 2026 00:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776213912;
	bh=qejLFQQGcg1KVqXARzAXhEpre213aSYvl+SOgejiSpg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Mwe1inbzktTgLt/Ki7sWdn96/InJQ3XFIi3j+t/Dwnh4mtLj8psRP0tzqc8iREo8i
	 eUFtu2jSUTkIYQyX+VRoEAuaiIiOBvO4LCS7N8nEBPcQwnAlNZufTkxmNhLWV7o4Pm
	 eNwozaYefQ/Zen680KJxd+GvKxcdRiaqXQNXy4LlNG3WynY+P4Gj6CuPPtPgzUtdSP
	 WAjP53EhmhuTM2iimMBMPbHMzY6jwYc3pb5sgRyGMHU1t7C01ifZp1pVzFXStgxlSF
	 4r7A5YzgxnsyEhFP9ywurntZZgd/3/cD3G+Gd4eBLGv33gBZRMhndwcMMBPb/qZlMT
	 x1/7fP+l7CQdw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 11EA2F40068;
	Tue, 14 Apr 2026 20:45:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Tue, 14 Apr 2026 20:45:11 -0400
X-ME-Sender: <xms:l9_eaalaIa9eyXUeOmkV1U5zninPyBhUKwVoAdxTCiWTF6X6g6YbGQ>
    <xme:l9_eadrapGeexf3sgZIrl692jcXkhZoDvoVuxOfyuJvsYcS5ap56lLaxQYnHTladk
    EistXuyI7nUOxLdnzfV6X-3MDlCXgl8Zur-dXVrhxOFw9No-E5VcUE>
X-ME-Received: <xmr:l9_eaUBEGtPNq-fYupTumRHN3cAqG8PNcey2FK0raEJ8eDLaKkCotaswibKxyGh4VCCxNMdr0TW-hozXb97cRsUlzBx_mG1YO-E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdegvdeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefkjghfufggtgfgsehtjeertddttdejnecuhfhrohhmpeffrghnucghihhl
    lhhirghmshcuoegujhgsfieskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    duvdetgeffhfeftdffudehtdfgffejleeffffhvefhjeejfeekffdugfdviedvgfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepughjsgifodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqddujeejvdeftdegheehqdeffeefleegtdegjedqughjsgifpeepkhgvrhhnvg
    hlrdhorhhgsehfrghsthhmrghilhdrtghomhdpnhgspghrtghpthhtohepuddupdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggsodhhuhgrfigviheskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthht
    oheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hmtghhvghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghr
    nhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrih
    hstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihorhhk
    fhhlohifshesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegujhgsfieskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprhguuhhnlhgrphesihhnfhhrrgguvggrugdr
    ohhrgh
X-ME-Proxy: <xmx:l9_eaYHMLhmTMgXwROTjmYswnHADt465BbqwIBGVSPzEnuUYbOI3jw>
    <xmx:l9_eaW2PH3Ay1C6xJK39bR1E3YVdXlPT6OKZuNKN1xdhAws3ZpnQ_Q>
    <xmx:l9_eaRPRxgEzKFqJHnflz9zCNgs1WiDt_7IplSW3TajU3OHfdtzw2Q>
    <xmx:l9_eaeYkm2KzN7NQ2HezUGVjV-QizG-5q-5ucLaeOD91aC7HVBeioA>
    <xmx:l9_eaXzYpym6Rq6y3s5WA-MQt0zpEYPcSjGE4QDyz6gKlP8t24auZEeS>
Feedback-ID: i67ae4b3e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Apr 2026 20:45:10 -0400 (EDT)
Date: Tue, 14 Apr 2026 17:45:09 -0700
From: Dan Williams <djbw@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 workflows@vger.kernel.org, 
 Dan Williams <djbw@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <69dedf95ab1fb_147c8010048@djbw-dev.notmuch>
In-Reply-To: <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
References: <cover.1776176108.git.mchehab+huawei@kernel.org>
 <4e9512a3d05942c98361d06d60a118d7c78762b6.1776176108.git.mchehab+huawei@kernel.org>
Subject: Re: [PATCH RFC 1/4] docs: maintainers_include: auto-generate
 maintainer profile TOC
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_174514_647488_B678CA0F 
X-CRM114-Status: UNSURE (   6.01  )
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
> Add a feature to allow auto-generating media entry profiles from the
> corresponding field inside MAINTAINERS file(s).
> 
> Suggested-by: Dan Williams <djbw@kernel.org>
> Closes: https://lore.kernel.org/linux-doc/69dd6299440be_147c801005b@djbw-dev.notmuch/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Nice!

Acked-by: Dan Williams <djbw@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
