Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A88ACA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 01:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9yZl+8TX9FXC93pSVCcaz5fCKrfr4JZrvKMoVKd/Z0=; b=cr0eHwIJQQZ4Ex
	hPhIvpQJ6pgH+97wLu+dE74PXTZcNGcXMOc9GVwsSDkC7YeDwpacLWmUhRxcnEeXloxHhg3w5b2ol
	GsMgxv7R01iewMwQ7WBNGd0r1AgXwrmxYK7RIGdw+9IP/9Uxozb9VktFE+Gd0EUlrRNYYVskDICW2
	q3jtA8Cf/ppuoUcX/nRLOE7qYvdUg4NgIoxF7vO8ALmO7RE0nauabPLCrITk+Xt0VMLpX6c9cBSVR
	Ho8d8ejz81L7IXTMJgfEE3hXGOei405+JD8GhzcvCWl6TvtofsLelb0zZRrIDEp6VJtLLMltr9JbL
	dlCF1UG6XtfZfws1EBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrtg-001iGu-26;
	Tue, 12 Sep 2023 01:08:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfrtd-001iGD-1y
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 01:08:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id EA767CE194D
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82E65C4AF72
	for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 01:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694480928;
	bh=vPBtjeXZPsX8uMaq9qwgKEv+1PCvHrRzIWtKBohUeVk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HV8j/1foh3iKGbddE+oh/8T8Agp46qlTjejJvqAwChtOJSpPVYuFV1tIAkYIVaYUA
	 K4VgsVQPAVuVrQbVcVH0V0nHGhHHEHid4URTR6QIroK4Grv/vZ3pi7ECsy6miD5o/j
	 67sMuCUxb2Zj6K4VKYIMQXxexoSR0LRCxxDoEDxhCJOVeTweA+gdxTzNDod00CWWOi
	 fBS6cM+HGI6TlOc4N6MApsSoe0nAFK8q1+YyipDrraZ/SR3gNGsEB606x9Vx7qtFTt
	 mli0gr9Qci1MvwbF16IdaiVBymPD9QKkT/GPPmJQgALVyypYaYclHn98c9EOYuk9mM
	 h7+2P4jrntJ+A==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9a63b2793ecso642675766b.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 Sep 2023 18:08:48 -0700 (PDT)
X-Gm-Message-State: AOJu0YwQZOVtctCgsKjC1Wc5M45u3Yn2JbVxU41VZWNHwgZlNBjM/MKl
	nKkaIYYFuiu6TraXYj45GSYs7F+xlMBVXGYMGKk=
X-Google-Smtp-Source: AGHT+IGzCHN4mbb9AV6M5P3xYllprNXyZ+f6yZI8Aqw1YDdEyhI15mU09G08slBaULRW+BgPstHqnFZshoO7b1fogcM=
X-Received: by 2002:a17:907:2c77:b0:9a2:185b:5376 with SMTP id
 ib23-20020a1709072c7700b009a2185b5376mr8328061ejc.49.1694480926903; Mon, 11
 Sep 2023 18:08:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230910082911.3378782-1-guoren@kernel.org> <20230910082911.3378782-8-guoren@kernel.org>
 <5ba0b8f3-f8f5-3a25-e9b7-f29a1abe654a@redhat.com>
In-Reply-To: <5ba0b8f3-f8f5-3a25-e9b7-f29a1abe654a@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Sep 2023 09:08:34 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT2hRxgnQt+WJ9P0YBWnUaZJ1-9g3ZE9tOz_MiLSsUjwQ@mail.gmail.com>
Message-ID: <CAJF2gTT2hRxgnQt+WJ9P0YBWnUaZJ1-9g3ZE9tOz_MiLSsUjwQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230911_180853_997144_1DAE4CEE 
X-CRM114-Status: GOOD (  20.64  )
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

T24gTW9uLCBTZXAgMTEsIDIwMjMgYXQgMTE6MzTigK9QTSBXYWltYW4gTG9uZyA8bG9uZ21hbkBy
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
ICAgICAgbnVtYmVyIG9mIGludHJhLW5vZGUgbG9jayBoYW5kLW9mZnMgYmVmb3JlIHRoZQo+ID4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zZXR1cC5jCj4gPiBpbmRleCBhNDQ3Y2YzNjBhMTguLjBmMDg0ZjAzNzY1MSAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3NldHVwLmMKPiA+IEBAIC0yNzAsNiArMjcwLDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBw
YXJzZV9kdGIodm9pZCkKPiA+ICAgfQo+ID4KPiA+ICAgI2lmZGVmIENPTkZJR19SSVNDVl9DT01C
T19TUElOTE9DS1MKPiA+ICtib29sIGVuYWJsZV9xc3BpbmxvY2tfa2V5ID0gZmFsc2U7Cj4KPiBZ
b3UgY2FuIHVzZSBfX3JvX2FmdGVyX2luaXQgcXVhbGlmaWVyIGZvciBlbmFibGVfcXNwaW5sb2Nr
X2tleS4gQlRXLAo+IHRoaXMgaXMgbm90IGEgc3RhdGljIGtleSwganVzdCBhIHNpbXBsZSBmbGFn
LiBTbyB3aGF0IGlzIHRoZSBwb2ludCBvZgo+IHRoZSBfa2V5IHN1ZmZpeD8KT2theSwgSSB3b3Vs
ZCBjaGFuZ2UgaXQgdG86CmJvb2wgZW5hYmxlX3FzcGlubG9ja19mbGFnIF9fcm9fYWZ0ZXJfaW5p
dCA9IGZhbHNlOwoKPgo+IENoZWVycywKPiBMb25nbWFuCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
