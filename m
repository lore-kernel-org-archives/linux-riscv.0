Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEEBCAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 09:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0txyHXREaDxuWTmG5IW50GN2+jkPRj268OpsM4964Ts=; b=a/KZP6pnoeTgJF
	bF44BaRgufENDnPiqBQNVxh9vre54xAccFSG44tAUGUgH6xOIZtidjJ9MzC/wnReSbhqm4C15stuz
	vf/3ODEUnxcVluetqMfHlb3zYzlYWZfL4brS5iOToB0xDcfL3Uy6Ni/OkFFDsYTUbv9BC6n72Peg/
	gWmZSWWuKLJcKK2nMOGTJ99eyhm1TN1Lw5Nh5agAL946+JG1YAIJj0np+5HMwngRRDeuy/hcZsaKt
	n/PLjajIpgktGlqfhrQDkvsvV8RVyKsqndbxW8k5SihSG9nbBUHbm6frPKsC2Q0i8sibK7jov2Ma5
	Wtr/BjiUEFKPiYvXuvuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRwS-00000007Mig-3F0G;
	Tue, 16 Sep 2025 09:25:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRwR-00000007Mi5-1oNi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 09:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A79F160143
	for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 09:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B97C4CEEB
	for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 09:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758014738;
	bh=94nfd9D2/3JrQ92cFxfHxwSHOkP/1U5/RVIAJbOP5v0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DgVimv++zCTtvcsPbf0fL8LD41opT+4QyXK8f1XH3ct+STVNU6Qv1kuo4eYIefhXk
	 sJZa3HnsWVJ3jCL2Ud/3DFeSh4IEC+dUdR3RDXyWpmYVj0e5XSGy3LRdlnJNpDu6JA
	 1qOH9//dIRricRGIu0acwC5+9qmSYnT9IJ5gy8FsJvJa8Dj3zlbWLXvKxSnDpDKQlC
	 TJaCDwolBEufxPZsxOimiKY+qebkg2ioqJ59uvU7mK+kUkZ1knhO9bb+Ek9kbIT+c1
	 B+tRzstMeduDlrF1nykB/sw2eghONbeWEpLLZk2DE5qCULJUKGlKt7UjVomFxj5liL
	 sgPUUaoGhH9Jg==
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3e9c5faa858so2470859f8f.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 02:25:38 -0700 (PDT)
X-Gm-Message-State: AOJu0YwpihDbbV2cV/I9dpZC2nVoa9f/QFLqpqwLvwWvcCB+S6UWQoK9
	FfDNVfCXvL+aVk+P0aTN/pBuFSDvIxW9pC4iRm7PhBnZ3SVlk8qlEB1zk1NVRs5yXPzeHk+NYIc
	DjNQmtUSXcznRVc1vb58cU+SIgs4ULv8=
X-Google-Smtp-Source: AGHT+IFJHiRuQQ163JGnK5u5j/SLTzwdI+SdpUJ+UN87XgMbQzd6zH3QI8OublorMeiT+hg5VU2kmXWaq3EwVJlSQOg=
X-Received: by 2002:a05:6000:e:b0:3e9:9282:cff8 with SMTP id
 ffacd0b85a97d-3e99282d39amr6395145f8f.5.1758014736884; Tue, 16 Sep 2025
 02:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <6191817.lOV4Wx5bFT@fvogt-thinkpad>
In-Reply-To: <6191817.lOV4Wx5bFT@fvogt-thinkpad>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 16 Sep 2025 17:25:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQnkP0noK_s0ho36OdxN4-EOgFyvLeTgA+w+YTwUb2d9g@mail.gmail.com>
X-Gm-Features: AS18NWDYfF6_0jctcxDyY9_0G5irzA_3PV00ZRemrogDa3rebAgcSAfN-qRgBhA
Message-ID: <CAJF2gTQnkP0noK_s0ho36OdxN4-EOgFyvLeTgA+w+YTwUb2d9g@mail.gmail.com>
Subject: Re: [PATCH] riscv: kprobes: Fix probe address validation
To: Fabian Vogt <fvogt@suse.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marvin Friedrich <marvin.friedrich@suse.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
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

T24gV2VkLCBTZXAgMTAsIDIwMjUgYXQgMTE6MjXigK9QTSBGYWJpYW4gVm9ndCA8ZnZvZ3RAc3Vz
ZS5kZT4gd3JvdGU6Cj4KPiBXaGVuIGFkZGluZyBhIGtwcm9iZSBzdWNoIGFzICJwOnByb2JlL3Rj
cF9zZW5kbXNnIF90ZXh0KzE1MzkyMTkyIiwKPiBhcmNoX2NoZWNrX2twcm9iZSB3b3VsZCBzdGFy
dCBpdGVyYXRpbmcgYWxsIGluc3RydWN0aW9ucyBzdGFydGluZyBmcm9tCj4gX3RleHQgdW50aWwg
dGhlIHByb2JlZCBhZGRyZXNzLiBOb3Qgb25seSBpcyB0aGlzIHZlcnkgaW5lZmZpY2llbnQsIGJ1
dAo+IGxpdGVyYWwgdmFsdWVzIGluIHRoZXJlIChlLmcuIGxlZnQgYnkgZnVuY3Rpb24gcGF0Y2hp
bmcpIGFyZQo+IG1pc2ludGVycHJldGVkIGluIGEgd2F5IHRoYXQgY2F1c2VzIGEgZGVzeW5jLgoK
TEdUTSEgVGhpcyBwcmV2ZW50cyBiYWQgcC0+b2Zmc2V0IGZyb20gY2F1c2luZyBwcm9ibGVtcy4K
CkFja2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCj4KPiBGaXggdGhpcyBieSBk
b2luZyBpdCBsaWtlIHg4Njogc3RhcnQgdGhlIGl0ZXJhdGlvbiBhdCB0aGUgY2xvc2VzdAo+IHBy
ZWNlZGluZyBzeW1ib2wgaW5zdGVhZCBvZiB0aGUgZ2l2ZW4gc3RhcnRpbmcgcG9pbnQuCj4KPiBG
aXhlczogODdmNDhjN2NjYzczICgicmlzY3Y6IGtwcm9iZTogRml4dXAga2VybmVsIHBhbmljIHdo
ZW4gcHJvYmluZyBhbiBpbGxlZ2FsIHBvc2l0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBGYWJpYW4g
Vm9ndCA8ZnZvZ3RAc3VzZS5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ2aW4gRnJpZWRyaWNoIDxt
YXJ2aW4uZnJpZWRyaWNoQHN1c2UuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9i
ZXMva3Byb2Jlcy5jIHwgMTMgKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Jlcy9rcHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5j
Cj4gaW5kZXggYzA3MzhkNmM2NDk4Li44NzIzMzkwYzdjYWQgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvcHJvYmVzL2twcm9iZXMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3By
b2Jlcy9rcHJvYmVzLmMKPiBAQCAtNDksMTAgKzQ5LDE1IEBAIHN0YXRpYyB2b2lkIF9fa3Byb2Jl
cyBhcmNoX3NpbXVsYXRlX2luc24oc3RydWN0IGtwcm9iZSAqcCwgc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCj4gICAgICAgICBwb3N0X2twcm9iZV9oYW5kbGVyKHAsIGtjYiwgcmVncyk7Cj4gIH0KPgo+
IC1zdGF0aWMgYm9vbCBfX2twcm9iZXMgYXJjaF9jaGVja19rcHJvYmUoc3RydWN0IGtwcm9iZSAq
cCkKPiArc3RhdGljIGJvb2wgX19rcHJvYmVzIGFyY2hfY2hlY2tfa3Byb2JlKHVuc2lnbmVkIGxv
bmcgYWRkcikKPiAgewo+IC0gICAgICAgdW5zaWduZWQgbG9uZyB0bXAgID0gKHVuc2lnbmVkIGxv
bmcpcC0+YWRkciAtIHAtPm9mZnNldDsKPiAtICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkciA9ICh1
bnNpZ25lZCBsb25nKXAtPmFkZHI7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHRtcCwgb2Zmc2V0
Owo+ICsKPiArICAgICAgIC8qIHN0YXJ0IGl0ZXJhdGluZyBhdCB0aGUgY2xvc2VzdCBwcmVjZWRp
bmcgc3ltYm9sICovCj4gKyAgICAgICBpZiAoIWthbGxzeW1zX2xvb2t1cF9zaXplX29mZnNldChh
ZGRyLCBOVUxMLCAmb2Zmc2V0KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsK
PiArICAgICAgIHRtcCA9IGFkZHIgLSBvZmZzZXQ7Cj4KPiAgICAgICAgIHdoaWxlICh0bXAgPD0g
YWRkcikgewo+ICAgICAgICAgICAgICAgICBpZiAodG1wID09IGFkZHIpCj4gQEAgLTcxLDcgKzc2
LDcgQEAgaW50IF9fa3Byb2JlcyBhcmNoX3ByZXBhcmVfa3Byb2JlKHN0cnVjdCBrcHJvYmUgKnAp
Cj4gICAgICAgICBpZiAoKHVuc2lnbmVkIGxvbmcpaW5zbiAmIDB4MSkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIC1FSUxTRVE7Cj4KPiAtICAgICAgIGlmICghYXJjaF9jaGVja19rcHJvYmUocCkp
Cj4gKyAgICAgICBpZiAoIWFyY2hfY2hlY2tfa3Byb2JlKCh1bnNpZ25lZCBsb25nKXAtPmFkZHIp
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTFNFUTsKPgo+ICAgICAgICAgLyogY29weSBp
bnN0cnVjdGlvbiAqLwo+IC0tCj4gMi41MS4wCj4KPgo+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBH
dW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
