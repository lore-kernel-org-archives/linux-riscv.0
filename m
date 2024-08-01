Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7CFC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 09:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vjx8B6L/+xXHhlbkbNvPKLHzxHezPvvMEbGbb53CmBg=; b=w5v/FAAAUUx40E
	i+sqIuwj7B2MJiV+QqPZUGonuns7HqrX0ARU8mJBnVx3XC3JDwXwUpG1A8EgDjZfu8IFugtN3dJLQ
	BUiaytI/sXirPxhq6ma5DZZAIEPqUm2A07v9vCS9F1B9yRh1FpxYpBditOpkwc7oODgaV11obm4sr
	P5qMcQci7pr+pAfUf6LmY+3POyUTDpjV+21e9XfHC44CxdCYhU+iRBnLpKxpokPMCMpqMapjxq9S2
	wuARyFo9kELTa8apNnQVWd6vrDXgn3hrmSX6JT2j9IgYQN61Rz13J/g5EQPkHtiFCFTXf/Ud+7+9+
	hCL3pVeXK6/gZZZQ5dhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSVo-00000004f4s-3Wwc;
	Thu, 01 Aug 2024 09:54:20 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSVK-00000004exg-2a8P
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 09:53:52 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so3153148a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722506028; x=1723110828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MGDW2w0EUrwnI4S//nT3S+vOipXyZxOwDlAdIY1JMk=;
        b=lo/0HKg90P3nYPiJcV1ofYUB1dJDKuttDuy2/3TM1uCjmWxvYH4B5IkcXa8/pdkfV/
         ibNbfFtVxkSrGNUl2otlYwrpv7sgZJ33fyz0mjdh1zzHhTYe+SwYbQXX36WKT9llPII7
         guyKHoIg1k7c4cCI7A4F781lAiFwC98eLrdXcBCYpM5WPLHTMkUAf0EkEJNBbgoWq7TN
         UzzrMSpackHgWSpHSTWkt4T3/Vf/TNbMJpFwLhv11qNlJRvo2suyWYx2YRU3I0UmPj2B
         3UhjAXUTtTaTi9FSTBBUL8h0/bQUzFoovLkW3t+KoU8gO8QNc6P0yu5++APO871lZ2+9
         zaHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506028; x=1723110828;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MGDW2w0EUrwnI4S//nT3S+vOipXyZxOwDlAdIY1JMk=;
        b=WOezX24JSxySY6zzFX+op25rbidalsfAKn/DWrZzhxQFv2hqdroudXm/CHMMejPR/B
         TCjMbrWl6h0APxfvwbPmfy3Uc4uEy0DdQM9dhZtYuvXkez5JBLqlw6GJiK7CBipT2/0f
         Xq+W1if8+LlKVJMzEU1c7CoaotoxTyG8xTU9q0PCFq/+JJ1wltGe2mVrPbT7n2lFVoiI
         L9bwg4UvACgsw9Ng2oozG901LqsFejAX/Yj5qxkbdzGDliNAja7eV1AuDKOfUCJmzHQ0
         xqBWFyR8okAhxmoO+Ta3kLUmjKIr1Wz0ilWeoGqi5L0jG/E8+c0FwKeNBRCgMyyAI9wb
         u5ww==
X-Forwarded-Encrypted: i=1; AJvYcCVek8QPvi/9hLNmher3wW/perEOpHppqLx9MJ3N3dOgPj8jMBb/5OKnuLOQYjfPbGe8YxTyNUZkwVtmyw/KRNafKm7co3dzq76Wsd262GMM
X-Gm-Message-State: AOJu0Yz4aRWic5Jwh2Fn11JfXtY1CUHzV2/DEjzh4i9/tCLzcB7uHRi8
	5jg/hCz05I/RRUEddPa+lX0cIr7klXY6cCFr7s2jey0+IIuNY1hXCRBYo5gEg3U=
X-Google-Smtp-Source: AGHT+IHNrw29WKyolinu6cyXHFfq+0WsM6WXcBxZ1/oFvQaGEtI1aOWo6VY84S/JlZwJgkWdM0qlVw==
X-Received: by 2002:a05:6402:440d:b0:57d:5442:a709 with SMTP id 4fb4d7f45d1cf-5b778dc53f8mr879162a12.0.1722506028149;
        Thu, 01 Aug 2024 02:53:48 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b5257f39adsm2866327a12.96.2024.08.01.02.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:53:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC0595F80C;
	Thu,  1 Aug 2024 10:53:39 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead
 of single-entry array
In-Reply-To: <20240726235234.228822-25-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:33 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-25-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:53:39 +0100
Message-ID: <87le1gefh8.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_025350_662431_E0296F59 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gVXNlIGEg
c2luZ2xlIHBvaW50ZXIgaW5zdGVhZCBvZiBhIHNpbmdsZS1lbnRyeSBhcnJheSBmb3IgdGhlIHN0
cnVjdCBwYWdlCj4gcG9pbnRlciBpbiBodmFfdG9fcGZuX2Zhc3QoKS4gIFVzaW5nIGFuIGFycmF5
IG1ha2VzIHRoZSBjb2RlIHVubmVjZXNzYXJpbHkKPiBhbm5veWluZyB0byByZWFkIGFuZCB1cGRh
dGUuCj4KPiBObyBmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6
IFNlYW4gQ2hyaXN0b3BoZXJzb24gPHNlYW5qY0Bnb29nbGUuY29tPgoKUmV2aWV3ZWQtYnk6IEFs
ZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KCi0tIApBbGV4IEJlbm7DqWUKVmly
dHVhbGlzYXRpb24gVGVjaCBMZWFkIEAgTGluYXJvCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
