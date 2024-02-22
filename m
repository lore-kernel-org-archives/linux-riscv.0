Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68B3C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 22:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GN29gYLuB26vElK5O0GWPacKvtWtCBNA56SauFs5pU=; b=x5rCSwRO3xlvM6
	YNIujjy9AgTGj/v09lHrVFiCWNedxiCe7mzGF/gEzy8YMlGVoAJl556A/Cma7k3dBcu/7vFhq4aqa
	C5lsEiq8FrlEYNfRM30cxJZQpB0bj8gzCctREtl2ZZnUSmvAkg5XINM5sEi3WUs+RGN3jioIk6h8e
	7xNI8G1oFZLIEbsvNkw3G/owx09DMuzKcdf5HdEIgGgWBYoow2iljaZsB1hBhE9ufrR7ovnKOR7PC
	gFF7uKi3Tk9q6FTzB2A7Cr3jcdn1CujBQbMRYfxshb/v1tDD/mkpsHGkDpKU2v1NEeTBPZW66IAXR
	kXdQq45POJA2xgL/Ceaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdHli-00000006sDf-09I7;
	Thu, 22 Feb 2024 22:42:18 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdHle-00000006sCP-2Qvf
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 22:42:15 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-608575317f8so4400557b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 14:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708641732; x=1709246532; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jFvVQg9UZb065hqoLsESeNre8JaYtsdQOcTRgkYVRKY=;
        b=NBSqsBa/rEJumSwiXAAFdbtccM7nCgiJqE9boqUAV8/brOykbf3V5fqOIcuEisD0vy
         +NFicUGKEGUg0AZd5y1nKFta5xDNPzjHaImtdr2ndDJiva/3bPWJ62NIUPtS/jO7rN5m
         QLb+ZXmS5SlJM8hxCqQPD3KAdwhtsCaRsq2Ys2V1wpoox53HeorVOX8ComHBNKbGo81U
         6n5zVfH0TYGS4zb2qHZy/DOJp1AswUq0S/fQKRUnkayNH/bxxvxSxcSOJvwm2kNoJ0bM
         5jn2BogA9Ze0DIMTdcMkt5m8qwImkvA153YTPuk/5S1cWATKDyMbi5CXjSiFD6uCnfc3
         WW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708641732; x=1709246532;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jFvVQg9UZb065hqoLsESeNre8JaYtsdQOcTRgkYVRKY=;
        b=LA1W8tWG9Bn/fzt6OhyB+rpGHagXExY32z6/K86XTHvywly0fQpUlPPDZZRPqpQGu5
         ujNgdDVtP0BqnBrxpvCE6ltsJPO8nk6et+Kax6VOssVoHu6uHdZiP0FQPW0pClzE5wQ+
         13fD0ygMefMndXV/Tpu+jYqDDyEBd/MvFd9KLqx4A3tzXNea0kUJ+YBpD6TaR0bswhKy
         lT/GwPOv8D3SeEw1gBxQUhdROiYxYvYPLhKKLp0DVYO/2FufYnQZzMjGKhwdbQD3jPAc
         jYdwLJMQN/lYSli2Uf4y98vODGufe/hjcbYIPWZpq95rdXKX70L5adgYLaJTeumGhdwQ
         /u0w==
X-Forwarded-Encrypted: i=1; AJvYcCVSBgnFmL3AzPf0xKIDHHQvls+mJY8zxXWD5Sr1eslrhZz2K00UPkJS22FewZ4VvSgjTG29SZzXqdVvmosg6GA95ZDUg7VWQOK/cX5s7cot
X-Gm-Message-State: AOJu0YyjGmYqBl3CNXiZm1k9jm7N4UbQ4mKlVFmzz5IkCmH+UYA8K6IU
	8uepoEB1/Tw9EKIajWnM59ilIN06fp7n4EXYIEwA91PnDy21UAaG5tEek/EhAi810tmIRx3vz54
	nIA==
X-Google-Smtp-Source: AGHT+IEn84VsOMK3xly4fJg9p4ZGQL4jC+l+k5U6BnNNTDUyy7r/Gzq9iPM6OigIQq722pMhxaceeSC3g0o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:9242:0:b0:608:20df:8b0a with SMTP id
 j63-20020a819242000000b0060820df8b0amr102171ywg.6.1708641732562; Thu, 22 Feb
 2024 14:42:12 -0800 (PST)
Date: Thu, 22 Feb 2024 14:42:10 -0800
In-Reply-To: <ZcKYRsNUAngWGy2a@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com> <20240203000917.376631-11-seanjc@google.com>
 <ZcKYRsNUAngWGy2a@google.com>
Message-ID: <ZdfNwhe2s0Mn2gB4@google.com>
Subject: Re: [PATCH v8 10/10] KVM: selftests: Add a basic SEV smoke test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Peter Gonda <pgonda@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_144214_653172_41B3A6A4 
X-CRM114-Status: UNSURE (   9.45  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 06, 2024, Sean Christopherson wrote:
> On Fri, Feb 02, 2024, Sean Christopherson wrote:
> > +int main(int argc, char *argv[])
> > +{
> > +	TEST_REQUIRE(is_kvm_sev_supported());
> 
> This also needs
> 
> 	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));
> 
> to handle the case where the platform supports SEV, i.e. /dev/sev exists, but
> KVM doesn't support SEV, e.g. if TDP is disabled, if SEV was explicitly disabled
> via module param, etc.

Thinking more about this, I think we should simply delete is_kvm_sev_supported().
(a) it obviously doesn't query _KVM_ support, and (b) if KVM says SEV is supported,
then it darn well actually be supported.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
