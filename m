Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6205AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=606RCVYfaxG8zvh/qMUsPt5b5qcCO3PuI+wI9Faen/E=; b=JjPOYk14SBSw/z
	hBzgUryjHyFKXKSx1mWjalfzBKVNHD/QxChKdWZvsdr21WWPLJQwmaK42mf7xvekkTLRI4ZkK0VJ7
	YD/h2jX1GTsaLzBjRBb2aZ8JlvTkqK/uXEKVZ872U/5NGFCt0TFFASklRkGn8GdXyF3m+/923jvdm
	LGVJxGNeBdnDAk4wvYNFphIyt7SIQfAS7zolzEvmL3SDC7gM2xy34SnBekWvKNaafOaqyzknxPbSp
	dmhAiuic44RaTckAf75PRXmnJr7ARXi7PNia4tgQSgjYj8bP5/QO6e2rjzzdQLDfgcP2VqRfF70ri
	5b4MTcitCl9kV6I5DzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzihY-007kWM-Ao; Tue, 21 Dec 2021 17:13:24 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzie5-007ite-Gh
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 17:09:51 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M4ahC-1n0GsP03So-001j9Q for <linux-riscv@lists.infradead.org>; Tue, 21 Dec
 2021 18:09:47 +0100
Received: by mail-wm1-f41.google.com with SMTP id b73so9548613wmd.0
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 09:09:46 -0800 (PST)
X-Gm-Message-State: AOAM532VwqgDEIqjWuL3sIOTsrj++b/XNMAgrRV/lv1dwoco4VF82e2B
 iPcX3ggC1gCYUQRHb70jxghDpugQuTkvNRXX0E4=
X-Google-Smtp-Source: ABdhPJzaqpqJNCbIa99dFVCtyNIizr9whaZNUWhkKim9JOkhaY5AWVisxu8w7rdXDuXyxS5+Qd3gQL/iBewf18GWlZ8=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr3639851wmb.82.1640106586666;
 Tue, 21 Dec 2021 09:09:46 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-3-guoren@kernel.org>
In-Reply-To: <20211221163532.2636028-3-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:09:30 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3dS=Ne0Pd2qZc8vB2whM7AUcJ1BNbhtf6EEboWAPpSug@mail.gmail.com>
Message-ID: <CAK8P3a3dS=Ne0Pd2qZc8vB2whM7AUcJ1BNbhtf6EEboWAPpSug@mail.gmail.com>
Subject: Re: [PATCH 02/13] riscv: Fixup difference with defconfig
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, 
 Drew Fustini <drew@beagleboard.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:fpHe1GYwAboOlviu8n62eSJ4MvJLhqGDMxAGBEjs+yeTKTrBlYO
 XZkZrHh89VOTBm+XfWCUhrrFPB6tJ9HFZF8a6QKL9DP9LWOSZ7uMlLDKD7OFI+1YFz22VMf
 5NF8HV9sMMzVL7RZWCWz8v1icCItWrly0lKgbno3VW0hoDusKOeOV1GEdiCtr/W5bV/4mc2
 sOecElgcus+1B2je4i/Pw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0SZnezN+qEA=:ID98wvlMHZFwO64WE8+bpL
 vT1qdPhIY19M672aFmO7MfPD5tgHFPbn0yIzNJljnxlZu+UqO1sRQPm/ibffai0mrQEsmL3Pk
 ayzwjlOSiHFPPuKkrfoqbmj5xscXq7iwq1MHf445G/haeoHCi0JLc71QGGF/2EOJjPfZq+cEi
 s9J2WrHP0ZQpmMP8ZMWsn9vfgx2rDMwSTAoAotnTUtVaXg9mv4d0n07ujucWqN3G6HQ6ruyUE
 8g9Ue3XAYNMEjF9Vz+IvSZAi6nQen9ipkZ0Au6q9HsAjg0AIBNgY0nrXYuYgntaBdf0akKaH2
 SMfCZA75AEWCC1Yj5jRMsywFcvwdkoMOiIoep35ofnsaNwqky/5Ode2gdVuTpJWArc7oM0GMP
 UUO8sY6AL/JTnqUJiYULKRnHgCPwENNj2DeZAQ+iKF2to0t27NoTpRR++vEe/W9phsn7Li6MQ
 Cm3PkK4tj8dJhHcvvHO22pCpGjSJiyWkmtJzHwsxkAOtnR3al9dxuNvMdhIQSB5CxPAvPGesZ
 Bzc+wB1F/+0eSjp2engFmz83WY/Qe70YDXv/Hu3nBotaJr7QE2yCeXPAq1+XnW2y5LaChFGoH
 vSOjBNed6Qz8ftVCQrBcdt14d8buIpiy8MnENSXmUKnuYOtvWDG8A3nhnzZI7+0XVUW0KfHW6
 +EohkCYxEOrKUrkEffqfakvHrSYAJHbsoF1CIQZfv+9VaDtCiVTsnDrR1AJTXwhQywBrc2BFG
 dw5lfjtNU448VF5t5KY8WU0fn2KtdJ7zJRoaw6v3yiik4UKfZsO5IvibM2L4qZAGJl3WTsijq
 BA1FBrEdb48hVSchpgnmqaSoQw2lFzYBIzlURe+15+8yL93cmk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090949_892383_74D457CC 
X-CRM114-Status: GOOD (  10.93  )
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

On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Let's follow the origin patch's spirit.
>
> The only difference between rv32_defconfig and defconfig is that
> rv32_defconfig has  CONFIG_ARCH_RV32I=y.
>
> This is helpful to compare rv64-compat-rv32 v.s. rv32-linux.
>

If the intention is to keep them in sync, maybe use a fragment for 32-bit
mode, like powerpc or mips do.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
