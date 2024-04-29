Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12090C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 21:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LUGZQDDDd/IisKLllfy6Ubn44GrLCvffE58kfGDc9nE=; b=m3g3PcIQA+HPg4rO3QQ7ORJBhP
	WYaqeHKGmptdq9kYTFrq/qv1miALu9DePkHPA33MuRf6P80roYqkbcyZu+Rv7ct8jJUW45WFlSi/O
	DBkaKDhO/iGrmpyGXjBxcKRpwNDPTo8yv8A4nmwC2FmWSA0IZfKbLQa75cUiteAEbPn8YjyUsFezf
	sP0lV1PQTDOIpy2UzUtWQMc/l2WFtnxCSDout9q+iNFmRsz9J6GL0o+8XYs5uBqy1kXg7TqbyzrM2
	8ODszP/fDPNVKiKrbcYtCkjh6OXz0cMG2BC5onuCdgpDup0EKZfDgTv2XQyr8IAcSJK50Ds3vUlXn
	ShBDic2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Y9M-00000004DxM-0tuA;
	Mon, 29 Apr 2024 21:03:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Y9J-00000004Dvb-3nb6
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 21:02:59 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1e2b743d8e3so50997285ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Apr 2024 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714424575; x=1715029375; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xw3vIJGY2NNuKaQ6MudNnqR6rpTRdltf5mCEUSFWvc4=;
        b=uRFjoeV/KqA6nb1AQe+7qt2hVylYjCYejVwDjSsuVoTPHWG/ZXYk2GLdy4wsoDOzb3
         j8SnVCdOOVETq3PR2N6p+KgdeGKswGs9U7LLcuENCce6XIvR2d0g6mJ8xleGURrYtmk/
         t5EDpo7J3QEQ8DlIcLsDnUaA33i9q0GiJ+XXmGi+vtx4xXgHoMgfHjeH7AKfZhfBrIDV
         WObMO1+VrBcst9aTM9Nvj1chS1UyNgWi4P6I0eW16F6+v5zjOkg1o4eRMHChUHVcQpiL
         TOQILC95jARiNdK9uyK2aonVnprZfGB0U0KyNicifEmCuK9kcsXoXkdOoddySaHf7rFd
         0SAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714424575; x=1715029375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xw3vIJGY2NNuKaQ6MudNnqR6rpTRdltf5mCEUSFWvc4=;
        b=CDd/sIPdcl0ns/2/2qPUDSOFlC5ahG4R+veSy41JPVGa2oVw3q5xuJ1irFBzF54Qi/
         vtPwcBw8+WCGbfEfIIs2NR/DuUAwomj0oz9qTYupYbeD7c2rOPrIdsn7ZiYX1TM+0Wkc
         938G14C0ixPfpzXYQiVUk29nmazqrJXH4h+bC3nhmfp2UugOZNMFzTFIsRM8b3NfcBJr
         Q1qwqn5ysPbUXkc5Ktu9XzJ982m9mFi1Zvu7upVA3ywHpxGhYzhWfJPf2XVU1PWzwgTv
         Br3UoCtt+cTmNAume4S7k3eRM4vxHkUc3Ljhq+uP9Fy4hbaEJIJGtb+yRBtcl8kR5qY1
         bqZw==
X-Forwarded-Encrypted: i=1; AJvYcCUZtaclei1LRMNGbAqqOAx9oklr7TLsHMRKvbPFBWxsphoaOTTRJF1Ee+3wAtsbmkjpFLIPp5/0Fn3gd8GQmzldPQVkROtywrQ6Nm4BMHRs
X-Gm-Message-State: AOJu0YyFpD8PFX45VhVFAwoTAnO7gqK7ZemG42IkMNfUwfxtW/lZt4Vc
	PqDU0I9a1klR0EqKnhv5LHA81mYikdZTje40h2Lki9rKgiSgk1cp3QSPNTAUNeufllKA57xkldk
	dtQ==
X-Google-Smtp-Source: AGHT+IFAPa05P5Phibajkpgu95FpzO3FVIMmtbzX/atvNPTvVmV0SeqoPEqwME76DtqNEjJ0m8ryHAcldiI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:d509:b0:1eb:7b9:4f7d with SMTP id
 b9-20020a170902d50900b001eb07b94f7dmr971010plg.11.1714424575332; Mon, 29 Apr
 2024 14:02:55 -0700 (PDT)
Date: Mon, 29 Apr 2024 13:45:25 -0700
In-Reply-To: <20240423190308.2883084-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240423190308.2883084-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <171442341918.161544.2844726781684658994.b4-ty@google.com>
Subject: Re: [PATCH] KVM: selftest: Define _GNU_SOURCE for all selftests code
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_140258_114827_18FFD467 
X-CRM114-Status: UNSURE (   7.79  )
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

On Tue, 23 Apr 2024 12:03:08 -0700, Sean Christopherson wrote:
> Define _GNU_SOURCE is the base CFLAGS instead of relying on selftests to
> manually #define _GNU_SOURCE, which is repetitive and error prone.  E.g.
> kselftest_harness.h requires _GNU_SOURCE for asprintf(), but if a selftest
> includes kvm_test_harness.h after stdio.h, the include guards result in
> the effective version of stdio.h consumed by kvm_test_harness.h not
> defining asprintf():
> 
> [...]

Applied to kvm-x86 selftests_utils, thanks!

[1/1] KVM: selftest: Define _GNU_SOURCE for all selftests code
      https://github.com/kvm-x86/linux/commit/730cfa45b5f4

--
https://github.com/kvm-x86/linux/tree/next

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
