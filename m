Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEFCC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 10:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+0JlM8E7+Li/HSKtNjXxNwy+57Lpa//7sPs0+eW61IM=; b=ySBmPvp1sS4uX2
	jNWs9nZjAcDPC8QeofjrzXWMtSjnvyKk6PCHrYWwjpK6rb2a84lf16odOgyGk+aw3868d7C8mhza8
	QQ1WaQWYYWHUyA1pvqXVdDgkBxs4wKk6tu2jDbYnn2yeb7rS7vDW9M+Td5I0gLYhZqWBaiEMERLsH
	Py53Y8FISlMCFRO81nMUHpUqvSebqjbBF3585l+pnXpInQokoGtXlKM2fMiCUXlDHXMvyr48a/mtW
	tgvLkcSn/cZK2HMt5Nbb6D7nBfcxxlb2lrKitNgtrI9jGtxSFVTmmGn+5awROVG3KLVKbphofUbJ9
	kqz1hi2N3tQGblvRdYqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfahE-00000006X0J-01sr;
	Fri, 03 Jul 2026 10:00:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfahB-00000006Wzb-2Dsh;
	Fri, 03 Jul 2026 10:00:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77B231FC4;
	Fri,  3 Jul 2026 03:00:23 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A98773FAA1;
	Fri,  3 Jul 2026 03:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783072827; bh=aCTCeigzdW+DLmQcURYHBbc2LLCBHkNsbpfYvvGCiJA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S7QhjRah1ACbDsWq1fyjeQXt+EKdqlo9vLYGLe10grZ3du51t6ZFb4OLnHfKmugvC
	 xYIGBaOHJhM7/+St8RX1L1+kEfNfOXq3codPouX1rlw+gMBwRumJ3t0IzbR4AAn6ks
	 AEhSYO6Tc+ug7ijrNB2evf01wmU75WbW8DbnvJvM=
Date: Fri, 3 Jul 2026 11:00:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Michal =?utf-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>,
	Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com,
	richard.henderson@linaro.org, mattst88@gmail.com, linmag7@gmail.com,
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
	kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, geert@linux-m68k.org, tsbogend@alpha.franken.de,
	James.Bottomley@hansenpartnership.com, deller@gmx.de,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ysato@users.sourceforge.jp, dalias@libc.org,
	glaubitz@physik.fu-berlin.de, richard@nod.at,
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
	luto@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, chris@zankel.net,
	jcmvbkbc@gmail.com, peterz@infradead.org, wad@chromium.org,
	thuth@redhat.com, ada.coupriediaz@arm.com, kevin.brodsky@arm.com,
	linusw@kernel.org, yeoreum.yun@arm.com, song@kernel.org,
	james.morse@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
	liqiang01@kylinos.cn, pengcan@kylinos.cn, ryan.roberts@arm.com,
	yangtiezhu@loongson.cn, sshegde@linux.ibm.com,
	mchauras@linux.ibm.com, austin.kim@lge.com, jchrist@linux.ibm.com,
	arnd@arndb.de, thomas.weissschuh@linutronix.de,
	sohil.mehta@intel.com, andrew.cooper3@citrix.com, jgross@suse.com,
	kas@kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, linux-csky@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to
 return boolean
Message-ID: <akeIK5TRCjlKbzbp@J2N7QTR9R3>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com>
 <akdp6GAu77-ipsXA@kunlun.suse.cz>
 <87cxx4mmim.ffs@fw13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87cxx4mmim.ffs@fw13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_030029_649594_75F36FF1 
X-CRM114-Status: GOOD (  19.68  )
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

T24gRnJpLCBKdWwgMDMsIDIwMjYgYXQgMTE6NDg6NDlBTSArMDIwMCwgVGhvbWFzIEdsZWl4bmVy
IHdyb3RlOgo+IE9uIEZyaSwgSnVsIDAzIDIwMjYgYXQgMDk6NTEsIE1pY2hhbCBTdWNow6FuZWsg
d3JvdGU6Cj4gPiBPbiBNb24sIEp1biAyOSwgMjAyNiBhdCAwOTowNTo1OVBNICswODAwLCBKaW5q
aWUgUnVhbiB3cm90ZToKPiA+PiAtCWlmIChzZWN1cmVfY29tcHV0aW5nKCkpCj4gPj4gKwlpZiAo
IXNlY3VyZV9jb21wdXRpbmcoKSkKPiA+PiAgCQlyZXR1cm4gLTE7Cj4gPgo+ID4gSGVsbG8sCj4g
Pgo+ID4gSSBhbSBub3QgZm9uZCBvZiB0aGlzIGxvZ2ljIGludmVyc2lvbi4gVGhlIGJvb2xlYW4g
aXMgbWVhbmluZ2xlc3MgaW4KPiA+IGl0c2VsZi4KPiA+Cj4gPiBQcmV2aW91c2x5IC0xIHdhcyB1
c2VkIHRvIGluZGljYXRlIHRoYXQgdGhlIHN5c2NhbGwgd2FzIGZpbHRlcmVkIGJ1dCB5b3UKPiA+
IGNob3NlIHRvIGludmVydCB0aGUgbG9naWMgY2hvb3NpbmcgdHJ1ZSB0byBtZWFuIHN5c2NhbGwg
d2FzIG5vdCBmaWx0ZXJlZC4KPiA+Cj4gPiBZb3UgY291bGQgY2hvb3NlIHRydWUgdG8gbWVhbiB0
aGF0IHN5c2NhbGwgd2FzIGZpdGVyZWQgYXZvaWRpbmcgdGhpcwo+ID4gaW52ZXJzaW9uLgo+IAo+
IFRoYXQncyBqdXN0IHdyb25nLiBCb29sZWFuIGxvZ2ljIG1ha2VzIG1vcmUgc2Vuc2Ugd2l0aCBo
YXZpbmcKPiAoIWNvbmRpdGlvbigpKS4gSnVzdCBiZWNhdXNlIHRoZSBvbGQgMC8tMSBub25zZW5z
ZSBoYWQgaXQgdGhlIG90aGVyIHdheQo+IHJvdW5kIGRvZXMgbm90IG1lYW4gaXQgaGFzIHRvIHN0
YXkgdGhhdCB3YXkuCgoxMDAlIGFncmVlZCEKCkJpa2VzaGVkZGluZyBiZWxvdzsgc29ycnkuCgpJ
IHRoaW5rIHRoZSBiaWdnZXIgcHJvYmxlbSBpcyBqdXN0IHRoYXQgc2VjdXJlX2NvbXB1dGluZygp
IGlzIGEgdGVycmlibGUKbmFtZSB0aGF0IGRvZXMgbm90IGV4cHJlc3MgdGhlIGludGVuZGVkIHNl
bWFudGljIC0tIGl0J3Mgbm90IGNsZWFyCndoZXRoZXIgInNlY3VyZSBjb21wdXRpbmciIG1lYW5z
ICJzZWNjb21wIHBlcm1pdCB0aGUgc3lzY2FsbCIgb3IKInNlY2NvbXAgaXMgZW5hYmxlZCBhbmQg
c29tZSBzcGVjaWFsIHJ1bGVzIG5vdyBhcHBseSIgb3Igc29tZXRoaW5nIGVsc2UKZW50aXJlbHku
CgpJZiB3ZSdyZSBjaGFuZ2luZyB0aGUgcmV0dXJuIHR5cGUsIGl0IG1pZ2h0IGJlIHdvcnRoIHJl
bmFtaW5nIHRoZQpmdW5jdGlvbiBzb21ldGhpbmcgbGlrZToKCglzZWNjb21wX3Blcm1pdHNfc3lz
Y2FsbCgpCgouLi4gc28gZm9yIHRoZSBjb2RlIHF1b3RlZCBhdCB0aGUgc3RhcnQgb2YgdGhlIG1h
aWwsIHdlJ2QgaGF2ZToKCglpZiAoIXNlY2NvbXBfcGVybWl0c19zeXNjYWxsKCkpCgkJcmV0dXJu
IC0xOwoKLi4uIG9yIGZvciBhcm02NCwgd2hlcmUgd2UgaGF2ZSBOT19TWVNDQUxMOgoKCSBpZiAo
IXNlY2NvbXBfcGVybWl0c19zeXNjYWxsKCkpCgkgCXJldHVybiBOT19TWVNDQUxMLgoKVGhvbWFz
LCBhbnkgdGhvdWdodHMgb24gdGhhdD8KCkl0J3MgYWxzbyBvZGQgdGhhdCBzZWNjb21wIGFxdWly
ZXMgdGhlIHN5c2NhbGwgbnVtYmVyIGl0c2VsZiB2aWEgLCByYXRoZXIKdGhhbiB0aGFuIGJlaW5n
IHBhc3NlZCBkb3duIGV4cGxpY2l0bHkgYnkgdGhlIGFyY2ggY29kZS4gVGhhdCBjb21wbGV0ZWx5
Cm9ic2N1cmVzIHdoYXQgc2VjY29tcCBpcyBkb2luZywgdnMgaGF2aW5nOgoKCWlmICghc2VjY29t
cF9wZXJtaXNfc3lzY2FsbChzeXNjYWxsKSkKCQkuLi4KCi4uLiBidXQgSSBndWVzcyB0aGF0IHNh
dmVzIHNvbWUgZHVwbGljYXRpb24gaW4gdGhlIHB0cmFjZSBjb2RlLgoKTWFyay4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
