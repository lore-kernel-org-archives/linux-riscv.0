Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF6AC6379F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 08:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=xJGO02gOEOmyt+
	/UmWlbsFZ8dx/toAgNbTnhhdhQNisz9RWrBW1yAs4861kcTwCjXhBt9a77sNhqy1bXxceoFX/AVIc
	nXqtd5DVOni6EnTmclh0dktI87xeayw8eqrWUzBiNfiurCYNOBX++3zEA7HV5rEC8bEYyyiuyvYC0
	2e32amls3wkh7dT8quC3QKD4YHLvupmfZ1cky0XjVXLjr9RGMqVYQV21Avi2GKZgb3AmvXmma3wUB
	luO+SlwNO9ETUB60wT0fEuZ4FciqzYy+Nin0wpQVe8aDolh3dGGgQnMSt/ygxP4qZGM8v2nvl9t+F
	Hb4909caO6HNRyAg52oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUO4m-0073cr-7Z; Tue, 21 Feb 2023 08:32:40 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUO4g-0073bj-KL
	for linux-riscv@lists.infradead.org; Tue, 21 Feb 2023 08:32:38 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 98CAD831C9; Tue, 21 Feb 2023 08:31:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1676968342; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=qT0aveOMrhSgqSSQdgr82FS/UngdAJdAXL2l3eQKvIpib1s3HHjYSe1bg+5ghn+VM
	 oGXU8VhTG4s2tf4tRfTTXu01BlmR7x9BlPMubQh+pn00aa6r+v2uOvLcGho7A4WroA
	 NnPfYrLoNiZ345AC7GXWvR29AWmTFiiHu5kfhNplF7yj9f+gyTlQs+bIPY57SbtP4+
	 ZEqMhZrYML6GHDRnaCOCdCgw4zim1JpXcj+fvFPuP6FPvFYuMSRW4Jij6mOH3E7N05
	 3HzsVr16kPxP14M/JYVoxBK+x4m1MVA/5lp2r0w2xWsxMBoC3UYZuHYZn34Yxs/anb
	 mV7ZM78QR4OQw==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 08:30:33 GMT
Message-ID: <20230221074501-0.1.45.15ssv.0.3lnbn4cqdz@lokoho.com>
Date: Tue, 21 Feb 2023 08:30:33 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_003234_920487_0AFDDA81 
X-CRM114-Status: UNSURE (   1.20  )
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
