Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8B0E6F064
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yNveXTqWtRWf2zU1sC1qMPv4zkCHr0EWulQzcyysJJg=; b=Iob6fvUN0Tf0KNtye6uBZthEbK
	/wWAeinHXfTAcFuoIx/mR6tj5bn24+xUNc4glcGHIuhDYagpMz2o0QQfgAjpkTlfOYn69mliinryh
	Qfr08ZfyjMA5KLTsKKpNHPImNrd2U26RDs05/VkItNrJhJWzY6ZxPUb9i+GQfct8vCNE5QA98/3A0
	Td7JKndjVrahzIiEYlkUTY8t9QfkK8o+FAlOf0G9sWS4Yd4U4vMmFDvhPMtuAXja3eiaZ4fopTVnd
	baDGpeQEK/qMc7pdi02kp1T9iG3pN1q27cx9oSDxF03xlBXRDC98/vZFyea63Kbk587FTUFPT1gs0
	t7pzHYFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szP-00000007OtV-0pEX;
	Fri, 01 Nov 2024 14:51:03 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6swV-00000007OHm-1jeH
	for linux-riscv@lists.infradead.org;
	Fri, 01 Nov 2024 14:48:05 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7eb0a32fc5aso1949246a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 01 Nov 2024 07:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730472482; x=1731077282; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/DE0DbUg8M7Q/DJxS90r+0tog95n4HSr4HfODo/BC0=;
        b=uIfBkFwPo7Pm7HapRUguHhvH1e/htc6TBMkyypFvi4J1TiCz+ylRdncdkmMkzr7794
         FT4HpJmhWuWNyXd1+7nqQq48PWZw70MMmQE9Byyg55skmXxwZLTsTwXjogdkI7yitiyR
         v8vcX18bOkLYwNhJ6hDrjuoS7uRSuVAsSmo5lOazEGOOys2I+jC4uIh2W3i30C9/XkmW
         fRStryX3V356K4WSpKc3YGfmHhH7oPCywyjjqVPH84EjqGnAcEmM6XHaZb43e+w/h0ju
         5B07WRi4aVWR2Yxh3PPemjkZ+Vxb3RzmavepWb8i2J3ybbwdjEOXx5LhqxwgWOflUHMp
         Y9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730472482; x=1731077282;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G/DE0DbUg8M7Q/DJxS90r+0tog95n4HSr4HfODo/BC0=;
        b=wc0+1CIcoWE/bRAV17v4w3DbMpsWiouIeNasVPWzyk45Z6CjJt8GoBIVcEXDhibfkD
         FOnXaz9EF5uDmVE6ncQsUr8oBJ5QXdE32OHnWxVAzBE7R9AeL2AOWKDhTBHOe8gdHvzH
         W2zbpt5Wcn0SxZQnSTQC44P/5zvwxyGqnxC8PoTcS9v265QNvb3hkqMJerPu6Q+t0SVf
         uCF7sjsx8iEo540ihqFqCnG1eawtbyepMhsfVpUVGGjQq6i8tsY60vfzPqGBKnUzPT/T
         kG8CTedNZYfR/xV8AjJEhRx6i2yg2gWy5kl8tQK9FaoM8KjOLUAYcmnwa2qxb43P2/iU
         VqJQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1arw+AKr3s5oZrC1nFjR0PDMN04ox8H4air+klNs0/6rS8fhV2qfqekpM2JlHtjI05xY/zpZ+EKyk2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe3tlKXKOxA2pBqhkgNYMks1Rb/P1Fo1GdwRzCfBjVUxXNO8kC
	BfHiN3qIuqezVwUq17Z38wgFejK/yuAcPMNPpeh85SWEmZbjiUdp6//BWqHfJIcNWzTYY+ni6Xo
	8CQ==
X-Google-Smtp-Source: AGHT+IHIf47dwb0nbkXT8QGaJrWq+fHjP6RSYp5sBCxZxmiVg/IHgboRnjvSBKMyLIM+q34Z1vnYxW9f4KA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:fa55:0:b0:7ea:83fc:1f0c with SMTP id
 41be03b00d2f7-7edd7c3149dmr31512a12.5.1730472481723; Fri, 01 Nov 2024
 07:48:01 -0700 (PDT)
Date: Fri, 1 Nov 2024 07:48:00 -0700
In-Reply-To: <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
Message-ID: <ZyTpwwm0s89iU9Pk@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_074803_465310_E794766D 
X-CRM114-Status: GOOD (  18.40  )
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

T24gRnJpLCBOb3YgMDEsIDIwMjQsIE1hcmsgQnJvd24gd3JvdGU6Cj4gT24gV2VkLCBPY3QgMDks
IDIwMjQgYXQgMDg6NDk6NDJBTSAtMDcwMCwgU2VhbiBDaHJpc3RvcGhlcnNvbiB3cm90ZToKPiA+
IFJldHVybiBhIHVpbnQ2NF90IGZyb20gdmNwdV9nZXRfcmVnKCkgaW5zdGVhZCBvZiBoYXZpbmcg
dGhlIGNhbGxlciBwcm92aWRlCj4gPiBhIHBvaW50ZXIgdG8gc3RvcmFnZSwgYXMgbm9uZSBvZiB0
aGUgdmNwdV9nZXRfcmVnKCkgdXNhZ2UgaW4gS1ZNIHNlbGZ0ZXN0cwo+ID4gYWNjZXNzZXMgYSBy
ZWdpc3RlciBsYXJnZXIgdGhhbiA2NCBiaXRzLCBhbmQgdmNwdV9zZXRfcmVnKCkgb25seSBhY2Nl
cHRzIGEKPiA+IDY0LWJpdCB2YWx1ZS4gIElmIGEgdXNlIGNhc2UgY29tZXMgYWxvbmcgdGhhdCBu
ZWVkcyB0byBnZXQgYSByZWdpc3RlciB0aGF0Cj4gPiBpcyBsYXJnZXIgdGhhbiA2NCBiaXRzLCB0
aGVuIGEgdXRpbGl0eSBjYW4gYmUgYWRkZWQgdG8gYXNzZXJ0IHN1Y2Nlc3MgYW5kCj4gPiB0YWtl
IGEgdm9pZCBwb2ludGVyLCBidXQgdW50aWwgdGhlbiwgZm9yY2luZyBhbiBvdXQgcGFyYW0geWll
bGRzIHVnbHkgY29kZQo+ID4gYW5kIHByZXZlbnRzIGZlZWRpbmcgdGhlIG91dHB1dCBvZiB2Y3B1
X2dldF9yZWcoKSBpbnRvIHZjcHVfc2V0X3JlZygpLgo+IAo+IFRoaXMgY29tbWl0LCB3aGljaCBp
cyBpbiB0b2RheSdzIC1uZXh0IGFzIDVjNmM3YjcxYTQ1YzljLCBicmVha3MgdGhlCj4gYnVpbGQg
b24gYXJtNjQ6Cj4gCj4gYWFyY2g2NC9wc2NpX3Rlc3QuYzogSW4gZnVuY3Rpb24g4oCYaG9zdF90
ZXN0X3N5c3RlbV9vZmYy4oCZOgo+IGFhcmNoNjQvcHNjaV90ZXN0LmM6MjQ3Ojk6IGVycm9yOiB0
b28gbWFueSBhcmd1bWVudHMgdG8gZnVuY3Rpb24g4oCYdmNwdV9nZXRfcmVn4oCZCj4gICAyNDcg
fCAgICAgICAgIHZjcHVfZ2V0X3JlZyh0YXJnZXQsIEtWTV9SRUdfQVJNX1BTQ0lfVkVSU0lPTiwg
JnBzY2lfdmVyc2lvbik7Cj4gICAgICAgfCAgICAgICAgIF5+fn5+fn5+fn5+fgo+IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBhYXJjaDY0L3BzY2lfdGVzdC5jOjE4Ogo+IGluY2x1ZGUva3ZtX3V0aWwu
aDo3MDU6MjQ6IG5vdGU6IGRlY2xhcmVkIGhlcmUKPiAgIDcwNSB8IHN0YXRpYyBpbmxpbmUgdWlu
dDY0X3QgdmNwdV9nZXRfcmVnKHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgdWludDY0X3QgaWQpCj4g
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fgo+IEF0IHRvcCBsZXZl
bDoKPiBjYzE6IG5vdGU6IHVucmVjb2duaXplZCBjb21tYW5kLWxpbmUgb3B0aW9uIOKAmC1Xbm8t
Z251LXZhcmlhYmxlLXNpemVkLXR5cGUtbm90LWF0Cj4gLWVuZOKAmSBtYXkgaGF2ZSBiZWVuIGlu
dGVuZGVkIHRvIHNpbGVuY2UgZWFybGllciBkaWFnbm9zdGljcwo+IAo+IHNpbmNlIHRoZSB1cGRh
dGVzIGRvbmUgdG8gdGhhdCBmaWxlIGRpZCBub3QgdGFrZSBhY2NvdW50IG9mIDcyYmU1YWE2YmU0
Cj4gKCJLVk06IHNlbGZ0ZXN0czogQWRkIHRlc3QgZm9yIFBTQ0kgU1lTVEVNX09GRjIiKSB3aGlj
aCBoYXMgYmVlbiBtZXJnZWQKPiBpbiB0aGUga3ZtLWFybTY0IHRyZWUuCgpCdWdnZXIuICBJbiBo
aW5kc2lnaHQsIGl0J3Mgb2J2aW91cyB0aGF0IG9mIGNvdXJzZSBhcmNoIHNlbGZ0ZXN0cyB3b3Vs
ZCBhZGQgdXNhZ2UKb2YgdmNwdV9nZXRfcmVnKCkuCgpVbmxlc3Mgc29tZW9uZSBoYXMgYSBiZXR0
ZXIgaWRlYSwgSSdsbCBkcm9wIHRoZSBzZXJpZXMgZnJvbSBrdm0teDg2LCBwb3N0IGEgbmV3CnZl
cnNpb24gdGhhdCBhcHBsaWVzIG9uIGxpbnV4LW5leHQsIGFuZCB0aGVuIHJlLWFwcGx5IHRoZSBz
ZXJpZXMganVzdCBiZWZvcmUgdGhlCnY2LjEzIG1lcmdlIHdpbmRvdyAocmluc2UgYW5kIHJlcGVh
dCBhcyBuZWVkZWQgaWYgbW9yZSB2Y3B1X2dldF9yZWcoKSB1c2VycyBjb21lCmFsb25nKS4KClRo
YXQgd291bGQgYmUgYSBnb29kIG9wcHVydHVuaXR5IHRvIGRvIHRoZSAkKEFSQ0gpIGRpcmVjdG9y
eSBzd2l0Y2hbKl0gdG9vLCBlLmcuCmhhdmUgYSAic2VsZnRlc3RzX2xhdGUiIG9yIHdoYXRldmVy
IHRvcGljIGJyYW5jaC4KClNvcnJ5IGZvciB0aGUgcGFpbiBNYXJrLCB5b3UndmUgYmVlbiBwbGF5
aW5nIGphbml0b3IgZm9yIHVzIHRvbyBtdWNoIGxhdGVseS4KClsqXSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvMjAyNDA4MjYxOTAxMTYuMTQ1OTQ1LTEtc2VhbmpjQGdvb2dsZS5jb20KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
