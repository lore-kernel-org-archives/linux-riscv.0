Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E24C79F9F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gqrkq0SxFP3G0DwUALek2AlT7fANiaHwvjgnB8WZRcM=; b=dzOmG+AM4TG8eg
	qj2GADcpMmaAAzjTZWjn3JMWKMGZS3UU2eUR7DFAlafojNHrxuO2ogDrgjs2FlHXKeCVqtBIwgTFN
	IwwGQMHTvDAb5ZehPKmLoJIf9Z23H2h3a5yMUFjYfYuCYQqF7o8LDeAYB2XXAv8Fp37zQFGtHSy2Z
	RNa0NX/KIHFQ8PyVog2htbsI7iVLWGvPXA3OvKMZiO4eVESGHVqpA7mNA4PDECRriNZ4lrxkXK4XD
	0iw6gzvw1UgDLsZlUrS33yNCPlkzT/vTNiQEAbJXmkoPtMOrzfU0lULlMFSm8sJ1kHE0avTaMO+Lq
	7s0p4DREqS49jLOxRrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cws-0000000ECrG-2ZGR;
	Thu, 10 Sep 2026 11:28:10 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cwp-0000000ECpe-3aQo
	for linux-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 11:28:09 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-4b28d7c729fso4777614b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2026 04:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039687; x=1789644487; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=pmqvuGVD4kDnZOM4VF8RLqiA7VQzj6moZH1ck1wRL11iW7H6dETDP1/CMsZrYpe3a5
         3BGXodmD573GRK4XuK7KxmZACPWw9RT+Ee6BYijpe8cZ12auHoR1VFgSYI9aNf8XdHBm
         wmi3QSneXCs7uxf7mXEyf8Df4yyK0lC4XUZD6G0akaFvEAeKBV8Uc0vX8Y9D/5Wp/Bs3
         +cMFPWM+YMo5L5s40MU+fzVAbitcgox7SSvvXBYxyEiTe9mr9RD02UbU+Tr2lYM7d0x4
         Qzx3ybefaFUNCH3P80Pj66p7PcbZRqrT2LBRaqKHcXg1ia77cds87DddcGjpzeca6BRZ
         Wi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039687; x=1789644487;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=PSiUB5NP2I9R8kl2O3yrF8jPeOFbYjql/n7V6G7yA7DqRJ5DyEbgVpUgA5hDa9Y6UB
         v8zP1TZ3Fky6sNVurO2qyld+p4j9XKQV9hnWhfgnQ4IhyWTEc5HIegAmRdS363bjBPt/
         P9AKSU9+dHZ1nEsK+hWop939kLbnoJpCplwNgjguP5/gKHTmHF5WyYmse/3ymyRys8E6
         aNhLfQPqjQCY0TtpnuZcfK2vP0XVePKt1FoEYR6ClDDgXenEsJ9CNwv7yQdns6smaK6s
         FOwYpUBhV+IlPVEL0NICBRkw+/1jXZSTJl0CyYo4cYJW15DApJCzAlLa/uu3vU4M5fA9
         062Q==
X-Forwarded-Encrypted: i=1; AKwUvBzBOahdT5bNfozxXInp53qSmwGoWaQJqYi57gnWgL5wAO11R0+xfYi68wPLuQWZT9tA+fsZm35cgetY4w==@lists.infradead.org
X-Gm-Message-State: AFuF++nXYPcqLXImgTIZ4Rc7tyL2hoLEhiwEMJLS6wHnoTbL1rjxX5bM
	YZG9/oGve6X4TJ3qj2ElqeCXWgTJIIOTRhC8y7GZWZgSaNSSiCKSx9MV
X-Gm-Gg: AYBFou0KQpu4n79zrxmsiNvRu91hE8fa4BI5zZs9a0GegGflICFii36KZoR8ajM2tWm
	3fLf3Y41pwXQdFvFR0F85wNXMHvZ01WJO5MeU7xmgERzs6oMldURAdJ7Gpnm77yCOdbgpFN31dr
	Odlz5RmcYdka+GvQTHb+MF9xIHBM3awbr9A4Pb/oSUtdVDJPUWyhUxa4XuteDIXKKhGUu+dySDI
	V+eob9mJ06bgh3eXf0ZPiYEtxkDo4l/e7LL9rM9IviIyggnYkXDUMbcXosbMDDL3VZIcvHOPgbN
	8yqpKl6wV3JdZ/ZDK08ns6KRcQPh8N8dSb977MfzL7nlgadXZUO8bm9izeWO2CWMHU1oY2W4rza
	vzsYt/5vExV3CkjxRLWAfDcSkLaqkoKlNb2GTBTRTcK+F2pW65pcPu1oe1ojTvKPPzzWgUANJvO
	M6leMUnEyf2N4ThcYCvHRRwvIIqFT3Y4K+6RHpsrKEsVC5fxZl2LDlD4Ex5ujgHJmFEtjSi1H7N
	Q3frH54LeheydCfBdnmSO06tnju71BIIF3kERNyfPtqUU+pqz/u3rerOqbb9uFz2g==
X-Received: by 2002:a05:6808:f09:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4b95db6da80mr27637088b6e.0.1789039686755;
        Thu, 10 Sep 2026 04:28:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm49398440c88.8.2026.09.10.04.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:28:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
In-Reply-To: <20260902164123.2546762-19-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:57:29 +0530
Message-ID: <4ifx1h3y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-19-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_042807_901250_4FBF1965 
X-CRM114-Status: UNSURE (   4.74  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sean Christopherson <seanjc@google.com> writes:

> Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
> input is guaranteed to fail the test, and with the standard error message
> format.
>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
