Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A746CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 11:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ppB/BoOxhMz8/YSNTCl8YJY0BeOv93zRL97XSjrxKI=; b=v1+gDQ92gHCN/U
	o/xFETIDsL3B+WxL/56pxRnwz99Ff3vpoXHT8Ryb6exX5RwuJbxGY1FXElUnXD4uB5BfYke39v9gv
	GgZ4LULU8JCAFsvdNsqWoZDnny5b9vZ7WpN5XHw1rejN6drpfQXTaQOg5JpoG+gc9WKmqUgOq3UgS
	HA6WcNgDfuDDIDd57sRBfFKkzFdRWvIj+mGBL3R0y9yWsVTW6+hLm8S7n+kWbjSpUttbsvYQ2FF4q
	KEJ8IWbfMIthKX0dbhMoS258hnE2Ln9WZ0YRMxP96+6KKTYU56KktfNeGIkIZHkDdFWl1GtUdAPoO
	VkFJhpfuXhpdkKiPFArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6t7K-00BBF8-Ly; Mon, 10 Jan 2022 11:45:38 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6t6T-00BAcr-GB; Mon, 10 Jan 2022 11:44:47 +0000
Received: from mail-wm1-f49.google.com ([209.85.128.49]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MEV7U-1n9eFc48wk-00G11G; Mon, 10 Jan 2022 12:44:43 +0100
Received: by mail-wm1-f49.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso5037398wmf.3; 
 Mon, 10 Jan 2022 03:44:42 -0800 (PST)
X-Gm-Message-State: AOAM530lgJhHuaIRdlssOINTBJ/TY0NupBuAvXKl1bTltVFmm5pSubu0
 rrhiYXI2aLg+9GfXZkashKibGFDcKXsm0SFv9qs=
X-Google-Smtp-Source: ABdhPJxOkVX5X/eP4ROAMmqEcBQO9QsPU/GNla4UTfIaHqTpDouNC4IkJVmWSHu8Rit8nW/iWcW7PE1EcM2YzrteSLk=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr738103wmk.98.1641815082604; 
 Mon, 10 Jan 2022 03:44:42 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-3-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-3-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 12:44:26 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3RALe7ihmhZ-5jucrH_0CZm3VyPaVfT-nC-96=1pKTcQ@mail.gmail.com>
Message-ID: <CAK8P3a3RALe7ihmhZ-5jucrH_0CZm3VyPaVfT-nC-96=1pKTcQ@mail.gmail.com>
Subject: Re: [PATCH V2 02/17] fs: stat: compat: Add __ARCH_WANT_COMPAT_STAT
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:Aizuvy0bhsRwgUuL0DFHZu9RQad+z8/yXIkBJRZdYJ0ys0DtADY
 F3j+stLP7YDhis7X1cs2phi5HFbwkEPs0dfgchAbLZW+ZevFWqiii/tSbe+ApZTNTdQh+3X
 ny0NFXPdFUFtFx7Yoq/XIZjwImT6qnJoxxHlrLHFD0a83DHD//u69EyogE+TImzVkKYyd5G
 Hlao4LO3qa8CFZ6w+Qd9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:uOaLuYTIdtU=:iI5cQIRvMaVJPbuEIk+iOf
 N8qr/zyipQYnZHHGMi16NEzIV/Gna4dFnyeH+GdeHxKo0CmRr3L879ZF+YPKil1wuHeUsRCY9
 Dv+xRTPjsPWItA8Qd13FiX8EgAOSLTLhpSNBgshMkWLvG6w/k+aRLICe0zo6hDNAYf/DErsau
 tuWIKrZ/CQ3AUFtjXWJmAxd6v+aIwwF70I27jIJ9F5hCY0RvHcbovBshosbGEMZwmHNlxRwd+
 uNDjFj6TSUhn4vNg0AeTKjTWxC6GY3FCy/rI6g9KyVZiQq2Ae/1CQ11PC+89OoewprbEZAzBi
 fADmieueIUcI0wSXvbPfUUFk/wmKhH5Y7nOW33DrSsPdsAIePH7DinCEWax2ib0Aw9gVQw2sm
 tUrvEYf6W1ffnA5CBlvCibj4X437rvrm9Sd1tmqAVm4bJx0dhXVVvzhmagEh92dwG1huI37dg
 izI44qDuMMRFqKv+OrFMyRFJQstyE0AfPp+KOqv1qy6+FXEe8D/Y5KcLhbTmDkn6KeZusUcGo
 7j4AANYHA1GC79ejeCULWkgj5GD5T/U3oUiBq5BuTt7e0biNu8S9L7tfg66/Rk6HJ84KL+aM8
 T1LBASWsEc+Q9BQtXkL5jNLhTM1z0y8QvogsEltBr8+YNPUwC1Yy1ogADaKfb0FEzfHzX3err
 QRlxOxBedhHwCuRzRGlKriB4KzUt+2aq0qh+3FJ9UQ9wVnLXTCZxRIZYwUrLTHf9JNu07n+s/
 hwZJkp+J0dvJmzwvw0z/y6koe4LtigP8mmQGMuZI2lNIuotpWTudq5s9k+qfzg1YI38stzJ2L
 5cIebSxlPTxsxI+WLG9zSHnxlHGAtpUbP6qAjeQVjCc9vZJp2Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_034445_848681_75CED014 
X-CRM114-Status: UNSURE (   8.93  )
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

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> RISC-V doesn't neeed compat_stat, so using __ARCH_WANT_COMPAT_STAT
> to exclude unnecessary SYSCALL functions.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
