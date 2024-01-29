Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CCEC47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 09:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mPFtFNzEWx8b/pudsDy0gMI3w+REG3v4ht62ZPJlggg=; b=s9+c8dc7amMbn3
	TmZ6Q7R7l01l9O3EeatIWBMOPOf+emlUtYMfMJPyr1pPMnO/BMMyaQ8xArIEwL1qh624BPzoxWGGc
	4nLkb3xFlplHZDESSABGornealIavKhN2HlcZpk2A007t5e4PNpcgWTFO5w0OX0bhDBFRib6Vt8Gb
	0ROk2qEi3o7/O9poVwzzQvLeIB/mitQ+TqXYALNxkFelU8bK3YMYBuc1ijTscDdpIC7ZtolWYAUhG
	q26eHHTSpNvunVggK+lHFSuQ5lJrx5oBhz4Qm4wz9WtB12bC744WUhwJZZJdDIJdwYHYayq1DNrnQ
	X4KN8GbdC3kJV7Ff3Lgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNhq-0000000BxC5-0RQq;
	Mon, 29 Jan 2024 09:13:30 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUNhm-0000000Bx7n-3nnh
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 09:13:28 +0000
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4TNjGJ63hCz1gy0l;
	Mon, 29 Jan 2024 17:11:20 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 4393E14011D;
	Mon, 29 Jan 2024 17:13:09 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Mon, 29 Jan 2024 17:13:08 +0800
Message-ID: <03ebc63f-7b96-4a70-ad10-a4ffc1d5b1cc@huawei.com>
Date: Mon, 29 Jan 2024 17:13:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND bpf-next v3 4/6] riscv, bpf: Add necessary Zbb
 instructions
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Pu Lehui
	<pulehui@huaweicloud.com>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <netdev@vger.kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
	<yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh
	<kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <20240115131235.2914289-5-pulehui@huaweicloud.com>
 <871qa2zog6.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <871qa2zog6.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_011327_116326_134AE6C9 
X-CRM114-Status: UNSURE (   9.34  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDI0LzEvMjggMToxNiwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gRnJvbTogUHUgTGVodWkgPHB1bGVo
dWlAaHVhd2VpLmNvbT4KPj4KPj4gQWRkIG5lY2Vzc2FyeSBaYmIgaW5zdHJ1Y3Rpb25zIGludHJv
ZHVjZWQgYnkgWzBdIHRvIHJlZHVjZSBjb2RlIHNpemUgYW5kCj4+IGltcHJvdmUgcGVyZm9ybWFu
Y2Ugb2YgUlY2NCBKSVQuIE1lYW53aGlsZSwgYSBydW50aW1lIGRldGV0ZWQgaGVscGVyIGlzCj4+
IGFkZGVkIHRvIGNoZWNrIHdoZXRoZXIgdGhlIENQVSBzdXBwb3J0cyBaYmIgaW5zdHJ1Y3Rpb25z
Lgo+Pgo+PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYml0bWFuaXAvcmVs
ZWFzZXMvZG93bmxvYWQvMS4wLjAvYml0bWFuaXAtMS4wLjAtMzgtZzg2NWU3YTcucGRmIFswXQo+
PiBTaWduZWQtb2ZmLWJ5OiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+PiAtLS0KPj4g
ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0LmggfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmggYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0
LmgKPj4gaW5kZXggZTMwNTAxYjQ2ZjhmLi41MWY2ZDIxNDA4NmYgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXQuaAo+PiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0LmgK
Pj4gQEAgLTE4LDYgKzE4LDExIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBydmNfZW5hYmxlZCh2b2lk
KQo+PiAgIAlyZXR1cm4gSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX0MpOwo+PiAgIH0KPj4g
ICAKPj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBydnpiYl9lbmFibGVkKHZvaWQpCj4+ICt7Cj4+ICsJ
cmV0dXJuIElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9aQkIpICYmIHJpc2N2X2hhc19leHRl
bnNpb25fbGlrZWx5KFJJU0NWX0lTQV9FWFRfWkJCKTsKPiAKPiBIbW0sIEknbSB0aGlua2luZyBh
Ym91dCB0aGUgSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfSVNBX1pCQikgc2VtYW50aWNzCj4gZm9y
IGEga2VybmVsIEpJVCBjb21waWxlci4KPiAKPiBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0Ff
WkJCKSBhZmZlY3RzIHRoZSBrZXJuZWwgY29tcGlsZXIgZmxhZ3MuCj4gU2hvdWxkIGl0IGJlIGVu
b3VnaCB0byBqdXN0IGhhdmUgdGhlIHJ1bi10aW1lIGNoZWNrPyBTaG91bGQgYSBrZXJuZWwKPiBi
dWlsdCB3L28gWmJiIGJlIGFibGUgdG8gZW1pdCBaYmIgZnJvbSB0aGUgSklUPwo+IAoKTm90IGVu
b3VnaCwgYmVjYXVzZSByaXNjdl9oYXNfZXh0ZW5zaW9uX2xpa2VseShSSVNDVl9JU0FfRVhUX1pC
QikgaXMgYSAKcGxhdGZvcm0gY2FwYWJpbGl0eSBjaGVjaywgYW5kIHRoZSBvdGhlciBvbmUgaXMg
YSBrZXJuZWwgaW1hZ2UgCmNhcGFiaWxpdHkgY2hlY2suIFdlIGNhbiBwYXNzIHRoZSBjaGVjayAK
cmlzY3ZfaGFzX2V4dGVuc2lvbl9saWtlbHkoUklTQ1ZfSVNBX0VYVF9aQkIpIHdoZW4gCkNPTkZJ
R19SSVNDVl9JU0FfWkJCPW4uIEFuZCBteSBsb2NhbCB0ZXN0IHByb3ZlIGl0LgoKPiAKPiBCasO2
cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
