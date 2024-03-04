Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0EAC54E49
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 08:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArF4oaXRb4CmTEbp5BdgWOV+vMzkl9LjZ5PPrGDvF+4=; b=JHn9oA+3cDJpBb
	SDydO/gOUiOvFRdqBsmwrYaLVbyseILKLZDYqE+ot3a+KlAg9Z3fSQj1q907yMIW3JYEg+/IXYhge
	bFCmwJaiAmRVxe561eXk3oxHpE7UBpIKo/qXReC/4xj4MK0Z9CG6McAV+GfQJO3744axrg9li2LFF
	XyFhiIapESkvAIKrvY/9FUp7aUSI/MEjHnIkwWt7rQtbo9Zft9VCJzWx1ku74DyRUhaP244bV+sEu
	c7YbcQcsbU52ukk/b49CoBNL6s5IkAuuQLzpT1D0lweHSQhmWcWphTZ9/KONrXDY3cXU7SeirgPGk
	Pv/xlHW0h7pGyWIk88Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3oZ-00000008AGI-2XPz;
	Mon, 04 Mar 2024 08:36:51 +0000
Received: from mail.tradeharmony.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh3oV-00000008AET-0Qq7
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 08:36:50 +0000
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id C1D9024113; Mon,  4 Mar 2024 08:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1709541398;
	bh=niuXEqqR8RnV+jmqddfR0pqtgAFtRJIUEsYODsA2d0w=;
	h=Date:From:To:Subject:From;
	b=QV0ULKv0bLXex/Z4VbrjSn0HCU0Ebsoqf6nwKKJPt6XAV9dpf2gJrqc0niroaGW5a
	 Rjfty1UPd5cWMhnYR+mBYosKP8OWIUynsKup49vnGyJAwTr7Qsw8LBkl0yCb4U+CkJ
	 xr4SRY4dFqtns8jcqN5+N876uUPRr0tLDqmwAdATHhY1+zdw45Z9UNqETeCPlBDenG
	 pNzu2RQIRKlXzS3K2jcJ1HNgMco+w72AstzzG3a6uZX0TqBQBNnG2Px0OXZDYykORt
	 lP+jZdYAvTNHW/cv7ND3Nxw8R7HBWJBEBnqTizsKpnwMB7MgDDC0qXPtU0zCfwgkop
	 4AubI6RE8iyFA==
Received: by mail.tradeharmony.pl for <linux-riscv@lists.infradead.org>; Mon,  4 Mar 2024 08:35:43 GMT
Message-ID: <20240304074500-0.1.4w.1ur0g.0.63ojrmldwg@tradeharmony.pl>
Date: Mon,  4 Mar 2024 08:35:43 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.tradeharmony.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_003647_922379_7123D9FE 
X-CRM114-Status: UNSURE (   1.37  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/IAoKClBvemRyYXdpYW0KS2Fyb2wgTWljaHVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
