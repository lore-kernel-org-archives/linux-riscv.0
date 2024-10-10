Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5012CD24447
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 19:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vujKWdpU1hzMQuz/3/RdIFLZDPxpas/j4aWDZCLPqxs=; b=nZTrK8jHN4guCW
	jD+l5LUa42oxstAL4UWLxSYFy0TAELnETDjecuoI6uAbb9BRgNATZTOsXbNbcw03d2peyGnb9lpI+
	Dg0LTszxyece6dzCuKRGryMkFX2DQoA6eEZtlvms+pxbkTEk6oyTPmhnpv7y7CRGbNyPwH1IH/Ngg
	feJNS5+lTjnOIxev3nHhc8r7/khLLS8toPZ6jCp1wtyA5ULJdJdenSfn+u6H5a1jbkuDhVnoNJqaL
	G+map1LgvkOV7sOeGdSDa071SVIgDZIDpO0KmpDcZBQqpPZ9YBC4jXjHy7QpqsEvyJhnwqave4TtB
	LJ39uyAR6SZn1bmxTCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syzCw-0000000ECI3-0FoM;
	Thu, 10 Oct 2024 19:52:22 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxt3-0000000DrsT-1OnB
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:27:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e290222fde4so1382412276.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584864; x=1729189664; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=J8taJzN9t4s6HfK9u69vl1xjw/eLAz6KM1QsCV7wHhxGzLMHMqrB4B7KQn2Pb8VPjz
         X3Gysx6a10sADIsjtWJMpLpSugHV+E/l0HLp7kiFs/dOcFljnIA5sZLidASSdLrQfZX9
         9X5eNMsraY6t+GseYThGg9Rn6iAOYfdqVDtIGerSU6Y30fee7uv030SPw6meaPF0Uc25
         sTllS9cUGwDgPbQWSiu7DoEP//VL9LoKzRHmp/xUnHXTWsskxPUFohgwPbENzH6G18dh
         kT0KCIrvOHsjeeiF5DVSyAG2QYB7RrwDv/Ob+GGkK35pg1Tfd+LtAI8McZJFCLPRBXTk
         NZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584864; x=1729189664;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7IfrRBwnhP/ARkGggvkJ//bNWbTHtvwsCnjZUdYSoz0=;
        b=hAfN/iCVYwwwSJiGy01qQVPAklbP+hBSnmQMM6aA3jvVzR+T6fk7csqYNYt6MRNTdd
         LGCUNTTUk2xvRBTBrAxmIbZQRRWJoJjGvYwu2RYDG6InTWM4PwNUnhdvqd1VcYzuWd3B
         cZvDuAd+b+Ig/wJBd5RjKEIUyKiurH/9FHz63G7tNmPOBDK9cldhXy+fWkpeNomp25tb
         iI8PktNBpLCfKxQCO+838H6gIbFlvZdF/jsBfoPcXCWT81on6FvBsUDq71lLdDIgRYWz
         6VunQPDBcWdSB/Jymsl+4OTQzP4RUtufrZgtxhOr1M760cn37sBpmMeVvGAH8tpAxtBg
         cRog==
X-Forwarded-Encrypted: i=1; AJvYcCXfrnO2K27FLGyS2wuPP7bfs9dJfB/Cm/9Mpl6WxiekXKq+y11B+uwSLX2P3CFlVc8OTQmZ5VTAKqaOGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoJLR42Pct27fiQOPd0t+8B9RuQct2/C2P/lCtyCN17jwPRdC2
	53opoK8+N797+1fc/CieyELc7lOcf6Ea0IueG9X3qLhkFQueld6/+U05nnKsH5dz8jEWh+dGdpE
	xgg==
X-Google-Smtp-Source: AGHT+IEHmTL+CF0lwT1L0/srW8AumAgUZ3z+xXpT6s6F1mY7sAC4x3PdYh5uuuYsI/CKxaNz7ipzx99kqDg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ed0b:0:b0:e17:8e73:866c with SMTP id
 3f1490d57ef6-e28fe421ddfmr136730276.10.1728584863963; Thu, 10 Oct 2024
 11:27:43 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:24:23 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-82-seanjc@google.com>
Subject: [PATCH v13 81/85] KVM: Make kvm_follow_pfn.refcounted_page a required field
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
X-CRM114-CacheID: sfid-20241010_112745_440203_B4E22432 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

Tm93IHRoYXQgdGhlIGxlZ2FjeSBnZm5fdG9fcGZuKCkgQVBJcyBhcmUgZ29uZSwgYW5kIGFsbCBj
YWxsZXJzIG9mCmh2YV90b19wZm4oKSBwYXNzIGluIGEgcmVmY291bnRlZF9wYWdlIHBvaW50ZXIs
IG1ha2UgaXQgYSByZXF1aXJlZCBmaWVsZAp0byBlbnN1cmUgYWxsIGZ1dHVyZSB1c2FnZSBpbiBL
Vk0gcGxheXMgbmljZS4KClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5h
cm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxzZWFuamNAZ29vZ2xl
LmNvbT4KLS0tCiB2aXJ0L2t2bS9rdm1fbWFpbi5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdmlydC9rdm0v
a3ZtX21haW4uYyBiL3ZpcnQva3ZtL2t2bV9tYWluLmMKaW5kZXggYjJjOGQ0Mjk0NDJkLi5hNDgz
ZGE5NmY0YmUgMTAwNjQ0Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0v
a3ZtX21haW4uYwpAQCAtMjgzNCw4ICsyODM0LDcgQEAgc3RhdGljIGt2bV9wZm5fdCBrdm1fcmVz
b2x2ZV9wZm4oc3RydWN0IGt2bV9mb2xsb3dfcGZuICprZnAsIHN0cnVjdCBwYWdlICpwYWdlLAog
CQlwZm4gPSBwYWdlX3RvX3BmbihwYWdlKTsKIAl9CiAKLQlpZiAoa2ZwLT5yZWZjb3VudGVkX3Bh
Z2UpCi0JCSprZnAtPnJlZmNvdW50ZWRfcGFnZSA9IHBhZ2U7CisJKmtmcC0+cmVmY291bnRlZF9w
YWdlID0gcGFnZTsKIAogCXJldHVybiBwZm47CiB9CkBAIC0yOTg2LDYgKzI5ODUsOSBAQCBrdm1f
cGZuX3QgaHZhX3RvX3BmbihzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4gKmtmcCkKIAogCW1pZ2h0X3Ns
ZWVwKCk7CiAKKwlpZiAoV0FSTl9PTl9PTkNFKCFrZnAtPnJlZmNvdW50ZWRfcGFnZSkpCisJCXJl
dHVybiBLVk1fUEZOX0VSUl9GQVVMVDsKKwogCWlmIChodmFfdG9fcGZuX2Zhc3Qoa2ZwLCAmcGZu
KSkKIAkJcmV0dXJuIHBmbjsKIAotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
