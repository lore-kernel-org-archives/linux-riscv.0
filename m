Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47FA9C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 16:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w0iNCQzLqrJFBHAeSAWfDu+fyNa+whkg4LPVrP79HH0=; b=I4EMXS+MCg/oBc
	KUvJLZllUZfgCUbFMS8lIn+Br5zUv4u6N0pCGjdk0DZDCXl9wwuoOUcn8OaN9GzaQxXbOvWSCUDEa
	VgJ6/fcobx5idF44oHqzcMLH8BgHYagk9j0waiX0Kph/c7HDFrtZyNfDATEchyF32nw5boJr4A6RH
	iYmnrMW1NRSH/pQbFWfVEM6TFxCcu98wJ8qXe5Oe9SoJlOeo3krLdNrOxHkmNkWu9AL6SiIP7Kxjz
	Hprj+Ry/hXGHXSu4KaWgXQWqFFd0dw6mmt4/oaQ8KnZgdONcqgGsoWn8fGQd37caRkx5RmvvoJ6WK
	NO3Ku4d1P9zz4IEOlF7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4If-005MF6-DE; Fri, 18 Nov 2022 16:33:09 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4Ic-005MDJ-Ud
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 16:33:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F326CB82404;
	Fri, 18 Nov 2022 16:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635B1C433D7;
	Fri, 18 Nov 2022 16:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668789183;
	bh=IqJQioZejkz3+H/MmRXx03w8XCPGGVBE8BoNHDB2CUU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k6aozHSqaYzjE8vFZuM9O6ILZ+bQjKOs0Ov93IaP1Fi7+9P7DyKseki3P2GeA8gYi
	 TSvl1umtkrmKZcgNUDHAJmPYMfIBBwD8mMsl1X5nsseOtq29p05jhYbTCvvZwbnBat
	 jlrnfJwgXLwWBWwnudfPa3Pkf4tHkKOKQaI8s12gOsdPhzRK+JuxXZDDcbOKLIo8OJ
	 gsBTCPiuFDs25CmHcFdZCtI7dc25vwdRDs65C+iGToQVAUwesTrphdfAE3lycZJJDN
	 sHFCucTv+I1T6nDDwbRP/CGoc3N4u+Kvre8CCpgSZNnpcPhQmGPlnJ089qtZpapoSr
	 NJfN23OGk7hxw==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, Alexandre Ghiti
 <alexandre.ghiti@canonical.com>
Cc: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Jonathan Corbet
 <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: riscv: Document the sv57 VM layout
In-Reply-To: <da4eaceb-9561-4744-d3c9-459b6a70783f@ghiti.fr>
References: <20221031180230.1420544-1-bjorn@kernel.org>
 <da4eaceb-9561-4744-d3c9-459b6a70783f@ghiti.fr>
Date: Fri, 18 Nov 2022 17:33:01 +0100
Message-ID: <87r0y0rznm.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_083307_186272_6ABAE121 
X-CRM114-Status: UNSURE (   6.68  )
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

QWxleGFuZHJlIEdoaXRpIDxhbGV4QGdoaXRpLmZyPiB3cml0ZXM6Cgo+IFZlcnkgdmVyeSBuaXQg
YnV0ICIrNjQiIGlzIG5vdCBjb3JyZWN0bHkgYWxpZ25lZCA6KQoKVGhhbmtzISBJJ2xsIGZpeCB0
aGF0IQoKPj4gKyAgIGZmZGZmZmZmMDAwMDAwMDAgfCAgLSA4ICAgIFBCIHwgZmZmZmZmZmVmZmZm
ZmZmZiB8ICAgIDggUEIgfCBrYXNhbgo+IFRvIG1lLCB0aGUga2FzYW4gc3RhcnQgYWRkcmVzcyBp
cyB3cm9uZywgYW4gc3Y1NyBrZXJuZWwgcHJvZHVjZXMgdGhlIAo+IGZvbGxvd2luZyBvdXRwdXQg
Zm9yIG1lOgo+Cj4gW8KgwqDCoCAwLjAwMDAwMF3CoMKgwqDCoMKgwqDCoCBrYXNhbiA6IDB4ZmZk
ZjAwMDAwMDAwMDAwMCAtIDB4ZmZmZmZmZmYwMDAwMDAwMMKgwqAgCgpJbmRlZWQhIEdvb2QgY2F0
Y2ghIFdpbGwgZml4LgoKPiBBbmQgYWdhaW4gdmVyeSB2ZXJ5IG5pdDogdGhlcmUgaXMgYSBzcGFj
ZSBiZXR3ZWVuIHRoZSAnLScgYW5kICc4JyA6KQoKSSdsbCBmaXggdGhhdCBpbiB0aGUgdjIuCgpU
aGFua3MgZm9yIGhhdmluZyBhIGxvb2shCgoKQ2hlZXJzLApCasO2cm4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
