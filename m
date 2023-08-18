Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F158C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Aug 2023 08:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uHf9BqC9UVCsqPUUU4TL5yG0huDnx9sNerB/Nh3w7gI=; b=HAx5sQQRJdYpcP
	TOjJdwgaF2nZt3bLEX8lqtJb+wRUPzaWwClrsCbqDgXZ0mnS59QFI+g/l/ZrQDLlU7raIhdZNUbtC
	KFVS0KMJCMx+bDz5FpGGxpnHKVWh5GvQ0c9oS2M/mQOWfhg4TzwVY3tJv0merijbrGR2GvNfw0UIZ
	4yIMlod/6rChiq5gH64/r8wK1VyqQYxH/InCslXvszbLHtFKkVGNS8MnB6Z/O+hjJ/stnDLTBCB3X
	nskGNxtlSGGfKoEAV6NA4kdXFAD7QpqwTxAaExi9vjtpdAh3hQKJHiLVfu2sW4rBIx4gvW5oBKUWX
	QnaG8fb9Ndg+kYkZoZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWugh-007ysH-0z;
	Fri, 18 Aug 2023 08:18:31 +0000
Received: from mail.leachkin.pl ([217.61.97.203])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWugd-007yqT-1D
	for linux-riscv@lists.infradead.org;
	Fri, 18 Aug 2023 08:18:29 +0000
Received: by mail.leachkin.pl (Postfix, from userid 1001)
	id 7C4B68437C; Fri, 18 Aug 2023 09:16:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leachkin.pl; s=mail;
	t=1692346589; bh=elHzctRz/z3PfTIhGYJKd0TeBTmca98Y+JNgX4gfsPI=;
	h=Date:From:To:Subject:From;
	b=b+pZwqHUBQq839PNDf4Hr7pQ+9NBWLqKQwZW4u4IqyTe8pfLcfEevChL5L7Lq7CRT
	 HGl1qbpR1zZLjqyecn1Vm3YVpgFjD/QTV++VdcqvGUo84FgqQnU0V1eB3bUdEu2Cw6
	 0TIl47s4+IPb1u50+LWxuQQg2nZJTLzEmohaBm3FwuEnNudaEbknIYVvq58fSf4eiu
	 1ZNQJ4u6hdLKzkd571Je1chKt7S9NSKXkm5XlfPU4aZNAeh3ieezMH5StlqUmaKguE
	 6kNp8Z4Zm3amLbcu6/maWI9iFn//5nl1tYpKwQNMUx8nWZyS/M5rKyLUXgx0/Fhq/E
	 uw85Ik3y+Acmg==
Received: by mail.leachkin.pl for <linux-riscv@lists.infradead.org>; Fri, 18 Aug 2023 08:15:51 GMT
Message-ID: <20230818074501-0.1.4u.cu1l.0.33q70ienpx@leachkin.pl>
Date: Fri, 18 Aug 2023 08:15:51 GMT
From: "Jakub Lemczak" <jakub.lemczak@leachkin.pl>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d?=
X-Mailer: mail.leachkin.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_011827_620996_B5D0FE7A 
X-CRM114-Status: UNSURE (   1.42  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGludGVyZXN1amUgUGHFhHN0d2Egcm96d2nEhXphbmllIHVtb8W8
bGl3aWFqxIVjZSBtb25pdG9yb3dhbmllIHNhbW9jaG9kw7N3IGZpcm1vd3ljaCBvcmF6IG9wdHlt
YWxpemFjasSZIGtvc3p0w7N3IGljaCB1dHJ6eW1hbmlhPyAKCgpQb3pkcmF3aWFtLApKYWt1YiBM
ZW1jemFrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
