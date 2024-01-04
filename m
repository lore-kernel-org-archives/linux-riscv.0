Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACCFC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 08:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMcvK7HVU4wO6JOV7r+7jDYuOmMnYbF1trjmueNOlAs=; b=4lL2HrEQ+/rR4R
	8cOOF4yoldUUah3jIRmfag+HHxCN6Kp0U46XGhZbupXwSbryli9bB9lYMholaMlCpGHe6hIgb2eom
	wYA7XZo+JzJg909twfdJk/RZQyFw7LqXr5atlmiqomfLZFMrR+Lqrw19yD0pawSfpdPSo8VuIm0fd
	3NgkcqVup8qDiOMO7+FyLLprYjAUiSjYFp3yfA3m46rhWj+GtM3TVEx5DJJ/VadiFTAlpsWniEIye
	cjrlfMcpVYuOEYbL++YBuWqHzmAqX3js5Q8AYnEI4lJozewds+YvFBv0lFXeD+bLPLw5D1gQjUw5L
	G/m9Lt0YC/nWWS0fphww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLIsN-00DAjZ-2s;
	Thu, 04 Jan 2024 08:14:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLIsK-00DAhm-1X
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 08:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 24818B8164C
	for <linux-riscv@lists.infradead.org>; Thu,  4 Jan 2024 08:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9482EC433AD
	for <linux-riscv@lists.infradead.org>; Thu,  4 Jan 2024 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704356081;
	bh=jaE3szVj8MsgSxuSXcKLMpdQ+g8wxNLidI3HZVXMSME=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ehLT8o6hejxcx5mGGMVy8W5S0ZLxpHLPpMUMMbL/goXddDJ6V55fJFc2UW+ITCUeY
	 UY/oddRCAMzoJvLnTweF/x4AX+Ysud1JOwZQkVYPCYp/9yrVIjoP18jjWtVhyXeLIj
	 eXvPtnOQmyIL25B1dJpVyJrzyJuyA/mMziJxtYlwyuBar99Q+dc3bmKvllhfL7/iFe
	 jOToFGtrc1yWPvbKfEQh6qwmcpIK29gRbndE3S480oCFYBESUnQG3Nq4c8QQDVGro/
	 SrXFBR1sbz4r7G0prMR+cHrcXLucW3mlEZdnXUqi8QlQM3usxovJo0w/U8RkclJAMu
	 wsnWC65ujJpUQ==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-555aa7fd668so291739a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 00:14:41 -0800 (PST)
X-Gm-Message-State: AOJu0Yx8lV1DkKZNr+9tgfBN0uSClsf01JgCs8ld+36WEb7rGdAt1w4q
	xAPIWtsSjT45IuoVFfNypOD3c1ke+zGaZEDaxpI=
X-Google-Smtp-Source: AGHT+IGmofhqQh3VQmtq0uihHErWzzBwYu85d9ONV1s6wEWx4GEUpDzZopd0NKZnV1IjSKshZFnRZmNHJpurrD1UujU=
X-Received: by 2002:a17:906:4118:b0:a28:e5c9:79eb with SMTP id
 j24-20020a170906411800b00a28e5c979ebmr119219ejk.100.1704356079669; Thu, 04
 Jan 2024 00:14:39 -0800 (PST)
MIME-Version: 1.0
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-4-guoren@kernel.org>
 <20240102-81391283df04c430d76c0eb0@orel> <CAJF2gTQ7Oo8UKdPRs0GAAUsh9mDCgGucS8g8kuPzByaWVOtigw@mail.gmail.com>
 <ZZW5Y85OdibCu58h@LeoBras> <CAJF2gTTpi5A+9KP5EyH9qhD_fwuZrWpx6zdCJyG+iv0Ez5q-gw@mail.gmail.com>
 <ZZYsdyKx8kmoDBGB@LeoBras>
In-Reply-To: <ZZYsdyKx8kmoDBGB@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 4 Jan 2024 16:14:27 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTT8QBEKtKOpriF=c8Y3g5MmM23MZxN7JCa65MbKeKNOQ@mail.gmail.com>
Message-ID: <CAJF2gTTT8QBEKtKOpriF=c8Y3g5MmM23MZxN7JCa65MbKeKNOQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] riscv: xchg: Prefetch the destination word for sc.w
To: Leonardo Bras <leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_001448_820323_77AC62A8 
X-CRM114-Status: GOOD (  40.62  )
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

T24gVGh1LCBKYW4gNCwgMjAyNCBhdCAxMTo1NuKAr0FNIExlb25hcmRvIEJyYXMgPGxlb2JyYXNA
cmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEphbiAwNCwgMjAyNCBhdCAwOToyNDo0MEFN
ICswODAwLCBHdW8gUmVuIHdyb3RlOgo+ID4gT24gVGh1LCBKYW4gNCwgMjAyNCBhdCAzOjQ14oCv
QU0gTGVvbmFyZG8gQnJhcyA8bGVvYnJhc0ByZWRoYXQuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
T24gV2VkLCBKYW4gMDMsIDIwMjQgYXQgMDI6MTU6NDVQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiA+ID4gPiBPbiBUdWUsIEphbiAyLCAyMDI0IGF0IDc6MTnigK9QTSBBbmRyZXcgSm9uZXMgPGFq
b25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBTdW4s
IERlYyAzMSwgMjAyMyBhdCAwMzoyOTo1M0FNIC0wNTAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90
ZToKPiA+ID4gPiA+ID4gRnJvbTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBUaGUgY29zdCBvZiBjaGFuZ2luZyBhIGNhY2hlbGluZSBm
cm9tIHNoYXJlZCB0byBleGNsdXNpdmUgc3RhdGUgY2FuIGJlCj4gPiA+ID4gPiA+IHNpZ25pZmlj
YW50LCBlc3BlY2lhbGx5IHdoZW4gdGhpcyBpcyB0cmlnZ2VyZWQgYnkgYW4gZXhjbHVzaXZlIHN0
b3JlLAo+ID4gPiA+ID4gPiBzaW5jZSBpdCBtYXkgcmVzdWx0IGluIGhhdmluZyB0byByZXRyeSB0
aGUgdHJhbnNhY3Rpb24uCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFRoaXMgcGF0Y2ggbWFrZXMg
dXNlIG9mIHByZWZldGNoLncgdG8gcHJlZmV0Y2ggY2FjaGVsaW5lcyBmb3Igd3JpdGUKPiA+ID4g
PiA+ID4gcHJpb3IgdG8gbHIvc2MgbG9vcHMgd2hlbiB1c2luZyB0aGUgeGNoZ19zbWFsbCBhdG9t
aWMgcm91dGluZS4KPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gVGhpcyBwYXRjaCBpcyBpbnNwaXJl
ZCBieSBjb21taXQ6IDBlYTM2NmY1ZTFiNiAoImFybTY0OiBhdG9taWNzOgo+ID4gPiA+ID4gPiBw
cmVmZXRjaCB0aGUgZGVzdGluYXRpb24gd29yZCBmb3Igd3JpdGUgcHJpb3IgdG8gc3R4ciIpLgo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGlu
dXguYWxpYmFiYS5jb20+Cj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3Jl
bkBrZXJuZWwub3JnPgo+ID4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ID4gIGFyY2gvcmlzY3YvaW5j
bHVkZS9hc20vY21weGNoZy5oIHwgNCArKystCj4gPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhjaGcuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vY21weGNoZy5oCj4gPiA+ID4gPiA+IGluZGV4IDI2Y2VhMjM5NWFhZS4uZDdi
OWQ3OTUxZjA4IDEwMDY0NAo+ID4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNt
L2NtcHhjaGcuaAo+ID4gPiA+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NtcHhj
aGcuaAo+ID4gPiA+ID4gPiBAQCAtMTAsNiArMTAsNyBAQAo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiAgI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gPiA+ID4gPiA+ICAjaW5jbHVkZSA8YXNtL2Zl
bmNlLmg+Cj4gPiA+ID4gPiA+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ID4gPiA+ID4g
Pgo+ID4gPiA+ID4gPiAgI2RlZmluZSBfX2FyY2hfeGNoZ19tYXNrZWQocHJlcGVuZCwgYXBwZW5k
LCByLCBwLCBuKSAgICAgICAgICAgICAgICAgXAo+ID4gPiA+ID4KPiA+ID4gPiA+IEFyZSB5b3Ug
c3VyZSB0aGlzIGlzIGJhc2VkIG9uIHY2LjctcmM3PyBCZWNhdXNlIEkgZG9uJ3Qgc2VlIHRoaXMg
bWFjcm8uCj4gPiA+ID4gT2gsIGl0IGlzIGJhc2VkIG9uIExlb2JyYXMnIHBhdGNoZXMuIEkgd291
bGQgcmVtb3ZlIGl0IGluIHRoZSBuZXh0IG9mIHZlcnNpb24uCj4gPiA+Cj4gPiA+IEkgd291bGQg
c2F5IHRoaXMgbmV4dCA6KQo+ID4gVGh4IGZvciB0aGUgZ3JhbW1hciBjb3JyZWN0aW9uLgo+Cj4g
T2gsIEkgd2FzIG5vdCBpbnRlbmRpbmcgdG8gY29ycmVjdCBncmFtbWFyLgo+IEkganVzdCBtZWFu
dCB0aGUgbmV4dCB0aGluZyBJIHdvdWxkIG1lbnRpb24gaXMgdGhhdCBpdCB3YXMgYmFzZWQgb24g
dG9wIG9mCj4gbXkgcGF0Y2hzZXQgaW5zdGVhZCBvZiB2Ni43LXJjNzoKPgo+ID4KPiA+ID4KPiA+
ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+ID4gICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gQEAg
LTIzLDYgKzI0LDcgQEAKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gICAg
ICAgX19hc21fXyBfX3ZvbGF0aWxlX18gKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiA+ID4gPiA+ID4gICAgICAgICAgICAgIHByZXBlbmQgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gKyAgICAg
ICAgICAgIFBSRUZFVENIV19BU00oJTUpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICIwOiAgICAgIGxyLncgJTAsICUyXG4i
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gICAgICAgICAg
ICAgICIgICAgICAgIGFuZCAgJTEsICUwLCAlejRcbiIgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICIgICAgICAgIG9yICAgJTEsICUxLCAlejNc
biIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gQEAgLTMwLDcgKzMy
LDcgQEAKPiA+ID4gPiA+ID4gICAgICAgICAgICAgICIgICAgICAgIGJuZXogJTEsIDBiXG4iICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4gPiA+ID4gICAgICAgICAgICAg
IGFwcGVuZCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiA+ID4gPiA+ID4gICAgICAgICAgICAgIDogIj0mciIgKF9fcmV0eCksICI9JnIiIChfX3Jj
KSwgIitBIiAoKihfX3B0cjMyYikpICAgICAgIFwKPiA+ID4gPiA+ID4gLSAgICAgICAgICAgIDog
InJKIiAoX19uZXd4KSwgInJKIiAofl9fbWFzaykgICAgICAgICAgICAgICAgICAgICAgICAgIFwK
PiA+ID4gPiA+ID4gKyAgICAgICAgICAgIDogInJKIiAoX19uZXd4KSwgInJKIiAofl9fbWFzayks
ICJySiIgKF9fcHRyMzJiKSAgICAgICAgIFwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBJJ20gcHJldHR5
IHN1cmUgd2UgZG9uJ3Qgd2FudCB0byBhbGxvdyB0aGUgSiBjb25zdHJhaW50IGZvciBfX3B0cjMy
Yi4KPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICAgICAgICAgICA6ICJtZW1vcnkiKTsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiA+ID4gPiA+ICAgICAgIHIgPSAoX190eXBlb2ZfXygqKHApKSkoKF9fcmV0
eCAmIF9fbWFzaykgPj4gX19zKTsgICAgICAgICAgICAgICBcCj4gPiA+ID4gPiA+IC0tCj4gPiA+
ID4gPiA+IDIuNDAuMQo+ID4gPiA+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoYW5rcywKPiA+
ID4gPiA+IGRyZXcKPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4KPiA+ID4gPiAtLQo+ID4gPiA+IEJl
c3QgUmVnYXJkcwo+ID4gPiA+ICBHdW8gUmVuCj4gPiA+ID4KPiA+ID4KPiA+ID4gTmljZSBwYXRj
aCA6KQo+ID4gPiBBbnkgcmVhc29uIGl0J3Mgbm90IG5lZWRlZCBpbiBfX2FyY2hfY21weGNoZ19t
YXNrZWQoKSwgYW5kIF9fYXJjaF9jbXB4Y2hnKCkgPwo+ID4gQ0FTIGlzIGEgY29uZGl0aW9uYWwg
QU1PLCB1bmxpa2UgeGNoZyAoU3RhbmQgQU1PKS4gQXJtNjQgaXMgd3JvbmcsIG9yCj4gPiB0aGV5
IGhhdmUgYSBwcm9ibGVtIHdpdGggdGhlIGhhcmR3YXJlLgo+Cj4gU29ycnksIEkgd2FzIHVuYWJs
ZSB0byBmdWxseSB1bmRlcnN0YW5kIHRoZSByZWFzb24gaGVyZS4KPgo+IFlvdSBzdWdnZXN0IHRo
YXQgdGhlIFBSRUZFVENILlcgd2FzIGluc2VydGVkIG9uIHhjaGdfbWFza2VkIGJlY2F1c2UgaXQg
d2lsbAo+IGFsd2F5cyBzd2l0Y2ggdGhlIHZhcmlhYmxlIChubyBjb21wYXJlLCBibGluZCBDQVMp
LCBidXQgbm90IG9uIGNtcHhjaGcuCj4KPiBJcyB0aGlzIGJlY2F1c2UgY21weGNoZyB3aWxsIGRl
cGVuZCBvbiBhIGNvbXBhcmUsIGFuZCB0aHVzIGl0IGRvZXMgbm90Cj4gZ2FyYW50ZWUgYSB3cml0
ZT8gc28gaXQgd291bGQgYmUgdW53aXNlIHRvIGFsd2F5cyBwcmVmZXRjaCBjYWNoZWxpbmUKWWVz
LCBpdCBoYXMgYSBjb21wYXJpc29uLCBzbyBhIHN0b3JlIG1heSBub3QgZXhpc3QgdGhlcmUuCgo+
IGV4Y2x1c2l2ZW5lc3MgZm9yIHRoaXMgY3B1LCB3aGVyZSBzaGFyZWQgc3RhdGUgd291bGQgYmUg
ZW5vdWdoLgo+IElzIHRoYXQgY29ycmVjdD8KWWVzLCBleGNsdXNpdmVuZXNzIHdvdWxkIGludmFs
aWRhdGUgb3RoZXIgaGFydHMnIGNhY2hlIGxpbmVzLgoKPgo+IFRoYW5rcyEKPiBMZW8KPgo+Cj4g
Pgo+ID4gPgo+ID4gPiBUaGFua3MhCj4gPiA+IExlbwo+ID4gPgo+ID4KPiA+Cj4gPiAtLQo+ID4g
QmVzdCBSZWdhcmRzCj4gPiAgR3VvIFJlbgo+ID4KPgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
