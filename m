Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75CFC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 09:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4LMFM12RQh2vneEDyZALyZ9vkTHpe2o6QsXgeUAZl9M=; b=0J87NspPNeP89H
	m6JPzW+Jrc5+1RCeruUfrIJ+FoqKFJsF8Estqijk2rKzJffeqZW05Rac5cK8tste2+3k+i67Z9Mau
	t6/Rjupjj1nvzlO2mZQD7X+cEnNfsg9hr09SfYGWb8h+tRK5nwLdyH2ATKZugetAXhbyMDGblK61H
	etN7aG9MOstjrtlVzlfiGuF77ALS8okXuF5ExuS+t0Lmrm7IZgVJ8/HnlU8PvC5+75zXyEXT+28Yq
	Laj7iREgwCyHwpP5aA/fCYc6MtxsgDdiHVaKWWuJe0IP9Qlz0IAdfKyM5kk9Tx0qfZGaUPj5qXshw
	oYuebRxhhbThHsizjz8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nckqy-00G7nE-Ii; Fri, 08 Apr 2022 09:24:28 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nckqv-00G7lN-Hg; Fri, 08 Apr 2022 09:24:26 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nckqq-0002JW-3F; Fri, 08 Apr 2022 11:24:20 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: anup@brainfault.org,
	atishp@atishpatra.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] RISC-V: KVM: include missing hwcap.h into vcpu_fp
Date: Fri,  8 Apr 2022 11:24:15 +0200
Message-Id: <20220408092415.1603661-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_022425_620292_B3FE389D 
X-CRM114-Status: GOOD (  11.24  )
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

dmNwdV9mcCB1c2VzIHRoZSByaXNjdl9pc2FfZXh0ZW5zaW9uIG1lY2hhbmlzbSB3aGljaCBnZXRz
CmRlZmluZWQgaW4gaHdjYXAuaCBidXQgZG9lc24ndCBpbmNsdWRlIHRoYXQgaGVhZCBmaWxlLgoK
V2hpbGUgaXQgc2VlbXMgdG8gd29yayBpbiBtb3N0IGNhc2VzLCBpbiBjZXJ0YWluIGNvbmRpdGlv
bnMKdGhpcyBjYW4gbGVhZCB0byBidWlsZCBmYWlsdXJlcyBsaWtlCgouLi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X2ZwLmM6IEluIGZ1bmN0aW9uIOKAmGt2bV9yaXNjdl92Y3B1X2ZwX3Jlc2V04oCZOgou
Li9hcmNoL3Jpc2N2L2t2bS92Y3B1X2ZwLmM6MjI6MTM6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJhyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZeKAmSBbLVdl
cnJvcj1pbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgMjIgfCAgICAgICAgIGlmIChy
aXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZSgmaXNhLCBmKSB8fAogICAgICB8ICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Ci4uL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
ZnAuYzoyMjo0OTogZXJyb3I6IOKAmGbigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRoaXMg
ZnVuY3Rpb24pCiAgIDIyIHwgICAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFi
bGUoJmlzYSwgZikgfHwKCkZpeCB0aGlzIGJ5IHNpbXBseSBpbmNsdWRpbmcgdGhlIG5lY2Vzc2Fy
eSBoZWFkZXIuCgpGaXhlczogMGE4NjUxMmRjMTEzICgiUklTQy1WOiBLVk06IEZhY3Rvci1vdXQg
RlAgdmlydHVhbGl6YXRpb24gaW50byBzZXBhcmF0ZSBzb3VyY2VzIikKU2lnbmVkLW9mZi1ieTog
SGVpa28gU3R1ZWJuZXIgPGhlaWtvQHNudGVjaC5kZT4KLS0tCiBhcmNoL3Jpc2N2L2t2bS92Y3B1
X2ZwLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZnAuYyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZnAuYwppbmRl
eCA0NDQ5YTk3NmU1YTYuLmQ0MzA4YzUxMjAwNyAxMDA2NDQKLS0tIGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9mcC5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZnAuYwpAQCAtMTEsNiArMTEsNyBA
QAogI2luY2x1ZGUgPGxpbnV4L2Vyci5oPgogI2luY2x1ZGUgPGxpbnV4L2t2bV9ob3N0Lmg+CiAj
aW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgorI2luY2x1ZGUgPGFzbS9od2NhcC5oPgogCiAjaWZk
ZWYgQ09ORklHX0ZQVQogdm9pZCBrdm1fcmlzY3ZfdmNwdV9mcF9yZXNldChzdHJ1Y3Qga3ZtX3Zj
cHUgKnZjcHUpCi0tIAoyLjM1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
