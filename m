Return-Path: <SRS0=pLrx=IX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD3DC433C1
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 11:53:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A151C619E4
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Mar 2021 11:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A151C619E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uQa/o0XNNpcf+jNzyOh+FHr5Ss65dMCMf6L7DFNQNaE=; b=OMx7vPEARq5eiqRfB2XN+ev1D
	QZGW0vNZaT6ExHwWqoFvos/UwaZounAtLqlcBydwYgt8Ein+G0JnGpP7YJDIbNcGGaYKQluQ2g9Nk
	FuFDU9gsW9Q3ZlsYnuZwUgFm9zJ8if0UnsZhux1SGDtlBX2qdtk0LGoTbKBTW42HNB8EPOZ4a+n88
	FXxYkOaXDXHlhqDRdNRzntL9VugiwHCMXcBskMkfZ+t5NXfoX0ZjWkEyYV+/7dGpx1lwV1rdVe/Fb
	ps3/JcMjq6M2V0l/wGdze63t5zqvg1AC+k2DBrPu50tDDTyTMS6MQX2Zw8tFtn3qB7ZgfCiVM+fv5
	OvHmWjSBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPOY8-001KUa-Nx; Thu, 25 Mar 2021 11:53:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPOY4-001KTu-G2
 for linux-riscv@lists.infradead.org; Thu, 25 Mar 2021 11:53:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8333661A1F
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 11:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616673189;
 bh=NsPDV+Q0M1j6YnK0APDSgpnNUw2rzo4WQAGweu5O1S4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JIsJubSgNp1vQdOLfLqztFMepHItIrRXCBrjwk+j+ytnFJZWlZCcUW0CupFkIek8W
 ltKjtQMNwSem9aNt6oY2M6KlllnzYZ4Fouu0wXz/J3i1ckJ4mlPklCMB1+MsKxEyEx
 cUg2g7ciSim36p37MfZ18N+7MPm0ynVwFo5udnJd0XsaDwJDkgXhUReP3r+buDKQbh
 ELcpuw1dXd1PDf47AawJnnYQLbOTVU1U/P8sj6K2oT80Hugo1/bcY/9Mi8/704o0NS
 BkNynteEzm66DWlwMRYAzkmZpRZV7g0D94XYDoVkpYkJkrRmDWFJxAQAWSce2VOqK3
 wy9G1TU5g5srw==
Received: by mail-lj1-f173.google.com with SMTP id 184so2698955ljf.9
 for <linux-riscv@lists.infradead.org>; Thu, 25 Mar 2021 04:53:09 -0700 (PDT)
X-Gm-Message-State: AOAM530yXOhon/AXkk6kGzus1Yei+NurPDkQHjbj9aSbb1YW6s+dYQXt
 NXsUSkezzec4jQwKh2MzhePudqeOdHQKRfzLq1c=
X-Google-Smtp-Source: ABdhPJxDid/H9g+ccXoiu4wXt6PEyymXG/HEfZErzfWdHRSCnezNgcD4AkGYRPbX9YdGN/eH3bMRH5bdykAWHGEAcCk=
X-Received: by 2002:a2e:9084:: with SMTP id l4mr5231252ljg.498.1616673187659; 
 Thu, 25 Mar 2021 04:53:07 -0700 (PDT)
MIME-Version: 1.0
References: <1616658937-82063-5-git-send-email-guoren@kernel.org>
 <202103251923.MFrI3wnb-lkp@intel.com>
 <CAJF2gTQgXzAB0NiTNTY1MvR=4BYx5+379W0PeOuHzayR3dWUng@mail.gmail.com>
In-Reply-To: <CAJF2gTQgXzAB0NiTNTY1MvR=4BYx5+379W0PeOuHzayR3dWUng@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 25 Mar 2021 19:52:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRiG+5f7y5HXe9EhfDWc3Q+pTEW_8sSFc0iGkbuMJO+NA@mail.gmail.com>
Message-ID: <CAJF2gTRiG+5f7y5HXe9EhfDWc3Q+pTEW_8sSFc0iGkbuMJO+NA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv: Convert custom spinlock/rwlock to generic
 qspinlock/qrwlock
To: kernel test robot <lkp@intel.com>
Cc: Anup Patel <Anup.Patel@wdc.com>, kbuild-all@lists.01.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, tech-unixplatformspec@lists.riscv.org,
 Michael Clark <michaeljclark@mac.com>, Peter Zijlstra <peterz@infradead.org>, 
 Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_115312_939540_83AB4154 
X-CRM114-Status: GOOD (  23.36  )
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

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 5ca41152cf4b..894e170c503e 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -17,6 +17,14 @@
 #define __local_release_fence()
         \
        __asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory")

+#ifdef CONFIG_32BIT
+#define __ASM_SLLIW "slli\t"
+#define __ASM_SRLIW "srli\t"
+#else
+#define __ASM_SLLIW "slliw\t"
+#define __ASM_SRLIW "srliw\t"
+#endif
+
 #define __xchg_relaxed(ptr, new, size)                                 \
 ({                                                                     \
        __typeof__(ptr) __ptr = (ptr);                                  \
@@ -31,14 +39,14 @@
                        __asm__ __volatile__ (                          \
                        "0:     lr.w    %0, (%4)        \n"             \
                        "       mv      %1, %0          \n"             \
-                       "       slliw   %1, %1, 16      \n"             \
-                       "       srliw   %1, %1, 16      \n"             \
+                       __ASM_SLLIW    "%1, %1, 16      \n"             \
+                       __ASM_SRLIW    "%1, %1, 16      \n"             \
                        "       mv      %2, %3          \n"             \
-                       "       slliw   %2, %2, 16      \n"             \
+                       __ASM_SLLIW    "%2, %2, 16      \n"             \
                        "       or      %1, %2, %1      \n"             \
                        "       sc.w    %2, %1, (%4)    \n"             \
                        "       bnez    %2, 0b          \n"             \
-                       "       srliw   %0, %0, 16      \n"             \
+                       __ASM_SRLIW    "%0, %0, 16      \n"             \
                        : "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)      \
                        : "r" (__new), "r"(addr)                        \
                        : "memory");                                    \
@@ -46,14 +54,14 @@
                        __asm__ __volatile__ (                          \
                        "0:     lr.w    %0, (%4)        \n"             \
                        "       mv      %1, %0          \n"             \
-                       "       srliw   %1, %1, 16      \n"             \
-                       "       slliw   %1, %1, 16      \n"             \
+                       __ASM_SRLIW    "%1, %1, 16      \n"             \
+                       __ASM_SLLIW    "%1, %1, 16      \n"             \
                        "       mv      %2, %3          \n"             \
                        "       or      %1, %2, %1      \n"             \
                        "       sc.w    %2, %1, 0(%4)   \n"             \
                        "       bnez    %2, 0b          \n"             \
-                       "       slliw   %0, %0, 16      \n"             \
-                       "       srliw   %0, %0, 16      \n"             \
+                       __ASM_SLLIW    "%0, %0, 16      \n"             \
+                       __ASM_SRLIW    "%0, %0, 16      \n"             \
                        : "=&r" (__ret), "=&r" (tmp), "=&r" (__rc)      \
                        : "r" (__new), "r"(addr)                        \
                        : "memory");                                    \

On Thu, Mar 25, 2021 at 7:34 PM Guo Ren <guoren@kernel.org> wrote:
>
> haha, I forgot RV32, it needs a
>
> #ifdef RV32
>     srliw
> #else
>     srli
> #endif
>
> On Thu, Mar 25, 2021 at 7:16 PM kernel test robot <lkp@intel.com> wrote:
> >
> > Hi,
> >
> > Thank you for the patch! Yet something to improve:
> >
> > [auto build test ERROR on tip/locking/core]
> > [also build test ERROR on linux/master linus/master v5.12-rc4 next-20210325]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch]
> >
> > url:    https://github.com/0day-ci/linux/commits/guoren-kernel-org/riscv-Add-qspinlock-qrwlock/20210325-155933
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 5965a7adbd72dd9b288c0911cb73719fed1efa08
> > config: riscv-rv32_defconfig (attached as .config)
> > compiler: riscv32-linux-gcc (GCC) 9.3.0
> > reproduce (this is a W=1 build):
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # https://github.com/0day-ci/linux/commit/2bf2d117ab34b007089e20e1c46eff89b5da097e
> >         git remote add linux-review https://github.com/0day-ci/linux
> >         git fetch --no-tags linux-review guoren-kernel-org/riscv-Add-qspinlock-qrwlock/20210325-155933
> >         git checkout 2bf2d117ab34b007089e20e1c46eff89b5da097e
> >         # save the attached .config to linux build tree
> >         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=riscv
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    kernel/locking/qspinlock.c: Assembler messages:
> >    kernel/locking/qspinlock.c:184: Error: unrecognized opcode `srliw t1,t1,16'
> >    kernel/locking/qspinlock.c:185: Error: unrecognized opcode `slliw t1,t1,16'
> > >> kernel/locking/qspinlock.c:190: Error: unrecognized opcode `slliw a6,a6,16'
> > >> kernel/locking/qspinlock.c:191: Error: unrecognized opcode `srliw a6,a6,16'
> >    kernel/locking/qspinlock.c:184: Error: unrecognized opcode `slliw t1,t1,16'
> >    kernel/locking/qspinlock.c:185: Error: unrecognized opcode `srliw t1,t1,16'
> >    kernel/locking/qspinlock.c:187: Error: unrecognized opcode `slliw t3,t3,16'
> > >> kernel/locking/qspinlock.c:191: Error: unrecognized opcode `srliw a6,a6,16'
> >
> >
> > vim +190 kernel/locking/qspinlock.c
> >
> > 69f9cae90907e0 Peter Zijlstra (Intel  2015-04-24  187)
> > 59fb586b4a07b4 Will Deacon            2018-04-26  188  /**
> > 59fb586b4a07b4 Will Deacon            2018-04-26  189   * clear_pending - clear the pending bit.
> > 59fb586b4a07b4 Will Deacon            2018-04-26 @190   * @lock: Pointer to queued spinlock structure
> > 59fb586b4a07b4 Will Deacon            2018-04-26 @191   *
> > 59fb586b4a07b4 Will Deacon            2018-04-26  192   * *,1,* -> *,0,*
> > 59fb586b4a07b4 Will Deacon            2018-04-26  193   */
> > 59fb586b4a07b4 Will Deacon            2018-04-26  194  static __always_inline void clear_pending(struct qspinlock *lock)
> > 59fb586b4a07b4 Will Deacon            2018-04-26  195  {
> > 59fb586b4a07b4 Will Deacon            2018-04-26  196   atomic_andnot(_Q_PENDING_VAL, &lock->val);
> > 59fb586b4a07b4 Will Deacon            2018-04-26  197  }
> > 59fb586b4a07b4 Will Deacon            2018-04-26  198
> >
> > ---
> > 0-DAY CI Kernel Test Service, Intel Corporation
> > https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
