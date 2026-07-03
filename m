Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFD1C43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUfaC74S+41UUF90CumBQ512tTQGPScrJQsRAkkBM24=; b=jDJ2LfVyMAhj7c
	Qq/13oFUxwlt9lz4EKHK5+7aN43zcZLT+KviQ6kfpPE8nc1S6jUUmUw2vxHKUjB/twBKV8l7dAi35
	IXtaBS0s9CITJn80iaZOMhQJnbK6DM2V6uG7ZroD6lgilgYj7Muo2z/lrqINzeeN8KsZlWOCyy0Bc
	QoIDYcIZ0H2AEEvBm0PywIGRU42+/1Owl59n84D4B2s9pYgT/S83ZUZFZn5yJQEYDTioBX5F66etV
	X40lIgjjrmqspn0mq270UTiHluPwLwZd1K9p/bDXMwCo2AKpY+hH7Y+c0Wec5/lYQRfr5tenzgdVQ
	Zid1hqym71xZvnJeKoZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffMx-00000007LJg-2hxo;
	Fri, 03 Jul 2026 14:59:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wffMw-00000007LJL-1E7n;
	Fri, 03 Jul 2026 14:59:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 63C6C60051;
	Fri,  3 Jul 2026 14:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02D9A1F000E9;
	Fri,  3 Jul 2026 14:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783090793;
	bh=iszMYG8/GDwOkWSLEKylfXpVUW/SGclSH7eygKWPKWU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=A42/s2/bFtKZ/AeyCtaD8M9riPQcpeAsT9Vo43MfiHhG9F1WIggDSFAJtzJAhb3tw
	 Kt4BoIupfmnqE+pDq0X3gliBgR0dXKNsjzgNQ0+tlHw7iS5oEdPvtcclnRGCGWN0/z
	 PDCB0OGy/uIIJ2o5wLDopD4zn5t0Lj7vDyvcqDwaY9p1I2nfrgmFcPgBFOUr50Tjz2
	 w4j6hBfSEoSmi+Wjcl+uDsONz/6TmdHORS4hA6hbG74zd/ckVMwUIrk8a8WjHdtw98
	 s45DWSJPWyzYbiF8YGfAIrZcTHo2Rw6iEDbdtbQ8Y9YBFviXKver4LJunF9elKaCWc
	 pa2Om15Jdy65g==
From: Pratyush Yadav <pratyush@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Tao Liu <ltao@redhat.com>,  linux-riscv@lists.infradead.org,
  kexec@lists.infradead.org,  linux-integrity@vger.kernel.org,  Albert Ou
 <aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Paul Walmsley <pjw@kernel.org>,
  kernel-janitors@vger.kernel.org,  LKML <linux-kernel@vger.kernel.org>,
  Baoquan He <bhe@redhat.com>,  Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>,  Eric Snowberg <eric.snowberg@oracle.com>,
  Jarkko Sakkinen <jarkko@kernel.org>,  Mimi Zohar <zohar@linux.ibm.com>,
  Nutty Liu <nutty.liu@hotmail.com>,  Pratyush Yadav <pratyush@kernel.org>,
  Roberto Sassu <roberto.sassu@huawei.com>
Subject: Re: [PATCH v4] riscv: Prevent NULL pointer dereference in
 machine_kexec_prepare
In-Reply-To: <5df82d42-89cd-4e39-95a9-a0f164c0ac58@web.de> (Markus Elfring's
	message of "Fri, 3 Jul 2026 16:38:09 +0200")
References: <20260703111530.91285-2-ltao@redhat.com>
	<5df82d42-89cd-4e39-95a9-a0f164c0ac58@web.de>
Date: Fri, 03 Jul 2026 16:59:48 +0200
Message-ID: <2vxzqzlkf7a3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

T24gRnJpLCBKdWwgMDMgMjAyNiwgTWFya3VzIEVsZnJpbmcgd3JvdGU6Cgo+PiBBIE5VTEwgcG9p
bnRlciBkZXJlZmVyZW5jZSBpc3N1ZSBpcyBub3RpY2VkIGluIHJpc2N2J3MgbWFjaGluZV9rZXhl
Y19wcmVwYXJlKCksCj4+IHdoZXJlIGltYWdlLT5zZWdtZW50W2ldLmJ1ZiBtaWdodCBiZSBOVUxM
IGFuZCBjb3BpZWQgdW5jaGVja2VkLgo+IOKApgo+Cj4gV291bGQgaXQgYmUgaGVscGZ1bCB0byBh
cHBlbmQgcGFyZW50aGVzZXMgdG8gYSBmdW5jdGlvbiBuYW1lIGFsc28gaW4gdGhlIHN1bW1hcnkg
cGhyYXNlPwo+Cj4gV2h5IHdhcyBzdWNoIGEgaGludCBub3QgYmUgdGFrZW4gaW50byBhY2NvdW50
IGZyb20gYSBwcmV2aW91cyBzdWdnZXN0aW9uPwoKT2ggY29tZSBvbiwgdGhpcyBpcyBhIHJlYWxs
eSByZWFsbHkgbWlub3Igbml0cGljay4gVGhlIGZhY3QgdGhhdAptYWNoaW5lX2tleGVjX3ByZXBh
cmUgaXMgYSBmdW5jdGlvbiBpcyBmYWlybHkgb2J2aW91cyB3aGVuIHJlYWRpbmcgdGhlCnBhdGNo
LiBJbiBmYWN0LCB0aGUgZmlyc3Qgc2VudGVuY2Ugb2YgdGhlIGNvbW1pdCBtZXNzYWdlIHVzZXMg
dGhlCnBhcmVudGhlc2VzLgoKU28geWVzLCBpdCB3b3VsZCBoYXZlIGJlZW4gbmljZSB0byBoYXZl
IHRoZW0gaW4gdGhlIHN1YmplY3QuIEJ1dCBubywKdGhpcyBpcyBub3QgYXQgYWxsIHdvcnRoIGFu
eW9uZSdzIHRpbWUgdG8gZml4LiBDZXJ0YWlubHkgbm90IGF0IGFsbAp3b3J0aCBhIHY1LgoKUGxl
YXNlLCBsZXQncyBub3Qgbml0cGljayBvdXIgY29udHJpYnV0b3JzIGludG8gZ2l2aW5nIHVwLgoK
LS0gClJlZ2FyZHMsClByYXR5dXNoIFlhZGF2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
