Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CE2C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 01:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZOhKWhVVKPu0OLG+y3Rz1xVmR3FvcetkyUv/AAxQv2Y=; b=vsnsYtCxpaREJi
	WsaZOoyB/IrMo9+wQYN3kz4gBKV5Hm51eBnrxrgkG8+imuUYExp11tcuD+lE+G6/2/XtyJwi0JwCT
	+6DXj/lNjKVkbEOpekqYCCD7/mOu0so8LjJ0n4pVizpErB0MK7gMUqwOpBsvRsYdMZDpFDwozqoPP
	C/2cEyszFuMLB8qFzM/VZQJVzzJ6sYlSug/EvrQTsm19GFvLiCX+9aJD6zHe40tuzE7dwAzxLWgJ/
	IcphIk6A62ko3Lg26WXCJaftioY1sBkJcpWkV9A2I7vqyDtEFF/6V9YUXjePRfLZt19pw0g3hfxzA
	LwuXmQJFZMkReXUwORGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rS62U-00EpJN-0r;
	Tue, 23 Jan 2024 01:57:22 +0000
Received: from [45.249.212.51] (helo=dggsgout11.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rS62Q-00EpHQ-10
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 01:57:21 +0000
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4TJqvw2Mm1z4f3lVy
	for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 09:57:00 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 938FF1A0232
	for <linux-riscv@lists.infradead.org>; Tue, 23 Jan 2024 09:57:06 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP1 (Coremail) with SMTP id cCh0CgAn9w_xHK9lMo29Bg--.34883S2;
	Tue, 23 Jan 2024 09:57:06 +0800 (CST)
Message-ID: <ee922f6a-4bd0-48e7-bb9a-373b41e6a5d4@huaweicloud.com>
Date: Tue, 23 Jan 2024 09:57:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pu Lehui <pulehui@huaweicloud.com>
Subject: Re: [PATCH RESEND bpf-next v3 0/6] Zbb support and code
 simplification for RV64 JIT
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
 Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>,
 Luke Nelson <luke.r.nels@gmail.com>, Pu Lehui <pulehui@huawei.com>
References: <20240115131235.2914289-1-pulehui@huaweicloud.com>
 <87il3lqvye.fsf@all.your.base.are.belong.to.us>
 <baffbab8-721f-462a-8b58-64972f5eae70@huaweicloud.com>
 <878r4hqvgq.fsf@all.your.base.are.belong.to.us>
 <874jf5qudx.fsf@all.your.base.are.belong.to.us>
 <f73cdabe-eba3-4842-8da2-a6316590eb1e@huaweicloud.com>
 <87zfwxpbzp.fsf@all.your.base.are.belong.to.us>
Content-Language: en-US
In-Reply-To: <87zfwxpbzp.fsf@all.your.base.are.belong.to.us>
X-CM-TRANSID: cCh0CgAn9w_xHK9lMo29Bg--.34883S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyftFy5tFyxtFyxWFWktFb_yoW8ZrW8pF
	y8K3Z0k3W8Jr1fJw10yFyjgFWUKw4Yqr13Wr18XrWUur1qqry5KF4UuF15Cw1kCrnFgrya
	y3yYv347A34UAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7Cj
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
X-CRM114-CacheID: sfid-20240122_175718_684652_F5D70425 
X-CRM114-Status: GOOD (  11.69  )
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

CgpPbiAyMDI0LzEvMjMgMDozMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBQdSBMZWh1aSA8cHVs
ZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPiAKPj4gT24gMjAyNC8xLzIyIDIzOjA3LCBC
asO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4g
d3JpdGVzOgo+Pj4KPj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRl
czoKPj4+Pgo+Pj4+PiBPbiAyMDI0LzEvMjIgMjI6MzMsIEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+
Pj4+PiBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyaXRlczoKPj4+Pj4+Cj4+
Pj4+Pj4gQWRkIFpiYiBzdXBwb3J0IFswXSB0byBvcHRpbWl6ZSBjb2RlIHNpemUgYW5kIHBlcmZv
cm1hbmNlIG9mIFJWNjQgSklULgo+Pj4+Pj4+IE1lYW53aGlsZSwgYWRqdXN0IHRoZSBjb2RlIGZv
ciB1bmlmaWNhdGlvbiBhbmQgc2ltcGxpZmljYXRpb24uIFRlc3RzCj4+Pj4+Pj4gdGVzdF9icGYu
a28gYW5kIHRlc3RfdmVyaWZpZXIgaGF2ZSBwYXNzZWQsIGFzIHdlbGwgYXMgdGhlIHJlbGF0aXZl
Cj4+Pj4+Pj4gdGVzdGNhc2VzIG9mIHRlc3RfcHJvZ3MqLgo+Pj4+Pj4+Cj4+Pj4+Pj4gTGluazog
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWJpdG1hbmlwL3JlbGVhc2VzL2Rvd25sb2Fk
LzEuMC4wL2JpdG1hbmlwLTEuMC4wLTM4LWc4NjVlN2E3LnBkZiBbMF0KPj4+Pj4+Pgo+Pj4+Pj4+
IHYzIHJlc2VuZDoKPj4+Pj4+PiAtIHJlc2VuZCBmb3IgbWFpbCBiZSB0cmVhdGVkIGFzIHNwYW0u
Cj4+Pj4+Pj4KPj4+Pj4+PiB2MzoKPj4+Pj4+PiAtIENoYW5nZSB0byBlYXJseS1leGl0IGNvZGUg
c3R5bGUgYW5kIG1ha2UgY29kZSBtb3JlIGV4cGxpY2l0Lgo+Pj4+Pj4KPj4+Pj4+IExlaHVpLAo+
Pj4+Pj4KPj4+Pj4+IFNvcnJ5IGZvciB0aGUgZGVsYXkuIEknbSBjaGFzaW5nIGEgc3RydWN0X29w
cyBSSVNDLVYgQlBGIHJlZ3Jlc3Npb24gaW4KPj4+Pj4+IDYuOC1yYzEsIEkgd2lsbCBuZWVkIHRv
IHdyYXAgbXkgaGVhZCBhcm91bmQgdGhhdCBwcmlvciByZXZpZXdpbmcKPj4+Pj4+IHByb3Blcmx5
Lgo+Pj4+Pj4KPj4+Pj4KPj4+Pj4gT2gsIEkgYWxzbyBmb3VuZCB0aGUgcHJvYmxlbSB3aXRoIHN0
cnVjdCBvcHMgYW5kIGZpeGVkIGl0Cj4+Pgo+Pj4gUHUsIHdpdGggeW91ciBwYXRjaCBicGZfaXRl
cl9zZXRzb2Nrb3B0LCBicGZfdGNwX2NhLCBhbmQgZHVtbXlfc3Rfb3BzCj4+PiBwYXNzZXMhCj4+
Pgo+Pj4gUGxlYXNlIHNwaW4gYSBwcm9wZXIgZml4ZXMgcGF0Y2gsIGFuZCBmZWVsIGZyZWUgdG8g
YWRkOgo+Pj4KPj4+IFRlc3RlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29t
Pgo+Pj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4+Pgo+Pgo+
PiBJcyB0aGF0IGluIGEgaHVycnk/IElmIG5vdCwgSSB3b3VsZCBsaWtlIHRvIHNlbmQgaXQgd2l0
aCB0aGUgdXBjb21pbmcKPj4gcGF0Y2hzZXQuCj4gCj4gVGhpcyBpcyBhIHNlcGFyYXRlIGZpeCwg
cmlnaHQ/IFdoYXQgcGF0Y2hzZXQgYXJlIHlvdSByZWZlcnJpbmcgdG8gd2hlcmUKPiB0aGUgZml4
IHdvdWxkIGJlIGluPwo+IAoKWWVzLCB5b3UgYXJlIHJpZ2h0ISBJJ2xsIHNlbmQgYSBidWcgZml4
IHBhdGNoIGFzIHNvb24gYXMgcG9zc2libGUuIApDb21pbmcgc29vbiBpcyB0aGUgYnBmX3Byb2df
cGFjayBmb3IgUlY2NCBUcmFtcG9saW5lLCB3aGljaCBjdXJyZW50bHkgCmRvZXMgbm90IHNlZW0g
dG8gYmUgcmVsYXRlZCB0byB0aGUgYnVnZml4LCB3aWxsIHBvcHVsYXRlIHRoZSBjb21taXQgCm1l
c3NhZ2UgYW5kIHNlbmQgaXQgbGF0ZXIu8J+YgQoKPiBBcyBvZiBub3cgNi44LXJjMSBpcyBicm9r
ZW4hIEl0IHdvdWxkIGJlIGEgZ3JlYXQgd2l0aCBhIGZpeCBhc2FwLi4uCj4gCj4gCj4gQ2hlZXJz
LAo+IEJqw7ZybgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
