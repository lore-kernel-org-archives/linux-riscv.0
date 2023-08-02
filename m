Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1EACC001E0
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 01:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNJkhesAwc6BLz1cVvlrZwafH1CMpRJ0XiU/6v6vUv4=; b=1tOaMXM+xuQaew
	k6Hu7N65Mt4oxIf1DGXjxSTQOeFxElfORyb8TwGd+ly87Ta/hopTndUBo+h3DN6lsBktms15tGx+v
	z9HEwa0genFIsblAK8Dm3RfMbvRd+LZ28EKkobYYX1Y+W87wU587GMGSmZQ8pqw/OCf7crjmqg9A9
	UpJ+hnnx/HhfKKmfAXT0zAVLSxD+EecMd3ASGNk//2at7rO0jl5Hplhkk/WSafJEwRHuJSLPClHbJ
	4kqnwTNSP86S0zPum4xNC6tBPx0vwCWJf1Fdse6TJdqNbgbVL8h+//S52gwycEWHdFcsjy/ykwUNl
	47JtCYmZHmTcKIWTeRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR0zt-003jPD-0L;
	Wed, 02 Aug 2023 01:49:57 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR0zr-003jOn-08;
	Wed, 02 Aug 2023 01:49:56 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b95d5ee18dso96645681fa.1;
        Tue, 01 Aug 2023 18:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690940993; x=1691545793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osh2QzFqlR35dfQcM6kbuTsPkPVP7EKWxGwqrnyTeuE=;
        b=luv5rojCzLMutf0EdY5ggrtpaKLCla7/HLXFzwmgg3epBqLg6krc55npCFOJDq8J7s
         yS7NIP+SSgtkSVgvF2FahyaUXKiualiR5vAE3BaRNdCuezwhebQoxJCervRgsKwfh8jk
         CpHMcqLqfG65PEHWSr+bfGRZ/K5vAE8ao7j9Gb1L8zAWqSZpGsJuRDuem0/YjMq90sZJ
         9wGc6I3HTxKJfl9EjjXjx9n0AhOKn9PuBzpkZMXEoBnRV8gyib4QuF/K094s61wjMrLi
         izjX+FffITTKOghS7+L3eLUoVWjsuXJQArk/FrrwLOdXsZbwqYOW0gHj2qlDrXqEbjiv
         Htgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690940993; x=1691545793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=osh2QzFqlR35dfQcM6kbuTsPkPVP7EKWxGwqrnyTeuE=;
        b=NCdcC/oAzJhPbyENFXmcsGKjhphjytabr5NIcWFYOz74SsJHfJgsIIs4oGxw0OOpgX
         YGQY5rW2nM6yVbeExQUC/QvVZLIyoR9jkV9e+Pe+rVEBcJMMYIjwHXU1e+ppKEWbIjLn
         ZtlrHQNkOIFtvw4nB3bE3btULhqj8EBcim8d/ndbX4u1ltgx7pJubZnjbTAZCscerM9l
         HpOMW6im6lm1Kc5s38QO1r6KoxRZgP0IM4vCyh8gOpePTh+Hm3i7Lu9twzOksdePs8T6
         JNHiwWkMRj+DFeaGqvdMApRkvURyBPlqBhRGIctLNDhcjrQ32lzz5/cyJjqFE9jF5jFt
         gENQ==
X-Gm-Message-State: ABy/qLaBwi/AGkpMALxy/Qa4zai44r7Rp539R1lYUq+ocjZKWmi5+OpJ
	oXg9IJsq8le9Fn1pQby9j9OrSB7SvXZSsiRxiVM=
X-Google-Smtp-Source: APBJJlFPZxnrL0coWXV1wozSrGT9QV8qKhr1NGYaGxC33NM0EtZXQ7yT6tiSIfNED9fNzjzTa7o0vUY+Rf6umhSOp/U=
X-Received: by 2002:a2e:9457:0:b0:2b9:ea87:7448 with SMTP id
 o23-20020a2e9457000000b002b9ea877448mr3562252ljh.49.1690940993017; Tue, 01
 Aug 2023 18:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <7e9d2d5518375083f10c92a3d1acd98914f69fd8.1690364259.git.haibo1.xu@intel.com>
 <20230728-21d0e3ecb0d8916fd9d9bceb@orel> <ZMPR56RVgzI6s6Ik@google.com>
In-Reply-To: <ZMPR56RVgzI6s6Ik@google.com>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 2 Aug 2023 09:49:41 +0800
Message-ID: <CAJve8o=FO6hHmu=zthUDdyM7y2RN2VPRanCrBHuBJZeTPxV10Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] KVM: riscv: selftests: Add exception handling support
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, Haibo Xu <haibo1.xu@intel.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Colton Lewis <coltonlewis@google.com>, 
	Vipin Sharma <vipinsh@google.com>, Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_184955_084332_38D9E12B 
X-CRM114-Status: GOOD (  18.56  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgMTE6NTPigK9QTSBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1bCAyOCwgMjAyMywgQW5kcmV3
IEpvbmVzIHdyb3RlOgo+ID4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDM6MjA6MDZQTSArMDgw
MCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+ICt2b2lkIHZtX2luaXRfdHJhcF92ZWN0b3JfdGFibGVz
KHN0cnVjdCBrdm1fdm0gKnZtKTsKPiA+ID4gK3ZvaWQgdmNwdV9pbml0X3RyYXBfdmVjdG9yX3Rh
YmxlcyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ID4KPiA+IEkgdGhpbmsgd2Ugc2hvdWxkIHVz
ZSBhIGNvbW1vbiBuYW1lIGZvciB0aGVzZSBwcm90b3R5cGVzIHRoYXQgdGhlIG90aGVyCj4gPiBh
cmNoaXRlY3R1cmVzIGFncmVlIHRvIGFuZCB0aGVuIHB1dCB0aGVtIGluIGEgY29tbW9uIGhlYWRl
ci4gTXkgdm90ZSBmb3IKPiA+IHRoZSBuYW1pbmcgaXMsCj4KPiBKdXN0IGFsbG9jYXRlIHRoZSB0
YWJsZXMgaW4ga3ZtX2FyY2hfdm1fcG9zdF9jcmVhdGUoKS4gIEkndmUgYmVlbiBtZWFuaW5nIHRv
Cj4gY29udmVydCB4ODYgYW5kIEFSTSwgYnV0IGtlZXAgZ2V0dGluZyBkaXN0cmFjdGVkL3dheWxh
aWQgYnkgb3RoZXIgdGhpbmdzLgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsL1k4aENC
T25kWU1EOXpzRExAZ29vZ2xlLmNvbQo+Cj4gPiAgIHZvaWQgdm1faW5pdF92ZWN0b3JfdGFibGVz
KHN0cnVjdCBrdm1fdm0gKnZtKTsKPiA+ICAgdm9pZCB2Y3B1X2luaXRfdmVjdG9yX3RhYmxlcyhz
dHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUpOwo+ID4KPiA+ID4gKwo+ID4gPiArdHlwZWRlZiB2b2lkKCpo
YW5kbGVyX2ZuKShzdHJ1Y3QgZXhfcmVncyAqKTsKPiA+ID4gK3ZvaWQgdm1faW5zdGFsbF9leGNl
cHRpb25faGFuZGxlcihzdHJ1Y3Qga3ZtX3ZtICp2bSwgaW50IGVjLCBoYW5kbGVyX2ZuIGhhbmRs
ZXIpOwo+ID4KPiA+IEknZCBhbHNvIHB1dCB0aGlzIHR5cGVkZWYKPgo+IEFuZCByZW5hbWUgaXQg
dG8gKCpleGNlcHRpb25faGFuZGxlcl9mbikuCj4KPiA+IGFuZCBwcm90b3R5cGUgaW4gYSBjb21t
b24gaGVhZGVyICh3aXRoIHMvZWMvdmVjdG9yLyB0byB3aGF0IHlvdSBoYXZlIGhlcmUpCj4KPiBI
bW0sIHllYWgsIEkgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gbGV0IHZtX2luc3RhbGxfZXhjZXB0
aW9uX2hhbmRsZXIoKSBiZSB1c2VkCj4gZnJvbSBjb21tb24gY29kZS4gIHRoZSB2ZWN0b3IgdG8g
YmUgaW5zdGFsbGVkIGlzIGluaGVyZW50bHkgYXJjaCBzcGVjaWZpYywgYnV0Cj4gaXQgd291bGQg
YmUgZWFzeSBlbm91Z2ggZm9yIGEgdGVzdCB0byB1c2UgI2lmZGVmZmVyeSB0byBkZWZpbmUgdGhl
IGNvcnJlY3QgdmVjdG9yLgoKVGhhbmtzIGZvciB0aGUgc3VnZ2VzdGlvbi4gSSdsbCBoYXZlIGEg
dHJ5IHRvIGNvbnNvbGlkYXRlIHRoZXNlIGNvZGVzIGluIHYyLgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
