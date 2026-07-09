Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2631FC44501
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 15:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJheNk6ByIWnOjyPYzBgKQrFNmWcHPhWCaZYQMk/7ao=; b=reIo30BhiTcShp
	4y/s9O9wiR2j4SUdEtB7tC5xeVRsd57cE+j9vNMdFazutmgEHEHJl2gixu50Of6Q8OuaZOl1Sc0Ai
	CoZJlFgoqvSKEFro/YjfCjAU3dhRYO8UQ2YmxOADmVRhywCJzYvZGV+4FWIbetzix/kYyFFeprq21
	hdKuwpOfCwtQwsvw+hMiMs1nx172heHvjcYsIoIxDVU1x5q8rm249IeynGNHdI8cTE5NIl47OJU6c
	oWbY1zsZsgcMmNWAHuBTAZ/AIU79/8x41mZ9yNKhuULahzvllMiWpPQrV8yO6aKaQ96QJffrXF1S6
	Jnr6WPFvOCtxFCo9Qk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqNv-00000002shN-0ThF;
	Thu, 09 Jul 2026 15:09:55 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqNr-00000002sg2-3j1e
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 15:09:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gwyzc3bNlzKHMKr
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 23:09:16 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 414A3406C5
	for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2026 23:09:39 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP2 (Coremail) with UTF8SMTPA id Syh0CgBnTCixuU9qsKCDAg--.2779S2;
	Thu, 09 Jul 2026 23:09:39 +0800 (CST)
Message-ID: <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com>
Date: Thu, 9 Jul 2026 23:09:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 6/7] riscv, bpf: Mixing bpf2bpf and tailcalls
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: bot+bpf-ci@kernel.org, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
 haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260708064436.2971933-7-pulehui@huaweicloud.com>
 <a721df30ec2f824295000183c8e91f2c19d0bd56ae115b835b402be9eacc1c71@mail.kernel.org>
 <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com>
 <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
X-CM-TRANSID: Syh0CgBnTCixuU9qsKCDAg--.2779S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF48GrWkAF4xJrW7Kry3Jwb_yoW8ZF4UpF
	yruasrKFWkJFn2k3W7JF48Can0yrsxJ3yUGF1rJrnxA3s8Crn0gFW7G39Y9FyDursYkFy0
	9a1jgw45Jwn5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUIa
	0PDUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_080952_281983_FE71A7F9 
X-CRM114-Status: GOOD (  15.67  )
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

Ck9uIDIwMjYvNy85IDE5OjM3LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IFNvcnJ5IGZvciB0aGUg
ZGVsYXkgaGVyZSAtLSB0aGUgYm90IGhhZCBtZSB0aGlua2luZyBhIGJpdC4KPiAKPiBPbiBXZWQs
IDggSnVsIDIwMjYgYXQgMTA6NTQsIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4g
d3JvdGU6Cj4gCj4gLi4uCj4gCj4+PiBUaGlzIGFzc3VtZXMgYSBmaXhlZCBudW1iZXIgb2YgaW5z
dHJ1Y3Rpb25zIGJlZm9yZSB0aGUgdGFpbGNhbGwgZW50cnkKPj4+IHBvaW50LiBXaGVuIGlzX3N1
YnByb2cgaXMgdHJ1ZSwgdGhlIHJ2X2FkZGkoKSBpbnN0cnVjdGlvbiBpcyBub3QgZW1pdHRlZCwK
Pj4+IHdoaWNoIG1lYW5zIHRoZSB0YWlsY2FsbCBlbnRyeSBwb2ludCBtb3ZlcyBmb3J3YXJkIGJ5
IDQgYnl0ZXMgcmVsYXRpdmUgdG8KPj4+IHdoZXJlIFJWX1RBSUxDQUxMX09GRlNFVCBleHBlY3Rz
IGl0IHRvIGJlLgo+Pj4KPj4+IFRoZSB0YWlsY2FsbCBlbnRyeSBpcyB1c2VkIGluIGVtaXRfYnBm
X3RhaWxfY2FsbCgpIHdoZW4gY2FsY3VsYXRpbmcgdGhlCj4+PiBqdW1wIHRhcmdldCBmb3IgdGhl
IHRhaWwgY2FsbC4gSWYgUlZfVEFJTENBTExfT0ZGU0VUIGRvZXNuJ3QgYWNjb3VudCBmb3IKPj4+
IHRoZSBjb25kaXRpb25hbCBlbWlzc2lvbiwgY291bGQgdGhpcyBjYXVzZSB0aGUgd3JvbmcgZW50
cnkgcG9pbnQgdG8gYmUKPj4+IHVzZWQgd2hlbiB0YWlsIGNhbGxpbmcgaW50byBzdWJwcm9ncmFt
cz8KPj4KPj4gVGhpcyBpcyBub3QgYW4gaXNzdWUsIHN1YnByb2cgY2FuIG5vdCBiZSB0aGUgdGFp
bGNhbGwgY2FsbGVlLgo+IAo+IFNheSwgdGhhdCB3ZSBoYXZlIGFuIGVudHJ5IGZ1bmN0aW9uIHRo
YXQgZG9lcyBicGZfZm9yX2VhY2hfbWFwX2FycmF5KCkKPiBpbnRvIGEgY2FsbGJhY2sgY2IoKS4g
Y2IoKSBpcyBhIHN1YnByb2dyYW0sIHNvIG5vIGluaXQgb2YgVENDLiBOb3csCj4gY2IoKSBjYWxs
cyBhbm90aGVyIHN1YnByb2dyYW0gdGhhdCBkb2VzIGEgdGFpbGNhbGwuCj4gCj4gVGhlIGNhbGxi
YWNrIHRvIGNiKCkgaXMgY29taW5nIGZyb20gdGhlIGtlcm5lbCwgc28gYTYgY291bGQgaGF2ZSBi
ZWVuCj4gY2xvYmJlcmVkLCBubz8gV2UncmUgZW50ZXJpbmcgYSBzdWJwcm9ncmFtIGNvbWluZyBm
cm9tIHRoZSBDIEFCSS4gTm93LAo+IGlmIHRoZSBjYWxsYmFjayBjYWxscyBhIHN1YnByb2cgdGhh
dCdzIHRhaWwtY2FsbCByZWFjaGFibGUsIHRoZSBUQ0MKPiBjYW4gYmUgZ2FyYmFnZT8KClNhc2hp
a28gcmVwb3J0ZWQgdGhlIHNhbWUgaXNzdWUgeWVzdGVyZGF5LiBJIHZlcmlmaWVkIHRoYXQgdGhl
IHZlcmlmaWVyIApyZWplY3RzIGNhc2VzIHdoZXJlIGEgdGFpbCBjYWxsIGlzIGludm9rZWQgd2l0
aGluIGEgY2FsbGJhY2s7IApzcGVjaWZpY2FsbHksIHdoaWxlIHRoZSBjYWxsYmFjaydzIHJldHVy
biB2YWx1ZSByYW5nZSBpcyBbMCwgMV0sIHRoZSAKc2ltdWxhdGlvbiBvZiB0aGUgZXhpdCBwYXRo
IGluIGBjaGVja19oZWxwZXJfY2FsbGAgKGhhbmRsaW5nIHRoZSB0YWlsIApjYWxsIGhlbHBlcikg
bWFya3MgUjAgYXMgVU5LTk9XTiwgY2F1c2luZyB0aGUgdmVyaWZpZXIgdG8gcmVqZWN0IGl04oCU
c28gSSAKZGlkbid0IGludmVzdGlnYXRlIGZ1cnRoZXIuIEhvd2V2ZXIsIEkganVzdCB2ZXJpZmll
ZCB0aGF0IHRoZSB2ZXJpZmllciAKKmRvZXMqIGFjY2VwdCB0aGUgc2NlbmFyaW8gd2hlcmUgYSBj
YWxsYmFjayBjYWxscyBhIHN1YnByb2dyYW0sIGFuZCB0aGF0IApzdWJwcm9ncmFtIHN1YnNlcXVl
bnRseSBjYWxscyBhIHRhaWwgY2FsbC4gSSBiZWxpZXZlIHRoaXMgc2NlbmFyaW8gb3VnaHQgCnRv
IGJlIHJlamVjdGVkOyBwZXJoYXBzIHNvbWUgY2hhbmdlcyBhcmUgbmVlZGVkIGluIHRoZSB2ZXJp
ZmllciwgCm90aGVyd2lzZSB0YWlsIGNhbGxzIG9uIG90aGVyIGFyY2hpdGVjdHVyZXMgKGxpa2Ug
eDg2KSB3b3VsZCBhbHNvIGJlIApzdXNjZXB0aWJsZSB0byBpbmZpbml0ZSBsb29wIGlzc3Vlcy4K
Cj4gCj4gCj4gQmrDtnJuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
