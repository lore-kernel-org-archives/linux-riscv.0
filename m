Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AEDC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 09:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ae66YwBe9TiAGFmllA8k9+VsBnLnCFqaVtaXrW0PZgU=; b=4apd1LbZ/CmtBv
	B/2ta8ujbdu8YoR9pkZwngeOnHnMn2IpELUSAversqDeQuxQR49zLO2w0tQgiT2bBDt7uJ3SJz31o
	pRypoGYP+GztE0lM/FoWhxQU7eaVDX31MwQxr+bY9NtseErVCYiy6PFL9nEp2C8pqADSTJ5VtZwlU
	iFP/zdsg6WU6mp8wwfDRFIbOaYeaiwbyRh5Zyah3X4jUgRZbyvjA+f1Oit3K1IjCsmW9Vh5wl15xE
	ebiVpqghCJBZ5pHF+sOo++dEKhmiJGOd6IvYZJtR7aGMUTuC6iJ79qoYRsJH59gaxHX19hdGWm9AB
	Q6HIAltVsfTpYQxZn2Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaVz-00000006VpB-3tEZ;
	Fri, 03 Jul 2026 09:48:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaVy-00000006Vox-0zYL;
	Fri, 03 Jul 2026 09:48:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB5A46001A;
	Fri,  3 Jul 2026 09:48:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6F641F000E9;
	Fri,  3 Jul 2026 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072132;
	bh=GU2sQW+BHbRyl8stT+ES8Av3G6KBfsKpnc1VSiXAaH8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kTHi5+aaAp/rX4HTakkhjR3bFvlbbboB2hx19Nen/OQCynsTw3x/WIdUXu+frxwFV
	 89SbG0+Shaxd2FOCH4dmgKGnOQNd95ufhEkEGXGpT/32v4K6RPBMgJaLR03++i0XQv
	 HLnWwMqbhfMA9VGMcYWioEN6EpIjQeekAAIeSA8n3p4PU3sGcDhY+SXTEkDi6qWsvN
	 N6ri66YT0BOjRUFOiXivtMgrlnMXxRLN30aljrlnw5thKW/fQEv2TszzuBrW0Uq2oE
	 Hw8BoXQe/baC4Oi3LETFSwEwu7qrQBQfRHShyZgwSnxBg2nijHTJWdtguxJWbMqGZ5
	 OSuwx+53eId9w==
From: Thomas Gleixner <tglx@kernel.org>
To: Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>, Jinjie Ruan
 <ruanjinjie@huawei.com>
Cc: oleg@redhat.com, richard.henderson@linaro.org, mattst88@gmail.com,
 linmag7@gmail.com, linux@armlinux.org.uk, catalin.marinas@arm.com,
 will@kernel.org, kees@kernel.org, guoren@kernel.org,
 chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org,
 tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com,
 deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, richard@nod.at,
 anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
 luto@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, chris@zankel.net,
 jcmvbkbc@gmail.com, peterz@infradead.org, wad@chromium.org,
 thuth@redhat.com, mark.rutland@arm.com, ada.coupriediaz@arm.com,
 kevin.brodsky@arm.com, linusw@kernel.org, yeoreum.yun@arm.com,
 song@kernel.org, james.morse@arm.com, anshuman.khandual@arm.com,
 broonie@kernel.org, liqiang01@kylinos.cn, pengcan@kylinos.cn,
 ryan.roberts@arm.com, yangtiezhu@loongson.cn, sshegde@linux.ibm.com,
 mchauras@linux.ibm.com, austin.kim@lge.com, jchrist@linux.ibm.com,
 arnd@arndb.de, thomas.weissschuh@linutronix.de, sohil.mehta@intel.com,
 andrew.cooper3@citrix.com, jgross@suse.com, kas@kernel.org,
 x86@kernel.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to
 return boolean
In-Reply-To: <akdp6GAu77-ipsXA@kunlun.suse.cz>
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com>
 <akdp6GAu77-ipsXA@kunlun.suse.cz>
Date: Fri, 03 Jul 2026 11:48:49 +0200
Message-ID: <87cxx4mmim.ffs@fw13>
MIME-Version: 1.0
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

T24gRnJpLCBKdWwgMDMgMjAyNiBhdCAwOTo1MSwgTWljaGFsIFN1Y2jDoW5layB3cm90ZToKPiBP
biBNb24sIEp1biAyOSwgMjAyNiBhdCAwOTowNTo1OVBNICswODAwLCBKaW5qaWUgUnVhbiB3cm90
ZToKPj4gLQlpZiAoc2VjdXJlX2NvbXB1dGluZygpKQo+PiArCWlmICghc2VjdXJlX2NvbXB1dGlu
ZygpKQo+PiAgCQlyZXR1cm4gLTE7Cj4KPiBIZWxsbywKPgo+IEkgYW0gbm90IGZvbmQgb2YgdGhp
cyBsb2dpYyBpbnZlcnNpb24uIFRoZSBib29sZWFuIGlzIG1lYW5pbmdsZXNzIGluCj4gaXRzZWxm
Lgo+Cj4gUHJldmlvdXNseSAtMSB3YXMgdXNlZCB0byBpbmRpY2F0ZSB0aGF0IHRoZSBzeXNjYWxs
IHdhcyBmaWx0ZXJlZCBidXQgeW91Cj4gY2hvc2UgdG8gaW52ZXJ0IHRoZSBsb2dpYyBjaG9vc2lu
ZyB0cnVlIHRvIG1lYW4gc3lzY2FsbCB3YXMgbm90IGZpbHRlcmVkLgo+Cj4gWW91IGNvdWxkIGNo
b29zZSB0cnVlIHRvIG1lYW4gdGhhdCBzeXNjYWxsIHdhcyBmaXRlcmVkIGF2b2lkaW5nIHRoaXMK
PiBpbnZlcnNpb24uCgpUaGF0J3MganVzdCB3cm9uZy4gQm9vbGVhbiBsb2dpYyBtYWtlcyBtb3Jl
IHNlbnNlIHdpdGggaGF2aW5nCighY29uZGl0aW9uKCkpLiBKdXN0IGJlY2F1c2UgdGhlIG9sZCAw
Ly0xIG5vbnNlbnNlIGhhZCBpdCB0aGUgb3RoZXIgd2F5CnJvdW5kIGRvZXMgbm90IG1lYW4gaXQg
aGFzIHRvIHN0YXkgdGhhdCB3YXkuCgo+IFNhc2hpa28gcG9pbnRzIG91dCBzb21lIHBsYWNlcyBp
biBleGlzdGluZyBjb2RlIHdoZXJlIGl0IHN1cHBvc2VkbHkKPiBleHBsb2RlcyB3aGljaCBtaWdo
dCBvciBtaWdodCBub3QgYmUgdHJ1ZQoKVGhlIHZzeXNjYWxsIG9uZSBpcyBjb3JyZWN0LCBidXQg
dGhhdCdzIGEgYnVnIGxpa2UgYW55IG90aGVyIG9uZSBhbmQgc2hvdWxkCmJlIGNhdWdodCBpbiBy
ZXZpZXcuCgpUaGUgYmx1cmIgYWJvdXQgYnlwYXNzIGlzIEFJIGhhbGx1emluYXRpb24gbm9uc2Vu
c2UuCgo+IGJ1dCBhbnkgaW4tZmxpZ2h0IHBhdGNoZXMgdGhhdCB1c2Ugc2VjdXJlX2NvbXB1dGlu
ZyB3b3VsZCBhbHNvIGJlCj4gYWZmZWN0ZWQuCgpNYWludGFpbmVycyBrbm93IGhvdyB0byBkZWFs
IHdpdGggY29sbGlzaW9ucyBvZiB0aGF0IGtpbmQuIFN0b3AgbWFraW5nCnByb2JsZW1zIHVwLgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
