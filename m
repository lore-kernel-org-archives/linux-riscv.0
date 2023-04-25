Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E25FC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=a8gqNmoJevPuwE
	t23/l4Za9jajH5xm69F/TN4tG8nb83R0sW4/0Bi3EKmXy4IzAlREwkaUWJPkoABGneOq0FVtBkQ1g
	mLVK6OscTSqpHmri0pWzRxyI9XS9YPeJYrFA1bYuhcBhMTofE2/crb0VCSa6vUPzG4kRyE3V+yLYO
	0RYpCJJQmesQlzMl3C7QO56JsJjOwhnGc6eVsdDUiui86shFhWDu9C4CVuYn3zwto0PaVawm0tcaA
	dkQaY5RVZrq+k/LsfkUUFnBh7qtuJJA2a822ztso4o6F13Qt+mzDVanYme/AHKVRcbgSxhBXD6EU0
	NH9PsVFYbTg3SB5VbHfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prFEc-000gBg-1v;
	Tue, 25 Apr 2023 09:45:18 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prFEa-000gA1-25
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 09:45:17 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 414C182FE7; Tue, 25 Apr 2023 10:44:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1682415878; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=hIELVzIjZ8pPOHxWUoU8XD1o71IyUcev+Ub9gBA193AU4FdiDlw33btra3UqFw1zU
	 2s+z/sNQXO8Ml0NDMJbNuyu6doIOGYpZhsGEMZI5sn5r1oVzwFcsM+9kavObrsp4ZM
	 P+CNhnxet+QDZUgXxLyFGFA2YaRMXIBzWZytFvSYYDK85TQYh5yCujy00n9rSXQY7F
	 PpeeVZyTyhgoFSjmJlF+m2HDYJd1AiQd/zLL5sWMElML0wtsC3gEwSUWe3/tCOX7Hd
	 Rmq/RFH9gmyFc8stB4uSR+CUoNrTiHKMRA9tKkA8cvd+/DL0VpNqLCNLYM6gNhoRns
	 l6j399lu/tNPA==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 09:42:51 GMT
Message-ID: <20230425102243-0.1.5k.201bz.0.p1fcfh1g7o@lokoho.com>
Date: Tue, 25 Apr 2023 09:42:51 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_024516_842027_D116767C 
X-CRM114-Status: UNSURE (   1.50  )
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
