Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9136606A320
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2026 07:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HO/L8Ohj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=k0Fa7SX+Ep77DAiDcdPtnQyDia71+95YBj4DLrn81SM=; b=HO/L8OhjgS5OpbvDNPtLIJHp4s
	mV+dDjYcNK4Uy0h3NRYy+jfAFrB94tXmVikVLudOIKLnR2WGIRcziQFg4Clz5RdjY1+NmYUsqo9bY
	QsLghRo2C4YcoHrSVfTJSB1yAoH1ITlnRh6bT/IrKloTalqxJlrAcCU8wSWz+7lliN6obNkD2IhMi
	3+NLWJoJvD68j+YvgmQtiqt/kNKYJZ4TuTaIFBQvghu5zIFSJPpJIb4YS83X94Exj1p0gizSOFeOV
	DLr2JO6Wj/ec7wemJAk6atISWyX61q5y/VVxEdXtDbOPCoarViZ7onMrZmTpliNuJUHqCdWFuOBiC
	llq6D2BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTway-0000000B50e-0oZc;
	Thu, 19 Nov 2026 07:30:12 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTwas-0000000B4yu-0Doa
	for linux-riscv@lists.infradead.org;
	Thu, 19 Nov 2026 07:30:11 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eabf243d05so651205e0c.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 23:30:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073401; x=1795678201;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Klcqtq67J8++CxJ47wWJ4KmRtmeIU5oN8tRyALYYbAY=;
        b=Evh2k2d4oHF/CMselbDh3QUZ9fxzGQ6r8U7f+Vge3m8QnZ3i5c149oDI6CjSRFJp5Y
         UKOSGqUZu1vetYI/viWzKFo0lZLMI7b076kLFt+dPlIkWhsG5WXjer1tS2rLyF31OWQa
         k7Hr0iFWVHz37ahAr5ARBD87eOM7axP80frp+YgUBtVRDCDODod78VFUsVaS2i5wPSv+
         VHG1NNqlTVvpsTPV505TqV8sr0LIDcfkz++ociPiULEtE5K06HRWzPVqdY8967eZdr2X
         vRvHVJQsIZu0QinrbKW5CnAUv0sHJg6Od/ytRH7j2bu5ohqlQby2Rl0A2ohpoyoVu1C3
         bErw==
X-Forwarded-Encrypted: i=1; AL+hErFU5kNdqQGqo81ZZQhlJRSMWAwuHLVesNukpIb+wlLOxw1kNmtEqNGIWG5ZB+K6vdkWOM/vdxBhtRWAiw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Sniyf8Up/2+3v80YvjmkTDDAkCavZOIa/JrUw8tXDcM1CsMPs
	OEH9M0ZNurIFfrujlMqxcyReeYGwdfdJent9dDEmpuXtI338P4MdRDhDz5dAiYOy
X-Gm-Gg: AYBFou2tptkAn/BUzaoZzebcx3vJtBWJ26S+i/eKct1TMw86gTdNun3n6HVhRJbrcmQ
	X7/SkHArHRkvXZ9oYhffdZl74vFbtHPhKtsfV6osehD1I6Xg/AxtdipeA4xKOJCwj+R1aGjHjL2
	I0o5AnzwSBLzWuQnFPD2VLibsPE6EBnurT3npxN0qFZvqHVqKKc5intgJWquB72KCZlBCd4pdGE
	GscEVZO6wBXpoInSI3ufCbnixyKUOg9XX9FFE7LX8/lX5ER4V0pZ9AXkGMLh8m1JP4kq1dUxzDK
	Yz6+rOqUYVbVjWjjlSrVYuRi08yAsyDoh38jkiwHqbgn3fhGgRnmSl0r6Xi3uqoCLCFtxjtcT7w
	B/g9qq7pAwrD8XlfpdZY6y/ltHrZQuIfB/5QcbNU6t9xUopXn1B3qAGLhLkdQGXURm1ckb0NCru
	78AC4NIi4PvyrELdNAK6gxWZBItT1mawxsK2Z56bnKgI9W1q7rM0ySqzm+/qbFor4/2njdn6cHL
	tm8Y9mlZ7Skg276N5AKko4D4sDNNAALXwxKAC0PlSmduMEW22TezwTTiMLYsNdFpN9Rz7mfhB+T
	c2k5T2pse0B1Jph7Os9y3qoJgOMiPI2OcfK3TDjD9KgoTPgb5eCr+NjD38ol/Vq7aOaQ2tUQ4GC
	qf+3kdb5+fv9+
X-Received: by 2002:a05:6122:289a:b0:5c0:fb8d:9993 with SMTP id 71dfb90a1353d-5ee644c8bb8mr2380324e0c.0.1795073401599;
        Wed, 18 Nov 2026 23:30:01 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee64c1801fsm3620369e0c.0.2026.11.18.23.30.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:30:01 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99ac154431bso377774241.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 23:30:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErELEHkV/PpS+2i7SRQ+GlR2U0r+MPMtunxF3QV7nmQrbod1gKDBju1Kj98M94/DQTPhFZDvv3CHlas1vw==@lists.infradead.org
X-Received: by 2002:a05:6102:e0c:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d6ba35b7d8mr1806982137.13.1795073401089; Wed, 18 Nov 2026
 23:30:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 19 Nov 2026 08:29:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
X-Gm-Features: Aa3M54rf5ygj8ORK3fy8Y6Bg5UcrfzvYekQ-eoJmIgxSYs0ZeBrecHV4-2jERSw
Message-ID: <CAMuHMdU2u9wDiqp+H-aDWSRcT8_VtDg1NS0gVmqYYm9rt2ZSrA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org, 
	Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_233006_579321_5017394B 
X-CRM114-Status: GOOD (  18.93  )
X-Spam-Score: -0.8 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 at 07:17, Mike Rapoport (Microsoft) <rppt@kernel.org> wrote:
> The options that let an architecture opt in to kexec and crash dump
> features, like ARCH_SUPPORTS_KEXEC or ARCH_SUPPORTS_CRASH_DUMP, are
> defined in each architecture's Kconfig as def_bool, and most of them are
> copied over several architectures.
>
> Declare these options once in kernel/Kconfig.kexec next to the options
> that depend on them, similarly to how mm/Kconfig does it, and make the
> architectures select them instead.
>
> Selection conditions are preserved, so there is no functional change.
>
> Acked-by: Baoquan He <baoquan.he@linux.dev>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh

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
