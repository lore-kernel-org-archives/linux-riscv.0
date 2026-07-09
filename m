Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2902DC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MO843bWf8TcTzQvpINEJmNFGsI/v82fSOAB74ByMP8=; b=ea652dTn6Wx6pF
	5qyySxrF35nJJvn330OAWvTB42jm0E0MNyqe4BIxcoy8CqF5BAezAX2XiHMJEzdTEAN8ONPvZdrg+
	YzyiQf7AK0p0dw5yQyYC+i546SYYmxfGMmZAtnrLPEQ0F69XcTOfUleHkb+wg+8f6qo5+dLVN7TlD
	kzLFgYsWZw4pu0hL081lV4QTirDewoAz37A3vwzDqjmI3KU0XGMyHe2HnQFEStGChfdqb5oxyhrU0
	5VRmkz+Oh2xdMlJRc2Umq57Q9eIo/Ab3ZDfVcFmoU1UdfmoVaMJA7nvEyRECo9x+qoLhDD46lBajX
	vffyjOfSf9t4/RiOA3LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkWk-00000001eIm-30we;
	Thu, 09 Jul 2026 08:54:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkSJ-00000001Yzy-0AIX
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 Jul 2026 08:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=; b=E244YXIZ8CvNwdZA2uEzrgd/ev
	MXhGqDHxFfburYUSiz1OmAErzcyG6Ua4ED9cmN5egGMJx9UG2UgSDFFFacJgeMC8yuZ86FKZp+Yzi
	erPmX+FGTTcaCCpvfA7ZXjoUmU3/W9zt7o+uNqsuJF/slwlW00C13qCa8DCoo2j1uVuRSM4c2eaR3
	AzTckJ0gX2W6sFuIaZVHofKfs1i+98haWy9MeoHxR87oG8q7XeIIbdMWzKCN4h1TAH+sY4rY6p/EO
	3ay1FzKQ1d7MfVlDraqIRz9YAL/3vBpvmiud70LyuxTMz1b1222yFHgZ7keeLrKrx4uW623+vNgMa
	zuaCHnMw==;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whkS6-00000008yfx-3orU
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 08:49:56 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad8076b01so18755875ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 01:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783586988; x=1784191788;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O3mkBNkViagFAJs3obyg41kBlrTMtmvpPUP/R2gZOPo=;
        b=fs5fxOxhcshBLARj7+O0vQrWGcNuOmrKlZMO6WlI76QVHNPQrzrlyTql+M2hFEV80G
         IGjeSqDqZmSjnm/mvrcPJm72SXr37EBVelGpoKrQ+I73fS9c6RN2cyNF+EQsOjiafoOR
         aHY6UUrUXg1z5ptHl5hWa9+LNV32ulnGlN4Vj3vGPYFoxNbBdiVS5myEd1NRsV1d9IVM
         cGuzzkursCqipmwS2jX7uGdi4M9olsvbXZh1V9dePUAzsAUiSSvQwSMeTmoTDWscLHiR
         iSRC9zS4UsTCBfXdLnWNztG/3V7YSP+WTWnG8scyMmTZ2+VnalSbsZD/pBIY5d/2VNRP
         wyTQ==
X-Forwarded-Encrypted: i=1; AHgh+RrJpJfkid+fP+9jNX1L9PZ4LEw5o6a6ouC9snn6BsCJPAsZMvvC5Zddp8d5U9pju9DS+3xJaoBZh14RTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVoOGdAkNk1l4kRR8OK5Hwc0IEM+p1Im180uzgr7QbW1npEssr
	432T7y4XdutbVlaR6q6zuR6iYtrTUz3kQMV3F7JXDssE8DtJ2Djt6e7qhT7K3vjDG88=
X-Gm-Gg: AfdE7cnmkhpc6qKsBt5aR6NmTlLkxzcwgsd4pXsAbAB4G3gu9iHVVFH/MMzPF/yU4zN
	Ybu5UNUOhwjY5QQOC4imN5R/mCfIX6f1FIlo5muDaU7GGsLkI4csOvqLi3a590s3hxlnN75h2Dt
	UBvANl7ZCr4v/1ntxA5USSIj74vr7ukdzkpkayGoQWAHuMkQiQ546FtBO9y8ycr+4OuNklp/new
	PguyK4/6WTYFnBwh+wmvjEz5Y8pD7swyG6HBbR8qZiEG8qBYkf7fsUJIR/B8K/7/e8MlnVSi5k+
	ZOy/LnG0BktpozCP67SmY7wJ4PRcRY8wUecauUGZ+TiZL8lrhTWWlppjfqo+uCMUuOt16WQzrPi
	5SDKWk5ZddZabqCM4RMJ2Un0UUDjxTsr1M2gWilaenBqWeTfvC8gISnSyGqQwWzNjeNo/0vAwrK
	4/GOZstKpZhO6GdIRsXdAISLA3H27M1OpSfyX2KF6xIwmGXpZhMsDQxnbh3sAkGdxp
X-Received: by 2002:a17:903:1447:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2ccea35ae25mr65201485ad.9.1783586988061;
        Thu, 09 Jul 2026 01:49:48 -0700 (PDT)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com. [209.85.214.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdcbe2sm41023215ad.9.2026.07.09.01.49.47
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:49:47 -0700 (PDT)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2c9b1edf2bdso23720695ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2026 01:49:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrCmUZ+SobsWs8YUR0uHJiyhv8Wka6DOnSV8+DokPEIG/n3o5/fQ5WObTOS/snd7sXECOctZNlSJJqQnA==@lists.infradead.org
X-Received: by 2002:a05:6102:6895:b0:738:9dd5:9b03 with SMTP id
 ada2fe7eead31-744e03a337dmr3306957137.20.1783586528282; Thu, 09 Jul 2026
 01:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org> <20260707190254.280015701@kernel.org>
In-Reply-To: <20260707190254.280015701@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 10:41:56 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
X-Gm-Features: AUfX_mw8w2Kp5VuAYozzfDNS6gDbdKhQdYzfXsv-G72F3LS58UBytbGwOmplITc
Message-ID: <CAMuHMdWe1D0CZrav5h6EhDDbeJzgJcHvT89jrs6109Bdj-pdTw@mail.gmail.com>
Subject: Re: [patch 12/18] ptrace, treewide: Rename ptrace_report_syscall_entry()
 to ptrace_report_syscall_permit_entry()
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnd Bergmann <arnd@arndb.de>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Vineet Gupta <vgupta@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Helge Deller <deller@gmx.de>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Chris Zankel <chris@zankel.net>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Richard Weinberger <richard@nod.at>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_094954_580745_45979F9A 
X-CRM114-Status: GOOD (  18.90  )
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

On Tue, 7 Jul 2026 at 21:06, Thomas Gleixner <tglx@kernel.org> wrote:
> The return value of that function is boolean and tells the caller whether
> to permit the syscall processing or not.
>
> Rename the function so the purpose is clear and make the return type bool.

>  arch/m68k/kernel/ptrace.c       |    2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
