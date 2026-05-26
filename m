Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DDBCD5BD1
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 22:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJFUN5041O0VRR8YwRg5D6HORS6VVrtR2/LKo3Fi/NE=; b=oLBJUshGBQFO6S
	S9J8oNyMRA3TmDtdP+4ajQzpjGJY9IY+YjYG7DUgSjcwfXkJmmekNEMsfL2H32pXUSpqvbcEKBiNG
	YQHYOlj1yHP+tqMPpdYWyCD7GsZEqHvgACyIuP1PZ6OVwdyC0zkGh8Zy4LFole/Mr9dp4+ZqVHf9a
	hpv3NrR65oQjB0UbG6ors5Z8rysyiSTWnIJYwsNZxMQZ606TZLETAFyUlqwIIZ1sH0RicwtVZi+kU
	vQPtWfUVQjsyD8w6uqce6Q61ABh+tFhC6FPVmZ7ERSF687Scmy5ODrh4bI5qY3ThAMFiU/Xyr5/8t
	2Lp7CBJ4O4EeoUV0dblw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUXGc-0000000Drc5-2QWf;
	Tue, 02 Jun 2026 22:07:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRudI-00000002VpS-0ZKE;
	Tue, 26 May 2026 16:27:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6B42743CB5;
	Tue, 26 May 2026 16:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289D31F000E9;
	Tue, 26 May 2026 16:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779812875;
	bh=uX6weQ63PycMa+NiIwkaE0lKXtL5D7cf5slQyEH4uVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WCPBslFBHlD18xXQc3r4cfXRi6NRqMWZgpFMn1cIbrapYoU4c4gRwNK1+7uVsqGAy
	 60v2BCHvTRcdS1tVvGPbqfVfdwwcJp1FHFNfktx1fkX0Wbx1RZrVm0KBNermhINrKf
	 T9lX4lpoqb8ZTQ988HCILQXzmPKZjen7JnhZ0OVSRmfeZwap0kKaSy4gg8etm5udnf
	 udcU0Sgi7luz1Cc1OPvSW+2ubz9qCszQO2AwKg/qp69fZ72CdWGJzB5e9f6nHF0uBd
	 ldc80qXMC/DUvHJCNvAW1ArbfI1EfmFu9YdmZYAerVhlmQZOEcNqDEor/Ir+l9+s8j
	 e4sx9r+STyxUg==
Date: Tue, 26 May 2026 17:27:52 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Takahiro Itazuri <itazur@amazon.com>
Cc: seanjc@google.com, Liam.Howlett@oracle.com, ackerleytng@google.com, 
	agordeev@linux.ibm.com, ajones@ventanamicro.com, akpm@linux-foundation.org, 
	alex@ghiti.fr, andrii@kernel.org, aou@eecs.berkeley.edu, ast@kernel.org, 
	baolu.lu@linux.intel.com, borntraeger@linux.ibm.com, bp@alien8.de, bpf@vger.kernel.org, 
	catalin.marinas@arm.com, chenhuacai@kernel.org, corbet@lwn.net, coxu@redhat.com, 
	daniel@iogearbox.net, dave.hansen@linux.intel.com, david@kernel.org, 
	derekmn@amazon.com, dev.jain@arm.com, eddyz87@gmail.com, 
	gerald.schaefer@linux.ibm.com, gor@linux.ibm.com, haoluo@google.com, hca@linux.ibm.com, 
	hpa@zytor.com, itazur@amazon.co.uk, jackabt@amazon.co.uk, jackmanb@google.com, 
	jannh@google.com, jgg@ziepe.ca, jgross@suse.com, jhubbard@nvidia.com, 
	jiayuan.chen@shopee.com, jmattson@google.com, joey.gouly@arm.com, 
	john.fastabend@gmail.com, jolsa@kernel.org, jthoughton@google.com, kalyazin@amazon.co.uk, 
	kas@kernel.org, kernel@xen0n.name, kpsingh@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, lenb@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, loongarch@lists.linux.dev, 
	lorenzo.stoakes@oracle.com, luto@kernel.org, maobibo@loongson.cn, martin.lau@linux.dev, 
	maz@kernel.org, mhocko@suse.com, mingo@redhat.com, mlevitsk@redhat.com, 
	nikita.kalyazin@linux.dev, oupton@kernel.org, palmer@dabbelt.com, patrick.roy@linux.dev, 
	pavel@kernel.org, pbonzini@redhat.com, peterx@redhat.com, peterz@infradead.org, 
	pfalcato@suse.de, pjw@kernel.org, prsampat@amd.com, rafael@kernel.org, 
	riel@surriel.com, rppt@kernel.org, ryan.roberts@arm.com, sdf@fomichev.me, 
	shijie@os.amperecomputing.com, skhan@linuxfoundation.org, song@kernel.org, surenb@google.com, 
	suzuki.poulose@arm.com, svens@linux.ibm.com, tabba@google.com, tglx@kernel.org, 
	thuth@redhat.com, urezki@gmail.com, vannapurve@google.com, vbabka@kernel.org, 
	will@kernel.org, willy@infradead.org, wu.fei9@sanechips.com.cn, x86@kernel.org, 
	yang@os.amperecomputing.com, yangyicong@hisilicon.com, yonghong.song@linux.dev, 
	yosry@kernel.org, yu-cheng.yu@intel.com, yuzenghui@huawei.com, 
	zhengqi.arch@bytedance.com
Subject: Re: [PATCH v12 00/16] Direct Map Removal Support for guest_memfd
Message-ID: <ahXJoHNoeCcaupzN@lucifer>
References: <aeennZlV60k81OBf@google.com>
 <20260506080753.14517-1-itazur@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260506080753.14517-1-itazur@amazon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_092756_215984_CF315FFA 
X-CRM114-Status: GOOD (  21.06  )
X-Mailman-Approved-At: Tue, 02 Jun 2026 15:07:21 -0700
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBNYXkgMDYsIDIwMjYgYXQgMDg6MDc6NTJBTSArMDAwMCwgVGFrYWhpcm8gSXRhenVy
aSB3cm90ZToKPiBIaSBMb3JlbnpvIGFuZCBTZWFuLAo+Cj4gQXBvbG9naWVzIGZvciB0aGUgZGVs
YXllZCByZXBseSDigJQgTmlraXRhIGlzIGxlYXZpbmcgQW1hem9uLCBhbmQgSSdtCj4gdGFraW5n
IG92ZXIgdGhpcyBzZXJpZXMgZ29pbmcgZm9yd2FyZC4gVGhhbmtzIGZvciB5b3VyIHBhdGllbmNl
LgoKSGV5LAoKVGhhbmtzIGZvciBsZXR0aW5nIHVzIGtub3chIEFuZCB0aGFua3MgdG8gTmlraXRh
IGZvciBhbGwgaGlzIHdvcmssIHdpbGwKa2VlcCBhbiBleWUgb3V0IGZvciB0aGUgcmVzcGluIQoK
Q2hlZXJzLCBMb3JlbnpvCgo+Cj4gT24gVHVlLCBBcHIgMjEsIDIwMjYgYXQgMDE6NDA6MDBQTSAr
MDAwMCwgTG9yZW56byBTdG9ha2VzIHdyb3RlOgo+ID4gSG0sIGdpdmVuIHRoaXMgdG91Y2hlcyBh
IGZhaXIgYml0IG9mIG1tLCBJIHdvbmRlciBpZiB3ZSBzaG91bGRuJ3QgdHJ5IHRvIGRvIHRoaXMK
PiA+IHRocm91Z2ggdGhlIG1tIHRyZWU/Cj4KPiBPbiBUdWUsIEFwciAyMSwgMjAyNiBhdCAwNDoz
NjowMFBNICswMDAwLCBTZWFuIENocmlzdG9waGVyc29uIHdyb3RlOgo+ID4gWWVhaCwgd2hlbiB0
aGUgdGltZSBjb21lcywgdGhlIG1tIHBpZWNlcyBkZWZpbml0ZWx5IG5lZWQgdG8gZ28gdGhyb3Vn
aCB0aGUgbW0KPiA+IHRyZWUuICBJZGVhbGx5LCBJIHRoaW5rIHRoaXMgd291bGQgYmUgbWVyZ2Vk
IGluIHR3byBzZXBhcmF0ZSBwYXJ0cywgd2l0aCBhbGwgbW0KPiA+IGNoYW5nZXMgZ29pbmcgdGhy
b3VnaCB0aGUgbW0gdHJlZSwgYW5kIHRoZW4gdGhlIEtWTSBjaGFuZ2VzIHRocm91Z2ggdGhlIEtW
TSB0cmVlCj4gPiB1c2luZyBhIHN0YWJsZSB0b3BpYyBicmFuY2gvdGFnIGZyb20gQW5kcmV3Lgo+
Cj4gVGhhbmtzIGZvciB0aGUgZ3VpZGFuY2UuIFRoZSBzcGxpdCBtYWtlcyBzZW5zZSB0byBtZTsg
SSdtIHBsYW5uaW5nIHRvCj4gZm9sbG93IHRoaXMgYXBwcm9hY2ggd2l0aCBwYXRjaGVzIDEtNiAo
bW0pIGdvaW5nIHRocm91Z2ggdGhlIG1tIHRyZWUKPiBhbmQgcGF0Y2hlcyA3LTE2IChLVk0pIHRo
cm91Z2ggdGhlIEtWTSB0cmVlIG9uIHRvcCBvZiBhIHN0YWJsZQo+IGJyYW5jaC90YWcgZnJvbSBt
bS4gSSdsbCBjb25maXJtIHRoZSBleGFjdCBib3VuZGFyeSBhbmQgY29vcmRpbmF0aW9uCj4gZGV0
YWlscyBhcyBJIHByZXBhcmUgdGhlIHJlcG9zdC4KPgo+IE9uIFR1ZSwgQXByIDIxLCAyMDI2IGF0
IDAxOjQwOjAwUE0gKzAwMDAsIExvcmVuem8gU3RvYWtlcyB3cm90ZToKPiA+IEluIGFueSBjYXNl
LCB3ZSBkZWZpbml0ZWx5IG5lZWQgYSByZWJhc2Ugb24gc29tZXRoaW5nIG5vdC1uZXh0IDopIGlm
IG5vdCBtbSB0aGVuCj4gPiBMaW51cydzIHRyZWUgYXQgbGVhc3QgbWF5YmU/Cj4gPgo+ID4gSSdt
IHNlZWluZyBhIGxvdCBvZiBjb25mbGljdHMgYWdhaW5zdCBtbS11bnN0YWJsZSwgaXQgY2FuJ3Qg
YjQgc2hhemFtIGV2ZW4gcGF0Y2gKPiA+IDEgYW5kIGluIExpbnVzJ3MgdHJlZSBpdCdzIGZhaWxp
bmcgYXQgYW4gbW0gcGF0Y2ggKG1tOiBpbnRyb2R1Y2UKPiA+IEFTX05PX0RJUkVDVF9NQVApLgo+
Cj4gSSdsbCByZWJhc2Ugb250byB2Ny4xLXJjMSBhbmQgcmVzb2x2ZSB0aGUgY29uZmxpY3RzIGFz
IHBhcnQgb2YgdGhlIHNwbGl0Lgo+Cj4gVGFrYWhpcm8KPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
