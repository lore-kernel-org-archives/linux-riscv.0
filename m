Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453C2C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 17:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yG6Ejp6VpSwZXXi2xSVezkEd/RILUo/as83R7Yicij8=; b=JG5sgMUS6yhODV
	V6Pz52hFUTaylM0G+naKzys2Mr8Mz4JHDkdHNu+XyDbRnY3lJtGvWrhBBZfZJop0hIflCGtek1JbP
	KDQAgP8CUN4R+iKv7/g3TqapzNI9Jik2jKnugAf0HY5jm/QD3Wb9NdQNa5dgAFPwjGwUcp890tze+
	qLq7jtj9lE0TQFpEDhpukyJiyeNPv1XG0BdPiXG/cbiw7leqYQKu7corxb508cn1zHWvvFspSbLqy
	P9l8KSzkOxeu0J549CuJPyhLc4F1rdJQdIkJef2hniUGyem69TjoQ+EoDIDaqQj0ffDxkgoMV57C+
	MR1DL+jQYeGQjBRWjXQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmImH-00Bx4e-5K; Wed, 04 May 2022 17:27:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmIm5-00Bx1z-Gt; Wed, 04 May 2022 17:26:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E7203B8279D;
 Wed,  4 May 2022 17:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13756C385A4;
 Wed,  4 May 2022 17:26:46 +0000 (UTC)
Date: Wed, 4 May 2022 18:26:43 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Guohanjun <guohanjun@huawei.com>
Subject: Re: [PATCH -next v6 5/6] arm64/mm: Enable
 ARCH_SUPPORTS_PAGE_TABLE_CHECK
Message-ID: <YnK3U3qDhhgwaULb@arm.com>
References: <20220426081036.1374452-1-tongtiangen@huawei.com>
 <20220426081036.1374452-6-tongtiangen@huawei.com>
 <ae74ea7c-9014-b162-f1e7-a66f402aee49@arm.com>
 <80f6c347-db5d-8836-bc79-60c7b2a6eed8@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <80f6c347-db5d-8836-bc79-60c7b2a6eed8@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_102653_739968_5517BA59 
X-CRM114-Status: GOOD (  15.72  )
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

T24gVHVlLCBNYXkgMDMsIDIwMjIgYXQgMDk6MTM6MjBBTSArMDgwMCwgVG9uZyBUaWFuZ2VuIHdy
b3RlOgo+IOWcqCAyMDIyLzQvMjkgMTQ6MTgsIEFuc2h1bWFuIEtoYW5kdWFsIOWGmemBkzoKPiA+
IE9uIDQvMjYvMjIgMTM6NDAsIFRvbmcgVGlhbmdlbiB3cm90ZToKPiA+ID4gQEAgLTg4NCw3ICs5
MjgsMTEgQEAgc3RhdGljIGlubGluZSBwdGVfdCBwdGVwX2dldF9hbmRfY2xlYXIoc3RydWN0IG1t
X3N0cnVjdCAqbW0sCj4gPiA+ICAgc3RhdGljIGlubGluZSBwbWRfdCBwbWRwX2h1Z2VfZ2V0X2Fu
ZF9jbGVhcihzdHJ1Y3QgbW1fc3RydWN0ICptbSwKPiA+ID4gICAJCQkJCSAgICB1bnNpZ25lZCBs
b25nIGFkZHJlc3MsIHBtZF90ICpwbWRwKQo+ID4gPiAgIHsKPiA+ID4gLQlyZXR1cm4gcHRlX3Bt
ZChwdGVwX2dldF9hbmRfY2xlYXIobW0sIGFkZHJlc3MsIChwdGVfdCAqKXBtZHApKTsKPiA+ID4g
KwlwbWRfdCBwbWQgPSBwdGVfcG1kKF9fcHRlKHhjaGdfcmVsYXhlZCgmcHRlX3ZhbCgqKHB0ZV90
ICopcG1kcCksIDApKSk7Cj4gPiAKPiA+IFdoeSB0aGVyZSBpcyBhbnkgY2hhbmdlIGhlcmUgPyBX
aHkgbm90IGp1c3QgdGhlIGZvbGxvd2luZyBpbnN0ZWFkLCBsaWtlIHdoYXQgeW91IGRpZAo+ID4g
aW4gcHRlcF9nZXRfYW5kX2NsZWFyKCkgYWJvdmUuIFRoZSBwYWdlIHRhYmxlIGVudHJ5IHJldHVy
biB2YWx1ZSBoZXJlIGp1c3QgbmVlZHMgdG8KPiA+IGJlIHByZXNlcnZlZCBmb3Igc3Vic2VxdWVu
dCBwYWdlIHRhYmxlIGNoZWNrIGhlbHBlcnMuCj4gPiAKPiA+IAlwbWRfdCBwbWQgPSBwdGVfcG1k
KHB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgYWRkcmVzcywgKHB0ZV90ICopcG1kcCkpOwo+IAo+IFRo
ZSBwdXJwb3NlIG9mIHdoYXQgSSBkbyBoZXJlIGlzIHRvIGF2b2lkIGRvaW5nIHBhZ2VfdGFibGVf
Y2hlY2tfcHRlX2NsZWFyKCkKPiBpbiBwdGVwX2dldF9hbmRfY2xlYXIoKS4gdGhlcmUgaXMgbm8g
ZnVuY3Rpb25hbCBjaGFuZ2UgaGVyZS4KCkknbSBmaW5lIHdpdGggdXNpbmcgeGNoZyBoZXJlIGJ1
dCBJJ2QgZ28gZm9yIHBtZF92YWwgZGlyZWN0bHksIG5vIG5lZWQKZm9yIGNvbnZlcnNpb24gdG8g
cHRlX3Q6CgoJcG1kX3QgcG1kID0gX19wbWQoeGNoZ19yZWxheGVkKCZwbWRfdmFsKCpwbWRwKSwg
MCkpOwoKLS0gCkNhdGFsaW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
