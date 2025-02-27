Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAF1C021BE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 08:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9v0kmJhoNivuzy5oz0ZtAumI5B63Pk7daDudNiKfOIo=; b=SDIqclOnQ4WXcd
	Iy1QtmfXqxRVXO39u8GrFoEd5sQGOfbT9WS+z6tWSPDkM8+y/opFOr2+5zFCOpkDuH+UsxfYFGxvb
	A2+3msTCAAigoy6nx8jxSIR8+K2f0o321Ve1juC+2qmgayj8EZFCzd7mw/y1XGQCS5HevY4yaZEQe
	BPhQBADe9Vhy2Vxd9wGa+B589Bir0FzsdeEtawhKip/LtJP7A7n1H2kMCQRtL2R4Ea1LpRZC+69Mn
	oVSmkq6tmI/hzlGYorJ1B3SEWcuQmwhMemz+yBfakg7cDkKYtD0+cElSASMhZJfbUutn9TmC5/sVt
	Bs+eMIj52q3E07GoanEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZdf-00000006m0V-3Gq2;
	Thu, 27 Feb 2025 08:53:03 +0000
Received: from mail.novaplan.pl ([51.195.118.1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnZdI-00000006lxj-3Bjj
	for linux-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 08:52:42 +0000
Received: by mail.novaplan.pl (Postfix, from userid 1002)
	id 1AB0EA3E90; Thu, 27 Feb 2025 09:51:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=novaplan.pl; s=mail;
	t=1740646325; bh=jxb0oDMobd7GaIcoqojTSF8ZoNcoVg4kM8ohJkoHKb8=;
	h=Date:From:To:Subject:From;
	b=wjeRBq+yL9cSU+ozc+GCkzlzQzvoXOmuFYB3GYCgN1Gd4fFAQ8V0n8hjl5O3n7u+S
	 73ElBUi1KC4fvQTYiPpTALHbF4Uy4q3KIFgEOsmJ1ibRDMqurXNefyn7EqWEhR3Y7A
	 lLECyF+ydt8HQrw6zQa58mZF23AQ0BEaDatQpGMY8yADzxBgkzNKxEYiXL4Qj3O4CP
	 1WxlH/FEs0WMJ7ZEJ+8Yl0LHj8FOrjqa3SmRtG/kufNxdOnqNtXNllsYHKV0TQd9SY
	 4Qjb/9Ny+Z5zS3dXfGeG31BnclZ50IQCp7nAhz1dwOrkx3OJPU+i9ELsWWP7zRgo4f
	 BHV/UlJjrW4Wg==
Received: by mail.novaplan.pl for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 08:50:48 GMT
Message-ID: <20250227084500-0.1.k4.1caus.0.0tcvid0q45@novaplan.pl>
Date: Thu, 27 Feb 2025 08:50:48 GMT
From: "Adrian Liszka" <adrian.liszka@novaplan.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.novaplan.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_005240_947791_96DCED1B 
X-CRM114-Status: UNSURE (   0.93  )
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
ZG8ga29udGFrdHUuCgoKWiBwb3pkcm93aWVuaWFtaQpBZHJpYW4gTGlzemthCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
