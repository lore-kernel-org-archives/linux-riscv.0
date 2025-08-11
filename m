Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AE6CA0EC0
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLVVffkel8TCbV217bei1tqcmpXdrln0FKnfGrgzIRE=; b=220zTV6pxuw2W6
	gjLzgRC5q7CExZtknQxf93HVsv8aY1BD/XKJNxiJwTFnomH6miZ7ahXZFB+rDroT8MGATR2M6yS10
	aNYMk17htJfK2e7SpY9ig2j9fueQYbihb1vmDTx3id7D1TFb5X7MqjLRAiFCVU+KKCaprdfA0WWDs
	2z2WX4Sklq6DQnAdeP7aRubv6DcPces4GjA489t3FXHA5vMEYvJmc7tVBOI8/u045k6WGAez5MtVV
	M3ZeDdUK2+TQHlU1qR+cgaea6T44Rlux1Gm8JPeRc6x0rZA6w/ujZzvdHV0w8bQ9TSqmsjymtmVVa
	0oxot6Jxn1HF6lk1PGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNrl-00000006qkY-3ofI;
	Mon, 11 Aug 2025 08:26:49 +0000
Received: from mail.biznator.pl ([162.19.205.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNS2-00000006mW4-3PDk
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 08:00:15 +0000
Received: by mail.biznator.pl (Postfix, from userid 1002)
	id 288652877F; Mon, 11 Aug 2025 09:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=biznator.pl; s=mail;
	t=1754899026; bh=h3k5zkAZf6tEpPtEQC0QHe2u0TTQ7ZFRjUanCKLrdLo=;
	h=Date:From:To:Subject:From;
	b=fdBmqwSubd6cULDccQkyTdeUCkvkdMMY/oLPg+NEcNg4o5BL0XK6o5BVBJgJ7SYkc
	 FDF9XN9cz44dXiB6dk+f6zhhJiWgVxrqRHZQFMR7SBzPzt6otoho+oB5F9hU8EhOWH
	 gJqhqlcNOZrtxmOx8fn1N+8jBI++VqFr/4W/ODnQIDEm18nt6+lTFh3cbAFvHwNw82
	 sCl5EGLW4o2SvE9FL0wX2YE47Fj5h0/BLYR0yh0x2KHgVRMqMx+XbWVERDAMrphSif
	 Leomv1No/BkPvgbv9iFQbCLgy5mnQ5Ws9t9y1Ly6NvDgTBqqRwQon4yjDOuZwuC9gu
	 bwJvfwI0vz8EA==
Received: by mail.biznator.pl for <linux-riscv@lists.infradead.org>; Mon, 11 Aug 2025 07:56:07 GMT
Message-ID: <20250811084501-0.1.iz.1h397.0.9pu9e50466@biznator.pl>
Date: Mon, 11 Aug 2025 07:56:07 GMT
From: "Wojciech Mroczka" <wojciech.mroczka@biznator.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.biznator.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_010015_000154_3554CABE 
X-CRM114-Status: UNSURE (   0.55  )
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
