Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF318C52D7C
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LZFmuGGUG60nD/NtYDiT4Ytz8e0hOd6MrdNTVuAZ+1I=; b=vOso++0INypZZ/
	bEQa1jM3D1eVACbScLzbCmdnXYcPhlF2eB+7JogM8D44qbq6b9dKaeevoH7FNUJ8HHuJQOcJVivFY
	gQiSsIPCCs1q6usdy32mowyz9ZNHsA4bBLYMnrI/kaI9fTXzJUXoQgES0PvtifMSAwrqTioBgLQfX
	lfdkryauEKInHtB9Wgyegk4OxzMCzbMdVoFT7jxigk9DbvPvhpoaGOvfHEim+vjUdbXh+Q42ApC0U
	mgdJBlxYi5G9AsQ8xIl2pyEdoTEQsSRFAnsS1T+ZzzldOqhCteN4D3FQJI24+9Y3tFl+dtdfmhwBc
	waAkzL5Z0CTxDwxrg1Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmT4-00000002oMZ-2q22;
	Tue, 13 Aug 2024 08:01:22 +0000
Received: from mail.widebizscope.pl ([51.77.245.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmT1-00000002oKp-3ZPH
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 08:01:21 +0000
Received: by mail.widebizscope.pl (Postfix, from userid 1002)
	id B34A12472F; Tue, 13 Aug 2024 10:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=widebizscope.pl;
	s=mail; t=1723536077;
	bh=7b2Hseb9QY/049WYSH5jOQc1GsDAtRo2MBj6O2PAhWg=;
	h=Date:From:To:Subject:From;
	b=CAVWeDGLzvQPGU6E6eQjfsXiEdxdYlO0G3/31qowbRdKKGXKar8BaL6RVL1OQHgWT
	 KGRyDmaO2648Nqly9hlgMkL1TXZaEeF4TXDyE+7pv8jz0ldaMHFXP8EwesIL69ggOs
	 PXowVVYNgDCfirYrCmtCNvG8LW6dtnXd5a9e5jFDv9ffOKE1Dd9gs+lSR7IlOkSdl2
	 aDSe121VFrl0NOKygG3unGHLdrcawXYxw0f8yZoRRgQHuAJJsaxAg4CHhFFCfNiPXc
	 gxfm9drlxFTco4ldssbbkdHyVzDDvu8TgAxGgczznkxZC1q5fJUtRJbJcLbhw//cJO
	 5L3VZryW6ql2Q==
Received: by mail.widebizscope.pl for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 08:00:44 GMT
Message-ID: <20240813084500-0.1.d2.rmdt.0.en48tiyso6@widebizscope.pl>
Date: Tue, 13 Aug 2024 08:00:44 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@widebizscope.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Faktury
X-Mailer: mail.widebizscope.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_010120_196348_031A750E 
X-CRM114-Status: UNSURE (   0.06  )
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

U3phbm93bmkgUGHFhHN0d28sCgpDenkgem1hZ2FqxIUgc2nEmSBQYcWEc3R3byB6IHByb2JsZW1h
bWkgcMWCeW5ub8WbY2kgZmluYW5zb3dlaiB3eW5pa2FqxIVjeW1pIHogZMWCdWdpY2ggdGVybWlu
w7N3IHDFgmF0bm/Fm2NpIG9kIGtsaWVudMOzdz8gCgpOYXN6ZSB1c8WCdWdpIGZha3RvcmluZ293
ZSBtb2fEhSBiecSHIHJvendpxIV6YW5pZW0sIGt0w7NyZWdvIHBvdHJ6ZWJ1amUgUGHFhHN0d2Eg
ZmlybWEsIGFieSBzenliY2llaiB6YW1pZW5pYcSHIHd5c3Rhd2lvbmUgZmFrdHVyeSBuYSBnb3TD
s3drxJkuCgpKZcWbbGkgemFsZcW8eSBQYcWEc3R3dSBuYSBuYXR5Y2htaWFzdG93eW0gZG9zdMSZ
cGllIGRvIMWbcm9ka8OzdyBmaW5hbnNvd3ljaCBwbyB3eXN0YXdpZW5pdSBmYWt0dXJ5LCB6YXBy
YXN6YW0gZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpTemN6ZXBhbiBBbmRyeXN6Y3p1awoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
