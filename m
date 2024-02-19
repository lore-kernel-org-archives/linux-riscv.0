Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA601C48BF8
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 14:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=30e2DMrfr06z5H5YBCNFYs1DEA+hJwNpDUXCv2i0scg=; b=D5NNwpxSzRr1t4X+kqXh6kAJuN
	4pLj0cabUvUNTwZl0FYc1TO6A1Ai+9RRIW0LUB7cvjPdm4UMu9fRBSnH7lc9/lnVbrE3yaXNOLyjQ
	opk+eXhgByiViB//G04bRDVJIzXcGPWIEr3boE9qcli+ZUE3DyQiaZBvqvQlIV/xYER1oi4c/O67J
	HenZqbMw0m2/72/3BNz2HpMmLMe4Y31bl6q75v+wa9vu17F/sxhg452l+xILpV39qgmk1daeuX9Mj
	L2KE4BeLluynEh/UmeKG3HjervwQlFtBvr/rpTxtCyPHEWQ8dC1dOetJptCJZQSTDKei/FMWlLzt8
	mjiWj8hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4lL-0000000AsQ4-31Kr;
	Mon, 19 Feb 2024 14:36:55 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc4lH-0000000AsNw-2ozt
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 14:36:54 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-7c48ef54d9bso75390539f.2
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 06:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708353410; x=1708958210; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5e/j4wH/8q2m/93ox5vboDjUwAf9Ak3MIjkr/fbj+5c=;
        b=jMI5BSv0bhGGm6lOgwfKS1hTs/ag/SzQAwCwhjAVOHUgx6FCUkxyAqxGdGcNih/D5V
         CX6jTo51ktVW4hNjqdNvP2Nl1jlS5IezWL+knPs2kNeLFQHsYAzYJTiBxm4CHVaVwB8/
         HWnpfKDSVmTP/YnologvBPLt5zWvjSkcaeqZ3dnVh0U6CW14zqOaW0gr2OUUOhZ0VOgT
         g6E4dF8NriAHDLn+euwRdn0MTFkpsdVHmXvq4vmqJ7TTHfI1qRDGicAHtFT2NHvl7fIY
         HKXuUSe8mZRDu8yUB0YpsCQdysEDygD8KMaJ0rbX9ume0j69RcWjT35KGLglEQXcKbsd
         AnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708353410; x=1708958210;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5e/j4wH/8q2m/93ox5vboDjUwAf9Ak3MIjkr/fbj+5c=;
        b=TOu+F72cGrM1kih7Lnl47hLZWpLHUNF9stxjqsS4PVzssCH8Q077Svwm0WbnUbfW1I
         YKIpDbMSEfd5ETbrEJYYZVpmd0pxKKNhFlVdyhUotPeDOfswxjlljMWYd/BafwZrX0mh
         s+Py5jztRAzGbv9YBaXpaYjm7INpLwc5/OetCkRKcuR9ZSNAHmQbFMVQ+4aik6IVMhye
         X1HlXOLHCNEV3ile3sY1Dvssd+dPRLP7/RdKbMfLhF1xS45ptnXVPmnUBEK0aFAfOu2T
         TQ4Um5aF0jx2vgTPbmGufeIz0QkBoSRIGlVWsSQSiB1MSgcLhnbIsE3a/H8nUxNsuL4e
         rA5g==
X-Forwarded-Encrypted: i=1; AJvYcCVNIyt7MO7LGeb9BBH7EZNl9FYrSP2lgzUyqOJ21AytjtKkI1GrB7VMatA+09nhh1S/J+caDVNQNDWQpdlhRcfJjkHqeyjBbvblG+gQ2Xb7
X-Gm-Message-State: AOJu0Yzk4s6ecHTUsJmmLpZJNB47fiOE6IuRUE0ospSNlski/C8OkJP8
	qZoa4J/2K4rsQLNNH+DncIFykwgK3dY0lWJqOnCq9CxftaUq6nF4Mm8wcL8mc38bqbunaHnQpGU
	XpvYRwXLo6yBrYRjHSwoCXVAKdz1o8rZ2gQV70Q==
X-Google-Smtp-Source: AGHT+IEKLm2RcJpX0Yzgc7TCjIYiyqGSZKCanrbTb1Kvtv83pUTLiLSVsrtf2qLypNmQ5Lqg6cFt5u1FOv6dN3UXASQ=
X-Received: by 2002:a5d:9a18:0:b0:7c7:344d:21ad with SMTP id
 s24-20020a5d9a18000000b007c7344d21admr6801531iol.0.1708353410077; Mon, 19 Feb
 2024 06:36:50 -0800 (PST)
MIME-Version: 1.0
References: <20240202015102.26251-1-zong.li@sifive.com>
In-Reply-To: <20240202015102.26251-1-zong.li@sifive.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 19 Feb 2024 22:36:39 +0800
Message-ID: <CANXhq0odPmhqsWA8hNqbH8+0ShJjUJktXNC1vxidpwjct+sdCg@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: add CALLER_ADDRx support
To: palmer@dabbelt.com, paul.walmsley@sifive.com, alex@ghiti.fr, 
	conor.dooley@microchip.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_063651_920868_F651A6F7 
X-CRM114-Status: GOOD (  25.16  )
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

T24gRnJpLCBGZWIgMiwgMjAyNCBhdCA5OjUx4oCvQU0gWm9uZyBMaSA8em9uZy5saUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IENBTExFUl9BRERSeCByZXR1cm5zIGNhbGxlcidzIGFkZHJlc3MgYXQg
c3BlY2lmaWVkIGxldmVsLCB0aGV5IGFyZSB1c2VkCj4gZm9yIHNldmVyYWwgdHJhY2Vycy4gVGhl
c2UgbWFjcm9zIGV2ZW50dWFsbHkgdXNlCj4gX19idWlsdGluX3JldHVybl9hZGRyZXNzKG4pIHRv
IGdldCB0aGUgY2FsbGVyJ3MgYWRkcmVzcyBpZiBhcmNoIGRvZXNuJ3QKPiBkZWZpbmUgdGhlaXIg
b3duIGltcGxlbWVudGF0aW9uLgo+Cj4gSW4gUklTQy1WLCBfX2J1aWx0aW5fcmV0dXJuX2FkZHJl
c3Mobikgb25seSB3b3JrcyB3aGVuIG4gPT0gMCwgd2UgbmVlZAo+IHRvIHdhbGsgdGhlIHN0YWNr
IGZyYW1lIHRvIGdldCB0aGUgY2FsbGVyJ3MgYWRkcmVzcyBhdCBzcGVjaWZpZWQgbGV2ZWwuCj4K
PiBkYXRhLmxldmVsIHN0YXJ0ZWQgZnJvbSAnbGV2ZWwgKyAzJyBkdWUgdG8gdGhlIGNhbGwgZmxv
dyBvZiBnZXR0aW5nCj4gY2FsbGVyJ3MgYWRkcmVzcyBpbiBSSVNDLVYgaW1wbGVtZW50YXRpb24u
IElmIHdlIGRvbid0IGhhdmUgYWRkaXRpb25hbAo+IHRocmVlIGl0ZXJhdGlvbiwgdGhlIGxldmVs
IGlzIGNvcnJlc3BvbmRpbmcgdG8gZm9sbG93czoKPgo+IGNhbGxzaXRlIC0+IHJldHVybl9hZGRy
ZXNzIC0+IGFyY2hfc3RhY2tfd2FsayAtPiB3YWxrX3N0YWNrZnJhbWUKPiB8ICAgICAgICAgICB8
ICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICAgICAgfAo+IGxldmVsIDMgICAgIGxldmVs
IDIgICAgICAgICAgIGxldmVsIDEgICAgICAgICAgICBsZXZlbCAwCj4KPiBGaXhlczogMTA2MjZj
MzJlMzgyICgicmlzY3YvZnRyYWNlOiBBZGQgYmFzaWMgc3VwcG9ydCIpCj4KPiBSZXZpZXdlZC1i
eTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiAtLS0KPgo+IENoYW5nZWQgaW4gdjI6
Cj4gLSBSZWJhc2UgdG8gdjYuOC1yYzIKPiAtIEFkZCBub2lubGluZSBhdHRyaWJ1dGUgZm9yIHJl
dHVybl9hZGRyZXNzKCkKPiAtIEFkZCBhIGZpeGVzIHRhZwo+Cj4gIGFyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vZnRyYWNlLmggICAgfCAgNSArKysrCj4gIGFyY2gvcmlzY3Yva2VybmVsL01ha2VmaWxl
ICAgICAgICAgfCAgMiArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9yZXR1cm5fYWRkcmVzcy5jIHwg
NDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTUg
aW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvcmV0
dXJuX2FkZHJlc3MuYwo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRy
YWNlLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Z0cmFjZS5oCj4gaW5kZXggMzI5MTcyMTIy
OTUyLi4xNTA1NWY5ZGY0ZGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9m
dHJhY2UuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZnRyYWNlLmgKPiBAQCAtMjUs
NiArMjUsMTEgQEAKPgo+ICAjZGVmaW5lIEFSQ0hfU1VQUE9SVFNfRlRSQUNFX09QUyAxCj4gICNp
Zm5kZWYgX19BU1NFTUJMWV9fCj4gKwo+ICtleHRlcm4gdm9pZCAqcmV0dXJuX2FkZHJlc3ModW5z
aWduZWQgaW50IGxldmVsKTsKPiArCj4gKyNkZWZpbmUgZnRyYWNlX3JldHVybl9hZGRyZXNzKG4p
IHJldHVybl9hZGRyZXNzKG4pCj4gKwo+ICB2b2lkIE1DT1VOVF9OQU1FKHZvaWQpOwo+ICBzdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgZnRyYWNlX2NhbGxfYWRqdXN0KHVuc2lnbmVkIGxvbmcg
YWRkcikKPiAgewo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9NYWtlZmlsZSBiL2Fy
Y2gvcmlzY3Yva2VybmVsL01ha2VmaWxlCj4gaW5kZXggZjcxOTEwNzE4MDUzLi42MDRkNmJmN2U0
NzYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvTWFrZWZpbGUKPiArKysgYi9hcmNo
L3Jpc2N2L2tlcm5lbC9NYWtlZmlsZQo+IEBAIC03LDYgKzcsNyBAQCBpZmRlZiBDT05GSUdfRlRS
QUNFCj4gIENGTEFHU19SRU1PVkVfZnRyYWNlLm8gPSAkKENDX0ZMQUdTX0ZUUkFDRSkKPiAgQ0ZM
QUdTX1JFTU9WRV9wYXRjaC5vICA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ICBDRkxBR1NfUkVNT1ZF
X3NiaS5vICAgID0gJChDQ19GTEFHU19GVFJBQ0UpCj4gK0NGTEFHU19SRU1PVkVfcmV0dXJuX2Fk
ZHJlc3MubyA9ICQoQ0NfRkxBR1NfRlRSQUNFKQo+ICBlbmRpZgo+ICBDRkxBR1Nfc3lzY2FsbF90
YWJsZS5vICs9ICQoY2FsbCBjYy1vcHRpb24sLVduby1vdmVycmlkZS1pbml0LCkKPiAgQ0ZMQUdT
X2NvbXBhdF9zeXNjYWxsX3RhYmxlLm8gKz0gJChjYWxsIGNjLW9wdGlvbiwtV25vLW92ZXJyaWRl
LWluaXQsKQo+IEBAIC00Niw2ICs0Nyw3IEBAIG9iai15ICs9IGlycS5vCj4gIG9iai15ICArPSBw
cm9jZXNzLm8KPiAgb2JqLXkgICs9IHB0cmFjZS5vCj4gIG9iai15ICArPSByZXNldC5vCj4gK29i
ai15ICArPSByZXR1cm5fYWRkcmVzcy5vCj4gIG9iai15ICArPSBzZXR1cC5vCj4gIG9iai15ICAr
PSBzaWduYWwubwo+ICBvYmoteSAgKz0gc3lzY2FsbF90YWJsZS5vCj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3JldHVybl9hZGRyZXNzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9yZXR1
cm5fYWRkcmVzcy5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAu
LmM4MTE1ZWM4ZmIzMAo+IC0tLSAvZGV2L251bGwKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9y
ZXR1cm5fYWRkcmVzcy5jCj4gQEAgLTAsMCArMSw0OCBAQAo+ICsvLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMC1vbmx5Cj4gKy8qCj4gKyAqIFRoaXMgY29kZSBjb21lIGZyb20gYXJj
aC9hcm02NC9rZXJuZWwvcmV0dXJuX2FkZHJlc3MuYwo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKEMp
IDIwMjMgU2lGaXZlLgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxsaW51eC9leHBvcnQuaD4KPiAr
I2luY2x1ZGUgPGxpbnV4L2twcm9iZXMuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3N0YWNrdHJhY2Uu
aD4KPiArCj4gK3N0cnVjdCByZXR1cm5fYWRkcmVzc19kYXRhIHsKPiArICAgICAgIHVuc2lnbmVk
IGludCBsZXZlbDsKPiArICAgICAgIHZvaWQgKmFkZHI7Cj4gK307Cj4gKwo+ICtzdGF0aWMgYm9v
bCBzYXZlX3JldHVybl9hZGRyKHZvaWQgKmQsIHVuc2lnbmVkIGxvbmcgcGMpCj4gK3sKPiArICAg
ICAgIHN0cnVjdCByZXR1cm5fYWRkcmVzc19kYXRhICpkYXRhID0gZDsKPiArCj4gKyAgICAgICBp
ZiAoIWRhdGEtPmxldmVsKSB7Cj4gKyAgICAgICAgICAgICAgIGRhdGEtPmFkZHIgPSAodm9pZCAq
KXBjOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICB9Cj4gKwo+ICsg
ICAgICAgLS1kYXRhLT5sZXZlbDsKPiArCj4gKyAgICAgICByZXR1cm4gdHJ1ZTsKPiArfQo+ICtO
T0tQUk9CRV9TWU1CT0woc2F2ZV9yZXR1cm5fYWRkcik7Cj4gKwo+ICtub2lubGluZSB2b2lkICpy
ZXR1cm5fYWRkcmVzcyh1bnNpZ25lZCBpbnQgbGV2ZWwpCj4gK3sKPiArICAgICAgIHN0cnVjdCBy
ZXR1cm5fYWRkcmVzc19kYXRhIGRhdGE7Cj4gKwo+ICsgICAgICAgZGF0YS5sZXZlbCA9IGxldmVs
ICsgMzsKPiArICAgICAgIGRhdGEuYWRkciA9IE5VTEw7Cj4gKwo+ICsgICAgICAgYXJjaF9zdGFj
a193YWxrKHNhdmVfcmV0dXJuX2FkZHIsICZkYXRhLCBjdXJyZW50LCBOVUxMKTsKPiArCj4gKyAg
ICAgICBpZiAoIWRhdGEubGV2ZWwpCj4gKyAgICAgICAgICAgICAgIHJldHVybiBkYXRhLmFkZHI7
Cj4gKyAgICAgICBlbHNlCj4gKyAgICAgICAgICAgICAgIHJldHVybiBOVUxMOwo+ICsKPiArfQo+
ICtFWFBPUlRfU1lNQk9MX0dQTChyZXR1cm5fYWRkcmVzcyk7Cj4gK05PS1BST0JFX1NZTUJPTChy
ZXR1cm5fYWRkcmVzcyk7Cj4gLS0KPiAyLjE3LjEKPgoKSGkgYWxsLApJcyB0aGVyZSBhbnl0aGlu
ZyB0aGF0IGNhbiBiZSBpbXByb3ZlZCBpbiB0aGlzIHBhdGNoPyBUaGFua3MuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
