Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E6CC43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 08:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1p6OrwNUQXsaRhw+p/3Ir6E/5HcVsQbbExcuf8Q+jik=; b=K5wPP1a5T1SYey
	OFWAWCTKi1b0apa1vWIRUDQsHUVJF6w+jcwC4+CGDmkbKlabbcDDxntwAB6kPsV7UkloNvaPv5pbD
	5s6tHe8QecaLR7hvvudO4Q7S6kiaL+epX9ILSCOhKKQLWNKgfmzhDfshLZHsaQvZRUtxhQDlC+YQA
	krCCW3z7LQaCJWXRhNlXasjteAHCq1Ge4okA2UCHvTghrol18BgoEnEwFI3Fw1TstULIyHOSMt9wp
	KB8zSRi1ZsW8N3dwXewVa7wFca3QrrG3nz338LaYysbF7IaRrdIWquV2srOOfo7+R5Op+SAp/4syA
	54GWskv3altNSlp6XE8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUGu-005inx-7f; Tue, 07 Jun 2022 08:09:04 +0000
Received: from mail.forindustry.pl ([37.187.225.170])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUGq-005ikL-Lk
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 08:09:02 +0000
Received: by mail.forindustry.pl (Postfix, from userid 1002)
	id 61A2DA4166; Tue,  7 Jun 2022 08:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=forindustry.pl;
	s=mail; t=1654589171;
	bh=Vw5jk5D1DE7WK/GNf/MxRQNyAyPYcC0rMJLibxKTj58=;
	h=Date:From:To:Subject:From;
	b=bZxoTtEYAlriD9aYnJHwiDucH9Ied0OpeN/8+sf0dhmo0soidvdLmzeXmHrmi0uhN
	 6vmFX5r0/7RQi5sA4PyEQLilFAo8J6UIn5WNmNP3vp5TaBxHvIKOz8ZcxU9D0Swq1f
	 mODwqoXC6zL/Hul+uyWrhl0ZZj3dt4ybFmH1swlyxJn0ejdJdLPTccDQzyfgaH+eAd
	 qFXy9rAbrVrqNNISxVjkVf4yseh2iU4QqFGItEdB5/gofGoH8omroEAMMoBLYEdsSy
	 GAJK3dILEC/Bc3H03vISkxb0+kOVmhvUqTpwaHNgkc3O6WpFOfHZpqh1bU0DVYJ139
	 gp8PMS3v9/YcQ==
Received: by mail.forindustry.pl for <linux-riscv@lists.infradead.org>; Tue,  7 Jun 2022 08:05:52 GMT
Message-ID: <20220607064500-0.1.3o.od44.0.lvqf560b89@forindustry.pl>
Date: Tue,  7 Jun 2022 08:05:52 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?= <arkadiusz.sokolowski@forindustry.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.forindustry.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_010900_903339_DE903420 
X-CRM114-Status: UNSURE (   0.79  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuCgpT
cGVjamFsaXp1amVteSBzacSZIHcgemFrcmVzaWUgZG9ib3J1LCBtb250YcW8dSBpIHNlcndpc2ll
IGluc3RhbGFjamkgZm90b3dvbHRhaWN6bnljaCwgZHlzcG9udWplbXkgbmFqbm93b2N6ZcWbbmll
anN6eW1pIHJvendpxIV6YW5pYSwga3TDs3JlIHphcGV3bmnEhSBQYcWEc3R3dSBvY3pla2l3YW5l
IHJlenVsdGF0eS4KCk1vxbxlbXkgcHJ6eWdvdG93YcSHIGRsYSBQYcWEc3R3YSB3c3TEmXBuxIUg
a2Fsa3VsYWNqxJkgaSBwcnplYW5hbGl6b3dhxIcgZWZla3R5IG1vxbxsaXdlIGRvIG9zacSFZ25p
xJljaWEuCgpDenkgc8SFIFBhxYRzdHdvIG90d2FyY2kgbmEgd3N0xJlwbsSFIHJvem1vd8SZIHcg
dHltIHRlbWFjaWU/CgpQb3pkcmF3aWFtLApBcmthZGl1c3ogU29rb8WCb3dza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
