Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E468C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 08:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IVhi5QNwRASJ1Z9COtuwxUg+RUweERUUqqR8pa6ksN4=; b=17iZUEwrC10sMb
	5H6j59TKKxHQtCIPQg++7WW0eW1qikHtJztiGWnGB/xvHHBTRN90m6VhHYMtq/tm5DIQ12WLVXdjH
	Bh0w2RKkREdQru8DzNaj3KukdAh5iwAGL3QInQzmVCZuPZ98UnhonTK50bOrIWW6sCESiNoefslrN
	tBFzbavPn8K4abtulNUqFs/qmM59N0Mw5B5HfKLVyGmlSA2mshnKQ7JJTxdwAPhX7NkPPea+e8+Q9
	m7rcImlffhC8afkynbky05SThqBXQrYNCftVcnVronZ+FARabRtTqN8CgMCXeTWppKrA6kvKHvo+0
	9XVVOZfCv8Y758H0eFvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE4D-00ESi5-7i; Wed, 17 Aug 2022 08:06:21 +0000
Received: from mail.fadrush.pl ([54.37.225.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE49-00ESVT-Ru
	for linux-riscv@lists.infradead.org; Wed, 17 Aug 2022 08:06:19 +0000
Received: by mail.fadrush.pl (Postfix, from userid 1002)
	id 8EC3A230BC; Wed, 17 Aug 2022 08:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fadrush.pl; s=mail;
	t=1660723576; bh=bD6j9gIFU6CLTaCGl0Ow9oeIxtirvTfMeNZSfLEZQ+I=;
	h=Date:From:To:Subject:From;
	b=BoF09pTxbxs0Wgd1Ee3v59j0Vt5L204VfeZiPb6YyXTWhJTmoRCulcpbUNEslKpVU
	 x6IfG1lCwurwhf3jYapn0s1Xjjv4yI80AaclzEd6FhAaSQxezC9YUeHib4ng8RfRit
	 hct7xcKuOw/zI213z7+6FY0XQynnKLpph7eOGtak1Njj2FgPcPKKiaVm307L4z5W5i
	 vkLLeBc+VonhXKXiLX0JPsx52Wxy3fWCxoUvZPNbysYpgpZ7h74v/7I9nnXlRB8I7L
	 u7ouUcjMOgLhw+3e1mbgLDX0xd5tLWjhJ39zC/pkrYOpoGMLuDIvyQENnfjzlLm8FI
	 vRwyLzf2P+EFg==
Received: by mail.fadrush.pl for <linux-riscv@lists.infradead.org>; Wed, 17 Aug 2022 08:05:31 GMT
Message-ID: <20220817064500-0.1.12.8acu.0.57z7d4jpgj@fadrush.pl>
Date: Wed, 17 Aug 2022 08:05:31 GMT
From: "Jakub Olejniczak" <jakub.olejniczak@fadrush.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Zwi=C4=99kszenie_p=C5=82ynno=C5=9Bci_finansowej?=
X-Mailer: mail.fadrush.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_010618_102914_17D48FE0 
X-CRM114-Status: UNSURE (   0.88  )
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

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGNo
Y2lhxYJieW0gemFwcm9wb25vd2HEhyB3eWdvZG5lIHJvendpxIV6YW5pZSwga3TDs3JlIHVtb8W8
bGl3aSBQYcWEc3R3YSBmaXJtaWUgc3RhYmlsbnkgcm96d8Ozai4gCgpLb25rdXJlbmN5am5lIG90
b2N6ZW5pZSB3eW1hZ2EgY2nEhWfFgmVnbyB1bGVwc3phbmlhIGkgcG9zemVyemVuaWEgb2ZlcnR5
LCBjbyB6IGtvbGVpIHdpxIXFvGUgc2nEmSB6IGtvbmllY3pub8WbY2nEhSBpbndlc3Rvd2FuaWEu
IEJyYWsgb2Rwb3dpZWRuaWVnbyBrYXBpdGHFgnUgcG93YcW8bmllIG9ncmFuaWN6YSB0ZW1wbyBy
b3p3b2p1IGZpcm15LgoKT2Qgd2llbHUgbGF0IHogcG93b2R6ZW5pZW0gcG9tYWdhbSBmaXJtb20g
dyB1enlza2FuaXUgbmFqbGVwc3plaiBmb3JteSBmaW5hbnNvd2FuaWEgeiBiYW5rdSBvcmF6IFVF
LiBNYW0gc3RhxYJ5Y2ggS2xpZW50w7N3LCBrdMOzcnp5IG5hZGFsIGNoxJl0bmllIGtvcnp5c3Rh
asSFIHogbW9pY2ggdXPFgnVnLCBhIHRha8W8ZSBwb2xlY2FqxIUgamUgaW5ueW0uCgpDenkgY2hj
aWVsaWJ5IFBhxYRzdHdvIHNrb3J6eXN0YcSHIHogcG9tb2N5IHd5a3dhbGlmaWtvd2FuZWdvIGkg
ZG/Fm3dpYWRjem9uZWdvIGRvcmFkY3kgZmluYW5zb3dlZ28/CgoKUG96ZHJhd2lhbQpKYWt1YiBP
bGVqbmljemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
