Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F225CC6B19
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZ6agoxDMg6VodrNhCGW/dfCxjNWVm+9lai2JDXHGRk=; b=qqvulUMKsXaFZ3
	jFbPeiOPncgua0kv8dYx0nOm6NSOVyVecQg4MzzRLaYEjr5W+6I9OVGhNygKRH/Crmb7ODMyXwy9y
	Ff83hLPJFEApt9BSeBIdCxWd4fLK4Inn8czPh6h2nF+mu0W5Ml2dE92p3ZEfXdw7BFGvfz8dHZzgF
	8Ny5thjkT9hTeJbHjsuMzLX/Ru0wV502Bi+Sk5ae1+51FgPDihmv7ag+r7+xEWE0ic6D05r1Ayfva
	EwJ9xKiYxnaPCTGmBdlKh4qMgP2ZyJ2kBZQL2ctv4tRzWr8SktBBHVX5NAxUrOkSlQjywl0mlnYBi
	MTuB5VPPegAVUFZr1EJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgeD-0000000Dl1q-1Kbc;
	Tue, 13 Oct 2026 17:50:45 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgeB-0000000Dl0z-1Gcu
	for linux-riscv@lists.infradead.org;
	Tue, 13 Oct 2026 17:50:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BC0BA4E4120F
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 17:50:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8FFA860362
	for <linux-riscv@lists.infradead.org>; Tue, 13 Oct 2026 17:50:41 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 17D6611D71892; Tue, 13 Oct 2026 19:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8CoEQNCztNraFrNGn7F5Ha8TA2+gyHKw7FKAVKh/D9g=;
	b=0gUHv9yfemApHra3J+hhjzzZ0u4HHS1MtWdJbHlCRcZ1KQtpT58BtTfRAH5SQYqQ37F5iP
	krDdc8VmH8AbcTzWY02Vkt0dPuKSc1ZS0MBeHxcgvWe0xeXkNQLsqahGdzhUTqvGgo63mm
	dwIcJ+OSk5pNSsfoMy9qJ9y7/vh72zHifjxNYogzZfghnOp0fjr/qxs56JkZXmfLXyLDid
	YB9ESs+W6GJeL4Mx0ihRjht3w7ZHl+1s9KX0UOyZFNobEOAR5+vmZdgzaIkp0jOKm0Swz4
	84B3bVrHTMTt5UCix1vbLmyQhxlBXxbf3UI8oO3lVsjCOZTNSHLHJl9t4Wdfvg==
Authentication-Results: mail.galae.net;
	none
Message-ID: <72e19e46-3a14-4a07-9b50-01e5480bf1a3@bootlin.com>
Date: Tue, 6 Oct 2026 17:28:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk>
 <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk>
 <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
 <asUGoxyJWVcsYBWG@lore-desk>
 <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 17D6611D71892
X-Spamd-Result: default: False [-3.10 / 30.00];
	BAYES_HAM(-5.50)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[170];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	BCC(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[st.com:email,galae.net:url,infradead.org:email,localhost:rdns,localhost:helo,lunn.ch:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,stormreply.com:email,qualcomm.com:email,tenstorrent.com:email,synopsys.com:email,dzb33gt3zgca:email,davemloft.net:email,lore-desk:email];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,kernel.org,redhat.com,gmail.com,foss.st.com,synopsys.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105043_641027_EB4C4C55 
X-CRM114-Status: UNSURE (   6.60  )
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

Hi,

On 10/6/26 17:12, Anirudh Srinivasan wrote:

> Maybe someone more familiar with this board/has used PTP on it before
> can help out understanding why this is happening. Maybe this is some
> issue to do with clocks.

Good point, can you give us the full dmesg log of the board booting ?

Maxime

text:
Return-Path: <netdev+bounces-341920-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id AP0BH74TxWp5BAQAtaWaaQ
	(envelope-from <netdev+bounces-341920-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Tue, 06 Oct 2026 17:29:02 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id D8F12103308C0
	for <maxime.chevallier@bootlin.com>; Tue,  6 Oct 2026 17:28:57 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=Zge95CWJ;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-341920-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-341920-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791300538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=BLd0ZSi6AYEzF6Z1S6jhxHqmJ/tVEdxhmTaij18Onuw=;
	b=I4UsZyH18owvi7L5xvwNBy+o+6OMHI7t3ScRIYhQGgU/tzAk2KtVbJ5CEMEyoq3uWVDWJ7
	WwbV2B6PnE+AM98S+vIUQFBQZFFgH0rm1haI1LPk/lEU/qm0YdjewdXafZTY7tR+RNF/HM
	2hU+LJYIFMOx5zREP0bIEeWkekuCrvRPGs94IkvtNIxySDi0XPohQuPNpcv8tsy7HHshe7
	7tJAP4lRdcUvMmi3TKXdfoWc3aLWRuf8HKXDr4O+jwasH1tVmh9Gcc9pTmgPULO32e8A33
	Rl4cK/BelLVSpYTFJgiNAXNzXvGfirr9qQbfRk6txPoSUTCypDz0/ZEEIoDO3w==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=Zge95CWJ;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-341920-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-341920-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791300538; a=rsa-sha256; cv=pass;
	b=qv/SISiv0tGqso7hppWQA31en0i4AR8GyHfCET6LQZmEcYrza2eXpu4/lfGZ8z0UBkz/dL
	pK3bh7gK+ZhU4CEL8dd18/7/qTt/ESE0BrRlj8pstSDkZAzYSqtfrAIOQUxUJ12V48Spcq
	Hngo6UqFG0QCKfX80GNqFAK/PQRTKq2SrUaZcuLszqxb4cAq3Xf5FLiO+cRlFiqeziQied
	1hsS4JhV3BW5F7wdkyMJ1oq0Da9ZNSe26Jh533eqZOSt5+l78j1aDJvBdNHYcAjsHH9CXj
	UwiyABcN6etN/yq0ot/HAD0sS1lyOGe+lCPn1/sGeBA2cb6hLAvyGtK0eK/eAQ==
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 440793422A5
	for <maxime.chevallier@bootlin.com>; Tue,  6 Oct 2026 15:28:57 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EEC7F3649B
	for <maxime.chevallier@bootlin.com>; Tue,  6 Oct 2026 15:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A78449C4BC;
	Tue,  6 Oct 2026 15:28:27 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B4C37FF46
	for <netdev@vger.kernel.org>; Tue,  6 Oct 2026 15:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791300506; cv=none; b=arMcdVOSW15zNQ3vkOmoyrUvKoXy0PO7xkYrYpDwKuZ4zWMwUN62UGRJX3nJ6yEHcJusfpMpY4KJKvtjplt1l2tSD1ViXPNQ0IvT2apBzPIlCd9UnIdYnrLFNiEgLKtx1IW6DGHLveBIVP8dDyrm9cxzPe0+hfckwvHlbdEtG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791300506; c=relaxed/simple;
	bh=BLd0ZSi6AYEzF6Z1S6jhxHqmJ/tVEdxhmTaij18Onuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWCa6zpHVMy0iAqM+E1I05yfiARTt2E8xyA/3JZckud2PtBLESoHrGpkyD2U4PSAcq6WnFFkoc9z4nEK62VjfhLZqKWc9y+Q7ptfpR5k0CCtp+dnHjcUTbPrkM0bHKSmjHYu2TEM6fhlhgKuGDQ9aSqUsI2ndohrbyw2WDBGH0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Zge95CWJ; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 457331A114B;
	Tue,  6 Oct 2026 15:28:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1708E60553;
	Tue,  6 Oct 2026 15:28:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A148B103303AB;
	Tue,  6 Oct 2026 17:28:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791300495; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=BLd0ZSi6AYEzF6Z1S6jhxHqmJ/tVEdxhmTaij18Onuw=;
	b=Zge95CWJorrmzM4yUowmuOkxRgpEyfxGYa2/sfKipV7dd+RjsKMy/oaGCJ/mVs5Pzo0eEF
	QAvqalpkxByxwJKXE5vyKH5kFSUwYu2xwYqM4H22Gg37EqMoVQPaCoVQg1pwSTO1lx6V/3
	Vlba435uh1H4ftEgJSuP+lH4zK400PqocG4hEyzBxYsnoXtQg5EHCs8c/6zB6t0Ce/IzsS
	zc24HAe/gkebKe8qWRsgGTXAIxZzqeo6jh5cRaaxVEC8RvbhI9cXK0HSSF2/J6ZyylYtTw
	sQGayXcUHQwmPGI2afJ4QcT9d7FjSH/TXieM2eordIciOwm0Sdwh2ldqsJ84dg==
Message-ID: <72e19e46-3a14-4a07-9b50-01e5480bf1a3@bootlin.com>
Date: Tue, 6 Oct 2026 17:28:05 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: stmmac: propagate PTP addend and system time
 programming errors
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Jose Abreu <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini <fustini@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
References: <20260929-stmmac-ptp-added-systime-error-v3-1-ddd6afe936b4@oss.qualcomm.com>
 <dy5xfj3754wnp3gh2kpoyf3vpx3vfsfhblgbwbwsgts27xqxga@dzb33gt3zgca>
 <asQcQIh56MV1OJur@lore-desk>
 <CAEev2e8+fr1tJnSErD+2TtLDw5fGJbQOMcM5eefMnLyFUR+m7w@mail.gmail.com>
 <asSb3RNcityVg6ia@lore-desk>
 <CAEev2e8c6hZQQom6NV-URgdSoWiafCcRR3BtA6yxxqy7T-me8g@mail.gmail.com>
 <asUGoxyJWVcsYBWG@lore-desk>
 <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <CAEev2e_+Dcj60Rj2+_UD=3_kNQxLK4rmWTGK-dr-Ve9mGJBARg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-5.59 / 30.00];
	BAYES_HAM(-3.51)[94.55%];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.234.253.10(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MX_GOOD(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-341920-maxime.chevallier=bootlin.com];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	TO_DN_SOME(0.00)[];
	BCC(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.234.253.10:from];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	DNSWL_BLOCKED(0.00)[172.234.253.10:from,185.246.84.56:received,212.83.136.155:received,212.83.139.233:received,100.90.174.1:received];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,davemloft.net,kernel.org,redhat.com,gmail.com,foss.st.com,synopsys.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	TAGGED_RCPT(0.00)[netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8F12103308C0

Hi,

On 10/6/26 17:12, Anirudh Srinivasan wrote:

> Maybe someone more familiar with this board/has used PTP on it before
> can help out understanding why this is happening. Maybe this is some
> issue to do with clocks.

Good point, can you give us the full dmesg log of the board booting ?

Maxime



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
