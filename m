Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5C1C3271E
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Jul 2024 02:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pbe3LXr+3uRnBJOSz+vD4cD0qanIRWnIPhl0M1FP3CA=; b=rtmFAM0x9wp3r+
	bnroQkT1n5BdhTk25D/2ge8xBwdZE6IzyVR1RLin/5sI2OdRsFf3DQD1YHJDn8zEqI7H6cws0iSHY
	ZsLNJLK857fWp430biwgElLAiQDbATbJ8xrQC1HoDYLjHU8SKOaON15+ux3K6XEzG4/hfXLhKVPk4
	NOw3YBWqIm9odL+q73AO+LWN3dLEdKuJ7hAQxc+MrfyRKy0hz5Ev852yDG9PiX7g0G2fctx1mp7DI
	/dfNpvD8NvzdxjvLb1OQB7Ed0hIPMIu7Imf0x3sBz6lhecmUX/TfxL13uIVIaiRqyJNPcPYCCQtXv
	DsI7lXZFird55sLt19Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPvAM-0000000HAhB-40p1;
	Sat, 06 Jul 2024 02:28:47 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPvAJ-0000000HAfc-1mCV
	for linux-riscv@lists.infradead.org;
	Sat, 06 Jul 2024 02:28:45 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4WGDhv3nmQzxTcV;
	Sat,  6 Jul 2024 10:23:59 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id EA93B180AA6;
	Sat,  6 Jul 2024 10:28:29 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 6 Jul 2024 10:28:29 +0800
Message-ID: <885c2504-8f32-4936-ac6e-24fbfd07e43d@huawei.com>
Date: Sat, 6 Jul 2024 10:28:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 1/3] riscv, bpf: Add 12-argument support for
 RV64 bpf trampoline
Content-Language: en-US
To: Puranjay Mohan <puranjay@kernel.org>, Pu Lehui <pulehui@huaweicloud.com>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<netdev@vger.kernel.org>
CC: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Alexei Starovoitov
	<ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	<andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard
 Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>
References: <20240702121944.1091530-1-pulehui@huaweicloud.com>
 <20240702121944.1091530-2-pulehui@huaweicloud.com>
 <mb61p7ce0roh3.fsf@kernel.org>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <mb61p7ce0roh3.fsf@kernel.org>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_192843_651103_6B348481 
X-CRM114-Status: GOOD (  12.93  )
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

Ck9uIDIwMjQvNy81IDIwOjUxLCBQdXJhbmpheSBNb2hhbiB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gRnJvbTogUHUgTGVodWkgPHB1bGVo
dWlAaHVhd2VpLmNvbT4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIDEyIGZ1bmN0aW9uIGFyZ3VtZW50
cyBzdXBwb3J0IGZvciByaXNjdjY0IGJwZgo+PiB0cmFtcG9saW5lLiBUaGUgY3VycmVudCBicGYg
dHJhbXBvbGluZSBzdXBwb3J0cyA8PSBzaXplb2YodTY0KSBieXRlcwo+PiBzY2FsYXIgYXJndW1l
bnRzIFswXSBhbmQgPD0gMTYgYnl0ZXMgc3RydWN0IGFyZ3VtZW50cyBbMV0uIFRoZXJlZm9yZSwg
d2UKPj4gZm9jdXMgb24gdGhlIHNpdHVhdGlvbiB3aGVyZSBzY2FsYXJzIGFyZSBhdCBtb3N0IFhM
RU4gYml0cyBhbmQKPj4gYWdncmVnYXRlcyB3aG9zZSB0b3RhbCBzaXplIGRvZXMgbm90IGV4Y2Vl
ZCAyw5dYTEVOIGJpdHMgaW4gdGhlIHJpc2N2Cj4+IGNhbGxpbmcgY29udmVudGlvbiBbMl0uCltT
TklQXQo+PiBAQCAtODU0LDcgKzg3NSw3IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBm
X3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCj4+ICAgCQlyZXR2YWxfb2Zm
ID0gc3RhY2tfc2l6ZTsKPj4gICAJfQo+PiAgIAo+PiAtCXN0YWNrX3NpemUgKz0gbnJlZ3MgKiA4
Owo+PiArCXN0YWNrX3NpemUgKz0gbnJfYXJnX3Nsb3RzICogODsKPj4gICAJYXJnc19vZmYgPSBz
dGFja19zaXplOwo+PiAgIAo+PiAgIAlzdGFja19zaXplICs9IDg7Cj4+IEBAIC04NzEsOCArODky
LDE0IEBAIHN0YXRpYyBpbnQgX19hcmNoX3ByZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJw
Zl90cmFtcF9pbWFnZSAqaW0sCj4+ICAgCXN0YWNrX3NpemUgKz0gODsKPj4gICAJc3JlZ19vZmYg
PSBzdGFja19zaXplOwo+PiAgIAo+PiArCWlmIChucl9hcmdfc2xvdHMgLSBSVl9NQVhfUkVHX0FS
R1MgPiAwKQo+PiArCQlzdGFja19zaXplICs9IChucl9hcmdfc2xvdHMgLSBSVl9NQVhfUkVHX0FS
R1MpICogODsKPiAKPiBIaSBQdSwKPiBBbHRob3VnaCB0aGlzIGlzIG1lcmdlZCBub3csIHdoaWxl
IHdvcmtpbmcgb24gdGhpcyBmb3IgYXJtNjQgSSByZWFsaXNlZAo+IHRoYXQgdGhlIGFib3ZlIGRv
ZXNuJ3QgY2hlY2sgZm9yIEJQRl9UUkFNUF9GX0NBTExfT1JJRyBhbmQgY2FuIHdhc3RlCj4gc29t
ZSBzdGFjayBzcGFjZSwgd2Ugc2hvdWxkIGNoYW5nZSB0aGlzIHRvOgo+IAo+IGlmICgoZmxhZ3Mg
JiBCUEZfVFJBTVBfRl9DQUxMX09SSUcpICYmIChucl9hcmdfc2xvdHMgLSBSVl9NQVhfUkVHX0FS
R1MgPiAwKSkKPiAgICAgICAgICBzdGFja19zaXplICs9IChucl9hcmdfc2xvdHMgLSBSVl9NQVhf
UkVHX0FSR1MpICogODsKPiAKPiBJdCB3aWxsIHNhdmUgc29tZSBzdGFjayBzcGFjZSB3aGVuIEJQ
Rl9UUkFNUF9GX0NBTExfT1JJRyBpcyBub3Qgc2V0PwoKTmljZSBjYXRjaC4gSXQgd2lsbCBiZSBi
ZXR0ZXIuIEZlZWwgZnJlZSB0byBwYXRjaCBpdC4gVGhhbmtzIQoKPiAKPiBJIGNhbiBzZW5kIGEg
cGF0Y2ggaWYgeW91IHRoaW5rIHRoaXMgaXMgd29ydGggZml4aW5nLgo+IAo+IAo+IFRoYW5rcywK
PiBQdXJhbmpheQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
