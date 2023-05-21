Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B20FC77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 05:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mk53BZ7HYwRjtLkCrcFiqe7wIZ3MOHkxHajM1+Gsoak=; b=u0dK4LzHb/hxOD
	zZ76KDjQFy3EsVvc6VgJHIGP7RhRtmUnFakOOTAD4IAq2FAzFpH28I5XqdoDt47cBoyJ/jNZNeCo9
	2N0gETeqhMkZ9P0U6FsEgiTbeOzPZGdAOu74eklqxIsQwnr/vbOpM8WggXapDEBkDWIu6iRcXJ5zO
	SzXK+wmfLZcuv7WalyzIU0870vk9bma26h7cAIxo4njPqC6iBD222tIH3XftuhAbAQroMFFi60IVj
	otnkMJtuNqZYnDLVbvYpOR4S/S1rd18FhXIq7ft1X0/36eOFkxHJ7pxgQUVUkq7cTWmzVeNEUgRqj
	sEk0tJCcqQ1vcdpz1o0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0bm0-003BQm-1V;
	Sun, 21 May 2023 05:38:28 +0000
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0blx-003BP5-0k
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 05:38:27 +0000
Received: from localhost (localhost [127.0.0.1])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 58B8820A1D;
	Sun, 21 May 2023 08:38:15 +0300 (EEST)
X-Virus-Scanned: DNA Internet at dnainternet.net
Received: from tulikuusama2.dnainternet.net ([83.102.40.151])
	by localhost (tulikuusama2.dnainternet.net [127.0.0.1]) (DNA Internet, port 10041)
	with ESMTP id R8ZWNftgSxvj; Sun, 21 May 2023 08:38:15 +0300 (EEST)
Received: from omenapuu2.dnainternet.net (omenapuu2.dnainternet.net [83.102.40.54])
	by tulikuusama2.dnainternet.net (Postfix) with ESMTP id 1ADF5208D5;
	Sun, 21 May 2023 08:38:15 +0300 (EEST)
Received: from basile.localnet (87-92-194-88.rev.dnainternet.fi [87.92.194.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by omenapuu2.dnainternet.net (Postfix) with ESMTPS id C19BC204;
	Sun, 21 May 2023 08:38:12 +0300 (EEST)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>
To: linux-riscv@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>
Subject:  Re: [PATCH -next v20 20/26] riscv: Add prctl controls for userspace vector
 management
Date: Sun, 21 May 2023 08:38:12 +0300
Message-ID: <5677700.DvuYhMxLoT@basile.remlab.net>
Organization: Remlab
In-Reply-To: <20230518161949.11203-21-andy.chiu@sifive.com>
References:  <20230518161949.11203-1-andy.chiu@sifive.com>
 <20230518161949.11203-21-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_223825_429662_35800C51 
X-CRM114-Status: GOOD (  12.91  )
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

CUhpIGFsbCwKCkxlIHRvcnN0YWluYSAxOC4gdG91a29rdXV0YSAyMDIzIDE5LjE5LjQzIEVFU1Qs
IHZvdXMgYXZleiDDqWNyaXQgOgo+IFRoaXMgcGF0Y2ggYWRkIHR3byByaXNjdi1zcGVjaWZpYyBw
cmN0bHMsIHRvIGFsbG93IHVzZXNwYWNlIGNvbnRyb2wgdGhlCj4gdXNlIG9mIHZlY3RvciB1bml0
Ogo+IAo+ICAqIFBSX1JJU0NWX1ZfU0VUX0NPTlRST0w6IGNvbnRyb2wgdGhlIHBlcm1pc3Npb24g
dG8gdXNlIFZlY3RvciBhdCBuZXh0LAo+ICAgIG9yIGFsbCBmb2xsb3dpbmcgZXhlY3ZlIGZvciBh
IHRocmVhZC4gVHVybmluZyBvZmYgYSB0aHJlYWQncyBWZWN0b3IKPiAgICBsaXZlIGlzIG5vdCBw
b3NzaWJsZSBzaW5jZSBsaWJyYXJpZXMgbWF5IGhhdmUgcmVnaXN0ZXJlZCBpZnVuYyB0aGF0Cj4g
ICAgbWF5IGV4ZWN1dGUgVmVjdG9yIGluc3RydWN0aW9ucy4KPiAgKiBQUl9SSVNDVl9WX0dFVF9D
T05UUk9MOiBnZXQgdGhlIHNhbWUgcGVybWlzc2lvbiBzZXR0aW5nIGZvciB0aGUKPiAgICBjdXJy
ZW50IHRocmVhZCwgYW5kIHRoZSBzZXR0aW5nIGZvciBmb2xsb3dpbmcgZXhlY3ZlKHMpLgoKU28g
ZmFyIHRoZSBzdG9yeSB3YXMgdGhhdCBpZiB0aGUgbnRoIGJpdCBpbiB0aGUgRUxGIEhXQ0FQIGF1
eGlsbGFyeSB2ZWN0b3Igd2FzIApzZXQsIHRoZW4gdGhlIG50aCBzaW5nbGUgbGV0dGVyZWQgZXh0
ZW5zaW9uIHdhcyBzdXBwb3J0ZWQuIFRoZXJlIGlzIGFscmVhZHkgCnVzZXJzcGFjZSBjb2RlIG91
dCB0aGVyZSB0aGF0IGV4cGVjdHMgdGhpcyBvZiB0aGUgViBiaXQuIChJIGtub3cgSSBoYXZlIAp3
cml0dGVuIHN1Y2ggY29kZSwgYW5kIEkgYWxzbyBrbm93IG90aGVycyBkaWQgbGlrZXdpc2UuKSBU
aGlzIGlzIGhvdyBpdCAKYWxyZWFkeSB3b3JrcyBmb3IgdGhlIEQgYW5kIEYgYml0cy4KCkFkbWl0
dGVkbHksIHVwc3RyZWFtIExpbnV4IGhhcyBuZXZlciBldmVyIHNldCB0aGF0IGJpdCB0byB0aGlz
IGRheS4gQnV0IHN0aWxsLCAKaWYgd2UgZW5kIHVwIHdpdGggdGhlIGJpdCBzZXQgaW4gYSBwcm9j
ZXNzIHRoYXQgaGFzIGhhZCBWIHN1cHBvcnQgZGlzYWJsZWQgYnkgCnRoZSBwYXJlbnQgKG9yIHRo
ZSBzeXNjdGwpLCBleGlzdGluZyB1c2Vyc3BhY2Ugd2lsbCBlbmNvdW50ZXIgU0lHSUxMIGFuZCAK
YnJlYWsuCgpJTU8sIHRoZSBiaXQgbXVzdCBiZSBtYXNrZWQgbm90IG9ubHkgd2hlbmNlIHRoZSBr
ZXJuZWwgbGFja3MgViBzdXBwb3J0IChhcyAKUEFUQ0ggMDIgZG9lcyksIGJ1dCBhbHNvIGlmIHRo
ZSBwcm9jZXNzIHN0YXJ0cyB3aXRoIFYgZGlzYWJsZWQuCgpUaGVyZSBhcmUgdHdvIHdheXMgdG8g
YWNoaWV2ZSB0aGlzOgoxKSBWIGlzIG5ldmVyIGV2ZXIgc2V0LCBhbmQgdXNlcnNwYWNlIGlzIGZv
cmNlZCB0byB1c2UgaHdwcm9iZSgpIGluc3RlYWQuCjIpIFYgaXMgc2V0IG9ubHkgaW4gcHJvY2Vz
c2VzIHN0YXJ0aW5nIHdpdGggViBlbmFibGVkIChhbmQgaXQncyB0aGVpciBvd24gCmZhdWx0IGlm
IHRoZXkgZGlzYWJsZWQgaXQgaW4gZnV0dXJlIGNoaWxkIHRocmVhZHMpLgoKQnIsCgotLSAK44Os
44Of44O744OH44OLLeOCr+ODvOODq+ODouODswpodHRwOi8vd3d3LnJlbWxhYi5uZXQvCgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
