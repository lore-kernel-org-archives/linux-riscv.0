Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73844CDB483
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mwg57YTFc5owD3Yi3J/dPSU7x7eQUxh/5MjaIh99Ark=; b=Rp6TVwcpoi16et
	hwfTe3c3NzuorsGwjuy3o4rzSsb5Kyil9A/t64yjh6xX4EWBzZ59CX61bb+pF7s54u98YLEAevKYi
	B0H5pQg691G7qGFMAhUy8H9YGxnOCecmsrfpZjppBAzC8T7J8rXdTV1P2TKE3wkcfSX/DtAaR1lcf
	Ig7O7wpugezUnS2r827D6mlPVjErr7bT85WoXwEQm1Pcw7N+NLV49NpDZ70GxLj90+QW45dWf0ule
	a+2N7OpXEZON/aZahXZ9kNRqRAnVeUmEAtyxH46SxUyHVud0firEu14Clrcg9eBG1k2XCJ4ITMu/X
	/3HMeMx6oBVw7c7osicA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAG1-00FIVN-0o;
	Wed, 18 Oct 2023 17:22:57 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAFx-00FIUd-0F;
	Wed, 18 Oct 2023 17:22:55 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-581e106fd25so241434eaf.0;
        Wed, 18 Oct 2023 10:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697649772; x=1698254572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KGquFH/+a1RdzcZc8K6W68eVVi5OATd0jI25tQHlZv8=;
        b=iipfsRYQZwGfksjWPyA1GMnoWkAywPxRnSlU3ZNmWr0S8kUwtzPMqAhC43qB7RZGIJ
         JlRe5qxtOJjmZaFaw7oCPACTs7g33vsgRTpXIC1bYOfxy+LTC8gmr5C23iXDCJvvOBB3
         E80NCSAMOBdSGZ1IN3lwO1fDlr6qB3gqbrkzYP3o+XwcYfdctnMA/lzZ26pTJAeM4exy
         7urPYixbkXSqmsKkIZcUBfhN7TGdNVa7ZeTJbQtaO6JfJ2gTreKbPc0C90mSFDf6ZzcQ
         r3EEpYoQ1eQ1SrFlqw5VB8sanSAZhTpjxaSDrlVwhJqLW+mCJkDrL1yN+1W9goue/NS8
         d8sw==
X-Gm-Message-State: AOJu0Yy6c4Tm20Fewi2k+b1M7emW07JeQDiwt8OQ7iMkCrkZH3I9RuXm
	y1e7LsrpRWf8AICQeqrMEoTIGA7cSVW0Kqhs9WA=
X-Google-Smtp-Source: AGHT+IGnmJUfeSri+TMV3NErQyfjji4f2m97Lkw8D0KsSEf0XFZvd7HfD1x/izKkVXkF2hgHtKhj59ftsHemFTzqGXM=
X-Received: by 2002:a4a:e1cd:0:b0:581:feb5:ac87 with SMTP id
 n13-20020a4ae1cd000000b00581feb5ac87mr2078567oot.1.1697649771877; Wed, 18 Oct
 2023 10:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <20231018162540.667646-1-vincent.guittot@linaro.org> <20231018162540.667646-4-vincent.guittot@linaro.org>
In-Reply-To: <20231018162540.667646-4-vincent.guittot@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 18 Oct 2023 19:22:40 +0200
Message-ID: <CAJZ5v0i58HLmgp=JYCbq5B6LUe0tEAhd9Ed9WKqkkHjVEO_W6A@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] cpufreq/schedutil: use a fixed reference frequency
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	sudeep.holla@arm.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com, 
	viresh.kumar@linaro.org, lenb@kernel.org, robert.moore@intel.com, 
	lukasz.luba@arm.com, ionela.voinescu@arm.com, pierre.gondois@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linuxfoundation.org, 
	conor.dooley@microchip.com, suagrfillet@gmail.com, ajones@ventanamicro.com, 
	lftan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102253_114593_5E4DD69D 
X-CRM114-Status: GOOD (  22.32  )
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

T24gV2VkLCBPY3QgMTgsIDIwMjMgYXQgNjoyNeKAr1BNIFZpbmNlbnQgR3VpdHRvdAo8dmluY2Vu
dC5ndWl0dG90QGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gY3B1aW5mby5tYXhfZnJlcSBjYW4gY2hh
bmdlIGF0IHJ1bnRpbWUgYmVjYXVzZSBvZiBib29zdCBhcyBhbiBleGFtcGxlLiBUaGlzCj4gaW1w
bGllcyB0aGF0IHRoZSB2YWx1ZSBjb3VsZCBiZSBkaWZmZXJlbnQgdGhhbiB0aGUgb25lIHRoYXQg
aGFzIGJlZW4KPiB1c2VkIHdoZW4gY29tcHV0aW5nIHRoZSBjYXBhY2l0eSBvZiBhIENQVS4KPgo+
IFRoZSBuZXcgYXJjaF9zY2FsZV9mcmVxX3JlZigpIHJldHVybnMgYSBmaXhlZCBhbmQgY29oZXJl
bnQgcmVmZXJlbmNlCj4gZnJlcXVlbmN5IHRoYXQgY2FuIGJlIHVzZWQgd2hlbiBjb21wdXRpbmcg
YSBmcmVxdWVuY3kgYmFzZWQgb24gdXRpbGl6YXRpb24uCj4KPiBVc2UgdGhpcyBhcmNoX3NjYWxl
X2ZyZXFfcmVmKCkgd2hlbiBhdmFpbGFibGUgYW5kIGZhbGxiYWNrIHRvCj4gcG9saWN5IG90aGVy
d2lzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFZpbmNlbnQgR3VpdHRvdCA8dmluY2VudC5ndWl0dG90
QGxpbmFyby5vcmc+Cj4gUmV2aWV3ZWQtYnk6IEx1a2FzeiBMdWJhIDxsdWthc3oubHViYUBhcm0u
Y29tPgo+IFRlc3RlZC1ieTogTHVrYXN6IEx1YmEgPGx1a2Fzei5sdWJhQGFybS5jb20+CgpBY2tl
ZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPgoKPgo+IC0tLQo+ICBr
ZXJuZWwvc2NoZWQvY3B1ZnJlcV9zY2hlZHV0aWwuYyB8IDI2ICsrKysrKysrKysrKysrKysrKysr
KysrKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9zY2hlZC9jcHVmcmVxX3NjaGVkdXRpbC5jIGIva2Vy
bmVsL3NjaGVkL2NwdWZyZXFfc2NoZWR1dGlsLmMKPiBpbmRleCA0NThkMzU5ZjU5OTEuLjZlNDAz
MDQ4MmFlOCAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvc2NoZWQvY3B1ZnJlcV9zY2hlZHV0aWwuYwo+
ICsrKyBiL2tlcm5lbC9zY2hlZC9jcHVmcmVxX3NjaGVkdXRpbC5jCj4gQEAgLTExNCw2ICsxMTQs
MjggQEAgc3RhdGljIHZvaWQgc3Vnb3ZfZGVmZXJyZWRfdXBkYXRlKHN0cnVjdCBzdWdvdl9wb2xp
Y3kgKnNnX3BvbGljeSkKPiAgICAgICAgIH0KPiAgfQo+Cj4gKy8qKgo+ICsgKiBjcHVmcmVxX2dl
dF9jYXBhY2l0eV9yZWZfZnJlcSAtIGdldCB0aGUgcmVmZXJlbmNlIGZyZXF1ZW5jeSBvZiBhIGdp
dmVuIENQVSB0aGF0Cj4gKyAqIGhhcyBiZWVuIHVzZWQgdG8gY29ycmVsYXRlIGZyZXF1ZW5jeSBh
bmQgY29tcHV0ZSBjYXBhY2l0eS4KPiArICogQHBvbGljeTogdGhlIGNwdWZyZXEgcG9saWN5IG9m
IHRoZSBDUFUgaW4gcXVlc3Rpb24uCj4gKyAqIEB1c2VfY3VycmVudDogRmFsbGJhY2sgdG8gY3Vy
cmVudCBmcmVxIGluc3RlYWQgb2YgcG9saWN5LT5jcHVpbmZvLm1heF9mcmVxLgo+ICsgKgo+ICsg
KiBSZXR1cm46IHRoZSByZWZlcmVuY2UgQ1BVIGZyZXF1ZW5jeSB0byBjb21wdXRlIGEgY2FwYWNp
dHkuCj4gKyAqLwo+ICtzdGF0aWMgX19hbHdheXNfaW5saW5lCj4gK3Vuc2lnbmVkIGxvbmcgZ2V0
X2NhcGFjaXR5X3JlZl9mcmVxKHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5KQo+ICt7Cj4g
KyAgICAgICB1bnNpZ25lZCBpbnQgZnJlcSA9IGFyY2hfc2NhbGVfZnJlcV9yZWYocG9saWN5LT5j
cHUpOwo+ICsKPiArICAgICAgIGlmIChmcmVxKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gZnJl
cTsKPiArCj4gKyAgICAgICBpZiAoYXJjaF9zY2FsZV9mcmVxX2ludmFyaWFudCgpKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gcG9saWN5LT5jcHVpbmZvLm1heF9mcmVxOwo+ICsKPiArICAgICAg
IHJldHVybiBwb2xpY3ktPmN1cjsKPiArfQo+ICsKPiAgLyoqCj4gICAqIGdldF9uZXh0X2ZyZXEg
LSBDb21wdXRlIGEgbmV3IGZyZXF1ZW5jeSBmb3IgYSBnaXZlbiBjcHVmcmVxIHBvbGljeS4KPiAg
ICogQHNnX3BvbGljeTogc2NoZWR1dGlsIHBvbGljeSBvYmplY3QgdG8gY29tcHV0ZSB0aGUgbmV3
IGZyZXF1ZW5jeSBmb3IuCj4gQEAgLTE0MCwxMCArMTYyLDEwIEBAIHN0YXRpYyB1bnNpZ25lZCBp
bnQgZ2V0X25leHRfZnJlcShzdHJ1Y3Qgc3Vnb3ZfcG9saWN5ICpzZ19wb2xpY3ksCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgdXRpbCwgdW5zaWduZWQg
bG9uZyBtYXgpCj4gIHsKPiAgICAgICAgIHN0cnVjdCBjcHVmcmVxX3BvbGljeSAqcG9saWN5ID0g
c2dfcG9saWN5LT5wb2xpY3k7Cj4gLSAgICAgICB1bnNpZ25lZCBpbnQgZnJlcSA9IGFyY2hfc2Nh
bGVfZnJlcV9pbnZhcmlhbnQoKSA/Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
b2xpY3ktPmNwdWluZm8ubWF4X2ZyZXEgOiBwb2xpY3ktPmN1cjsKPiArICAgICAgIHVuc2lnbmVk
IGludCBmcmVxOwo+Cj4gICAgICAgICB1dGlsID0gbWFwX3V0aWxfcGVyZih1dGlsKTsKPiArICAg
ICAgIGZyZXEgPSBnZXRfY2FwYWNpdHlfcmVmX2ZyZXEocG9saWN5KTsKPiAgICAgICAgIGZyZXEg
PSBtYXBfdXRpbF9mcmVxKHV0aWwsIGZyZXEsIG1heCk7Cj4KPiAgICAgICAgIGlmIChmcmVxID09
IHNnX3BvbGljeS0+Y2FjaGVkX3Jhd19mcmVxICYmICFzZ19wb2xpY3ktPm5lZWRfZnJlcV91cGRh
dGUpCj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
