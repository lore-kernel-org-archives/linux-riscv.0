Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455EDC7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 07:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=pP+JXu9AxPpXz0
	YrSEbmP7EjhgYlBtPK0zzzAhFQIK4Ev1+TX3cBFYXnQUznyH8MD4kLIR+EHmp4Hb8N9njk4hSiVCk
	JXtSaMM/Ktt99t6JQ9pYZTddt0jO5yjeW8edaCSJxsNOMoJHvO5pjep7JTq9pieKRkWXA7JlPkPdU
	h05uzTKpH+U9G9c54QqxCtuDkwiYzoQIukOMwreoUPRt3o/Rob8uASv/Y5UXCTDvmw/VF01WPGBso
	WX/lCJoGWnPtT4gQ3aQoxn8+VYtRY2Pm1Jk5sCi0A+xgtSNo12B6T1q0O7YPYQjb8x7dFc1CuDBQT
	o/Mv2++bmICqmXazI2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8dx-00Gl81-32;
	Tue, 11 Apr 2023 07:42:21 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm8dv-00Gl6I-0I
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 07:42:20 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 9E9EC836B8; Tue, 11 Apr 2023 08:41:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1681198909; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=n2wBzl4V0ULsRQYwIXbAW77zW2klsb/hHlkNfHFdmX12QnN2KPcCh8FDioLDBvz7U
	 UEWrKSOPAmAwaSH1OlW+JcOCWrdD/rm+Ua39nh++G/a/6Fxv4jSrtN4Lapd9woC2oy
	 6ef+0EPaAYVkzeDXUVPqREkhnLl8LzC+TxCTIUQKzi7K+KoXG1VZQ6lpaGStDSMJre
	 DP1/0itSBuyKbAiXLonHou9c0oAdBaZSJ6toP5ogWgpYZJX3OFx++h1eSg2fd6fSrV
	 4P3g+1erkK/azVsC8yp81Xj4EHovYSoF9Ih2Imp+mScvq8wA1LmLbah8klaFT4o6+x
	 LcJ7XIZE0NHqA==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Tue, 11 Apr 2023 07:40:45 GMT
Message-ID: <20230411074501-0.1.58.1tiuy.0.9gfrpmojw4@lokoho.com>
Date: Tue, 11 Apr 2023 07:40:45 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_004219_268281_0CD894D3 
X-CRM114-Status: UNSURE (   1.27  )
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
