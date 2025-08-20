Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEF2CA0EF7
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 00:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/kFzm9742jlElHlJ1uVMibvR4cZqudku/dkKmJK0L3c=; b=j71XDw/7vRIWfJ
	T7AYn5zKYXpbFKtvjsYNBOW9wIUVPI3IO/GVKBnv7EiQMHKjPzz1wiAFUquwZA+YHzISAOm+uJZTB
	7Msxio1/BewnNG6Ng8Q9Pp9tVKWOXiKhdaIWUw06VbSK0JK08Cuj+DyD09oS+1fN8n/of9EIYHmBC
	gejMlLCV3nvINMZOB4QimGDestlq8l+yiQSjrbH/xZ7IHB9o5sJap1XEcFmzlThHyO7bfwaqZU/z9
	WyTmMfKcUWUBjzT6m8d3j/4y7IrChltSjbHhlBGyCgYBmRPu6uJT2sRszdX4m8PjaaNavlBBkr23/
	TgWlgDq71U5zCzFQrmGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoX74-0000000C0Fy-1MTL;
	Wed, 20 Aug 2025 00:55:38 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoWYq-0000000BwE5-10v5
	for linux-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 00:20:17 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3e582bc3720so22227285ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 19 Aug 2025 17:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755649215; x=1756254015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dj/W5l5Iz4khApVd7wZ/FEtk0SzKtA1zmVC7nEcH6M0=;
        b=cuMXrg+RxcqM2P3p6zhNUQ/c3RObR+HOaQRt4YFjWSb8S2o01JFXej0XVCV3fwAbC8
         9LZnLDKBc/bk3gJFlVljGQ9EjWOYEUeJLU35LH9IlXl7+S9rdjYw6+xg0yoXPNW0Ydsp
         uS4l4NFt5I17IoFrH2fNy+mT5vsr6FTFC6bxhMN+kbx3AiBnWX/sMmeLr9XauqLjWEd1
         lnwJ4HHktUxZs7O/fYdn89Y7/9QW+gyeanz8lEs6srauztfHOaa4cT7WFeH5yf0e7hP/
         gwwHa2xJrFO2uSayysjo51oTK815IHF+EFqs2Z+wy/e9HTPbWqBNsa58j2SDzWeOeGkv
         c5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755649215; x=1756254015;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dj/W5l5Iz4khApVd7wZ/FEtk0SzKtA1zmVC7nEcH6M0=;
        b=ZzeKm2IbfySgeRmx7I7dRPNa5phfJgp85E/A4a9PEi1xMie5hQ7Nc1Kqks6ROGoY94
         RZCLnGl7wdTzA+vF7LzFpWqHbdz8wLvbLkVtVtOklG/w+c1fx86nfdcoi9S2qulzibwq
         JFgyYBSnUZ5Ox75R2jOhVEO20mk+eYytv9D48uJl4Iul+FAkJQZwZC047Evz/Y9eQaKa
         MDzSzF9ILI171aLqAtp9jbmAYn3b4IPh1mspO8qjBGil3CzYOIp0WgT3cFqWo0KHgmv2
         lTsMVCSjQejWSfxggxMJ2ZsE1X0H0zBMUrV/XvnKKxeLeIhyA1z8EPR6GAw5TzDCdkpa
         LfTw==
X-Forwarded-Encrypted: i=1; AJvYcCXDMOIhrW4sBT54Hku9mBKj85wryLswLRZMOXcOMTJiihFgJneVfJaCCUklP5rOV4uwyPqy4RRupc3bOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzI75d8fTofGl1mwuR0EareE2y1iTXLXoQoNALTkTGaE1bs6mcy
	35H+KLRO0we54Ng0aecCl5qGojE7fxgH4pZg43CbJjpfoUUSnbxwQpMIlYbSji3waR8=
X-Gm-Gg: ASbGncux/O8W9g0wmJhTxsoR90AwmLZELc3aN7i4D17WyHjGfSFhwNrOx+o48Ff4tGs
	osOlBwdiTInLkmgxf+xD1Bj/jtCKKvnna0wRkOZPUC2VL70abVcBkO5CUJ2dYeZU45PJO/lG5G5
	tb2j2ggYQcDe86XH2o1YTBmDGwCOrprLJDy7UHYtbGgL4XQpydqY3hf4mGI1P0rSeme6fs6T28h
	BLyR4zfCyzJMB9O2QybCf57WZYKaxpcit0eaGI1ZoQkToOKTX0kjG/8WpzsrpaBEbnkblXKpQDQ
	lcG7JNnlOfAe80I2v6sz3GLmeHCbhzjqCsHYaVBbpcdQq4iTrxbshlwZOnY/l6UWchxFgezFKJo
	bPH58DMXUEWjchZUwCleW7a8eQCuz1xyfXUzUWw==
X-Google-Smtp-Source: AGHT+IGbLV7K2oS4CfCrTycPmReNCo2y3ItP/0XiKPdtsaHZ2KX88gHbK8fBAvQFjzW7ezgl7groeQ==
X-Received: by 2002:a05:6e02:2141:b0:3e5:4b2e:3b00 with SMTP id e9e14a558f8ab-3e67c9e6dbdmr19085045ab.4.1755649215202;
        Tue, 19 Aug 2025 17:20:15 -0700 (PDT)
Received: from [127.0.0.1] ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e67d95f76dsm1007785ab.8.2025.08.19.17.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Aug 2025 17:20:14 -0700 (PDT)
Date: Tue, 19 Aug 2025 19:20:15 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Drew Fustini <fustini@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Conor Dooley <conor.dooley@microchip.com>,
 Darius Rad <darius@bluespec.com>, Vivian Wang <wangruikang@iscas.ac.cn>,
 Florian Weimer <fweimer@redhat.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3=5D_riscv=3A_Add_sysctl_to_con?=
 =?US-ASCII?Q?trol_discard_of_vstate_on_syscall_entry?=
In-Reply-To: <aKUQXDh4u9xJx+jS@x1>
References: <20250819-riscv_v_vstate_discard-v3-1-0af577dafdc2@kernel.org> <20250819-bb1be8c05ebdf7ea751323aa@orel> <aKUQXDh4u9xJx+jS@x1>
Message-ID: <967A5590-1B0E-4ADF-9947-E8F06CCF14D6@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_172016_281050_469D90E4 
X-CRM114-Status: GOOD (  14.70  )
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

On August 19, 2025 7:01:32 PM CDT, Drew Fustini <fustini@kernel.org> wrote:
>On Tue, Aug 19, 2025 at 12:16:02PM -0500, Andrew Jones wrote:
>> On Tue, Aug 19, 2025 at 02:40:21AM -0700, Drew Fustini wrote:
>> > From: Drew Fustini <dfustini@tenstorrent.com>
>> > 
>> > Vector registers are always clobbered in the syscall entry path to
>> > enforce the documented ABI that vector state is not preserved across
>> > syscalls. However, this operation can be slow on some RISC-V cores.
>> > To mitigate this performance impact, add a sysctl knob to control
>> > whether vector state is discarded in the syscall entry path:
>> > 
>> > /proc/sys/abi/riscv_v_vstate_discard
>> > 
>> > Valid values are:
>> > 
>> > 0: Vector state is not intentionally clobbered when entering a syscall
>> > 1: Vector state is always clobbered when entering a syscall
>> > 
>> > The initial state is controlled by CONFIG_RISCV_ISA_V_VSTATE_DISCARD.
>> 
>> I'm in favor of the clobbering being off by default and creating a knob
>> to enable it for debug purposes, but I'm not sure we need the config. I
>> think it's reasonable for systems that need the discard behavior to add
>> a sysctl toggle to their early init. The config may complicate the
>> documentation needed for user recommendations and potentially generate
>> confusion when moving from one system to another since defaults could
>> be flipped.
>
>If I dropped CONFIG_RISCV_ISA_V_VSTATE_DISCARD, then are you thinking
>that riscv_v_vstate_discard_ctl would be initialized to 0 instead?
>

Yes, discard off by default.

Thanks,
drew


>I would be okay with that as it defaults to the clobbering being off.
>Hopefully, Palmer will chime in on whether setting the sysctl in an
>init script would be acceptable. He told me that he does want to retain
>the strict clobbering behavior on his tester machine.
>
>Thanks,
>Drew


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
