Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F1EC43334
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jul 2022 11:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tf01rEVKY6rlVMAuKKKy/tysgasI5PCFo4z1F9o+wfk=; b=vqdDlGJX0qz1V6
	7ZrnYmlePLlqKcn8P1nH8hxitv0lY1qsis//DXm3m/NYSwm96HjNXIJDYQfCGKT+EahCxKFU1x9TT
	2MToaPDhu5SIgAmcGKhwHo6eFG+V4Ai/rAvVa3rGy6gursmsShTUwmmahLaDbIorWfAZZOh5U+JoJ
	Epdabg+GULR+wx20RZrAS7GnwZf3b3si3X0vlnLy+hM0e0bmgBH35poebHskE3jCp8OFl9T45uHyc
	Uzt2dUAe/1lcy5ZiU/KuO7ztDC5JwY06cOqWOYsSRU0Sftfbs7IQWhIZj8sBIgNoKNsAFgMEv5av4
	RsK0qkx2Ld8qPjawbCIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFwQ9-008yrm-OM; Mon, 25 Jul 2022 11:38:45 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFwQ6-008yiW-KX
	for linux-riscv@lists.infradead.org; Mon, 25 Jul 2022 11:38:44 +0000
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.17])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oFwPy-006HBs-2y; Mon, 25 Jul 2022 12:38:34 +0100
Message-ID: <15612a9b-004a-3bdf-cd3a-ec205a152e57@codethink.co.uk>
Date: Mon, 25 Jul 2022 12:38:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] [PATCH v2] riscv: add as-options for modules with
 assembly compontents
Content-Language: en-GB
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel@lists.codethink.co.uk, linux-riscv@lists.infradead.org
References: <mhng-e9fd43e2-2d5f-40e6-b7ba-cad78f2a118b@palmer-mbp2014>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <mhng-e9fd43e2-2d5f-40e6-b7ba-cad78f2a118b@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_043842_698776_B534D4EB 
X-CRM114-Status: GOOD (  10.95  )
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

T24gMjEvMDcvMjAyMiAyMDo1MywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gU3VuLCAyOSBN
YXkgMjAyMiAwODoyMjowMCBQRFQgKC0wNzAwKSwgYmVuLmRvb2tzQGNvZGV0aGluay5jby51ayB3
cm90ZToKCltuaXAKCj4+IMKgIyBHQ0MgdmVyc2lvbnMgdGhhdCBzdXBwb3J0IHRoZSAiLW1zdHJp
Y3QtYWxpZ24iIG9wdGlvbiBkZWZhdWx0IHRvIAo+PiBhbGxvd2luZwo+PiDCoCMgdW5hbGlnbmVk
IGFjY2Vzc2VzLsKgIFdoaWxlIHVuYWxpZ25lZCBhY2Nlc3NlcyBhcmUgZXhwbGljaXRseSAKPj4g
YWxsb3dlZCBpbiB0aGUKPiAKPiBTb3JyeSBmb3IgYmVpbmcgc28gc2xvdyBoZXJlLCBJJ3ZlIGdv
dHRlbiBwcmV0dHkgYnVyaWVkIGFuZCBpdCB3YXNuJ3QgCj4gY2xlYXIgdGhpcyB3YXMgYSBmaXgu
wqAgSSBwdXQgaXQgaW4gZml4ZXMgd2l0aCBzb21lIHRhZ3MuCgpJcyBpdCB0aW1lIGZvciBsaW51
eC1yaXNjdiBsaXN0IHRvIGhhdmUgYSBwYXRjaCB0cmFja2VyIG9uPyBUaGlzIG1pZ2h0CmhlbHAg
d2l0aCB0cmFja2luZyBwYXRjaGVzIGZvciBldmVyeW9uZS4KCgotLSAKQmVuIERvb2tzCQkJCWh0
dHA6Ly93d3cuY29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0g
UHJvdmlkaW5nIEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRt
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
