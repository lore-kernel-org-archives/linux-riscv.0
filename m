Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2793FC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ga83hqxlIcUeTWlk8LnrAW7Ynq6kkPjuWH/3r4xLq8g=; b=fkENmh8X2fkv7z
	o4dkoxJShJosUQhVBFxCgXE7eI2GlLrfH6lpTvb28v3Inm/+xPNuWPJxDxFH7b1ejUH8sc3N1c8LE
	TxfVBmufjxZs0TC4uRZ/aH4CsOfHiZejmS1k0K3XhaXtcaRdRDitLjCNBEWxnvoec+ICtrSn78z57
	MvOjly1IyIRFaOYElsS43+N6Ul0wvO+m9AYQtb4Yb+s++5MNQxRnL3rgNInDQEbo9N1uVWdkWizdl
	qRSdmLHSN57QoddGR59UJDdufTNN0EdFDCZ1NQaRJVmKeVKJdWY34pnwnXCae8+psIrqkqQGzwBZt
	Y9RUww/tsTmf2cgrO7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEcX-0023pu-2z;
	Thu, 21 Dec 2023 08:41:33 +0000
Received: from mail.raportygospodarcze.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGEcV-0023ow-0P
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 08:41:33 +0000
Received: by mail.raportygospodarcze.pl (Postfix, from userid 1002)
	id 8BEE4A37DB; Thu, 21 Dec 2023 08:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=raportygospodarcze.pl; s=mail; t=1703148084;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=jSodbNoqF/LuPJVGBMfGqkF/VtsEberCgBAhsgA5S/H2xDEKRBbLaZo3Nio+ZT9x5
	 Kwvw2NDXUaskMhUYzMGzg9cZ1E1VtZ85G4BJ2I7kiuNG2/S6hB2AVE5hQtotGF5VaG
	 wgDCaTmkwil/rvjQDhwDfGCUgy4iiVkjAH3U3PFz9TN8bQzP5YWOUZthFX294F9uOx
	 ap37NlJYx2ZgTJs5eiqydyhlMKra32Os1VRE5NqARshT3NaZnrFJ3ocpNimk8d6/oF
	 QNvMmpxM9MFxxVn/ntEyhoFENkTk910LLQVM767zJS4LbxpQSI6jgC6KDGMpB2fA+m
	 Exd4Lwjyr1Fuw==
Received: by mail.raportygospodarcze.pl for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 08:40:44 GMT
Message-ID: <20231221074500-0.1.cb.1o42v.0.i1o2j7f1do@raportygospodarcze.pl>
Date: Thu, 21 Dec 2023 08:40:44 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@raportygospodarcze.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.raportygospodarcze.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_004131_916506_7E4B9E3B 
X-CRM114-Status: UNSURE (   0.53  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYWtzeW1pbGlhbiBDaXN6ZXdza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
