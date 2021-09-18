Return-Path: <SRS0=8Mga=OI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D8CBC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 01:15:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E556E6112E
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 01:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E556E6112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiSgLItvCAhcpJX3PBf9C0stsEJZBxyvCnluAeeyRRQ=; b=2w6Bwyc4RTrZVeEmREQyYI/3JN
	jylRV1wAFQeFP4coQBS4ibG+nGx2IQn8eEwGM7FjbX+ryfM8R4rYe0CVgHaYaitLJnfy/05iOSVrH
	TRnWcg8fo0MBZpJ64w+RzHd+lrNhdhDxVC9AlBHi4kT7TSI6wg8o24G6fb8iQLkDiSmGBVL5opqbp
	uAm6cC053+fk2aSzYNR8l9q8CgoFCYq3WYkIJpeY1ZngNf5ANR7FrnA2ClI3Xt6WXlSbWDmu3N0W1
	e0htZMjswLA1sGp9WhP+9ya8X3WRSXsDowWsfF14jOe9/noD8QFCOt+8qA5fqt9pgbkqiE29o0xkt
	pVHYK60Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mROvt-00FFj7-Jn; Sat, 18 Sep 2021 01:14:21 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mROvq-00FFi8-Fc
 for linux-riscv@lists.infradead.org; Sat, 18 Sep 2021 01:14:20 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HBCVk4hsxzWK5b;
 Sat, 18 Sep 2021 09:13:02 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sat, 18 Sep 2021 09:14:06 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Sat, 18 Sep 2021 09:14:06 +0800
Subject: Re: [PATCH v2 0/2] riscv: improve unaligned memory accesses
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>, Chen Huang
 <chenhuang5@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Darius Rad
 <darius@bluespec.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20210916130855.4054926-1-chenhuang5@huawei.com>
 <20210917221429.4d3a15ca@xhacker>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <9200c4c2-44b9-480e-6970-5188640fb00a@huawei.com>
Date: Sat, 18 Sep 2021 09:14:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210917221429.4d3a15ca@xhacker>
Content-Language: en-US
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_181418_738546_4236E6C8 
X-CRM114-Status: GOOD (  13.77  )
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

Ck9uIDIwMjEvOS8xNyAyMjoxNCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiBPbiBUaHUsIDE2IFNl
cCAyMDIxIDEzOjA4OjUzICswMDAwCj4gQ2hlbiBIdWFuZyA8Y2hlbmh1YW5nNUBodWF3ZWkuY29t
PiB3cm90ZToKPgo+PiBUaGUgcGF0Y2hzZXQgaW1wcm92ZXMgUklTQ1YgdW5hbGlnbmVkIG1lbW9y
eSBhY2Nlc3Nlcywgc2VsZWN0cwo+PiBIQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTIGlm
IENQVV9IQVNfTk9fVU5BTElHTkVEIG5vdAo+PiBlbmFibGVkIGFuZCBzdXBwb3J0cyBEQ0FDSEVf
V09SRF9BQ0NFU1MgdG8gaW1wcm92ZSB0aGUgZWZmaWNpZW5jeQo+PiBvZiB1bmFsaWduZWQgbWVt
b3J5IGFjY2Vzc2VzLgo+Pgo+PiBJZiBDUFUgZG9uJ3Qgc3VwcG9ydCB1bmFsaWduZWQgbWVtb3J5
IGFjY2Vzc2VzIGZvciBub3csIHBsZWFzZQo+PiBzZWxlY3QgQ09ORklHX0NQVV9IQVNfTk9fVU5B
TElHTkVELiBGb3IgSSBkb24ndCBrbm93IHdoaWNoIENQVQo+PiBkb24ndCBzdXBwb3J0IHVuYWxp
Z25lZCBtZW1vcnkgYWNjZXNzZXMsIEkgZG9uJ3QgY2hvb3NlIHRoZQo+PiBDT05GSUcgZm9yIHRo
ZW0uCj4gVGhpcyB3aWxsIGJyZWFrIHVuaWZpZWQga2VybmVsIEltYWdlIGZvciByaXNjdi4gT2J2
aW91c2x5LCB3ZSB3aWxsIGhhdmUKPiB0d28gaW1hZ2VzIGZvciBlZmZpY2llbnQgdW5hbGlnbmVk
IGFjY2VzcyBwbGF0Zm9ybXMgYW5kIG5vbi1lZmZpY2llbnQKPiB1bmFsaWduZWQgYWNjZXNzIHBs
YXRmb3Jtcy4gSU1ITywgd2UgbWF5IG5lZWQgYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIG9yCj4gc29t
ZXRoaW5nIGVsc2UgdG8gZHluYW1pY2FsbHkgZW5hYmxlIHJlbGF0ZWQgY29kZSBwYXRoLgoKaXQg
d29uJ3QgYnJlYWsgdW5pZmllZCBrZXJuZWwgSW1hZ2UgZm9yIHJpc2N2LCBpZiBvbmUgU29DIGNo
b29zZQoKQ1BVX0hBU19OT19VTkFMSUdORUQsIHRoZSBzaW5nbGUgSW1hZ2Ugd29uJ3Qgc3VwcG9y
dCB1bmFsaWduZWQgbWVtb3J5CgphY2Nlc3NlcywgaW5kZWVkLCBpdCBkZXBlbmRzIG9uIHRoZSBD
T05GSUcsIGFuZCBub3csIGFybS9wb3dlcnBjL202OGsgaGFzCgpzaW1pbGFyIGNvbmZpZ3VyYXRp
b24uCgpZZXMswqAgaXQgY291bGQgYmUgYW4gb3B0aW1pemF0aW9uIHZpYSBhbHRlcm5hdGl2ZSBt
ZWNoYW5pc20gb3Igc29tZXRoaW5nIAplbHNlIHRvCgpkeW5hbWljYWxseSBlbmFibGUgcmVsYXRl
ZCBjb2RlIHBhdGggbGF0ZXIuCgo+Cj4gUmVnYXJkcwo+Cj4+IENoYW5nZXMgc2luY2UgdjE6Cj4+
ICAgLSBBcyBEYXJpdXMgUmFkIGFuZCBKaXNoZW5nIFpoYW5nIG1lbnRpb25lZCwgc29tZSBDUFVz
IGRvbid0IHN1cHBvcnQKPj4gICAgIHVuYWxpZ25lZCBtZW1vcnkgYWNjZXNzZXMsIGFkZCBhbiBv
cHRpb24gZm9yIENQVXMgdG8gY2hvb3NlIGl0IG9yIG5vdC4KPj4KPj4gQ2hlbiBIdWFuZyAoMik6
Cj4+ICAgIHJpc2N2OiBzdXBwb3J0IEhBVkVfRUZGSUNJRU5UX1VOQUxJR05FRF9BQ0NFU1MKPj4g
ICAgcmlzY3Y6IFN1cHBvcnQgRENBQ0hFX1dPUkRfQUNDRVNTCj4+Cj4+ICAgYXJjaC9yaXNjdi9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysrKwo+PiAgIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vd29yZC1hdC1hLXRpbWUuaCB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDQyIGluc2VydGlvbnMoKykKPj4KPgo+IC4KPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
