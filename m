Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 058B4C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvA5GnZPzFDO+KC3PF6TX1/ScaPKnwXaGKhQcW6WWxA=; b=SHGlPpBdMTiORA
	jej7q5LctyQzM3ZOvzoigmLiZbvk6qG8xRZIUg73LyqskXYjB06AlacDdhi5AlYfWd0bX7woIh7ig
	SsCVR4eMpWbSMG5NBP3bK5zrBq0pRjfv+YmAyQBOA2jAgJPMJfRzBimNlHlXNX0tb/GQYvP46dWhU
	hXF3tTr1kjL6mxT6HZNVyFQjsfrZMaRHi0eWdR8xKLI9KccR8kcuJd3IKtXK7qEIx/eyj1rZrTqXD
	UsaOEwdHA7FJGpQr0XkrjcOPVAJHnem+MFsfzpfk4nEfTHRwrl9MxTJZbwpoqQWuJHH2SZr4wYQa3
	iQish/tFc0NrCZG1XEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATiN-00ACgq-KX; Thu, 20 Jan 2022 09:26:43 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATiK-00ACdf-Rk; Thu, 20 Jan 2022 09:26:42 +0000
Received: from mail-oi1-f177.google.com ([209.85.167.177]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M3UIe-1nB1g60ikk-000ai8; Thu, 20 Jan 2022 10:26:36 +0100
Received: by mail-oi1-f177.google.com with SMTP id t9so8427292oie.12;
 Thu, 20 Jan 2022 01:26:35 -0800 (PST)
X-Gm-Message-State: AOAM532ecVS1ICmspuY21AhlNNEe22elSp97vU6wOYcGzrBqXN5dOAj5
 T68IZrVbt1XNQAdjlMd4poprKcIraNner+BOSms=
X-Google-Smtp-Source: ABdhPJwUHTIEKGF9B/deLoD+NLX/BPhPwhEAEkpKqsuu70hdzaWxQnSHkYBLqgySPz6euydrj/73VVU+G7+wmpaPV1k=
X-Received: by 2002:a05:6808:2206:: with SMTP id
 bd6mr6829962oib.11.1642670794688; 
 Thu, 20 Jan 2022 01:26:34 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-5-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-5-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:26:18 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3ixShQBKmdXWxf8QdB_aLeWr7TQB+7MqQBSgh0-shSSQ@mail.gmail.com>
Message-ID: <CAK8P3a3ixShQBKmdXWxf8QdB_aLeWr7TQB+7MqQBSgh0-shSSQ@mail.gmail.com>
Subject: Re: [PATCH V3 04/17] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, 
 Christoph Hellwig <hch@infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:y3xz/WFYVQYyTTeyJpqwvNJB9F1Tkobd5KcHemcx+Y6gxhUQXQn
 MYItjIL5nuEbeZNV2ayO+6Acrix/mVNrUygxUZiKe4BxXdCL8teKRarVQK7lStoguvfSzNr
 pj700lzoIUeu0hKUa2ICpaPtSDeTQ93b4fI+haSsdaYoe/Ylk2/IqM+NSYEnDqY+fYQ8Hsv
 uFrO189Tbs85oOfLo2Aqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6GRopiWcQUU=:G923JVlsMizBCT4OEfSjvI
 Ld1veJ+dfSwa/64JvY27eUIMLeKfKJhOZZTPYPdIuQEMMIdgcuxmt6a2W2ZZD5NE0YQeAwkcz
 ji1JTG7wstBE6Ejnr5iHrNzxuiwFbMjKLSkJzRsa6PLhfYjl4ARMoU9nBAQEd5Epl5rDxgqe9
 5L+9R8/WqBTj4z1vejURoF9hqRkNNloZsjLPzheV0x1XyCnJFFq3gq+/D6D7fYd3kWy5oSjuW
 uDB25tuGCn9/65PALEkg9ybWVbL4OJ+h3HaqryQ3KczoRu/EHZb2v/mEcBFh8/PZlNIFIVbf6
 a9xhoU4OMXql2qDLHEsSA7fWpyTCa4rolR7xRrKh075evHnLxQf2bwXDgW4qz2LE5jzGbECPQ
 9wytSDhIZTs6pTHn0dn3nu8uCqpXDPb3rfw9qN/Owsl+xveYjsoGim35e25p0MnbYbwS2yvzV
 sZmh/coNRNEjMO8DBPXkQ1jOsG0jj8TVuqD0/d5Tt7EnrAJu78LTL/vNwG8jG85IcD4pz+DrP
 wt7OvFydpMUeoRHmu48v38JOSv3qNeT3265nWxuYYHsvBoGbv4x72XF54p+iFP3+P1ffP1z04
 Lo0JbRAbcnkPO6Z5I5U7OlNUKkIg3DNxOmi3jIv5zmdFAqL4tjImcShChGnTDx4zKF8CMQa94
 GL4DiwqEujMlRx9i/S1h6yLAiXNBtdC7YKBzPA19XSWZocbNfYzB9K8sY/DjPcZXGpf6S0eF7
 +7G4anERz9bs6Kv90KLCWfkZjyGnQNtrYo7gyjxtThrmqYBFjXd1LyDJyNz2iEF+SrE2Qa/yF
 fbyqiQ/QRnFQvaCQeso0g3xZjaHzR7TeStAVz1goHqTzTiv4Ko=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_012641_211728_8E35B64B 
X-CRM114-Status: GOOD (  10.11  )
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

On Thu, Jan 20, 2022 at 8:38 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Make "uapi asm unistd.h" could be used for architectures' COMPAT
> mode. The __SYSCALL_COMPAT is first used in riscv.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
