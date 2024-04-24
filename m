Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60927C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ArF4oaXRb4CmTEbp5BdgWOV+vMzkl9LjZ5PPrGDvF+4=; b=FM2ABWjIvKiZgd
	DDAfR4cJSNKRQjRMdjM/pwUhceIKezDYTSmJV4inMmrj2gGZW+8ASpYAzt4OOylQ7LccTwHvFFykG
	hHgE3zgHKUN8MJLVKYd466j79mxzlMcgTCVXrC+9RllnOqleCcQ9wiyDX0J9gJWYZ6fGmE9s7OZtX
	B+6fFS12da0F7RQcYkkTsgkh0LPNxPyKygMs/S7eeZ4plmkaU9gUuJkJ8YLyJq/UiTk5wR/NNhI4Z
	KBMgSEA9+97D0s8kP/efZ+IilfbLUi3votH8wtomGCkELr1xsmGonHX3S/Q3M+KU08DIdSL/zkG4t
	VmYUN1AkFNRAkKaW2EPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXpU-00000003G1J-1U1j;
	Wed, 24 Apr 2024 08:18:12 +0000
Received: from mail.tradeharmony.pl ([5.196.29.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzXpP-00000003Fym-2zaF
	for linux-riscv@lists.infradead.org;
	Wed, 24 Apr 2024 08:18:10 +0000
Received: by mail.tradeharmony.pl (Postfix, from userid 1002)
	id DD06F243C5; Wed, 24 Apr 2024 10:15:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tradeharmony.pl;
	s=mail; t=1713946581;
	bh=niuXEqqR8RnV+jmqddfR0pqtgAFtRJIUEsYODsA2d0w=;
	h=Date:From:To:Subject:From;
	b=aCjmY8eYZDwJgIUqeDsYjCdDeDfrdtVf6yITomEt4/LPvqiL8WPOErdzgRROGat8V
	 McAAyra7P8f+T9Zaa5t2OcsBBT5Knp/HkgqWlXV6xHnBlBAf/HMUKKA2ou1W4gJKJP
	 vgOMU5T5a72M37F6MB27+L4l8BZbkghXlSO6oyuxzVvaTSs21aiVeEm3zzY66ZWBne
	 T71Cqekiq08nkOlMlKtCgKl29Vwed8wqmmbgsYDA2Jv8H4bPiF2UH7DI7LIkm9op/q
	 gxbnHKcQxlJl7JwRcC3xPISDVYoKlco7acDEQ/NjUZLuT8aZamPs+r/AF4iiGFJoua
	 91GkNyt3vpl9A==
Received: by mail.tradeharmony.pl for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2024 08:15:25 GMT
Message-ID: <20240424084500-0.1.5w.28jqp.0.m0ngomqy2j@tradeharmony.pl>
Date: Wed, 24 Apr 2024 08:15:25 GMT
From: "Karol Michun" <karol.michun@tradeharmony.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.tradeharmony.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240424_011808_481218_E7691CFC 
X-CRM114-Status: UNSURE (  -0.13  )
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
