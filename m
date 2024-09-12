Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1780BEEB580
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 09:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hqBVXMujNbxzBbwq1CwbEfYCft9F6xDUKB2xtOf4ybY=; b=hkVDihsK96CU0E
	8ZgE6Rew8C19Zgq4696tWxow3RrD2eUOCG86vDpVMT4Ft+RuanfmwUdQQmuUR29XjdlVnSrWXoLGT
	m5+2LLSMskDTt7iWYvCvH1VhVyf/QPVdJYcEm+AIBJqVnp4mKmauC8Y1SHbAaiMx8iifIZ+cCFlmW
	Rpa7YpFBFmCKyrbn076DM1/V6T59RAA5B+aN11DYBMgprtMlXGnD6FQBez12ij4MURiBlZ6OJNnj6
	fo4oK8tbnga4O7P5H8LvpbnTQ77HPcvz5tifunkwZvKZXygvTHc0t4EKBnTsspdnUVA+uJU89f6vr
	hDwOv8I5grGHqtGUiEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogLH-0000000Ca5F-1E9v;
	Thu, 12 Sep 2024 09:42:23 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sogKB-0000000CZry-1WsH
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 09:41:17 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2f029e9c9cfso8238481fa.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 02:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1726134073; x=1726738873; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aiemgFzmdlVArSRtl/VBHqqgaU54TtFT6LBWQAz3Kr8=;
        b=pK6KvfYiQb0v5diNbb859rnS+ngFFX1+60sOfxqo881JgPXtQ8Suwho/iJyJ3e3Qc2
         iZp9CAFS5J4fs5TC2kW6oxQiuYOi3W3O46qCu2BO+v8uK5zcLAexe4ucHHvpPSMC02fo
         8jmXnyiXz+VksYvhZLo1eAM/QS6q/7TDpB+h6TfaEEB+jjImcVqh60XhXMAhmATXNaBs
         sAYltLcgE3fC0io8f6ZElhSqkBHhVA7rowowwJ8hD5ae/3POEJ+vqLF/DXmt+0pNTUWZ
         RtWjUq0Im7SigVwpUuE/HjRfBlkzH8lACkeicJhXheBXMziFVIFzAI3nMUJBBuIXFKHB
         maJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726134073; x=1726738873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiemgFzmdlVArSRtl/VBHqqgaU54TtFT6LBWQAz3Kr8=;
        b=o+7TNU9f9HYQ1brj3s4155F+CttHuySfBcuPmebOYRXqgcM6XwA2d4bEeBggjhJtmd
         ghYaasm13LZA0svHZ5QRWOUAalBt6GvzmFQbtj7oPAVARi1Cy92jRS5A/ygl6lQgaYt8
         U9en3G6e1GrJ3kStt/u9l03vwAD54WrtY0ftT/2hrZpaPpJsb1kvGlelnUxCrGXHHZxa
         KX4yzmtQ2uuQb0BG2wJLveRL7fxm793Erupnur42B31EmL0lHriuMy01jFWof0k9AHnU
         8LtnG2EKO/EEHr3UayQNxtKRaQMw0wi7HIMUVvVIIUyr7KLykNDfT94kokYu19DRQIcD
         KTMw==
X-Forwarded-Encrypted: i=1; AJvYcCUs08BmbCQbxAyxLY3EqtKWF1a5tM0bEG/ug7KKDIxoF8DjgaOQBEPr/7cgti9Aen/PBdP0ZE6i/CNWRg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHNrTOl4veX8QkKztbkq6tsX/DclWhG1xIehAm2SAXmYJ8J/DR
	MTBd/PWhF0Fl2+KF1GYBapsqfJ036lzyCDO5asPo0/uKJzKSmzwnuyc91VYPf8g=
X-Google-Smtp-Source: AGHT+IE8hrIDE8jMWqmlxIeW/6mf22/C3WP/B4LyK9EfIJcAxDLa0UZEL1XXRZvbqP4WfQWiTVCnKg==
X-Received: by 2002:a05:6512:31d3:b0:536:5509:8857 with SMTP id 2adb3069b0e04-53678fb7196mr1697881e87.21.1726134072038;
        Thu, 12 Sep 2024 02:41:12 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c72757sm721848266b.103.2024.09.12.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 02:41:11 -0700 (PDT)
Date: Thu, 12 Sep 2024 11:41:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, James Houghton <jthoughton@google.com>
Subject: Re: [PATCH v2 04/13] KVM: selftests: Assert that vcpu_{g,s}et_reg()
 won't truncate
Message-ID: <20240912-75f992936cd9878d0e507498@orel>
References: <20240911204158.2034295-1-seanjc@google.com>
 <20240911204158.2034295-5-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240911204158.2034295-5-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_024115_433198_75149146 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Sep 11, 2024 at 01:41:49PM GMT, Sean Christopherson wrote:
> Assert that the the register being read/written by vcpu_{g,s}et_reg() is
> no larger than a uint64_t, i.e. that a selftest isn't unintentionally
> truncating the value being read/written.
> 
> Ideally, the assert would be done at compile-time, but that would limit
> the checks to hardcoded accesses and/or require fancier compile-time
> assertion infrastructure to filter out dynamic usage.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/kvm_util.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 429a7f003fe3..80230e49e35f 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -683,6 +683,8 @@ static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64_t id)
>  	uint64_t val;
>  	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
>  
> +	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
> +
>  	vcpu_ioctl(vcpu, KVM_GET_ONE_REG, &reg);
>  	return val;
>  }
> @@ -690,6 +692,8 @@ static inline void vcpu_set_reg(struct kvm_vcpu *vcpu, uint64_t id, uint64_t val
>  {
>  	struct kvm_one_reg reg = { .id = id, .addr = (uint64_t)&val };
>  
> +	TEST_ASSERT(KVM_REG_SIZE(id) <= sizeof(val), "Reg %lx too big", id);
> +
>  	vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
>  }
>  
> -- 
> 2.46.0.598.g6f2099f65c-goog
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Shouldn't patches 3 and 4 come before patch 2 in this series?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
