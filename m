Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0165C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7hBQFegip/TW+5nC3unLl4jBIeC9kBcDWr3X3ZepvU=; b=sVqCa2OziwvkwB
	g18LRYd4kaBVbFBpv6jKYLy4tnyAeGqZ7Ag53mqRRizlp3R8EojEqayZxfW2Fo/thum03R/oCDHpc
	7r4Wk67of99jyTZ1pbaR5JtfRh00uoZ6v+xpAjiys/FLtSe+HJtoOP8LuNYHVoLYDF6zd41PSLPJ4
	EeTRE5fbchdXZctyVOaXl/30BeA2ed6XxmzWSmmL1NfoOPEW4b0RZ9T6/xQbEhW3b02QUSQAIEK2k
	Xc8TJkEfh6ARaOVv8jz7xfmFTY564jVLth9+qoa7uxwHh1VCurtlhBH5PJf7PY+Wl1G8DDZVbZ7wA
	s1+2LpvNsTdAFL6mAJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAa7-0008fY-Nb; Thu, 24 Feb 2022 09:38:39 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNAZL-0008KJ-Gq; Thu, 24 Feb 2022 09:37:53 +0000
Received: from mail-lf1-f48.google.com ([209.85.167.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MCs9W-1nW0Fw3Wym-008qFt; Thu, 24 Feb 2022 10:37:48 +0100
Received: by mail-lf1-f48.google.com with SMTP id m14so2819297lfu.4;
 Thu, 24 Feb 2022 01:37:46 -0800 (PST)
X-Gm-Message-State: AOAM533HjFQixgiEP5ggWctinvdineV+3GagyJlYkx6poGef9iz/Nj2L
 kFe97dAC2IIJy3KLIfGy8/1Twzj70BakHGuK/8g=
X-Google-Smtp-Source: ABdhPJxKnbR5fQtLrHkUQmPSDD+xkHkCuZRWZe5PlaQucJaWZYHMl1I+Wr1dE0VfS6g2+fYVY4BPWlfD5Z76idC1Sco=
X-Received: by 2002:adf:a446:0:b0:1ed:c41b:cf13 with SMTP id
 e6-20020adfa446000000b001edc41bcf13mr1559929wra.407.1645695092672; Thu, 24
 Feb 2022 01:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-12-guoren@kernel.org>
In-Reply-To: <20220224085410.399351-12-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 10:31:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
Message-ID: <CAK8P3a3wg9S_zPad74FiJzYBn0M9bQyunuKzmH3z_QQrags5ng@mail.gmail.com>
Subject: Re: [PATCH V6 11/20] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:NhAG98hhLBp3K+uGKDDgKZNsyZrFloo9RCHiswNbL7RKz/P+eev
 4hUZ0T9MyjPu6WikwDe9fV8bE15Ck7aXk4BKznSTg9rKUHnwv7TWwwdTkF7A0amxA8BQFJT
 fq/tkDqOdAlzJz+0O8otcdQmiYgeFGpid4AwWkLBOX4OFGwV5nNmHcGV7u4NVljo8tCj4vi
 6c+hak8FkN/Cd9PXOCNjA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4fj927yh0S4=:zh+Jpr1n6GJ3nkiiRI4cDv
 fgdQm8fCCPrq+jAdqaoRbSuWf9OZWbHbZ0kYvZkII54jOjAQ48ugp6fWXh4cNVjMLti6EY60P
 gzs3COodPwE0Vu2N0Di21r3U5p6NZuAAd2l0PyyzyCrdFupJCAu7Ny7dxAOJdpAT14/U29vys
 taQAh5D3UCHkH82NrYnOeUiAL//aifo+brYm4jLpne1A0NoMGCmuiIOgA5VMXjCMW6u/bovDF
 y//qZFt7O82vSmx/1aLMuyXnxBrLsyhWBcii1wTO15YrnGzX7+bIbFZKHsUYIizOJG2af5aZZ
 xLM1+vp7BBYo6nEj5+/PCyrRHaArVx2KBTQSh+dYG3ppY5lGtB+muhxLIysW/6vcDB0B9r0RN
 REVv7OZLSCG5Cy7WlQacEmEkV8j9hjBSMXojfSrWaU2be0nNPcLvPL5cWy6vxdIeBrWZsut7p
 wYv/CzI+72mLJBtpdGzKHrZyZ3ptOL4atHv+F0tuxm1tUonj5rqTWzhUsaLeFBvy/2s6AEQxo
 XsGoHXtaWHUbNIgrD6MwawZG7LlUbZ5GGS8LiQT9esOSTgD3pYwVQu8s6zQSpN1I1heLf5WiJ
 xCfLvgtFnjeIS47igh/ul6AON6UAMCn7Rw7O31vgadJPQRZ6/dEBFr9hCawtbyCkMvOzhT+uc
 n2Qu7o0YVVkQIKmsbR299AkN0hCVVL5Qt/NGLzr/TgStYCTqFNaUsfPXVi3m3VYbgZQuDcj5m
 XpUq7CNtVbLfRZCb3nAgNq4+JXC7L+QLdoc10ahkUF8Cs9Hl5QRESU1egQbV5Iz1HqHTRsphw
 O9VY5zDHSINLxVJZghs2s/TQI6AcYTybhUnYvh52G2JCMPG9cg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_013751_883830_2051DAD4 
X-CRM114-Status: GOOD (  11.03  )
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

On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement compat sys_call_table and some system call functions:
> truncate64, ftruncate64, fallocate, pread64, pwrite64,
> sync_file_range, readahead, fadvise64_64 which need argument
> translation.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>

Here, I was hoping you'd convert some of the other architectures to use
the same code, but the changes you did do look correct.

Please at least add the missing bit for big-endian architectures here:

+#if !defined(compat_arg_u64) && !defined(CONFIG_CPU_BIG_ENDIAN)
+#define compat_arg_u64(name)           u32  name##_lo, u32  name##_hi
+#define compat_arg_u64_dual(name)      u32, name##_lo, u32, name##_hi
+#define compat_arg_u64_glue(name)      (((u64)name##_hi << 32) | \
+                                        ((u64)name##_lo & 0xffffffffUL))
+#endif

with the lo/hi words swapped. With that change:

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
