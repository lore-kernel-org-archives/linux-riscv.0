Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C134C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 10:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/NluyduxmiELpfpOOBBV/5U7wfm7i3hUGRmYVpiOjY=; b=QWD+MQQAij5l2s
	yrRFsd5JbOMobD1T+clAdKPFPniY3KVv27vyDdnkWPcVvlZVvO51vk5jcKmT/VPq3YpagQP5+yCQ1
	3b46w1wy0p6EXImaTL0y9lwNiiRV7QAuNFCdB3WIqa1H4ywR4FFKY/spf7zZgBieHOkryE1k7K+2c
	LzwxSiiDVj3Mnf5WNNyozS0j+QloMo1aoN6TT6L/qNTfCiJHyL/PoLiU4T1yinGtjhZJ/NWvwK6Ri
	ENX2EgJndlB0rmjfR0qeMgqfsoGkAQ+fRGcrDgAQINZj8JNBs0Pj6i077zJGzYxLA3geQ3OQkypA6
	8y5Ka0CHQBPAvRCshp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAUgB-00AjaS-9B; Thu, 20 Jan 2022 10:28:31 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAUg8-00AjZE-As; Thu, 20 Jan 2022 10:28:29 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mlvr3-1mSsOy3Q5T-00ixlS; Thu, 20 Jan 2022 11:28:23 +0100
Received: by mail-wm1-f43.google.com with SMTP id
 r132-20020a1c448a000000b0034e043aaac7so4352317wma.5; 
 Thu, 20 Jan 2022 02:28:23 -0800 (PST)
X-Gm-Message-State: AOAM532AxH3eYoLBFk4PED8n40OjnJ4Yy3Dsc9qyg7UAHaXYou7OB5bn
 wvbQFdSsFltvvAUdZEsQJIsB3V/D30c495vplqo=
X-Google-Smtp-Source: ABdhPJxEAFXYVk6DktXv3061JPbB7MqrKutmOAXqbVu5eyk6Pz36dhnH8dbuNkOxd7GlFiEfJn/5TzSKv0rhSZwiTMY=
X-Received: by 2002:a7b:ce96:: with SMTP id q22mr8113766wmj.82.1642671479094; 
 Thu, 20 Jan 2022 01:37:59 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-14-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-14-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:37:43 +0100
X-Gmail-Original-Message-ID: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
Message-ID: <CAK8P3a03-3QTC-vxmnbouK7wBd8iunPGZpX0-Jf6ntS1DY0E=w@mail.gmail.com>
Subject: Re: [PATCH V3 13/17] riscv: compat: signal: Add rt_frame
 implementation
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
X-Provags-ID: V03:K1:qWryzFAPiZpAQTfp/boJ6zgORYYO2dTGCQOfr/ZcaDMEkTKyey0
 DkD0l8sNLTyTvo+ZIGGrliyJwGpVQfyDLioeXKAaKER7tYh2d4BYHMV9xA9uBn7S8VvzF95
 yOj4snwIu1CtkUkbH3OHfKFt5oEm26irMtBJOilDcUWMV2mk3VyWV+/MpABOqCLTZi5vPoR
 zJjxbqQj8TaD6Pn3HfF1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:oy3nrTXs7ec=:AUfaS/EWupTFKkvva4s9t7
 xa+ImSJCO/nXs9cYcjDyheIKdh6GTMReZPHGdnLix+l/emr0jc0/GwwGKHZjSG8AsYM0UPKXc
 0RzJ7R3efftrfwv3Ipl4lUo64wQj+PAAVckU3iJyMXnskP9sKfu4uyNzQSZnwuFyJzUOzK8nX
 4FQTr1rqGmXdsSZeVH4ojTgOUJW7ivtWXmSqh4ekmSSvWc/fXB/7AP89XEcGwhNdBNi17E3kx
 KzWvhBJnTd5d5MZ2EzykTyjuM057lE//WBTYA6zuyIYmGq+TPBJCVRtnQAqg0+nEHvos6E2vd
 aLmjtT2AGxWOW20elLp2kz4wABs9riGh4dFVJa++nxFwVf/VKaU8Jg+lVlhnJPJYM5eSFgjGu
 C6RC/A0DRW/YlN7uWB9W4BN5OSxPTBYSgmEhOfYZmcS35dunTsDNs4RZ+vObJ7/H26+L1Xk11
 tVVgnqm4h25bNXe8b3ceTQRbi8aCZocDOdbAVLsCsVa7MQZ6ABKe0H8KjiNEO3FjKTvBscxeO
 PepeGIj3ish9GpWxeGloHa7pYZdjWQ4E+kfrcQ0LXtNfjFrRg12A8jWs5Ww9S1EDcDOFP3Gx1
 gHEECVR7Ti9Cxvu5ziZe6DOfujt/DbLM5mu7pb4lDglDYP/Fkx58WfdjhaoTdyYtPI+mwjsDe
 KJNMrox1CY94y1jvw7F8Rr7tsREnDr/S6c3HOIkruiMFUsZ+ulrXyl34Q07B7XMvjVFk40ZgV
 StzX5ffeKpy9xwOTJ2RPUcAYYJPHgQ1i1jXFgpKe7j5mqkAeFxbUtPhkYheydLYGZYHwWc3Uo
 UP4OSCRt+5Pp3BbIUGqLP/YDLdyoZyHrQQh/thaaUmBU2S9SeBladHqovJ7d4mRBQymi5Om
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_022828_690887_D11AF5A2 
X-CRM114-Status: GOOD (  10.63  )
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

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement compat_setup_rt_frame for sigcontext save & restore. The
> main process is the same with signal, but the rv32 pt_regs' size
> is different from rv64's, so we needs convert them.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

I hope someone else can properly review this part, it's not my area
but it looks complex enough that it could bring subtle bugs.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
