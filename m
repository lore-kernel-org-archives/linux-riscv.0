Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B41C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zzW4E+COgHYMiO1St8wDGtho1qu4W5gDfprQJBV86YM=; b=k4iZKBRkYs/n87
	9lsN+NAKYUu14blmd7T6u2izGrqsughIk0/esDTZBVxy1tIpejkNxCHz3rTBwkxgRp+mOgZuUco6e
	04XTiaZLGAH+a71MGzdPdVN/tdkNWSSQpzUeYxJEK+J4kQGV/YtW8gJHtIQ7KlK7s521ojbltJPFt
	WBXrZhM8lLcIgnTcZI/ya+5R+aJToNUzvSSeXzpN5xH5x0wUKo6pJAQWZdloKfidsLO527p5POkjt
	F8t5GR4r5QSJjKYGSbQ8CFOAY51SAXsySm7OIGAHcgH7ek/xixR7TfUx/RXTngdzFztPW3BULpYBp
	5uWqYHeb9TjJjEYs2vwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvIL7-000000006rk-3MTz;
	Fri, 12 Apr 2024 14:57:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvIL4-000000006qE-2zVb
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 14:57:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65AE4CE3971;
	Fri, 12 Apr 2024 14:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35DF7C113CC;
	Fri, 12 Apr 2024 14:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712933831;
	bh=DJu1ruU/2it86iiNywivAApRohuSOMQ8YBfr0G0U1I0=;
	h=From:To:Cc:Subject:Date:From;
	b=nt4w8qTilNtnTpj+xcg/r10zFAbZ06lS+wtFg87+RHnE3WtDCh8TGLMCaNTQikjYb
	 K89hammQ+9ArbQuNifV0ERov/6nTbmJ9lfWFoOvYUuz4GmQy4XAAJNPl95xB2XvSCf
	 PXi611njBptUD7MhZC0wSX8nf5yZB4/W2CBiuh6o7AMvOJAeMJa8fjnDLbtyYP1Kor
	 sFCXU2KeZDt/goItO7y2Ka65dfDl+vQr/PJFHwowE4a92VseemlxgStSzdVCzI4218
	 WwEY6gqJkcO746T5h1SBP3hH+TcsKP0gEvULkwGlsijEgVi1Rgyg/mNtsYltkuVJaw
	 uoIuTqwqHLmzQ==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Cc: "Theodore Ts'o" <tytso@mit.edu>, Andreas Dilger
 <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, Conor Dooley
 <conor@kernel.org>
Subject: riscv32 EXT4 splat, 6.8 regression?
Date: Fri, 12 Apr 2024 16:57:08 +0200
Message-ID: <878r1ibpdn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_075715_217335_9BB1BC45 
X-CRM114-Status: UNSURE (   5.91  )
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

SGkhCgpJJ3ZlIGJlZW4gbG9va2luZyBhdCBhbiBFWFQ0IHNwbGF0IG9uIHJpc2N2MzIsIHRoYXQg
TEtGVCBmb3VuZCBbMV06CgogIHwgRVhUNC1mcyAodmRhKTogbW91bnRlZCBmaWxlc3lzdGVtIDEz
Njk3YTQyLWQxMGUtNGE5ZS04ZTU2LWNiOTA4M2JlOTJmOSBybyB3aXRoIG9yZGVyZWQgZGF0YSBt
b2RlLiBRdW90YSBtb2RlOiBkaXNhYmxlZC4KICB8IFZGUzogTW91bnRlZCByb290IChleHQ0IGZp
bGVzeXN0ZW0pIHJlYWRvbmx5IG9uIGRldmljZSAyNTQ6MC4KICB8IFVuYWJsZSB0byBoYW5kbGUg
a2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBhdCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAw
MDYKICB8IE9vcHMgWyMxXQogIHwgTW9kdWxlcyBsaW5rZWQgaW46CiAgfCBDUFU6IDEgUElEOiAx
IENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2LjguMCAjNDEKICB8IEhhcmR3YXJlIG5hbWU6
IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKICB8IGVwYyA6IGV4dDRfc2VhcmNoX2RpcisweDUyLzB4
ZTQKICB8ICByYSA6IF9fZXh0NF9maW5kX2VudHJ5KzB4MWQ2LzB4NTc4CiAgfCBlcGMgOiBjMDM1
YjYwZSByYSA6IGMwMzViODc2IHNwIDogYzI1M2ZjMTAKICB8ICBncCA6IGMyMWE3MzgwIHRwIDog
YzI1YzgwMDAgdDAgOiA0NGMwNjU3ZgogIHwgIHQxIDogMDAwMDAwMGMgdDIgOiAxZGU1YjA4OSBz
MCA6IGMyNTNmYzUwCiAgfCAgczEgOiAwMDAwMDAwMCBhMCA6IGZmZmZmZmZjIGExIDogZmZmZmYw
MDAKICB8ICBhMiA6IDAwMDAwMDAwIGEzIDogYzI5YzA0ZjggYTQgOiBjMjUzZmQwMAogIHwgIGE1
IDogMDAwMDAwMDAgYTYgOiBjMjUzZmNmYyBhNyA6IGZmZmZmZmYzCiAgfCAgczIgOiAwMDAwMTAw
MCBzMyA6IDAwMDAwMDAwIHM0IDogMDAwMDEwMDAKICB8ICBzNSA6IGMyOWMwNGY4IHM2IDogYzI5
MmRiNDAgczcgOiBjMjUzZmNmYwogIHwgIHM4IDogZmZmZmZmZjcgczkgOiBjMjUzZmQwMCBzMTA6
IGZmZmZmMDAwCiAgfCAgczExOiBjMjkyZGI0MCB0MyA6IDAwMDAwMDA3IHQ0IDogNWU4YjQ1MjUK
ICB8ICB0NSA6IDAwMDAwMDAwIHQ2IDogMDAwMDAwMDAKICB8IHN0YXR1czogMDAwMDAxMjAgYmFk
YWRkcjogMDAwMDAwMDYgY2F1c2U6IDAwMDAwMDBkCiAgfCBbPGMwMzViNjBlPl0gZXh0NF9zZWFy
Y2hfZGlyKzB4NTIvMHhlNAogIHwgWzxjMDM1Yjg3Nj5dIF9fZXh0NF9maW5kX2VudHJ5KzB4MWQ2
LzB4NTc4CiAgfCBbPGMwMzViY2FhPl0gZXh0NF9sb29rdXArMHg5Mi8weDIwMAogIHwgWzxjMDI5
NWMxND5dIF9fbG9va3VwX3Nsb3crMHg4ZS8weDE0MgogIHwgWzxjMDI5OTQzYT5dIHdhbGtfY29t
cG9uZW50KzB4MTA0LzB4MTc0CiAgfCBbPGMwMjk5ZjE4Pl0gcGF0aF9sb29rdXBhdCsweDc4LzB4
MTgyCiAgfCBbPGMwMjliMjRjPl0gZmlsZW5hbWVfbG9va3VwKzB4OTYvMHgxNTgKICB8IFs8YzAy
OWIzNDY+XSBrZXJuX3BhdGgrMHgzOC8weDU2CiAgfCBbPGMwYzFiZWU0Pl0gaW5pdF9tb3VudCsw
eDQ2LzB4OTYKICB8IFs8YzBjMmFlMWM+XSBkZXZ0bXBmc19tb3VudCsweDQ0LzB4N2EKICB8IFs8
YzBjMDFjMjY+XSBwcmVwYXJlX25hbWVzcGFjZSsweDIyNi8weDI3YwogIHwgWzxjMGMwMTEzMD5d
IGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MjdlLzB4MmEwCiAgfCBbPGMwYjc4NDAyPl0ga2VybmVs
X2luaXQrMHgyYS8weDE1OAogIHwgWzxjMGI4MmJmMj5dIHJldF9mcm9tX2ZvcmsrMHhlLzB4MjAK
ICB8IENvZGU6IDg0YWUgYTgwOSBkMzAzIDAwNDQgOTQ5YSAwZjYzIDA2MDMgOTkxYSBmZDYzIDA1
ODQgKGM2MDMpIDAwNjQgCiAgfCAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0K
ICB8IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISBl
eGl0Y29kZT0weDAwMDAwMDBiCgpUaGlzIHdhcyBub3QgcHJlc2VudCBpbiA2LjcuIEJpc2VjdGlv
biB3YXNuJ3QgcmVhbGx5IGhlbHBmdWwgKHRvIG1lIGF0CmxlYXN0KTsgSSBnb3QgaXQgZG93biB0
byBjb21taXQgYzYwNDExMGU2NjJhICgiTWVyZ2UgdGFnICd2ZnMtNi44Lm1pc2MnCm9mIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92ZnMvdmZzIiksIGFuZCB3
aGVuIEkKcmV2ZXJ0IHRoZSBjb21taXRzIGluIHRoZSB2ZnMgbWVyZ2UgdGhlIHNwbGF0IHdlbnQg
YXdheSwgYnV0IEkgKnJlYWxseSoKc3RydWdnbGUgdG8gc2VlIGhvdyB0aG9zZSBhcmUgcmVsYXRl
ZC4uLgoKV2hhdCBJIHNlZSBpbiBleHQ0X3NlYXJjaF9kaXIoKSBpcyB0aGF0IHNlYXJjaF9idWYg
aXMgMHhmZmZmZjAwMCwgYW5kIGF0CnNvbWUgcG9pbnQgdGhlIGFkZHJlc3Mgd3JhcHMgdG8gemVy
bywgYW5kIGJvb20uIEkgZG91YnQgdGhhdCAweGZmZmZmMDAwCmlzIGEgc2FuZSBhZGRyZXNzLgoK
TWF5YmUgdGhpcyBpcyBzb21ldGhpbmcgdGhlIHRoZSBmcyBmb2xrcyBjYW4gc3BvdCBkaXJlY3Rs
eT8gSW4gdGhlCm1lYW50aW1lIEknbGwgY29udGludWUgdG8gZGlnLi4uCgoKVGhhbmtzLCBhbmQg
aGF2ZSBhIG5pY2Ugd2Vla2VkIQpCasO2cm4KCgpbMV0gaHR0cHM6Ly9xYS1yZXBvcnRzLmxpbmFy
by5vcmcvbGtmdC9saW51eC1zdGFibGUtcmMtbGludXgtNi44LnkvYnVpbGQvdjYuOC40LTI4MS1n
NmQwOGRmNmM0MDFlL3Rlc3RydW4vMjMzNjk5MTQvc3VpdGUvbG9nLXBhcnNlci10ZXN0L3Rlc3Rz
LwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
