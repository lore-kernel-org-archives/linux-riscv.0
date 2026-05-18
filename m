Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B481CD4F50
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 13:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=J50JlYXCScXrEnTi5eT1phY4hGmxZ0q063/n32x1eWw=; b=M6eCN9OKjekU/mwd9WaYP6K7Fd
	Krnm/z0KI6ZgDgk/i3MRtGBsK4n/BGfKV3QswWcr6Lu7qMGetre2X6YbI3FAFf2sGACJOYAxnpPKN
	6b6wC5/A7ByPF589rydobAgqhb9SjR1YsoglKx98DFJ3/ddiO3MsXeMN2TZLKb5AGLHZs4qNRXO8W
	nj/nCEABlLCa+0DvnKIqQbUq24HI2rZs5z034nrwkkn1ca3M5JoSRDRcO84NjetdbPqC8A8Ho4IRc
	rzTTOrtr7uaCwtr3Qpv5BxZdVe2zQl+HJHGCMpzSKb6l+cZSiNbML1WAGmWJjFIph2OZllIItJuo1
	AT7m4vkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxy1-0000000FoB5-1Cgb;
	Mon, 18 May 2026 13:25:09 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxxz-0000000FoA0-0Htt
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 13:25:08 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2ba224c3ffdso59762835ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 06:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779110705; x=1779715505; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=U8qoVNkOwHjXFecSlVoxGZKKrJQ+Chvyfnc0mBlOZlI=;
        b=ALrHyq3zwRog2FEo+ApoM+auYm8LW955ldbZ8JjeZ4d5+r0ANEkneXI8ukyJcr5zuw
         T5QpYpYyDj1SPitBL20y3AXBGIVdtdRj41nmdZGqme+gFnAl0p56p0BFpMhOW+MkTg4M
         gTZnoa8PItFMa9+fcQ9qL+fVXSuGzdo/ZeF006Bi3h5sMvpl9EptAqagF/oONysz6LOh
         Cdp20+NurtyETKKchB4CYohKlqzLvXsX9cmQXRK/3UgeFGqVhJS4kA21diCz+FkUBR5/
         cBnFWdki26NvP9/pJ/S4/nIyJE/w4H6MVNvahCzoDW85xBJmbzPUVPog7lppDFWCbgCX
         p31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779110705; x=1779715505;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U8qoVNkOwHjXFecSlVoxGZKKrJQ+Chvyfnc0mBlOZlI=;
        b=Lo8j/J26AnWKfSXnqEDTF5gPulvicMdlme1p0TraPI0/p4KEfSqake8Jw0oZ/SRQqO
         Ov1z5yqDgk0DqRT2UMOuZY9XAZWS97P1SR6Lk8ml51DMBZLsETwAPeClvH28htFTiiMj
         akoVe6cfh64nZanHz/mT+CwU7FBxDBqsbLQw/WDna9413MOYSYJSdrH2Ma7OPedukVS3
         ZJWmVjFdzm6WrYlkX7G+V42Ws80U+8cdgywIgz4n5NBhGUky23YJMZeREFFcWwPCq7Nh
         kGvv35H9WuL9XPMpOfsJfSed531DM/qsSHOV14Z24CIpQVPg6dU3Uq0vqy8xVgQODhRH
         WNCA==
X-Forwarded-Encrypted: i=1; AFNElJ9u5CA+royKgI4tzvI2blcTsQz8HlRhyEffdzyl65PZa/Cr7f/Xhi8e2QUBlXLBjmb36IFNN5LnCnBAmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXicyDUG7rUqJReqG4hPwA0ygzNrEhUSBAfGKhw3NiC7w9YwUo
	p//lGuScjuMPizaVevRQPYXVIYqd28p8YNqsJlFbbhOr/uWYhuvPKpIs93or0l9WnQx58TcQ4JE
	fbcmwiQ==
X-Received: from pgbbw2.prod.google.com ([2002:a05:6a02:482:b0:c80:24e3:5130])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:c14d:10b0:3b2:698b:cf4
 with SMTP id adf61e73a8af0-3b2698b0d27mr6157278637.44.1779110705325; Mon, 18
 May 2026 06:25:05 -0700 (PDT)
Date: Mon, 18 May 2026 06:25:03 -0700
In-Reply-To: <22e32ff9-3d79-4130-a3cb-3a4ec2efd498@163.com>
Mime-Version: 1.0
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
 <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn> <agO_0ejKd0x38_-E@google.com>
 <f64029bf-1f4c-40a7-860a-eb04fbe5317b@163.com> <agck1WqW-TyEqkqd@google.com> <22e32ff9-3d79-4130-a3cb-3a4ec2efd498@163.com>
Message-ID: <agsTL_viyxDjamX9@google.com>
Subject: Re: [PATCH 1/3] KVM: selftests: Add unit to dirty_log_test
From: Sean Christopherson <seanjc@google.com>
To: Wu Fei <atwufei@163.com>
Cc: wu.fei9@sanechips.com.cn, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, anup@brainfault.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, shuah@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_062507_110855_4D8C630D 
X-CRM114-Status: GOOD (  17.59  )
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

On Mon, May 18, 2026, Wu Fei wrote:
> On 5/15/26 21:51, Sean Christopherson wrote:
> > On Wed, May 13, 2026, Wu Fei wrote:
> > > On 5/13/26 08:03, Sean Christopherson wrote:
> > > > On Mon, May 11, 2026, wu.fei9@sanechips.com.cn wrote:
> > > > > 
> > > > > Unit is introduced to replace the default 1ms if specified in command
> > > > > line. The following test can't trigger failure on my riscv vm:
> > > > 
> > > > Failure of what?  And does the failure really not reproduce with a higher interval?
> > > 
> > > On riscv, it fails to write protect some pages with valid page table entry
> > > then loses track of dirty pages. Higher interval doesn't help because only
> > > the first usleep matters, after the first collect_dirty_pages, all dirty
> > > pages are tracked precisely then there is no such problem.
> > 
> > Ah, gotcha.  Rather than let (and force) the user to provide a larger sleep time,
> > what if we instead randomize the delay before the initial reaping of the dirty
> > bitmap/ring?  That should provide a good balance between coverage, complexity and
> > user-friendliness.
> 
> I'm fine with your solution, I applied it and it did trigger the same issue.

Awesome!  I'll post a patch today.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
