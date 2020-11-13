Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A35BC388F9
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:30:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE0B20B80
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 06:30:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0XL59n+A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE0B20B80
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nvnIECeYpDJTDshvOavl7NFmKZ7QldCtvCCYra0GJDo=; b=0XL59n+AhBmYr4dhuvT0A5V/w
	SXmy2JoDsHgGLFUSCVMBKceCVqI2jEqwIslbceox4o3TDbvy0WMYx12bG/xEtQ+CS0Zszs6bp2kal
	wqe/G2dRRXm9Dam/AEsQxJ5/VbzTjzdVykIoZojWiCaq4EGSh28N3zwNyltvuiRXuw33WZYx4B9Cc
	2+tDDMVkfBwwNl6obcmM+xgrREMT2Ws1n4vif7AiiEriUTrWipGcchNssMiR5JxtATrNd6fGD2mtY
	TlkNEevkNXb6ytgQnu3oTGO4PU3o52w8XE3L8u92/XnbP97tqwe3wTT3tApukL8ccqUv25YOrvJ72
	uarsGNFIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdSau-0000Lx-Ac; Fri, 13 Nov 2020 06:30:00 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdSar-0000LY-2k
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 06:29:58 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 0AD6TWSx091643; Fri, 13 Nov 2020 08:29:32 +0200 (EET)
X-AuditID: 8b5b014d-aadff7000000259a-e5-5fae27c7beed
Received: from enigma.ics.forth.gr (enigma-2.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 02.51.09626.7C72EAF5; Fri, 13 Nov 2020 08:29:27 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Fri, 13 Nov 2020 08:29:26 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Drew Fustini <pdp7pdp7@gmail.com>
Subject: Re: Status for RISC-V Summit
Organization: FORTH
In-Reply-To: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
References: <CAEf4M_AUtGb3NXb+hh6CuY0_y26VF+bkVeZHbcBCbrA+HKRj_Q@mail.gmail.com>
Message-ID: <78887a31983b1d7324cb5d934dabfc3a@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.9
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsXSHT1dWfe4+rp4g6Y+GYtnd76yWrR8eMdq
 0XHOzeJP2wZGiz+321gttn1uYbM4PKmDxYHd41rHRhaPqb/PsHjcOzGN1WPnrLvsHov3vGTy
 2LykPoAtissmJTUnsyy1SN8ugStj8f3UgsWcFW1/rjE2MO5g72Lk4JAQMJFoXCDbxcjFISRw
 jFFi58rLTF2MnEBxU4nZezsZQWxeAUGJkzOfsIDYzAIWElOv7GeEsOUlmrfOZgaxWQRUJZbd
 mg5WwyagKTH/0kEWkPkiQPGLPzxB5jMLTGaSuPmjkQ2kRhgofn3aZbA5/ALCEp/uXmQFsTkF
 AiWmtHaA1QgJBEgsONLGBDKHV8BFonVSGMRpKhIffj9gB7FFBZQlbh5+zj6BUXAWkktnIbl0
 FpJLFzAyr2IUSCwz1stMLtZLyy8qydBLL9rECA56Rt8djLc3v9U7xMjEwXiIUYKDWUmEV9lh
 TbwQb0piZVVqUX58UWlOavEhRmkOFiVxXl69CfFCAumJJanZqakFqUUwWSYOTqkGpq1TH9j1
 y5tPynHZcrrrxeLDPUHfGS+lHa6fvGb7RAbbybtXi/ove/f0w5KnTb0Gq4tWuqSsaOUJv7+O
 5/oylYzTmcd4D11Jkbr0mm3F6aTPnO/O3hJcm2x3tCajb+ePKb5hAXNW/Ix1UpzcejyT7YyK
 d4+jr0zrty+5xzUn3XKKO7XmQH7ktiutfjwy5sK2klW/X39h2C7X8XihOOsZoR8/p90Xvri5
 YLrdmczTQmmPY97J3vj5WMT0buuTvKIjqd2mVnOXZrsdONnxQNdoumy3D+/l3y9zvX/tEnL4
 v4HJ7sMptXXC59w+cb2seqHo19j7/E9dSAdDmPPT5D1TfqdPOnc44Zv5AhF92b8//aWVWIoz
 Eg21mIuKEwFQYIwF6QIAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_012957_426779_DFE4EFA8 
X-CRM114-Status: GOOD (  12.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: alex@ghiti.fr, David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 linux-riscv@lists.infradead.org,
 =?UTF-8?Q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn.topel@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

zqPPhM65z4IgMjAyMC0xMS0xMiAxNDo0OCwgRHJldyBGdXN0aW5pIM6tzrPPgc6xz4jOtToKPiBI
ZWxsbywgSSBhbSB1cGRhdGluZyBteSBFbWJlZGRlZCBMaW51eCBDb25mZXJlbmNlIHRhbGsgYWJv
dXQgTGludXggb24KPiBSSVNDLVYgZm9yIHRoZSBSSVNDLVYgU3VtbWl0IGluIERlY2VtYmVyIFsx
XS4gIEkgd2FudCB0byBoYXZlIGEgc2xpZGUKPiBvciB0d28gdGhhdCBjYXB0dXJlcyB0aGUgcmVj
ZW50IGFjY29tcGxpc2htZW50cyBmb3IgUklTQy1WIExpbnV4Cj4gc3VwcG9ydCBhbmQgd2hhdCBp
cyBvbiB0aGUgaG9yaXpvbi4KPiAKPiBJIGN1cnJlbnQgaGF2ZSBsaXN0ZWQgYXMgcmVjZW50IGFu
ZCBvbmdvaW5nIHdvcms6Cj4gCj4gLSBLVk0gKEFudXAgUGF0ZWwvQXRpc2ggUGF0cmEpCj4gICBb
d2FpdGluZyBvbiByYXRpZmljYXRpb24gb2YgSHlwZXJ2aXNvciBzcGVjXQo+IC0gZUJQRiBKSVQg
KEJqw7ZybiBUw7ZwZWwpCj4gLSAgS0dEQiBzdXBwb3J0IChWaW5jZW50IENoZW4pCj4gLSAga2V4
ZWMva2R1bXAgc3VwcG9ydCAoTmljayBLb3NzaWZpZGlzKQo+IC0ga3Byb2Jlcy9rcmV0cHJvYmVz
IChHdW8gUmVuKQo+IC0gZ2VuZXJpYyB2RFNPIHN1cHBvcnQKPiAtIHN5c3pjYWxsZXIgc3VwcG9y
dAo+IC0gYnVpbGQgd2l0aCBMTFZNL2NsYW5nCj4gCj4gSSB3b3VsZCByZWFsbHkgYXBwcmVjaWF0
ZSBhbnkgZmVlZGJhY2sgb24gd2hhdCBJIHNob3VsZCBhZGQsIG1vZGlmeSBvciAKPiByZW1vdmUu
Cj4gCj4gVGhhbmsgeW91LAo+IERyZXcKPiAKCk5pY2Ugd29yayBEcmV3LCB2ZXJ5IHVzZWZ1bCBw
cmVzZW50YXRpb24gIQoKVGhlcmUgaXMgYWxzbyBBbGV4IEdoaXRpJ3Mgd29yayBvbiBzdjQ4IGFu
ZCByZWxvY2F0YWJsZSBrZXJuZWw6Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVj
dC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9Mjk5MTk3Cmh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5l
bC5vcmcvcHJvamVjdC9saW51eC1yaXNjdi9saXN0Lz9zZXJpZXM9Mjk3NTI1CgpJIGRvbid0IGtu
b3cgaWYgdGhhdCdzIHN0aWxsIGFjdGl2ZSB0aG91Z2ggYW5kIHdoYXQncyB0aGUgcGxhbiBmb3Ig
Cm1vdmluZyBmb3J3YXJkLCBtYXliZSBBbGV4IChjY2VkKSBjYW4gdGVsbCB1cyBtb3JlLgoKUmVn
YXJkcywKTmljawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
