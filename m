Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D145EDE99E
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 09:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1ZT6qcGnBGqO3yULtlp5CYLp+4B7nQtKYjKRZTaqHY=; b=E2CR3sr8DVwqXu
	G+Hgi5lIsks0DG1h98vw83dWG3s7ZKwRUKnPM/Ie2slHdRImlatQap6XNztQp/vG27v7a0RBa5asT
	jTbnhbY0PQBi51mdIa/jeP9OrKA9BIoDP9uDjx+3W2eqNRT5cKjexlF8IuIVO4FqS2949PfPbOtD7
	aEAsaGKHwt80rftpSer/5V3nGk7oq+4DjCxzHKzZjns50CCmHTUjjuBlGFgrTboIw2cf0ldsg6Mi9
	2wR6rAmuX5n/rhgutuF0U4p6jNhrVoTpOwOx4oHX8oOt0IbxlswroLz+5FUZ/30DzU2LWZq00QNhg
	bSi6xAS4k0AclHeRgSQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj15-007sty-2j;
	Thu, 14 Sep 2023 09:52:07 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgj13-007ssT-1t
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 09:52:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31f6ddb3047so673728f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 Sep 2023 02:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694685121; x=1695289921; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=87hkIaEeaycrb+JmT+Kn5bO8XmPQAs/7YcVaTE26sUI=;
        b=jgfdymGEB5wIXhpHmiel07bKVKO/D33NlGNeFM1+BspaW4wr6WdMJirsMeRPm8ZM64
         OBJ5hcITxdzeAJikM0JoW7jy7HH3cqb3ud5cv1GhvrBpVnd57F/+p1LXrbrTAebs0XGX
         u0CNvvTQxTjdEgfFdCsKE/MSYv2z7ycQHrOWGvZb5NZybih9oGGy077ct7P9V/LDRhu8
         MObWzB94Zw8k4U157G7nDqyqzqjdoDJnxicr1/MDB9DL0+jSQIxWMIl77MmKkhF6/WNH
         Ent1hDgLCMztlD/NIlXcNeOIOePTbybUPolgfWBtUhf/OjSNcJq6iZLf0PW0DGTkHpKp
         /ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694685121; x=1695289921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87hkIaEeaycrb+JmT+Kn5bO8XmPQAs/7YcVaTE26sUI=;
        b=UOzGm54sK7IeIDwyKtdnSU0aeIydbeYca0aUftZF3h6gYVs+zE2URCyOIG6iid6oB4
         3iMG8EWssKgosSjZ6kEE7QKuhKULqJ8TKE5mxdU7k4rffgpNyHYJsFcyWg6bZTCl7oBf
         Guxk5vFyQ/oplE4gfEgNNUzeQrsNONXxJjHTTULMFe+i0rNgdqq9+JJRAebxgzteBoNO
         DQt2iuOMqRjtf0RuU+C+RtrY3ojnnMfBhied9hMSJRF2xN+/b0DnpTwdZsm4+Y5z3Awc
         sk6rY8fA4JW+9y4uaJnwM5m4OclJKyx9EAKJRIcrpS2O3lTM+kj/IqBdcIGYdVm1yU92
         +TvA==
X-Gm-Message-State: AOJu0YxV2Nxjlh2Jp07+sS46JvEUwX/EWAm54sGU6k2IpNmF3DWwou3w
	+ViyWU6mZafN6jklWuDEF/ApKA==
X-Google-Smtp-Source: AGHT+IE9t7DU458yWwT1itzK5VNW8FsjrH1qSa0IsiYq57mBauEQWRv09OgpY8852LzCHRw39zKnyg==
X-Received: by 2002:adf:e7cb:0:b0:318:8ad:f9f with SMTP id e11-20020adfe7cb000000b0031808ad0f9fmr4346446wrn.24.1694685121603;
        Thu, 14 Sep 2023 02:52:01 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id j4-20020a5d6184000000b003176c6e87b1sm1290730wru.81.2023.09.14.02.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 02:52:00 -0700 (PDT)
Date: Thu, 14 Sep 2023 11:51:59 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Sean Christopherson <seanjc@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Vipin Sharma <vipinsh@google.com>, David Matlack <dmatlack@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Aaron Lewis <aaronlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v3 9/9] KVM: riscv: selftests: Add sstc timer test
Message-ID: <20230914-d2e594e7d84503ad14036e2d@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com>
 <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <64e0637cd6f22dd7557ed44bd2242001e7830d1c.1694421911.git.haibo1.xu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025205_624996_656A0313 
X-CRM114-Status: UNSURE (   8.10  )
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

On Thu, Sep 14, 2023 at 09:37:03AM +0800, Haibo Xu wrote:
> Add a KVM selftests to validate the Sstc timer functionality.
> The test was ported from arm64 arch timer test.

I just tried this test out. Running it over and over again on QEMU I see
it works sometimes, but it frequently fails with the
GUEST_ASSERT_EQ(config_iter + 1, irq_iter) assert and at least once I
also saw the __GUEST_ASSERT(xcnt >= cmp) assert.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
