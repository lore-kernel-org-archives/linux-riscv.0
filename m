Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617E5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 May 2022 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=G3+sdPZxij06S1dQ/qOOJrGkFNRLpOLWACeaH54CV2I=; b=eEwCaoQaZiwVFzB8ous0p5EruJ
	QxTxnXQf9ybxe4fHlEeZrocWRqjKkM4TqROBvqV1p6mJ5kXqwKNd9Kt0bzE1o7jqMy1h2vOC/MVty
	QKvjOvbSjNIWrJFFhUn6w1GAsEihES/YDvx5BufGOHiX+9bCZ0taNNu2vWqzkhBuCZDd6SR7e24iW
	VlfmwZ87d30QyAE+CPX6vO2Ad6SNHPhDkLSLieOERxq8bmWONIX5LYUvKUut8WnZmj1aVobM7pHDh
	7FO/1GbEksUcnrNk4R2KUYrABqqAoCoLVhzXWqm2DwTPB81xnKBQQ5FrqTU4Avx3aowZPrxrFHWC4
	pwCPBXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmz2e-003pN9-3w; Fri, 06 May 2022 14:34:48 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmz2b-003pKY-8w
 for linux-riscv@lists.infradead.org; Fri, 06 May 2022 14:34:46 +0000
Received: by mail-pg1-x52a.google.com with SMTP id g3so6276962pgg.3
 for <linux-riscv@lists.infradead.org>; Fri, 06 May 2022 07:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=7u3OwSkyFfQPtUMBSXJ+m0o3AIK+1qwz0/mjtmfCQB0=;
 b=FdeTUfLPDw9k8X6pTEaLv52yUet9VfSQ7bi4HQ1t2xxaDysAJZFgQ7VRrYNlmPjTaj
 2tZL8ukYEo7mNc766P4NQqVT9VU4xcQVvoq18pPjJEP+0zEMAny+6Y6R1wOkE1tgO1wN
 uO8kog1rHC8+u41oS0ocTQzuT0i21hJ3Uz5f+CifLuIMIngaK02mJcE8pu1U5afhbLJI
 DQvD2wdX+c/IHeRxzEhPxhM8zCujiWsHkyNF2bZlVm+qDJtsTHgLYuDntTJYuurXEomy
 6N6H/Q1iuEHCKEfOxPpaFPLiJqifIcesYahJuQ4SUdI1fRp5qzJFzMshG8VThV3XD+0t
 zf6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=7u3OwSkyFfQPtUMBSXJ+m0o3AIK+1qwz0/mjtmfCQB0=;
 b=gPHeB04/crTrFkHPF7/xIAaVPJMNWMCkMC8fBhoy6mySejMtKrnxgdDOCYarQ1ItFN
 fjkfJuhmHAHeKEs7tbY/5eVW+DtBvhpf37y8VP+3JxGR6n+KOeetlccWxIbZIcP9u0Sy
 hhoFhh9xYNPfc6L4R+sVsnuYArUBcik3UtN8xeHz7rzWvmQZnXcg3wAxbbBBs34WU8nf
 LHSxq+yN647UT/OveAfEsZ0QRXoI62qCVimJMIizb0vnhAH1N1PUGVP57hYIXoQ+hWY7
 nnTKq3hpykjUp4TIAYOWW3z9TosoxBx8QOx8nv/r9gnQpGwLvuVT0k1n3n+6lbXnjmvU
 VFvg==
X-Gm-Message-State: AOAM533gYVB5IEqCQYmHLaYz3LSGHa3OI9SPTgpVMZR137IW+xEP+ogm
 qiDgo16fMfhfQ8BY4Ds/u5blwA==
X-Google-Smtp-Source: ABdhPJxRyjLgEf03HBpUE/mZuN6gq4KYh/avgT4q6TfXPSIwYir1NJqPKE0fyCteJUZc4c2jSgcLGw==
X-Received: by 2002:a63:d00b:0:b0:3c1:6c87:2135 with SMTP id
 z11-20020a63d00b000000b003c16c872135mr2936313pgf.93.1651847681336; 
 Fri, 06 May 2022 07:34:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 a21-20020a170902ee9500b0015e8d4eb241sm1820885pld.139.2022.05.06.07.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 07:34:41 -0700 (PDT)
Date: Fri, 06 May 2022 07:34:41 -0700 (PDT)
X-Google-Original-Date: Fri, 06 May 2022 07:34:18 PDT (-0700)
Subject: Re: [PATCH v4 0/7] Generic Ticket Spinlocks
In-Reply-To: <CAK8P3a1VjunJE5zAm96pkQX7EvVDcN6VGT8usedeO709KQnB_g@mail.gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, guoren@kernel.org, peterz@infradead.org,
 mingo@redhat.com, Will Deacon <will@kernel.org>, longman@redhat.com,
 boqun.feng@gmail.com, 
 jonas@southpole.se, stefan.kristiansson@saunalahti.fi, shorne@gmail.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Greg KH <gregkh@linuxfoundation.org>, 
 sudipm.mukherjee@gmail.com, macro@orcam.me.uk, jszhang@kernel.org,
 linux-csky@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-2750a5d4-cb79-4142-a8c6-e7e0c80f8e85@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220506_073445_344626_38CD2279 
X-CRM114-Status: GOOD (  21.10  )
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

On Thu, 05 May 2022 04:09:46 PDT (-0700), Arnd Bergmann wrote:
> On Sat, Apr 30, 2022 at 5:36 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> Comments on the v3 looked pretty straight-forward, essentially just that
>> RCsc issue I'd missed from the v2 and some cleanups.  A part of the
>> discussion some additional possible cleanups came up related to the
>> qrwlock headers, but I hadn't looked at those yet and I had already
>> handled everything else.  This went on the back burner, but given that
>> LoongArch appears to want to use it for their new port I think it's best
>> to just run with this and defer the other cleanups until later.
>>
>> I've placed the whole patch set at palmer/tspinlock-v4, and also tagged
>> the asm-generic bits as generic-ticket-spinlocks-v4.  Ideally I'd like
>> to take that, along with the RISC-V patches, into my tree as there's
>> some RISC-V specific testing before things land in linux-next.  This
>> passes all my testing, but I'll hold off until merging things anywhere
>> else to make sure everyone has time to look.  There's no rush on my end
>> for this one, but I don't want to block LoongArch so I'll try to stay a
>> bit more on top of this one.
>
> I took another look as well and everything seems fine. I had expected
> that I would merge it into the asm-generic tree first and did not bother
> sending a separate Reviewed-by tag, but I agree that it's best if you
> create the branch.
>
> Can you add 'Reviewed-by: Arnd Bergmann <arnd@arndb.de>'
> to each patch and send me a pull request for a v5 tag so we can
> merge that into both the riscv and the asm-generic trees?

Yep.  There were some other minor comments, I'll clean those up as well 
and send something soon.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
