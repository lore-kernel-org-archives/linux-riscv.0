Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F7BC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 21:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YEiwSOEmsZWCpyF7Wj+vrJSr5aov9KOMNkySQYFQIs=; b=qsaAO9S6Mgtywq
	lwD4Dia3NhpL4TJ2uxUcDUex9Gqvinlxkl9rAT7PwWH23qoRMe/4V2lL5UjC5VFGOoEobGfzDU81+
	9DRtTJVGMd5KGOvwx/X3UFFx4oSVI/zFAykl7ZJMpRU286fcL1EUy2hSwQMymOq51oQFl/vP6E4Aq
	QKHVa3i8HGe80DE47ndcwGmiWL5S43eIitrZ8M5FcVf5M3L1XdxaVEwymhIPJyoCr86oSD0i+3n7u
	FkVLjtWh+j8HZjpiDlOpNcsIxGr6OEwdMZheu7vBqXPQFd9J0PbOQ1PdQmMDM8Qd3hgcvbKpnvw2Y
	7yrwbMfP2wjPo9mK4DWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDvSY-005SD4-9k; Sat, 29 Jan 2022 21:40:38 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDvSL-005SAF-Um; Sat, 29 Jan 2022 21:40:27 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MRCFw-1mqsGV3ia4-00N8XH; Sat, 29 Jan 2022 22:40:20 +0100
Received: by mail-ot1-f50.google.com with SMTP id
 b17-20020a9d4791000000b005a17fc2dfc1so9201504otf.1; 
 Sat, 29 Jan 2022 13:40:19 -0800 (PST)
X-Gm-Message-State: AOAM533h0Oq8FmTSgUVY1mkPU0+me1NaYrAFtuJkf8i0V142UvEI3g9T
 ZiaPiMUUCF8pelHhoJ0nI+s2/JRZ25qnoBnY46Y=
X-Google-Smtp-Source: ABdhPJxSc4cWbyXoSGQiQtpLi4PNMIRU496vg4S4jN8fyO8Z/BY7E62yNehuKgdWMqyCyzVpdMc329RL2rEKIxjEMaU=
X-Received: by 2002:a9d:73da:: with SMTP id m26mr8391513otk.72.1643492418274; 
 Sat, 29 Jan 2022 13:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-4-guoren@kernel.org>
In-Reply-To: <20220129121728.1079364-4-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sat, 29 Jan 2022 22:40:02 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0jK4quTT6txPakQuuAjyoMXRq1eM35pCFLo0PQNq+p2Q@mail.gmail.com>
Message-ID: <CAK8P3a0jK4quTT6txPakQuuAjyoMXRq1eM35pCFLo0PQNq+p2Q@mail.gmail.com>
Subject: Re: [PATCH V4 03/17] asm-generic: compat: Cleanup duplicate
 definitions
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, linux-arch <linux-arch@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:eUdvwKOTKDSYyPUyiurEju+HTlR8GpqVSwS1WnTOd0GlwRm1sSV
 nYqakZ/XZbEwNCjYE7DFockNayyOX0SRIwXACsJuAxewCdPaUprYw57ZhZrhanqoIgoLGax
 di6c4NUIuUHnOlYtGkaq49ALh/n9mvIhbLwHLZedeHwkITGHkpDB4Q6LrIHDFHWOV2N+jvd
 EyBK7AwmE44CuB0cT1Pvw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LXsLabF/pJI=:iZnyYFz6qDeoT7wz73HImD
 mJPE4fUBLSKNb1YPZqDeJn8AIHIpyti3ID5iCtOar5uDNfpnM+Qgl1cZ8tod1QROxZeyrKOb2
 rp/AO0ozMMPKngI4TIfIM1N7lGci2dWqxWEbOfY0oiXY4zxiCSmmHtcz5eQ1R2Xm1E4yla8uh
 cqocF5jW22zNl/bAKg0Z6iaH51/IvB/1KLtQreCn5OtHWElVPKQ10CKaNRu8/byO8/Rd0V/ty
 UFjeV0MuzBIy/kxDxc3aCVFIW+hcMZ3JQl3VKAr/0jLhiGk310GhZArIi7d/SyFge7V3IH/Bc
 7Cqk0tDDrr8DwzLXaAglScWkWNgfjE3zRapMofWzOY8rFE6liarVa1crKf/k8IUA4M45mt3CA
 cQU6s9B5QUiFntPkHkWtfjDY1PvUFaXU88ZW3rQ5YuMpiFZnSdJdHKe5JfPawwx3sCPNm/Gon
 aGvRYrT5evh+crMCf7BeBpXUGq4xaTPtwffTPoFZC1qk+qABPruJaMzRxn6TpjwNxgLUlyMFd
 CyxANrymzV1pQbgph7KoIi2/u/YjmsYabwWt1oWORTuhsE3EgRUxZPyCEXQvWVcvDHc3fAvgB
 3wZNBX4DV+WeqpcvJaP4LmzWn5lmk1Msz53SKf8UhTZIqXH69VRhWj9rhsgmL2M9bdF60qq3b
 jW5oQfUEmIFRYHj/7jfT3GTSFX3yMwGVqu4BWgtb03HykBPPnCdziLsFT8ex7V2askB1q/swX
 UT34rZeOlbo2IexPY8Qed/qGrc9IK6KHmliAEb4KVy0X5BZqJPmJp8CsAVBZBAzbxtL6sio6M
 c41CWDdtApRAA9A0+HbsxXzlp/Z1u4x+odYxham10UE0MQ8nDc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_134026_324624_62E0CF27 
X-CRM114-Status: GOOD (  10.68  )
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

On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> There are 7 64bit architectures that support Linux COMPAT mode to
> run 32bit applications. A lot of definitions are duplicate:
>  - COMPAT_USER_HZ
>  - COMPAT_RLIM_INFINITY
>  - COMPAT_OFF_T_MAX
>  - __compat_uid_t, __compat_uid_t
>  - compat_dev_t
>  - compat_ipc_pid_t
>  - struct compat_flock
>  - struct compat_flock64
>  - struct compat_statfs
>  - struct compat_ipc64_perm, compat_semid64_ds,
>           compat_msqid64_ds, compat_shmid64_ds
>
> Cleanup duplicate definitions and merge them into asm-generic.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
