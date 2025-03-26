Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6ACCC36010
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XCC2BbaxC5oQ1en3nhAh5+f7bjKxtKvWUtluIGtu61M=; b=c72RCQhJGHe9Oe
	yvwzK7zVb78rANN3/VEsUhNalEtrXZ2HWCjyW9TZG78tu122/laocE+Np20VCKGPAlhp0+xbczhLS
	fKZCT7YTgFtwW59lKChaYwb30aiNNFJvRUkYO4Ee8r/FqBmc8Xr1xz4vS+RQ5DQ0wrlf1Uk83DNkQ
	MMlKHl6bH8CFJP8DOeeS+4m50/veFRB7AMqqwbvt43JtnNSNMjpBkR3OCJW4M2EI4w0LreDf83v0L
	qqHzI5B+DN82av6e893sqG2zV/RCrsshZKm0GQ8sZ1fA3goxYBFhspXLwuoqxNcyutQCC3dMtaUUH
	uazdiHIDnNdOdN0ky+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMR1-00000007xVT-0ml7;
	Wed, 26 Mar 2025 08:48:27 +0000
Received: from mail.corporix.pl ([151.80.59.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txMPH-00000007xF5-3D7t
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 08:46:40 +0000
Received: by mail.corporix.pl (Postfix, from userid 1002)
	id 4C6F6253BB; Wed, 26 Mar 2025 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corporix.pl; s=mail;
	t=1742978445; bh=+oYP7ZwnEeonL1pLtE73TJ85xaesKIG0Ys99vCW5hiU=;
	h=Date:From:To:Subject:From;
	b=Oe9xKbN62BDYvUakyvyjaR+kXhkF0aDB2I19dxzzFqxHFGB+Bl4FN5MHSF6LL76c6
	 WEw39e7g3rr89Qwm4RzttGJbANOeFCQ+rv76EQ+cUGVtzwrlZV5kDApvNzd7+rQX1+
	 UUatZ70C8X970UngUXFPX9sm7j7k6AciO44YLggshxquJUj5nTD9605hpL+KIu3ad6
	 Ksp244SW/jmwtmO4T1JBQKMU/xTRjS2VO9BM/tWmBxl3u5qo+ntfsz2q24QJa6JHz8
	 Ij0WN/FRxKQp+8syzKhgChuSKflGn9bqvg6eFkUKB2SJw6q/5WLUgBd0J9NIX5F0Cu
	 tgBsxi5TQbNGQ==
Received: by mail.corporix.pl for <linux-riscv@lists.infradead.org>; Wed, 26 Mar 2025 08:40:18 GMT
Message-ID: <20250326074500-0.1.16.c5ui.0.hrn37dyaqa@corporix.pl>
Date: Wed, 26 Mar 2025 08:40:18 GMT
From: "Patryk Wysocki" <patryk.wysocki@corporix.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Zapytanie ofertowe 
X-Mailer: mail.corporix.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_014639_938527_A624123C 
X-CRM114-Status: UNSURE (   1.15  )
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
