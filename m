Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556B6C5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 07:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LZFmuGGUG60nD/NtYDiT4Ytz8e0hOd6MrdNTVuAZ+1I=; b=ES31pZXVZzkFOh
	QSZTTOkV9ZePY+Xfz/2EktO6H2s1qJh/z7BV+xMV6/+9XFc8j0jMtdibA14LvaZtqzZL9+wbivGPe
	/ez7iAZA67KQNIktOxlVcuaHJS+pSR7Eope6OFzYDxgy1Gc+bK1ng99QJkneLRoGVVIyRKJzoJXI3
	M7959DBT1KQ+koJyxiKcGKIJkPWXJ/gseVXF8jypY1ikw1G9J4xSJdZ/DZlnkBeqSJl3L3vWEbdFc
	j4zhhFQQ31LzAC3nNEDVLeJBkRhni9NOueqRQ+QzhIeHjzuHgkEHa+s0cc2H3HB+3vEY5ih4o2tPC
	IkvQJpw9+bFyF5ktS0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDUP-0000000EOUT-1quE;
	Wed, 28 Aug 2024 07:53:13 +0000
Received: from mail.widebizscope.pl ([51.77.245.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDSG-0000000ENti-0FqE
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 07:51:02 +0000
Received: by mail.widebizscope.pl (Postfix, from userid 1002)
	id 70C93246E9; Wed, 28 Aug 2024 09:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=widebizscope.pl;
	s=mail; t=1724831454;
	bh=7b2Hseb9QY/049WYSH5jOQc1GsDAtRo2MBj6O2PAhWg=;
	h=Date:From:To:Subject:From;
	b=mTr+3cmQbjh0j5sSEr3jEH++qUvRG7xD9OAtVMdtBnQnGbtjoTv1J2cV8elYAGq6T
	 NL/7kIrTUCoC+wN2ZQXfNUfIp8U7jnkiCtXc6QBtB7VQYPrCk6fZqIsqpV7MWqSEZL
	 XJOf49t5pLViGIv6S7EVdcinZMXOs76zHLcfcBVzcz8qhiPlUkLzPOK/P/1Y2Q0YtS
	 YtoDGwVT22tvn1TlBujbh+OlkvHRrnKzHUk4ak5v9QiBRVPZEFuu7Y4BHNwQ6iMSks
	 yhaR2G5apuWKcts1zf60BKbp9JEk1/rnPUeddRXHpDyA0SSEpxQtNekbO2rluYOjCh
	 CWVcmJYBA7rZA==
Received: by mail.widebizscope.pl for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 07:50:36 GMT
Message-ID: <20240828084500-0.1.dc.rmdt.0.rjqjrieumd@widebizscope.pl>
Date: Wed, 28 Aug 2024 07:50:36 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@widebizscope.pl>
To: <linux-riscv@lists.infradead.org>
Subject: Faktury
X-Mailer: mail.widebizscope.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_005100_809255_CB4C9A3B 
X-CRM114-Status: UNSURE (   0.00  )
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
