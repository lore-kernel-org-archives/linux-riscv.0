Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A6DCFC5EB
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Oct 2024 18:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1lsjzJQmUtosG/yjy8UXT/aP+o35xa3pQjU60F5a5E=; b=MwmViu5T2OCiDe
	ZAz5/AgVthOcGOIMzRE+3WcNn/Xhnn+jzEhaprSQZELILx1/Hztr8mf464HQHotOwnwJUTfZbVkPD
	/bGIjvFlT3NEJBe7I5cv4toDkzZyGYzw3heUWZbPrLg6Ak4a+08NwOipEXhwFD5vUszOUXhNCI2gG
	L0AXVY6HCA5p35DXueQ2jHPjJyXMJt3B5M0BLXSkLwyTCu/b7dcVffL5cWVMeUyDfp6l7YAQSK52j
	6LtnBYI7HRKBNAL/Xi3p0OUPUezby0XmAEcNncPU8mIUEpu+U9epj6I7yyNUhC5Chhh7bVloPBubP
	/zSqPo4ICte7eLRgFJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syy8H-0000000Dxpj-0YxU;
	Thu, 10 Oct 2024 18:43:29 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxqi-0000000DpwP-2jYI
	for linux-riscv@lists.infradead.org;
	Thu, 10 Oct 2024 18:25:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e31e5d1739so25016937b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Oct 2024 11:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584719; x=1729189519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0+KYw/6HzWsmGATvSxbQuKdqCcRS3waqcwxHrAen8Y=;
        b=xcx2ikl1tbRLIGweKlp3E/XnLAXCMQRCQXm9TtYfNf9DGLbpCrsIFndqhSqsrjmSat
         qbIwnWEGdAd/nLXZAcHBPN1kvhcatnmCn/IV2PUU4hvQAUC0GtQOG/uesI9giBA68Vdl
         P8krWUymc0mzim/EeROqSoFIeSbbx3oMeiXZ0tVASZm3sdADhAR1QaWws2RKxwvjQLlU
         QuZptrSMsSy1XH5GGusvv0oBwN4fcKmhVFZQJ9iPkBVYw0QATlMg251iOM1Fe+gpWxFP
         XM+6I7qL7tGGMZT5M5+DeqRp9HNjhyKl/Q1MkapmvaxgyFylhv2ThxWRjBfsgRywaBUZ
         W1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584719; x=1729189519;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F0+KYw/6HzWsmGATvSxbQuKdqCcRS3waqcwxHrAen8Y=;
        b=q9nuw43miMt/tR3Lwq8UabQ5quAV7hxcvN8+93TO7RIV8TuL34HYDJfJuSiJFa+7w+
         IFJ1kwEmmzAP49d84gBhLnHl0pxE4SY432Q/vxYE4Vv0uqx2/fVD0P2wDT6vMsoBx+iz
         LyCJEDaXpM/O8bQ8YS65I4Hml0YLjEyU6f9mW7OMuIYIMyj9xxdcxOpHnfc7UolZqXCm
         VL/iyatZwqw3KJpm5C5+ygy/7d4iJxoT1BWUqIZ39XQ8ANyXTGMOM1Zqih3gdbMqc9BM
         bzY4NqGOnN5Ytr8eNa55SLCjgaoL03I1Pef5o2V4mLzUbUvt1J7J5tA135YnWi3Gkmwc
         oICw==
X-Forwarded-Encrypted: i=1; AJvYcCXH56dPsK4b80A0gG7xbELp7/819Mh/PwWuvpln+w9DyBayjcUbHlJQZ+P728LB51k9GhDzq4OcuD2MvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytut0pulnNDVsVeewiRAbIHRWeXgl2rjvLUUMbzlD+AHFvYnoe
	gz34DubXtewXHE64WTHFwNr1STLwQK13krDPsKdgkpDWC5nV5JRc1WUjB2K9E7FlbiYMHMD6ltx
	3hg==
X-Google-Smtp-Source: AGHT+IEeBu92qjGJ6/8zutZUBi8WOanw4UupdtztXpUfLE+vAeLHZHNkVuFOksmpHMU427MoGYN+Q9YZlwU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:3204:b0:62c:f976:a763 with SMTP id
 00721157ae682-6e322185b22mr897567b3.1.1728584719334; Thu, 10 Oct 2024
 11:25:19 -0700 (PDT)
Date: Thu, 10 Oct 2024 11:23:15 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-14-seanjc@google.com>
Subject: [PATCH v13 13/85] KVM: Annotate that all paths in hva_to_pfn() might sleep
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
X-CRM114-CacheID: sfid-20241010_112520_731187_CA7BF306 
X-CRM114-Status: UNSURE (   9.81  )
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

Tm93IHRoYXQgaHZhX3RvX3BmbigpIG5vIGxvbmdlciBzdXBwb3J0cyBiZWluZyBjYWxsZWQgaW4g
YXRvbWljIGNvbnRleHQsCm1vdmUgdGhlIG1pZ2h0X3NsZWVwKCkgYW5ub3RhdGlvbiBmcm9tIGh2
YV90b19wZm5fc2xvdygpIHRvIGh2YV90b19wZm4oKS4KClJldmlld2VkLWJ5OiBBbGV4IEJlbm7D
qWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+ClRlc3RlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4
LmJlbm5lZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIENocmlzdG9waGVyc29uIDxz
ZWFuamNAZ29vZ2xlLmNvbT4KLS0tCiB2aXJ0L2t2bS9rdm1fbWFpbi5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3ZpcnQva3ZtL2t2bV9tYWluLmMgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCmluZGV4IDBiYzA3NzIx
M2QzZS4uMTdhY2M3NTk5MGE1IDEwMDY0NAotLS0gYS92aXJ0L2t2bS9rdm1fbWFpbi5jCisrKyBi
L3ZpcnQva3ZtL2t2bV9tYWluLmMKQEAgLTI4MDQsOCArMjgwNCw2IEBAIHN0YXRpYyBpbnQgaHZh
X3RvX3Bmbl9zbG93KHVuc2lnbmVkIGxvbmcgYWRkciwgYm9vbCAqYXN5bmMsIGJvb2wgd3JpdGVf
ZmF1bHQsCiAJc3RydWN0IHBhZ2UgKnBhZ2U7CiAJaW50IG5wYWdlczsKIAotCW1pZ2h0X3NsZWVw
KCk7Ci0KIAlpZiAod3JpdGFibGUpCiAJCSp3cml0YWJsZSA9IHdyaXRlX2ZhdWx0OwogCkBAIC0y
OTM5LDYgKzI5MzcsOCBAQCBrdm1fcGZuX3QgaHZhX3RvX3Bmbih1bnNpZ25lZCBsb25nIGFkZHIs
IGJvb2wgaW50ZXJydXB0aWJsZSwgYm9vbCAqYXN5bmMsCiAJa3ZtX3Bmbl90IHBmbjsKIAlpbnQg
bnBhZ2VzLCByOwogCisJbWlnaHRfc2xlZXAoKTsKKwogCWlmIChodmFfdG9fcGZuX2Zhc3QoYWRk
ciwgd3JpdGVfZmF1bHQsIHdyaXRhYmxlLCAmcGZuKSkKIAkJcmV0dXJuIHBmbjsKIAotLSAKMi40
Ny4wLnJjMS4yODguZzA2Mjk4ZDE1MjUtZ29vZwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
