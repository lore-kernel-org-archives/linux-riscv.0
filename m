Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C3DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:26:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D3C2229F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 08:26:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ejCTm1Rt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="VhubYzw9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70D3C2229F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9GZ5xsSZzgzoFG+ExQfPM2UKS4vU2tSJbISRaPfYCc0=; b=ejCTm1Rt9jSwzwm+lj5+/Fydk
	9SjiNc4+QIQChaWc35egRfVXR2d4jNpViBag0jAx3KuyeT7AaQfmfDS1zRPEGPNH7wOcIraHZFDdv
	DNKIFAbta00SEDgVXe8N9D+1dQQxmKEn8FSsOT8XN68Rgkrg9GzrEi4r7SO4HJY/GHTCYv5PBtlD/
	kSUAdOMfBMsspMET9fyBeXYnAF0SApJM5E8MmwDD7Q+0kirFKYQozo3nZhxBlxs1Jn7/rE4aObNrv
	NwlQLRaXoeM59jp8LxN+hQCePHor4HcJ6UCeCHsYsHLEuALHYOSx3d/BUuk5sXbSTESyOpEX57LGC
	tQrwdFXig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guCLu-0007jq-AW; Thu, 14 Feb 2019 08:26:38 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guCLq-0007j8-KN
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 08:26:36 +0000
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 440Txl2cQsz9tykV;
 Thu, 14 Feb 2019 09:26:19 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=VhubYzw9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Qw9cU7uYJVyD; Thu, 14 Feb 2019 09:26:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 440Txl1TDkz9tykT;
 Thu, 14 Feb 2019 09:26:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1550132779; bh=UGOe1QWxBfW7ndQ+5pJ1730NUq1Y6MJhDOUpYpQMxe0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VhubYzw92naM79UL/+0hi+1+NEcvnnU3bQRHgsGDBfIqBacAR7/iK9YAL6AcenuJf
 YEkGq9lsGySsSDJasFWezq6po3hyapKUbVThJHkW8IFFpesSPbZsm1lzhHw1avf6wq
 MI0quGZdL2izttXopZLDeuWbOD0y9bNCjy7DyziQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 173748B87D;
 Thu, 14 Feb 2019 09:26:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 590FFlPJ2vnd; Thu, 14 Feb 2019 09:26:20 +0100 (CET)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 79F0F8B756;
 Thu, 14 Feb 2019 09:26:19 +0100 (CET)
Subject: Re: [PATCH 01/11] powerpc: remove dead ifdefs in <asm/checksum.h>
To: Christoph Hellwig <hch@lst.de>,
 Masahiro Yamada <yamada.masahiro@socionext.com>
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-2-hch@lst.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e7a2efe3-f56c-7dfd-6613-dc9229556673@c-s.fr>
Date: Thu, 14 Feb 2019 09:26:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190213174005.28785-2-hch@lst.de>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_002634_820331_75D2FA60 
X-CRM114-Status: GOOD (  13.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org, linux-kbuild@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAxMy8wMi8yMDE5IMOgIDE4OjM5LCBDaHJpc3RvcGggSGVsbHdpZyBhIMOpY3JpdMKgOgo+
IF9fS0VSTkVMX18gaXMgbmV2ZXIgbm90IGRlZmluZWQgZm9yIG5vbi11YXBpIGhlYWRlcnMsIGFu
ZCBHRU5FUklDX0NTVU0KPiBpc24ndCBldmVyIHNldCBmb3IgcG93ZXJwYyBlaXRoZXIuCgpHRU5F
UklDX0NTVU0gd2FzIGFiYW5kb25uZWQgYnkgY29tbWl0IGQ0ZmRlNTY4YTM0YSAoInBvd2VycGMv
NjQ6IFVzZSAKb3B0aW1pemVkIGNoZWNrc3VtIHJvdXRpbmVzIG9uIGxpdHRsZS1lbmRpYW4iKQoK
Q291bGQgeW91IGFsc28gcmVtb3ZlIHRoZSAnY29uZmlnIEdFTkVSSUNfQ1NVTScgaXRlbSBpbiAK
YXJjaC9wb3dlcnBjL0tjb25maWcgPwoKQ2hyaXN0b3BoZQoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiAtLS0KPiAgIGFyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9jaGVja3N1bS5oIHwgOCArLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMv
aW5jbHVkZS9hc20vY2hlY2tzdW0uaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jaGVja3N1
bS5oCj4gaW5kZXggYTc4YTU3ZTUwNThkLi4zN2MzMDk1MDAyNjAgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NoZWNrc3VtLmgKPiArKysgYi9hcmNoL3Bvd2VycGMvaW5j
bHVkZS9hc20vY2hlY2tzdW0uaAo+IEBAIC0xLDYgKzEsNSBAQAo+ICAgI2lmbmRlZiBfQVNNX1BP
V0VSUENfQ0hFQ0tTVU1fSAo+ICAgI2RlZmluZSBfQVNNX1BPV0VSUENfQ0hFQ0tTVU1fSAo+IC0j
aWZkZWYgX19LRVJORUxfXwo+ICAgCj4gICAvKgo+ICAgICogVGhpcyBwcm9ncmFtIGlzIGZyZWUg
c29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgo+IEBAIC05LDkgKzgsNiBA
QAo+ICAgICogMiBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIg
dmVyc2lvbi4KPiAgICAqLwo+ICAgCj4gLSNpZmRlZiBDT05GSUdfR0VORVJJQ19DU1VNCj4gLSNp
bmNsdWRlIDxhc20tZ2VuZXJpYy9jaGVja3N1bS5oPgo+IC0jZWxzZQo+ICAgI2luY2x1ZGUgPGxp
bnV4L2JpdG9wcy5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L2luNi5oPgo+ICAgLyoKPiBAQCAtMjE3
LDYgKzIxMyw0IEBAIF9fc3VtMTYgY3N1bV9pcHY2X21hZ2ljKGNvbnN0IHN0cnVjdCBpbjZfYWRk
ciAqc2FkZHIsCj4gICAJCQljb25zdCBzdHJ1Y3QgaW42X2FkZHIgKmRhZGRyLAo+ICAgCQkJX191
MzIgbGVuLCBfX3U4IHByb3RvLCBfX3dzdW0gc3VtKTsKPiAgIAo+IC0jZW5kaWYKPiAtI2VuZGlm
IC8qIF9fS0VSTkVMX18gKi8KPiAtI2VuZGlmCj4gKyNlbmRpZiAvKiBfQVNNX1BPV0VSUENfQ0hF
Q0tTVU1fSCAqLwo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
