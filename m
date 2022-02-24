Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC285C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 09:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uRS4YYr6wzWNz+U17FS6Vkf6RjhBqlAY9sVZgWp5qE8=; b=ssQKONSKbS3bjY
	XMROqDC2kC88gLTSX5vFfzYmlkdMdPvcBfrnO3e18EdhbLuF7Sr3V2vLI9nccQYfBnOsXq5e2kN+8
	H2yq1jY/jfnv7xJzGQP94l78Q8nxrKRgg0zJ6FKjv1mck0pUpzjzJlqsxV/wTB8ww+gtkQXrcDITf
	bmo1MR6akGyv91DZubNh/7Ny+NcPd1VVQglmju5WjGzxeW7divLjDKLKIB/B+YX9l6SdddfYEwVOF
	zLmcK9OFVnjS3VoG084/LWCBhHhGqPZje04MLmptqWNCUqjnwxtwwujQ1z9x7G0c3tffDVOmllZ7E
	yITNoaL05g+0Q5t2iLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNAI8-0000Ch-TB; Thu, 24 Feb 2022 09:20:04 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNA2z-00HTe3-5f; Thu, 24 Feb 2022 09:04:26 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBDvU-1nWXRx0yLe-00Ch6J; Thu, 24 Feb 2022 10:04:23 +0100
Received: by mail-wm1-f48.google.com with SMTP id
 n25-20020a05600c3b9900b00380f41e51e6so826623wms.2; 
 Thu, 24 Feb 2022 01:04:23 -0800 (PST)
X-Gm-Message-State: AOAM533y/xBtLIedtu41GKT1I7gtFxGAbYN+gQsJLeIdH7XWGz8mY/1S
 h89HI9O9oCHpgP4KBN/VyEetdUhpXtOZtxnsBwY=
X-Google-Smtp-Source: ABdhPJyjEw35XhDO0nptzAMVKk2Hxde9tm8LwW6lNeB58GkA2TxxKPLSRkO1YZW5ApcDqUwIlDhAXRFgLJ95HKAPDdY=
X-Received: by 2002:a05:600c:48a:b0:380:3f3a:e08e with SMTP id
 d10-20020a05600c048a00b003803f3ae08emr10577359wme.1.1645693462887; Thu, 24
 Feb 2022 01:04:22 -0800 (PST)
MIME-Version: 1.0
References: <20220224085410.399351-1-guoren@kernel.org>
 <20220224085410.399351-20-guoren@kernel.org>
In-Reply-To: <20220224085410.399351-20-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 24 Feb 2022 10:04:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3vmB4Vm9UOHx3qnTY6wUyw_r3R11amYwyHNpEhFiknrw@mail.gmail.com>
Message-ID: <CAK8P3a3vmB4Vm9UOHx3qnTY6wUyw_r3R11amYwyHNpEhFiknrw@mail.gmail.com>
Subject: Re: [PATCH V6 19/20] riscv: compat: ptrace: Add compat_arch_ptrace
 implement
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
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@rivosinc.com>
X-Provags-ID: V03:K1:IxA6zuyzAKAu9UK2ghi2N3jCW89qhAIvitHrA1xiZPnRgiNqSJg
 NeDMjkw+rqTnniYl8IUB0ZF15AKIAnA+3NiHGLzZBgmGXIku70aDtsFnTUJ7Z9+wsKzCe2o
 ZvEPIn1gjU5KPJWbcGRligWnVkH0nydUeGcmYgV7xN2OiYy/uf61PsilUh5dU1pLBDqlAF3
 r/9bxFQgpfjF35IF5bjLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2fAAJ6ucQ6w=:hJM/Am892xqr2T6ojE05S9
 AN1l4oehtKu8gAxAkvWHShXdV8gRRtd+HKK2qi9xe/XZl/e4OAyiaOGg+SoO1r03o7dL2jlDS
 pNYcsgZF0OsC7ErDwC5YQs+/aTAJLKpCICpwlssrQPDGUZVQZJXv1idI6tQj2XWp8cfM4cQi4
 XmPGjFONBIz07mRDZ3xsSI0RAOIzpZN72OZSnf+YOVAr55ILA7mLCgNEkC9Ojq19aAUYvLKbo
 CBAXo8OVA2Ae0JX54eD+1eIOfP53RnSwxZ67AECtiOr3kgjoeptuxlerp3bnJ5R7XvE1gIlUV
 1CX1GC1LrBKhVYZ5P+if8j17sSeCGnSLtT8+SSA8B96cgrQcq+2G1XYiUFAHuuJJsb3sfDNYl
 wmAdoja36lI5rjyFpDVrHn3xAzuOYMJ0iefxjydHjXQ/Bcf+KLMaJ5tG44WdfniAruehqdw/4
 rEiS/a8dEwgLwsFKXQQo9KmRilVH8DC1UXtEaxYh/2CHiqSnLiCf3E9YsbP9nUP2CfmeO0uuj
 P7z5ZAQUhJDT36WabRv8z4lSrzjLEEDcFgUYAhya3fSxxT6FCGbqbIsstY9nGAyRHAgZSEMst
 s2rmHXWohPG7atU6YDe3fZAPGcqB/shFNyVfKqFVgbtzFAM22DYYgwX2skw2sg0xXZlV53ei7
 WYWYe4PWMtid8buUhnDDtBv1WZKBMPA+q1bysElKi8FRiugzLcFFzipyDjWwyNJ1JjeuReGcy
 EL1mTK5URnftdBINNIz/gFn0QHCU8qQaBmJFc/AzwelZ4gyBEnswg1uB1STFXNDfg6Cfx8Jez
 6pWQMbCRVqcJVzR49IhckMthNVtKOkxJSmcKcstw6nlaZpDXk8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_010425_546583_421B6A8D 
X-CRM114-Status: UNSURE (   7.89  )
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

On Thu, Feb 24, 2022 at 9:54 AM <guoren@kernel.org> wrote:
> From: Guo Ren <guoren@linux.alibaba.com>

>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
