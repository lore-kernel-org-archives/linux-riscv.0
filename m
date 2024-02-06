Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4720CC48297
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Feb 2024 20:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4akC0WpmeORRK5lW2gmb8oInsRQAF2LlTmn3IhDrdvc=; b=mhTApKYxIoTTKh
	Y9HQphHqd3xwAlUOMuCXWc2c+5RBqrQ7jdffjPniN8MOLTlEElZ1g9SaaaYLiXlfDLbssP7+8jZ4Z
	gSNUYdX3UFSMq0KmdfNPtWGO3xVXD8sRSPXkdoiU5mSlLaPp+PF1SmjfhwLMLJuGSCXMetQHVdImj
	qtsh3kt+dwzHCNYliisuqhpSZXISt+ocD6YLm2oj+mta45X/81ZDygFm7kjXqqEJF4RCxKWEfH6+Q
	gvbahoOiQhKRGyErM9PmXYXvRHzViW5ejJ3QSAp3vTe+S0+dA8rg3Q6dGm1EhX+WtBBdoUxmJMslW
	O3KggkHbE1lhmSf3zADQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXSBC-00000008t6m-1Yqs;
	Tue, 06 Feb 2024 20:36:30 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXSB7-00000008t01-30vA
	for linux-riscv@lists.infradead.org;
	Tue, 06 Feb 2024 20:36:28 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5d1bffa322eso7461578a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 12:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707251784; x=1707856584; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jzwz3V63szJHlExhCZvPC7c2dtOM+k/FDHvQAaa+NEw=;
        b=lY21KX7epEciYjDkhDHyL83VKvsa8CkuCd9nL7RGwBSTdTA4iQKrfTlO0W37pukqOw
         anRrSZpFTUV60mTijPM+AXfVg7q8Dp5PMl5BbMOckfmXMJebCRnZYwP66u88kyBJlx9a
         VQeu5bKVIrdJVxdzmcqKT4WWYQL3hFew9Q8clWB2gcH5Q8WgxiE4a2/hGsVWibCJVZnK
         sR917Pm1M8vQkVtcYaJYaCbauy8NibwDUbKpM9NigUtCqtbHPd5Ysa5q3QiYwsWxfuHT
         FqecKcbPNImkiJTURoylOAVBbKjkI2dRr1BLUy/fmEuyDSSJWv/CfpCAeMrjrdA7UTCq
         hxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707251784; x=1707856584;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jzwz3V63szJHlExhCZvPC7c2dtOM+k/FDHvQAaa+NEw=;
        b=hSe7BW5It+F22bR6k1Vw9uLo+E+ICgHuCCgkkaGRrZcD3nBYx5oStDj3xvqSYEuN8Z
         076dTkK3I21ZdtrWbVQugPRR4Goz0NSjWnmjeUmbnRzxsbLopYaUFKausrv2Af+yGCun
         7UlVuSt9gHO3RdoZ18j1R+gm7ZBCPIdUr2I4QBXuL3tQQ0bkp3OBrqqE0BNuAe6XEqL8
         VtaZrsNsRN5dhRm//dT6LO6eKyVFX+ZZx19hmz/BoqeD8Nu8VL0Hiu3UUQWcoGfjb15t
         LAQk+6m7I/NGh/tF0A5bHQxnnPW4a3ffPgeoiR7f14whSJlPWYeXP14oPviUf61mVP6X
         NxDg==
X-Forwarded-Encrypted: i=1; AJvYcCUB8PXOCiXkQ3zXJXfJbifAST3Ugab6oKoLqq7sSujdiCWScbMzt7TwyKEvMZBj3SRhjlNYrhHqRDXkg8i/aWoQtQxJw39FJKx8hbB97kXZ
X-Gm-Message-State: AOJu0YzGYCZOPKjCV4zTfkegHi8cCFMquUzkejSPmXfLbkO8yjDu4kQy
	bhOaNuF0o1VVKJKD/StXgp7oQsly251fnMh+WrNi41WOsVCr2ZM7c8mNzrgwu9ekNlPDlmaNXkm
	kaA==
X-Google-Smtp-Source: AGHT+IE+O6nMTqNGYB/t77HMprboX4PQjl7+xgDRrny/aw5DBBLxjaHIIhAZ2fE2KVmSzCD1jBDPxM7Dmrc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:313:b0:5ca:45d0:dc1b with SMTP id
 bn19-20020a056a02031300b005ca45d0dc1bmr1646pgb.9.1707251783750; Tue, 06 Feb
 2024 12:36:23 -0800 (PST)
Date: Tue, 6 Feb 2024 12:36:22 -0800
In-Reply-To: <20240203000917.376631-11-seanjc@google.com>
Mime-Version: 1.0
References: <20240203000917.376631-1-seanjc@google.com> <20240203000917.376631-11-seanjc@google.com>
Message-ID: <ZcKYRsNUAngWGy2a@google.com>
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
X-CRM114-CacheID: sfid-20240206_123625_875771_6CE191C8 
X-CRM114-Status: UNSURE (   6.46  )
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

On Fri, Feb 02, 2024, Sean Christopherson wrote:
> +int main(int argc, char *argv[])
> +{
> +	TEST_REQUIRE(is_kvm_sev_supported());

This also needs

	TEST_REQUIRE(kvm_cpu_has(X86_FEATURE_SEV));

to handle the case where the platform supports SEV, i.e. /dev/sev exists, but
KVM doesn't support SEV, e.g. if TDP is disabled, if SEV was explicitly disabled
via module param, etc.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
