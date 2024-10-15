Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4000CFC273
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Oct 2024 08:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q7m/iMXIDD6o/1cDsrt+Y2gCBnSL4so5ZfOsE0J2Yl4=; b=lWoJK7+oH4hy61
	xAHc5Tj4qPYtEadtxeUPYWet6pPDFDUk66E4g3wSArKVaFbH48lAFvH7msc5ef2c7eD2r8Q+1f8Sh
	wlPIESaTNjppOJ1SNCABhWB99cXVltRQSukoHx4QjGgzba7GD21TjcsUo4WIfx9Uq7Fmfm4MfyT+r
	LTHYS2VJy+GRIj/yRyQKxfPhoCbIaeL0tIfJ/YiZ/avgXeMs/2/8IeoDn3TBNpDk5mMU1iDBns0a8
	6as8yklnoVjcCLXYB8wyUK+jN2dbnjChjsxDdmabnbORgvdpz6cNFYR0YHjDOGMtM7NRLcdZ/UPcg
	SeKbCfZCaGQBWzHdUppg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0caN-00000007RNz-1k9R;
	Tue, 15 Oct 2024 08:07:19 +0000
Received: from mail.geniusthrive.pl ([217.61.112.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0cTd-00000007QEG-3L7u
	for linux-riscv@lists.infradead.org;
	Tue, 15 Oct 2024 08:01:47 +0000
Received: by mail.geniusthrive.pl (Postfix, from userid 1002)
	id 515B286C10; Tue, 15 Oct 2024 09:56:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geniusthrive.pl;
	s=mail; t=1728979016;
	bh=5k7KaERzV9XtiDAeG3jYJqSXCiNxYwmW5KPssYFF/k8=;
	h=Date:From:To:Subject:From;
	b=mFeUGLB6DaxhbHp/Kb+3U6l6TwhVsXxt5dfZ0Be1SQct+g/sGNhu1NbjKz4CKVDhq
	 KsPV5ohNAz29ghdQt73+mSfo6wXfzSnzjIsz+u0vDxBwXvg3ckbzsdJSLF5XaPzqXt
	 3Dluk+Htc0lhKyP+FOozU6bSaUWrMB84X5WddmLryGiY82tkkdx9NTKb2Fwse5+JWh
	 JShFHtv/mXDXY8cgr7TUTrG8s37zbbzKnS7ReF2tKMaxm7tMUL3VKYGlUntXEPYRJT
	 NwKkeT6fAo/OiDBSWKl8vHggAJtvDz5lrn/KWsi/bQvbcmnrOzsTwNKOJbdLrswaeb
	 5vnZZjwIbcZrA==
Received: by mail.geniusthrive.pl for <linux-riscv@lists.infradead.org>; Tue, 15 Oct 2024 07:55:30 GMT
Message-ID: <20241015084500-0.1.aa.1gruu.0.cvsjqea591@geniusthrive.pl>
Date: Tue, 15 Oct 2024 07:55:30 GMT
From: "Patryk Wysocki" <patryk.wysocki@geniusthrive.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.geniusthrive.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_010021_972616_780B4E42 
X-CRM114-Status: UNSURE (   0.31  )
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
ZHN0YXdpZW5pYSBzemN6ZWfDs8WCb3d5Y2ggaW5mb3JtYWNqaT8KCgpQb3pkcmF3aWFtClBhdHJ5
ayBXeXNvY2tpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
