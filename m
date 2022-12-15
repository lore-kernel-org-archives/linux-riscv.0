Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26280C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Dec 2022 11:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lihXvxCXsn1jo8lsW6rv5i8MkVJvoOrAukQYWz+FnX0=; b=tvqZ71si/6K2RV
	Qx4V78M2H+Iay9j4B6h+xB0QuHJQUH/fuw4fvM02TRoF6ULQMEVfeaMFJIZVNI/wp0QG56IcJHljM
	52LwXYDuGaWyZRLBaChrpPQbnJ2lq56qobfYw/h0KPnrf+tTWhvL8glCWzwwOVIDufCC4Px/XqhDN
	Z0H3LA7ns/zoJoJ3V2Xdeho9RcnnD3RInaM3ofo40UaSIZTTPVuP2WIsuu2DCht9e1y/lDZogGWBG
	+r3wyNMEClhYkRVCQ99nebg3QTJCDHjNU+FCkOfiSqIHvMIWmdDi3F+C8DFy3MtnFol/3HqRYVq5O
	UJS1NMWzPjnxWBCxG9zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5mRx-0091RO-0P; Thu, 15 Dec 2022 11:30:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5mRu-0091QP-SE
	for linux-riscv@lists.infradead.org; Thu, 15 Dec 2022 11:30:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8BC6061DA8;
	Thu, 15 Dec 2022 11:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CDEC433D2;
	Thu, 15 Dec 2022 11:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671103849;
	bh=Nhsq9EwuWdUHCHQ1oKOOCcbZzOAeZ9yikbOc2qNSucE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=S7/vajs7OQ829o5woYBdBs+p46PqaG896EX/Vmy0yKmoYKVVzh6a4ovDWn1PgvE3N
	 BN4MQoVbLQJuQPtI4SJR8/B9QAbqm4F4l1O/men0bD51plkQvAqsTgqt8vihrwj5Vj
	 6T95KO3NLIYDP8ubTe/bG8lssJ3CZ8GCqFcyIIxyqEopjkic/OMKn9E8LJAO9qVjy0
	 JoyMArXIuSnSlaKiyJ9ySHSg6usf3zBU2hQbaNIjoRE9JvVeoimVudjpmvAldf8Zzd
	 9B0Mq17n5/jCC0uS73mDJLG19UoY62B1jmCc23ETbmySfw0ZyUkHCXUhtjSZpj5lN8
	 ZdcMOkIqgo0zQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v2] riscv: Allow to downgrade paging mode from the
 command line
In-Reply-To: <20221215081948.1256610-1-alexghiti@rivosinc.com>
References: <20221215081948.1256610-1-alexghiti@rivosinc.com>
Date: Thu, 15 Dec 2022 12:30:46 +0100
Message-ID: <87359ggazd.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_033050_979537_8C2E7FF8 
X-CRM114-Status: GOOD (  11.28  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cml0ZXM6Cgo+IEFkZCAy
IGVhcmx5IGNvbW1hbmQgbGluZSBwYXJhbWV0ZXJzIGNhbGxlZCAibm81bHZsIiBhbmQgIm5vNGx2
bCIgKHVzaW5nCj4gdGhlIHNhbWUgbmFtaW5nIGFzIHg4NikgdG8gYWxsb3cgYSB1c2VyIHRvIGRv
d25ncmFkZSBmcm9tIHN2NTcgKHRoZQo+IGRlZmF1bHQgbW9kZSBpZiB0aGUgaGFyZHdhcmUgc3Vw
cG9ydHMgaXQpIHRvIHN2NDggb3Igc3YzOS4KPgo+IE5vdGUgdGhhdCBnb2luZyB0aHJvdWdoIHRo
ZSBkZXZpY2UgdHJlZSB0byBnZXQgdGhlIGtlcm5lbCBjb21tYW5kIGxpbmUKPiB3b3JrcyB3aXRo
IEFDUEkgdG9vIHNpbmNlIHRoZSBlZmkgc3R1YiBjcmVhdGVzIGEgZGV2aWNlIHRyZWUgYW55d2F5
IHdpdGgKPiB0aGUgY29tbWFuZCBsaW5lLgo+Cj4gQWxzbywgYXMgdGhvc2UgcGFyYW1zIGFyZSB0
cmVhdGVkIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJvY2VzcyBhbmQgd2UKPiB1c2Ugc3RhbmRh
cmQgZGV2aWNlIHRyZWUgZnVuY3Rpb25zIHRoYXQgbWF5IGJlIGthc2FuIGluc3RydW1lbnRlZCwg
d2UKPiBvbmx5IGVuYWJsZSB0aGVtIGZvciAhS0FTQU4gY29uZmlndXJhdGlvbnMuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+CgpSZXZp
ZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
