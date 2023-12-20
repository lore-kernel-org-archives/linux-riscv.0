Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27ECC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 13:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9l2qkeMSYAs84mhlbxRSOZmmCGSh3coEA1ouxlG4J6s=; b=HAnvoDFS/WCQoc
	Owkv8iv7QsYvucVQl32HubaiBwemYbgu2M9+vDGhBKd7ACZFZNE7XeKEUHX7x51thuM4Op5NQXRrM
	c1cdNabdGKYgpwf7AwBt//1qvu/69hge/bnG9yfMeiiBHVbWb0u2ujm5zR1tFXTRls1yzAHZQ7+T6
	VIuzVScNQgPWhlL/SLLVLvUSxCbR8UfKOEf1xu4MVF6l0x3tffpJ419YG7yZ8Q/8MJYCiBjFkL7VN
	KjhuDdlYolwQvBiX22Ap8yn/zUCftXsFvVSPXju6YrOtpw/gE0J1YF2GzFtSqv/55YmD78Pg+llvP
	GlGcw079MlzymU2/9d+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwz9-00HZmr-11;
	Wed, 20 Dec 2023 13:51:43 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwz6-00HZja-0H;
	Wed, 20 Dec 2023 13:51:41 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2cc5ee69960so46768801fa.0;
        Wed, 20 Dec 2023 05:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703080296; x=1703685096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rei5fD9NGFINnaZoP+B7hv3sKvx8MD4zubiuSki3juc=;
        b=M70IMRhP6mQClXzKwzKWho7DWfqTqyYTa5QNTcy+DmgNvTa66I04vAKMqBHzm6hy4A
         049dGGZ72t4A2EfUghjEgYyxmXPVGFa5pESFaeJ3LsGVr+Q/+wwa/LQu9OiubnCuX9+S
         reBEP+gbNz5hzrDyzFUZ8Hk6MD61ZXU6D4mFGAn6ETAZUIp9RHR/ptw3xoClY7MCjrEH
         aG9Yla4TC6ztJEG+kYcBbTuG35PTss2tqMgBl653RACgn5sB6MEqqX3OzBE6R0KcT2cx
         oUIY+QD3kKfksktBfd//MjhXV8gW4LdQ06C0DRHDLGI3GAzG6hZKtwgF8q6ScL+pLVSy
         3MfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703080296; x=1703685096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rei5fD9NGFINnaZoP+B7hv3sKvx8MD4zubiuSki3juc=;
        b=In+eqT7/IOdDtUAY4XkraWcRZsRH2eK2wYEKJ9r7yphu3GrUeYAPZyuYHQhlxNVCH+
         5nHMOEFN4BfGxFfrjb4Vg7fYDm7wM0MVx/oqpu5kPfIcW/lH4Su1fOlIY6iykJLXmsrR
         mGZ94Mbdt3M2kKYqYWmH/bLe43bb0V8EFiXJILkIzsKJkugfBxxkRgfv8eMOoN2RktMi
         ZVDhHWNowdcU8rMxGOcEF6+q9REBuycrFSIwYtG5efWm66cMf/FtqB/8wjLwtiat9P2y
         mOpYupZkIorcCBGwr8OAh5kshuvlp3soqWsaK7s6xjKeUUH3Ye2OuW/5Gm1C/UlDdhLA
         BzuQ==
X-Gm-Message-State: AOJu0YzXm/RhbDsoAjVKRPY+oVe7QGFvrhdk1O5S4BNIENaPYk6MSzF9
	0gfxIwCGNXrA8L+PeMW+UmmOtoku5RKJfTzYdao=
X-Google-Smtp-Source: AGHT+IGZec52dGpUhRR0rOVEDoEhnbeYTYNEvPvXIC1fF5bOhuW6KuhADUDrozoxLytShIKBvr4qyyNNDjrfwgJW9ik=
X-Received: by 2002:a05:651c:1055:b0:2cc:8481:f21e with SMTP id
 x21-20020a05651c105500b002cc8481f21emr712056ljm.39.1703080295789; Wed, 20 Dec
 2023 05:51:35 -0800 (PST)
MIME-Version: 1.0
References: <cover.1702371136.git.haibo1.xu@intel.com> <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
 <8734vy832j.wl-maz@kernel.org> <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
 <f98879dc24f948f7a8a7b5374a32bc04@kernel.org>
In-Reply-To: <f98879dc24f948f7a8a7b5374a32bc04@kernel.org>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 20 Dec 2023 21:51:24 +0800
Message-ID: <CAJve8ona7g=LxW1YeRB_FqGodF973H=A3b2m8054gmzK=Z7_ww@mail.gmail.com>
Subject: Re: [PATCH v4 11/11] KVM: selftests: Enable tunning of err_margin_us
 in arch timer test
To: Marc Zyngier <maz@kernel.org>
Cc: Haibo Xu <haibo1.xu@intel.com>, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, Greentime Hu <greentime.hu@sifive.com>, 
	wchen <waylingii@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Heiko Stuebner <heiko@sntech.de>, Minda Chen <minda.chen@starfivetech.com>, 
	Samuel Holland <samuel@sholland.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Peter Xu <peterx@redhat.com>, Like Xu <likexu@tencent.com>, 
	Vipin Sharma <vipinsh@google.com>, 
	Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_055140_150374_C230D08D 
X-CRM114-Status: GOOD (  23.68  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgNTowMOKAr1BNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gMjAyMy0xMi0yMCAwNjo1MCwgSGFpYm8gWHUgd3JvdGU6Cj4g
PiBPbiBXZWQsIERlYyAyMCwgMjAyMyBhdCAyOjIy4oCvQU0gTWFyYyBaeW5naWVyIDxtYXpAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBPbiBUdWUsIDEyIERlYyAyMDIzIDA5OjMxOjIwICsw
MDAwLAo+ID4+IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPiB3cm90ZToKPiA+PiA+ID4g
QEAgLTIxNiw2ICsyMjEsOSBAQCBzdGF0aWMgYm9vbCBwYXJzZV9hcmdzKGludCBhcmdjLCBjaGFy
ICphcmd2W10pCj4gPj4gPiAgICAgICAgICAgICAgIGNhc2UgJ20nOgo+ID4+ID4gICAgICAgICAg
ICAgICAgICAgICAgIHRlc3RfYXJncy5taWdyYXRpb25fZnJlcV9tcyA9IGF0b2lfbm9uX25lZ2F0
aXZlKCJGcmVxdWVuY3kiLCBvcHRhcmcpOwo+ID4+ID4gICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4+ID4gKyAgICAgICAgICAgICBjYXNlICdlJzoKPiA+PiA+ICsgICAgICAgICAgICAg
ICAgICAgICB0ZXN0X2FyZ3MudGltZXJfZXJyX21hcmdpbl91cyA9IGF0b2lfbm9uX25lZ2F0aXZl
KCJFcnJvciBNYXJnaW4iLCBvcHRhcmcpOwo+ID4+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOwo+ID4+Cj4gPj4gU28geW91ciBlcnJvciBtYXJnaW4gaXMgYWx3YXlzIHVuc2lnbmVkLi4u
Cj4gPj4KPiA+Cj4gPiBUaGUgZXJyb3IgbWFyZ2luIHdhcyBzdXBwb3NlZCB0byBiZSBhIG5vbi1u
ZWdhdGl2ZSBbMCwgSU5UX01BWF0uCj4gPiAoTWF5IGJlIG5lZWQgdG8gZGVmaW5lIGEgTWF4IGZv
ciB0aGUgaW5wdXQsIGluc3RlYWQgb2YgSU5UX01BWCkKPiA+Cj4gPj4gPiAgICAgICAgICAgICAg
IGNhc2UgJ28nOgo+ID4+ID4gICAgICAgICAgICAgICAgICAgICAgIHRlc3RfYXJncy5jb3VudGVy
X29mZnNldCA9IHN0cnRvbChvcHRhcmcsIE5VTEwsIDApOwo+ID4+ID4gICAgICAgICAgICAgICAg
ICAgICAgIHRlc3RfYXJncy5yZXNlcnZlZCA9IDA7Cj4gPj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4gPj4gPiBpbmRleCA5NjgyNTdi
ODkzYTcuLmIxZDQwNWU3MTU3ZCAxMDA2NDQKPiA+PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9pbmNsdWRlL3RpbWVyX3Rlc3QuaAo+ID4+ID4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvdGltZXJfdGVzdC5oCj4gPj4gPiBAQCAtMjIsNiArMjIs
NyBAQCBzdHJ1Y3QgdGVzdF9hcmdzIHsKPiA+PiA+ICAgICAgIGludCBucl9pdGVyOwo+ID4+ID4g
ICAgICAgaW50IHRpbWVyX3BlcmlvZF9tczsKPiA+PiA+ICAgICAgIGludCBtaWdyYXRpb25fZnJl
cV9tczsKPiA+PiA+ICsgICAgIGludCB0aW1lcl9lcnJfbWFyZ2luX3VzOwo+ID4+Cj4gPj4gLi4u
IGV4Y2VwdCB0aGF0IHlvdSBhcmUgc3RvcmluZyBpdCBhcyBhIHNpZ25lZCB2YWx1ZS4gU29tZSBj
b25zaXN0ZW5jeQo+ID4+IHdvdWxkbid0IGh1cnQsIHJlYWxseSwgYW5kIHdvdWxkIGF2b2lkIGlz
c3VlcyB3aGVuIHBhc3NpbmcgbGFyZ2UKPiA+PiB2YWx1ZXMuCj4gPj4KPiA+Cj4gPiBZZXMsIGl0
J3MgbW9yZSBwcm9wZXIgdG8gdXNlIGFuIHVuc2lnbmVkIGludCBmb3IgdGhlIG5vbi1uZWdhdGl2
ZSBlcnJvcgo+ID4gbWFyZ2luLgo+ID4gU3RvcmluZyBhcyBzaWduZWQgaGVyZSBpcyBqdXN0IHRv
IGtlZXAgdGhlIHR5cGUgY29uc2lzdGVudCB3aXRoIHRoYXQKPiA+IG9mIHRpbWVyX3BlcmlvZF9t
cwo+ID4gc2luY2UgdGhlcmUgd2lsbCBiZSAnKycgb3BlcmF0aW9uIGluIG90aGVyIHBsYWNlcy4K
PiA+Cj4gPiAgICAgICAgIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9hYXJjaDY0L2FyY2hf
dGltZXIuYwo+ID4gICAgICAgICAvKiBTZXR1cCBhIHRpbWVvdXQgZm9yIHRoZSBpbnRlcnJ1cHQg
dG8gYXJyaXZlICovCj4gPiAgICAgICAgICB1ZGVsYXkobXNlY3NfdG9fdXNlY3ModGVzdF9hcmdz
LnRpbWVyX3BlcmlvZF9tcykgKwo+ID4gICAgICAgICAgICAgIHRlc3RfYXJncy50aW1lcl9lcnJf
bWFyZ2luX3VzKTsKPgo+IEJ1dCB0aGF0J3MgZXhhY3RseSB3aHkgdXNpbmcgYSBzaWduZWQgcXVh
bnRpdHkgaXMgd3JvbmcuCj4gV2hhdCBkb2VzIGl0IG1lYW4gdG8gaGF2ZSBhIGh1Z2UgKm5lZ2F0
aXZlKiBtYXJnaW4/Cj4KCkhpIE1hcmMsCgpJIGFncmVlIHRoYXQgbmVnYXRpdmUgdmFsdWVzIGFy
ZSBtZWFuaW5nbGVzcyBmb3IgdGhlIG1hcmdpbi4KSWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwg
dGhlIG5lZ2F0aXZlIG1hcmdpbiBzaG91bGQgYmUgZmlsdGVyZWQgYnkKYXNzZXJ0aW9uIGluIGF0
b2lfbm9uX25lZ2F0aXZlKCkuCgpUaGFua3MsCkhhaWJvCgo+IEkgZG9uJ3Qgc2VlIGhvdyB5b3Ug
Y2FuIGp1c3RpZnkgdGhpcy4KPgo+ICAgICAgICAgIE0uCj4gLS0KPiBKYXp6IGlzIG5vdCBkZWFk
LiBJdCBqdXN0IHNtZWxscyBmdW5ueS4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
