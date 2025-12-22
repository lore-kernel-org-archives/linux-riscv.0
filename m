Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60086E6748D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 08:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WvWQhoSVwBWoWKRg+pJ9uRHrad1Y3rd8WvDDfja8RGw=; b=GKD0FMO/sqxb8j
	jPGqzk+G6dztGi/cyjoeIHnjcrdjyEQDza6zaiTVKb9rgBa3x11En29Ox3OXCoR9KY+tIRN+NSjQ9
	/8YPGg4pcGHkpccEgZmuJ8uOR1KtO/7VPCgYDcZFigdjHfXLykQw1i7GQ3Sx2MZCCUOxLQEy7u4Ef
	U0fk0LvL4q81Lcde4MBUkIobAAGzUgEMkoCmyGRqs0LyiQGgZyz+RcddyL+MsWCqsOs5oFCs8VZTc
	jAsFyOcC9sN/n8yGpftk/HmmI7BoQAfZFN+Bdqqp4vONPmm42gWZ50VnlGMgmJlHiz9Porg37/e4y
	Paqnp6b+Wrl66fq5FkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbjs-0000000DUMa-0hH9;
	Mon, 22 Dec 2025 08:58:00 +0000
Received: from mail.vexro.pl ([141.94.250.70])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXbjj-0000000DULH-3c8W
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 08:57:59 +0000
Received: by mail.vexro.pl (Postfix, from userid 1002)
	id C90D7A62AE; Mon, 22 Dec 2025 09:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vexro.pl; s=mail;
	t=1766393788; bh=rBf3jQVFnGCeJlMPbA0E+WWQIPnf9AfAJW4UEB5U3Ig=;
	h=Date:From:To:Subject:From;
	b=qlqLg9pGOx5z1SAc7tapfH2NxnluaKFpA+UBRu1YrKMw09UvMewVpcbQNAe9mvZyp
	 pIL7EEzXJfZUUVHsdnklrg1gYZMRXW/9i8UVXgUn1vvdBB3xwOCyuG8/KYaPG5LUMW
	 enVDKhojX98NP2tnf+Smb/ktBjOHXQqmS/oZRS9YrEPpfbVxSK2z1x7rAD7j/9c6qY
	 cYrW1ZmnyyppPrisO5Aftre+vh+5zfPaHdGcGdXTxT0gL702DkjKqBQfmswjlL3hmE
	 UkrMFO/Grp6lg/qUzS+MYPi1N17VIB855hFbcKvGDPBeUlUHIJYzMZoIh2PGsHM+Oj
	 SSCZQ8pOywy4w==
Received: by mail.vexro.pl for <linux-riscv@lists.infradead.org>; Mon, 22 Dec 2025 08:55:52 GMT
Message-ID: <20251222084500-0.1.pc.4si3j.0.ike9i1e8ee@vexro.pl>
Date: Mon, 22 Dec 2025 08:55:52 GMT
From: "Adam Drzewiecki" <adam.drzewiecki@vexro.pl>
To: <linux-riscv@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.vexro.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_005758_084339_83A6421B 
X-CRM114-Status: UNSURE (   1.37  )
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

RHppZcWEIGRvYnJ5LAoKY3p5IGlzdG5pZWplIG1vxbxsaXdvxZvEhyBwb3Jvem1hd2lhbmlhIHog
UGHFhHN0d2VtIG8gd3Nww7PFgnByYWN5PwoKRG9zdGFyY3phbXkgaSB3ZHJhxbxhbXkgc3lzdGVt
LCBrdMOzcmVnbyBlZmVrdGVtIGplc3Qgb2JuacW8ZW5pZSBrb3N6dMOzdyB6YSBwYWxpd28sIHN6
eWJzemUgcG9rb255d2FuaWUgdHJhcywgc2tyw7NjZW5pZSBjemFzdSBkb3N0YXcgb3JheiB3acSZ
a3N6ZSBiZXpwaWVjemXFhHN0d28ga2llcm93Y8OzdyBuYSBkcm9kemUuCgpQcm9zesSZIG8ga29u
dGFrdCwgamXFm2xpIGludGVyZXN1amUgUGHFhHN0d2EgcG96bmFuaWUgbW/FvGxpd2/Fm2NpIGx1
YiBiZXpwxYJhdG55IHRlc3QgdGVnbyB0eXB1IG5hcnrEmWR6aWEuCgoKUG96ZHJhd2lhbQpBZGFt
IERyemV3aWVja2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
