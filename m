Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA50ECA0FFD
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 08:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLVVffkel8TCbV217bei1tqcmpXdrln0FKnfGrgzIRE=; b=LLVU1faH7oStZ0
	TIhTeLgPNGGXOUxhqDwwznoffFI1NlV3TLfOXk2TkCagxsxa3tyPEO1ctqAQGR7W00ZwTyOh3ULZ4
	ye4fK11Ck3Z/Mdz9FADtWiqfxOLgVIMbV/z5Ho6Y0xzN/9sivFf/JVYIiovK1fiUHeJNSp0khTcG+
	hNwan6I2kV0mmSuRraqemA4cH+xG2r7RAOu5JXjxSARP8tzLSd7OAZAPq7sYV4hT67jPkUdPpcjwL
	ud7YtRSOcYgTnsqKkN8QHYgjF744uNQHjKuV6hv1Yq48zNekT5PaV1RA0KrZJ+iEcRSNhDTzXwFIe
	BUeswRNHv+qZKAsRlzGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszc8-0000000BXY9-2TFv;
	Mon, 01 Sep 2025 08:10:08 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszRF-0000000BVMp-2DAn
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 07:58:54 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 68F0B28037; Mon,  1 Sep 2025 09:56:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1756713390; bh=h3k5zkAZf6tEpPtEQC0QHe2u0TTQ7ZFRjUanCKLrdLo=;
	h=Date:From:To:Subject:From;
	b=JgColI5OqRYZsR3QrGv07sF/WINHCOIB+x2eoMP4VLB8T5DXZiIGnUhaqn9iel1bP
	 ExivGyGHgGca22ixBIlAYG2wjJTQHrmnNp+y3/DNRCA43E2gyTl1vVlV4UDakzOGFq
	 CjOEsSDgFAa/vXwlfF14W5Fyr2bDixLw/d/eRWJFUIznyeZC3gG+CjxdSpxtyaaEUO
	 95qrk7C/cpeMEN2lae1/JpfgoRuYG1nJDgWFTw7r4t6DFOFvAjNXh+3xVmommB8uJT
	 0Nz45lxpHuohNNTh0oZUtvwFgLBTICIcMbhiPNEZTeItnITLjwmdghee/GOTx440eY
	 ghSVJGWBTUOVA==
Received: by mail.biznator.pl for <linux-riscv@lists.infradead.org>; Mon,  1 Sep 2025 07:55:57 GMT
Message-ID: <20250901084501-0.1.je.1pe2t.0.f8lfhb69mk@biznator.pl>
Date: Mon,  1 Sep 2025 07:55:57 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_005853_848459_C5E151EC 
X-CRM114-Status: UNSURE (   1.07  )
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

RHppZcWEIGRvYnJ5LAoKcG9tYWdhbXkgbWlrcm8sIG1hxYJ5bSBpIMWbcmVkbmltIHByemVkc2nE
mWJpb3JzdHdvbSBvYm5pxbx5xIcga29zenR5IGVuZXJnaWkgZWxla3RyeWN6bmVqIGR6acSZa2kg
bW9udGHFvG93aSBpbnN0YWxhY2ppIGZvdG93b2x0YWljem5lai4gCgpBa3R1YWxuaWUgcHJvcG9u
dWplbXkgYmV6a29ua3VyZW5jeWpuZSB3YXJ1bmtpIHdzcMOzxYJwcmFjeSwgb2QgcGxhbnUgcG9w
cnpleiByZWFsaXphY2rEmSBhxbwgcG8gc2Vyd2lzLgoKUHJvc3rEmSBvIGluZm9ybWFjasSZIGN6
eSBtb8W8ZW15IHByemVkc3Rhd2nEhyBwcm9wb3p5Y2plIGRsYSBQYcWEc3R3YSBmaXJteT8KCgpQ
b3pkcmF3aWFtLApXb2pjaWVjaCBNcm9jemthCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
