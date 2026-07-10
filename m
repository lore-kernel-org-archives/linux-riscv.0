Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E19CC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 00:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iZDNf+gcliWvBj13hT8wCKhJjl86kF2TnoYSa/qukR4=; b=Mk9XO+mhP41L5q
	tc/ndfUabEV7inZXIZaAjLiPPOiBOq4R7GarqgfY4n62RVe4a4js3mXXsqwDHGFO/oLuIXOezFVUl
	8BWSXIUAosoSmREx6rli7NFJhGEkhKLCglUqUX6kHSuYaCPfCdyElu5L1Hh5qPt4hdml7yg9FHYDa
	z5Z2Uc+xEbWcIG5SDtNm2XhY+m8aYi6hJtigXjb+Jcaixw3b/HLEmchsPNFEl5c6wNvei/zBkL5k5
	gluqG95utrXNuKBUWxgtHN/u42QjIC91Xe671PYat6VbVBi9t4Nozv9uB0BxikJJ4JYt6Q8vvLWsf
	12pUbRKlR9dOIDF5SGOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzUy-00000003tPn-2hh5;
	Fri, 10 Jul 2026 00:53:48 +0000
Received: from dggsgout12.his.huawei.com ([45.249.212.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzUv-00000003tPN-2euC
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 00:53:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.198])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4gxCxQ53BmzKHMMg
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 08:53:14 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 1F5CC40706
	for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 08:53:38 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgCXyFmQQlBqnTy3Ag--.2401S2;
	Fri, 10 Jul 2026 08:53:37 +0800 (CST)
Message-ID: <23cb9eac-1775-44b8-a9ec-10edde808a30@huaweicloud.com>
Date: Fri, 10 Jul 2026 08:53:36 +0800
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
 <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com>
 <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com>
X-CM-TRANSID: gCh0CgCXyFmQQlBqnTy3Ag--.2401S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryrArW3Xry7Zr15Xry5Jwb_yoW8Kr48pF
	yruasrKFykJFn2yr1xtF18Jas0yrsxt3yUWF15JrnxAr90krnxKF47G3yq9Fy8ur4FkF1F
	vw4Yg3y3Jwn5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x
	0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
	rVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4
	IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kK
	e7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_
	WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jIksgUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_175346_048040_372197B5 
X-CRM114-Status: GOOD (  14.34  )
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

CgpPbiAyMDI2LzcvMTAgMzo1MSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBPbiBUaHUsIDkgSnVs
IDIwMjYgYXQgMTc6MDksIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JvdGU6
Cj4+Cj4+Cj4+IE9uIDIwMjYvNy85IDE5OjM3LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+Pj4gU29y
cnkgZm9yIHRoZSBkZWxheSBoZXJlIC0tIHRoZSBib3QgaGFkIG1lIHRoaW5raW5nIGEgYml0Lgo+
Pj4KPj4+IE9uIFdlZCwgOCBKdWwgMjAyNiBhdCAxMDo1NCwgUHUgTGVodWkgPHB1bGVodWlAaHVh
d2VpY2xvdWQuY29tPiB3cm90ZToKPj4+Cj4+PiAuLi4KPj4+Cj4+Pj4+IFRoaXMgYXNzdW1lcyBh
IGZpeGVkIG51bWJlciBvZiBpbnN0cnVjdGlvbnMgYmVmb3JlIHRoZSB0YWlsY2FsbCBlbnRyeQo+
Pj4+PiBwb2ludC4gV2hlbiBpc19zdWJwcm9nIGlzIHRydWUsIHRoZSBydl9hZGRpKCkgaW5zdHJ1
Y3Rpb24gaXMgbm90IGVtaXR0ZWQsCj4+Pj4+IHdoaWNoIG1lYW5zIHRoZSB0YWlsY2FsbCBlbnRy
eSBwb2ludCBtb3ZlcyBmb3J3YXJkIGJ5IDQgYnl0ZXMgcmVsYXRpdmUgdG8KPj4+Pj4gd2hlcmUg
UlZfVEFJTENBTExfT0ZGU0VUIGV4cGVjdHMgaXQgdG8gYmUuCj4+Pj4+Cj4+Pj4+IFRoZSB0YWls
Y2FsbCBlbnRyeSBpcyB1c2VkIGluIGVtaXRfYnBmX3RhaWxfY2FsbCgpIHdoZW4gY2FsY3VsYXRp
bmcgdGhlCj4+Pj4+IGp1bXAgdGFyZ2V0IGZvciB0aGUgdGFpbCBjYWxsLiBJZiBSVl9UQUlMQ0FM
TF9PRkZTRVQgZG9lc24ndCBhY2NvdW50IGZvcgo+Pj4+PiB0aGUgY29uZGl0aW9uYWwgZW1pc3Np
b24sIGNvdWxkIHRoaXMgY2F1c2UgdGhlIHdyb25nIGVudHJ5IHBvaW50IHRvIGJlCj4+Pj4+IHVz
ZWQgd2hlbiB0YWlsIGNhbGxpbmcgaW50byBzdWJwcm9ncmFtcz8KPj4+Pgo+Pj4+IFRoaXMgaXMg
bm90IGFuIGlzc3VlLCBzdWJwcm9nIGNhbiBub3QgYmUgdGhlIHRhaWxjYWxsIGNhbGxlZS4KPj4+
Cj4+PiBTYXksIHRoYXQgd2UgaGF2ZSBhbiBlbnRyeSBmdW5jdGlvbiB0aGF0IGRvZXMgYnBmX2Zv
cl9lYWNoX21hcF9hcnJheSgpCj4+PiBpbnRvIGEgY2FsbGJhY2sgY2IoKS4gY2IoKSBpcyBhIHN1
YnByb2dyYW0sIHNvIG5vIGluaXQgb2YgVENDLiBOb3csCj4+PiBjYigpIGNhbGxzIGFub3RoZXIg
c3VicHJvZ3JhbSB0aGF0IGRvZXMgYSB0YWlsY2FsbC4KPj4+Cj4+PiBUaGUgY2FsbGJhY2sgdG8g
Y2IoKSBpcyBjb21pbmcgZnJvbSB0aGUga2VybmVsLCBzbyBhNiBjb3VsZCBoYXZlIGJlZW4KPj4+
IGNsb2JiZXJlZCwgbm8/IFdlJ3JlIGVudGVyaW5nIGEgc3VicHJvZ3JhbSBjb21pbmcgZnJvbSB0
aGUgQyBBQkkuIE5vdywKPj4+IGlmIHRoZSBjYWxsYmFjayBjYWxscyBhIHN1YnByb2cgdGhhdCdz
IHRhaWwtY2FsbCByZWFjaGFibGUsIHRoZSBUQ0MKPj4+IGNhbiBiZSBnYXJiYWdlPwo+Pgo+PiBT
YXNoaWtvIHJlcG9ydGVkIHRoZSBzYW1lIGlzc3VlIHllc3RlcmRheS4gSSB2ZXJpZmllZCB0aGF0
IHRoZSB2ZXJpZmllcgo+PiByZWplY3RzIGNhc2VzIHdoZXJlIGEgdGFpbCBjYWxsIGlzIGludm9r
ZWQgd2l0aGluIGEgY2FsbGJhY2s7Cj4+IHNwZWNpZmljYWxseSwgd2hpbGUgdGhlIGNhbGxiYWNr
J3MgcmV0dXJuIHZhbHVlIHJhbmdlIGlzIFswLCAxXSwgdGhlCj4+IHNpbXVsYXRpb24gb2YgdGhl
IGV4aXQgcGF0aCBpbiBgY2hlY2tfaGVscGVyX2NhbGxgIChoYW5kbGluZyB0aGUgdGFpbAo+PiBj
YWxsIGhlbHBlcikgbWFya3MgUjAgYXMgVU5LTk9XTiwgY2F1c2luZyB0aGUgdmVyaWZpZXIgdG8g
cmVqZWN0IGl04oCUc28gSQo+PiBkaWRuJ3QgaW52ZXN0aWdhdGUgZnVydGhlci4gSG93ZXZlciwg
SSBqdXN0IHZlcmlmaWVkIHRoYXQgdGhlIHZlcmlmaWVyCj4+ICpkb2VzKiBhY2NlcHQgdGhlIHNj
ZW5hcmlvIHdoZXJlIGEgY2FsbGJhY2sgY2FsbHMgYSBzdWJwcm9ncmFtLCBhbmQgdGhhdAo+PiBz
dWJwcm9ncmFtIHN1YnNlcXVlbnRseSBjYWxscyBhIHRhaWwgY2FsbC4gSSBiZWxpZXZlIHRoaXMg
c2NlbmFyaW8gb3VnaHQKPj4gdG8gYmUgcmVqZWN0ZWQ7IHBlcmhhcHMgc29tZSBjaGFuZ2VzIGFy
ZSBuZWVkZWQgaW4gdGhlIHZlcmlmaWVyLAo+PiBvdGhlcndpc2UgdGFpbCBjYWxscyBvbiBvdGhl
ciBhcmNoaXRlY3R1cmVzIChsaWtlIHg4Nikgd291bGQgYWxzbyBiZQo+PiBzdXNjZXB0aWJsZSB0
byBpbmZpbml0ZSBsb29wIGlzc3Vlcy4KPiAKPiBUaGFua3MgZm9yIHRyeWluZyBpdCBvdXQhCj4g
Cj4gT2ssIHNvIHNlZW1zIGxpa2Ugd2UgbmVlZCBhIHZlcmlmaWVyIGZpeCBwcmUtbGFuZGluZz8K
Cm1ha2Ugc2Vuc2UgdG8gbWUsIHdpbGwgdHJ5IGl0LgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
