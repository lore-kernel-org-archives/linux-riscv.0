Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F066EC44515
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 07:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0C6gMbPlifkNzDmdRiOuiIDRIx28EkDiFdKn4epv8F0=; b=YGPvj1ZdhmR9WG
	5og+5xaKrDsUL0iM46AKDg4GOCxWIF2UAXiiZh+SbNm+EmKSQDvTFImq2ewX8qQzkE0pr3jA+fD+g
	rvltCsrxOhjKdTrjM5hr7hyC50LNx1WvFs5gt2Rj6Y0X9uzfHBKpWfMo7nZOf4JVtLJQ+5VWH0fgw
	MudESEg5zR0fxxQDcs+lnCJ90bjWuhbgaXj+qHS/9AKHdGybM0l+h+/tViVHogyhQikmF9DzgmEqC
	kadDgd95IcnLdJ5RjhY/39WHwZD+1eGMtIghUbxAQs67g1KHhpkJX3AXSFZEwZls9xFkGxyBGfUf4
	6EygjSGcHdtLVEwQCGAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd97-00000001Tu3-2n3B;
	Fri, 17 Jul 2026 07:38:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkd96-00000001Ttd-0f3N
	for linux-riscv@bombadil.infradead.org;
	Fri, 17 Jul 2026 07:38:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2HVhX8BRKozMuoqZ3FhZvmwOK0+DWBqHyEi1SffuTOI=; b=aGJkW3uU6ov+MEgUh6YN1AvOZX
	jLa4ccvm6DMQHCTXCXg1wojVw5oHhMKRjY0zDtAqTtOara7116uifnNomIX58HfH3TWlE1mIy68g/
	CiCbGJaze5KHCJAMX7XKJNO1fJ+t/7PGTAkK+92W6IUP0SC+y+aOvezxsLG+K8HyqYvDwVHVsH2HR
	OEbao5Ny5L5YMENgbx8cFFn2apsRyBqrsQ8L7aft2jWDOejcRJRzX5sog9jQsaxB4Xv1dco4Qn+GS
	25qwg6rkxgtrDG4TXnN7ftecEZPW86VAIGc9SU4AhrxlpjN4/D12+MOB+CO+CrLHaJhC0PWQ1RL5E
	KfKSg2/Q==;
Received: from dggsgout11.his.huawei.com ([45.249.212.51])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkd8y-0000000Ecb1-2CcH
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 07:38:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.170])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4h1hZX66TlzYQtff
	for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 15:37:24 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id EB8874056F
	for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 15:37:44 +0800 (CST)
Received: from [10.67.110.68] (unknown [10.67.110.68])
	by APP4 (Coremail) with UTF8SMTPA id gCh0CgDH+lvH21lqe+wnBg--.58759S2;
	Fri, 17 Jul 2026 15:37:44 +0800 (CST)
Message-ID: <dd20e3ea-4b3a-45d1-99f4-79e99e51e7fb@huaweicloud.com>
Date: Fri, 17 Jul 2026 15:37:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v6 6/7] riscv, bpf: Mixing bpf2bpf and tailcalls
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Daniel Borkmann <daniel@iogearbox.net>, bot+bpf-ci@kernel.org,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, andrii@kernel.org,
 eddyz87@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com,
 martin.lau@kernel.org, clm@meta.com, ihor.solodrai@linux.dev
References: <20260708064436.2971933-7-pulehui@huaweicloud.com>
 <a721df30ec2f824295000183c8e91f2c19d0bd56ae115b835b402be9eacc1c71@mail.kernel.org>
 <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com>
 <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com>
 <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com>
 <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com>
 <23cb9eac-1775-44b8-a9ec-10edde808a30@huaweicloud.com>
 <326eda4a-39e6-4f1e-8fe5-dc1cc9ae6739@iogearbox.net>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <326eda4a-39e6-4f1e-8fe5-dc1cc9ae6739@iogearbox.net>
X-CM-TRANSID: gCh0CgDH+lvH21lqe+wnBg--.58759S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZFWrZw47tF15Cr1kZF4xJFb_yoW5AF47pF
	yrWa4UKFWDJF1Iyr17tr18Ja4SyrsxJryUXF15J3sxAr90kr1agr47GrWj9r95ur4rCF1j
	qw1Yqay7Xrn5A3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8C
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
X-CRM114-CacheID: sfid-20260717_083801_296353_7B62A0F8 
X-CRM114-Status: GOOD (  14.42  )
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

CgpPbiAyMDI2LzcvMTAgMTc6NDMsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPiBPbiA3LzEwLzI2
IDI6NTMgQU0sIFB1IExlaHVpIHdyb3RlOgo+PiBPbiAyMDI2LzcvMTAgMzo1MSwgQmrDtnJuIFTD
tnBlbCB3cm90ZToKPj4+IE9uIFRodSwgOSBKdWwgMjAyNiBhdCAxNzowOSwgUHUgTGVodWkgPHB1
bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cm90ZToKPj4+PiBPbiAyMDI2LzcvOSAxOTozNywgQmrD
tnJuIFTDtnBlbCB3cm90ZToKPj4+Pj4gU29ycnkgZm9yIHRoZSBkZWxheSBoZXJlIC0tIHRoZSBi
b3QgaGFkIG1lIHRoaW5raW5nIGEgYml0Lgo+Pj4+Pgo+Pj4+PiBPbiBXZWQsIDggSnVsIDIwMjYg
YXQgMTA6NTQsIFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaWNsb3VkLmNvbT4gd3JvdGU6Cj4+Pj4+
IC4uLgo+Pj4+Pgo+Pj4+Pj4+IFRoaXMgYXNzdW1lcyBhIGZpeGVkIG51bWJlciBvZiBpbnN0cnVj
dGlvbnMgYmVmb3JlIHRoZSB0YWlsY2FsbCAKPj4+Pj4+PiBlbnRyeQo+Pj4+Pj4+IHBvaW50LiBX
aGVuIGlzX3N1YnByb2cgaXMgdHJ1ZSwgdGhlIHJ2X2FkZGkoKSBpbnN0cnVjdGlvbiBpcyBub3Qg
Cj4+Pj4+Pj4gZW1pdHRlZCwKPj4+Pj4+PiB3aGljaCBtZWFucyB0aGUgdGFpbGNhbGwgZW50cnkg
cG9pbnQgbW92ZXMgZm9yd2FyZCBieSA0IGJ5dGVzIAo+Pj4+Pj4+IHJlbGF0aXZlIHRvCj4+Pj4+
Pj4gd2hlcmUgUlZfVEFJTENBTExfT0ZGU0VUIGV4cGVjdHMgaXQgdG8gYmUuCj4+Pj4+Pj4KPj4+
Pj4+PiBUaGUgdGFpbGNhbGwgZW50cnkgaXMgdXNlZCBpbiBlbWl0X2JwZl90YWlsX2NhbGwoKSB3
aGVuIAo+Pj4+Pj4+IGNhbGN1bGF0aW5nIHRoZQo+Pj4+Pj4+IGp1bXAgdGFyZ2V0IGZvciB0aGUg
dGFpbCBjYWxsLiBJZiBSVl9UQUlMQ0FMTF9PRkZTRVQgZG9lc24ndCAKPj4+Pj4+PiBhY2NvdW50
IGZvcgo+Pj4+Pj4+IHRoZSBjb25kaXRpb25hbCBlbWlzc2lvbiwgY291bGQgdGhpcyBjYXVzZSB0
aGUgd3JvbmcgZW50cnkgcG9pbnQgCj4+Pj4+Pj4gdG8gYmUKPj4+Pj4+PiB1c2VkIHdoZW4gdGFp
bCBjYWxsaW5nIGludG8gc3VicHJvZ3JhbXM/Cj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpcyBub3QgYW4g
aXNzdWUsIHN1YnByb2cgY2FuIG5vdCBiZSB0aGUgdGFpbGNhbGwgY2FsbGVlLgo+Pj4+Pgo+Pj4+
PiBTYXksIHRoYXQgd2UgaGF2ZSBhbiBlbnRyeSBmdW5jdGlvbiB0aGF0IGRvZXMgYnBmX2Zvcl9l
YWNoX21hcF9hcnJheSgpCj4+Pj4+IGludG8gYSBjYWxsYmFjayBjYigpLiBjYigpIGlzIGEgc3Vi
cHJvZ3JhbSwgc28gbm8gaW5pdCBvZiBUQ0MuIE5vdywKPj4+Pj4gY2IoKSBjYWxscyBhbm90aGVy
IHN1YnByb2dyYW0gdGhhdCBkb2VzIGEgdGFpbGNhbGwuCj4+Pj4+Cj4+Pj4+IFRoZSBjYWxsYmFj
ayB0byBjYigpIGlzIGNvbWluZyBmcm9tIHRoZSBrZXJuZWwsIHNvIGE2IGNvdWxkIGhhdmUgYmVl
bgo+Pj4+PiBjbG9iYmVyZWQsIG5vPyBXZSdyZSBlbnRlcmluZyBhIHN1YnByb2dyYW0gY29taW5n
IGZyb20gdGhlIEMgQUJJLiBOb3csCj4+Pj4+IGlmIHRoZSBjYWxsYmFjayBjYWxscyBhIHN1YnBy
b2cgdGhhdCdzIHRhaWwtY2FsbCByZWFjaGFibGUsIHRoZSBUQ0MKPj4+Pj4gY2FuIGJlIGdhcmJh
Z2U/Cj4+Pj4KPj4+PiBTYXNoaWtvIHJlcG9ydGVkIHRoZSBzYW1lIGlzc3VlIHllc3RlcmRheS4g
SSB2ZXJpZmllZCB0aGF0IHRoZSB2ZXJpZmllcgo+Pj4+IHJlamVjdHMgY2FzZXMgd2hlcmUgYSB0
YWlsIGNhbGwgaXMgaW52b2tlZCB3aXRoaW4gYSBjYWxsYmFjazsKPj4+PiBzcGVjaWZpY2FsbHks
IHdoaWxlIHRoZSBjYWxsYmFjaydzIHJldHVybiB2YWx1ZSByYW5nZSBpcyBbMCwgMV0sIHRoZQo+
Pj4+IHNpbXVsYXRpb24gb2YgdGhlIGV4aXQgcGF0aCBpbiBgY2hlY2tfaGVscGVyX2NhbGxgICho
YW5kbGluZyB0aGUgdGFpbAo+Pj4+IGNhbGwgaGVscGVyKSBtYXJrcyBSMCBhcyBVTktOT1dOLCBj
YXVzaW5nIHRoZSB2ZXJpZmllciB0byByZWplY3QgCj4+Pj4gaXTigJRzbyBJCj4+Pj4gZGlkbid0
IGludmVzdGlnYXRlIGZ1cnRoZXIuIEhvd2V2ZXIsIEkganVzdCB2ZXJpZmllZCB0aGF0IHRoZSB2
ZXJpZmllcgo+Pj4+ICpkb2VzKiBhY2NlcHQgdGhlIHNjZW5hcmlvIHdoZXJlIGEgY2FsbGJhY2sg
Y2FsbHMgYSBzdWJwcm9ncmFtLCBhbmQgCj4+Pj4gdGhhdAo+Pj4+IHN1YnByb2dyYW0gc3Vic2Vx
dWVudGx5IGNhbGxzIGEgdGFpbCBjYWxsLiBJIGJlbGlldmUgdGhpcyBzY2VuYXJpbyAKPj4+PiBv
dWdodAo+Pj4+IHRvIGJlIHJlamVjdGVkOyBwZXJoYXBzIHNvbWUgY2hhbmdlcyBhcmUgbmVlZGVk
IGluIHRoZSB2ZXJpZmllciwKPj4+PiBvdGhlcndpc2UgdGFpbCBjYWxscyBvbiBvdGhlciBhcmNo
aXRlY3R1cmVzIChsaWtlIHg4Nikgd291bGQgYWxzbyBiZQo+Pj4+IHN1c2NlcHRpYmxlIHRvIGlu
ZmluaXRlIGxvb3AgaXNzdWVzLgo+Pj4KPj4+IFRoYW5rcyBmb3IgdHJ5aW5nIGl0IG91dCEKPj4+
Cj4+PiBPaywgc28gc2VlbXMgbGlrZSB3ZSBuZWVkIGEgdmVyaWZpZXIgZml4IHByZS1sYW5kaW5n
PwoKSGkgQmrDtnJuLAoKSnVzdCBhIHF1aWNrIG5vdGUgdGhhdCB0aGUgdmVyaWZpZXIgZml4IHdl
IGRpc2N1c3NlZCBoYXMgbm93IGxhbmRlZCBpbiAKYnBmLW5leHQgWzBdLiBMb29raW5nIGZvcndh
cmQgdG8geW91ciBmZWVkYmFjayBvbiB2NiB3aGVuZXZlciB5b3UgZ2V0IGEgCmNoYW5jZS4gOikK
ClswXSAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnBmLzE3ODQyNDk0MTEzOS4xNDc1Nzg3LjE4
MDgwODkzMzMwNjcwMTkyOTM0LmdpdC1wYXRjaHdvcmstbm90aWZ5QGtlcm5lbC5vcmcvCgo+Pgo+
PiBtYWtlIHNlbnNlIHRvIG1lLCB3aWxsIHRyeSBpdC4KPiAKPiBUaGFua3MsIHllcywgcGxlYXNl
IHRha2UgYSBzdGFiIGF0IGNyYWZ0aW5nIGEgdmVyaWZpZXIgZml4ICsgQlBGIHNlbGZ0ZXN0Cj4g
YW5kIGxldCB1cyBrbm93IGlmIHlvdSBhcmUgc3R1Y2sgc29tZXdoZXJlLgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
