Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BBFCA0EC7
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 01:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfWUwM+l9xjqUsCtTCBdZ3jm2st4XahPd0pv7tR4tyo=; b=4Xlu/c78igdMrQ
	MhchrRefPeL1uOkSbdH522DiEstvkRtCp33MXOKhayETbbnUOSnbZQq/G9kAvnZ2MIXR3e7sdIRf1
	K1tPxW/XlQhHwyxSncoqx8gGNHSEZlHYb+D4jkEtoMKv1wWjzH0yrOMmNYGA5drQXxcFFGMe4YZXI
	rUgT5CJpZaSWiIuvfsyTQQ1XRfsVdhhHBMZa6Hcp5DrO/JIg/KEapOtUqeU4Ax7pG4C2lWNRtmlSK
	dQIzkF7ivEstgNai54SoR5HqONboMUnvpN3cqAcol6qID9cn5YdAXchnp0x3VHIPW2b1aRpWH664w
	l16K6XsJOf9hmZBdDyUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrrf-001i7z-2y;
	Tue, 12 Sep 2023 01:06:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrrc-001i78-1s
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 01:06:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 75705CE19FA
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92BCC4AF1E
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694480802;
	bh=l4+CNsWaJdhkXR0vkKkAiHJ2iQogyvfkUk7FzvHK3AU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rDRIA4d6KAD5REBFXHv8wxLdpkWXtR/ABreMbVOKR1Z842Q1IY2CrC1HXeIj0ZugJ
	 EXDPGPvX9IibEzN74L3a7ldtnF3uqIFhLY7YoHImX5G41brZSb+8Ej/ioxIieDNPE7
	 EOSb67RxTTZtlrcliGrquXC8rYsE5WpXHQev4fbvySjhS/6HhV5WZ/4mm+aJUgLxW3
	 QXsM2P+8thLUgQT6KsFyjlf/KYxk4TUJYoBN4JMhyT9/CdlMi+EYcYEe0apCG2FJGs
	 1kQYlRKXTPINHgKX2v2fYG7Fa+vLY2ZFsBH1NySCgMULXNb6V3rjSA3wobObxXvv4X
	 meLNkytj/8PFw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-99de884ad25so662306466b.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 18:06:42 -0700 (PDT)
X-Gm-Message-State: AOJu0Yylz9cgHARYi7q4xsQkJiXtz0B9iv0K7dUWTHffS91iWwBqnVgf
	S8Cj0cwPAooSAWzX0dReU7je9zgm2+QiVSATSYM=
X-Google-Smtp-Source: AGHT+IH4FhF/kTxPNgAVFbni63ODW/AwqSUOKFR7sTv2qzDRT5kLd8ExzVW67eg6HZD7guqGdyMOiuukWtzDSS5Upc0=
X-Received: by 2002:a17:907:2c67:b0:99d:e617:abeb with SMTP id
 ib7-20020a1709072c6700b0099de617abebmr8061187ejc.23.1694480801055; Mon, 11
 Sep 2023 18:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-8-guoren@kernel.org>
 <11f2a7a5-5219-a46e-5d16-4bdd400f5d9b@redhat.com>
In-Reply-To: <11f2a7a5-5219-a46e-5d16-4bdd400f5d9b@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Sep 2023 09:06:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTFhcwprGoBvrS7bw1pBUWSPPZxsujjpgheQ4L80wBnXg@mail.gmail.com>
Message-ID: <CAJF2gTTFhcwprGoBvrS7bw1pBUWSPPZxsujjpgheQ4L80wBnXg@mail.gmail.com>
Subject: Re: [PATCH V11 07/17] riscv: qspinlock: Introduce qspinlock param for
 command line
To: Waiman Long <longman@redhat.com>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org, 
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com, boqun.feng@gmail.com, 
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org, 
	rdunlap@infradead.org, catalin.marinas@arm.com, conor.dooley@microchip.com, 
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com, alexghiti@rivosinc.com, 
	keescook@chromium.org, greentime.hu@sifive.com, ajones@ventanamicro.com, 
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn, 
	leobras@redhat.com, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org, 
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_180648_995568_F6C35D1D 
X-CRM114-Status: GOOD (  18.92  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMTE6MjLigK9QTSBXYWltYW4gTG9uZyA8bG9uZ21hbkBy
ZWRoYXQuY29tPiB3cm90ZToKPgo+IE9uIDkvMTAvMjMgMDQ6MjksIGd1b3JlbkBrZXJuZWwub3Jn
IHdyb3RlOgo+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4K
PiA+IEFsbG93IGNtZGxpbmUgdG8gZm9yY2UgdGhlIGtlcm5lbCB0byB1c2UgcXVldWVkX3NwaW5s
b2NrIHdoZW4KPiA+IENPTkZJR19SSVNDVl9DT01CT19TUElOTE9DS1M9eS4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+IC0tLQo+ID4gICBEb2N1bWVu
dGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCB8ICAyICsrCj4gPiAgIGFy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTYgKysrKysr
KysrKysrKysrLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9r
ZXJuZWwtcGFyYW1ldGVycy50eHQgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1w
YXJhbWV0ZXJzLnR4dAo+ID4gaW5kZXggN2RmYjU0MGM0ZjZjLi42MWNhY2I4ZGZkMGUgMTAwNjQ0
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4
dAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50
eHQKPiA+IEBAIC00NjkzLDYgKzQ2OTMsOCBAQAo+ID4gICAgICAgICAgICAgICAgICAgICAgIFtL
TkxdIE51bWJlciBvZiBsZWdhY3kgcHR5J3MuIE92ZXJ3cml0ZXMgY29tcGlsZWQtaW4KPiA+ICAg
ICAgICAgICAgICAgICAgICAgICBkZWZhdWx0IG51bWJlci4KPiA+Cj4gPiArICAgICBxc3Bpbmxv
Y2sgICAgICAgW1JJU0NWXSBGb3JjZSB0byB1c2UgcXNwaW5sb2NrIG9yIGF1dG8tZGV0ZWN0IHNw
aW5sb2NrLgo+ID4gKwo+ID4gICAgICAgcXNwaW5sb2NrLm51bWFfc3BpbmxvY2tfdGhyZXNob2xk
X25zPSAgIFtOVU1BLCBQVl9PUFNdCj4gPiAgICAgICAgICAgICAgICAgICAgICAgU2V0IHRoZSB0
aW1lIHRocmVzaG9sZCBpbiBuYW5vc2Vjb25kcyBmb3IgdGhlCj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgbnVtYmVyIG9mIGludHJhLW5vZGUgbG9jayBoYW5kLW9mZnMgYmVmb3JlIHRoZQo+Cj4g
WW91ciBwYXRjaCBzZXJpZXMgaXMgc3RpbGwgYmFzZWQgb24gdG9wIG9mIG51bWEtYXdhcmUgcXNw
aW5sb2NrIHBhdGNoc2V0Cj4gd2hpY2ggaXNuJ3QgdXBzdHJlYW0geWV0LiBQbGVhc2UgcmViYXNl
IGl0IHdpdGhvdXQgdGhhdCBhcyB0aGF0IHdpbGwKPiBjYXVzZSBtZXJnZSBjb25mbGljdCBkdXJp
bmcgdXBzdHJlYW0gbWVyZ2UuCk9rYXksIHRoeCBmb3IgcG9pbnRpbmcgaXQgb3V0LgoKPgo+IENo
ZWVycywKPiBMb25nbWFuCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
