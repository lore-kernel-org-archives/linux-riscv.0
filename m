Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18968C25B4F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArF4oaXRb4CmTEbp5BdgWOV+vMzkl9LjZ5PPrGDvF+4=; b=w4Us5QWvTSkDuG
	T1ao6YbNlXsxW0LhDcowzxpphJvr00jncAUqMPxEDbX4/32hkrSP350ax6Nd5Afey8aXTdFq33YJx
	z6xsnDpyI/Y1CP5BLGOuD2jFuIjm1rHoqJzHJ5BNUdSttxA+sLrPLT08bwJnkhWjjxCMbC1gVKlR9
	JgBRWV5dlOBRmgQiZfMBb8AUBpeT/9yFQiiFQ3Hm3PtX3/0Uo10pp2Qw0xpIfQ/ELLhhetixP9aP9
	33nKmaq/zycLvxhN9z9ghICZhy486BGqBd+bUtNZ5sSSgG79/O3a6MeUZwOwAm+AB3ig6rdkuHvl+
	r2PkFy2Wb9Ivh+iPNzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5KuR-00000004PUy-3szT;
	Fri, 10 May 2024 07:43:15 +0000
Received: from mail.tradeharmony.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5KuP-00000004PUE-1ncx
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 07:43:15 +0000
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id B0D8626688; Fri, 10 May 2024 09:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1715326924;
	bh=niuXEqqR8RnV+jmqddfR0pqtgAFtRJIUEsYODsA2d0w=;
	h=Date:From:To:Subject:From;
	b=aYHhd6O6cZ05X4w1UxNKqGU0BAq1K7kCMtROmnKj0S5/5lQKZ7Un0wLqQ35rh9a+F
	 X/6quHSC/0KptqZi8QzLLPzD0Vau47HLPucezlVnAELxM2JeHHyl9qjC/QCOwk8x2F
	 Pquox/Zm17vne0I6LQoQFrp7j/ZeI6JVzphBKobGGuF6Fc30W18jxLHHtriRfYmXbc
	 tXmdDKwX70HkY0ShTgPJBhdlX7h08CYMX7ajZWr6L0YgBamPcIX1AQha7Jmha9v5Em
	 tecyFtoF5zflwecWsSXBE1gyl4fQ/E9TGBx5IrOazxxGWDVZXsXCMqUxr7wNaDLO9h
	 3IlTjpz6u1O2w==
Received: by mail.tradeharmony.pl for <linux-riscv@lists.infradead.org>; Fri, 10 May 2024 07:41:14 GMT
Message-ID: <20240510084500-0.1.67.2bto3.0.mdf05np9ne@tradeharmony.pl>
Date: Fri, 10 May 2024 07:41:14 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.tradeharmony.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_004313_627225_7623FAF1 
X-CRM114-Status: UNSURE (   0.02  )
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
