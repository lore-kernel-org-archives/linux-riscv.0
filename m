Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A66CC83F1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Jul 2025 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IdyWQF6wGzjZvfAmXHO7u8HU+qkwLXasde2pOJBnXPM=; b=RGIvz19GKeslK/
	j7nhrI3+frxrysWtfEfq7Qf0b51LRv3ANS1CVa/7nDNQFl9Gvc4ysncHehQ9HwOQzxtiObdnw/5cO
	ZvMPAXueWHFTkUcVnPs9FJPLN0oc1ndDTQMOrjkW/lyDBFu0/asfgL/rJlRbFMXgqqgBHGSaO2PKp
	THKluNDb99sWsaW908oPwGeLW6S8lbS/VapPZHKVVtCYbD2kJ3SvEINBFGsm+c0wwfvoLd4qUzdUj
	glLo6Qm6P4leJZR4n5eunGWqKqW9mtq9A1YmUGj/cgJAt84HLPhT+a6MZzIEcrkSahdDDFFKcwWOY
	q8q4zEEUV6/PLuJb3wow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnCz-0000000BHQx-14Kd;
	Thu, 10 Jul 2025 09:04:49 +0000
Received: from mail.capitalcraft.pl ([57.129.67.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZluz-0000000B34I-1L27
	for linux-riscv@lists.infradead.org;
	Thu, 10 Jul 2025 07:42:10 +0000
Received: by mail.capitalcraft.pl (Postfix, from userid 1002)
	id DD175239F3; Thu, 10 Jul 2025 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=capitalcraft.pl;
	s=mail; t=1752133327;
	bh=HDVkD9F9d0LNuXby99FgApyHr5MULFRdKL2PW8Qg/Vo=;
	h=Date:From:To:Subject:From;
	b=nhac9TTdo4ltBHOom+pTq4AS9tBefPpi6X8bsoV3NSQZGadBbat5j66eIdrxekIUF
	 Heu1yDWD76NuUTBHwCtgCbgTkKTzjgwxYItPrjesQ5i/sqjTRy+DpSmvbOJLb/SlaO
	 L7Y1IcKwMVt7E6TXTjyExuwYBxm0Y/a1104Vht8SFnq+/dhj3ZCOPigsNJwkFKYWau
	 0fknxRaZoSTgohe2C/h6CkC4eo0Bqgps1ofTeABnhjvVXzMSn8wG31Kf9NgFTkeZ2J
	 GT9N6hSjMdRmgTJnO+/kWybqEGKoZQqbN8PYxL+cTJPZtPNHF4eJtQdS99ZG8U7Z+S
	 hcpeNG2z4UWKA==
Received: by mail.capitalcraft.pl for <linux-riscv@lists.infradead.org>; Thu, 10 Jul 2025 07:40:33 GMT
Message-ID: <20250710064500-0.1.3c.g4bu.0.87wqmsvb7j@capitalcraft.pl>
Date: Thu, 10 Jul 2025 07:40:33 GMT
From: "Karolina Dylkiewicz" <karolina.dylkiewicz@capitalcraft.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Ochrona pracodawcy - prawo pracy
X-Mailer: mail.capitalcraft.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_004209_516159_484EA22C 
X-CRM114-Status: UNSURE (   1.12  )
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

RHJvZHp5IFByemVkc2nEmWJpb3JjeSwKCncgcHJha3R5Y2UgcHJhd2EgcHJhY3kgZ3JhbmljYSBt
acSZZHp5IGZvcm1hbG5vxZtjaWFtaSBhIHJ5enlraWVtIHBvdHJhZmkgYnnEhyBjaWVua2Eg4oCT
IGEgamVkZW4gbmllcHJ6ZW15xZtsYW55IHphcGlzIG1vxbxlIG1pZcSHIGtvc3p0b3duZSBrb25z
ZWt3ZW5jamUuCgrFmndpYWRjesSZIHN0YcWCxIUgb2JzxYJ1Z8SZIHByYXduxIUgdyB6YWtyZXNp
ZSBwcmF3YSBwcmFjeSDigJMgdGFrLCBiecWbIG1pYcWCIHBld25vxZvEhywgxbxlIFR3b2plIGR6
aWHFgmFuaWEgamFrbyBwcmFjb2Rhd2N5IHPEhSBiZXpwaWVjem5lIGkgZG9icnplIHVkb2t1bWVu
dG93YW5lLiAKCkR6aWHFgmFtIHNwcmF3bmllLCByemVjem93byBpIGJleiBuYWRtaWFydSBmb3Jt
YWxub8WbY2kg4oCTIHdpxJlrc3pvxZvEhyBzcHJhdyByb3p3acSFenVqZW15IHphbmltIHVyb3Nu
xIUgZG8gcmFuZ2kgcHJvYmxlbXUuCgpDenkgbW9nxJkgcHJ6ZWRzdGF3acSHIHBlxYJlbiB6YWty
ZXMgbmFzemVnbyB3c3BhcmNpYT8KCgpQb3pkcmF3aWFtCkthcm9saW5hIER5bGtpZXdpY3oKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
