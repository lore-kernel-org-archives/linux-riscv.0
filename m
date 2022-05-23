Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A186C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 23 May 2022 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LkfsurD55L3z4d5OTlAKXBD27lbkZLWlXAP5YlUl4jg=; b=h+OUR0mi2WLxIV
	+vO6OnvN7VS5k0BKxEpfYGY0ABEGygCkBikt5umtLPA1cQo/5ZBmZw3S+FSxcRUrz/6l1LqslJEP8
	88Y2AQmI1KORIPRtLLAHR4vo7aIvMgB7LlxJESTole8P0+QVwg+2aFEymtCSk1t6DHUyGcyOKOFai
	uH2aQInvYnSFuzmZtg1w+qgWzv/0VYCecHwfcAYYv5in4icHc0JPQMtCGLsRbtX7whVNIPKgsPIKy
	taagbrByweGVAlSywcJcsmENhvuw4vTloHGJysU8UkoEXazCBbVHC8DrQgru68hGKIktNOWpIvNMo
	CSy6j4XgYanoo1NCCIhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt43n-002icG-C7; Mon, 23 May 2022 09:09:07 +0000
Received: from mail.tireplot.pl ([46.183.184.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3FL-002Mck-Op
 for linux-riscv@lists.infradead.org; Mon, 23 May 2022 08:17:01 +0000
Received: by mail.tireplot.pl (Postfix, from userid 1001)
 id D8DDB476F6; Mon, 23 May 2022 10:10:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tireplot.pl; s=mail;
 t=1653293452; bh=Rfzvu4C+yJ1wyuJ4V+t/udh6cgYEQVnY6S5ltO4wdNg=;
 h=Date:From:To:Subject:From;
 b=xyDWsVEZXg7S1qZd5FORa9NtXC88+v745khDOlzrFklCbxcPuY2aEbWBz+5Brj82x
 8DkLDHO/ATizCo6qFOpsfvMAtE/G3m+rh1vqtpeqAhUYjPt21rJbK+Gg4R/F/Mr4vS
 dJABdIrBmlFYs+BSqRFy+A0Sij2D4IvyHDrx/jDeUlMMioO/K1r/LHCpom37kwopP6
 q8o3QH6bw4mDbP7wPGBnOxaeeK6JZbXc8iadYhoHHpOg6tGp/QECbDfBobuQvVqyn/
 d4MrSJvl/ZVcCF1b3ybGLsFROvybeIkgx1U+Ud6alSfRLeEXldX+t4xV9eYQvYEO4G
 Bls1i96jG2/HQ==
Received: by mail.tireplot.pl for <linux-riscv@lists.infradead.org>;
 Mon, 23 May 2022 08:10:24 GMT
Message-ID: <20220523084501-0.1.2k.fz92.0.ekdrq721hy@tireplot.pl>
Date: Mon, 23 May 2022 08:10:24 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@tireplot.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.tireplot.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_011700_020548_C29092BF 
X-CRM114-Status: UNSURE (   0.07  )
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
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuICAK
ClNwZWNqYWxpenVqZW15IHNpxJkgdyB6YWtyZXNpZSBkb2JvcnUsIG1vbnRhxbx1IGkgc2Vyd2lz
aWUgaW5zdGFsYWNqaSBmb3Rvd29sdGFpY3pueWNoLCBkeXNwb251amVteSBuYWpub3dvY3plxZtu
aWVqc3p5bWkgcm96d2nEhXphbmlhLCBrdMOzcmUgemFwZXduacSFIFBhxYRzdHd1IG9jemVraXdh
bmUgcmV6dWx0YXR5LgoKTW/FvGVteSBwcnp5Z290b3dhxIcgZGxhIFBhxYRzdHdhIHdzdMSZcG7E
hSBrYWxrdWxhY2rEmSBpIHByemVhbmFsaXpvd2HEhyBlZmVrdHkgbW/FvGxpd2UgZG8gb3NpxIVn
bmnEmWNpYS4KCkN6eSBzxIUgUGHFhHN0d28gb3R3YXJjaSBuYSB3c3TEmXBuxIUgcm96bW93xJkg
dyB0eW0gdGVtYWNpZT8KClBvemRyYXdpYW0KQXJrYWRpdXN6IFNva2/Fgm93c2tpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
