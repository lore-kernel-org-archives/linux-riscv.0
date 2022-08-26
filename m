Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744A0ECAAD2
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=woCJ46dAdJHe5e3AaKHOB1Qy3Oa+GlTGWW4rzL/Bqhs=; b=YKGafsx0Qmajc9
	VCa2CCFy1K74Jkuudcl9XdT6zsHHWuFr9rtBq72uWJIsNo1LXDEBarNxQEmU1UwAvJLsla81g4j5D
	ilsZGTSShw708g0xMHCyEMeuBg5vGd4xoIX0lKj5XZ//V/yVr0FFUVQUo/JXbCKAnUHuuvSfEu0Pl
	RZDKtwy/ugBtqgUm/HDMwH0OdHMazcRT2mfD9GZebbWJHtAgpHcBGDd0GrKEkgvBJcuGw96HHqBNt
	CvS3vBKVR+TAX1pN2M40seNJyrDpT8iAxZB1UnDudh61YGBAdD8L+VMMQq0B1MvNruoWYecwV/qNW
	n1Y7Q1R/UAwMZRhKoxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRVfu-000gbj-UZ; Fri, 26 Aug 2022 09:30:50 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRVfr-000gTF-Mz
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 09:30:49 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MoNy4-1pBawd2JQm-00olMr for <linux-riscv@lists.infradead.org>; Fri, 26 Aug
 2022 11:30:43 +0200
Received: by mail-ej1-f46.google.com with SMTP id y3so2082807ejc.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 02:30:43 -0700 (PDT)
X-Gm-Message-State: ACgBeo1QG5vGfl8rA+45Ti275/eN6v0Xx47s/X0F6EpGCuKZKtH4AJAn
	EuREtTpQmzpEpayoSb/3heq05oPSnuAy8eaTVbw=
X-Google-Smtp-Source: AA6agR5zhGF9mzoWCaPEcROFHwnBUwStiaSTKXmkpCqTBaUZ9tbsyjcAa2ol84dp24RH8sH9Me5p4ygFgW6eagFvC7E=
X-Received: by 2002:a17:907:6d8a:b0:73b:d9e4:e628 with SMTP id
 sb10-20020a1709076d8a00b0073bd9e4e628mr4976713ejc.75.1661506243208; Fri, 26
 Aug 2022 02:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220815032025.2685516-1-tongtiangen@huawei.com> <20220815032025.2685516-2-tongtiangen@huawei.com>
In-Reply-To: <20220815032025.2685516-2-tongtiangen@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 26 Aug 2022 11:30:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0ixaYimjCh77QBJpbHbVsw+9C7RiW2LEnwQ8HnwG_jHg@mail.gmail.com>
Message-ID: <CAK8P3a0ixaYimjCh77QBJpbHbVsw+9C7RiW2LEnwQ8HnwG_jHg@mail.gmail.com>
Subject: Re: [PATCH -next v2 1/2] riscv: uaccess: rename __get/put_user_nocheck
 to __get/put_mem_nocheck
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor.Dooley@microchip.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	wangkefeng.wang@huawei.com, Guohanjun <guohanjun@huawei.com>
X-Provags-ID: V03:K1:4DGpRQj4c6j+A45fyLVt2u75Twjel4XWudq+pV+XdSf5qsv9BvA
 e+jbdOpuNU9RUIF8hSw9WuECcocIV/dbKE/8Mve+Lt1k7p4ybz3XrodSmne4eH6Mz+Dkh4f
 WTRN3+JnJkXlmh1rwY7uFBlsN6TMPO7oKg4p84pDcra6pLJkVv3Q9yCAET4nVVFiqFnoUXo
 rorSzJn+yJWF2IOEJOhJw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:jP8c6dj/PF4=:3IjHjkajXoDFPHjdN+UWBV
 JcRFDhAePgm891UxK9fOrV4aJVzUcw49/CToXyiz+o6niR4z9SVYMK4VhM7DddT9suTRUEexX
 TohnsL9M7RUhrw/QYRor/H2G0ss5n8/6d4XJuCIpEOUzNHdwxfHSBLRI8aFWk6eQZzwb9eTJV
 5UvEpUPsdVZvlsk4shT/z61gYm9UX+86JwdI0P/lRaeDqkkmxAXHZ0KEco11A9sms9XqFryLF
 KvuqnruzJtCqHAYK+YuDil9aYJSkMdy5aEp6ackTPiiMZ7uN25C9tuPsZWzEFb59sM7i4iT3L
 P2ohRKS5IgoX+FcQZw74uNXxt2xssd092zzVPMLhn+FwTujMw1sCLtZkVzhNr4UF3rK80MO3X
 iNyUHJAAA4tFuC4SGIvIjOvtFe2I/24kCftbnWGhQtnKA/MY+qQNthqidpFIcxy34EjWDthko
 xGR/uH2S6tN4mFIbf3kT3s5P4KLmlJdBNEdPGqruJYxr8BBUSMP38pQeMuh9LBUhfTVp7SxAQ
 fAVVJAlOsBPlfUz9u8Ugg2AyRjV6t6PcSd8/FpvMpl0weGCJblVRCR7rtFCo3dW/pFKE9rYtr
 yeBJNEFEL0xwySYjIO2J4n32gLeU0ghL8AmC/EdSGk540d168slerc07xeoebC+VyGg74NmDm
 XlVpeihg/AkGovl7fI0tRPJrb4OUf6veFKHIrCsDtn6u7vyARbsjQOW+NmxbgFsQhHc8M0fRW
 PDnfWkqvuDnEQsU2CDkN/o196wBnOY6RzZCg1jx9VF0X+8T8sVy7v4FUcIygwVibBlSo8O5dS
 Uh+RDA5cjP5F1FY89dYy1jVElYYh9m3gVWbj0EMmXg3crvEzebcgkFWXaK6VxJrcbEXomXD3P
 4SgJCQqxu5fLjWwmbliw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_023048_081215_3CC47BC4 
X-CRM114-Status: GOOD (  16.96  )
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

On Mon, Aug 15, 2022 at 5:20 AM Tong Tiangen <tongtiangen@huawei.com> wrote:
>
> Current, The helpers __get/put_user_nocheck() is used by get/put_user() and
> __get/put_kernel_nofault(), which is not always uaccess, so the name with
> *user* is not appropriate.
>
> Also rename xxx_user_xxx to xxx_mem_xx  on the call path of
> __get/put_user_nocheck()
>
> Only refactor code without any functional changes.
>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

I would prefer this not being done, it just makes riscv diverge from the
code on other architectures. While the new name does make more sense,
it ends up making it harder to refactor this across architectures in the end.

There are two important cleanups that I would like to see done in
asm/uaccess.h across architectures:

 - generalize the __get_user()/__put_user()/__get_kernel_nofault()/
  __put_kernel_nofault() wrappers to the point that architectures do not
  need to worry about the variable type stuff but instead just provide
  trivial fixed-length helpers of some sort

- change the calling conventions in a way that allows the use of the
  asm-goto-with-output method for better object code on modern
  compilers.

The x86 version already has most of this, with their
__get_user_size() macro supporting both the asm-goto label
and the error code assignment, so the generalized code should
probably be based on that approach.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
