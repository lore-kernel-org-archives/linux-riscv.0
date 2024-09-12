Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCE6EEB565
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 09:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2IXIEvLV9NtEQTEdL2uXNDsoVVlDNg5PNaRDv+ACW5E=; b=HKuKpdC8kI9BsJ
	MMwxy4VPCMC+tmIW6guwIe9ithKNVA52RBFvRJw3jlrtw3WxCX8UQqTdQ7bFW9XBMyqt+VKRp08Fw
	cR44fEabFXelHk9r8gZisgoMFPTWtdeFoF3W9M7MlDRffXDtMXFfuKEbFFaL5t1jX5sTSJ7FSU+Uu
	YLRwL8lB/fTAGj7o26PIkhEmRYD3/RyXQmQk3nVKgOVeFIssmhBYU5D6CW5p3u5KX05uECFUHJoM1
	nh6hAgUvR0aVOMhLZjIN6a1lYrA/mDmJP8P0taHu6FeFTDQr93Z08rQ2HDbMp9zPARYh6KtR91tIY
	autCB8Sjz59Hwhu2hjdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofsY-0000000CUCm-01TO;
	Thu, 12 Sep 2024 09:12:42 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sofrQ-0000000CTwl-3ryf
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 09:11:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5c25f01879fso749813a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726132291; x=1726737091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDYukj80mIHPYCgHSB2w3O30EP7PG7QCtWy9R/+4O+8=;
        b=dCWyEASp/St5fOVrXYbLAXOVL+aJleoApmzI3nl/vjrlS5Rm4Tn0saIpusDmuP9WYt
         iLWUS2EP+8uifvLpnMq3Ks251JFbGZRxCf/Lo6SSn5Xxj2mJO2RUwyusC07H56SC9STf
         1Hkiq+hiovSBVhK9c51t2HObUiaZwMNohZjOBiufOaav8IOkvvA4TyTIpplqsW9GN8np
         1OPO96iX0mf0VChS0q+phAa/DFxTMjBkSVSAVTbmRU8L1dy/Gi2V9M/TBDu9hhsQplIh
         q47xqSzisbglFaqCZNLicvnMJf/U8fhWyv87ZCx9QEuvKnUBVg496WCYz27Za2pVUBAb
         z9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726132291; x=1726737091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDYukj80mIHPYCgHSB2w3O30EP7PG7QCtWy9R/+4O+8=;
        b=o9LzqLfuj0BdtNf4X4q80wHDGCMOziBLSeyRS1KAmAQ4wCo8TAQHwCaXULluzyK66f
         e7+fI/SCf741JKVtccdImCfnzRlci7Sa3+WNlt4ijY3SYsviRXcGrkqUkF7EqhzX71Sa
         UGlwqUPZcID3EwG4etyPWm46jp/hfOKrfdnCKrmMx8WvPe53QgZvoXgKhmyfbe1/oOLO
         lb32K1XUnd+a4vARxA5di+fA2dSKF6Jk8Lq/EFBCMuXGRPpOFriEUiYNC97xu64DFLLf
         4su6/8wMICvQkEzdq+Cr/kc9uKSDIlg+nVs9NtEuk4QjJcx9HIzs75j3zBZFEfUjncb2
         OwZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaPz4XgKMz9m9iak0m1xcpqEt6BGALECy/vCYIDPGTGduSjrbX7AAJoPqI26etTa0f6KRguQV+fZtXRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNoJmNDG5+G4S4GREhE22utJ31AwP0trTb7wa7+ioU8koiwNGL
	QJ6W8dy3wPOshxzLEbTwzOJsgGjyH9CiDor/L6O7dsu5sjyzCQFuIO2jleHzNTU=
X-Google-Smtp-Source: AGHT+IFYGstY7Ee7hZURlNK3JZABLF8M1RnLjnl2KXSy/Qm7bwNeqA+fGuOPSyrnOfiIz4Olnre2Gw==
X-Received: by 2002:a50:cdd4:0:b0:5c2:1f74:114f with SMTP id 4fb4d7f45d1cf-5c413e54913mr1194735a12.34.1726132289759;
        Thu, 12 Sep 2024 02:11:29 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd467desm6239500a12.40.2024.09.12.02.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:11:29 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:11:28 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Subject: Re: [PATCH v2 02/13] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
Message-ID: <20240912-a3894135370bf3fe551ed018@orel>
References: <20240911204158.2034295-1-seanjc@google.com>
 <20240911204158.2034295-3-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911204158.2034295-3-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_021132_995680_80CFCCB7 
X-CRM114-Status: GOOD (  14.69  )
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

On Wed, Sep 11, 2024 at 01:41:47PM GMT, Sean Christopherson wrote:
> Return a uint64_t from vcpu_get_reg() instead of having the caller provide
> a pointer to storage, as none of the KVM_GET_ONE_REG usage in KVM selftests

"none of the vcpu_get_reg() usage"

(There is KVM_GET_ONE_REG usage accessing larger registers, but those are
 done through __vcpu_get_reg(). See get-reg-list.c)

> accesses a register larger than 64 bits, and vcpu_set_reg() only accepts a
> 64-bit value.  If a use case comes along that needs to get a register that
> is larger than 64 bits, then a utility can be added to assert success and
> take a void pointer, but until then, forcing an out param yields ugly code
> and prevents feeding the output of vcpu_get_reg() into vcpu_set_reg().
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/aarch64/aarch32_id_regs.c   | 10 +--
>  .../selftests/kvm/aarch64/debug-exceptions.c  |  4 +-
>  .../selftests/kvm/aarch64/hypercalls.c        |  6 +-
>  .../testing/selftests/kvm/aarch64/psci_test.c |  6 +-
>  .../selftests/kvm/aarch64/set_id_regs.c       | 18 ++---
>  .../kvm/aarch64/vpmu_counter_access.c         | 19 +++---
>  .../testing/selftests/kvm/include/kvm_util.h  |  6 +-
>  .../selftests/kvm/lib/aarch64/processor.c     |  8 +--
>  .../selftests/kvm/lib/riscv/processor.c       | 66 +++++++++----------
>  .../testing/selftests/kvm/riscv/arch_timer.c  |  2 +-
>  .../testing/selftests/kvm/riscv/ebreak_test.c |  2 +-
>  .../selftests/kvm/riscv/sbi_pmu_test.c        |  2 +-
>  tools/testing/selftests/kvm/s390x/resets.c    |  2 +-
>  tools/testing/selftests/kvm/steal_time.c      |  3 +-
>  14 files changed, 77 insertions(+), 77 deletions(-)
>

Other than the commit message not being quite right,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
