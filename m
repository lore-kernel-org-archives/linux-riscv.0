Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2F7C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 08:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ToliBijo4fhysK5DJqwuCWNYaxFMxtHzZ4qAZSAAM1Y=; b=n4t53tX+03ckdR
	dd3UboDQRETK0a/U9vS4mfrsfVPDOfxw/rzov/pSUwkqw+lKxbw90XqtaJXhyJZX/+9XDNC5kt8ZC
	KmwuGiJdWZNtHxNkhSyWkBseUza5GlHxW1MF1rUzk4zXzJyusJMPhhQoS3UKnq3EJsZ8ZX4rWZLVU
	i8HXvApsTrKtdniPQppzMlhgoP2oM2hWjjz+sYO5PBhkatlNUQmhoDIrwic0fxorI72b7CYHempiY
	WFJGYvJUuC2QrBDLLeOrBTbTmTIR6V5/nAJqGpkWyctQ2d2L7hW5h7yBxxRiPliZO9t/1+2oAplTp
	W/K1M46YyWVYMBd4GQgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOQn-00EZCv-0F;
	Mon, 31 Jul 2023 08:39:09 +0000
Received: from mail.cothiafon.pl ([217.61.106.23])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQOQj-00EZBB-31
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 08:39:07 +0000
Received: by mail.cothiafon.pl (Postfix, from userid 1002)
	id CCC8883A6C; Mon, 31 Jul 2023 10:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cothiafon.pl; s=mail;
	t=1690792615; bh=dwoca0X6C9VXklO/zRgFQCPapTk5LFz4tKaENdvy6Po=;
	h=Date:From:To:Subject:From;
	b=eDOUOdulabWGNjM+zonwo3TXvp2XMkfhrXNcmIyPm2jiZ9xtYLDVelde3fJGe0swC
	 OZi7Qf+Bl2rtgZn2G06JiB4pzASFLt1qgfyEKH0qTaaWzMQF/WLX1g9B9R8iHm0Kvc
	 V7kPICjtptTaH/rz5yTlnrR46pM/VhJzw94HDTHhnAhDlqXt9m8AYKjHnUs6uyRRsw
	 9dYILQ2NrmXOd+noZZurJIzyaY6uWrHdzEYVnRMe88c0ou6P/07DqYXEu3FQdi+Qtf
	 MYLPu2CvdSI2SwGn1HkfARGl9ueQDCLP0O9c7YcGLOW5W1ypmN/cGm8E4t23A66Zoq
	 IVrNwrVCrm/Pw==
Received: by mail.cothiafon.pl for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 08:35:48 GMT
Message-ID: <20230731095940-0.1.28.on3d.0.1lwwx9koa1@cothiafon.pl>
Date: Mon, 31 Jul 2023 08:35:48 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@cothiafon.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu
X-Mailer: mail.cothiafon.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_013906_111071_BE21C0BA 
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
amk/CgoKUG96ZHJhd2lhbQpSYWRvc8WCYXcgR3JhYm93c2tpCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
