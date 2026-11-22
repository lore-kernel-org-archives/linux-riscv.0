Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DA6606A320
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 03:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tL+2uYSV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T1gEkbx6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=U18CD5yolygfc1VhbWfYflXLz9lNsVxhjmYbN3qXIvE=; b=tL+2uYSVPUs3qjad3O4knODbCP
	2USfHogbsG6PqAHHmERUAQWTOaDEM0wz+EAI45AJpEHOOf8cZCZH6gIK5bNaxwaqBz4ehROybml+/
	TjQr/iJYhhoXCAhNUsm1wJE9s9ATeIv9fdyx/J7oWjGi7Z235db632C7WyqAaWkUBDBh/55+8mC1Z
	xWGWS95EjHrUff3n6J+/RwuGIb4ZtDHafLAKuRci3V8+6vZ8B9MVDyKbHTIjIpnKw3zrSdUwwrNwA
	71FTzyr2rsEL7D/Q90U2iau8g1ql5IJZZTYJxj4yQcIYUUyOlYa3Li6MZv1ycuKOSCTXxM5JwK1Rb
	4iVzsMvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUxsw-00000000hOw-2Ntg;
	Sun, 22 Nov 2026 03:04:58 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUxsq-00000000hNh-3Wq1
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 03:04:55 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3869f03af6aso968335eec.1
        for <linux-riscv@lists.infradead.org>; Sat, 21 Nov 2026 19:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795316691; x=1795921491; darn=lists.infradead.org;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=T1gEkbx6FcFYvQ7HLPuhM7Rf/1/LclKLeScZTCE/WTEnjj7zX+b1zruKUND7Eht8yA
         TTo4qIfVVoxCExaeLGnrGdjretO2JuimpPPKQ2V0BUvWxmLw87NnpBryXFS/9wZKKQDc
         BdYJxbbk1TWU1PIA/n7yKRAwGdWai2PWQGz91JdvI5rVsIwaKECGvsk+lt4x8WCOBiRj
         axYU2ipt7Qwb2d70RGFLMrd649ymAV+ucaKhxYS2fQPB3TxwZ13x2KerkoSLVerGLQKB
         kAhT6IOn4+U65meyKuAeCD9mXgRCabnJ29FMZgp8p7dWflnyIvSyiabqHIAnD3luBU0N
         iwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795316691; x=1795921491;
        h=content-type:mime-version:references:message-id:date:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NieCLCvG+gDw8VjVQsEmj+Xb3Nuvde1xSdj6TYYBmIA=;
        b=qtmhrflXcr6Qc2tnyGiJSpAjQEG/ayubRNNT/RC4MPzfjZwhgaDHJukOmiuKM7mNbr
         CwHowrukcjraf1hrJ7Hcm2FHaaIYhsWJGP2W8CCm7W38YVkoZCUL50cqUPEsVS8ZQFBr
         2wbjyVu5GQHQC9jZuqnlX3Kc4JLE8g6FnZF0aIWVf5lu1hzde96dregg4OD2D/zxEaoQ
         q05IdkFZThW1c2ATDKDW0P/to0CWbIWCKZOVgdT7fFKy7Pg27nzyPaPNlpvyubMwrLDa
         /d8jPEzae1nwG/g/tusrtFgeKTNTauRMbxu82UfgWV8mQcrBzVE/9GAz9a1BvtgfiwfU
         PKGg==
X-Forwarded-Encrypted: i=1; AL+hErE43jfJPi+/T1bh/mjzaTEAjfLqCA6zpCcgx/oQqRie5aH4xawFI+p6NktTMIz/n8ht4bb+1AzdPHEZJA==@lists.infradead.org
X-Gm-Message-State: APuU4Z/jkLjbLhHuPacjSGpGT9xqvQmyP2fRtxTTd9be+iGvjtV0noIg
	wxtbzDLr7GHvFnbId5M5GJJa4kqdUmi7bOul5WO+KFo+uIsS3l2bNjwm
X-Gm-Gg: AZFdTZeTDXU6X8e+ocN8jzmbsEJ7Z10S+Z8ucyj2QkHS5t8yAYUJ2/uzEwAbeh1ixrJ
	vMGfYAogecD4itNbIKTwnw1gmIIJVyX2UDQC7z9rgqw15tgZRUHdQLWkzQhF4VHWEmVXxvw5qFP
	Wc/GygT+9heNi+r8gqSWkCNZyc/UMx+pUMttnfLWOJUl69ewFeVIRyRrvVYTCqGfyLiZa4MrgtZ
	rE7QoJ4TER+O9SqOdrOaRALy4Rtz4xj/rXuShS9OM8ORmmk8LGdxPnDF1KVSu4HgnsFeA7s7uqo
	lZQb7mtDPiCPY77dw+YTYstFtWahd/Tq19IRrHMTnHnS5BHreBKQGNjr+JVJcuhFxoB226RNFuc
	omUQuLYONGyGDJ0S5/3haCmZS/yMHYZtrBUspyW8Pyl8UlziuZaWUsgK8zjsu+Rsbvgly7Zr4Uh
	aBrjIhTHYeTlPxjsdb3tfAXrjcMqZBtnO9YyAx0QURN1WOWOijdPV7kyfzj7Fzkzm+vQ/aDszqX
	zHlbDTDyHD0lisvnBJnGBUVq5GGDRFM0j8Rnzkl4NVTebYXsVzZV7YKU9uWzqOEegBObFWPnarp
	rspE/r1fjd43mFt4cF66r6cmlstn0W+EHEAIhZwPGUnJFpPS
X-Received: by 2002:a05:7300:50fa:b0:383:9f52:e54d with SMTP id 5a478bee46e88-3856ff52e83mr8869235eec.8.1795316691531;
        Sat, 21 Nov 2026 19:04:51 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm24302948eec.27.2026.11.21.19.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 19:04:50 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baoquan He <baoquan.he@linux.dev>, Borislav Petkov <bp@alien8.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, Rich Felker <dalias@libc.org>, 
	Russell King <linux@armlinux.org.uk>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, x86@kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Christian Borntraeger <borntraeger@linux.ibm.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Cong Wang <cwang@multikernel.io>, Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] arch, kexec: declare kexec and crash capabilities in Kconfig.kexec
In-Reply-To: <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
Date: Sun, 22 Nov 2026 08:33:10 +0530
Message-ID: <wlq5k1ox.ritesh.list@gmail.com>
References: <20261119-arch-kconfig-v1-0-37c276fe4d26@kernel.org> <20261119-arch-kconfig-v1-2-37c276fe4d26@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_190452_890143_038B062A 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Mike Rapoport (Microsoft)" <rppt@kernel.org> writes:

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

No function change observed in this patch (as described in the commit msg).

LGTM, feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com> #powerpc


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
