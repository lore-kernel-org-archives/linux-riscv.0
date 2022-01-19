Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C74C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jan 2022 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHfkdeXkYAR5uqDUCZQSKi+0n6kadEM5rSIWwS1euU0=; b=W7KbaqtvOAcmQG
	IWNDO3g9YrRpAPmIcWr2ZQw+mGwQ5AXFWHVgs9l0KKDkKbzfR7Luq8OEhw7p8pt0LjBu/aIm0PVdN
	tq0uinvYj9pxKDufJFFEs0dvIadER2bk42RGYAA5vDzG41VXdv8K/U2ean9phIjRZ4ZmrEo0DpGbS
	XnHPNk5a1/xx4nibX6v6HN040qerUDBsiBf5CEgWO5Oz1e0n5nl+mernArEZ2EHLgCgUV8+hj3O9d
	d2+1RcC4vDh+QRPhh62mu5GXV8BdUUtJJgluHkmy7rjj7opcXGlZgGeOQ2YTDRHDRyk958DuZ4C4D
	oQHX1GhUFrSbRFG4Wscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAHog-007Mun-T5; Wed, 19 Jan 2022 20:44:26 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAHoe-007Mpp-08
 for linux-riscv@lists.infradead.org; Wed, 19 Jan 2022 20:44:25 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4JfHgQ5sXnz1qwxw;
 Wed, 19 Jan 2022 21:44:18 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4JfHgQ50LCz1qqkB;
 Wed, 19 Jan 2022 21:44:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 6L6xe3EddrKa; Wed, 19 Jan 2022 21:44:17 +0100 (CET)
X-Auth-Info: nJuTUY16BLditwCx3N+8RgW7uEoB4EG3dgp1fSm5IYXv2+7XoCryn5F+CymGT4hG
Received: from igel.home (ppp-46-244-165-91.dynamic.mnet-online.de
 [46.244.165.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Wed, 19 Jan 2022 21:44:17 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 4B0C22C36EF; Wed, 19 Jan 2022 21:44:17 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Changbin Du <changbin.du@gmail.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>,  Albert
 Ou <aou@eecs.berkeley.edu>,  linux-riscv
 <linux-riscv@lists.infradead.org>,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: eliminate unreliable __builtin_frame_address(1)
References: <20220117154433.3124-1-changbin.du@gmail.com>
 <C2470F2D-9E45-49D7-A03B-E6A7BB4B9738@jrtc27.com>
 <87v8yg6lhf.fsf@igel.home>
 <AAAA7852-EBCA-47A3-B74E-A425023468C6@jrtc27.com>
X-Yow: Did you move a lot of KOREAN STEAK KNIVES this trip, Dingy?
Date: Wed, 19 Jan 2022 21:44:17 +0100
In-Reply-To: <AAAA7852-EBCA-47A3-B74E-A425023468C6@jrtc27.com> (Jessica
 Clarke's message of "Wed, 19 Jan 2022 19:05:13 +0000")
Message-ID: <8735lj78wu.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_124424_224066_03F01A9A 
X-CRM114-Status: UNSURE (   8.88  )
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

T24gSmFuIDE5IDIwMjIsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgoKPiBMZWFmIGZ1bmN0aW9ucyBi
eSBkZWZpbml0aW9uIGRvbuKAmXQgaGF2ZSBjYWxsZWVzIHRoYXQgYXJlIHRyeWluZyB0byByZWFk
Cj4gdGhlaXIgZnJhbWUgcG9pbnRlciBzbyBhcmVu4oCZdCByZWxldmFudCBoZXJlLgoKPz8/IF9f
YnVpbHRpbl9mcmFtZV9hZGRyZXNzKDEpIGlzIGFib3V0IHRoZSBjYWxsZXIsIG5vdCB0aGUgY2Fs
bGVlLgoKLS0gCkFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKR1BHIEtleSBm
aW5nZXJwcmludCA9IDc1NzggRUI0NyBENEU1IDRENjkgMjUxMCAgMjU1MiBERjczIEU3ODAgQTlE
QSBBRUMxCiJBbmQgbm93IGZvciBzb21ldGhpbmcgY29tcGxldGVseSBkaWZmZXJlbnQuIgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
