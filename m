Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213B1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 01:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0u75rD6DvvtDHL0Wq+AKt3RM3Ru7JkpQa7dK8Y/ioo0=; b=bf1F/AdniiQfb+
	nKzLtxX0L5gm3JwEprOBtP5/2d8HQ6oBDokSR317+lsvfRFxG/EG5a+FEF8DrSTFxhB3fUde0k6XE
	QMnmVOFEe3IsxksLOshnETEi5O2Xx357DvxCFeF4Q/w/8H5PChL7j5h+EvlFmJx1KggOa8+/AFD2H
	e2w+p98Cv7M86yjvt1RFW7njck/hCpGATyoUDPmcbMMsNaqFKNeFSHmsttai9tMeC2gJG//0thyjc
	ZQi+ldLn3bPuerw6VOTE7mkNeoyvTHoVD8gwptUSJiZ9izZ51LgX4FvosIdmB6OaeL9mVBNkkrhec
	/yjssIU1kklzP3/3fBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYeTy-0071vg-QB; Mon, 28 Mar 2022 01:47:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYeTw-0071uY-2d
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 01:47:45 +0000
Received: by mail-ej1-x62a.google.com with SMTP id c10so7223826ejs.13
 for <linux-riscv@lists.infradead.org>; Sun, 27 Mar 2022 18:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZZ3p7IrHQhC+IOfUXwoClwM84pWBM5gqGoXaIupHHM=;
 b=nwP8zWrnITLyb5BsAoRxPGj1QczX8ieAYG0mpE3CqWZuNHoLvJONkgBjw24eQ7uZnk
 mtn0Ej7nrBLIxFK2rTfldm2vmuXW8Q3PF7cnnJTTSziU8fGhaWqiLP/QBIRRZUoLgyL0
 nw1SemxX8ResM21+czAeWEy2jcpCQInCUNzViuqCSdTfFKTDhfGBNYrSckX3t97++RfZ
 2s4ntOWnmhCBO2O+d/22VDEZ3Fv3zHDT+oi+0J+74YYJwcn5/A7+i5ZnH7hGMki4FGiK
 LRbK5M0FM0MzIQ2R36V3XYv1NWbJCBnf3asp+jDsWHFXxVfmlc0bUa/950+95foy9QA3
 NK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZZ3p7IrHQhC+IOfUXwoClwM84pWBM5gqGoXaIupHHM=;
 b=1xcfcPcaql5t7hI5Kuhg8GRsSgf1CdUfm7CI6xVbJLIG7G2ZcmnRcRaMMtgqNTXS9L
 l/n9tmJX/KG5cMVw6rr74RHhDzloaf8DDHaqcuCDxtjRfeuUIZ3IbvzaShd4YSRHlo61
 rJodD6ijNDXT6xlB0G8y3NvfZyVoZaazcK6HCutbxBo3uIamAkJ31Hi1mhrZzabTtqrk
 GwtGK8onkaLmvogv4w9M6VnqCV+xdvbYL/8FHNli+Z3mvwra/WsvvX06sWTRmFgZ1MdQ
 WVHJlIrJx6n9vr2E8rwy3MZrbWQdc5WW9HMUdkNIuMsH143l1wZLszOMmiuMbHzHFZmd
 cRbw==
X-Gm-Message-State: AOAM533DEZjBlunvNtV0z0IKokIbnPPmXeOwJuV6Egfy3vjeJvfz3dDl
 cAtF1Rd/qSIQhNdMTKwgC/b15UcieLqK7vQRPC0OqA==
X-Google-Smtp-Source: ABdhPJyoEPMTr2WZSucqjP6xJ3oXCNNikK1sAH6HQxOe9SZ1jL6JPJk0y3ucgungcXT2oiKXBzz2VE4T1XgwUFqSBVc=
X-Received: by 2002:a17:907:1ca6:b0:6e0:94d2:fcc9 with SMTP id
 nb38-20020a1709071ca600b006e094d2fcc9mr18799193ejc.473.1648432061846; Sun, 27
 Mar 2022 18:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220328015242.1136836-1-tongtiangen@huawei.com>
 <20220328015242.1136836-3-tongtiangen@huawei.com>
In-Reply-To: <20220328015242.1136836-3-tongtiangen@huawei.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 27 Mar 2022 21:47:03 -0400
Message-ID: <CA+CK2bBbPaK2N91HPp=3ON8TKc9rTg7wt928dTsjTg1qzGAz0w@mail.gmail.com>
Subject: Re: [PATCH -next v3 2/4] mm: page_table_check: add hooks to public
 helpers
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_184744_280992_12478E27 
X-CRM114-Status: UNSURE (   7.55  )
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

On Sun, Mar 27, 2022 at 9:34 PM Tong Tiangen <tongtiangen@huawei.com> wrote:
>
> Move ptep_clear() to the include/linux/pgtable.h and add page table check
> relate hooks to some helpers, it's prepare for support page table check
> feature on new architecture.
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
