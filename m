Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40474C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=iURTFLWjusi1Z8
	+IJcTwezKtlXZQgvo+i+GpcVpgHGpsEF+kioWi5b3PO2Bk10PA8xN4b1gZ03o3sznkGG121Sjc9cT
	WJPeN9v3Vcc4pQNDxHK9PTPhNePvYGkppRApPiocEULvGRR1JXWSam5JzfHe0DRL2mC4B0iAti6Mp
	BhT3kO6fOXhwA3YhKGqeG2yscsAnpUnnf/6CNrzoQxGrwtkdMnmW0wAzS6XWHU0LOs0fZ8YmzMVcz
	heDcYwRMJJdl7QQQvl0kE7kxf+wMQri3M0+QLuYG2OnXTHBecPAmnoZ0yrb4OYEvn9/vJ/HXVqHsQ
	CXKanurdFjZ1qRFNktWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryEf-00DAs2-3T; Mon, 07 Nov 2022 09:16:05 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oryEc-00DApk-Al
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 09:16:03 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id A7E15829E8; Mon,  7 Nov 2022 09:15:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1667812557; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=IJjTJJ43F0L7vLwmF4RnRUn6zc9OPN61xaEQ4lFz6W+hQE8iAr4y2134lsZ23RcYs
	 cpgyu2W6Am2Y1m4IGKoFs/vQbe74gXtYpSVxfVjUJgXjg7ATMS3Dkkmsg0sTcX8e9T
	 g0ZgzgqS6emxpaYkhlytPkwDVe4PwrUsRg8JZNnGiMvNLsf1YQ82oPjNlqHNw6a8As
	 R3nyxiMqd40KieIfxAJNZM06lZGflFv3BYbPc8hM8GqVjWJp4sm5NGDlPZVNa2/pCU
	 msrPw4hki1/ggCZa96vXrcvNjwBlNrNy3443T4e4ngMKIaX7vtY97WOp6tTzg5hkfp
	 eyfAsME9FIvsA==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Mon,  7 Nov 2022 09:15:37 GMT
Message-ID: <20221107074500-0.1.23.5m5n.0.gp350lbw8r@lokoho.com>
Date: Mon,  7 Nov 2022 09:15:37 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_011602_530421_FE6BAC36 
X-CRM114-Status: UNSURE (   1.04  )
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

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
