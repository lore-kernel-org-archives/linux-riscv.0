Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF79D24454
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9RFsLbHcB/VBBFEi9BhyNrmyDTNNyLNmiHX+RkU6GM=; b=RwoJLdfSPB5AhN
	ybHnc0w1sTRWpY0N5urcbFA37JdCrWf32vULixH3qCGmN7D5cu79SlzQU0pHa0yv4TERxltE7Ks4x
	cvQ8yBsZOhcfrUpjbOB+xEBcCd0mJSbCDFVg+Vwq24UMJ/CN+ajnqNB4tLXMLqDxS+Kmv/dYUCXZe
	YzJEQJaKogLzU9SMlwXhpqsoJRaOL5F6p6X67eGdO0kWjATEPaVPBlRRiYC4SiJxQeybfgWeERtPC
	MrjejDHXoCX6e/ztkHza+5R4XWvjD5dVr0rYEvUaUsyh7sIbMHK9vm42VJshAp5jlPjQQMc6CB/tp
	TPp0khIsuEDM4rb60LAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0WP-0000000ENbY-3qJE;
	Thu, 10 Oct 2024 21:16:33 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxrQ-0000000DqX3-0PeK
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:26:06 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e00c8adf9so1318775b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584763; x=1729189563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3u38MFKj4Hgu0NiviVwRjtFpk/ioMNBGBDQlt4DAgY=;
        b=wwsVmKdK+SipFg1qIF50TrdP6Oo7jO28ReLYz/VDjQtbPUYfeyWnk0GVNrM0uvKMns
         yzO1p2PHSyt6/6J6LjJccz4eC9X33n2N2DFqSywzlwGAsAWPs0+b7iefqw5tZpUARPQu
         9OG64S1K6L+hc8UcCB61w0V2JL630JzshC0mLEAVFvK8USjgHGCuqzpy7gkmEW0tty66
         NRob1YtQ6GGUHdVw6r2QY0qsQ4+DlBD5nwBCrRtcLzLwX9krXorOWvD+nF58Mr7YwjaH
         LDcNdo4BOKyAvdYIXqY2QFZaKTbi1CdYfH/QTc06gv+b8kc00QbcJRcZEUai+QUcejZU
         3v4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584763; x=1729189563;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3u38MFKj4Hgu0NiviVwRjtFpk/ioMNBGBDQlt4DAgY=;
        b=vaZiwV0bifM9vHEGG+Bw+1yCSgszo0WMkKAZv+Lg0TEGnOlGmZseuq19u9w/h9iC3P
         NhR1Q1yY4JHXIw7xPK+YtkXKx6QrlGg7ZaNQVl7cvM9aBXBc4HreXfE9g3NbzX7ryKuU
         q2ZCGUwcpOyYAXsFgESrVd6cUMVvDXMEGtfwMOj7Fp1kiz2oF0EmQfSGTMYUBMDf1K/x
         50PFr8jXL9MvV/m7/G9pQs84IEnkw/cGxLSBDczleo46SbGLpN9t++rUg4th0v6LOETc
         CM6Mp8qEMFEH6FkC1bgLIWpvui5SUEKmm4QkbAwFBiBghQrQqo/TA0R5ama+4RU2q2eP
         KFoQ==
X-Forwarded-Encrypted: i=1; AJvYcCX//CUvbU6Jnax3aW0FuZIAoW979xvBea/8dn9uoNZphaNUaHxcmOmIALW8vP020kxgzzgFeYjfWy2AuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJfeb/8ShxH50+M/vVALKBPBYNv0UXNyfx+mYOIwMA6/B6y8B+
	bia072HuJBrGv8S1rMd5oAZDyH+FldFAFDQKIUT9c9scEA/onxM/rsZ4o0AmWY7fOlesa6FmNix
	+JQ==
X-Google-Smtp-Source: AGHT+IHthU1bxxWE76UmRU/cmSB/2b+tJYVulTyd1SGmZGLYBHQFEbukUNmDJAlwNs2CFth+SfvGFADhDCI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:2f51:b0:71e:dd:8f9b with SMTP id
 d2e1a72fcca58-71e1dbe8750mr6976b3a.5.1728584762866; Thu, 10 Oct 2024 11:26:02
 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:36 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-35-seanjc@google.com>
Subject: [PATCH v13 34/85] KVM: Get writable mapping for __kvm_vcpu_map() only
 when necessary
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
X-CRM114-CacheID: sfid-20241010_112604_231226_81B9562F 
X-CRM114-Status: GOOD (  10.35  )
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

V2hlbiBjcmVhdGluZyBhIG1lbW9yeSBtYXAgZm9yIHJlYWQsIGRvbid0IHJlcXVlc3QgYSB3cml0
YWJsZSBwZm4gZnJvbSB0aGUKcHJpbWFyeSBNTVUuICBXaGlsZSBjcmVhdGluZyByZWFkLW9ubHkg
bWFwcGluZ3MgY2FuIGJlIHRoZW9yZXRpY2FsbHkgc2xvd2VyLAphcyB0aGV5IGRvbid0IHBsYXkg
bmljZSB3aXRoIGZhc3QgR1VQIGR1ZSB0byB0aGUgbmVlZCB0byBicmVhayBDb1cgYmVmb3JlCm1h
cHBpbmcgdGhlIHVuZGVybHlpbmcgUEZOLCBwcmFjdGljYWxseSBzcGVha2luZywgY3JlYXRpbmcg
YSBtYXBwaW5nIGlzbid0CmEgc3VwZXIgaG90IHBhdGgsIGFuZCBnZXR0aW5nIGEgd3JpdGFibGUg
bWFwcGluZyBmb3IgcmVhZGluZyBpcyB3ZWlyZCBhbmQKY29uZnVzaW5nLgoKVGVzdGVkLWJ5OiBB
bGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6IFNlYW4g
Q2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgotLS0KIHZpcnQva3ZtL2t2bV9tYWlu
LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9rdm0va3ZtX21haW4uYwpp
bmRleCAwODA3NDBmNjUwNjEuLmI4NDVlOTI1MjYzMyAxMDA2NDQKLS0tIGEvdmlydC9rdm0va3Zt
X21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0zMTIyLDcgKzMxMjIsNyBAQCBp
bnQgX19rdm1fdmNwdV9tYXAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBnZm5fdCBnZm4sIHN0cnVj
dCBrdm1faG9zdF9tYXAgKm1hcCwKIAlzdHJ1Y3Qga3ZtX2ZvbGxvd19wZm4ga2ZwID0gewogCQku
c2xvdCA9IGdmbl90b19tZW1zbG90KHZjcHUtPmt2bSwgZ2ZuKSwKIAkJLmdmbiA9IGdmbiwKLQkJ
LmZsYWdzID0gRk9MTF9XUklURSwKKwkJLmZsYWdzID0gd3JpdGFibGUgPyBGT0xMX1dSSVRFIDog
MCwKIAkJLnJlZmNvdW50ZWRfcGFnZSA9ICZtYXAtPnBpbm5lZF9wYWdlLAogCQkucGluID0gdHJ1
ZSwKIAl9OwotLSAKMi40Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
