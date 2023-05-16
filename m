Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927E3C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vbvyo2aBci+gJlRBbjwKcAkfJD7xY/tp1r6rI4xuAgE=; b=PabI8kxxxmB1Cs
	IRVW6hYMqKMGfZE/sWtURPAi+G7D9ASsXI2euLIDF16JeOSKJBYHpEXjGYcPD8e+KTMGnzHMun0fu
	KRN8hxFJA3A2hXxgjkqHTw3xn+bPpF06IfYYjTAuS0AD4dF5gCHk6hIcfJeaLJPIpYNJQd1cP8AHo
	uu3ibhK6layM8aHWIgjbbaMgEcI/k81PMFNwewktm7h+A0ESamkfz3iNSHn/QFEsXTKvqteStrifC
	0ssbjvBhwg9rOWL1kPQdweC82VkmZ87e05nFj+g2QW/5Vtkk+d8IM8AgBpoif+zCdaJ5ud9GsxKc2
	QyqavbCY4fIF3h8dbeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyos7-004brC-1a;
	Tue, 16 May 2023 07:13:23 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyos4-004bpm-0w
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 07:13:21 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f14f266b72so13654551e87.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 May 2023 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1684221198; x=1686813198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1ltoygmt4h8PKqzsElxWFoV93Ld5KS1X9hW+I7uw4M=;
        b=Hpb5+xL18lOc7d+ldqR0Po6N7TcZvKtvITvmqIPtYR7nTJNVEvLSuQQxL7GIlj+cXp
         XHzGkPL+93wkF0N3laTMKX41kWCaCSBmrUcwDd1hBndkw0WEPcFd2DARlTUETwDeiDgX
         PYfDDgE8mUEd3R/oaNkp4H21OwRl5PCHRX6E2s9SUIIeyAmYUELzexLQhqEoJtJutq18
         VSoK2LWiq3W1rUaYGEs49SQpX7a9h+52Nolwlqvu5fzWSIlNbQzlXZOM/xKERcWbyG2g
         kruykRLM2Bfj6NuCazs9nzswL/jfxYUHMRW5e1jfSAv8w6ubgW0e1CrKOjMUP5vz+pkA
         HmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684221198; x=1686813198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1ltoygmt4h8PKqzsElxWFoV93Ld5KS1X9hW+I7uw4M=;
        b=KZhsl2SWWPi+j2SZufT3ATvD/5IOLIjR/k9gz8hUMEuBYhUUv8p4ixY5JjHSN+C/45
         1e5Q4STmy3WkA+Y6FLPU/0m8+yNCKrud8SVJ85sRyZE3yYBab9sJsfxZsJf4X2S71YXI
         iSTjw+LwSkOjGo8lsnzr4bt0zD3bIdnBFdRJqS2YenPhXvTS4bObUeYmu6Wx0g7ZOND/
         iAPdpNorqWfrTsT4MDaLdzDLomVeJO9T6erdaVf1Fk20JdbqFgxgmJEG/EA+Vc99npXq
         rvzhWGDRinrwLtPBTIZeCd32DHay2isX5Xf7ktuNRvqi/ksY+v0j4JzAHEP8FRrabYS0
         xYwg==
X-Gm-Message-State: AC+VfDynI4RxaMt/rKdsBcWoeJ6nKzWTKjPOIWlGoZ0PjnZTyf/wimSa
	1l2gd7ZsVqMOtrXjyV//UisM/3jOpgi1NwI0kj/Ymg==
X-Google-Smtp-Source: ACHHUZ6aMCwjQC6ws5qn/ylLBDN8BiDarT5DnOzn+uotya5OHFqLcjh/BN3GDOkAJ8WU81Epp1OHeTk+KVTUJLrug4I=
X-Received: by 2002:ac2:446c:0:b0:4f0:20bb:f48a with SMTP id
 y12-20020ac2446c000000b004f020bbf48amr6550635lfl.59.1684221198219; Tue, 16
 May 2023 00:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <20230509103033.11285-1-andy.chiu@sifive.com> <20230509103033.11285-21-andy.chiu@sifive.com>
 <87ttwdhljn.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87ttwdhljn.fsf@all.your.base.are.belong.to.us>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 16 May 2023 15:13:07 +0800
Message-ID: <CABgGipW7PJLjxtx++-FJaOop6HqBg8o7XDKycg5hysD+eZd4rA@mail.gmail.com>
Subject: Re: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace
 vector management
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, 
	David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Joey Gouly <joey.gouly@arm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, greentime.hu@sifive.com, 
	Albert Ou <aou@eecs.berkeley.edu>, Stefan Roesch <shr@devkernel.io>, vineetg@rivosinc.com, 
	Josh Triplett <josh@joshtriplett.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Jordy Zomer <jordyzomer@google.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Vincent Chen <vincent.chen@sifive.com>, 
	"Eric W. Biederman" <ebiederm@xmission.com>, Andrew Morton <akpm@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_001320_342949_14990578 
X-CRM114-Status: GOOD (  31.85  )
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

T24gTW9uLCBNYXkgMTUsIDIwMjMgYXQgNzozOOKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3Jp
dGVzOgo+Cj4gPiBUaGlzIHBhdGNoIGFkZCB0d28gcmlzY3Ytc3BlY2lmaWMgcHJjdGxzLCB0byBh
bGxvdyB1c2VzcGFjZSBjb250cm9sIHRoZQo+ID4gdXNlIG9mIHZlY3RvciB1bml0Ogo+Cj4gQSBt
b3JlIGdlbmVyYWwgcXVlc3Rpb247IEkga25vdyB0aGF0IGl0J3Mgb25seSB4ODYgdGhhdCBpbXBs
ZW1lbnRzCj4gYXJjaF9wcmN0bCgpLCBhbmQgdGhhdCBhcm02NCBhZGRlZCB0aGUgU1ZFIHByY3Rs
IGtlcm5lbC9zeXMuYyAtLSBidXQgaXMKPiB0aGVyZSBhIHJlYXNvbiBub3QgdG8gaGF2ZSBhbiBh
cmNoLXNwZWNpZmljIHByY3RsIGZvciByaXNjdj8KCkkgZGlkbid0IG5vdGljZSB0aGF0IHRoZXJl
IGlzIGFuIGFyY2gtc3BlY2lmaWMgcHJjdGwgZm9yIHg4NiB3aGVuCmltcGxlbWVudGluZyB0aGlz
LiBNYWludGFpbmluZyBhIHNlcGFyYXRlIHByY3RsIG91dCBvZiB0aGUgZ2VuZXJpYyBvbmUKdG8g
ZG8gYXJjaC1zcGVjaWZpYyBjb25maWd1cmF0aW9ucyBtYWtlcyBjb2RlIGVsZWdhbnQuIEJ1dCB0
aGUgcm9sZSBvZgpnZW5lcmljIHByY3RsIGhhcyBiZWNvbWluZyBtb3JlICJhcmNoLXNwZWNpZmlj
IiBkdWUgdG8gcG9ydGluZyBvZgphcmNoaXRlY3R1cmVzLiBGb3IgZXhhbXBsZSwgdGhlIGdlbmVy
aWMgcHJjdGwgYXJlIHVzZWQgYnkgYXJtNjQgZm9yClNWRS9TTUUgY29uZmlncywgd2hpY2ggYXBw
YXJlbnRseSBhcmUgYXJjaC1zcGVjaWZpYy4gQW5kIGFkZGluZyBhCnN5c2NhbCBmb3IgYSBzaW1p
bGFyIGludGVyZmFjZSBtaWdodCBjb25mdXNlIHVzZXJzIGlmIHRoZSBsaW5lIGJldHdlZW4KdGhl
IHR3byBpcyBub3QgY2xlYXIuCgpJIHRoaW5rIHRoZSBxdWVzdGlvbiB3b3VsZCBiZSBtb3JlIGxp
a2UgIklzIGl0IHdvcnRoIGFkZGluZyBhCmFyY2hfcHJjdGwgd2hlbiB0aGUgZ2VuZXJpYyBwcmN0
bCBoYXMgYWxyZWFkeSBiZWVuIHVzZWQgYnkgb3RoZXIKYXJjaGl0ZWN0dXJlcyBmb3IgYXJjaC1z
cGVjaWZpYyBjb25maWd1cmF0aW9ucz8iLgoKPgo+ID4gICogUFJfUklTQ1ZfVl9TRVRfQ09OVFJP
TDogY29udHJvbCB0aGUgcGVybWlzc2lvbiB0byB1c2UgVmVjdG9yIGF0IG5leHQsCj4gPiAgICBv
ciBhbGwgZm9sbG93aW5nIGV4ZWN2ZSBmb3IgYSB0aHJlYWQuIFR1cm5pbmcgb2ZmIGEgdGhyZWFk
J3MgVmVjdG9yCj4gPiAgICBsaXZlIGlzIG5vdCBwb3NzaWJsZSBzaW5jZSBsaWJyYXJpZXMgbWF5
IGhhdmUgcmVnaXN0ZXJlZCBpZnVuYyB0aGF0Cj4gPiAgICBtYXkgZXhlY3V0ZSBWZWN0b3IgaW5z
dHJ1Y3Rpb25zLgo+ID4gICogUFJfUklTQ1ZfVl9HRVRfQ09OVFJPTDogZ2V0IHRoZSBzYW1lIHBl
cm1pc3Npb24gc2V0dGluZyBmb3IgdGhlCj4gPiAgICBjdXJyZW50IHRocmVhZCwgYW5kIHRoZSBz
ZXR0aW5nIGZvciBmb2xsb3dpbmcgZXhlY3ZlKHMpLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
ZHkgQ2hpdSA8YW5keS5jaGl1QHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogR3JlZW50aW1l
IEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBWaW5jZW50IENo
ZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wcm9jZXNzb3IuaCB8ICAxMyArKysrCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZWN0b3IuaCAgICB8ICAgNCArKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYyAg
ICAgICAgfCAgIDEgKwo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5jICAgICAgICAgfCAx
MDggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1
LmMgICAgICAgICAgICAgIHwgICAyICsKPiA+ICBpbmNsdWRlL3VhcGkvbGludXgvcHJjdGwuaCAg
ICAgICAgIHwgIDExICsrKwo+ID4gIGtlcm5lbC9zeXMuYyAgICAgICAgICAgICAgICAgICAgICAg
fCAgMTIgKysrKwo+ID4gIDcgZmlsZXMgY2hhbmdlZCwgMTUxIGluc2VydGlvbnMoKykKPiA+Cj4g
PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCBiL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiA+IGluZGV4IDM4ZGVkOGM1ZjIwNy4uNzky
NjFkYTc0Y2ZkIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNz
b3IuaAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ID4gQEAg
LTQwLDYgKzQwLDcgQEAgc3RydWN0IHRocmVhZF9zdHJ1Y3Qgewo+ID4gICAgICAgdW5zaWduZWQg
bG9uZyBzWzEyXTsgICAgLyogc1swXTogZnJhbWUgcG9pbnRlciAqLwo+ID4gICAgICAgc3RydWN0
IF9fcmlzY3ZfZF9leHRfc3RhdGUgZnN0YXRlOwo+ID4gICAgICAgdW5zaWduZWQgbG9uZyBiYWRf
Y2F1c2U7Cj4gPiArICAgICB1bnNpZ25lZCBsb25nIHZzdGF0ZV9jdHJsOwo+ID4gICAgICAgc3Ry
dWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgdnN0YXRlOwo+ID4gIH07Cj4gPgo+ID4gQEAgLTgzLDYg
Kzg0LDE4IEBAIGV4dGVybiB2b2lkIHJpc2N2X2ZpbGxfaHdjYXAodm9pZCk7Cj4gPiAgZXh0ZXJu
IGludCBhcmNoX2R1cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0
IHRhc2tfc3RydWN0ICpzcmMpOwo+ID4KPiA+ICBleHRlcm4gdW5zaWduZWQgbG9uZyBzaWduYWxf
bWluc2lnc3Rrc3ogX19yb19hZnRlcl9pbml0Owo+ID4gKwo+ID4gKyNpZmRlZiBDT05GSUdfUklT
Q1ZfSVNBX1YKPiA+ICsvKiBVc2Vyc3BhY2UgaW50ZXJmYWNlIGZvciBQUl9SSVNDVl9WX3tTRVQs
R0VUfV9WUyBwcmN0bCgpczogKi8KPiA+ICsjZGVmaW5lIFJJU0NWX1ZfU0VUX0NPTlRST0woYXJn
KSAgICAgcmlzY3Zfdl92c3RhdGVfY3RybF9zZXRfY3VycmVudChhcmcpCj4gPiArI2RlZmluZSBS
SVNDVl9WX0dFVF9DT05UUk9MKCkgICAgICAgICAgICAgICAgcmlzY3Zfdl92c3RhdGVfY3RybF9n
ZXRfY3VycmVudCgpCj4gPiArZXh0ZXJuIHVuc2lnbmVkIGludCByaXNjdl92X3ZzdGF0ZV9jdHJs
X3NldF9jdXJyZW50KHVuc2lnbmVkIGxvbmcgYXJnKTsKPiA+ICtleHRlcm4gdW5zaWduZWQgaW50
IHJpc2N2X3ZfdnN0YXRlX2N0cmxfZ2V0X2N1cnJlbnQodm9pZCk7Cj4gPiArI2Vsc2UgLyogIUNP
TkZJR19SSVNDVl9JU0FfViAqLwo+ID4gKyNkZWZpbmUgUklTQ1ZfVl9TRVRfQ09OVFJPTChhcmcp
ICAgICAoLUVJTlZBTCkKPiA+ICsjZGVmaW5lIFJJU0NWX1ZfR0VUX0NPTlRST0woKSAgICAgICAg
ICAgICAgICAoLUVJTlZBTCkKPgo+IFRoZSBlbHNlLWNsYXVzZSBpcyBub3QgbmVlZGVkIChzZWUg
bXkgY29tbWVudCBiZWxvdyBmb3Iga2VybmVsL3N5cy5jKSwKPiBhbmQgY2FuIGJlIHJlbW92ZWQu
Cj4KPiA+ICsjZW5kaWYgLyogQ09ORklHX1JJU0NWX0lTQV9WICovCj4gPiArCj4gPiAgI2VuZGlm
IC8qIF9fQVNTRU1CTFlfXyAqLwo+ID4KPiA+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9QUk9DRVNT
T1JfSCAqLwo+Cj4gPiBkaWZmIC0tZ2l0IGEva2VybmVsL3N5cy5jIGIva2VybmVsL3N5cy5jCj4g
PiBpbmRleCAzMzlmZWUzZWZmNmEuLjQxMmQyYzEyNjA2MCAxMDA2NDQKPiA+IC0tLSBhL2tlcm5l
bC9zeXMuYwo+ID4gKysrIGIva2VybmVsL3N5cy5jCj4gPiBAQCAtMTQwLDYgKzE0MCwxMiBAQAo+
ID4gICNpZm5kZWYgR0VUX1RBR0dFRF9BRERSX0NUUkwKPiA+ICAjIGRlZmluZSBHRVRfVEFHR0VE
X0FERFJfQ1RSTCgpICAgICAgICAgICAgICAoLUVJTlZBTCkKPiA+ICAjZW5kaWYKPiA+ICsjaWZu
ZGVmIFBSX1JJU0NWX1ZfU0VUX0NPTlRST0wKPiA+ICsjIGRlZmluZSBQUl9SSVNDVl9WX1NFVF9D
T05UUk9MKGEpICAgKC1FSU5WQUwpCj4gPiArI2VuZGlmCj4gPiArI2lmbmRlZiBQUl9SSVNDVl9W
X0dFVF9DT05UUk9MCj4gPiArIyBkZWZpbmUgUFJfUklTQ1ZfVl9HRVRfQ09OVFJPTCgpICAgICgt
RUlOVkFMKQo+Cj4gQm90aCBTRVQvR0VUIGFib3ZlIHNob3VsZCBiZSBSSVNDVl9WX3tTRVQsR0VU
fV9DT05UUk9MICh3aXRob3V0IHRoZQo+IHByZWZpeCAiUFJfIiksIGFuZCBub3RoaW5nIGVsc2Us
IG90aGVyd2lzZS4uLgo+Cj4gPiArI2VuZGlmCj4gPgo+ID4gIC8qCj4gPiAgICogdGhpcyBpcyB3
aGVyZSB0aGUgc3lzdGVtLXdpZGUgb3ZlcmZsb3cgVUlEIGFuZCBHSUQgYXJlIGRlZmluZWQsIGZv
cgo+ID4gQEAgLTI3MDgsNiArMjcxNCwxMiBAQCBTWVNDQUxMX0RFRklORTUocHJjdGwsIGludCwg
b3B0aW9uLCB1bnNpZ25lZCBsb25nLCBhcmcyLCB1bnNpZ25lZCBsb25nLCBhcmczLAo+ID4gICAg
ICAgICAgICAgICBlcnJvciA9ICEhdGVzdF9iaXQoTU1GX1ZNX01FUkdFX0FOWSwgJm1lLT5tbS0+
ZmxhZ3MpOwo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+ICAjZW5kaWYKPiA+ICsgICAgIGNh
c2UgUFJfUklTQ1ZfVl9TRVRfQ09OVFJPTDoKPiA+ICsgICAgICAgICAgICAgZXJyb3IgPSBSSVND
Vl9WX1NFVF9DT05UUk9MKGFyZzIpOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAg
IGNhc2UgUFJfUklTQ1ZfVl9HRVRfQ09OVFJPTDoKPiA+ICsgICAgICAgICAgICAgZXJyb3IgPSBS
SVNDVl9WX0dFVF9DT05UUk9MKCk7Cj4gPiArICAgICAgICAgICAgIGJyZWFrOwo+Cj4KPiAuLi50
aGUgY2FzZSBoZXJlIHdpbGwgYmUgd2VpcmQuIDstKQoKWWVzLi4uIGZpeGluZyB0aGF0IG5vdwoK
Pgo+Cj4gQmrDtnJuCgpUaGFua3MsCkFuZHkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
