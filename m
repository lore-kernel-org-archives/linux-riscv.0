Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33007C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 03:10:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C002A60234
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 03:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C002A60234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LShFcy7tJr2PnRSUBdoS2gdSwf/rbLHt9DwTM+ZGFJU=; b=ZRvH99nSwu2SelvdeA74Oa8/Vk
	WFhMsSRL1IYXF4m3nGOxSSdeuFi9v5mncAtJekBgJ1SAvX3u1cIr/z2UNUt2AmYZgmUrGiCzQ8bO7
	QIsmM8ckuTJsHgOFh/H03y6IltHUTt4RrQpLYaPRhVnin7xoD6UiuLtqpj0fv7n1fiUVBaiomBYms
	2adAJhGF78NoQ94tR6ZG6+9IHAHSdnisMKDX+J7c9a8AfCQhSYqn8hJdNg4AfA/LofE0MlnVNCUkR
	AOUbYtKYuRyGRADs6PGdGRuf0uEUD06kg/LKfXT+Mncm3ZGIEuAQbumCoVEqa3WWWc4cgyAmrPicS
	nusqQx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ZxL-00GtDE-FX; Wed, 28 Jul 2021 03:10:03 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ZxH-00GtCE-Hv
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 03:10:01 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZJQf6y7ZzYhKg;
 Wed, 28 Jul 2021 11:03:54 +0800 (CST)
Received: from dggpemm000001.china.huawei.com (7.185.36.245) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 11:09:48 +0800
Received: from [10.174.177.183] (10.174.177.183) by
 dggpemm000001.china.huawei.com (7.185.36.245) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 11:09:47 +0800
Subject: Re: [PATCH -next] riscv: mm: remove redundant trampoline PGD for 64bit
To: Alex Ghiti <alex@ghiti.fr>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <anup.patel@wdc.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <wangkefeng.wang@huawei.com>
References: <20210527144819.12101-1-sunnanyong@huawei.com>
 <33f93026-cbd2-acd4-e737-c744207f82f2@ghiti.fr>
From: "Sunnanyong (Nanyong Sun, Intelligent Computing Solution Development
 Dep)" <sunnanyong@huawei.com>
Message-ID: <fe5c5f82-2528-caf9-9bd4-09987bdec05c@huawei.com>
Date: Wed, 28 Jul 2021 11:09:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <33f93026-cbd2-acd4-e737-c744207f82f2@ghiti.fr>
X-Originating-IP: [10.174.177.183]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm000001.china.huawei.com (7.185.36.245)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_200959_998738_E19BB723 
X-CRM114-Status: GOOD (  17.22  )
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

5ZyoIDIwMjEvNi8yOSAyMTowMSwgQWxleCBHaGl0aSDlhpnpgZM6Cgo+IEhpIE5hbnlvbmcsCj4K
PiBMZSAyNy8wNS8yMDIxIMOgIDE2OjQ4LCBOYW55b25nIFN1biBhIMOpY3JpdMKgOgo+PiBSZW1v
dmUgcmVkdW5kYW50IHRyYW1wb2xpbmUgUEdEIGZvciA2NGJpdCBhbmQgYWRkIG1vcmUgY29tbWVu
dAo+PiBmb3Igd2h5IDMyYml0IHN5c3RlbXMgbmVlZCB0cmFtcG9saW5lIFBHRC4KPj4KPj4gVGhl
cmUgd2FzIGEgcGF0Y2ggYW5kIGRpc2N1c3Npb24gc2ltaWxhciB0byB0aGlzLHJlZmVyIHRvCj4+
IHRoZSBsaW5rIFsxXVsyXS4KPj4KPj4gVGhlIHRyYW1wb2xpbmUgUEdEIGlzIHJlZHVuZGFudCBm
b3IgNjRiaXQgc3lzdGVtcyBiZWNhdXNlOgo+PiAxLiBUaGUgZWFybHkgUEdEIGNvdmVycyB0aGUg
ZW50aXJlIGtlcm5lbCBtYXBwaW5nLiBEaXJlY3RseQo+PiBsb2FkaW5nIGVhcmx5IFBHRCBjYW4g
YWNoaWV2ZSB0aGUgcmVzdWx0IGluIGJvb3Qgc3RhZ2UuCj4+IEEgbW9yZSB0cmFtcG9saW5lIFBH
RCBtYWtlcyBjb2RlIGhhcmQgdG8gdW5kZXJzdGFuZC4KPj4gMi4gRGlyZWN0bHkgbG9hZGluZyBl
YXJseSBQR0QgaXMgc2FmZSBpbiA2NGJpdCBzeXN0ZW1zIHNpbmNlCj4+IHRoZSBrZXJuZWwgdmly
dHVhbCBhZGRyZXNzIHN0YXJ0cyBhcyAweEZGRkZ4eHh4eHh4eHh4eHgsCj4+IHdoaWNoIGhhcyBh
IHZlcnkgYmlnIGdhcCB3aXRoIFJBTSBhZGRyZXNzLkl0IHdvbid0IGZhbGwgaW50bwo+PiB0aGUg
Y29ybmVyIGNhc2UgdGhhdCAzMmJpdCBzeXN0ZW0gd29ycnlzLgo+PiAzLiBSZW1vdmUgcmVkdW5k
YW50IHRyYW1wb2xpbmUgUEdEIGNhbiBiZW5lZml0IHRvIGNvZGUgbWFpbnRhaW5jZSwKPj4gYmVj
YXVzZSA2NGJpdCBzeXN0ZW1zIGhhdmUgbW9yZSBwYWdlIHRhYmxlIGxldmVscy5Gb3IgZXhhbXBs
ZToKPj4gSWYgd2Ugd2FudCB0byBzdXBwb3J0IFNWNDggd2hpY2ggaGFzIDQgcGFnZSB0YWJsZSBs
ZXZlbHMsIHdlIGhhdmUKPj4gdG8gYWRkIGEgdHJhbXBvbGluZV9wdWQgYW5kIGluc2VydCBpdCBi
ZWZvcmUgdHJhbXBvbGluZV9wbWQuCj4KPiBJIGRvIGFncmVlIHdpdGggeW91ciBsYXN0IHBvaW50
IGFib3V0IGNvZGUgbWFpbnRlbmFuY2UgYW5kIHRoaXMgd291bGQgCj4gYmUgYSB3ZWxjb21lIGlt
cHJvdmVtZW50IGJlZm9yZSBJIHJlc3BpbiBteSBzdjQ4IHNlcmllcy4KPgo+IFNvbWUgY29tbWVu
dHMgYmVsb3cgdGhvdWdoLgo+Cj4+Cj4+IFJlZmVyZW5jZSBsaW5rOgo+PiBbMV1odHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDE5MDMyNTA5MjIzNC41NDUxLTQtYW51cC5wYXRl
bEB3ZGMuY29tLyAKPj4KPj4gWzJdaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMTkvMy8yOC8xNDcK
Pj4KPj4gU2lnbmVkLW9mZi1ieTogTmFueW9uZyBTdW4gPHN1bm5hbnlvbmdAaHVhd2VpLmNvbT4K
Pj4gLS0tCj4+IMKgIGFyY2gvcmlzY3Yva2VybmVsL2hlYWQuUyB8IDEzICsrKysrKysrKysrLS0K
Pj4gwqAgYXJjaC9yaXNjdi9tbS9pbml0LmPCoMKgwqDCoCB8IDIxICsrKysrKystLS0tLS0tLS0t
LS0tLQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvaGVhZC5TIGIvYXJjaC9y
aXNjdi9rZXJuZWwvaGVhZC5TCj4+IGluZGV4IDg5Y2M1OGFiNTJiNC4uMTg5N2IxN2M1ZmNjIDEw
MDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9oZWFkLlMKPj4gKysrIGIvYXJjaC9yaXNj
di9rZXJuZWwvaGVhZC5TCj4+IEBAIC05MywxMiArOTMsMTggQEAgcmVsb2NhdGU6Cj4+IMKgwqDC
oMKgwqAgYWRkIGEyLCBhMiwgYTEKPj4gwqDCoMKgwqDCoCBjc3J3IENTUl9UVkVDLCBhMgo+Cj4g
VGhpcyBpcyBub3QgbmVlZGVkIGluIDY0LWJpdCB0aGVuLgo+Cj4KSSdtIGFmcmFpZCB0aGlzIGlz
IHN0aWxsIG5lZWRlZCBmb3IgNjQtYml0LCB3aGljaCBjYW4gY29udmVydCB0aGUgCnBoeXNpY2Fs
IGFkZHJlc3Mgd29ybGQgdG8gdGhlIHZpcnR1YWwgYWRkcmVzcyB3b3JsZC4KCkkgYWxzbyBoYXZl
IG1hZGUgYSBleHBlcmltZW50LCBpdCBjb3VsZCBub3QgYm9vdCB1cCBpZiB0aGlzIGlzIGRlbGV0
ZWQuCgo+IFRoYW5rcywKPgo+IEFsZXgKPiAuCgpIaSBBbGV4LAoKIMKgwqDCoCBWZXJ5IHRoYW5r
cyBmb3IgeW91ciBjYXJlZnVsbHkgcmV2aWV3LCBJIGhhdmUgdXBkYXRlZCB0byB2ZXJzaW9uIAp0
d28ganVzdCBub3cgOiApCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
