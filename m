Return-Path: <SRS0=iP4V=U3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCE0C5B57A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 12:33:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA42D208C4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2019 12:33:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txHm48Vo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA42D208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZTPEhG9/hsA1kV6+gFcEb6rpw2/2h47iDRXsZwoyY8=; b=txHm48VoVveRB5
	wJaI0ip6Olg2Ebk8nqoA2ZefbQJ0zOGY6j98sJw4T94fjYBb+dsVHn2OEKZfFuIIL6jK6qkql1z67
	n+tiOH+XzMQ/p7gvLUxG/F7GZ78Zp0Wl1lEvrxmsb4nM9jVFrixYbUtoNm74drybOmvTNlQuJrFrS
	vsJBHbh6IuvzfIOSlTAvu/9AqRqCwEuFWYqcUw7YI+vQpRRfsg5IDRqrVL8LhTQqpVUcoRgDErrCh
	VTOKbV+fPRzEJfrkItigi1qPAFkMv9YGUAEJQzKh4ywonf1xlJOB0ss/EPg1aSLxilYC6RU52t45c
	5NIGtTEfijznyLZ7bjKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hgq46-0007Nw-QM; Fri, 28 Jun 2019 12:33:18 +0000
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgq1U-00055C-Fo; Fri, 28 Jun 2019 12:30:36 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgq1S-0005Rx-94; Fri, 28 Jun 2019 09:30:34 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 13/39] docs: add arch doc directories to the index
Date: Fri, 28 Jun 2019 09:30:06 -0300
Message-Id: <df4b7dbf72f2ca0695adc6e5997ad852be2332a7.1561724493.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561724493.git.mchehab+samsung@kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-s390@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Tm93IHRoYXQgc2V2ZXJhbCBhcmNoIGRvY3VtZW50cyB3ZXJlIGNvbnZlcnRlZCB0byBSZVNULAph
ZGQgdGhlaXIgaW5kZXhlcyB0byBEb2N1bWVudGF0aW9uL2luZGV4LnJzdCBhbmQgcmVtb3ZlIHRo
ZQo6b3JwaGFuOiAgZnJvbSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hl
aGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KLS0tCiBEb2N1bWVudGF0aW9uL2FybS9p
bmRleC5yc3QgICAgIHwgIDIgLS0KIERvY3VtZW50YXRpb24vYXJtNjQvaW5kZXgucnN0ICAgfCAg
MiAtLQogRG9jdW1lbnRhdGlvbi9pYTY0L2luZGV4LnJzdCAgICB8ICAyIC0tCiBEb2N1bWVudGF0
aW9uL2luZGV4LnJzdCAgICAgICAgIHwgMTAgKysrKysrKysrKwogRG9jdW1lbnRhdGlvbi9tNjhr
L2luZGV4LnJzdCAgICB8ICAyICstCiBEb2N1bWVudGF0aW9uL3Bvd2VycGMvaW5kZXgucnN0IHwg
IDIgKy0KIERvY3VtZW50YXRpb24vcmlzY3YvaW5kZXgucnN0ICAgfCAgMiAtLQogRG9jdW1lbnRh
dGlvbi9zMzkwL2luZGV4LnJzdCAgICB8ICAyIC0tCiBEb2N1bWVudGF0aW9uL3NwYXJjL2luZGV4
LnJzdCAgIHwgIDIgLS0KIERvY3VtZW50YXRpb24veHRlbnNhL2luZGV4LnJzdCAgfCAgMiArLQog
MTAgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hcm0vaW5kZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9hcm0v
aW5kZXgucnN0CmluZGV4IGJkMzE2ZDFhMTgwMi4uOWMyZjc4MWY0Njg1IDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL2FybS9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcm0vaW5kZXgu
cnN0CkBAIC0xLDUgKzEsMyBAQAot77u/Om9ycGhhbjoKLQogPT09PT09PT09PT09PT09PQogQVJN
IEFyY2hpdGVjdHVyZQogPT09PT09PT09PT09PT09PQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9hcm02NC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FybTY0L2luZGV4LnJzdAppbmRleCAw
MThiNzgzNmVjYjcuLjk2YjY5NmJhNGU2YyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9hcm02
NC9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9hcm02NC9pbmRleC5yc3QKQEAgLTEsNSAr
MSwzIEBACi06b3JwaGFuOgotCiA9PT09PT09PT09PT09PT09PT0KIEFSTTY0IEFyY2hpdGVjdHVy
ZQogPT09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2lhNjQvaW5k
ZXgucnN0IGIvRG9jdW1lbnRhdGlvbi9pYTY0L2luZGV4LnJzdAppbmRleCBhM2UzMDUyYWQ2ZTIu
LmVmOTk0NzVmNjcyYiAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9pYTY0L2luZGV4LnJzdAor
KysgYi9Eb2N1bWVudGF0aW9uL2lhNjQvaW5kZXgucnN0CkBAIC0xLDUgKzEsMyBAQAotOm9ycGhh
bjoKLQogPT09PT09PT09PT09PT09PT09CiBJQS02NCBBcmNoaXRlY3R1cmUKID09PT09PT09PT09
PT09PT09PQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9pbmRleC5yc3QgYi9Eb2N1bWVudGF0
aW9uL2luZGV4LnJzdAppbmRleCA5NWRiMjZiZjI4OTkuLmY4OThkZWY4MzNmNCAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9pbmRleC5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi9pbmRleC5yc3QK
QEAgLTExOCw3ICsxMTgsMTcgQEAgaW1wbGVtZW50YXRpb24uCiAgICA6bWF4ZGVwdGg6IDIKIAog
ICAgc2gvaW5kZXgKKyAgIGFybS9pbmRleAorICAgYXJtNjQvaW5kZXgKKyAgIGlhNjQvaW5kZXgK
KyAgIG02OGsvaW5kZXgKKyAgIHBvd2VycGMvaW5kZXgKKyAgIHJpc2N2L2luZGV4CisgICBzMzkw
L2luZGV4CisgICBzaC9pbmRleAorICAgc3BhcmMvaW5kZXgKICAgIHg4Ni9pbmRleAorICAgeHRl
bnNhL2luZGV4CiAKIEZpbGVzeXN0ZW0gRG9jdW1lbnRhdGlvbgogLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL202OGsvaW5kZXgucnN0IGIvRG9jdW1l
bnRhdGlvbi9tNjhrL2luZGV4LnJzdAppbmRleCBmMzI3M2VjMDc1YzMuLjNhNWJhN2ZlMTcwMyAx
MDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9tNjhrL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0
aW9uL202OGsvaW5kZXgucnN0CkBAIC0xLDQgKzEsNCBAQAotOm9ycGhhbjoKKy4uIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCiAKID09PT09PT09PT09PT09PT09CiBtNjhrIEFyY2hp
dGVjdHVyZQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9wb3dlcnBjL2luZGV4LnJzdCBiL0Rv
Y3VtZW50YXRpb24vcG93ZXJwYy9pbmRleC5yc3QKaW5kZXggMWZmMTcyNjhkYjQ2Li41NDliMWNk
ZDc3YWUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vcG93ZXJwYy9pbmRleC5yc3QKKysrIGIv
RG9jdW1lbnRhdGlvbi9wb3dlcnBjL2luZGV4LnJzdApAQCAtMSw0ICsxLDQgQEAKLTpvcnBoYW46
CisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAogCiA9PT09PT09CiBwb3dlcnBj
CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2luZGV4LnJzdCBiL0RvY3VtZW50YXRp
b24vcmlzY3YvaW5kZXgucnN0CmluZGV4IGM0YjkwNmQ5YjVhNy4uZTNjYTA5MjJhOGMyIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL3Jpc2N2L2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9u
L3Jpc2N2L2luZGV4LnJzdApAQCAtMSw1ICsxLDMgQEAKLTpvcnBoYW46Ci0KID09PT09PT09PT09
PT09PT09PT0KIFJJU0MtViBhcmNoaXRlY3R1cmUKID09PT09PT09PT09PT09PT09PT0KZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vczM5MC9pbmRleC5yc3QgYi9Eb2N1bWVudGF0aW9uL3MzOTAv
aW5kZXgucnN0CmluZGV4IDFhOTE0ZGEyYTA3Yi4uNDYwMjMxMjkwOWQzIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL3MzOTAvaW5kZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24vczM5MC9pbmRl
eC5yc3QKQEAgLTEsNSArMSwzIEBACi06b3JwaGFuOgotCiA9PT09PT09PT09PT09PT09PQogczM5
MCBBcmNoaXRlY3R1cmUKID09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL3NwYXJjL2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24vc3BhcmMvaW5kZXgucnN0CmluZGV4
IDkxZjdkNjY0M2RkNS4uNzFjZmY2MjFmMjQzIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL3Nw
YXJjL2luZGV4LnJzdAorKysgYi9Eb2N1bWVudGF0aW9uL3NwYXJjL2luZGV4LnJzdApAQCAtMSw1
ICsxLDMgQEAKLTpvcnBoYW46Ci0KID09PT09PT09PT09PT09PT09PQogU3BhcmMgQXJjaGl0ZWN0
dXJlCiA9PT09PT09PT09PT09PT09PT0KZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24veHRlbnNh
L2luZGV4LnJzdCBiL0RvY3VtZW50YXRpb24veHRlbnNhL2luZGV4LnJzdAppbmRleCA1YTI0ZTM2
NWUzNWYuLjUyZmEwNGViMzlhMyAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi94dGVuc2EvaW5k
ZXgucnN0CisrKyBiL0RvY3VtZW50YXRpb24veHRlbnNhL2luZGV4LnJzdApAQCAtMSw0ICsxLDQg
QEAKLTpvcnBoYW46CisuLiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAogCiA9PT09
PT09PT09PT09PT09PT09CiBYdGVuc2EgQXJjaGl0ZWN0dXJlCi0tIAoyLjIxLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
