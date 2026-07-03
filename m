Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD7DC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JKiuoQiAD0S4Af9lYxC/mAfw21kGGromyDfunQ6xN6g=; b=JYCnP6SS1OfzN/
	/uOylrPjgUizGUAZ9Ifg0HXYTrMhMSma67EFhCi6+1tqek4OuJE1fmmFllOf5jEEL6v9izrepCPst
	Cy925CtgxuWPpnfA3uyBjQBt/+yNQlOU2u5bYSZopqhu8gX4rafUYwvAq/F60BdRuebtrf+MjQXle
	0FyjyBPHCcaakeZXYyi6B9ZZbuhwu1sYYa7C+SClLaOpCT+VZnw1FVSiEJEWNpnHiC2/H9SYjCs8K
	/vFJnwm/UENWAL4BfHXTpICdYqAogtvG/tiPaD9C7pzb80vwCT2wKcx8lImo9gtmJNmcCRsfkNHI3
	4Wr2EGFTj9mqXyNdXRdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcYj-00000006srU-01st;
	Fri, 03 Jul 2026 11:59:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfcYg-00000006sr4-1DSS;
	Fri, 03 Jul 2026 11:59:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AB43D4637;
	Fri,  3 Jul 2026 04:59:42 -0700 (PDT)
Received: from [10.57.81.24] (unknown [10.57.81.24])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 990933F673;
	Fri,  3 Jul 2026 04:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783079987; bh=CtML3PEXn1LHht7AQdQyqLzB0Qb9Ae10yAgK67397Zw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BzvOXcJ33pukFW1hsXEQNbx9QPLsxIFvrmHevHBsOp8nnm06vLzF5mha44X2sHHDU
	 SHr/Zn3XgMMxalHNhRBDOI53sw4fZs97H12agiXgP0ix1sp+Z6e44T3eAOSbucjLm7
	 PcWgBN9O+acHfIv6mNNUdNha0fe7PMafRvzBoqR4=
Message-ID: <fa1f5b39-2703-40a1-81d6-3feba87e19b0@arm.com>
Date: Fri, 3 Jul 2026 13:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to return
 boolean
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Jinjie Ruan <ruanjinjie@huawei.com>,
 oleg@redhat.com, richard.henderson@linaro.org, mattst88@gmail.com,
 linmag7@gmail.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, kees@kernel.org, guoren@kernel.org, chenhuacai@kernel.org,
 kernel@xen0n.name, geert@linux-m68k.org, tsbogend@alpha.franken.de,
 James.Bottomley@hansenpartnership.com, deller@gmx.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, luto@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com,
 chris@zankel.net, jcmvbkbc@gmail.com, peterz@infradead.org,
 wad@chromium.org, thuth@redhat.com, ada.coupriediaz@arm.com,
 linusw@kernel.org, yeoreum.yun@arm.com, song@kernel.org,
 james.morse@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 liqiang01@kylinos.cn, pengcan@kylinos.cn, ryan.roberts@arm.com,
 yangtiezhu@loongson.cn, sshegde@linux.ibm.com, mchauras@linux.ibm.com,
 austin.kim@lge.com, jchrist@linux.ibm.com, arnd@arndb.de,
 thomas.weissschuh@linutronix.de, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, jgross@suse.com, kas@kernel.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com>
 <akdp6GAu77-ipsXA@kunlun.suse.cz> <87cxx4mmim.ffs@fw13>
 <akeIK5TRCjlKbzbp@J2N7QTR9R3> <akeOjqMy7HVgRRCr@kunlun.suse.cz>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <akeOjqMy7HVgRRCr@kunlun.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_045950_490490_0FBEBAFC 
X-CRM114-Status: GOOD (  14.61  )
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

T24gMDMvMDcvMjAyNiAxMjoyNywgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiBPbiBGcmksIEp1
bCAwMywgMjAyNiBhdCAxMTowMDoxMUFNICswMTAwLCBNYXJrIFJ1dGxhbmQgd3JvdGU6Cj4+IE9u
IEZyaSwgSnVsIDAzLCAyMDI2IGF0IDExOjQ4OjQ5QU0gKzAyMDAsIFRob21hcyBHbGVpeG5lciB3
cm90ZToKPj4+IE9uIEZyaSwgSnVsIDAzIDIwMjYgYXQgMDk6NTEsIE1pY2hhbCBTdWNow6FuZWsg
d3JvdGU6Cj4+Pj4gT24gTW9uLCBKdW4gMjksIDIwMjYgYXQgMDk6MDU6NTlQTSArMDgwMCwgSmlu
amllIFJ1YW4gd3JvdGU6Cj4+Pj4+IC0JaWYgKHNlY3VyZV9jb21wdXRpbmcoKSkKPj4+Pj4gKwlp
ZiAoIXNlY3VyZV9jb21wdXRpbmcoKSkKPj4+Pj4gIAkJcmV0dXJuIC0xOwo+Pj4+IEhlbGxvLAo+
Pj4+Cj4+Pj4gSSBhbSBub3QgZm9uZCBvZiB0aGlzIGxvZ2ljIGludmVyc2lvbi4gVGhlIGJvb2xl
YW4gaXMgbWVhbmluZ2xlc3MgaW4KPj4+PiBpdHNlbGYuCj4+Pj4KPj4+PiBQcmV2aW91c2x5IC0x
IHdhcyB1c2VkIHRvIGluZGljYXRlIHRoYXQgdGhlIHN5c2NhbGwgd2FzIGZpbHRlcmVkIGJ1dCB5
b3UKPj4+PiBjaG9zZSB0byBpbnZlcnQgdGhlIGxvZ2ljIGNob29zaW5nIHRydWUgdG8gbWVhbiBz
eXNjYWxsIHdhcyBub3QgZmlsdGVyZWQuCj4+Pj4KPj4+PiBZb3UgY291bGQgY2hvb3NlIHRydWUg
dG8gbWVhbiB0aGF0IHN5c2NhbGwgd2FzIGZpdGVyZWQgYXZvaWRpbmcgdGhpcwo+Pj4+IGludmVy
c2lvbi4KPj4+IFRoYXQncyBqdXN0IHdyb25nLiBCb29sZWFuIGxvZ2ljIG1ha2VzIG1vcmUgc2Vu
c2Ugd2l0aCBoYXZpbmcKPj4+ICghY29uZGl0aW9uKCkpLiBKdXN0IGJlY2F1c2UgdGhlIG9sZCAw
Ly0xIG5vbnNlbnNlIGhhZCBpdCB0aGUgb3RoZXIgd2F5Cj4+PiByb3VuZCBkb2VzIG5vdCBtZWFu
IGl0IGhhcyB0byBzdGF5IHRoYXQgd2F5Lgo+PiAxMDAlIGFncmVlZCEKPj4KPj4gQmlrZXNoZWRk
aW5nIGJlbG93OyBzb3JyeS4KPj4KPj4gSSB0aGluayB0aGUgYmlnZ2VyIHByb2JsZW0gaXMganVz
dCB0aGF0IHNlY3VyZV9jb21wdXRpbmcoKSBpcyBhIHRlcnJpYmxlCj4+IG5hbWUgdGhhdCBkb2Vz
IG5vdCBleHByZXNzIHRoZSBpbnRlbmRlZCBzZW1hbnRpYyAtLSBpdCdzIG5vdCBjbGVhcgo+PiB3
aGV0aGVyICJzZWN1cmUgY29tcHV0aW5nIiBtZWFucyAic2VjY29tcCBwZXJtaXQgdGhlIHN5c2Nh
bGwiIG9yCj4+ICJzZWNjb21wIGlzIGVuYWJsZWQgYW5kIHNvbWUgc3BlY2lhbCBydWxlcyBub3cg
YXBwbHkiIG9yIHNvbWV0aGluZyBlbHNlCj4+IGVudGlyZWx5Lgo+Pgo+PiBJZiB3ZSdyZSBjaGFu
Z2luZyB0aGUgcmV0dXJuIHR5cGUsIGl0IG1pZ2h0IGJlIHdvcnRoIHJlbmFtaW5nIHRoZQo+PiBm
dW5jdGlvbiBzb21ldGhpbmcgbGlrZToKPj4KPj4gCXNlY2NvbXBfcGVybWl0c19zeXNjYWxsKCkK
PiBUaGVuIG5vdCBvbmx5IGl0IGlzIGNsZWFyIHdoaWNoIHdheSB0aGUgYm9vbGVhbiB2YWx1ZSBz
aG91bGQgYmUKPiBpbnRlcnByZXRlZCwgaXQgYWxzbyBwZXJ2ZW50cyB0aGUgYWNjaWRlbnRhbCBp
bnZlcnNpb24gb2YgZXhpc3RpbmcKPiBjYWxscy4gT3ZlcmFsbCBncmVhdC4KClRvdGFsbHkgYWdy
ZWVkLCBpZiB3ZSBoYXZlIHRoZSBvcHBvcnR1bml0eSB0byByZW5hbWUgYSBjb21wbGV0ZWx5CnVu
ZGVzY3JpcHRpdmUgZnVuY3Rpb24gbmFtZSBsaWtlICJzZWN1cmVfY29tcHV0aW5nIiB3ZSBzaG91
bGQgdGFrZSBpdC4KCi0gS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
