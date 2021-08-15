Return-Path: <SRS0=ocBP=NG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FORGED_MUA_MOZILLA,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INVALID_MSGID,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0AFC4338F
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Aug 2021 02:32:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5D4060F46
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Aug 2021 02:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5D4060F46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+STwiytTNFGD94Zv0szJrtTszLou2n6kmmvrFBDRK9Y=; b=Dl/n1OrhCYehJSSAyEGtpe1r6P
	rVzGKMMu6c9KegxDutWdd1R5DLI9sjMPfgOE9xjE1iBLHpUPE3fdaGhYTrJaiBEUi1OfLZG/jGOLD
	P0+s6KHHSJgOFDmVXPbwzty1srA+SEDjStUVFdoBzTur7zJYPiXtUVwnnsNaSRS9tCrtaef49gmpI
	UzHbVVEUV9tzD+ciDnHljL4RO42AIC9arLKTDR0MNcuNOhmmJTphVlJUG81vpQz8Rqxm4+FdLyOyi
	lfl27U88H39aKW4/spG8d3gqHpFprczgFSjVrNNarqCSMjOlltgRat1jwggyUFIi41FBF/geppbQd
	XFymtmig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mF5wL-00Enf2-4x; Sun, 15 Aug 2021 02:31:57 +0000
Received: from smtpbg465.qq.com ([59.36.132.35] helo=qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mF5wH-00EneH-1M
 for linux-riscv@lists.infradead.org; Sun, 15 Aug 2021 02:31:55 +0000
X-QQ-mid: bizesmtp46t1628994608tol6l9q9
Received: from [192.168.31.150] (unknown [111.18.135.17])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 15 Aug 2021 10:30:06 +0800 (CST)
X-QQ-SSF: 01400000002000B0H000B00A0000000
X-QQ-FEAT: Clqse/GOb8Nuajy3QJqehSW6VzoJ9plcGmeU4+EH8ALjSuhFn/PGgdrItedLW
 ldCqO7sHzalEyEm8UzDtQFWRe23pSn4zREwPK9Fw1JBmjx21difpNBR5Ptfgk5TvMke44pg
 b1eLeAQe1OnNjksxb89sUZYCCM8aoLY/KKYPBdk8VaT74ItGrUjzn60lJJBoFMVRZjdb7Qb
 b4dnJWX0eSo0qReHJMRrH+HSbzKbcJ0X/4aUy4Kcn62PPYzrXfNJ19eoR2YA8gkRkShB9Jd
 7ITgNRjybMB1jjChnWIiRWBzsNWXNurBrTz7P+A79MALLGkaFeslUiytLRDMHMl42BAWgdr
 Nu8gip0NEUiy16MUrQ=
X-QQ-GoodBg: 2
From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
Subject: Re: [PATCH 0/1] __asm_copy_to-from_user: Reduce more byte_copy
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Guenter Roeck <linux@roeck-us.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <65f08f01-d4ce-75c2-030b-f8759003e061@gmail.com>
 <a70451d1-57ad-6b49-24c1-6408ef94a959@gmail.com>
Message-ID: <21b55fd7-7ab5-10e9-4fc9-1815ec95927d@kylinos.com.cn>+CAD35DCFE7A1B625
Date: Sun, 15 Aug 2021 10:30:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <a70451d1-57ad-6b49-24c1-6408ef94a959@gmail.com>
Content-Language: en-US
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.com.cn:qybgweb:qybgweb14
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210814_193153_458944_F2D9495E 
X-CRM114-Status: GOOD (  15.86  )
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

SGkgQWtpcmEsCgoKVGhpcyBwYXRjaCBicmVha3MgbXkgdXNlcnNwYWNlwqAgYW5kIEkgY2FuJ3Qg
Ym9vdCBteSBzeXN0ZW0gYWZ0ZXIgCmFwcGx5aW5nIHRoaXMuIEhlcmUgaXMgdGhlIHN0YWNrIHRy
YWNlOgoKClvCoMKgIDEwLjM0OTA4MF0gVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlIGF0IAp2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAwMApbwqDC
oCAxMC4zNTcxMTZdIE9vcHMgWyMxNV0KW8KgwqAgMTAuMzU5NDMzXSBDUFU6IDIgUElEOiAxNjkg
Q29tbTogKG5ldHdvcmtkKSBUYWludGVkOiBHIETCoMKgwqDCoMKgwqDCoMKgwqDCoCAKNS4xNC4w
LXJjNSAjNTMKW8KgwqAgMTAuMzY3NDIyXSBIYXJkd2FyZSBuYW1lOiBTaUZpdmUgSGlGaXZlIFVu
bWF0Y2hlZCBBMDAgKERUKQpbwqDCoCAxMC4zNzI5ODFdIGVwYyA6IF9fYXNtX2NvcHlfZnJvbV91
c2VyKzB4NDgvMHhmMApbwqDCoCAxMC4zNzc1ODRdwqAgcmEgOiBfY29weV9mcm9tX3VzZXIrMHgy
OC8weDY4ClvCoMKgIDEwLjM4MTc1NF0gZXBjIDogZmZmZmZmZmY4MDk5YTI4MCByYSA6IGZmZmZm
ZmZmODAzNjE0YTggc3AgOiAKZmZmZmZmZDAwNDE2YmQ5MApbwqDCoCAxMC4zODg5NjNdwqAgZ3Ag
OiBmZmZmZmZmZjgxMWVlNTQwIHRwIDogZmZmZmZmZTA4NDFiMzY4MCB0MCA6IApmZmZmZmZkMDA0
MTZiZGUwClvCoMKgIDEwLjM5NjE3Ml3CoCB0MSA6IGZmZmZmZmQwMDQxNmJkZDggdDIgOiAwMDAw
MDAzZmYwOWNhM2EwIHMwIDogCmZmZmZmZmQwMDQxNmJkYzAKW8KgwqAgMTAuNDAzMzgxXcKgIHMx
IDogMDAwMDAwMDAwMDAwMDAwMCBhMCA6IGZmZmZmZmQwMDQxNmJkZDggYTEgOiAKMDAwMDAwMDAw
MDAwMDAwMApbwqDCoCAxMC40MTA1OTBdwqAgYTIgOiAwMDAwMDAwMDAwMDAwMDEwIGEzIDogMDAw
MDAwMDAwMDAwMDA0MCBhNCA6IApmZmZmZmZkMDA0MTZiZTE4ClvCoMKgIDEwLjQxNzgwMF3CoCBh
NSA6IDAwMDAwMDNmZmZmZmZmZjAgYTYgOiAwMDAwMDAwMDAwMDAwMDBmIGE3IDogCmZmZmZmZmUw
ODVkNTg1NDAKW8KgwqAgMTAuNDI1MDA5XcKgIHMyIDogMDAwMDAwMDAwMDAwMDAxMCBzMyA6IGZm
ZmZmZmQwMDQxNmJkZDggczQgOiAKMDAwMDAwMDAwMDAwMDAwMgpbwqDCoCAxMC40MzIyMThdwqAg
czUgOiAwMDAwMDAwMDAwMDAwMDAwIHM2IDogMDAwMDAwMDAwMDAwMDAwMCBzNyA6IApmZmZmZmZl
MDg0MWIzNjgwClvCoMKgIDEwLjQzOTQyN13CoCBzOCA6IDAwMDAwMDJhYWQ3ODgwNDAgczkgOiAw
MDAwMDAwMDAwMDAwMDAwIHMxMDogCjAwMDAwMDAwMDAwMDAwMDEKW8KgwqAgMTAuNDQ2NjM2XcKg
IHMxMTogMDAwMDAwMDAwMDAwMDAwMCB0MyA6IDAwMDAwMDAwMDAwMDAwMDAgdDQgOiAKMDAwMDAw
MDAwMDAwMDAwMQpbwqDCoCAxMC40NTM4NDVdwqAgdDUgOiAwMDAwMDAwMDAwMDAwMDEwIHQ2IDog
MDAwMDAwMDAwMDA0MDAwMApbwqDCoCAxMC40NTkxNDRdIHN0YXR1czogMDAwMDAwMDIwMDA0MDEy
MCBiYWRhZGRyOiAwMDAwMDAwMDAwMDAwMDAwIGNhdXNlOiAKMDAwMDAwMDAwMDAwMDAwZApbwqDC
oCAxMC40NjcwNDldIFs8ZmZmZmZmZmY4MDk5YTI4MD5dIF9fYXNtX2NvcHlfZnJvbV91c2VyKzB4
NDgvMHhmMApbwqDCoCAxMC40NzI5NTVdIFs8ZmZmZmZmZmY4MDA5YTU2Mj5dIGRvX3NlY2NvbXAr
MHg2Mi8weDhiZQpbwqDCoCAxMC40NzgwNzldIFs8ZmZmZmZmZmY4MDA5YWY1OD5dIHByY3RsX3Nl
dF9zZWNjb21wKzB4MjQvMHgzMgpbwqDCoCAxMC40ODM3MjVdIFs8ZmZmZmZmZmY4MDAyMDc1Nj5d
IHN5c19wcmN0bCsweGY2LzB4NDUwClvCoMKgIDEwLjQ4ODc2M10gWzxmZmZmZmZmZjgwMDAzNGYy
Pl0gcmV0X2Zyb21fc3lzY2FsbCsweDAvMHgyCgoKVGhlIFBDIHJlZ2lzdGVyIHBvaW50cyB0byB0
aGlzIGxpbmU6CgorMToKKwlSRUdfTAlhNSwgMChhMSkKCgpRaXUKCgpPbiA4LzEyLzIxIDc6MDEg
UE0sIEFraXJhIFRzdWthbW90byB3cm90ZToKPiBIaSBHdWVudGVyLCBHZWVydCBhbmQgUWl1LAo+
Cj4gV291bGQgeW91IG1pbmQgdGVzdGluZyB0aGlzIHBhdGNoPwo+IFRoYW5rcywKPgo+IEFraXJh
Cj4KPiBPbiA3LzMwLzIwMjEgMTA6NTAgUE0sIEFraXJhIFRzdWthbW90byB3cm90ZToKPj4gQWRk
aW5nIG5vbmUgdW5yb2xsaW5nIHdvcmRfY29weSwgd2hpY2ggaXMgdXNlZCBpZiB0aGUgc2l6ZSBp
cyBzbWFsbGVyCj4+IHRoYW4gOSpTWlJFRy4KPj4KPj4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiBQ
YWxtZXIncyBwYXN0IGNvbW1lbnQuCj4+PiBNeSBndWVzcyBpcyB0aGF0IHNvbWUgd29ya2xvYWRz
IHdpbGwgd2FudCBzb21lIHNtYWxsZXIgdW5yb2xsaW5nIGZhY3RvcnMsCj4+IEl0IHdpbGwgcmVk
dWNlIHRoZSBudW1iZXIgb2Ygc2xvdyBieXRlX2NvcHkgYmVpbmcgdXNlZCB3aGVuIHRoZQo+PiBz
aXplIGlzIHNtYWxsLgo+Pgo+PiBIYXZlIHRlc3RlZCBvbiBxZW11IHJ2MzIsIHFlbXUgcnY2NCBh
bmQgYmVhZ2xldiBiZXRhIGJvYXJkLgo+Pgo+PiBJbiB0aGUgZnV0dXJlLCBJIGFtIHBsYW5uaW5n
IHRvIGNvbnZlcnQgdWFjY2Vzcy5TIHRvIGlubGluZSBhc3NlbWJseQo+PiBpbiAuYyBmaWxlLiBU
aGVuIGl0IHdpbGwgYmUgZWFzaWVyIHRvIG9wdGltaXplIG9uIGJvdGggaW4tb3JkZXIgY29yZSBh
bmQKPj4gb3V0LW9mLW9yZGVyIGNvcmUgd2l0aCAjaWZkZWYgbWFjcm8gaW4gYy4KPj4KPj4gQWtp
cmEgVHN1a2Ftb3RvICgxKToKPj4gICAgcmlzY3Y6IF9fYXNtX2NvcHlfdG8tZnJvbV91c2VyOiBJ
bXByb3ZlIHVzaW5nIHdvcmQgY29weSBpZiBzaXplIDwKPj4gICAgICA5KlNaUkVHCj4+Cj4+ICAg
YXJjaC9yaXNjdi9saWIvdWFjY2Vzcy5TIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
