Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E221CD1292
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Apr 2024 07:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCC2BbaxC5oQ1en3nhAh5+f7bjKxtKvWUtluIGtu61M=; b=UqZaRzcEkATy7Q
	lcougNS4tNbPJxYGI3iCVfH1BkYuvW8JV0ie/TQbOLEK+dY9kWh5FH1JpryZF224N0PUZQnDyAfZ8
	68AzmFvDySGJ1OiVYCaLivHuSGYgfpA/kRESk9wUgrOfYmRf2vxB3KjwCahg5JmdwdeNDA6GIvPyb
	OLPGlymCeLN5G4NAYYMjq8qKDjoOJXQRurrTvJkzblzr/IFOUtiOxGJCBMWyuHXg5TQULlajtFoXc
	JKFrl+6SUWsJvuAJSKQpH75m3WNLX9K1ZCdRXQyo8SklEU5JBxNYXA19ii4gVtEccc7ELGb7Y4CbD
	RYwNjkZmZnqf5xYYq9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtja5-0000000EgzX-3al0;
	Mon, 08 Apr 2024 07:38:17 +0000
Received: from mail.haughton.pl ([195.231.81.188])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtja1-0000000EgxE-28ml
	for linux-riscv@lists.infradead.org;
	Mon, 08 Apr 2024 07:38:16 +0000
Received: by mail.haughton.pl (Postfix, from userid 1002)
	id 57A3882FA0; Mon,  8 Apr 2024 09:37:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=haughton.pl; s=mail;
	t=1712561887; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=HojJok+DnY5g8R288ckRkDDk7N65LSBZar8cGXWphDdcgeSAv5lUNMGFCn+uiNwqo
	 ricReURFyBEFX7u5Quzj+2VD9VRX4hXRdsckRdvrc35ngYQnvgPB0KKnNpLHYKih8S
	 Cmb67vFCg8oBj63FZFz69Ijbd0MJpYbAEmFBP9s/DECUBMzd7gMoJkE8PWoG02KCTv
	 3wqTqSLuicn6i1P3qnYsaJZK2+gNbtTz7ifXdibrxtRDyxEoD/Tm5LLKdvXrSYY93h
	 rvSNa/H6OM731K96JYULQQ5twwN0tDsOuXBGt6PNjjD2wIP91I3dwx1b8iYnWLigfY
	 9SDJm+aU3uu/g==
Received: by mail.haughton.pl for <linux-riscv@lists.infradead.org>; Mon,  8 Apr 2024 07:36:20 GMT
Message-ID: <20240408084501-0.1.1h.iche.0.36fh2gj353@haughton.pl>
Date: Mon,  8 Apr 2024 07:36:20 GMT
From: "Patryk Wysocki" <patryk.wysocki@haughton.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.haughton.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_003814_436824_0449E59D 
X-CRM114-Status: UNSURE (   0.17  )
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

RHppZcWEIGRvYnJ5LAoKUG96d29sacWCZW0gc29iaWUgbmEga29udGFrdCwgcG9uaWV3YcW8IGpl
c3RlbSB6YWludGVyZXNvd2FueSB3ZXJ5ZmlrYWNqxIUgbW/FvGxpd2/Fm2NpIG5hd2nEhXphbmlh
IHdzcMOzxYJwcmFjeS4KCldzcGllcmFteSBmaXJteSB3IHBvenlza2l3YW5pdSBub3d5Y2gga2xp
ZW50w7N3IGJpem5lc293eWNoLgoKQ3p5IG1vxbxlbXkgcG9yb3ptYXdpYcSHIHcgY2VsdSBwcnpl
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8gCgoKUG96ZHJhd2lhbQpQYXRy
eWsgV3lzb2NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
