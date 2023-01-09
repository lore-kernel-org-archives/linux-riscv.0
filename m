Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EE5C5479D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 08:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=SFByLzlESmi2vK
	z4z5W9TjuIsLwiLPimWycYSNk3ObfxRYBs1NQ9CIZLntbdgsVuLWcAQv8X/mxhaJ1JTLRZxHejB/V
	X0E2Ike9keMmQt/dwYDVOv3gBRLhwTy6lz8rB5OgpGfXzLH4nT3sQIdxKIMWoftWcLgECeCace6zh
	arHmIViG8Hw3kBqJuEQh+QGVzcr771AuuNty7MRwsWN0QlNx1LImKLbLGcWxVIJY629b7vMFz4Zjd
	/lhkuJFtwM5E6GVYE7+jT8TaJmL5FPL81X1xdctyRqeE3GEXwAx7f0ZfnC64C9rkTkgd1dfKBbPT2
	DPQ5aWVVakpgdU+7yhxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEnjE-000RJl-CB; Mon, 09 Jan 2023 08:42:00 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEnjA-000RGS-DF
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 08:41:58 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id E46248410E; Mon,  9 Jan 2023 08:41:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1673253713; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=UIXMv5wRY3YjqKJlvg6jbP9NxwHw0gxbFeZo0fatSpTwJiM6uwM++gBQV9YsNdKhR
	 +WV2z8hxj9KQ5s9TR0HhYxpMszp/jQDLdpr8NIq/HWtsZrGQQJSmXWolrZ062B7/yx
	 Lqx7lxkIYBOGBNXStPUz5YihGboil9GkWcqEmhZBYj7JsFKRC8PkbyIGYLWEAFRkuT
	 KDK9J18j937d5o7Kojqt8mOOwfne06s5MXhV0BYdMkDFJ5GSPCZUjCOq6y3hWHBomJ
	 ZZEzJ03cPMkIpHfWHqVc2xyy739xoKHZcwzP/cM1yEDb8EwUI+q566e7/w30zX3sUN
	 ZQstLP/8bGVpA==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Mon,  9 Jan 2023 08:40:48 GMT
Message-ID: <20230109074502-0.1.3a.kon0.0.qskfpnbgx6@lokoho.com>
Date: Mon,  9 Jan 2023 08:40:48 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_004157_263555_66288856 
X-CRM114-Status: UNSURE (   1.19  )
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
