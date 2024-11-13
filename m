Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2A7D462C3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Nov 2024 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfqY8rJpkbN4YRmZZ4OrRIkks73306XCqakCEidMs5A=; b=TN2iz7iY94UN/H
	IUeQpFQsIKakhGaVmvo30zrI6RS6PnLWuUxXGQC23Oh3tJ8xkuo9XS5yDbOA/s00pgASy6tDl/0iW
	EyVDH5GkXK6yziqgNql7Gy4VhUm81MRKYCKYb3a3vF7gUO9TLkD4X0nt7jzR2gKTgpmSIIzhqNMu+
	E2Eyyz5fiEapjElM0sbV0MvxojTkf2t9h/emJFD0IFTxj2slgcxbPxEdBSNSfwJ6m0BSj/vLhHd9Q
	cx3tFRtRyO6Wz4nyVMlGMFgIVlyguTdM0/5dlb6rxM8TI/JeQrqbXbrUJg+dPUDp4ELKIIXvpPu+c
	EVGQxcJIlU1VzNMm5+gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFLQ-00000007JL9-0LbQ;
	Wed, 13 Nov 2024 15:31:48 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBFL9-00000007JHn-2vmj
	for linux-riscv@lists.infradead.org;
	Wed, 13 Nov 2024 15:31:35 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731511889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njW3e4/sr8AYqkXvzqK+glp62OVtkPOURqkStAgOtjQ=;
	b=w6rF+o4jQgg041568o9ZMcMLYeSAWwxvBzFLVqxrJTZFZvNTQ+MBzsR6NLfu/Zze/MOaO6
	qD6yiKdzJQQROKyN92flHAe/ycJLWzKFjr/uYwGneVMT99pvYajdAUAdUSWGJsH10p56Q1
	/VUVg1yqiTiSpnqHOUAlnnUrXDiWVOEIwrKPPuHnULhi/PPMcGYy+IEhrG+T+qzF2CsUlv
	V7R2M/sSb9MFXgIfXCOFikby7SI2TW57Le75dnPE68zTfYidgRuKyfOt7qxLI8hcBfB2Fu
	fu4qfF5ylj9naIK57HtJjyHQrBVJABs2SHsBrrx2HCWDgRoYhTTNS2ruhC2eNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731511889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=njW3e4/sr8AYqkXvzqK+glp62OVtkPOURqkStAgOtjQ=;
	b=UVbZIgEQUS/SEuRGDp1iLbyHr4v1jr7KurOynoale65lK8XUgENfNM0rMCmKgSxOTNdMqn
	JWCayrqphnBvLIAA==
To: Chen Wang <unicorn_wang@outlook.com>, Chen Wang <unicornxw@gmail.com>,
 u.kleine-koenig@baylibre.com, aou@eecs.berkeley.edu, arnd@arndb.de,
 conor+dt@kernel.org, guoren@kernel.org, inochiama@outlook.com,
 krzk+dt@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 robh@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
 xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
Subject: Re: [PATCH 2/3] irqchip: Add the Sophgo SG2042 MSI interrupt
 controller
In-Reply-To: <PN1P287MB28185C9DA26A773775BDC4C6FE5A2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
References: <cover.1731296803.git.unicorn_wang@outlook.com>
 <8076fe2af9f2b007a42c986ed193ba50ff674bfa.1731296803.git.unicorn_wang@outlook.com>
 <87cyizmzhf.ffs@tglx>
 <PN1P287MB28185C9DA26A773775BDC4C6FE5A2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
Date: Wed, 13 Nov 2024 16:31:44 +0100
Message-ID: <87v7wrkv4v.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_073131_901724_580956DA 
X-CRM114-Status: GOOD (  12.73  )
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

T24gV2VkLCBOb3YgMTMgMjAyNCBhdCAxNDo0MywgQ2hlbiBXYW5nIHdyb3RlOgo+IE9uIDIwMjQv
MTEvMTMgMTQ6MTQsIFRob21hcyBHbGVpeG5lciB3cm90ZToKPj4+ICsKPj4+ICsJbWlkZGxlX2Rv
bWFpbiA9IGlycV9kb21haW5fY3JlYXRlX2hpZXJhcmNoeShwbGljX2RvbWFpbiwgMCwgcHJpdi0+
bnVtX2lycXMsCj4+PiArCQkJCQkJICAgIGZ3bm9kZSwKPj4+ICsJCQkJCQkgICAgJnBjaF9tc2lf
bWlkZGxlX2RvbWFpbl9vcHMsCj4+PiArCQkJCQkJICAgIHByaXYpOwo+PiBTbyBub3cgeW91IGhh
dmUgY3JlYXRlZCBhIGRvbWFpbi4gSG93IGlzIHRoYXQgc3VwcG9zZWQgdG8gYmUgdXNlZCBieSB0
aGUKPj4gUENJIGxheWVyPwo+Cj4gSGVyZSBJIGNyZWF0ZSB0aGUgZG9tYWluIGFuZCBhdHRhY2hl
ZCBpdCB0byB0aGUgZndub2RlLiBJbiBQQ0kgZHJpdmVyLCAKPiBpdCBjYW4gc2V0IHRoaXMgbXNp
IGNvbnRyb2xsZXIgYXMgaXRzICIiaW50ZXJydXB0LXBhcmVudCIgYW5kIGZpbmQgdGhlIAo+IGRv
bWFpbiBhdHRhY2hlZCBhcyBiZWxvdzoKPgo+IHN0YXRpYyBpbnQgcGNpZV9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+IHsKPiAgwqDCoMKgIHN0cnVjdCBkZXZpY2UgKmRldiA9
ICZwZGV2LT5kZXY7Cj4gIMKgwqDCoCBwYXJlbnRfbm9kZSA9IG9mX2lycV9maW5kX3BhcmVudChk
ZXYtPm9mX25vZGUpOwo+ICDCoMKgwqAgcGFyZW50X2RvbWFpbiA9IGlycV9maW5kX2hvc3QocGFy
ZW50X25vZGUpOwo+ICDCoMKgwqAgLi4uCj4gfQoKSSBhc3N1bWUgeW91IHRoZW4gd2FudCB0byBj
cmVhdGUgYSBnbG9iYWwgUENJL01TSSBkb21haW4gdmlhCnBjaV9tc2lfY3JlYXRlX2lycV9kb21h
aW4oKSwgcmlnaHQ/CgpUaGF0J3Mgbm90IHRoZSBwcmVmZXJyZWQgd2F5IHRvIGRvIHRoYXQuIEFu
eSBuZXcgaW1wbGVtZW50YXRpb24gc2hvdWxkCnVzZSB0aGUgTVNJIHBhcmVudCBtb2RlbCwgd2hl
cmUgZWFjaCBQQ0kgZGV2aWNlIGNyZWF0ZXMgaXQncyBvd24gcGVyCmRldmljZSBNU0kgZG9tYWlu
IHdpdGggdGhlIE1TSSBpbnRlcnJ1cHQgY29udHJvbGxlciBhcyBwYXJlbnQKZG9tYWluLgoKVGhl
cmUgaXMgYSBsaWJyYXJ5IHdpdGggaGVscGVyIGZ1bmN0aW9ucywgaXJxLW1zaS1saWIuW2NoXS4g
U2VlCmdpY3YybV9hbGxvY2F0ZV9kb21haW5zKCkgb3IgcGNoX21zaV9pbml0X2RvbWFpbnMoKSBm
b3IgcmVmZXJlbmNlLgoKVGhhbmtzCgogICAgICAgIHRnbHgKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
