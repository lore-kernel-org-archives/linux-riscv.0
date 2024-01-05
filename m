Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AD5C47074
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 01:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyVy7iGiBfu2EmtM/hdy3Pn1kIHc32XP0V2rSPrXpUo=; b=gZDfC3AHw9J6dG
	O3qsWk144ou0VKg8xBt5fkuW/BlDu4pSmj47TioNSMGyAoSqSbtcmPJfZv5rb+JjB57mr5OSlXkSl
	uODEPy10ruSuxBC7//qKKm3zta7hfO+HdnQ7o2kmheKH6ZDl9h2jxsyQEbReV4EY3y6f5++qW/1Q+
	mhlCEa4uT19DQxyFVtyYT1FHQ8cM3s4HYjs891HyHqjq0+o+Tw6wB8wRwRurBSOUCkySLef8ktVnR
	GS4YP+o+ZtaIS0hwGAFZofw5wiH3b+8gpFUWXGTwe9kZ/DThU3i3BvLVqlm5CgFbd7bDROh8/WaCP
	0oTTlY462v+8Su2EFP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLYmL-00FhNn-0H;
	Fri, 05 Jan 2024 01:13:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLYmH-00FhN4-1U
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 01:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2264AB81AAC
	for <linux-riscv@lists.infradead.org>; Fri,  5 Jan 2024 01:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA0EC433B7
	for <linux-riscv@lists.infradead.org>; Fri,  5 Jan 2024 01:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704417214;
	bh=JNDfPZexh2mpstDALLBYw8BPHCxQYcpNV+7M+PjH5wA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s/Vol+CUBjymGKMUVsEuOyKTqhKK2V5WNzm5FSpXaCf+igTQOG4bSwXidEGbTOCIu
	 pSNJ+alTvyMr1Rly/UkkRAzWx8Xm7TychA/a2kPdZqubrA/hcl/ERr9qIGbH1Lmif0
	 Ym+A0UudjrvAMHd8weq/GnxuiMc05566ZZ2iWrzDJ/tc0HX23eRPziz03QokY+DtRG
	 HZTRqL73qSk6DUR82jwWxVv4gcsO8v+F/q6ghCqbHbkA3DNDkhGlYkOxStRdJPAi0h
	 qYtvk9804Fcm6Ifz6xU/lgG67z2uhua29CbnZ1vDcUKEm2Yd8FZhUm/Rq4KE8bCz+i
	 +spCu2hgchYyQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50ea9daac4cso1248839e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 17:13:33 -0800 (PST)
X-Gm-Message-State: AOJu0YzO3fM2esAantdb1F2gJlYffJXnMt3YTPn4a7T8lEEoIu0nqxnI
	/e19jV4gpaZjeOJN7t/mQxvYXcGs093/cQMuVn4=
X-Google-Smtp-Source: AGHT+IE/jrxQGmIeh5KaMHFfKue85vrbOJV69Mtu9Xvnf4OESV+eW+oa9dW8+AUzAk6imsCthCE4gAtXrS7j2v6+njI=
X-Received: by 2002:ac2:46f8:0:b0:50e:8e76:1323 with SMTP id
 q24-20020ac246f8000000b0050e8e761323mr615716lfo.121.1704417211777; Thu, 04
 Jan 2024 17:13:31 -0800 (PST)
MIME-Version: 1.0
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-4-guoren@kernel.org>
 <20240102-81391283df04c430d76c0eb0@orel> <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com>
 <ZZW5Y85OdibCu58h@LeoBras> <CAJF2gTTpi5A+9KP5EyH9qhD_fwuZrWpx6zdCJyG+iv0Ez5q-gw@mail.gmail.com>
 <ZZYsdyKx8kmoDBGB@LeoBras> <CAJF2gTTT8QBEKtKOpriF=c8Y3g5MmM23MZxN7JCa65MbKeKNOQ@mail.gmail.com>
 <ZZa96DEQhYnnGi51@LeoBras>
In-Reply-To: <ZZa96DEQhYnnGi51@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 5 Jan 2024 09:13:20 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSw6YebWt09W3xsux+rNLeefCwYYhQ5F5jJCWcxRWtK_Q@mail.gmail.com>
Message-ID: <CAJF2gTSw6YebWt09W3xsux+rNLeefCwYYhQ5F5jJCWcxRWtK_Q@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
To: Leonardo Bras <leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_171337_828792_EDB34A86 
X-CRM114-Status: GOOD (  43.90  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, wuwei2016@iscas.ac.cn, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wefu@redhat.com, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKYW4gNCwgMjAyNCBhdCAxMDoxN+KAr1BNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiAwNCwgMjAyNCBhdCAwNDoxNDoyN1BN
ICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gNCwgMjAyNCBhdCAxMTo1NuKA
r0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+
IE9uIFRodSwgSmFuIDA0LCAyMDI0IGF0IDA5OjI0OjQwQU0gKzA4MDAsIEd1byBSZW4gd3JvdGU6
Cj4gPiA+ID4gT24gVGh1LCBKYW4gNCwgMjAyNCBhdCAzOjQ14oCvQU0gTGVvbmFyZG8gQnJhcyA8
bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBXZWQsIEph
biAwMywgMjAyNCBhdCAwMjoxNTo0NVBNICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gPiA+ID4g
PiBPbiBUdWUsIEphbiAyLCAyMDI0IGF0IDc6MTnigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE9uIFN1
biwgRGVjIDMxLCAyMDIzIGF0IDAzOjI5OjUzQU0gLTA1MDAsIGd1b3JlbkBrZXJuZWwub3JnIHdy
b3RlOgo+ID4gPiA+ID4gPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEu
Y29tPgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+IFRoZSBjb3N0IG9mIGNoYW5naW5n
IGEgY2FjaGVsaW5lIGZyb20gc2hhcmVkIHRvIGV4Y2x1c2l2ZSBzdGF0ZSBjYW4gYmUKPiA+ID4g
PiA+ID4gPiA+IHNpZ25pZmljYW50LCBlc3BlY2lhbGx5IHdoZW4gdGhpcyBpcyB0cmlnZ2VyZWQg
YnkgYW4gZXhjbHVzaXZlIHN0b3JlLAo+ID4gPiA+ID4gPiA+ID4gc2luY2UgaXQgbWF5IHJlc3Vs
dCBpbiBoYXZpbmcgdG8gcmV0cnkgdGhlIHRyYW5zYWN0aW9uLgo+ID4gPiA+ID4gPiA+ID4KPiA+
ID4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggbWFrZXMgdXNlIG9mIHByZWZldGNoLncgdG8gcHJlZmV0
Y2ggY2FjaGVsaW5lcyBmb3Igd3JpdGUKPiA+ID4gPiA+ID4gPiA+IHByaW9yIHRvIGxyL3NjIGxv
b3BzIHdoZW4gdXNpbmcgdGhlIHhjaGdfc21hbGwgYXRvbWljIHJvdXRpbmUuCj4gPiA+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBpcyBpbnNwaXJlZCBieSBjb21taXQ6IDBl
YTM2NmY1ZTFiNiAoImFybTY0OiBhdG9taWNzOgo+ID4gPiA+ID4gPiA+ID4gcHJlZmV0Y2ggdGhl
IGRlc3RpbmF0aW9uIHdvcmQgZm9yIHdyaXRlIHByaW9yIHRvIHN0eHIiKS4KPiA+ID4gPiA+ID4g
PiA+Cj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXgu
YWxpYmFiYS5jb20+Cj4gPiA+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9y
ZW5Aa2VybmVsLm9yZz4KPiA+ID4gPiA+ID4gPiA+IC0tLQo+ID4gPiA+ID4gPiA+ID4gIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oIHwgNCArKystCj4gPiA+ID4gPiA+ID4gPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4gPiA+
ID4KPiA+ID4gPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nt
cHhjaGcuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oCj4gPiA+ID4gPiA+ID4g
PiBpbmRleCAyNmNlYTIzOTVhYWUuLmQ3YjlkNzk1MWYwOCAxMDA2NDQKPiA+ID4gPiA+ID4gPiA+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY21weGNoZy5oCj4gPiA+ID4gPiA+ID4gPiAr
KysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaAo+ID4gPiA+ID4gPiA+ID4gQEAg
LTEwLDYgKzEwLDcgQEAKPiA+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgI2luY2x1ZGUg
PGFzbS9iYXJyaWVyLmg+Cj4gPiA+ID4gPiA+ID4gPiAgI2luY2x1ZGUgPGFzbS9mZW5jZS5oPgo+
ID4gPiA+ID4gPiA+ID4gKyNpbmNsdWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gPiA+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiA+ID4gICNkZWZpbmUgX19hcmNoX3hjaGdfbWFza2VkKHByZXBlbmQsIGFw
cGVuZCwgciwgcCwgbikgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IEFyZSB5b3Ugc3VyZSB0aGlzIGlzIGJhc2VkIG9uIHY2LjctcmM3PyBCZWNhdXNlIEkgZG9u
J3Qgc2VlIHRoaXMgbWFjcm8uCj4gPiA+ID4gPiA+IE9oLCBpdCBpcyBiYXNlZCBvbiBMZW9icmFz
JyBwYXRjaGVzLiBJIHdvdWxkIHJlbW92ZSBpdCBpbiB0aGUgbmV4dCBvZiB2ZXJzaW9uLgo+ID4g
PiA+ID4KPiA+ID4gPiA+IEkgd291bGQgc2F5IHRoaXMgbmV4dCA6KQo+ID4gPiA+IFRoeCBmb3Ig
dGhlIGdyYW1tYXIgY29ycmVjdGlvbi4KPiA+ID4KPiA+ID4gT2gsIEkgd2FzIG5vdCBpbnRlbmRp
bmcgdG8gY29ycmVjdCBncmFtbWFyLgo+ID4gPiBJIGp1c3QgbWVhbnQgdGhlIG5leHQgdGhpbmcg
SSB3b3VsZCBtZW50aW9uIGlzIHRoYXQgaXQgd2FzIGJhc2VkIG9uIHRvcCBvZgo+ID4gPiBteSBw
YXRjaHNldCBpbnN0ZWFkIG9mIHY2LjctcmM3Ogo+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiAgKHsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4g
PiA+ID4gPiA+ID4gQEAgLTIzLDYgKzI0LDcgQEAKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gPiA+ID4gPiA+ID4gPiAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXyAoICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgIHByZXBlbmQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICBQUkVGRVRDSFdfQVNNKCU1KSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4gPiAg
ICAgICAgICAgICAgIjA6ICAgICAgbHIudyAlMCwgJTJcbiIgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ID4gPiA+ID4gPiA+ID4gICAgICAgICAgICAgICIgICAgICAgIGFuZCAg
JTEsICUwLCAlejRcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4g
PiA+ICAgICAgICAgICAgICAiICAgICAgICBvciAgICUxLCAlMSwgJXozXG4iICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4gPiBAQCAtMzAsNyArMzIsNyBAQAo+ID4g
PiA+ID4gPiA+ID4gICAgICAgICAgICAgICIgICAgICAgIGJuZXogJTEsIDBiXG4iICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICBh
cHBlbmQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gPiA+ID4gPiA+ID4gPiAgICAgICAgICAgICAgOiAiPSZyIiAoX19yZXR4KSwgIj0mciIgKF9f
cmMpLCAiK0EiICgqKF9fcHRyMzJiKSkgICAgICAgXAo+ID4gPiA+ID4gPiA+ID4gLSAgICAgICAg
ICAgIDogInJKIiAoX19uZXd4KSwgInJKIiAofl9fbWFzaykgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ID4gPiA+ID4gPiA+ICsgICAgICAgICAgICA6ICJySiIgKF9fbmV3eCksICJySiIg
KH5fX21hc2spLCAickoiIChfX3B0cjMyYikgICAgICAgICBcCj4gPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gPiBJJ20gcHJldHR5IHN1cmUgd2UgZG9uJ3Qgd2FudCB0byBhbGxvdyB0aGUgSiBjb25z
dHJhaW50IGZvciBfX3B0cjMyYi4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gICAgICAg
ICAgICAgIDogIm1lbW9yeSIpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ID4gPiA+ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ID4gPiAg
ICAgICByID0gKF9fdHlwZW9mX18oKihwKSkpKChfX3JldHggJiBfX21hc2spID4+IF9fcyk7ICAg
ICAgICAgICAgICAgXAo+ID4gPiA+ID4gPiA+ID4gLS0KPiA+ID4gPiA+ID4gPiA+IDIuNDAuMQo+
ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IFRoYW5rcywKPiA+ID4g
PiA+ID4gPiBkcmV3Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+Cj4gPiA+ID4g
PiA+IC0tCj4gPiA+ID4gPiA+IEJlc3QgUmVnYXJkcwo+ID4gPiA+ID4gPiAgR3VvIFJlbgo+ID4g
PiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IE5pY2UgcGF0Y2ggOikKPiA+ID4gPiA+IEFueSBy
ZWFzb24gaXQncyBub3QgbmVlZGVkIGluIF9fYXJjaF9jbXB4Y2hnX21hc2tlZCgpLCBhbmQgX19h
cmNoX2NtcHhjaGcoKSA/Cj4gPiA+ID4gQ0FTIGlzIGEgY29uZGl0aW9uYWwgQU1PLCB1bmxpa2Ug
eGNoZyAoU3RhbmQgQU1PKS4gQXJtNjQgaXMgd3JvbmcsIG9yCj4gPiA+ID4gdGhleSBoYXZlIGEg
cHJvYmxlbSB3aXRoIHRoZSBoYXJkd2FyZS4KPiA+ID4KPiA+ID4gU29ycnksIEkgd2FzIHVuYWJs
ZSB0byBmdWxseSB1bmRlcnN0YW5kIHRoZSByZWFzb24gaGVyZS4KPiA+ID4KPiA+ID4gWW91IHN1
Z2dlc3QgdGhhdCB0aGUgUFJFRkVUQ0guVyB3YXMgaW5zZXJ0ZWQgb24geGNoZ19tYXNrZWQgYmVj
YXVzZSBpdCB3aWxsCj4gPiA+IGFsd2F5cyBzd2l0Y2ggdGhlIHZhcmlhYmxlIChubyBjb21wYXJl
LCBibGluZCBDQVMpLCBidXQgbm90IG9uIGNtcHhjaGcuCj4gPiA+Cj4gPiA+IElzIHRoaXMgYmVj
YXVzZSBjbXB4Y2hnIHdpbGwgZGVwZW5kIG9uIGEgY29tcGFyZSwgYW5kIHRodXMgaXQgZG9lcyBu
b3QKPiA+ID4gZ2FyYW50ZWUgYSB3cml0ZT8gc28gaXQgd291bGQgYmUgdW53aXNlIHRvIGFsd2F5
cyBwcmVmZXRjaCBjYWNoZWxpbmUKPiA+IFllcywgaXQgaGFzIGEgY29tcGFyaXNvbiwgc28gYSBz
dG9yZSBtYXkgbm90IGV4aXN0IHRoZXJlLgo+ID4KPiA+ID4gZXhjbHVzaXZlbmVzcyBmb3IgdGhp
cyBjcHUsIHdoZXJlIHNoYXJlZCBzdGF0ZSB3b3VsZCBiZSBlbm91Z2guCj4gPiA+IElzIHRoYXQg
Y29ycmVjdD8KPiA+IFllcywgZXhjbHVzaXZlbmVzcyB3b3VsZCBpbnZhbGlkYXRlIG90aGVyIGhh
cnRzJyBjYWNoZSBsaW5lcy4KPgo+IEkgc2VlLgo+Cj4gSSByZWNhbGwgYSBwcmV2aW91cyBkaXNj
dXNzaW9uIG9uIGNvbXB1dGVyIGFyY2ggd2hpY2ggc3RhdGVkIHRoYXQgYW55IExSCj4gd291bGQg
cmVxdWlyZSB0byBnZXQgYSBjYWNoZWxpbmUgaW4gZXhjbHVzaXZlIHN0YXRlIGZvciBsci9zYyB0
byB3b3JrLCBidXQKPiBJIHdlbnQgdGhyb3VnaCB0aGUgUklTQy1WIGxyL3NjIGRvY3VtZW50YXRp
b24gYW5kIGNvdWxkIG5vdCBmaW5kIGFueSBpbmZvCj4gYWJvdXQgaXRzIGNhY2hlbGluZSBiZWhh
dmlvci4KCk5vLCBsciBjb3VsZG4ndCBnZXQgYSBjYWNoZWxpbmUgaW4gZXhjbHVzaXZlLCB0aGF0
IHdvdWxkIGJyZWFrIHRoZSBJU0EgZGVzaWduLgpUaGluayBhYm91dCAibHIgKyB3ZmUiIHBhaXIu
Cgo+Cj4gSWYgdGhpcyBzdGFuZHMgY29ycmVjdCwgdGhlIFBSRUZFVENILlcgY291bGQgYmUgdXNl
ZnVsIGJlZm9yZSBldmVyeSBsciwKPiByaWdodD8KPiAobWF5YmUgdGhhdCdzIHRoZSBjYXNlIGZv
ciBhcm02NCB0aGF0IHlvdSBtZW50aW9uZWQgYmVmb3JlKQpUaGUgYXJtNjQgImxyICsgc2MiIGNt
cHhjaGcgdmVyc2lvbiBpcyBub3QgZ29vZCwgZG9uJ3QgZm9sbG93IHRoYXQuClRoZXkgYXJlIG1v
dmluZyB0byB0aGUgTFNFJ3MgY2FzIGluc3RydWN0aW9uLgoKCj4KPiBUaGFua3MhCj4gTGVvCj4K
PiA+Cj4gPiA+Cj4gPiA+IFRoYW5rcyEKPiA+ID4gTGVvCj4gPiA+Cj4gPiA+Cj4gPiA+ID4KPiA+
ID4gPiA+Cj4gPiA+ID4gPiBUaGFua3MhCj4gPiA+ID4gPiBMZW8KPiA+ID4gPiA+Cj4gPiA+ID4K
PiA+ID4gPgo+ID4gPiA+IC0tCj4gPiA+ID4gQmVzdCBSZWdhcmRzCj4gPiA+ID4gIEd1byBSZW4K
PiA+ID4gPgo+ID4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4gQmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJl
bgo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
