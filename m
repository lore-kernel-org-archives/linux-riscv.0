Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E2DCEE336
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Oct 2024 17:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SG5RHQrnSWJfr0SXc6zdKPAEQm3HKCeKHjFJg59BDaQ=; b=Tbslp1gE3wjo5GP4c9Amwd0kvx
	uagHyX8Z9rDN79WProayhhsSl8NebZXB0bT/QYyLfRiC2XmZujzkhAmjxmvI/oy0Q3tdl2Zdf9r1V
	799Z7PRo/HFCMjXXK9UoDldObnC9RdUdCDdII9qSb8SGjKGB0JVRHL+L6uXEsudlUAiJ7f52VntHD
	9tvb2Rm4h5pRpF28bm/cc8Yyk/rznQvq7q5SLT1K1nBAD421X/Pv8obtgB0fmpzI+/QtCcTg3u0VV
	7Dv/h2Mmzm/1SJKgBOdvKMmN99cJXolTSakLi3wPblQjAwndDIx0meRmRh8mcAhzQPw4cX+fWlnHK
	7gAjxl2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syaYP-0000000ABiN-0Z1u;
	Wed, 09 Oct 2024 17:32:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZqQ-0000000A3UQ-0g1d
	for linux-riscv@bombadil.infradead.org;
	Wed, 09 Oct 2024 16:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=QfiegqTqluk30uW9InRvZdJt/6Vj6WI5QVJzRzWcgJs=; b=kWBq4VfGElZoyuhg0wHRZIOv51
	xo38W4uPr6/e3m5XZU2M3smuGNuuNkQBck/GhO9A6otPE8jJybYnfiuwVNyAxY9pgoQHkRVQu7hH8
	GC0dWZV8ydy4ZvB0KctMVcgmjPvMiWyU7utZH6s1VO8IfKaHk6mA9/9JZIm5Ji2cOaJoRSbS0jzHq
	HiaQZyg74qBb9IsSxSYTE6GFCoS4lnDeBln5kjGAWwKzBZcZcPHi+fVkeQtLvBX72oqvil+dJvHaC
	pgRPi0uSd1zrL4n6QFebYKfXMpMyDV6n4FRpjZkmKcB9M9RsN2jMHqZP90o9hQ0qAV3Jfv/oc/rLx
	ZzUQTz/A==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZqN-000000052vr-0Wa1
	for linux-riscv@lists.infradead.org;
	Wed, 09 Oct 2024 16:47:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20c70abba48so5594735ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Oct 2024 09:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1728492441; x=1729097241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QfiegqTqluk30uW9InRvZdJt/6Vj6WI5QVJzRzWcgJs=;
        b=poyPFmch+pf5Yc9MeOlFmtJQByfKsRFfiZlPnpNtQaTcg37CHfoCBtt9utXmRwuPsw
         hYy2UJz/uAZy27KxxW6S82qVYZVjVpEHaGAuNxPq7DkpZgIA9nX0HxTg2wQHMekt94Cj
         XiReJ4kxuQVgK4xIrZCtlyIA9kH+i/hr/QJfftKjb7Gdj76kF5tW0tP+F3hwb8x72vxV
         vQEGtdq+J4Yc6ZRJSUAviAOliVwyzzwdDEkEthjnb4yFkXT8mpWN33JX5boLNAnPuUpO
         s9HrZ/g15U9hKgC54L4eXC7zj4y0SEKc15ttUZ+iz86ZPPZy2ihCjDMFzAHJm4Sla3W4
         I3lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728492441; x=1729097241;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QfiegqTqluk30uW9InRvZdJt/6Vj6WI5QVJzRzWcgJs=;
        b=VnsJIIyl+hIM462WIfniAiIjfLi34uqs/5B1z3ABTWU8DhQPa3iZ6GVLJMOZAtzQQw
         snRS2tNsp5g831LlYsGqfrGTTvwsSPDHU+XFFhXcOAaguvZPPH3cLxU2va3C5MgORA35
         SNa1YaAHpcojBja8pIEWZC5gok3MQKixrJ6xQZNybohC1F9VXfTgUmam6DNzfepReCZt
         2o8HJ0NRYWmClknqxIo3dDaPOLDelaEMqtKaj2O4TH2fDPsOXiCQvdHdU81AD2aGLQYv
         SL6JC/D1qxWQZ6t190YeZ8NDZp9tO6J99ipp+rWi69vgN0+OXrUXnbKwq9qWhz6bWW+Q
         7kkg==
X-Forwarded-Encrypted: i=1; AJvYcCWlmP+FxwClPea9XB1EJ7FsSLGACFS+onhFwJVIBGog58XtpwB5MoehrNnjz4MmcafkCDT+hu4UzJ4pkg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyvxsut7owzXD543KZ07G9otJ4j2HTHPNZMU209Q6HpKmPaSuMV
	zxDjNMF7HP9QjMsZ93NvMKNDUzSrH42bsN2/vZ+YeHJcq7gz0kxsQLw99XoyjAc=
X-Google-Smtp-Source: AGHT+IGro+ekaLb+vYWsCnr5zKEX15a+MHGaD6eX5gY1Apv6RjvWXyRZ3YU9RjBVYsXxt0KV9OJLKA==
X-Received: by 2002:a17:902:e892:b0:20c:62e1:6361 with SMTP id d9443c01a7336-20c6374101cmr43814475ad.25.1728492440634;
        Wed, 09 Oct 2024 09:47:20 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13988d4csm72448945ad.260.2024.10.09.09.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 09:47:20 -0700 (PDT)
Date: Wed, 09 Oct 2024 09:47:20 -0700 (PDT)
X-Google-Original-Date: Wed, 09 Oct 2024 09:47:18 PDT (-0700)
Subject: Re: [PATCH 3/3] riscv: Allow to enable PREEMPT_RT.
In-Reply-To: <20240917104409.b9nGBsc8@linutronix.de>
CC: namcao@linutronix.de, tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, hpa@zytor.com,
  aou@eecs.berkeley.edu, bp@alien8.de, Catalin Marinas <catalin.marinas@arm.com>, williams@redhat.com,
  dave.hansen@linux.intel.com, mingo@redhat.com, john.ogness@linutronix.de,
  Paul Walmsley <paul.walmsley@sifive.com>, pmladek@suse.com, senozhatsky@chromium.org, rostedt@goodmis.org,
  Will Deacon <will@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bigeasy@linutronix.de
Message-ID: <mhng-5582a629-6b81-4a32-bcbe-02f2e177fe99@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_174723_366106_04DC583D 
X-CRM114-Status: GOOD (  17.61  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 17 Sep 2024 03:44:09 PDT (-0700), bigeasy@linutronix.de wrote:
> On 2024-09-06 11:48:03 [-0700], Palmer Dabbelt wrote:
>> I don't have a test setup yet, but I figure it's a new feature so I'll just
>> flip it on as a config post-rc1.  Presumably this just works in the QEMU
>> virt board, or is there some wizardry I'll need to copy?
>
> I don't think you want to enable it by default for everyone. The riscv
> defconfig sets CONFIG_PREEMPT_NONE=y by default. For testing you need to
> flip this to CONFIG_PREEMPT_RT=y and since CONFIG_EXPERT=y is already
> set this option is available.
> And yes, it works on the virt board and there is no wizardry needed ;)

Sorry I missed this.  Just in case anyone's curious: I'm not flipping it 
on by default or anything, just adding a CONFIG_PREEMPT_RT=y 
configuration to the list of things I test before pushing to 
for-next or fixes.

>
> Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
