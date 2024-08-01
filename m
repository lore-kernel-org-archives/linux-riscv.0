Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABE3C3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 09:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tQGW23FfG1lWAaSs1norILXAuI00dIID3nB3GbAEyfk=; b=Ag9S2voh3319qH
	zhvL7D/SQcmDnwLbuNihb1AKZ2HHzeZygciTPxanAIMXa6yyBqeUP5uDC5R5cCq+IFOouZgVjpeFx
	22PztXDnih4v0nvg2w6S7xE6jJYFPMWRHlAt6Bu1xgV00m9vv1gjXhCxjF1y6ESmAWc1WinE9FKxr
	X0UVGwkl+IE0ACh0Bp/on/46RkI64sUGdpMqVKpk8PYPgFFUXdnPTBDX6KQCMQQuorzmyu/GosNO/
	t9p3FBNnTHo6k2mKEi7+jJJxV7qiwQpWUQmrz+F94EO8urIxbPH/SNHaQ5/m4n4/xNiHAGLTBU6y8
	6RoOnvfGvl730CW7ofZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSXZ-00000004fTQ-2W8d;
	Thu, 01 Aug 2024 09:56:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZSX4-00000004fHv-0OCs
	for linux-riscv@lists.infradead.org;
	Thu, 01 Aug 2024 09:55:40 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-59f9f59b827so9984733a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Aug 2024 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722506136; x=1723110936; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfWoHfDxpbd/BrLn4R6OTlWdsgX7K0q/kTBzQqeOmF4=;
        b=YFDgj3TfrwYya2KWsxwhjsWiWnyyZpexhOgmf6tc5kWn0Na8+OX8lXS1fCLfMqZ32N
         H9OKyndRTCzP3ICLM5Vyqfd3IIUBkizvZi85cpgAsiPbfA3k87FeDIg51b1Z3fz/rbKR
         2rgPlPw9ui5cKwDvPU+8PTcZMFNVpRgWHlQsfN+EABqYE/0qKyy3ByYp8CQrT8R3Z4vZ
         yKTs9qhxUsDDpFDECCz+vSmEnfqr2gQEYwacqPmkw1cNvg4fXqrr8AIzYnh9hPViLsKg
         g1VDYxVcwVi7mHNA26zkU3mXnVavGMODh3kdmiPdc/R/gJbLtiBk4xoEHSOZtCR8ubnE
         QZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506136; x=1723110936;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfWoHfDxpbd/BrLn4R6OTlWdsgX7K0q/kTBzQqeOmF4=;
        b=dySfgK2n5aW4pIsGbYN6pADBR6MhMZPImEi7oLbdw1N/mgQ/ONcF3KEIbyHj9XeaEh
         y/5EXNg6ApFRZ1mT1zF5/EGNaA7ekYu9WsvmHUPHK6ZLd2IeJ6nU62Thu3U1c3An9GFo
         PfPxZGYNc5Q++zqsKSJ2FzifumZuvhS7d47Hih+mzSvcemlCMWDMLW/8Tb87j70wPjf9
         5J9+ViRw0c43wA/UX9buDuJhUZOdIQ+QHsTeTSzrzBHacQJOtY6jDz3MlQXj6gWFnVqz
         epfKKX6aen0K8wdHuNqQKTrvKQcVU504apF3aHj4lJ548Qjss8R6/H4bMqrMnnRCUHya
         RcPg==
X-Forwarded-Encrypted: i=1; AJvYcCXEx9edgFpJOnUxhgHkYN5k7ip/wbFA8PGOa+LDmfySYxuZ09VQ+F64z/pmWdXTemrIm6DV1Et1xbO7WXaXHRwMQSGpa6eoUhn/il+O7rQf
X-Gm-Message-State: AOJu0YzJd1emZsu1tSRQVXeqoFSgPvtbKr4qpYs+466kTV6akU4Hh1B+
	7lU0hOVt7nslP9KcAR5sYyMUQ579eREnyCaYSI49/1RRF1QUKnu79Ys2x1fbpSA=
X-Google-Smtp-Source: AGHT+IGb/nSGVf7NWCnHjhhrhlGi5SRtFpH69is58qT222M0oYGxJthjaOlCxTOcuwDzU1FyViVsdw==
X-Received: by 2002:a05:6402:b32:b0:5a3:5218:5d80 with SMTP id 4fb4d7f45d1cf-5b6ff4e0399mr1182829a12.21.1722506135641;
        Thu, 01 Aug 2024 02:55:35 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6377d005sm9858902a12.38.2024.08.01.02.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:55:33 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2329A5F80C;
	Thu,  1 Aug 2024 10:55:32 +0100 (BST)
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
Subject: Re: [PATCH v12 26/84] KVM: Move
 kvm_{set,release}_page_{clean,dirty}() helpers up in kvm_main.c
In-Reply-To: <20240726235234.228822-27-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:35 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-27-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:55:32 +0100
Message-ID: <87h6c4efe3.fsf@draig.linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_025538_168056_04E000F3 
X-CRM114-Status: UNSURE (   6.58  )
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

U2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5jb20+IHdyaXRlczoKCj4gSG9pc3Qg
dGhlIGt2bV97c2V0LHJlbGVhc2V9X3BhZ2Vfe2NsZWFuLGRpcnR5fSgpIEFQSXMgZnVydGhlciB1
cCBpbgo+IGt2bV9tYWluLmMgc28gdGhhdCB0aGV5IGNhbiBiZSB1c2VkIGJ5IHRoZSBrdm1fZm9s
bG93X3BmbiBmYW1pbHkgb2YgQVBJcy4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVk
Lgo+Cj4gU2lnbmVkLW9mZi1ieTogU2VhbiBDaHJpc3RvcGhlcnNvbiA8c2VhbmpjQGdvb2dsZS5j
b20+CgpSZXZpZXdlZC1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgoK
LS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
