Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16FAC4451C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 03:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMFSrB3cBmLWNMitCDlZLXt+dR1LlqsUpFEIgNAWrc4=; b=fPXbZuIgJQAYUx
	e1Ubc8zhiKJk1/EqSAGofaILXFWrgxQt0Nz//jl70zI5IGw5nf2Wx7Dmg8YChznhrIZhc3+fFqVNO
	1feQOFsQf5BTMTm7W7WvpYK2SKVRVBBlpw5MAgx1iA569f3QxfYTgji8QcBQTcX8q3B10lwXxxaOP
	2nXfWnYhQfRjUWEeGe7p6kEZmlBWgCqyf6dsR2Wee7hDs4Vw0CUdxxeBMxLLDPjcxNRRQSbp7d1qY
	RS96X9JAt5VM2tOaANGffarydxFiTaAFV3vVnmhh8UalOceyIy27ToWHseA59Qh0v1INBG4567DEv
	vNRRQvpC35af+d7k5X3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNGv-0000000An8D-1suM;
	Wed, 22 Jul 2026 03:05:25 +0000
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNGr-0000000An7T-2qFP
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 03:05:24 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h4fHY1JkDzYQtmW
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 11:04:41 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 8401D40570
	for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 11:05:09 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgAnWVphM2BqOzByCA--.55067S2;
	Wed, 22 Jul 2026 11:05:06 +0800 (CST)
Message-ID: <ee25c5b9-97fb-409a-8529-e8689babb44f@huaweicloud.com>
Date: Wed, 22 Jul 2026 11:05:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 0/7] Mixing bpf2bpf and tailcalls for RV64
Content-Language: en-US
To: patchwork-bot+netdevbpf@kernel.org
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com
References: <20260708064436.2971933-1-pulehui@huaweicloud.com>
 <178465861815.931197.16356281577887013283.git-patchwork-notify@kernel.org>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <178465861815.931197.16356281577887013283.git-patchwork-notify@kernel.org>
X-CM-TRANSID: gCh0CgAnWVphM2BqOzByCA--.55067S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr48AFWUJF48Kry5Ar13Arb_yoW8KFWkpa
	yxCrn8Cr1vqr4xuanIgF48AF9Y9an5Cr15Cr15tr1rA3WfXF1qgryIvr4F9as8XrWvkw4U
	uFnIvrn0qw4xXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWr
	XwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0
	s2-5UUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_200522_127616_8ADFB305 
X-CRM114-Status: GOOD (  15.68  )
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

Ck9uIDIwMjYvNy8yMiAyOjMwLCBwYXRjaHdvcmstYm90K25ldGRldmJwZkBrZXJuZWwub3JnIHdy
b3RlOgo+IEhlbGxvOgo+IAo+IFRoaXMgc2VyaWVzIHdhcyBhcHBsaWVkIHRvIGJwZi9icGYtbmV4
dC5naXQgKG1hc3RlcikKPiBieSBLdW1hciBLYXJ0aWtleWEgRHdpdmVkaSA8bWVteG9yQGdtYWls
LmNvbT46Cj4gCj4gT24gV2VkLCAgOCBKdWwgMjAyNiAwNjo0NDoyOSArMDAwMCB5b3Ugd3JvdGU6
Cj4+IEluIHRoZSBjdXJyZW50IFJWNjQgSklULCBpZiB3ZSBqdXN0IGRvbid0IGluaXRpYWxpemUg
dGhlIFRDQyBpbiBzdWJwcm9nLAo+PiB0aGUgVENDIGNhbiBiZSBwcm9wYWdhdGVkIGZyb20gdGhl
IHBhcmVudCBwcm9jZXNzIHRvIHRoZSBzdWJwcm9jZXNzLCBidXQKPj4gdGhlIHVwZGF0ZWQgVEND
IG9mIHRoZSBwYXJlbnQgcHJvY2VzcyBjYW5ub3QgYmUgcmVzdG9yZWQgd2hlbiB0aGUKPj4gc3Vi
cHJvY2VzcyBleGl0cy4gU2luY2UgdGhlIFJWNjQgVENDIGlzIGluaXRpYWxpemVkIGJlZm9yZSBz
YXZpbmcgdGhlCj4+IGNhbGxlZSBzYXZlZCByZWdpc3RlcnMgaW50byB0aGUgc3RhY2ssIHdlIGNh
bm5vdCB1c2UgdGhlIGNhbGxlZSBzYXZlZAo+PiByZWdpc3RlciB0byBwYXNzIHRoZSBUQ0MsIG90
aGVyd2lzZSB0aGUgb3JpZ2luYWwgdmFsdWUgb2YgdGhlIGNhbGxlZQo+PiBzYXZlZCByZWdpc3Rl
ciB3aWxsIGJlIGRlc3Ryb3llZC4gU28gd2UgaW1wbGVtZW50ZWQgbWl4aW5nIGJwZjJicGYgYW5k
Cj4+IHRhaWxjYWxscyBzaW1pbGFyIHRvIHg4Nl82NCwgaS5lLiB1c2luZyBhIG5vbi1jYWxsZWUg
c2F2ZWQgcmVnaXN0ZXIgdG8KPj4gdHJhbnNmZXIgdGhlIFRDQyBiZXR3ZWVuIGZ1bmN0aW9ucywg
YW5kIHNhdmluZyB0aGF0IHJlZ2lzdGVyIHRvIHRoZQo+PiBzdGFjayB0byBwcm90ZWN0IHRoZSBU
Q0MgdmFsdWUuIEFzIGZvciB0aGUgdGFpbGNhbGwgaGllcmFyY2h5IGlzc3VlLAo+PiBpbnNwaXJl
ZCBieSB0aGUgczM5MCdzIGxvdy1vdmVyaGVhZCBhcHByb2FjaCwgd2Ugc3RvcmUgVENDIGZyb20K
Pj4gUlZfUkVHX1RDQyBiYWNrIHRvIHN0YWNrIGFmdGVyIGNhbGxpbmcgYnBmMmJwZiBjYWxsIG9y
IGNhbGxpbmcgb3JpZyBicGYKPj4gZnVuYyBpbiBicGYgdHJhbXBvbGluZS4KPj4KPj4gWy4uLl0K
PiAKPiBIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6Cj4gICAgLSBbYnBmLW5leHQsdjYs
MS83XSBicGY6IEV4dHJhY3QgdGhlIGlzX3N0cnVjdF9vcHNfdHJhbXAgaGVscGVyCj4gICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jLzZiY2VjYWU0YjY1ZAo+ICAgIC0g
W2JwZi1uZXh0LHY2LDIvN10gcmlzY3YsIGJwZjogRml4IG1lbW9yeSBsZWFrIGluIGJwZl9qaXRf
ZnJlZQo+ICAgICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy8zNjllNDYz
NWQwNDgKPiAgICAtIFticGYtbmV4dCx2NiwzLzddIHJpc2N2LCBicGY6IFVzaW5nIGt2emFsbG9j
X29ianMgdG8gYWxsb2NhdGUgY2FjaGUgYnVmZmVyCj4gICAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL2JwZi9icGYtbmV4dC9jL2YzYWI4Nzg1OTRiNQo+ICAgIC0gW2JwZi1uZXh0LHY2LDQvN10g
cmlzY3YsIGJwZjogRml4IGtlcm5lbCBzdGFjayBjb3JydXB0aW9uIGluIHRhaWxjYWxsIHdpdGgg
Q0ZJCj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jLzUyZmIxNzU2
ZWExZAo+ICAgIC0gW2JwZi1uZXh0LHY2LDUvN10gcmlzY3YsIGJwZjogQWRkIFJWX1RBSUxDQUxM
X09GRlNFVCBtYWNybyB0byBmb3JtYXQgdGFpbGNhbGwgb2Zmc2V0Cj4gICAgICBodHRwczovL2dp
dC5rZXJuZWwub3JnL2JwZi9icGYtbmV4dC9jL2EyMTczMWY1NGNmZQo+ICAgIC0gW2JwZi1uZXh0
LHY2LDYvN10gcmlzY3YsIGJwZjogTWl4aW5nIGJwZjJicGYgYW5kIHRhaWxjYWxscwo+ICAgICAg
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9icGYvYnBmLW5leHQvYy9lYzcyODQ4Y2EwYWQKPiAgICAt
IFticGYtbmV4dCx2Niw3LzddIHNlbGZ0ZXN0cy9icGY6IFJlbW92ZSB0YWlsY2FsbHMgdGVzdHMg
ZnJvbSBERU5ZTElTVC5yaXNjdjY0Cj4gICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2JwZi9i
cGYtbmV4dC9jLzY4M2VkOGI3OGMxZAo+IAo+IFlvdSBhcmUgYXdlc29tZSwgdGhhbmsgeW91IQoK
RmluYWxseSBnb3QgdGhpcyBjb3ZlcmVkLCB3aGF0IGEgbG9uZyBqb3VybmV5Li4uCgpCdXQgaXQg
bG9va3MgbGlrZSBicGYgc2VsZnRlc3RzIGluIHJpc2N2IGlzIHByZXR0eSB1bmhhcHB5IG5vdy7w
n5iFCklmIGFueW9uZSBoYXMgc29tZSBzcGFyZSBjeWNsZXMsIGl0J2QgYmUgYXdlc29tZSBpZiB3
ZSBjb3VsZCBmaWd1cmUgCnRoZXNlIG91dCB0b2dldGhlci46KQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
