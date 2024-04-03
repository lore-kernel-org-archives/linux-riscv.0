Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839A6CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 03:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQn4wp1bLxV7xZ3bbHTfpdTkzizIGPCq8TGbAqmoiLU=; b=RyUTSNkFL6gW4a
	3rp27dSoSG65dcCaYj8Adu3klI695I/mobL9zBQT9O5H6aWrn6NvNYrN54Pse1iOqlvH9TzcNkvMD
	5l2ROu8WzeU0vypCJXKePn3GY8fg07Tj7S0WaU5tYemkqO/dGRFfwntUA3/eL6Rc3VJ0kGU5cpd66
	nm+nbwroa3nOlSs55f1xCGX2BpmHOFyVdR9hw7CK1SbMOwaI5tYogIhDowiLmXUGGP6xDEJ1vISDG
	sWd6AdaJXNpHeLU04ZMQMjrcMU+i2aEBIPPGZQfCwjC+0ioYpQz1X82NPpaG3UzJtdZ5jwIOp49Xf
	EGxSJXdUxk6bWqMrWrVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrF3-0000000DlwJ-3acW;
	Wed, 03 Apr 2024 03:24:49 +0000
Received: from [45.249.212.56] (helo=dggsgout12.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrrF0-0000000DlvF-2Iwy
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 03:24:48 +0000
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4V8VV53vJkz4f3khd
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 11:24:29 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 119741A0172
	for <linux-riscv@lists.infradead.org>; Wed,  3 Apr 2024 11:24:36 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgAnRQ7yywxmOR2WIw--.30244S2;
	Wed, 03 Apr 2024 11:24:35 +0800 (CST)
Message-ID: <0626619d-5950-497e-aa67-a13cede9b300@huaweicloud.com>
Date: Wed, 3 Apr 2024 11:24:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 2/2] selftests/bpf: Add testcase where 7th
 argment is struct
Content-Language: en-US
To: Daniel Borkmann <daniel@iogearbox.net>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman
 <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yhs@fb.com>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Pu Lehui <pulehui@huawei.com>
References: <20240331092405.822571-1-pulehui@huaweicloud.com>
 <20240331092405.822571-3-pulehui@huaweicloud.com>
 <967f996f-f660-4615-696e-95c5db0542ad@iogearbox.net>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <967f996f-f660-4615-696e-95c5db0542ad@iogearbox.net>
X-CM-TRANSID: cCh0CgAnRQ7yywxmOR2WIw--.30244S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4xJr4UAr47XF4rGF4DArb_yoW8Wr4rpa
	yxu34Y9rW8Xrs7Xry3AF4UZrW3JrWkWw1UZryxJayFvFyjgFyYgF40gw4Y9rn8Jrs3uw1a
	yF4jq3y5uw4DZF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6x
	AIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
	6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUFDGOUUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_202446_931411_A68D1CD0 
X-CRM114-Status: UNSURE (   7.26  )
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

Ck9uIDIwMjQvNC8yIDIyOjAyLCBEYW5pZWwgQm9ya21hbm4gd3JvdGU6Cj4gT24gMy8zMS8yNCAx
MToyNCBBTSwgUHUgTGVodWkgd3JvdGU6Cj4+IEZyb206IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdl
aS5jb20+Cj4+Cj4+IEFkZCB0ZXN0Y2FzZSB3aGVyZSA3dGggYXJndW1lbnQgaXMgc3RydWN0IGZv
ciBhcmNoaXRlY3R1cmVzIHdpdGggOAo+PiBhcmd1bWVudCByZWdpc3RlcnMsIGFuZCBpbmNyZWFz
ZSB0aGUgY29tcGxleGl0eSBvZiB0aGUgc3RydWN0Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBQdSBM
ZWh1aSA8cHVsZWh1aUBodWF3ZWkuY29tPgo+PiAtLS0KPj4gwqAgLi4uL3NlbGZ0ZXN0cy9icGYv
YnBmX3Rlc3Rtb2QvYnBmX3Rlc3Rtb2QuY8KgwqAgfCAxOSArKysrKysrKysrCj4+IMKgIC4uLi9z
ZWxmdGVzdHMvYnBmL3Byb2dfdGVzdHMvdHJhY2luZ19zdHJ1Y3QuYyB8IDEzICsrKysrKysKPj4g
wqAgLi4uL3NlbGZ0ZXN0cy9icGYvcHJvZ3MvdHJhY2luZ19zdHJ1Y3QuY8KgwqDCoMKgwqAgfCAz
NSArKysrKysrKysrKysrKysrKysrCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNjcgaW5zZXJ0aW9u
cygrKQo+IAo+IFRoZSBsYXN0IHRlc3QgZnJvbSB0aGlzIHBhdGNoIGZhaWxzIEJQRiBDSSwgcHRh
bCA6Cj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL2JwZi9hY3Rpb25zL3J1
bnMvODQ5NzI2MjY3NC9qb2IvMjMyNzU2OTAzMDMKPiBodHRwczovL2dpdGh1Yi5jb20va2VybmVs
LXBhdGNoZXMvYnBmL2FjdGlvbnMvcnVucy84NDk3MjYyNjc0L2pvYi8yMzI3NTY5MDM2NAo+IAo+
IE5vdGljZTogU3VjY2VzczogNTE5LzM1OTIsIFNraXBwZWQ6IDUzLCBGYWlsZWQ6IDEKPiBFcnJv
cjogIzM5MSB0cmFjaW5nX3N0cnVjdAo+ICDCoCBFcnJvcjogIzM5MSB0cmFjaW5nX3N0cnVjdAo+
ICDCoCB0ZXN0X2ZlbnRyeTpQQVNTOnRyYWNpbmdfc3RydWN0X19vcGVuX2FuZF9sb2FkIDAgbnNl
Ywo+ICDCoCBsaWJicGY6IHByb2cgJ3Rlc3Rfc3RydWN0X2FyZ18xNic6IGZhaWxlZCB0byBhdHRh
Y2g6IEVSUk9SOiAKPiBzdHJlcnJvcl9yKC01MjQpPTIyCj4gIMKgIGxpYmJwZjogcHJvZyAndGVz
dF9zdHJ1Y3RfYXJnXzE2JzogZmFpbGVkIHRvIGF1dG8tYXR0YWNoOiAtNTI0Cj4gIMKgIHRlc3Rf
ZmVudHJ5OkZBSUw6dHJhY2luZ19zdHJ1Y3RfX2F0dGFjaCB1bmV4cGVjdGVkIGVycm9yOiAtNTI0
IChlcnJubyAKPiA1MjQpCj4gVGVzdCBSZXN1bHRzOgo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnBmdG9vbDogUEFTUwo+ICDCoMKgwqDCoMKgwqDCoMKgwqAgdGVzdF9wcm9nczogRkFJTCAo
cmV0dXJuZWQgMSkKPiBFcnJvcjogUHJvY2VzcyBjb21wbGV0ZWQgd2l0aCBleGl0IGNvZGUgMS4K
ClRoYW5rcyBmb3IgeW91ciByZW1pbmRlci4gYWFyY2g2NCBkb2VzIG5vdCB5ZXQgc3VwcG9ydCBi
cGYgdHJhbXBvbGluZSAKd2l0aCBtb3JlIHRoYW4gOCBwYXJhbWV0ZXJzLiBJIHdpbGwgYWRkIHRy
YWNpbmdfc3RydWN0IHRvIERFTllMSVNULmFhcmNoNjQuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
