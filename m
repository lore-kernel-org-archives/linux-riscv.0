Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D89C5478C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Feb 2024 02:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bM0z+YtPSD5Du/eQwmSjayBjtpkgIULHx+YCYD7h7oU=; b=kaPRxW1CDuotKYRUHHGK7ThNDt
	cv5Fz+N62meMPYid73VFrujfUL04PHxXm50hlZ9YcjWkFRJcF+g1H7r3GXMkS4xaGTfGbQaPBL4Cf
	tzhuGV+iCU0+QPJxeIgbvrqFsu5PwdjwtPRtjEoI6oBWaTlrkjnufbqaHVTxNylJfG33xhaMJt/5x
	GmA87TQxE7TVKt+6wh0aaPy6EiGWWKKvf2RiCOhDI1xEb+sEYU7m8kmFDBMHuvs7eSHcteKvj1hFr
	g8Ba5S/KQqN73ulA9Z0GAooVtF4vxPvVGkrr7EMKWdUG7DJPPRzCcgoGidZEaTtZ6BqFa0Ky8FNYx
	wAtW2yHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf9RM-00000007fhw-2QD9;
	Wed, 28 Feb 2024 02:13:00 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf9RJ-00000007fgA-0Uo3
	for linux-riscv@lists.infradead.org;
	Wed, 28 Feb 2024 02:12:58 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-608cf88048eso68191267b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 18:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709086373; x=1709691173; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ug25ooKz3qoCHEHw9pjGJUPzAeGvqTHR1DcTVlpibj0=;
        b=pYVVCWzE23y4bORQ54CIIA9DhiWeg+JsOYE+XRP5iUj0HI3Si68X3zbk5Shc3HcOP+
         UloaLFOl+LE8gj18N1PjvbmTM8WiJuJfArJAMjCxzateFMiwvRXXaAI8RdWMtRD9bEk8
         /a2un37VO/x3ktA1YcYQm+iVz5NyEnkbUyOonI7HAiNA9HjiFk+fhmjh6BLyECJL8Eaz
         hj7YyPO2hSi/en9kjlnmkyQ3zYI4knT+IvWM/RC1/yrd7xo7U88Z6iG/DoCC5/G7U+BT
         Lr9Qzvq/5FNhVN7IeSIV7iAhHcwpu7Qv1D0dLLvUNzjHdQlv+V/8NXao23Wj8bENZP/P
         rRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709086373; x=1709691173;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ug25ooKz3qoCHEHw9pjGJUPzAeGvqTHR1DcTVlpibj0=;
        b=ABZHaN63ZkqRaNzDDShAQVTKAF1727EBR60SgWtv0i0T6+bn9iAK25DLvc7zwePsf4
         mDKPq/8xZXTySkdgSzSCeH9RZICxMmwIstzUORzbVNUjyIAGJI6tLzeuJv+hqzj21uy2
         82rnwpu9Kq4AiDs2e6B0O661TockRhbpB6zEH+EJfPgTpZZOlq/rOZeyAvDSEfzl4V8f
         GLo3dE9waMwz98xZsu3ZolYaYzQpR2wc/omiHo8Kdf6GMdfoCUpQvHkZVCycDAxtGAdt
         I5E7O3oguPkRsRoB/2rKa6YyB+6lfV88/F/ZS48AwpwrfN2RGY+1VrbDz6ZHZt2DwZ+k
         K4Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVBGq+O+0C+8/MUG6qcLFBIV/sBg48WKTUsvmQZL3iYooxbbBdZda2FaSNaIwp8bUFWxD2H2/VciaBmnNB7nP+3vEHfSQ/lIJ0smTATHGiQ
X-Gm-Message-State: AOJu0YwSvO2Jx4xT9Qz+CU67GplYVZG98ufWBjvOcbFXyyMWyX8b+C/I
	dKgdV5GenRLuqxsH9hr/ogNk3HQVnfcCcB7bPZTB11rL4LI5l/3XumkoJj+tGm6+K+E2ygaiJnn
	OYg==
X-Google-Smtp-Source: AGHT+IEWMTeeW/rW6Q/Vg95tNiBAFAaIWQo0WCsJMra9fasHaexVBEMkZqZy6bCuf2Vx83BD3Y0c2GDEzj0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ab02:0:b0:dcf:411d:67b9 with SMTP id
 u2-20020a25ab02000000b00dcf411d67b9mr330040ybi.5.1709086372730; Tue, 27 Feb
 2024 18:12:52 -0800 (PST)
Date: Tue, 27 Feb 2024 18:12:51 -0800
In-Reply-To: <75d37243-e2a3-421a-b74f-ccbe307fef96@intel.com>
Mime-Version: 1.0
References: <20240223004258.3104051-1-seanjc@google.com> <20240223004258.3104051-8-seanjc@google.com>
 <75d37243-e2a3-421a-b74f-ccbe307fef96@intel.com>
Message-ID: <Zd6Wo0hQu11L4aPc@google.com>
Subject: Re: [PATCH v9 07/11] KVM: selftests: Allow tagging protected memory
 in guest page tables
From: Sean Christopherson <seanjc@google.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Carlos Bilbao <carlos.bilbao@amd.com>, Peter Gonda <pgonda@google.com>, 
	Itaru Kitayama <itaru.kitayama@fujitsu.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_181257_180336_808E9D42 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 28, 2024, Xiaoyao Li wrote:
> On 2/23/2024 8:42 AM, Sean Christopherson wrote:
> ...
> > diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > new file mode 100644
> > index 000000000000..218f5cdf0d86
> > --- /dev/null
> > +++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> > +#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> 
> Since the file name is changed from kvm_host.h (in v7) to kvm_util_arch.h,
> we need to update it as well.
> 
> Ditto for other archs

Ugh, nice catch.  I'll fixup and force push (likely tomorrow).

> > +struct kvm_vm_arch {};
> > +
> > +#endif  // _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
