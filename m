Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36111C47DDF
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 14:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7eOhFQIap81F0QGpE67paRy/F817OltgbKb1pKu8Aw4=; b=Cx8Kn5Zp5zz46Z
	eSu0Vch6NUldZINFEaqKczRZ1GdYXY+aoIz8jnzp7H8ursSXuoAXiU0wC8t3RTUc77Yg8fF6IcqT0
	dR6iWqT4VQvB78+yHaOzikEJtNjPC7NreNNswaqkJiGuq7mX6q05l6d/EuWv2aNHFHPaj2sGegAIh
	AagLRUkyQMp+SNKv54cgpum7X38JjSaTeSuIdjQFgZjfrfWZ/BKg5ekQDpyJ5KQkIfhEdhwYz9QkH
	YW6vS3tmQL5mOQLjPRda00X+38dl/NqIWk4/aAJWP//ApNsDwvGfUnbmu/LEN0OXmsEbATYkeEUf4
	OLrzh/2NQBk0PuSwCdYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUoon-0000000Gw22-3b0Q;
	Tue, 30 Jan 2024 14:10:29 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUook-0000000Gw1I-2f0n
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 14:10:28 +0000
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TPRqZ6WBszJpQM;
	Tue, 30 Jan 2024 22:09:14 +0800 (CST)
Received: from kwepemd100009.china.huawei.com (unknown [7.221.188.135])
	by mail.maildlp.com (Postfix) with ESMTPS id 5D25C1402CD;
	Tue, 30 Jan 2024 22:10:14 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemd100009.china.huawei.com (7.221.188.135) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.28; Tue, 30 Jan 2024 22:10:13 +0800
Message-ID: <5a30caa3-3351-41e7-a77f-91e5959b2da6@huawei.com>
Date: Tue, 30 Jan 2024 22:10:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 4/4] riscv, bpf: Mixing bpf2bpf and tailcalls
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
References: <20230919035711.3297256-1-pulehui@huaweicloud.com>
 <20230919035711.3297256-5-pulehui@huaweicloud.com>
 <87lecqobyb.fsf@all.your.base.are.belong.to.us>
 <4e73b095-0c08-4a6f-b2ee-8f7a071b14ee@huaweicloud.com>
 <87cytjusud.fsf@all.your.base.are.belong.to.us>
 <5d776261-338b-4ebb-bb9b-1dbc91cd06c3@huawei.com>
 <87zfwnympo.fsf@all.your.base.are.belong.to.us>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <87zfwnympo.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd100009.china.huawei.com (7.221.188.135)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_061027_058432_69AEAE82 
X-CRM114-Status: GOOD (  20.13  )
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

CgpPbiAyMDI0LzEvMzAgMjE6MjgsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4gUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpLmNvbT4gd3JpdGVzOgo+IAo+PiBPbiAyMDI0LzEvMzAgMTY6MjksIEJqw7Zy
biBUw7ZwZWwgd3JvdGU6Cj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdy
aXRlczoKPj4+Cj4+Pj4gT24gMjAyMy85LzI4IDE3OjU5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+
Pj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPj4+Pj4KPj4+
Pj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gSW4g
dGhlIGN1cnJlbnQgUlY2NCBKSVQsIGlmIHdlIGp1c3QgZG9uJ3QgaW5pdGlhbGl6ZSB0aGUgVEND
IGluIHN1YnByb2csCj4+Pj4+PiB0aGUgVENDIGNhbiBiZSBwcm9wYWdhdGVkIGZyb20gdGhlIHBh
cmVudCBwcm9jZXNzIHRvIHRoZSBzdWJwcm9jZXNzLCBidXQKPj4+Pj4+IHRoZSBUQ0Mgb2YgdGhl
IHBhcmVudCBwcm9jZXNzIGNhbm5vdCBiZSByZXN0b3JlZCB3aGVuIHRoZSBzdWJwcm9jZXNzCj4+
Pj4+PiBleGl0cy4gU2luY2UgdGhlIFJWNjQgVENDIGlzIGluaXRpYWxpemVkIGJlZm9yZSBzYXZp
bmcgdGhlIGNhbGxlZSBzYXZlZAo+Pj4+Pj4gcmVnaXN0ZXJzIGludG8gdGhlIHN0YWNrLCB3ZSBj
YW5ub3QgdXNlIHRoZSBjYWxsZWUgc2F2ZWQgcmVnaXN0ZXIgdG8KPj4+Pj4+IHBhc3MgdGhlIFRD
Qywgb3RoZXJ3aXNlIHRoZSBvcmlnaW5hbCB2YWx1ZSBvZiB0aGUgY2FsbGVlIHNhdmVkIHJlZ2lz
dGVyCj4+Pj4+PiB3aWxsIGJlIGRlc3Ryb3llZC4gU28gd2UgaW1wbGVtZW50ZWQgbWl4aW5nIGJw
ZjJicGYgYW5kIHRhaWxjYWxscwo+Pj4+Pj4gc2ltaWxhciB0byB4ODZfNjQsIGkuZS4gdXNpbmcg
YSBub24tY2FsbGVlIHNhdmVkIHJlZ2lzdGVyIHRvIHRyYW5zZmVyCj4+Pj4+PiB0aGUgVENDIGJl
dHdlZW4gZnVuY3Rpb25zLCBhbmQgc2F2aW5nIHRoYXQgcmVnaXN0ZXIgdG8gdGhlIHN0YWNrIHRv
Cj4+Pj4+PiBwcm90ZWN0IHRoZSBUQ0MgdmFsdWUuIEF0IHRoZSBzYW1lIHRpbWUsIHdlIGFsc28g
Y29uc2lkZXIgdGhlIHNjZW5hcmlvCj4+Pj4+PiBvZiBtaXhpbmcgdHJhbXBvbGluZS4KPj4+Pj4K
Pj4+Pj4gSGkhCj4+Pj4+Cj4+Pj4+IFRoZSBSSVNDLVYgSklUIHRyaWVzIHRvIG1pbmltaXplIHRo
ZSBzdGFjayB1c2FnZSwgZS5nLiBpdCBkb2Vzbid0IGhhdmUgYQo+Pj4+PiBmaXhlZCBwcm8vZXBp
bG9ndWUgbGlrZSBzb21lIG9mIHRoZSBvdGhlciBKSVRzLiBJIHRoaW5rIHdlIGNhbiBkbyBiZXR0
ZXIKPj4+Pj4gaGVyZSwgc28gdGhhdCB0aGUgcGFzcy1UQ0MtdmlhLXJlZ2lzdGVyIGNhbiBiZSB1
c2VkLCBhbmQgdGhlIGFkZGl0aW9uYWwKPj4+Pj4gc3RhY2sgYWNjZXNzIGNhbiBiZSBhdm9pZGVk
Lgo+Pj4+Pgo+Pj4+PiBUb2RheSwgdGhlIFRDQyBpcyBwYXNzZWQgdmlhIGEgcmVnaXN0ZXIgKGE2
KSBhbmQgY2FuIGJlIHZpZXdlZCBhcyBhCj4+Pj4+ICJzdGF0ZSIgdmFyaWFibGUvdHJhbnNwYXJl
bnQgYXJndW1lbnQvcmV0dXJuIHZhbHVlLiBBcyB5b3UgcG9pbnQgb3V0LCB3ZQo+Pj4+PiBsb29z
ZSB0aGlzIHdoZW4gd2UgZG8gYSBjYWxsLiBPbiAoYW55KSBjYWxscyB3ZSBtb3ZlIHRoZSBUQ0Mg
dG8gYQo+Pj4+PiBjYWxsZWUtc2F2ZWQgcmVnaXN0ZXIuCj4+Pj4+Cj4+Pj4+IFdEWVQgYWJvdXQg
dGhlIGZvbGxvd2luZyBzY2hlbWU6Cj4+Pj4+Cj4+Pj4+IDEgUGlja3VwIHRoZSBhcm02NCBicGYy
YnBmL3RhaWxtaXggbWVjaGFuaXNtIG9mIGp1c3QgY2xlYXJpbmcgdGhlIFRDQwo+Pj4+PiAgICAg
IGZvciB0aGUgbWFpbiBwcm9ncmFtLgo+Pj4+PiAyIEZvciBCUEYgaGVscGVyIGNhbGxzLCBtb3Zl
IFRDQyB0byBzNiwgcGVyZm9ybSB0aGUgY2FsbCwgYW5kIHJlc3RvcmUKPj4+Pj4gICAgICBhNi4g
RGl0byBmb3Iga2Z1bmMgY2FsbHMgKEJQRl9QU0VVRE9fS0ZVTkNfQ0FMTCkuCj4+Pj4+IDMgRm9y
IGFsbCBvdGhlciBjYWxscywgYTYgaXMgcGFzc2VkIHRyYW5zcGFyZW50bHkuCj4+Pj4+Cj4+Pj4+
IEZvciAyIGJwZl9qaXRfZ2V0X2Z1bmNfYWRkcigpIGNhbiBiZSB1c2VkIHRvIGRldGVybWluZSBp
ZiB0aGUgY2FsbGVlIGlzCj4+Pj4+IGEgQlBGIGhlbHBlciBvciBub3QuCj4+Pj4+Cj4+Pj4+IElu
IHN1bW1hcnk7IERldGVybWluZSBpbiB0aGUgSklUIGlmIHdlJ3JlIGxlYXZpbmcgQlBGLWxhbmQs
IGFuZCBuZWVkIHRvCj4+Pj4+IG1vdmUgdGhlIFRDQyB0byBhIGNhbGxlZS1zYXZlZCByZWcsIG9y
IG5vdCwgYW5kIHNhdmUgdXMgYSBidW5jaCBvZiBzdGFjawo+Pj4+PiBzdG9yZS9sb2Fkcy4KPj4+
Pj4KPj4+Pgo+Pj4+IFZhbHVhYmxlIHNjaGVtZS4gQnV0IHdlIG5lZWQgdG8gY29uc2lkZXIgVEND
IGJhY2sgcHJvcGFnYXRpb24uIExldCBtZQo+Pj4+IHNob3cgYW4gZXhhbXBsZSBvZiBjYWxsaW5n
IHN1YnByb2cgd2l0aCBUQ0Mgc3RvcmVkIGluIEE2Ogo+Pj4+Cj4+Pj4gcHJvZzEoVENDPT0xKXsK
Pj4+PiAgICAgICAgc3VicHJvZzEoVENDPT0xKQo+Pj4+ICAgICAgICAgICAgLT4gdGFpbGNhbGwx
KFRDQz09MCkKPj4+PiAgICAgICAgICAgICAgICAtPiBzdWJwcm9nMihUQ0M9PTApCj4+Pj4gICAg
ICAgIHN1YnByb2czKFRDQz09MCkgPC0tLSBzaG91bGQgYmUgVENDPT0xCj4+Pj4gICAgICAgICAg
ICAtXC0+IHRhaWxjYWxsMiA8LS0tIGNhbid0IGJlIGNhbGxlZAo+Pj4+IH0KPj4KPj4gTGV0J3Mg
YmFjayB3aXRoIHRoaXMgZXhhbXBsZSBhZ2Fpbi4gSW1hZ2luZSB0aGF0IHRoZSB0YWlsY2FsbCBj
aGFpbiBpcyBhCj4+IGxpc3QgbGltaXRlZCB0byAzMyBlbGVtZW50cy4gV2hlbiB0aGUgbGlzdCBo
YXMgMzIgZWxlbWVudHMsIHdlIGNhbGwKPj4gc3VicHJvZzEgYW5kIHRoZW4gdGFpbGNhbGwxLiBB
dCB0aGlzIHRpbWUsIHRoZSBsaXN0IGVsZW1lbnRzIGNvdW50Cj4+IGJlY29tZXMgMzMuIFRoZW4g
d2UgY2FsbCBzdWJwcm9nMiBhbmQgcmV0dXJuIHByb2cxLiBBdCB0aGlzIHRpbWUsIHRoZQo+PiBs
aXN0IHJlbW92ZXMgMSBlbGVtZW50IGFuZCBiZWNvbWVzIDMyIGVsZW1lbnRzLiBBdCB0aGlzIHRp
bWUsIHRoZXJlCj4+IHN0aWxsIGNhbiBwZXJmb3JtIDEgdGFpbGNhbGwuCj4+Cj4+IEkndmUgYXR0
YWNoZWQgYSBkaWFncmFtIHRoYXQgc2hvd3MgbWl4aW5nIHRhaWxjYWxsIGFuZCBzdWJwcm9ncyBp
cwo+PiBuZWFybHkgYSAiY2FsbCIuIEl0IGNhbiByZXR1cm4gdG8gY2FsbGVyIGZ1bmN0aW9uLgo+
IAo+IEhtbS4gTGV0IG1lIHB1dCBteSBRIGluIGFub3RoZXIgd2F5Lgo+IAo+IFRoZSBrZXJuZWwg
Y2FsbHMgaW50byBCUEZfUFJPR19SVU4oKSAofmEgQlBGIGNvbnRleHQpLiBXb3VsZCBpdCBldmVy
IGJlCj4gT0sgdG8gZG8gbW9yZSB0aGFuIDMzIHRhaWwgY2FsbHMsIHJlZ2FyZGxlc3Mgb2Ygc3Vi
cHJvZ3Mgb3Igbm90Pwo+IAo+IEluIHlvdXIgZXhhbXBsZSwgVENDIGlzIDEuIFlvdSBhcmUgYWxs
b3dlZCB0byBwZXJmb3JtIG9uZSB0YWlsIGNhbGwuIEluCj4geW91ciBleGFtcGxlIHByb2cxIHBl
cmZvcm1zIHR3by4KPiAKPiBNeSB2aWV3IG9mIFRDQyBoYXMgYWx3YXlzIGJlZW4gfmEgY291bnRl
ciBvZiB0aGUgbnVtYmVyIG9mIHRhaWxjYWxsc34uCj4gCj4gV2l0aCB5b3VyIGV4YW1wbGUgZXhw
YW5kZWQ6Cj4gcHJvZzEoVENDPT0zMyl7Cj4gICAgICAgIHN1YnByb2cxKFRDQz09MzMpCj4gICAg
ICAgICAgICAtPiB0YWlsY2FsbDEoVENDPT0zMykgLT4gdGFpbGNhbGwxKFRDQz09MzIpIC0+IHRh
aWxjYWxsMShUQ0M9PTMxKSAtPiAuLi4gLy8gMzMgdGltZXMKPiAgICAgICAgLy8gTGVodWkgc2F5
cyBUQ0Mgc2hvdWxkIGJlIDMzIGFnYWluLgo+ICAgICAgICAvLyBCasO2cm4gc2F5cyAiaXQncyB0
aGUgbnVtYmVyIG9mIHRhaWxjYWxscyIsIGFuZCBzdWJwcm9nMyBjYW5ub3QgcGVyZm9ybSBhIHRh
aWwgY2FsbAo+ICAgICAgICBzdWJwcm9nMyhUQ0M9PT8pCgpZZXMsIG15IHZpZXcgaXMgdGFrZSB0
aGlzIHNvbWV0aGluZyBsaWtlIGEgc3RhY2vvvIx3aGlsZSB5b3UgdGFrZSB0aGlzIGFzIAphIGZp
eGVkIGdsb2JhbCB2YWx1ZS4KCnByb2cxKFRDQz09MzMpewogICAgIHN1YnByb2cxKFRDQz09MzMp
CiAgICAgICAgIC0+IHRhaWxjYWxsMShUQ0M9PTMzKSAtPiB0YWlsY2FsbDEoVENDPT0zMikgLT4g
CnRhaWxjYWxsMShUQ0M9PTMxKSAtPiAuLi4gLy8gMzMgdGltZXMgLT4gc3VicHJvZzIoVENDPT0w
KQogICAgIHN1YnByb2czKFRDQz09MzMpCgktPiB0YWlsY2FsbDEoVENDPT0zMykgLT4gdGFpbGNh
bGwxKFRDQz09MzIpIC0+IHRhaWxjYWxsMShUQ0M9PTMxKSAtPiAKLi4uIC8vIDMzIHRpbWVzCgo+
ICAgICAgICAgICAgCj4gTXkgdmlldyBoYXMsIGFnYWluLCBiZWVuIHRoYW4gVENDIGlzIGEgcnVu
LXRpbWUgY291bnQgb2YgdGhlIG51bWJlcgo+IHRhaWxjYWxscyAoZmVudHJ5L2ZleGl0IHBhdGNo
IGJwZi1wcm9ncmFtcyBpbmNsdWRlZCkuCj4gCj4gV2hhdCBkb2VzIHg4NiBhbmQgYXJtNjQgZG8/
CgpXaGVuIHN1YnByb2cgcmV0dXJuIGJhY2sgdG8gY2FsbGVyIGJwZiBwcm9ncmFtLCB0aGV5IGJv
dGggcmVzdG9yZSBUQ0MgdG8gCnRoZSB2YWx1ZSB3aGVuIGVudGVyIGludG8gc3VicHJvZy4gVGhl
IEFSTTY0IHVzZXMgdGhlIGNhbGxlZSBzYXZlZCAKcmVnaXN0ZXIgdG8gc3RvcmUgdGhlIFRDQy4g
V2hlbiB0aGUgQVJNNjQgZXhpdHMsIHRoZSBUQ0MgaXMgcmVzdG9yZWQgdG8gCnRoZSB2YWx1ZSB3
aGVuIGl0IGVudGVyLiBUaGUgd2hpbGUgeDg2IHVzZXMgdGhlIHN0YWNrIHRvIGRvIHRoZSBzYW1l
IHRoaW5nLgoKPiAKPiAKPiBCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
