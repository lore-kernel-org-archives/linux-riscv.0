Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D52DC88E4A
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 01:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A1dGHHo/WPywQ4O3ziQg5oFOVUubgsgL7Qy0Lnpuq2M=; b=JtzI7r8bnPWWaN
	e4Wm+bW25McqWbbowajskAUFt/SiMzCMJ14ji59fI4VW0e00gAdvzQa5sWQBqUPHzCxfIa/McLH2q
	V4pauKVedxaVCzMzaqos30cN5UsXBGiU4r0GdBXRPXbwQT/SZV+/ygLUkXZ9n3RlAX7Zze3we5ose
	3Wu1muCG4Xtq9FesGyuVPNvroAG5ivn6XLXec/LvOfB80p6+IV0SBHlMJ/6/5Rgi6dyc0bTPBfNL1
	xM3e4AnPon3LSqiD1otH8Ppp0K0YsKcs9ebTKi0KRVB0OYZq1H/UyHAGLzUW+I+6sE5dXg62Ss9uI
	fY2wZhpfPnWGwkugzwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ptP-0000000Fep0-1D60;
	Fri, 11 Sep 2026 01:17:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ptN-0000000Feoi-2sA9
	for linux-riscv@lists.infradead.org;
	Fri, 11 Sep 2026 01:17:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C284760202
	for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 01:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B0E1F00899
	for <linux-riscv@lists.infradead.org>; Fri, 11 Sep 2026 01:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789089444;
	bh=Xv9GpbZlpWhE33nw9eA7g+SjunCSHBMphq38hiDBlI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W/FibB5hHJItumDLADY5HYrtNRtC5anZrg5j1iHL45UYk27tPHBDjwHqbl66oqWA3
	 y5b6V6wdLMnbSGk6QhijIQb+OUeGOmVPz1f79LvPa3TdIKkTv2FtrX2ZACR+3ECmef
	 9bMYDeAPaN4meaz0dWtalO/8o3wanprT9+tnqH5RhPgClWSsLKJQtkelC7QCSyJiL7
	 oMIw8Jv/wX/6g9DqheQ/TxNAutG+cYZD8BH2pGS0Eipf7wSLezRcZnEVPH0D8MNTm8
	 9NNKErbVu9Wi51Gk1MoywqbV+zEs9zRobZ4w1dx+vqkgnwZYiBS8moBQY4/R87TF+f
	 zBAzFNO7H4iyg==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so144303f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 18:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwLC+0cIyqb7c8QEJ7DJmIL3MB3zLClmp53a+yZcRmmqFWRg8x/JWtwVfnblPY9MtkZssmX0h/B1XCvkA==@lists.infradead.org
X-Gm-Message-State: AFuF++klZ6w6UpUv1pXDXfPpj4qymcmdZh9mnyi9zCH6W1TkNiR9Whrd
	WBT5odnyIMw/ZKarFdPz7xx0+qHtvUOgurQI/matNvbl8fntPX1LLOpIFC1WjocI3sglamKBw9u
	wKASRniFzFz0SGbG1MXlJAwrfZUMGlMw=
X-Received: by 2002:a05:6000:4025:b0:486:e722:f3c1 with SMTP id
 ffacd0b85a97d-486eb1d9c2amr1978549f8f.7.1789089443089; Thu, 10 Sep 2026
 18:17:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260816070049.2097442-1-guoren@kernel.org> <20260816070049.2097442-2-guoren@kernel.org>
 <20260908222349.GA2324870@ax162>
In-Reply-To: <20260908222349.GA2324870@ax162>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 11 Sep 2026 09:17:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
X-Gm-Features: AcwNN1Upj2AoY0n4XssnGeZ1WdH62C0SXBhl1o0STuofx36PhU_vqnBmvqbC1gI
Message-ID: <CAJF2gTRYaiskhtZckt9ccRqv7an+OBKE34N=0uR3uKW9F8r6kA@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: smp: Move enum ipi_message_type to asm/smp.h
To: Nathan Chancellor <nathan@kernel.org>
Cc: tglx@kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, palmer@dabbelt.com, pjw@kernel.org, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, daniel.lezcano@kernel.org, 
	anup@brainfault.org, hui.wang@canonical.com, samuel.holland@sifive.com
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

T24gV2VkLCBTZXAgOSwgMjAyNiBhdCA2OjIz4oCvQU0gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhh
bkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgQXVnIDE2LCAyMDI2IGF0IDA3OjAwOjQ1
QU0gKzAwMDAsIEd1byBSZW4gd3JvdGU6Cj4gPiBGcm9tOiAiR1VPIFJlbiAoWHVhblRpZSkiIDxn
dW9yZW5Aa2VybmVsLm9yZz4KPiA+Cj4gPiBUaGUgSVBJIG1lc3NhZ2UgdHlwZSBlbnVtZXJhdGlv
biAoYW5kIHRoZXJlZm9yZSBJUElfTUFYKSBpcyBjdXJyZW50bHkKPiA+IHByaXZhdGUgdG8gYXJj
aC9yaXNjdi9rZXJuZWwvc21wLmMuICBTZXZlcmFsIElQSSBwcm92aWRlcnMgbmVlZCB0byBrbm93
Cj4gPiB0aGUgZXhhY3QgbnVtYmVyIG9mIElQSXMgdGhhdCB0aGUgYXJjaGl0ZWN0dXJlIHJlcXVp
cmVzLCBzbyBtb3ZlIHRoZQo+ID4gZW51bSBpbnRvIHRoZSBwdWJsaWMgaGVhZGVyLgo+ID4KPiA+
IFRoaXMgaXMgYSBwdXJlIGNvZGUgbW92ZW1lbnQgd2l0aCBubyBmdW5jdGlvbmFsIGNoYW5nZS4K
Pgo+IE90aGVyIHRoYW4gYSBidWlsZCBicmVha2FnZSB3aXRoIGFsbG1vZGNvbmZpZyA6KSAtbmV4
dCBoYXMgdGhpcyBjaGFuZ2UKPiBhcyBjb21taXQgMWFlOTFkYzM5N2ViICgicmlzY3Y6IHNtcDog
TW92ZSBlbnVtIGlwaV9tZXNzYWdlX3R5cGUgdG8KPiBhc20vc21wLmgiKSwgd2hlcmUgaXQgYnJl
YWtzIGFsbG1vZGNvbmZpZyB3aXRoIHNldmVyYWwgZXJyb3JzIGFsb25nIHRoZQo+IGxpbmVzIG9m
Ogo+Cj4gICBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tZWRp
YXRlay9tZHAvbXRrX21kcF9tMm0uYzoyMDoKPiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbWVk
aWF0ZWsvdnB1L210a192cHUuaDo2Mzo5OiBlcnJvcjogcmVkZWNsYXJhdGlvbiBvZiBlbnVtZXJh
dG9yICdJUElfTUFYJwo+ICAgICAgNjMgfCAgICAgICAgIElQSV9NQVgsCj4gICAgICAgICB8ICAg
ICAgICAgXn5+fn5+fgo+ICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvbGludXgvc21w
Lmg6MTE5LAo+ICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvaW50ZXJydXB0
X3JjLmg6MTcsCj4gICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9zcGlubG9j
ay5oOjYwLAo+ICAgICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvc2NoZWQuaDoz
OCwKPiAgICAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3JhdGVsaW1pdC5oOjYs
Cj4gICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9kZXZfcHJpbnRrLmg6MTYs
Cj4gICAgICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9kZXZpY2UuaDoxNSwKPiAg
ICAgICAgICAgICAgICAgICAgZnJvbSBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL21lZGlhdGVrL21k
cC9tdGtfbWRwX20ybS5jOjg6Cj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NtcC5oOjI3Ojk6
IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ0lQSV9NQVgnIHdpdGggdHlwZSAnZW51bSBp
cGlfbWVzc2FnZV90eXBlJwo+ICAgICAgMjcgfCAgICAgICAgIElQSV9NQVgKPiAgICAgICAgIHwg
ICAgICAgICBefn5+fn5+Cj4KPiBTbyBvbmUgb2YgdGhlc2UgbmVlZHMgdG8gY2hhbmdlLgoKSSBw
cmVmZXIgdG8ga2VlcCBJUElfTUFYIGZvciBTTVAgYW5kIHJlbmFtZSBJUElfTUFYIGluIG10a192
cHUuaCB0bwpWUFVfSVBJX01BWCwgY29uc2lzdGVudCB3aXRoIFNDUF9JUElfTUFYIGluIG10a19z
Y3AuaC4KClRoeCBmb3IgcG9pbnQgaXQgb3V0CgotLQpCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
