Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D54AEEF318
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 17:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4CzvI3TDKcm6ggOrTT3p0ECRaHK7kjwaK6T4qB8zDcs=; b=M6YKjt9pHnap1I2w8QrEFHS0Nl
	wcOAJc6/08y49q/4qWFa29zsKQm9YHdv414fVRXpnrjwa18UbKCWYhbNZfrQa+souAKMDQMzyPzle
	rW4KGSYK0Sl5ndscC6FYCj9/8RHy0ADj85L+Ct9d4TvsiG1spxfOzXJgqiqpo9QqqT/e0VBbs3l8x
	1wszu+bnC3kR/HJFqdkGwyCNcGdCHPAMo64KzpQRMqUyhK77zoVvSbwB39ydgyNmCkEqaZQE8zIuX
	yJ8S2oMp7B1mzOp6Or5WYtB/KpNgkgottDCG03DVeovjE6YIcYNNAVCBud29gj89/nODSzZS5hhdG
	fYKWmXGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCPb-00000002Hfo-2vva;
	Thu, 05 Mar 2026 17:22:59 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyCPZ-00000002Hes-339r
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 17:22:58 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2ae49080364so40620425ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 09:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731376; x=1773336176; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p1wGeuRJ/eZ0ds4iRA1USsFNUrpQJYzw8H7jxKUj2JY=;
        b=FOLiUk7xIG2OtDzj72VK7nbXKcA4lsx5vhhS7PyOIBnckU6uoPJZpl1CyNHItTql1l
         zlMW2e0uVf2vsRtXbc6SOP3aaVnzgxljZBkT+xk2UiqZCs1GDr056IYIosqdzcLGAXcC
         vXyRMeXKjtTGnmJshtPvfCYXM1hCL5tZbRUFI89cHLPj21wwbOyrYv69qoYdQ+tpe6FY
         lXdrhqsFHhPh9/U/yXpC1ogkbLBZaBLSEJHeaSC+Wmfi93ryiIU03cPz0gwotDRxOHs8
         DqoYYW3VnX4GJYN6oRNdxL4gLGF4+zAjRFYc5QIIPOfT1W7U9d4hUIBnWB5I3RZGaOUV
         x4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731376; x=1773336176;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1wGeuRJ/eZ0ds4iRA1USsFNUrpQJYzw8H7jxKUj2JY=;
        b=h+FD8Qua2mDBnwNJLPk0UHibRSd3QFNTuFkxj2EWMrSJsDK4VdRC2yC1YD75LwRRH/
         ei/wWcHAKcabObxkU50/2eR6JncpiP7Zr+0kbDENy+lcgMsvYa7Gug0ZI77Q7BnYSPDM
         aj+FDI+enBRx6HAEW/+wByatY3Ai9tZsoeDrT8Bsh3RJwnan3UWK9IBIg3rGH/13JkLO
         GMm0FZStq5gbuJPxizvhBZICP2efgadEBXuqwwZNSTyOI4KY2KuqhX0Hj6BQ0q/ZHQC0
         0pcgX25g1q9+A2Pvq3fdehTj/54oCyzvfb6bdEy2E5epFnMb43AH2oQQfLrqMThzgZP4
         Vxpw==
X-Forwarded-Encrypted: i=1; AJvYcCWnXtL64WxBx2uJc/1ibhGCBE5SnF4hZ0/xxCFb5nbsu1XEh3JDW1a7RUG9G+9UqJhgyvjATDtGhmAgGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8A+6KX7d8vY9j8QLEdoNmfa8OHC3UKOc5aE+reL4MLMvbydCp
	NqPg0H+s3LmTCmwTRZ1T1ol8YKEZU+xnGJSWj081A200oPrC6GHFlUSbJ8nFFmTiVBDpy/gG4qZ
	MFms+sg==
X-Received: from pgbda4.prod.google.com ([2002:a05:6a02:2384:b0:c73:7810:6005])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:166e:b0:2ae:7efa:b2ee
 with SMTP id d9443c01a7336-2ae7efab422mr8334235ad.45.1772731376023; Thu, 05
 Mar 2026 09:22:56 -0800 (PST)
Date: Thu, 5 Mar 2026 09:22:54 -0800
In-Reply-To: <20260220004223.4168331-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com>
Message-ID: <aam77t8fe5RKSr2Q@google.com>
Subject: Re: [PATCH v2 00/10] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
From: Sean Christopherson <seanjc@google.com>
To: David Matlack <dmatlack@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_092257_795602_6C3D5660 
X-CRM114-Status: GOOD (  12.77  )
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

On Fri, Feb 20, 2026, David Matlack wrote:
> This series renames types across all KVM selftests to more align with
> types used in the kernel:
> 
>   vm_vaddr_t -> gva_t
>   vm_paddr_t -> gpa_t
> 
>   uint64_t -> u64
>   uint32_t -> u32
>   uint16_t -> u16
>   uint8_t  -> u8
> 
>   int64_t -> s64
>   int32_t -> s32
>   int16_t -> s16
>   int8_t  -> s8
> 
> The goal of this series is to make the KVM selftests code more concise
> (the new type names are shorter) and more similar to the kernel, since
> selftests are developed by kernel developers.
> 
> v2:
>  - Reapply the series on top of kvm/queue
> 
> v1: https://lore.kernel.org/kvm/20250501183304.2433192-1-dmatlack@google.com

Sorry, I was too slow and missed the window to get this into kvm/next without
causing a disaster of merge conflicts.

I don't think you need to send a v3 though.  I'll prep a v3, a branch, and send
Paolo a pull request during the next merge window.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
