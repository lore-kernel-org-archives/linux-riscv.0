Return-Path: <SRS0=N5Fz=EW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10DAC63697
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 22:20:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097B5223BF
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2020 22:20:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3LvNeE4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="uMUcuSmE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097B5223BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZVgVTjUSobjSoo5GiUYRHYDO+anhvJVdognYvYXAokE=; b=i3LvNeE4w9nNNFu1t3CfDnh5z
	fV8GXEdC43GT0H/ONcSkj9w9gE2yWQ0HEfx0mktyqXRaShWs9+ppXJxN73L9ZkJHBL7KRqKWBPwxY
	C9XEwY4azO4GyxKE1D+DT4CvVfmNPI2D34kRIav2NaYwEmEK0n6k8r1kcUyIvqMHOlE6Dz1bXuf2D
	FfBKgICPNrvm0C8Vd1yYA8ppN+Qfyu8jSMQdOA9LwlY9xPFjDBODoIVzL15en5w7n0u0ZHUb4FQwD
	+/V4Hq08vzp/nrVLdmLbStXfRKzb4ZMEVn8xSbvkZB14OJ1ldSQ01ZP4IgeJti4x8W+1FIK9Ewqw+
	cvT0nGViw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kemqw-00080q-KS; Mon, 16 Nov 2020 22:20:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kemqv-000803-7S
 for linux-riscv@merlin.infradead.org; Mon, 16 Nov 2020 22:20:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=rmbEOUuFUDWT2r+1h2dWrIdCOj079NG2OKQi9QhFvjo=; b=uMUcuSmEOxdvWusgeKZNV0Z0f9
 SgXsrlfEMxCC2e6ojKy55SnEgSh+KeEe2wKJYWK/txvvRyur0+leAhE61oRPiAv8tMtf9RZNr4kCK
 DSSEZACpbdMCNOUb/oyxPPec/Ftlc/NDcJPkqhcjxeswUXTplEo7HbObtI9fJse3Gt8LnSQ/qj4uq
 dVxBmL6vfXDhYEAMSmR9Gk5mX9QkiKZorkd7vwX1TrKa9iqN3yGFBHD720f46rNKcpxjJSGH34B4n
 pH3t+rgYArYo8gHcuVGozyscG9Wdik22z1OyfIbOxvJA6vMYA2Fm5O2MgmryMR8Y9msnjcpl/XFse
 VIXva19Q==;
Received: from [2601:1c0:6280:3f0::f32]
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kemqs-0002AK-0r; Mon, 16 Nov 2020 22:19:58 +0000
Subject: Re: [PATCH] compiler.h: Fix barrier_data() on clang
From: Randy Dunlap <rdunlap@infradead.org>
To: Andreas Schwab <schwab@linux-m68k.org>
References: <20201014212631.207844-1-nivedita@alum.mit.edu>
 <87sg999ot0.fsf@igel.home>
 <0dbaca2d-9ad0-8c1a-a280-97be01cac2bd@infradead.org>
 <87k0ul9msr.fsf@igel.home>
 <3fff1eb9-83c0-1c29-6f57-fa50f1ec6ee7@infradead.org>
Message-ID: <3c0a8d26-a95f-a7ca-60ee-203b67d07875@infradead.org>
Date: Mon, 16 Nov 2020 14:19:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3fff1eb9-83c0-1c29-6f57-fa50f1ec6ee7@infradead.org>
Content-Language: en-US
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Arvind Sankar <nivedita@alum.mit.edu>,
 Nathan Chancellor <natechancellor@gmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTEvMTYvMjAgMTE6MjggQU0sIFJhbmR5IER1bmxhcCB3cm90ZToKPiBPbiAxMS8xNi8yMCAx
MDozMCBBTSwgQW5kcmVhcyBTY2h3YWIgd3JvdGU6Cj4+IE9uIE5vdiAxNiAyMDIwLCBSYW5keSBE
dW5sYXAgd3JvdGU6Cj4+Cj4+PiBXaGF0IGtlcm5lbCB2ZXJzaW9uIGFyZSB5b3UgYnVpbGRpbmc/
Cj4+Cj4+IDUuMTAtcmM0Cj4+Cj4+IEFuZHJlYXMuCj4gCj4gT0ssIHRoYW5rcy4KPiAKPiBNeSBi
dWlsZCBtYWNoaW5lIGlzIHNsb3csIGJ1dCBJIGhhdmUgYSBwYXRjaCB0aGF0IEkgYW0gdGVzdGlu
ZzoKPiAKPiAtLS0KPiBGcm9tOiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4K
PiAKPiByaXNjdidzIDx2ZHNvL3Byb2Nlc3Nvci5oPiB1c2VzIGJhcnJpZXIoKSBzbyBpdCBzaG91
bGQKPiAjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4gdG8gcHJldmVudCBidWlsZCBlcnJvcnMuCj4g
Cj4gUmVwb3J0ZWQtYnk6IEFuZHJlYXMgU2Nod2FiIDxzY2h3YWJAbGludXgtbTY4ay5vcmc+Cj4g
LS0tCj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vcHJvY2Vzc29yLmggfMKgwqDCoCAy
ICsrCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gLS0tIGxueC01MTAt
cmM0Lm9yaWcvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZHNvL3Byb2Nlc3Nvci5oCj4gKysrIGxu
eC01MTAtcmM0L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9wcm9jZXNzb3IuaAo+IEBAIC00
LDYgKzQsOCBAQAo+IAo+IMKgI2lmbmRlZiBfX0FTU0VNQkxZX18KPiAKPiArI2luY2x1ZGUgPGFz
bS9iYXJyaWVyLmg+Cj4gKwo+IMKgc3RhdGljIGlubGluZSB2b2lkIGNwdV9yZWxheCh2b2lkKQo+
IMKgewo+IMKgI2lmZGVmIF9fcmlzY3ZfbXVsZGl2CgoKVGhpcyBmaXhlcyB0aGUgZW11bGV4L2Jl
bmV0LyBkcml2ZXIgYnVpbGQuCkknbSBzdGlsbCBidWlsZGluZyBhbGxtb2Rjb25maWcgdG8gc2Vl
IGlmIHRoZXJlIGFyZSBhbnkKb3RoZXIgaXNzdWVzLgoKLS0gCn5SYW5keQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
