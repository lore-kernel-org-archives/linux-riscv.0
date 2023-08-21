Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628EBEE4996
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 19:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=fL5G99grNtDfhGkM0iYOk+LWB/HjvgtvREJILAZMR7g=; b=oLG
	95aEwuIy6b5s5VxTLXEKwXECk3ixyFiJ0nmY/Kyq/JMIWAv0fSD/52GDfn1qPf9pk96Rrd8/vaPTt
	o9OEd0lYBfhQwPsxiwghwU0oRnRMdr37XUFBT82QVUzc1WkzCNXwJXfajgbr4gc2dt539eJ2pVaxX
	JY8Yydti5vhPS6kfic9/G3SSDxFMYTjA5ZewPkueTa4ju+0aavXQHfx2c0PuVMpL3rJKfq3SpAEdH
	dq/NBJ3l8IjkSerg2vejVERLRi7mqfPasFu4oxHuJO4tcq5s0woBFeCk1aKYQs8hR2JxLy/z5ovVC
	bj86a6twru4pw1YULxqXOH7sf/Aq9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYAtm-00EcBz-0S;
	Mon, 21 Aug 2023 19:49:14 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYAtj-00Ec9D-0a
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 19:49:12 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d74a4cc9977so1948094276.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Aug 2023 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692647347; x=1693252147;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJZGEQtf1VL3HQEXak5eCjnl1mSbYK2LpINf2Y7mWuc=;
        b=RZl6OjBiLyxrlN7m8yUzSzxx4s8l6y5XQtCqoL2DKa9CznCEyAG8OEzPqxiGWWfNJU
         DP58nwM09rHRg7Se9vncvUgBs+EoatdB0oIHiYis/CY/mK8bpz5tBW/wF/N/V/N/8FcH
         u/rMp5FZpxMI+ASR8w8FwZSKb5yUKy8z1UKPp14XAoTBk3vwb+9KvbuE4eIugJspN8RX
         snR6LHbvF/g0TCDHMTgr7kn44jTj6A+c9BdOOfnITVAKCoxj2XXqVMiBuH5zs1EhWFJ1
         LASBEZFLbEqzA+6VnHUNymrGUBh6X+GLDf47Xj3E2vNSql4sDsL+0xZSb2rnh4OE9Sf8
         LLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692647347; x=1693252147;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJZGEQtf1VL3HQEXak5eCjnl1mSbYK2LpINf2Y7mWuc=;
        b=HMlWuL0Ym8MZOV5SCoSeJZCApL6bcDueiC+0VOFGtxSAySdaE2yivilLAULa5vLXYL
         gXGiT5uI9iOmnIs62+nWhK8JmsXEdtErolUPEOgQTN90U6PHBcGcP/JpqwwvDJorKyLn
         hQmpz663f5KKtaME4jZ/EeQ5WLE7gT01PO+x74rsTD2o2+jx2R1NZOHYed7x8shROzX5
         Or2y6BI6VVHUpGtekqo4tIrj5+z1TXaNZrKP4JSb0MSTU0U2IKbffX9I1mRKpcPRVKLd
         9fDz6X3ZI2Je8DMROi6bhVNudBRzCQNZURnCGLSwNOsjuULJe2a48OdcaXsOcRNfL9aM
         8v2A==
X-Gm-Message-State: AOJu0YxzkrnjPI102MVCsUSEqSQjfWBGhIT1mqDT3pQ1FshYGlLUZHAH
	wLNH31pB6jaFf9A3EF4roViNlC6bQCNIAHsBtA==
X-Google-Smtp-Source: AGHT+IHM9bfoMlIQRP0Zhx06e/5qWh61CmNcgWIzhDyB//MY5jBFnNMVKsg1bGSAIpor6rGkYRANDK9cShM4uv9gKA==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:fc0d:0:b0:d07:e80c:412e with SMTP
 id v13-20020a25fc0d000000b00d07e80c412emr56346ybd.12.1692647346791; Mon, 21
 Aug 2023 12:49:06 -0700 (PDT)
Date: Mon, 21 Aug 2023 19:49:05 +0000
In-Reply-To: <ZN/4RjDsBLf0FB98@google.com> (message from Sean Christopherson
 on Fri, 18 Aug 2023 16:01:26 -0700)
Mime-Version: 1.0
Message-ID: <diqzwmxotbv2.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 28/29] KVM: selftests: Add basic selftest for guest_memfd()
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: pbonzini@redhat.com, maz@kernel.org, oliver.upton@linux.dev, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	willy@infradead.org, akpm@linux-foundation.org, paul@paul-moore.com, 
	jmorris@namei.org, serge@hallyn.com, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	chao.p.peng@linux.intel.com, tabba@google.com, jarkko@kernel.org, 
	yu.c.zhang@linux.intel.com, vannapurve@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_124911_218548_77A5B30E 
X-CRM114-Status: UNSURE (   9.67  )
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

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Aug 07, 2023, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> 
>> > Add a selftest to verify the basic functionality of guest_memfd():
>> >
>> > <snip>
>> 
>> Here's one more test:
>
> First off, thank you!  I greatly appreciate all the selftests work you (and
> others!) have been doing.
>
> For v2, can you please post a standalone patch?  My workflow barfs on unrelated,
> inlined patches.  I'm guessing I can get b4 to play nice, but it's easier to just
> yell at people :-)
>

Here's a standalone patch :)
https://lore.kernel.org/lkml/20230821194411.2165757-1-ackerleytng@google.com/

> <snip>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
