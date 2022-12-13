Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3E3C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Dec 2022 09:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=TaVpwYzF+8Z0Om
	wo8ZQLzN2qEUAo/D8pv2Wymw8A2lliAe0ZzkAlZchi/itp8ldEvBY2ok/yfWVxTxSJYQXhJkcfVpc
	9i+GlNGQDAPB3XkZGTFP+TCNgoaceDaKeBky9jZ84VYyI8mNsMcb9ierNJ4XjEgK8WYW5NGfGxHA5
	68gCWKPPNyeW4CtNReTUP4RjB21zA3m7lkj4/TP6j2SmPAJA6l2Rqmbz1VoH8tRmsjA1dARtRTtOx
	KuPC2U9HU7Zj6Dl/3+uyfzlkLZxiqryBcq8zrcSbIeG4R6Ty895S7euT9XewnL3zTo5x1cWeVwbGn
	sFMzb2AJTBeuozM2WBlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51SM-00EKmz-Am; Tue, 13 Dec 2022 09:20:10 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p51SJ-00EKgS-9X
	for linux-riscv@lists.infradead.org; Tue, 13 Dec 2022 09:20:08 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 706A786322; Tue, 13 Dec 2022 09:17:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1670923120; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=abM9b8YJfopcdhfFN9zpSUzbd9zn00VPhMDatVYKGhS/Uocw9vudyXFAer7RlYLDf
	 pv0BkdMdUHR1R0RJ//4E8Hnv35OxURt8SAoOhOPdxAtMdYBEXHcXIM8gn6IeUvGpA/
	 LSymPyz1wuK0EF4hKD4Gh+HQMAzwxaV21XlZPoUeQ2GOc2O7Xo6Z7a16fdMao1wUMU
	 ugYroptdlayj1pRVQ+wsqZQPlj3bjfI0NMlPq8+07+fUxI4jUfxMB177oAmZv2I5iY
	 HI2r8IeSKQGlRZ0M7g7mg3W1MKffc76qYjBZjdFRXawhqu0GaqIQr822IoI3UXKkHT
	 ergRQLN678EzQ==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Tue, 13 Dec 2022 09:17:13 GMT
Message-ID: <20221213074501-0.1.2s.95b2.0.qyxrvnodfj@lokoho.com>
Date: Tue, 13 Dec 2022 09:17:13 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_012007_594174_AD543243 
X-CRM114-Status: UNSURE (   0.79  )
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
