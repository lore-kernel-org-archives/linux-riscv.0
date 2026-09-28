Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D82DC9833E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 09:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rAjO4NmElPUnfIxlGikSXOZSlvM5Lnd0S8oVS8XAF28=; b=KF48xsucnT0VJ3
	dz6sbbiALYNTBEOFtfHQloO06CYk/nRTbZnMrveOEDFdmmiP8EzduPgXWS6v5EPSItp3HougMppQ/
	51zH+gCjUp6tJzRWt7/xB9ORyfH4WPHp94UaD2JnhJJv4L7IzxX0yAsMSd9/nlkTDKAhEKz/33ZFC
	oAiV7tdVXHgu53Tht70rNDJgWfiy1Wq9P4ypakH2lPiZcqPvBPOZxEloEqGl2k1sanG/IBSrP1QEy
	gXgmfRMBb57KNUXIRW7h8ogcrowlP6YZ4Z4iAq/ckH/x+0mKq14UwTH5AedUxApd+tuD6iQS++Fm9
	YAzCKHRLG3IYER8m1zeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7NY-00000000BdN-1iUb;
	Mon, 28 Sep 2026 09:10:32 +0000
Received: from canpmsgout02.his.huawei.com ([113.46.200.217])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7NU-00000000Bcr-41eD
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 09:10:31 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=24y8bIOENNovRtkZnZvVTWIkfqTuhb4BMfZsFA0A+t4=;
	b=ZuXG8PTEe3FyUjLVilfNkQUXjdeZv6oVdx6+NwjW3kX1Il7xpxzMbqaRfRhqKO8NW9KAWjXiy
	Og42430uBtqeJ9DTrLFc9GQBMtd5rcouCa/QqhNTZ6TzxwLVVIdm5Et54MmAXd6P7HxFQCIQjos
	n+9CREyJwDNbcVI3bBjC+p8=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4htZwk0rW6zcb46;
	Mon, 28 Sep 2026 16:58:46 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 7A94440561;
	Mon, 28 Sep 2026 17:10:19 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 17:10:18 +0800
Message-ID: <6081a548-aaed-423a-bb34-0008cedc6699@huawei.com>
Date: Mon, 28 Sep 2026 17:10:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 0/4] bpf, riscv: Add support for indirect
 jumps
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <memxor@gmail.com>,
	<bjorn@kernel.org>, <puranjay@kernel.org>
CC: <ihor.solodrai@linux.dev>, <eddyz87@gmail.com>, <martin.lau@linux.dev>,
	<song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
	<emil@etsalapatis.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<shuah@kernel.org>, <guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260928071845.2432-1-cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260928071845.2432-1-cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_021029_655738_F8DD90EC 
X-CRM114-Status: GOOD (  13.60  )
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

Ck9uIDIwMjYvOS8yOCAxNToxOCwgQ2hlbiBQZWkgd3JvdGU6Cj4gVGhlIGluZGlyZWN0IGp1bXAg
aW5zdHJ1Y3Rpb24gKEJQRl9KTVAgfCBCUEZfSkEgfCBCUEZfWCwgImdvdG94IikgYW5kIHRoZQo+
IEJQRl9NQVBfVFlQRV9JTlNOX0FSUkFZIGp1bXAgdGFibGVzIGl0IGNvbnN1bWVzIGFyZSBjb3Jl
IGZlYXR1cmVzOiB0aGUKPiB2ZXJpZmllciBhY2NlcHRzIHRoZW0gb24gZXZlcnkgYXJjaGl0ZWN0
dXJlLCBhbmQgdGhlIHg4Ni02NCwgYXJtNjQgYW5kCj4gcG93ZXJwYyBKSVRzIGltcGxlbWVudCB0
aGVtLiBPbiByaXNjdjY0IGEgcHJvZ3JhbSB1c2luZyBnb3RveCBwYXNzZXMKPiB2ZXJpZmljYXRp
b24gYW5kIHRoZW4gZmFpbHMgdG8gbG9hZCwgYmVjYXVzZSB0aGUgSklUIGRvZXMgbm90IGtub3cg
dGhlCj4gb3Bjb2RlIGFuZCBDT05GSUdfQlBGX0pJVF9BTFdBWVNfT04gbGVhdmVzIG5vIGludGVy
cHJldGVyIHRvIGZhbGwgYmFjawo+IG9udG8uCj4gCj4gVGhpcyBzZXJpZXMgYWRkcyB0aGUgcmlz
Y3Y2NCBzdXBwb3J0IGFuZCB0dXJucyB0aGUgZXhpc3Rpbmcgc2VsZnRlc3RzIG9uCj4gZm9yIHRo
YXQgYXJjaGl0ZWN0dXJlLgo+IAo+IFBhdGNoIDEgZW1pdHMgImphbHIgemVybywgcmQsIDAiIGZv
ciBnb3RveCBhbmQgcHVibGlzaGVzIHRoZSB4bGF0ZWQgdG8KPiBqaXR0ZWQgb2Zmc2V0cyB0aHJv
dWdoIGJwZl9wcm9nX3VwZGF0ZV9pbnNuX3B0cnMoKSwgd2hpY2ggaXMgd2hhdCBmaWxscwo+IGlu
IHRoZSBqdW1wIHRhYmxlIGFkZHJlc3Nlcy4gUGF0Y2hlcyAyIHRvIDQgd2lkZW4gdGhlIGFyY2gg
Z3VhcmRzIGluCj4gdmVyaWZpZXJfZ290b3guYywgY29tcHV0ZV9saXZlX3JlZ2lzdGVycy5jIGFu
ZCBicGZfaW5zbl9hcnJheS5jIHRvCj4gcmlzY3Y2NCwgdGhlIHNhbWUgd2F5IHRoZSBvdGhlciBh
cmNoaXRlY3R1cmVzIHdlcmUgZW5hYmxlZC4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYyOgo+IC0gUGlj
ayB1cCBQdSBMZWh1aSdzIFJldmlld2VkLWJ5IG9uIHBhdGNoIDEuCj4gLSBFbmFibGUgdHdvIG1v
cmUgZ290b3ggdGVzdCBmaWxlcyBmb3IgcmlzY3Y2NDogY29tcHV0ZV9saXZlX3JlZ2lzdGVycy5j
Cj4gICAgYW5kIGJwZl9pbnNuX2FycmF5LmMuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIFJl
YmFzZWQgb250byBicGYtbmV4dC4KPiAtIFBhdGNoIDE6IHJld29yZCB0aGUgY29kZSBjb21tZW50
IHRvIHNheSAic2hpZnQgY3R4LT5vZmZzZXRbXSBieSBvbmUiLgo+IC0gUGF0Y2ggMjogY29sbGFw
c2UgdGhlIG11bHRpLWxpbmUgI2VuZGlmIG1hcmtlciB0byBhIHNpbmdsZSBsaW5lLgo+IC0gQWRk
ZWQgUmV2aWV3ZWQtYnkvQWNrZWQtYnkgZnJvbSBCasO2cm4gVMO2cGVsLgo+IAo+IFRlc3RpbmcK
PiA9PT09PT09Cj4gCj4gRW52aXJvbm1lbnQ6IFFFTVUgdmlydCBydjY0LCB3aXRoIENPTkZJR19C
UEZfSklUPXksCj4gQ09ORklHX0JQRl9KSVRfQUxXQVlTX09OPXksIENPTkZJR19ERUJVR19JTkZP
X0JURj15OyBzZWxmdGVzdHMKPiBjcm9zcy1idWlsdCB3aXRoIGNsYW5nIDIzLgo+IAo+IC0gdGVz
dF9wcm9ncyAtdCB2ZXJpZmllcl9nb3RveDogMzMvMzMgc3VidGVzdHMgcGFzcy4KPiAtIHRlc3Rf
cHJvZ3MgLXQgYnBmX2luc25fYXJyYXk6IDIwLzIwIHN1YnRlc3RzIHBhc3MuCj4gLSB0ZXN0X3By
b2dzIC10IGNvbXB1dGVfbGl2ZV9yZWdpc3RlcnM6IDIwLzIwIHN1YnRlc3RzIHBhc3MsIGluY2x1
ZGluZwo+ICAgIHRoZSBnb3RveCBsaXZlbmVzcyBzdWJ0ZXN0Lgo+IC0gdGVzdF9wcm9ncy1jcHV2
NCAtdCBicGZfZ290b3g6IDE0LzE0IHN1YnRlc3RzIHBhc3MuCj4gCj4gQ2hlbiBQZWkgKDQpOgo+
ICAgIGJwZiwgcmlzY3Y6IEFkZCBzdXBwb3J0IGZvciBpbmRpcmVjdCBqdW1wcwo+ICAgIHNlbGZ0
ZXN0cy9icGY6IEVuYWJsZSBnb3RveCB0ZXN0cyBmb3IgcmlzY3Y2NAo+ICAgIHNlbGZ0ZXN0cy9i
cGY6IEVuYWJsZSBnb3RveCBsaXZlbmVzcyB0ZXN0IGZvciByaXNjdjY0Cj4gICAgc2VsZnRlc3Rz
L2JwZjogRW5hYmxlIGluc3RydWN0aW9uIGFycmF5IHRlc3QgZm9yIHJpc2N2NjQKPiAKPiAgIGFy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgICAgICAgICAgICAgICAgICB8ICA1ICsrKysr
Cj4gICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYyAgICAgICAgICAgICAgICAgICAgfCAx
NiArKysrKysrKysrKysrKy0tCj4gICAuLi4vc2VsZnRlc3RzL2JwZi9wcm9nX3Rlc3RzL2JwZl9p
bnNuX2FycmF5LmMgICAgfCAgMyArKy0KPiAgIC4uLi9zZWxmdGVzdHMvYnBmL3Byb2dzL2NvbXB1
dGVfbGl2ZV9yZWdpc3RlcnMuYyB8ICA1ICsrKy0tCj4gICAuLi4vdGVzdGluZy9zZWxmdGVzdHMv
YnBmL3Byb2dzL3ZlcmlmaWVyX2dvdG94LmMgfCAgNiArKysrLS0KPiAgIDUgZmlsZXMgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKCkZvciB0aGlzIHNlcmllczoK
ClRlc3RlZC1ieTogUHUgTGVodWkgPHB1bGVodWlAaHVhd2VpLmNvbT4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
