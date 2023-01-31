Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C603AC636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 08:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oPgKr8Mwd3POUV9pjiBF2So9UBr0pai5G04sCA4j98o=; b=1t5mvFN/pLWbk5
	/ZwHTDoWtXSKbs2tBCSRrquCT5vEVAWn6q0WTAqvxkOuggLSgXpbCQSppxLWmmtahwqqK1qZhTpQE
	Yg9NpEx/LboeT/FhkU7FYB43Z+5DVMNuyPQa+uwSN1vh5dUWb+fRDbqmOoclbLc+FK0zQVE7nQUdB
	yJWM2QS1zhH/vg8Z/iFK/wHEiuwhXSdEwIb5ix4RFc/MClaBhsDMEaGekOkzSv2O/cqzV7Q2la2wM
	Pbq/C51beGELE4ssqh+lHR9LbZhmx2QgZpnpRNCy3qfnWs8+fwyXwz4rvuekZgdtEG9UTL8Qjc199
	vnLsSsEphuU6KnlPEJ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm4T-006jlr-UX; Tue, 31 Jan 2023 08:32:53 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm4J-006jig-Tf
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 08:32:45 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 6B77B837DC; Tue, 31 Jan 2023 08:31:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1675153962; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=J+wDkxOLDN/uVGjGl2N67BeitQhudP97Du6VQsQihlhi7ip+x/b3lKF6/dGkeSoz/
	 uUoCxq6/D/TbqfQzkofp/IBa99P7010vYwDHWEduazH+RwrfXLT3LgzPCJ8Vzi7o7h
	 2xFVuyheRKYRtvhqPKeo02vQDqX3OWhY1lfvn4qifmGIHUZ+Y6En18QMdjgu8h/pci
	 pWBw9pGHUblFasuB59WHnODhzz6QE5cNRGdELS6Q1HDMOati8xH07Xnaxj/A0vLs6x
	 b5gUdU1WsVDGIl1fKU7wvRWVyUNpJjPsahXnJ8YgUaNnNRIPlCCA4mwIsZGuhAz00c
	 aAAzIpT6HaLbA==
Received: by mail.lokoho.com for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 08:30:34 GMT
Message-ID: <20230131074501-0.1.3q.w0yc.0.ki12cm4vt0@lokoho.com>
Date: Tue, 31 Jan 2023 08:30:34 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-riscv@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_003244_099726_A0E9466E 
X-CRM114-Status: UNSURE (   1.26  )
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
