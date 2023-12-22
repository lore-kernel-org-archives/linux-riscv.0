Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA16C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNDVl/HQzA7GatMY58L9W7VezD6lubaX+DDeIgeEE9w=; b=4jQBCKAeYOULQn
	0WX5Kd+cznnHhru0fVlGmgcD0/Z+UAVgUZl+oBmhyEdteTWe6eCHuIjlYPpN6qZG/uKFRD/Aolwa0
	EIB1NKpzVB8NFqvEaLCS2M9ZlnSk7odjSZejlCoJJyUL3ndoj0UPZqxCLyKb82fCREar5ooHtyTrl
	gy+qI5vOSNQfQx7QAiY48YJaIvIqqthAiIjiW0mXMoCG8G2/W6WJCBmN110YAFK6yXG+/7jyENcmS
	2C7wJO9S3wDF/kd3RqTL9IgfqOw1DFeUy/VS2YuQOQaYdo7v5KIdhpwOhPJBjb5TjKcbn+xbPU9g7
	3n7QAftaGm31geoq8ylg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXHK-004qvm-2T;
	Fri, 22 Dec 2023 04:36:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGXHH-004qv5-2e
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:36:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 70725B8074E
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:36:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C091FC433C9
	for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 04:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703219809;
	bh=Te5JGcJNKzh3ANzMuyectWBxaT/iysM8QCyZ5K2Hrh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=koe2RXmSjttdemZ6j/XEEv02swfg+lC61GGR3qaMyqjlpoBXolrO5cJ5DBtXM6iKQ
	 M1AnHE/YwIf906yMEMvo08dTUQuw8KpfU/tdNX50DEpKKPTpB9mik8mW6KqPjtO8fv
	 r4ry90nT7ZFJZQfDrgN6AJEsWgv2l/1ypgTXUeqnbH3OFIT+ZdyclDgjX4Oolp/F3q
	 auzkYrXaxcObgxbDMD4mgP5iCHnkBu2Gp7KYiDELVRanb8oFTKXDZ9oSO6H97OW6fM
	 OcMegl3I/r+pSC3sK2yBxAkj/IQnvqn7Jm3Y2e+TLcEKwZqJG+iYEgtljba5QwE9hH
	 Q6Bb9ZuMfynEA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-50e67f70f34so548941e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 20:36:49 -0800 (PST)
X-Gm-Message-State: AOJu0Yylsc98lHW/OOwaeKg48FM9UgrsXUxACVvqBhfbyVQv7g073uFf
	S3GJIGPeHDxwLU4OBYF/wOHpSQ21jz3mT6xJ634=
X-Google-Smtp-Source: AGHT+IFVjodSUniTHu+2k6kW/vmTN/ZyQn53XbFWPbSVX6/AAmFvo5F//3IlWlUjh0E5BU/gpHrs34RMql9Zol116o8=
X-Received: by 2002:ac2:5df0:0:b0:50e:6a6f:b8a with SMTP id
 z16-20020ac25df0000000b0050e6a6f0b8amr86608lfq.2.1703219808000; Thu, 21 Dec
 2023 20:36:48 -0800 (PST)
MIME-Version: 1.0
References: <20231221154702.2267684-1-guoren@kernel.org> <20231221154702.2267684-3-guoren@kernel.org>
 <ZYUD4C1aXWt2oFJo@LeoBras> <ZYUK2zUHjYBL0zO7@ghost>
In-Reply-To: <ZYUK2zUHjYBL0zO7@ghost>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 22 Dec 2023 12:36:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQu6ezt-wdQeHfD81x8enTXxyFgZK70dLecRJ_+FJt04g@mail.gmail.com>
Message-ID: <CAJF2gTQu6ezt-wdQeHfD81x8enTXxyFgZK70dLecRJ_+FJt04g@mail.gmail.com>
Subject: Re: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Leonardo Bras <leobras@redhat.com>, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, alexghiti@rivosinc.com, 
	xiao.w.wang@intel.com, david@redhat.com, panqinglin2020@iscas.ac.cn, 
	rick.p.edgecombe@intel.com, willy@infradead.org, bjorn@rivosinc.com, 
	conor.dooley@microchip.com, cleger@rivosinc.com, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_203652_142812_92ABCB7B 
X-CRM114-Status: GOOD (  37.26  )
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

T24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMTI6MDTigK9QTSBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgRGVjIDIyLCAyMDIzIGF0IDEyOjM0
OjU2QU0gLTAzMDAsIExlb25hcmRvIEJyYXMgd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAyMSwgMjAy
MyBhdCAxMDo0Njo1OUFNIC0wNTAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gRnJv
bTogR3VvIFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBXaGVuIHRo
ZSB0YXNrIGlzIGluIENPTVBBVCBtb2RlLCB0aGUgYXJjaF9nZXRfbW1hcF9lbmQgc2hvdWxkIGJl
IDJHQiwKPiA+ID4gbm90IFRBU0tfU0laRV82NC4gVGhlIFRBU0tfU0laRSBoYXMgY29udGFpbmVk
IGlzX2NvbXBhdF9tb2RlKCkKPiA+ID4gZGV0ZWN0aW9uLCBzbyBjaGFuZ2UgdGhlIGRlZmluaXRp
b24gb2YgU1RBQ0tfVE9QX01BWCB0byBUQVNLX1NJWkUKPiA+ID4gZGlyZWN0bHkuCj4gPgo+ID4g
b2sKPiA+Cj4gPiA+Cj4gPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gPiA+IEZpeGVz
OiBhZGQyY2M2YjY1MTUgKCJSSVNDLVY6IG1tOiBSZXN0cmljdCBhZGRyZXNzIHNwYWNlIGZvciBz
djM5LHN2NDgsc3Y1NyIpCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51
eC5hbGliYWJhLmNvbT4KPiA+ID4gU2lnbmVkLW9mZi1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5l
bC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3Iu
aCB8IDYgKystLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+ID4g
aW5kZXggZjE5Zjg2MWNkYTU0Li4xZjUzOGZjNDQ0OGQgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gPiBAQCAtMTYsMTUgKzE2LDEzIEBACj4gPiA+Cj4gPiA+
ICAjaWZkZWYgQ09ORklHXzY0QklUCj4gPiA+ICAjZGVmaW5lIERFRkFVTFRfTUFQX1dJTkRPVyAo
VUwoMSkgPDwgKE1NQVBfVkFfQklUUyAtIDEpKQo+ID4gPiAtI2RlZmluZSBTVEFDS19UT1BfTUFY
ICAgICAgICAgICAgICBUQVNLX1NJWkVfNjQKPiA+ID4gKyNkZWZpbmUgU1RBQ0tfVE9QX01BWCAg
ICAgICAgICAgICAgVEFTS19TSVpFCj4gPgo+ID4gSXQgbWVhbnMgU1RBQ0tfVE9QX01BWCB3aWxs
IGJlIGluIDY0QklUOgo+ID4gLSBUQVNLX1NJWkVfMzIgaWYgY29tcGF0X21vZGU9eQo+ID4gLSBU
QVNLX1NJWkVfNjQgaWYgY29tcGF0X21vZGU9bgo+ID4KPiA+IE1ha2VzIHNlbnNlIGZvciBtZS4K
PiA+Cj4gPiA+Cj4gPiA+ICAjZGVmaW5lIGFyY2hfZ2V0X21tYXBfZW5kKGFkZHIsIGxlbiwgZmxh
Z3MpICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gPiAgKHsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+ICAgICB1bnNpZ25l
ZCBsb25nIG1tYXBfZW5kOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4g
ICAgIHR5cGVvZihhZGRyKSBfYWRkciA9IChhZGRyKTsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ID4gPiAtICAgaWYgKChfYWRkcikgPT0gMCB8fCAoSVNfRU5BQkxFRChDT05GSUdfQ09N
UEFUKSAmJiBpc19jb21wYXRfdGFzaygpKSkgXAo+ID4gPiAtICAgICAgICAgICBtbWFwX2VuZCA9
IFNUQUNLX1RPUF9NQVg7ICAgICAgICAgICAgICAgICAgICAgICBcCj4gPiA+IC0gICBlbHNlIGlm
ICgoX2FkZHIpID49IFZBX1VTRVJfU1Y1NykgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ID4g
KyAgIGlmICgoX2FkZHIpID09IDAgfHwgKF9hZGRyKSA+PSBWQV9VU0VSX1NWNTcpICAgICAgICAg
ICAgXAo+ID4gPiAgICAgICAgICAgICBtbWFwX2VuZCA9IFNUQUNLX1RPUF9NQVg7ICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gPiA+ICAgICBlbHNlIGlmICgoKChfYWRkcikgPj0gVkFfVVNFUl9T
VjQ4KSkgJiYgKFZBX0JJVFMgPj0gVkFfQklUU19TVjQ4KSkgXAo+ID4gPiAgICAgICAgICAgICBt
bWFwX2VuZCA9IFZBX1VTRVJfU1Y0ODsgICAgICAgICAgICAgICAgICAgICAgICBcCj4gPgo+ID4K
PiA+IEkgZG9uJ3QgdGhpbmsgSSBnb3QgdGhpcyBjaGFuZ2UsIG9yIGhvdyBpdCdzIGNvbm5lY3Rl
ZCB0byB0aGUgY29tbWl0IG1zZy4KPiA+Cj4gPiBCZWZvcmU6Cj4gPiAtIGFkZHIgPT0gMCwgb3Ig
YWRkciA+IDJeNTcsIG9yIGNvbXBhdDogbW1hcF9lbmQgPSBTVEFDS19UT1BfTUFYCj4gPiAtIDJe
NDggPCBhZGRyIDwgMl41NzogbW1hcF9lbmQgPSAyXjQ4Cj4gPiAtIDAgPCBhZGRyIDwgMl40OCA6
IG1tYXBfZW5kID0gMl4zOQo+ID4KPiA+IE5vdzoKPiA+IC0gYWRkciA9PSAwLCBvciBhZGRyID4g
Ml41NzogbW1hcF9lbmQgPSBTVEFDS19UT1BfTUFYCj4gPiAtIDJeNDggPCBhZGRyIDwgMl41Nzog
bW1hcF9lbmQgPSAyXjQ4Cj4gPiAtIDAgPCBhZGRyIDwgMl40OCA6IG1tYXBfZW5kID0gMl4zOQo+
ID4KPiA+IElJVUMgY29tcGF0IG1vZGUgYWRkciB3aWxsIGJlIDwgMl4zMiwgc28gd2lsbCBhbHdh
eXMgaGF2ZSBtbWFwX2VuZCA9IDJeMzkKPiA+IGlmIGFkZHIgIT0gMC4gSXMgdGhhdCBkZXNpcmVh
YmxlPwo+ID4gKGlmIG5vdCwgYWJvdmUgY2hhbmdlIGlzIHVubmVlZGVkKQo+Cj4gSSBhZ3JlZSwg
dGhpcyBjaGFuZ2UgZG9lcyBub3QgbWFrZSBzZW5zZSBmb3IgY29tcGF0IG1vZGUuIENvbXBhdCBt
b2RlCj4gc2hvdWxkIG5ldmVyIHJldHVybiBhbiBhZGRyZXNzIHRoYXQgaXMgZ3JlYXRlciB0aGFu
IDJeMzIsIGJ1dCB0aGlzCj4gY2hhbmdlIGFsbG93cyB0aGF0LgojZGVmaW5lIFNUQUNLX1RPUF9N
QVggVEFTS19TSVpFCiNkZWZpbmUgVEFTS19TSVpFICAgICAgIChpc19jb21wYXRfdGFzaygpID8g
VEFTS19TSVpFXzMyIDogVEFTS19TSVpFXzY0KQoKU28sIHRoaXMgY2hhbmdlIGxpbWl0cyBhbiBh
ZGRyZXNzIGluIDJeMzIgZm9yIGNvbXBhdCBtb2RlLCBhbmQgeW91cgpwYXRjaCBicm9rZSB0aGUg
cnVsZS4gU28gdGhhdCBpcyB3aHkgd2UgbmVlZCB0aGlzIHBhdGNoIHRvIGZpeCB1cC4KCgo+Cj4g
Pgo+ID4gQWxzbywgdW5yZWxhdGVkIHRvIHRoZSBjaGFuZ2U6Cj4gPiAtIDJeNDggPCBhZGRyIDwg
Ml41NzogbW1hcF9lbmQgPSAyXjQ4Cj4gPiBJcyB0aGUgYWJvdmUgY29ycmVjdD8KPiA+IEl0IGxv
b2tzIGxpa2UgaXQgc2hvdWxkIGJlIDJeNTcgaW5zdGVhZCwgYW5kIGEgbmV3IGlmIGNsYXVzZSBm
b3IKPiA+IDJeMzIgPCBhZGRyIDwgMl40OCBzaG91bGQgaGF2ZSBtbWFwX2VuZCA9IDJeNDguCj4K
PiBUaGF0IGlzIG5vdCB0aGUgY2FzZS4gSSBkb2N1bWVudGVkIHRoaXMgYmVoYXZpb3IgYW5kIHJl
YXNvbmluZyBpbgo+IERvY3VtZW50YXRpb24vYXJjaC9yaXNjdi92bS1sYXlvdXQucnN0IGluIHRo
ZSAiVXNlcnNwYWNlIFZBcyIgc2VjdGlvbi4KPgo+IEkgY2FuIHJlaXRlcmF0ZSBoZXJlIHRob3Vn
aC4gVGhlIGhpbnQgYWRkcmVzcyB0byBtbWFwIChkZWZpbmVkIGhlcmUgYXMKPiAiYWRkciIpIGlz
IHRoZSBtYXhpbXVtIHVzZXJzcGFjZSBhZGRyZXNzIHRoYXQgbW1hcCBzaG91bGQgcHJvdmlkZS4g
V2hhdAo+IHlvdSBhcmUgZGVzY3JpYmluZyBpcyBhIG1pbmltdW0uIFRoZSBwdXJwb3NlIG9mIHRo
aXMgY2hhbmdlIHdhcyB0byBhbGxvdwo+IGFwcGxpY2F0aW9ucyB0aGF0IGFyZSBub3QgY29tcGF0
aWJsZSB3aXRoIGEgbGFyZ2VyIHZpcnR1YWwgYWRkcmVzcyAoc3VjaAo+IGFzIGFwcGxpY2F0aW9u
cyBsaWtlIEphdmEgdGhhdCB1c2UgdGhlIHVwcGVyIGJpdHMgb2YgdGhlIFZBIHRvIHN0b3JlCj4g
ZGF0YSkgdG8gaGF2ZSBhIGNvbnNpc3RlbnQgd2F5IG9mIHNwZWNpZnlpbmcgaG93IG1hbnkgYml0
cyB0aGV5IHdvdWxkClllcywgSSBhZ3JlZSB3aXRoIHRoaXMgY2hhbmdlIGFuZCB1c2UgWmpwbSB3
aXRoIFBMRU49NDggdG8gb3B0aW1pemUKdGhlbSBpbiB0aGUgZnV0dXJlLgoKPiBsaWtlIHRvIGJl
IGxlZnQgZnJlZSBpbiB0aGUgVkEuIFRoaXMgcmVxdWlyZXMgdG8gdGFrZSB0aGUgbmV4dCBsb3dl
c3QKPiBhZGRyZXNzIHNwYWNlIHRvIGd1YXJ1bnRlZSB0aGF0IGFsbCBvZiB0aGUgbW9zdC1zaWdu
aWZpY2FudCBiaXRzIGxlZnQKPiBjbGVhciBpbiBoaW50IGFkZHJlc3MgZG8gbm90IGVuZCB1cCBw
b3B1bGF0ZWQgaW4gdGhlIHZpcnR1YWwgYWRkcmVzcwo+IHJldHVybmVkIGJ5IG1tYXAuCj4KPiAt
IENoYXJsaWUKPgo+ID4KPiA+IERvIEkgZ2V0IGl0IHdyb25nPwo+ID4KPiA+IChJIHdpbGwgc2Vu
ZCBhbiBSRkMgJ2ZpeGluZycgdGhlIGNvZGUgdGhlIHdheSBJIGFtIHdoaW5raW5nIGl0IHNob3Vs
ZCBsb29rCj4gPiBsaWtlKQo+ID4KPiA+IFRoYW5rcywKPiA+IExlbwo+ID4KPiA+Cj4gPgo+ID4K
PiA+Cj4gPiA+IC0tCj4gPiA+IDIuNDAuMQo+ID4gPgo+ID4KCgoKLS0gCkJlc3QgUmVnYXJkcwog
R3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
