Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD21AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 10:53:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D12260FE3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 10:53:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5D12260FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEHOqbRi8O8y0lJRtyHDE/jqBD5FPOrMkWZc3gemfAk=; b=OvksRJ3ynbAozW
	XO4TD6ws7SZt3skkhYoT2iHQcNmOzlqyOG+63KpxTjS3N7BSmD6/puMqleH7ZrJuwebgkoC5sh7Xx
	UGCio++gS38FJOHSigkBHva03yanenO2mSvzTgXeoVgBXQUBkWUMwZs+KHzcad0b69WzwLgTyHBgW
	D1TSqGxz2Ir90NEV5+1tAW8tkju67NiIXZt+sq//Ocid6nOM0lgLKEEwDH0kvhp5+crnkZidgYiAT
	ck7iEkjfzTikQxQQ8gfwN97jOx0dAd+p+G1lZFP7v2JAAfmzMzfOCGVCwXALWXidX56g+FZy6nyLt
	25lPn5GbFrnDH0mlKK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOHgI-008yHG-KH; Thu, 09 Sep 2021 10:53:22 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOHgF-008yGH-5S
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 10:53:20 +0000
Received: by mail-oi1-x22a.google.com with SMTP id y128so1950430oie.4
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 03:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fU5ufvRRjTtfwnNvK13MR5zMOLz3I8fk1OzlUMqINLQ=;
 b=svEsGSMujFvTtR4UMtARJNXuZvz+U/550aXRIc+7UMzXzxYASPNNCNz75C6NHgXQGg
 dVJIPTelpAL58scaurL0kBQOQTMznlEy8QRnyHQfYxdvgW794LiM1IeQsfZLCEJ22GDQ
 qeYJDSw9yib0rswsAY4EiMIpR09/rniDzcmwUBU47L1cdLS7q206vZncbq5ddz/unqpR
 JjT6q7GZ3YxYt0F0WB2frZxiJ2+sILr+1ax6Ri2HSHO4/nyZOnqbiOVisCjJQDDu6QAo
 hcv1jpLE7VOWgiP2TLIVuvoIKnrgb/YQjoBfw63Ub7F4cpzR210zw6O/4AgWl9NTv+i7
 YCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fU5ufvRRjTtfwnNvK13MR5zMOLz3I8fk1OzlUMqINLQ=;
 b=mAIv6Kv8K7Ap8IT0PCty37PBq7GpIp6Df694GD7NTqY2+zGle4OKDLfJVCL4JQzoKP
 gXrP592III8cdYNiS5KFZ1hp+1g9ePq/HYbjy2wzNO2MS+dCrvYzL9o7YNa8n0Wn04SY
 9Ftx4gkXSYurPP6jjDvnppVi8mlmkdQWaasAGQb+B4hWNeWwzdB8bZwqQ+/7CbbAUcCq
 nlwcL68jIRye4tu9vFGl3xpfazm2e4guLe+aSqoZzOvhGfelQ3qTWikueSUeFD9MwAL0
 dwOr4UBr7w1Q+hbAVHKnGOP9lDXmdDQq8nl6sYBMai7HywBtnclgDJbIS2PB6M1qrpPJ
 v8Sg==
X-Gm-Message-State: AOAM530mmoruZrGEiWnsfmALfML4JEA/w8CZgQ5Y/sVDM56DpkdeJYsb
 FKZSr8VoBX8Ov2DRelIR4XjOea8eAzGUT7DvY2T+Eg==
X-Google-Smtp-Source: ABdhPJypirAM1jjdo9XWTXuE1r/IYJFmD049z7WphsmfidtaQM2qvedJJrF7FPI9vKRmcHUWVT9heQSyJAVB96uljac=
X-Received: by 2002:a05:6808:21a5:: with SMTP id
 be37mr1443831oib.172.1631184794726; 
 Thu, 09 Sep 2021 03:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210906142615.GA1917503@roeck-us.net>
 <CAHk-=wgjTePY1v_D-jszz4NrpTso0CdvB9PcdroPS=TNU1oZMQ@mail.gmail.com>
 <YTbOs13waorzamZ6@Ryzen-9-3900X.localdomain>
 <CAK8P3a3_Tdc-XVPXrJ69j3S9048uzmVJGrNcvi0T6yr6OrHkPw@mail.gmail.com>
 <YTkjJPCdR1VGaaVm@archlinux-ax161>
 <75a10e8b-9f11-64c4-460b-9f3ac09965e2@roeck-us.net>
 <YTkyIAevt7XOd+8j@elver.google.com> <YTmidYBdchAv/vpS@infradead.org>
In-Reply-To: <YTmidYBdchAv/vpS@infradead.org>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Sep 2021 12:53:03 +0200
Message-ID: <CANpmjNNCVu8uyn=8=5_8rLeKM5t3h7-KzVg1aCJASxF8u_6tEQ@mail.gmail.com>
Subject: Re: [PATCH] Enable '-Werror' by default for all kernel builds
To: Christoph Hellwig <hch@infradead.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Nathan Chancellor <nathan@kernel.org>, 
 Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv@lists.infradead.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, kasan-dev@googlegroups.com, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_035319_267251_28EB3D7E 
X-CRM114-Status: GOOD (  16.78  )
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

T24gVGh1LCA5IFNlcHQgMjAyMSBhdCAwNzo1OSwgQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZy
YWRlYWQub3JnPiB3cm90ZToKPiBPbiBXZWQsIFNlcCAwOCwgMjAyMSBhdCAxMTo1ODo1NlBNICsw
MjAwLCBNYXJjbyBFbHZlciB3cm90ZToKPiA+IEl0J2QgYmUgZ29vZCB0byBhdm9pZC4gSXQgaGFz
IGhlbHBlZCB1bmNvdmVyIGJ1aWxkIGlzc3VlcyB3aXRoIEtBU0FOIGluCj4gPiB0aGUgcGFzdC4g
T3IgYXQgbGVhc3QgbWFrZSBpdCBkZXBlbmRlbnQgb24gdGhlIHByb2JsZW1hdGljIGFyY2hpdGVj
dHVyZS4KPiA+IEZvciBleGFtcGxlIGlmIGFybSBpcyBhIHByb2JsZW0sIHNvbWV0aGluZyBsaWtl
IHRoaXM6Cj4KPiBJJ20gYWxzbyBzZWVpbmcgcXVpdGUgYSBmZXcgc3RhY2sgc2l6ZSB3YXJuaW5n
cyB3aXRoIEtBU0FOIG9uIHg4Nl82NAo+IHdpdGhvdXQgQ09NUElMVF9URVNUIHVzaW5nIGdjYyAx
MC4yLjEgZnJvbSBEZWJpYW4uICBJbiBmYWN0IHRoZXJlIGFyZSBhCj4gZmV3IHdhcm5pbmdzIHdp
dGhvdXQgS0FTQU4sIGJ1dCB3aXRoIEtBU0FOIHRoZXJlIGFyZSBhIGxvdCBtb3JlLgo+IEknbGwg
dHJ5IHRvIGZpbmQgc29tZSB0aW1lIHRvIGRpZyBpbnRvIHRoZW0uCgpSaWdodCwgdGhpcyByZW1p
bmRlZCBtZSB0aGF0IHdlIGFjdHVhbGx5IGF0IGxlYXN0IGRvdWJsZSB0aGUgcmVhbApzdGFjayBz
aXplIGZvciBLQVNBTiBidWlsZHMsIGJlY2F1c2UgaXQgaW5oZXJlbnRseSByZXF1aXJlcyBtb3Jl
IHN0YWNrCnNwYWNlLiBJIHRoaW5rIHdlIG5lZWQgV2ZyYW1lLWxhcmdlci10aGFuIHRvIG1hdGNo
IHRoYXQsIG90aGVyd2lzZQp3ZSdsbCBqdXN0IGtlZXAgaGF2aW5nIHRoaXMgcHJvYmxlbToKCmh0
dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAyMTA5MDkxMDQ5MjUuODA5Njc0LTEtZWx2ZXJAZ29v
Z2xlLmNvbQoKPiBXaGlsZSB3ZSdyZSBhdCBpdCwgd2l0aCAtV2Vycm9yIHNvbWV0aGluZyBsaWtl
IHRoaXMgaXMgcmVhbGx5IGZ1dGlsZToKPgo+IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9vYmplY3QuYzogSW4gZnVuY3Rpb24g4oCYYW1kZ3B1X2JvX3N1cHBvcnRfdXN3Y+KAmToK
PiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmM6NDkzOjI6IHdhcm5p
bmc6ICN3YXJuaW5nCj4gUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklHX1g4Nl9Q
QVQgZm9yIGJldHRlciBwZXJmb3JtYW5jZSB0aGFua3MgdG8gd3JpdGUtY29tYmluaW5nIFstV2Nw
cAo+ICAgNDkzIHwgI3dhcm5pbmcgUGxlYXNlIGVuYWJsZSBDT05GSUdfTVRSUiBhbmQgQ09ORklH
X1g4Nl9QQVQgZm9yIGJldHRlciBwZXJmb3JtYW5jZSBcCj4gICAgICAgfCAgXn5+fn5+fgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
