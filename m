Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC07C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 06:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnc9zUPOIx1iooXuUelP1eFXh+0k7tvm2qY/9UDVHmU=; b=ethYpeEvqvwnC5
	Ns1vut/I3KUAGeyxOPdlj0FwokG9E5wozRglp5OoSbCyKugVlpzbx5rPQQQsOdZkj6epa4sc0T+VX
	Xv7/Uc2VI+J+JRtSbveOySbiotqYZyE0YjNS7rNg83fSFfgNGbjqbfuYJck7hA/NMhwFqukDU8iMw
	onGq/thBVr3f/g13Jrfgr0t1Jhzrf/cwm8W1s0MmC9fZ7zlfWVZtl4dEZGHimK+/zIVZEpi0F0YOv
	o4sJsDroj+uwua2o4/awWdWsogqxJE/hFKl+Nj9Rqynw8zgZ2JEHqlVmykivQUrQaLVKJ9YJfxy8l
	uuEDRFsG7/jQEWFQiqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqPN-00GKnq-03;
	Wed, 20 Dec 2023 06:50:21 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqPJ-00GKn4-20;
	Wed, 20 Dec 2023 06:50:18 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2cc6acf5e3dso41571601fa.1;
        Tue, 19 Dec 2023 22:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703055015; x=1703659815; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IloV9gHlRpc9SD2YCXR7E/7T42jMVfD74Pty8sLbHvY=;
        b=XKn3OGL/EeJDBE05VHQnKsETEKI8ai+hloFNqqDiazmawwNzN0ssddn+14fNzNo12f
         vPrxVmzSkIacCx2ZNhVRVPdc3tU5DG4L4egCOTGysKC+WrIhO1gT+u92EArX4F9BYIij
         /ckhri9HkrpaomWU9+Zh5y3KTq9ls+wzTLRC0VY/SP3wUplN18MJFS5kur4vS7r1eB96
         Kj0jSUAamraqGsqqVHh/SL1urWdKi3YpG85DuNpgww07ndBvaHXkYZHF5k7U/5cFV/3W
         RnovcI+Ql4+E+DCCTAHHblt7EChzEKll+LhzoPtzcLk1r/majjij4IAdn864U+mxWlNC
         Q/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703055015; x=1703659815;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IloV9gHlRpc9SD2YCXR7E/7T42jMVfD74Pty8sLbHvY=;
        b=UOUtQfXyMIhbDBBBOZq0In5xSpWkYAT+Zwc6alX1G4UpQYEDa+TSxZHsfRNjp/hvi7
         Zkt5t6cgC36PkDA8B45sH1Noj/+K+bYjkpQdKj2P5ZNk7vuMbOVoILU6i1hyHrZpIp1y
         /iSwcDQh2IoYsCEhYHOnR1/oFymV+M7o6/LLRIHQ0wvVZMonxuzUlQ+O0EWqZOkxIjQT
         I/bO1ntZ8mhLxJeTXNhbnBp0zQUq+BxEKnddtBpUzMNT5RhPrabQ0/FXCz8jXJRYdTBx
         SYYuv9hlk2ItbMUOtk8GHULq/3evn/GrZhi96OPtR4354MW34D2uR3YJBEq3kBN5vECi
         Z+xw==
X-Gm-Message-State: AOJu0Yzpw5IOiOChrXEDmHXKXLPNrdj815VHI8OKk8QPRFens7uOcIL6
	ZCVmOUz/4HI5KF22VkJ+lTQNFsXJjj0SQnfdRyI=
X-Google-Smtp-Source: AGHT+IGyXIZ1XsWlabej49gCsPyJXlY+x34WunG9S1gzJ848CgF23IrFQFyfhwjo//9JKJAadF2riryatJZtvHVMNgc=
X-Received: by 2002:a2e:b0dc:0:b0:2cc:895c:5de3 with SMTP id
 g28-20020a2eb0dc000000b002cc895c5de3mr338259ljl.207.1703055014949; Tue, 19
 Dec 2023 22:50:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1702371136.git.haibo1.xu@intel.com> <0343a9e4bfa8011fbb6bca0286cee7eab1f17d5d.1702371136.git.haibo1.xu@intel.com>
 <8734vy832j.wl-maz@kernel.org>
In-Reply-To: <8734vy832j.wl-maz@kernel.org>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 20 Dec 2023 14:50:03 +0800
Message-ID: <CAJve8onc0WN5g98aOVBmJx15wFBAqfBKJ+ufoLY+oqYyVL+=3A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231219_225017_660421_27D47497 
X-CRM114-Status: GOOD (  14.48  )
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

T24gV2VkLCBEZWMgMjAsIDIwMjMgYXQgMjoyMuKAr0FNIE1hcmMgWnluZ2llciA8bWF6QGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCAxMiBEZWMgMjAyMyAwOTozMToyMCArMDAwMCwKPiBI
YWlibyBYdSA8aGFpYm8xLnh1QGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+IEBAIC0yMTYsNiArMjIx
LDkgQEAgc3RhdGljIGJvb2wgcGFyc2VfYXJncyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+ID4g
ICAgICAgICAgICAgICBjYXNlICdtJzoKPiA+ICAgICAgICAgICAgICAgICAgICAgICB0ZXN0X2Fy
Z3MubWlncmF0aW9uX2ZyZXFfbXMgPSBhdG9pX25vbl9uZWdhdGl2ZSgiRnJlcXVlbmN5Iiwgb3B0
YXJnKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAg
Y2FzZSAnZSc6Cj4gPiArICAgICAgICAgICAgICAgICAgICAgdGVzdF9hcmdzLnRpbWVyX2Vycl9t
YXJnaW5fdXMgPSBhdG9pX25vbl9uZWdhdGl2ZSgiRXJyb3IgTWFyZ2luIiwgb3B0YXJnKTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPgo+IFNvIHlvdXIgZXJyb3IgbWFyZ2luIGlz
IGFsd2F5cyB1bnNpZ25lZC4uLgo+CgpUaGUgZXJyb3IgbWFyZ2luIHdhcyBzdXBwb3NlZCB0byBi
ZSBhIG5vbi1uZWdhdGl2ZSBbMCwgSU5UX01BWF0uCihNYXkgYmUgbmVlZCB0byBkZWZpbmUgYSBN
YXggZm9yIHRoZSBpbnB1dCwgaW5zdGVhZCBvZiBJTlRfTUFYKQoKPiA+ICAgICAgICAgICAgICAg
Y2FzZSAnbyc6Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgdGVzdF9hcmdzLmNvdW50ZXJfb2Zm
c2V0ID0gc3RydG9sKG9wdGFyZywgTlVMTCwgMCk7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAg
dGVzdF9hcmdzLnJlc2VydmVkID0gMDsKPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vaW5jbHVkZS90aW1lcl90ZXN0LmggYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9rdm0vaW5jbHVkZS90aW1lcl90ZXN0LmgKPiA+IGluZGV4IDk2ODI1N2I4OTNhNy4uYjFkNDA1
ZTcxNTdkIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1
ZGUvdGltZXJfdGVzdC5oCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vaW5j
bHVkZS90aW1lcl90ZXN0LmgKPiA+IEBAIC0yMiw2ICsyMiw3IEBAIHN0cnVjdCB0ZXN0X2FyZ3Mg
ewo+ID4gICAgICAgaW50IG5yX2l0ZXI7Cj4gPiAgICAgICBpbnQgdGltZXJfcGVyaW9kX21zOwo+
ID4gICAgICAgaW50IG1pZ3JhdGlvbl9mcmVxX21zOwo+ID4gKyAgICAgaW50IHRpbWVyX2Vycl9t
YXJnaW5fdXM7Cj4KPiAuLi4gZXhjZXB0IHRoYXQgeW91IGFyZSBzdG9yaW5nIGl0IGFzIGEgc2ln
bmVkIHZhbHVlLiBTb21lIGNvbnNpc3RlbmN5Cj4gd291bGRuJ3QgaHVydCwgcmVhbGx5LCBhbmQg
d291bGQgYXZvaWQgaXNzdWVzIHdoZW4gcGFzc2luZyBsYXJnZQo+IHZhbHVlcy4KPgoKWWVzLCBp
dCdzIG1vcmUgcHJvcGVyIHRvIHVzZSBhbiB1bnNpZ25lZCBpbnQgZm9yIHRoZSBub24tbmVnYXRp
dmUgZXJyb3IgbWFyZ2luLgpTdG9yaW5nIGFzIHNpZ25lZCBoZXJlIGlzIGp1c3QgdG8ga2VlcCB0
aGUgdHlwZSBjb25zaXN0ZW50IHdpdGggdGhhdApvZiB0aW1lcl9wZXJpb2RfbXMKc2luY2UgdGhl
cmUgd2lsbCBiZSAnKycgb3BlcmF0aW9uIGluIG90aGVyIHBsYWNlcy4KCiAgICAgICAgdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2FhcmNoNjQvYXJjaF90aW1lci5jCiAgICAgICAgLyogU2V0
dXAgYSB0aW1lb3V0IGZvciB0aGUgaW50ZXJydXB0IHRvIGFycml2ZSAqLwogICAgICAgICB1ZGVs
YXkobXNlY3NfdG9fdXNlY3ModGVzdF9hcmdzLnRpbWVyX3BlcmlvZF9tcykgKwogICAgICAgICAg
ICAgdGVzdF9hcmdzLnRpbWVyX2Vycl9tYXJnaW5fdXMpOwoKVGhhbmtzLApIYWlibwoKPiAgICAg
ICAgIE0uCj4KPiAtLQo+IFdpdGhvdXQgZGV2aWF0aW9uIGZyb20gdGhlIG5vcm0sIHByb2dyZXNz
IGlzIG5vdCBwb3NzaWJsZS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
