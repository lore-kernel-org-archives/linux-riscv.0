Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8012FC0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 15:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f+QejwO+wow3M0IdKtE1cUDkliM48TrQI93ezPpbvC0=; b=2CZo9C0Q9GJX3kp5fYVprmexxz
	3aHIfK5YCg9uaUQx85idVpp/AZVbnsiZRtDjbEtnTe9zv5oxyYsJ+EzDxqFbHEdncFTJUyjSyusDc
	Q1MkM9t/okcLky5EgOeWR907dqUOEAf6Dt3j9iCBRf7QnZU3vimCtd/QkHrsuNBpa+RtL5YuFlrNG
	e2jWWLeCoFBZ022OMvu9C0KVaLiqRUzoqMChdoMZmj4WdLpWN+AwIpGKePKc4xH0lmbyuaZD33G/m
	k+P7ut8oZ+xpzr8uyDuGsQXB5dKPIm//0+xu39ZpFUZWGaXQZL4RHMgpGLkLwqsR/DQjOChM1a2f0
	JYtWFIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2hk-00FjSm-2O;
	Thu, 27 Jul 2023 15:15:04 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2hg-00FjMc-0i
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 15:15:01 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b8a7734734so7092325ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 08:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690470898; x=1691075698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh22aMhq83izPRCbdrRzzwtaMf1me9g6NjbX+Co5bp0=;
        b=V5PJl9OPtbH6rKjCHnQT6vG07X8vn1wK9wE/VoB4pVOU/wXuTZXHBq4qngrQhFqdYx
         7Nc/8XHsnrfsfvv63G5rKFMVKoj2MBlEBdyp1WGHDAFWz3vrGvQ3AdmEIExOtJ1aO6i+
         cnpQEo0+AaWgfFRrDpzagp8FGIL+tu0h/ir+/VZ2zzregWOLzHJM0I9Ivoic0+BxzKz4
         WYd1p4sm9ojfR9ElLG7BmLpUbcffOLNvMQyPdc38Ip378ziKHbWr9liHJkrm859/SeMX
         ozbx6WwLe/AJVj5hZNh0cUCayyHYysk1ulw9KDKJg9gQ0Hv8Z3iv6s5gECSyYS8u0C8i
         fslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470898; x=1691075698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uh22aMhq83izPRCbdrRzzwtaMf1me9g6NjbX+Co5bp0=;
        b=Xxc1GqjVk5tIi1BC24ePz5kkD0mPeJR+iAZ6U9QbtS0J4p9DECa03eeMRzDMPESvf6
         rd01MHeU4ow5cV8Yb5skUbF/833veBojRsSZhfp6MgC7pBE7SHfXaO/TTCOidfDLybzM
         gH3mwBlaRfmi5g6NbCcDvcYKwCkMIQevCOTAZrmbWdOu0m4QGOX8bj7toa3jt3wdMClM
         sUNd8R6ChgukRtPpZXoPzSl3svnd7++CsWJ2OiyZ2ggqxDriCzuUqXwSPTow2txiY1zw
         cfJJVoD4wiN01IYjlWEPTqU9ZKN55XT82rqPB9uyBPJl75XhgDMRWbOZqG52QG3MYLuU
         nVlw==
X-Gm-Message-State: ABy/qLaWnpgE6H1ZGznlCOmX2rXyvr0FDNoOnnrk7v26BXr3klr6wcT1
	E9f7pik0eWD9agV/X4z4Lu8KJ1WqNJ8=
X-Google-Smtp-Source: APBJJlGAozwFR6Zya7MZdDqmVCOsox47jjr1N+m/uDgqX2krJoIRdH7cC9hMOsvAPWaaJ/Ie78DL6VKYewM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d2cd:b0:1b9:ce2c:3bb0 with SMTP id
 n13-20020a170902d2cd00b001b9ce2c3bb0mr23241plc.3.1690470897724; Thu, 27 Jul
 2023 08:14:57 -0700 (PDT)
Date: Thu, 27 Jul 2023 08:14:56 -0700
In-Reply-To: <cover.1690364259.git.haibo1.xu@intel.com>
Mime-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com>
Message-ID: <ZMKI8RknjjZBOaxf@google.com>
Subject: Re: [PATCH 0/4] RISCV: Add kvm Sstc timer selftest
From: Sean Christopherson <seanjc@google.com>
To: Haibo Xu <haibo1.xu@intel.com>
Cc: xiaobo55x@gmail.com, ajones@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Marc Zyngier <maz@kernel.org>, 
	Andrew Jones <andrew.jones@linux.dev>, Vishal Annapurve <vannapurve@google.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_081500_263074_904203A3 
X-CRM114-Status: UNSURE (   9.22  )
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

On Thu, Jul 27, 2023, Haibo Xu wrote:
> The sstc_timer selftest is used to validate Sstc timer functionality
> in a guest, which sets up periodic timer interrupts and check the
> basic interrupt status upon its receipt.
> 
> This KVM selftest was ported from aarch64 arch_timer and tested
> with Linux v6.5-rc3 on a Qemu riscv64 virt machine.

Would it be possible to extract the ARM bits from arch_timer and make the bulk of
the test common to ARM and RISC-V?  At a glance, there is quite a bit of copy+paste.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
