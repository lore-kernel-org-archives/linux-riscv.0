Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35F9D2D0E6
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:Date
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mQ8fA4Px8c5m4uTXK9soCf9g4aCmK/9LIvOxmoDjT7I=; b=aCFA8rBlwHSQlw
	XYdp6xuPg5LVghDf1FpC+d+kn3K4bRlnBLTAzOl/e7ArriObAPMqegGaL/QojYLor7AVO9OiSGLOK
	nf8pwJt9TlON4d9YfexcZY5O3q687n26t9pdo+7ElEMQPF7DZTAbH05ZpkX1dSLIQVhWfLFOUvK4h
	wonzjdwD1kq8sHHGtL2jpRdlZFUPmgs5xRCZT/2kgVzd0aG0nUB19cyDxXBACKV0mpOTV90ht1d8E
	oAiwdh5Eb7Rj6idEq5JWRujoddIjKCO3ePOcpBUBlhp6jO1zvYhER/292wmsMqbLEVafExwuW6KNT
	MqNki2VnG2bP0HFl2/yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdaW-0000000755n-2gzE;
	Tue, 13 Jan 2026 12:33:32 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdaT-0000000753s-1NEM
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 12:33:31 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-34f63ad6f51so2882700a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jan 2026 04:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768307607; x=1768912407; darn=lists.infradead.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=JrB/OsD3UcJaQwF+E/jvirHSJHGhEjGawtu9Sz3J6QPvyQDozOlMOvMJyGNF7M+Esm
         WEMKHZnFPb13aH9lSgtV3nnhje+syAO5735tmcTRBQ2XELXK9FBIZjzcHgiHYKM0XCPr
         yfLqf/aPA5oEAylAU6btlkiWRAxv2+lNvyzvbm9tim7nutg4CJiL9FVXXHiSIA6n0arP
         cB3RzDtaNZQbB22XqbeztnjqikHclilYULeP8ty5n1tV8jzQy18kTl6WF7kXKGEP85SY
         VQsFq3u9Oaj7j6mVC7SBsoxUwWyxwffs5gZw4KHmZnuPw6VCseK82OuObcHKQ8JlUpOP
         G5Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768307607; x=1768912407;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j4BCb4tuwUydlXX/lekB/MWAbo5xTWmBY98lhxIZgCk=;
        b=bDhBvLn+hkD9jiGejwSKQU/L4KzS6GKbLlgFWgW/7vlxtuYDp42kVclXAYOxHVcT7N
         +Q81ZH0Ll4wzOyAWBtUGL4ajVNxw6Vf6K1lz8DRB+wcqgzdENzawogKLG37eTcBTPb4W
         Y3DsQrLn0vfv+u7AszMtYdI4Ox50iNx/F8a2SaLFWzm5i8U2Dab8aeTmGPx+eAWWY2CO
         RMySHulaE1x+3ISaqJpqnvGA6zxMiX5n8uAEd30L9ST1rdra46HlsatvblscoYrf4BOg
         X2Kwa6kJMAWZ3smNKbIThKMQAKDTedvIqPt48bVuUl00nrbE+721EXWzf1fgKtEHexyo
         REfA==
X-Forwarded-Encrypted: i=1; AJvYcCULHkaxMxmawwnd0UJDXKTtTFxMMDhBiXINZ3Z/5qicPWo4JF5+uFeM9pCVPgpasRgJo4KsYzy7Caz2Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4zFX5SxevJs2uCrzkKgX/vntCLU40taSws21M4vgrTG97GqFp
	iAbGXQko1XSpDbWg1iFcnP9QTvfMLogcBQFgqLGreKAJzNKnHzirDaLs
X-Gm-Gg: AY/fxX4CfLvn5w+mqJIShxyHQkDSj3YCqfujCXccD1VgvtAnI75m7VGPnJFvXOEEQDp
	wwKxXQpCcfoACmvxdD3638VnE5dTu+9ahgmx4TSGaclQSKk0LbG/P0xgt/aZM16Xl33rXvbhUez
	csncw6zirq4WeAKa+a7H2JZy9x5li7STIaBqOIB7ymszjoxGgdCj+uNfQ1lTB+Eq6A6qMngT1dK
	YfP+3gaFJviVOoq5MRPXvZrmIjSlBVK53HPxEMROCM+HBcyXCvqGqxH69XTmy1W3WnAc+9D9dpP
	XMlc4Tb5Oxs/4/3eYVrnxzBxzjaacyELiY+dwpACgNttzUKJaz2pjJ55GUAni3u6F6ioX1HMqpM
	nQJ2n3i2txDn+5GkAdkblT9s6kDuI9/clniPN/Tp7hTfvHhET6j1DPSFdHFsT8Ih+pDafNlQx72
	q936dC
X-Google-Smtp-Source: AGHT+IFw8NQUhXWsNFLNcy9VnhtaeqSccMp4bageDierszWlx1Kxyih6osyfD1+uAcqTN4o2oK4SYQ==
X-Received: by 2002:a17:90b:3ccc:b0:340:9ba6:8af4 with SMTP id 98e67ed59e1d1-34f68c47f0amr18570023a91.35.1768307607428;
        Tue, 13 Jan 2026 04:33:27 -0800 (PST)
Received: from dw-tp ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-350fd6e343bsm1428958a91.1.2026.01.13.04.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 04:33:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	"David S. Miller" <davem@davemloft.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet <corbet@lwn.net>, 
	Klara Modin <klarasmodin@gmail.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>, 
	Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, 
	Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, 
	Suren Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
	linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH v3 15/29] powerpc: introduce arch_zone_limits_init()
In-Reply-To: <20260111082105.290734-16-rppt@kernel.org>
Date: Tue, 13 Jan 2026 17:59:49 +0530
Message-ID: <87zf6hu24i.ritesh.list@gmail.com>
References: <20260111082105.290734-1-rppt@kernel.org> <20260111082105.290734-16-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_043329_412759_00A6287C 
X-CRM114-Status: GOOD (  10.76  )
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

Mike Rapoport <rppt@kernel.org> writes:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Move calculations of zone limits to a dedicated arch_zone_limits_init()
> function.
>
> Later MM core will use this function as an architecture specific callback
> during nodes and zones initialization and thus there won't be a need to
> call free_area_init() from every architecture.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/powerpc/mm/mem.c | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)

This v2 looks good to me. 
I have also done a basic bootup testing using Linux PPC CI.

Please feel free to add:

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
