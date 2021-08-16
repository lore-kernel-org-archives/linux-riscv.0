Return-Path: <SRS0=iJWH=NH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,
	INVALID_MSGID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B01C4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 09:46:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32BCD61B20
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Aug 2021 09:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 32BCD61B20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tf6RrRY0K7SL4i/TT2fNFjBxTsnzYMlccX83QTbe7j0=; b=Yt4IJT/Qq/3GNQYZcqf9P9oaWQ
	oW4D8V1MFPwyew+8gpX49v+l5ZAgYxA1HMdN0J4aWG/IHFZpQl3XPRYgq6JRxu/469procI6p9qPC
	yEhibamWy6fPWhoqFVrusgnw4X5NCb0P284KUswYEOsKI2jZY/tCqSCqb8dsxBp9fEoEutJst35sx
	XalwB/2HZGMBXKflePgEU6Pp5bAlj/cnzZCgLKyhU46Wh9AeuY2ziUDmhq44UFZYtcJZGhdfMPKz7
	5y3g9BxuohyzVKc+FQDAvmghuIi1w7Nu1Uj5bCmopJsQxKdSv/q0d8m56iwBZVP32rtBWCOYpb4+l
	IZJUnQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFZBy-00Gctx-Q3; Mon, 16 Aug 2021 09:46:02 +0000
Received: from smtpbg565.qq.com ([183.3.255.186] helo=qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFZBf-00Gcsg-P6
 for linux-riscv@lists.infradead.org; Mon, 16 Aug 2021 09:45:46 +0000
X-QQ-mid: bizesmtp39t1629107112tmve0uzx
Received: from [192.168.31.16] (unknown [219.144.185.95])
 by esmtp6.qq.com (ESMTP) with 
 id ; Mon, 16 Aug 2021 17:45:11 +0800 (CST)
X-QQ-SSF: 01400000002000B0H000B00A0000000
X-QQ-FEAT: VR0k7YLDYRRhnocty34uQy2wnJ+nr5ti6WPsdMBCX4WZZxAY+lHBd2H829aQe
 i8MpOkHyNBsKSGeqK55qF8EhjzpevuZV1de0rUuk3G5AC8PplnnTbKqVEehseM5xtkpgeKb
 Uv7dgs6//ldbK+neqlLzp8raoRjNGx43a3YCP0a77K3797bCsB9TFum3JA5Fc55jMEhRyHt
 yOZ3Ww44+zr8/XVCrCkSNtj/D002yX1L01JAOy4HHXwawWSJQk/clhrbd/yLpvmm8o5qGsT
 OOm//rfUUlFKfTuveAsg8gJp0FSGGcf8Vvw1BH/C5+UEPqDSfZBgjg7csBOm1+VBAmb2F19
 mFpvNJYMHsVBx2gMOw=
X-QQ-GoodBg: 2
Message-ID: <f6f837d7-8945-21c0-9664-ebcc5218efc1@kylinos.com.cn>+CFD21A4E55C32455
Date: Mon, 16 Aug 2021 17:45:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0
Subject: Re: [PATCH 0/1] __asm_copy_to-from_user: Reduce more byte_copy
Content-Language: en-US
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
 <a70451d1-57ad-6b49-24c1-6408ef94a959@gmail.com>
 <61187c37.1c69fb81.ed9bd.cc45SMTPIN_ADDED_BROKEN@mx.google.com>
 <a85be25a-3a67-2baa-531d-98fa4f292f30@gmail.com>
From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
In-Reply-To: <a85be25a-3a67-2baa-531d-98fa4f292f30@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.com.cn:qybgweb:qybgweb13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_024544_190042_1C5DF4BD 
X-CRM114-Status: GOOD (  10.42  )
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

SGkgQWtpcmEsCgoKSSBjYW4gcmVwcm9kdWNlIGl0IG9uIG15IEhpRml2ZSBVbm1hdGNoZWQgd2l0
aCBhIGN1c3RvbSBHZW50b28gcm9vdGZzLiAKQXMgcG9pbnRlZCBvdXQgYnkgQW5kcmVhcywgdGhl
cmUgbWlnaHQgYmUgYSBtaXNzaW5nIGZpeHVwLsKgIEknbSBnb2luZyB0byAKZGVidWcgdGhpcyBp
c3N1ZSBteXNlbGYgc2luY2UgSSBjYW4gcmVwcm9kdWNlIGl0IGZhaXJseSBzdGFibGUuCgoKUWl1
CgoKT24gOC8xNi8yMSAxNDoyNCwgQWtpcmEgVHN1a2Ftb3RvIHdyb3RlOgo+IEhpIFFpdSwKPgo+
IE9uIDgvMTUvMjAyMSAxMTozMCBBTSwgUWl1IFdlbmJvIHdyb3RlOgo+PiBIaSBBa2lyYSwKPj4K
Pj4KPj4gVGhpcyBwYXRjaCBicmVha3MgbXkgdXNlcnNwYWNlwqAgYW5kIEkgY2FuJ3QgYm9vdCBt
eSBzeXN0ZW0gYWZ0ZXIgYXBwbHlpbmcgdGhpcy4gSGVyZSBpcyB0aGUgc3RhY2sgdHJhY2U6Cj4+
Cj4+Cj4+IFvCoMKgIDEwLjM0OTA4MF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwCj4+IFvC
oMKgIDEwLjM1NzExNl0gT29wcyBbIzE1XQo+PiBbwqDCoCAxMC4zNTk0MzNdIENQVTogMiBQSUQ6
IDE2OSBDb21tOiAobmV0d29ya2QpIFRhaW50ZWQ6IEcgRMKgwqDCoMKgwqDCoMKgwqDCoMKgIDUu
MTQuMC1yYzUgIzUzCj4+IFvCoMKgIDEwLjM2NzQyMl0gSGFyZHdhcmUgbmFtZTogU2lGaXZlIEhp
Rml2ZSBVbm1hdGNoZWQgQTAwIChEVCkKPj4gW8KgwqAgMTAuMzcyOTgxXSBlcGMgOiBfX2FzbV9j
b3B5X2Zyb21fdXNlcisweDQ4LzB4ZjAKPj4gW8KgwqAgMTAuMzc3NTg0XcKgIHJhIDogX2NvcHlf
ZnJvbV91c2VyKzB4MjgvMHg2OAo+PiBbwqDCoCAxMC4zODE3NTRdIGVwYyA6IGZmZmZmZmZmODA5
OWEyODAgcmEgOiBmZmZmZmZmZjgwMzYxNGE4IHNwIDogZmZmZmZmZDAwNDE2YmQ5MAo+PiBbwqDC
oCAxMC4zODg5NjNdwqAgZ3AgOiBmZmZmZmZmZjgxMWVlNTQwIHRwIDogZmZmZmZmZTA4NDFiMzY4
MCB0MCA6IGZmZmZmZmQwMDQxNmJkZTAKPj4gW8KgwqAgMTAuMzk2MTcyXcKgIHQxIDogZmZmZmZm
ZDAwNDE2YmRkOCB0MiA6IDAwMDAwMDNmZjA5Y2EzYTAgczAgOiBmZmZmZmZkMDA0MTZiZGMwCj4+
IFvCoMKgIDEwLjQwMzM4MV3CoCBzMSA6IDAwMDAwMDAwMDAwMDAwMDAgYTAgOiBmZmZmZmZkMDA0
MTZiZGQ4IGExIDogMDAwMDAwMDAwMDAwMDAwMAo+PiBbwqDCoCAxMC40MTA1OTBdwqAgYTIgOiAw
MDAwMDAwMDAwMDAwMDEwIGEzIDogMDAwMDAwMDAwMDAwMDA0MCBhNCA6IGZmZmZmZmQwMDQxNmJl
MTgKPj4gW8KgwqAgMTAuNDE3ODAwXcKgIGE1IDogMDAwMDAwM2ZmZmZmZmZmMCBhNiA6IDAwMDAw
MDAwMDAwMDAwMGYgYTcgOiBmZmZmZmZlMDg1ZDU4NTQwCj4+IFvCoMKgIDEwLjQyNTAwOV3CoCBz
MiA6IDAwMDAwMDAwMDAwMDAwMTAgczMgOiBmZmZmZmZkMDA0MTZiZGQ4IHM0IDogMDAwMDAwMDAw
MDAwMDAwMgo+PiBbwqDCoCAxMC40MzIyMThdwqAgczUgOiAwMDAwMDAwMDAwMDAwMDAwIHM2IDog
MDAwMDAwMDAwMDAwMDAwMCBzNyA6IGZmZmZmZmUwODQxYjM2ODAKPj4gW8KgwqAgMTAuNDM5NDI3
XcKgIHM4IDogMDAwMDAwMmFhZDc4ODA0MCBzOSA6IDAwMDAwMDAwMDAwMDAwMDAgczEwOiAwMDAw
MDAwMDAwMDAwMDAxCj4+IFvCoMKgIDEwLjQ0NjYzNl3CoCBzMTE6IDAwMDAwMDAwMDAwMDAwMDAg
dDMgOiAwMDAwMDAwMDAwMDAwMDAwIHQ0IDogMDAwMDAwMDAwMDAwMDAwMQo+PiBbwqDCoCAxMC40
NTM4NDVdwqAgdDUgOiAwMDAwMDAwMDAwMDAwMDEwIHQ2IDogMDAwMDAwMDAwMDA0MDAwMAo+PiBb
wqDCoCAxMC40NTkxNDRdIHN0YXR1czogMDAwMDAwMDIwMDA0MDEyMCBiYWRhZGRyOiAwMDAwMDAw
MDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwMDAwMDAwMDBkCj4+IFvCoMKgIDEwLjQ2NzA0OV0gWzxm
ZmZmZmZmZjgwOTlhMjgwPl0gX19hc21fY29weV9mcm9tX3VzZXIrMHg0OC8weGYwCj4+IFvCoMKg
IDEwLjQ3Mjk1NV0gWzxmZmZmZmZmZjgwMDlhNTYyPl0gZG9fc2VjY29tcCsweDYyLzB4OGJlCj4+
IFvCoMKgIDEwLjQ3ODA3OV0gWzxmZmZmZmZmZjgwMDlhZjU4Pl0gcHJjdGxfc2V0X3NlY2NvbXAr
MHgyNC8weDMyCj4+IFvCoMKgIDEwLjQ4MzcyNV0gWzxmZmZmZmZmZjgwMDIwNzU2Pl0gc3lzX3By
Y3RsKzB4ZjYvMHg0NTAKPj4gW8KgwqAgMTAuNDg4NzYzXSBbPGZmZmZmZmZmODAwMDM0ZjI+XSBy
ZXRfZnJvbV9zeXNjYWxsKzB4MC8weDIKPj4KPj4KPj4gVGhlIFBDIHJlZ2lzdGVyIHBvaW50cyB0
byB0aGlzIGxpbmU6Cj4+Cj4+ICsxOgo+PiArwqDCoMKgIFJFR19MwqDCoMKgIGE1LCAwKGExKQo+
IFRoYW5rcyBmb3IgdGVzdGluZyEgRG8geW91IG1pbmQgdGVhY2hpbmcgbWUgaG93IHRvIHJlcHJv
ZHVjZSB0aGUgZXJyb3I/Cj4KPiBBa2lyYQo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
