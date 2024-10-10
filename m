Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17956CFC5F9
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+NXRZEOQlRWOfJNuDdLxh/Kw3af5CgdS1a0xsSEdOk=; b=qclBH+vu98NGmt
	+3dUklJyj0/mBNlvGlq51uicv1CsrrTxG+JIqp8XR1TI+w3xqs49ip66twhMzfRJZpTHRg88E+uIF
	WLvJJArU1WXX+NoXk72Nf6eA2R8NodTzwPuPVcTGU5dFoqcN57YBDiPV0xTamhKWll4Ym/61VW1E/
	g5E5ChRaWaqM+MZJsyJ/SZ8T2CXkzjWTL/0rG/2WkHnTKvqxijjpwczj/j/Z75g8CowUBScDZa1Fb
	bETqp1uAkPwfPkGeMFSzBPs5bfSDKjq92jc3JTqesJV+kP804dU1hdg1lCuKyiwrBk9d97c+iGfT/
	hDylHR9Rd7+zMHd6j2jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syyZe-0000000E3zv-3eI8;
	Thu, 10 Oct 2024 19:11:46 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrZ-0000000DqeS-1ABV
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:14 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7ea38f581c9so1274182a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584772; x=1729189572; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQkfEcPm4BCGA2NCPxYbIcRTjXNaFQKnzNzKtIM0PSc=;
        b=a9tvknbu3mVAwdSk/bWW5Mn6EIDWzmh5YcjYhMVkkIs1GvQLH6PIVzkh/eOSJc+rpn
         3ueOHIXlNOai8fANmCvUpo+xVDPEYFJTvnkaiYtt1Lx+b1NC0b6SUoONHAXEP/bKZSui
         rgPHbPmU/oMAwui5lHJhk4Vj2+lb3sZyIjFzW/OIQ4ntLUfMJmYF7D1ILFmOtChZCw6+
         CTNBGGncSEfZ4h5yf5X2BrgnM3j86XxhiCzCWwarWP1oaMehmhQAqRF8CTp4GI62hfIu
         HitGGHrCddX+1k1ox1ejB/nmPZCOPRAWnV8+5pJzeDfC5Z7i3iI7WxVGBWshaWSaoTMj
         mfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584772; x=1729189572;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UQkfEcPm4BCGA2NCPxYbIcRTjXNaFQKnzNzKtIM0PSc=;
        b=Qzhk/kYxYHp5yWKpdFPGeEfY780+qFTg4dTDV0QYEC8P4swgcovAOoa/sfYGZKyyBt
         q3wY1McHQXZWiIMS2PV1FzxTVEk2W0+q26/DsvuyH1d94XBsz1d/Eck7n+xyYrH0B0YM
         iu3i5SyccIofK2UPbYER3X2A98k3kIzAZj4/fm26V0dTCD7usUr9Laxmsg7dvoTyAssn
         2OyklI8OOActthON5qmO0iKEsP1O35qGr+cqd3JCAEW/Mputtqy8eB1tGIDVj9XqHhjm
         Dp+sbo1dIg0vYiiBVS6pFNlme/LB5y1FFZairBNoj2AWVXprZWQkGZQDmDSQeq2BRCRa
         U4kQ==
X-Forwarded-Encrypted: i=1; AJvYcCULn+4i7pQ3jf870tQcLXAM7aQ0h1aXQwBCHBASbKqw67gqieRzmb5QjX9SPAEp7u3nZjkG6S3CXaL0bA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ755BgenGDt+vUDfh3RHCu3EAtUzifFttx9iSzIY8G1UlXvaY
	YVZxdBMUugJW1RmVgcr0WEd85DtARRkBoD/FfKVqOUya8oHI/n02jIfYcoSSkugh8eQh1gCC4vv
	zpQ==
X-Google-Smtp-Source: AGHT+IHq9hr54ORGaKAudrJMY0Hy9bRYjmUvRYz8zAm0RAj3x+bD9YD3f2uWGLgDblXeQYOnnP141duUJXA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:1d03:0:b0:7db:539:893c with SMTP id
 41be03b00d2f7-7ea535a65c6mr17a12.9.1728584770873; Thu, 10 Oct 2024 11:26:10
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:40 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-39-seanjc@google.com>
Subject: [PATCH v13 38/85] KVM: x86/mmu: Put direct prefetched pages via kvm_release_page_clean()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_112613_383986_F2A66D8E 
X-CRM114-Status: GOOD (  10.94  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VXNlIGt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4oKSB0byBwdXQgcHJlZmV0ZWNoZWQgcGFnZXMgaW5z
dGVhZCBvZiBjYWxsaW5nCnB1dF9wYWdlKCkgZGlyZWN0bHkuICBUaGlzIHdpbGwgYWxsb3cgZGUt
ZHVwbGljYXRpbmcgdGhlIHByZWZldGNoIGNvZGUKYmV0d2VlbiBpbmRpcmVjdCBhbmQgZGlyZWN0
IE1NVXMuCgpOb3RlLCB0aGVyZSdzIGEgc21hbGwgZnVuY3Rpb25hbCBjaGFuZ2UgYXMga3ZtX3Jl
bGVhc2VfcGFnZV9jbGVhbigpIG1hcmtzCnRoZSBwYWdlL2ZvbGlvIGFzIGFjY2Vzc2VkLiAgV2hp
bGUgaXQncyBub3Qgc3RyaWN0bHkgZ3VhcmFudGVlZCB0aGF0IHRoZQpndWVzdCB3aWxsIGFjY2Vz
cyB0aGUgcGFnZSwgS1ZNIHdvbid0IGludGVyY2VwdCBndWVzdCBhY2Nlc3NlcywgaS5lLiB3b24n
dAptYXJrIHRoZSBwYWdlIGFjY2Vzc2VkIGlmIGl0IF9pc18gYWNjZXNzZWQgYnkgdGhlIGd1ZXN0
ICh1bmxlc3MgQS9EIGJpdHMKYXJlIGRpc2FibGVkLCBidXQgcnVubmluZyB3aXRob3V0IEEvRCBi
aXRzIGlzIGVmZmVjdGl2ZWx5IGxpbWl0ZWQgdG8KcHJlLUhTVyBJbnRlbCBDUFVzKS4KClRlc3Rl
ZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5
OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiBhcmNoL3g4Ni9r
dm0vbW11L21tdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL21tdS9tbXUuYyBiL2FyY2gveDg2
L2t2bS9tbXUvbW11LmMKaW5kZXggZTQ1MWUxYjlhNTVhLi42MjkyNGY5NWEzOTggMTAwNjQ0Ci0t
LSBhL2FyY2gveDg2L2t2bS9tbXUvbW11LmMKKysrIGIvYXJjaC94ODYva3ZtL21tdS9tbXUuYwpA
QCAtMjk2NSw3ICsyOTY1LDcgQEAgc3RhdGljIGludCBkaXJlY3RfcHRlX3ByZWZldGNoX21hbnko
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LAogCWZvciAoaSA9IDA7IGkgPCByZXQ7IGkrKywgZ2ZuKyss
IHN0YXJ0KyspIHsKIAkJbW11X3NldF9zcHRlKHZjcHUsIHNsb3QsIHN0YXJ0LCBhY2Nlc3MsIGdm
biwKIAkJCSAgICAgcGFnZV90b19wZm4ocGFnZXNbaV0pLCBOVUxMKTsKLQkJcHV0X3BhZ2UocGFn
ZXNbaV0pOworCQlrdm1fcmVsZWFzZV9wYWdlX2NsZWFuKHBhZ2VzW2ldKTsKIAl9CiAKIAlyZXR1
cm4gMDsKLS0gCjIuNDcuMC5yYzEuMjg4LmcwNjI5OGQxNTI1LWdvb2cKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
