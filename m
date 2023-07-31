Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC56C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 09:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hag7VIN10+GepCcKgFM85m1BRSXfOgMY7Q+uaa4FL28=; b=M+XnQoHsl73ABe
	QNQw84rhjQA4PKL9zla2O4j9KYfQAonenEs/oXbDCVZK3/xxFB+kolVflDDFFO23Ey5LwHxni/tIy
	xgnxisEYZdmV3gH5651spZAyrmch13aJXmPYOzBrapr97FwVdi2dpavZ7ORbpKq5emio29Qg8XFx6
	PnaFX+d5lB5oORrj4iSwAxZ3PzQiHuUYyM/KW0ddpkti7zinktRYjxtxNtyE6xDH/uLjt0RvDPIk7
	lQ7At0adnx2bWlOb5vsI0BGSd0jNo21Vm+7adie0fR4rCPR/C4PEgWdIWC3dschiqhh6fCtRWOUVF
	2sPYryxlpFLTu4qvUg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPGv-00EmiV-32;
	Mon, 31 Jul 2023 09:33:01 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPGt-00Emht-0o
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 09:33:01 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 36V9WoM3012597
	for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 12:32:50 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1690795964; x=1693387964;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hYrmhTrrV00n+yse0bYXu7c0/zKBC0CeIUzRE0uLZlg=;
	b=YKxeiPnJ67koIgsdTCopqGc/amJ0bseu3UDSU5nSdpRpkcuijU1pq6ZVCDOPlVf6
	wZueesH/esX70fAKmkgkN2ZCK8LbJyg86Z6eWqiPF+HVNvq+ePyeE9hX75kCyzZv
	pjdBjLeAw9iiMg6iyHbBCriSLduq5G6nJDE5Qhul7b8B5/nxOkW3YEzM6gYfpqHl
	t+ebkzx0pEKPDk0z0FSIIgrCbtv58UpHijerTxDkS1BVgh3+YIaLpIxa7lmZ1ZSQ
	PSb0ABzerHksfIFhxTNld/aXodm/JJ1DrHD3boREa0pAnejNUQeWPIDdf+dnjv+f
	+D8pYAm4QT0ERZjNq8dX3Q==;
X-AuditID: 8b5b014d-a23ec70000002178-b5-64c77fbc718e
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 83.D4.08568.CBF77C46; Mon, 31 Jul 2023 12:32:44 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <3d4d9b22-8451-f4d5-bbd8-117988f3a545@ics.forth.gr>
Date: Mon, 31 Jul 2023 12:32:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 06/11] RISC-V: drivers/iommu/riscv: Add command, fault,
 page-req queues
To: Zong Li <zong.li@sifive.com>, Tomasz Jeznach <tjeznach@rivosinc.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Walmsley
 <paul.walmsley@sifive.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
        linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
        iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv@lists.infradead.org
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <1fd79e5c53d9d6ed2264f60dd4261f293cc00472.1689792825.git.tjeznach@rivosinc.com>
 <CANXhq0pm+1yXuvUGudwNtvNHWV3FytH4VfCnq7_Ws=t-MZP_kQ@mail.gmail.com>
Content-Language: el-GR
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <CANXhq0pm+1yXuvUGudwNtvNHWV3FytH4VfCnq7_Ws=t-MZP_kQ@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAIsWRmVeSWpSXmKPExsXSHT1dWXdP/fEUg/lXtSy2/p7FbjHr0nFG
	i19fLCw6Z29gt7i8aw6bxbbPLWwWGy7NYrR4ebmH2aJtFr/FwQ9PWC0+z6+w+LKsndGi5Y6p
	xYe7s9kc+DyeHJzH5LFm3hpGjzcvX7J4HO74wu6xaVUnm8fmJfUeLzbPZPS4MSvC41LzdXaP
	vz+3snh83iQXwB3FZZOSmpNZllqkb5fAlfF2IU/BAt6KvvNXmRsYW7i6GDk5JARMJPreXmTp
	YuTiEBI4zijx8dZ2ZoiEpcTmTy9ZQGxeAXuJvXtusoHYLAKqEu8WzmaCiAtKnJz5BKxGVCBa
	YsOFR2C2sECsxIeOV2D1IgIeEjvnfWMCWcAscJZZYumdh2ALhAQuMkpMvQ9WxCwgLnHk/G+w
	OJuApsT8SwfBBnEKBEq07lnNAlFjJtG1tYsRwpaXaN46m3kCo8AsJHfMQjJqFpKWWUhaFjCy
	rGIUSCwz1stMLtZLyy8qydBLL9rECI40Rt8djLc3v9U7xMjEwXiIUYKDWUmE91TAoRQh3pTE
	yqrUovz4otKc1OJDjNIcLErivCdsFyQLCaQnlqRmp6YWpBbBZJk4OKUamLxSTzWYPrmWOF/h
	lcJ0r9ge0z+9UjNndomGrXotIr9O4Oa8m0Fni27kZtYtNN+osG9RY29H8PPy2wof161+tlEi
	/VrqowXVeyeX/fpsc/3sqp9f7b49q1/2rSNdK3n1kqszzPXM1syseqIxo3TfOuMH23VFDM7v
	L3zZ4CET9DEgZpbqo2l+BbwqMapRSSb/HW2SoxZxFTTyeMz3VZos9vXtiTN/l3H8a21ReS3z
	9ADDi6PnVO42ZoscuDuR6eXNeYu26XV0XeposFvPGmedutK+M6ZNWUZrWmGSZtCa3zYuNav9
	1L4mKNr52k+yOV4+vbk9nylH/TxX6rMPN0OZ5JS0rR+8bQm3cJkhtmnnTyWW4oxEQy3mouJE
	AJtm9pUjAwAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_023259_744335_4F384DA8 
X-CRM114-Status: GOOD (  13.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yOS8yMyAxNTo1OCwgWm9uZyBMaSB3cm90ZToKPiBPbiBUaHUsIEp1bCAyMCwgMjAyMyBh
dCAzOjM04oCvQU0gVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4+ICsgICAgICAgaW9tbXUtPmNhcCA9IHJpc2N2X2lvbW11X3JlYWRxKGlvbW11LCBSSVNDVl9J
T01NVV9SRUdfQ0FQKTsKPj4gKwo+PiArICAgICAgIC8qIEZvciBub3cgd2Ugb25seSBzdXBwb3J0
IFdTSXMgdW50aWwgd2UgaGF2ZSBBSUEgc3VwcG9ydCAqLwo+IAo+IEknbSBub3QgY29tcGxldGVs
eSB1bmRlcnN0YW5kIEFJQSBzdXBwb3J0IGhlcmUsIGJlY2F1c2UgSSBzYXcgdGhlIHBjaQo+IGNh
c2UgdXNlcyB0aGUgTVNJLCBhbmQga2VybmVsIHNlZW1zIHRvIGhhdmUgdGhlIEFJQSBpbXBsZW1l
bnRhdGlvbi4KPiBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBpdD8KPiAKCldoZW4gSSB3cm90
ZSB0aGlzIHdlIGRpZG4ndCBoYXZlIEFJQSBpbiB0aGUga2VybmVsLCBhbmQgd2l0aG91dCBJTVNJ
QyB3ZSAKY2FuJ3QgaGF2ZSBNU0lzIGluIHRoZSBoYXJ0ICh3ZSBjYW4gc3RpbGwgaGF2ZSBNU0lz
IGluIHRoZSBQQ0llIGNvbnRyb2xsZXIpLgoKPiAKPiBTaG91bGQgd2UgZGVmaW5lIHRoZSAiaW50
ZXJydXB0LW5hbWVzIiBpbiBkdC1iaW5kaW5ncz8KPiAKClllcyB3ZSBzaG91bGQsIGFsb25nIHdp
dGggcXVldWUgbGVuZ3RocyBiZWxvdy4KCj4+ICsKPj4gKyAgICAgICAvKiBNYWtlIHN1cmUgZmN0
bC5XU0kgaXMgc2V0ICovCj4+ICsgICAgICAgZmN0bCA9IHJpc2N2X2lvbW11X3JlYWRsKGlvbW11
LCBSSVNDVl9JT01NVV9SRUdfRkNUTCk7Cj4+ICsgICAgICAgZmN0bCB8PSBSSVNDVl9JT01NVV9G
Q1RMX1dTSTsKPj4gKyAgICAgICByaXNjdl9pb21tdV93cml0ZWwoaW9tbXUsIFJJU0NWX0lPTU1V
X1JFR19GQ1RMLCBmY3RsKTsKPj4gKwo+PiArICAgICAgIC8qIFBhcnNlIFF1ZXVlIGxlbmd0cyAq
Lwo+PiArICAgICAgIHJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2Rl
LCAiY21kcV9sZW4iLCAmaW9tbXUtPmNtZHFfbGVuKTsKPj4gKyAgICAgICBpZiAoIXJldCkKPj4g
KyAgICAgICAgICAgICAgIGRldl9pbmZvKGRldiwgImNvbW1hbmQgcXVldWUgbGVuZ3RoIHNldCB0
byAlaVxuIiwgaW9tbXUtPmNtZHFfbGVuKTsKPj4gKwo+PiArICAgICAgIHJldCA9IG9mX3Byb3Bl
cnR5X3JlYWRfdTMyKHBkZXYtPmRldi5vZl9ub2RlLCAiZmx0cV9sZW4iLCAmaW9tbXUtPmZsdHFf
bGVuKTsKPj4gKyAgICAgICBpZiAoIXJldCkKPj4gKyAgICAgICAgICAgICAgIGRldl9pbmZvKGRl
diwgImZhdWx0L2V2ZW50IHF1ZXVlIGxlbmd0aCBzZXQgdG8gJWlcbiIsIGlvbW11LT5mbHRxX2xl
bik7Cj4+ICsKPj4gKyAgICAgICByZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihwZGV2LT5kZXYu
b2Zfbm9kZSwgInByaXFfbGVuIiwgJmlvbW11LT5wcmlxX2xlbik7Cj4+ICsgICAgICAgaWYgKCFy
ZXQpCj4+ICsgICAgICAgICAgICAgICBkZXZfaW5mbyhkZXYsICJwYWdlIHJlcXVlc3QgcXVldWUg
bGVuZ3RoIHNldCB0byAlaVxuIiwgaW9tbXUtPnByaXFfbGVuKTsKPj4gKwo+PiAgICAgICAgICBk
bWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KCZwZGV2LT5kZXYsIERNQV9CSVRfTUFTSyg2NCkpOwo+
PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
