Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E55BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RK4vU44IuBgXTW8qrp8dmS3GReLFUSJ1lJiILTXkcHU=; b=2QKBGIxp/3QpQv
	05lvatLHd60zceOYdn0JxGNmopHP6y8fQgU6jOtMELfpH/OFrv5aUVZ0BBMxdOAvn7+F7YVuP9X7S
	Z2H9LmD8rjAKYrrIjEXPXfyOivpTPdUIZdbjdx7QpbQ1t4zx4IFUWWnwqwQJViMuR6poHxWriPPXx
	kRHZHYbJGP4PbiIswLFcg5olFZL57MHnB8+TBD0r6HsX6U4LYmnFtN3/JqGNiw2EQKw/AXW09jkMy
	bZOM4x2BaLUNdLnL+/fptApbyMy3cWmfvpScORnYOg1eTABQdwu2nzheoFKS6LIk/Lk4mFK+mRlZt
	Ng/3aOWWYAgSOCgR2FGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAVhw-00B5jF-W7; Thu, 20 Jan 2022 11:34:25 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAVht-00B5ht-Ch
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 11:34:22 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MGi6k-1n6iL32GfK-00Doks for <linux-riscv@lists.infradead.org>; Thu, 20 Jan
 2022 12:34:19 +0100
Received: by mail-wm1-f44.google.com with SMTP id c2so11452870wml.1;
 Thu, 20 Jan 2022 03:34:19 -0800 (PST)
X-Gm-Message-State: AOAM530jRVLe1fCw+aSgulcfVNO75V46dbqEZyvpHBa8DQ3EnD36PkDL
 oroKH9POEFR8Ki9RnjuYVRMykpQ2XGwe8BAInT8=
X-Google-Smtp-Source: ABdhPJyF4dvXk+FcL9rU+G/uYHJOqasQkkfireul5EseychvyhuLX81WEAdVmBsalytJouvYJnpcpue784HKoQtJs8Q=
X-Received: by 2002:adf:d21b:: with SMTP id j27mr1322485wrh.192.1642671701080; 
 Thu, 20 Jan 2022 01:41:41 -0800 (PST)
MIME-Version: 1.0
References: <20220120073911.99857-17-guoren@kernel.org>
In-Reply-To: <20220120073911.99857-17-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jan 2022 10:41:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1nUcYjhEE5eyFAE_QqfjhRsZZ81ni8jyR8cPaP5QKJDg@mail.gmail.com>
Message-ID: <CAK8P3a1nUcYjhEE5eyFAE_QqfjhRsZZ81ni8jyR8cPaP5QKJDg@mail.gmail.com>
Subject: Re: [PATCH V3 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
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
X-Provags-ID: V03:K1:F1qQPMIdMnVhe6iYqxm8iebg+WXZiLs0KqcKK8UIIXrzIZrBbRd
 jc0/WtYf0iyNK59CmTNcTR4K9/fwQ21uzMr40rZHP1ILISz30gxq++L8xgTarQgUVEmg7ai
 L7C1qHPiZnCeB4+Zy4cAtI5NpAxON83BS2lxNzAXf5oIuf9GsyjocDFLNA7mVQp4MqHxxOc
 9tUbZ4cHHczqfmcCktctg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bT3LkYPmZiY=:/AvcLeGiLRuDn4Xn+FuLdg
 RWt2bgOtmhzEduo/JgvAjiE9c8uRYbxDVCI6E3bCrQCODvv4bZp9lelgZyD3b7qnTBlKeOrAU
 Pg+0V1WCqZywy149eyYStIhs9Gsgqgum+H2ELc55iDqPRBlFeH8DOW9wUj6ssjw2WNSNxvoI+
 DlQqCXMQ9HOYXRoPz283rIXRnE74v1awTQ3vk0c7sATsBIKWmPWsUgi2EpHgNp+KZy6hooTrz
 nCWe6ytY3gesCr1rStwxP4GHZxf6EErbeUsYSw6js2IH1TxYH+LvSD40PYIoWrG70aBSRnECh
 HjDPSRvNsPse5GvijjtoFaahIIvfIVtRyyXzvvWs5qkF2YIijo6Q9USKnYlugPsA1GtqmfxMX
 JqZR4qEBdwhukUq0cNQ4zfdEws+cwfhHuyBUwI8aNiPBtC7AFPX1G8mQvMLCHO3rM0AsdpKG0
 3mORRi4pXVc/jgk/Nu3Tn1jo5v8jU3ATRPQgts7aK8aA/cjzp4XJlbxZb8/MH+XaInkCqd7Zz
 vh/rdA2UnSjgSfRAa4G4RoJznGpmrZZHldzrDZmtbW1zmIjr4ytVNSd1f6xEJN40DBDXrwkEo
 JCtWENxAYO+L6XKNifcLck1A11q7U73hE+9FnwZTDwRNkQuxKC88M6ugQUi3oDuJ4csPlw0Fp
 ZuPQlAUgmEJbhytjYKhbnXxzhtXC3gBP4Ejtwopc7YLHl4jiSJBNmJyaUsARS9vxvxTTWJ5cQ
 mXOl0ojPlTsCxFxq3tk21QLpoTiLF2iOLzXIx6AOK9UNN8LXjpZt1m9NWsTw+BaSzM07zSPmm
 bcbOXP61WViX0N2h6VM9nPQoTndzXzT91JkTuLFYmLLJbgOxTk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_033421_733570_8975EB77 
X-CRM114-Status: UNSURE (   9.56  )
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

On Thu, Jan 20, 2022 at 8:39 AM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Adds initial skeletal COMPAT Kbuild (Runing 32bit U-mode on 64bit
> S-mode) support.
>  - Setup kconfig & dummy functions for compiling.
>  - Implement compat_start_thread by the way.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
