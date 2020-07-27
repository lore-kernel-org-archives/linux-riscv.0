Return-Path: <SRS0=GA+h=BG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F797C433DF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 17:26:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B5D20714
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2020 17:26:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u5Ku9m9O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B5D20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s7rQIay74fVEwWnueUHX5waUjMCvK6WEPZPeirSjkKg=; b=u5Ku9m9OZOz2fssLkQiRFI9gc
	T2NQnLycLSbinXV53O50ohKgh9f2uj8K5zu50rXnQ0jXDNSuOOAub7mGOQBAGX08v5Gc+6l20JU8I
	Nk/hgmIB7CdRx7zOqNNQHhGHpUDW5ZXvAlDuJredKn4Sv/Io/WmocTMYkj/76k7U1zYHE1VslLFMR
	PVzUEwbkmGthpoeS0NBL0g5lktFuOVZm+JU1+V+/DdlOa9YYZPUgfFjOGI6CHMb2TS6bIq33wVhNv
	t0P1kj/C+Ou555FMckrPZ8yRuuizViHcICfs1qenuT2F+ecQb2M4Pw0p/bUIvJCJpxaa1KAXIMdNL
	USuEDTwvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k06sx-0007HZ-Cl; Mon, 27 Jul 2020 17:25:59 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k06st-0007Fh-Fh
 for linux-riscv@lists.infradead.org; Mon, 27 Jul 2020 17:25:57 +0000
Received: from mail-qk1-f181.google.com ([209.85.222.181]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MFKCV-1k24xY2POL-00Fjvv; Mon, 27 Jul 2020 19:25:41 +0200
Received: by mail-qk1-f181.google.com with SMTP id g26so16016226qka.3;
 Mon, 27 Jul 2020 10:25:39 -0700 (PDT)
X-Gm-Message-State: AOAM531tgrk+gOoOhcW+GwyNpAfc2KjPAHfT1eIqxwuSdR+1/gQWB61F
 GW2qHaDm/O8w8usjeUagnNCB5PFZX/NnalQycW0=
X-Google-Smtp-Source: ABdhPJyHnciMJIel1lwAD5bow/zb/QGlp3YciXK2/NVdtnimMUPJo7yU6pZ4mJlHkwU8BKDS8Pa279r2z6tHPp7qb+M=
X-Received: by 2002:a37:b484:: with SMTP id
 d126mr23840011qkf.394.1595870737385; 
 Mon, 27 Jul 2020 10:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200727162935.31714-1-rppt@kernel.org>
 <20200727162935.31714-5-rppt@kernel.org>
In-Reply-To: <20200727162935.31714-5-rppt@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 27 Jul 2020 19:25:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3Lbjdx_43-b0i1FXEfqaNPbaoXLraa2WikfPHrOZ6Kog@mail.gmail.com>
Message-ID: <CAK8P3a3Lbjdx_43-b0i1FXEfqaNPbaoXLraa2WikfPHrOZ6Kog@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] arch,
 mm: wire up memfd_secret system call were relevant
To: Mike Rapoport <rppt@kernel.org>
X-Provags-ID: V03:K1:gC5TboN2RTUm02mdA4eg61TKA6DOOqe0mSK15tMUCiT4MIuymrw
 G+krbp4/Vbd2qe98/oPeWbMMOzzc1tXLYpm1qUjsIxb2pA4bBBVrFC2mHtxjnp0ogyDaM40
 wQWKd8Ni2OAYtUXW9XghQM6xrLmKSlk8jGWomg4f0um24cVzH3oLHJErKX6FQStHjhwD6ok
 3HFad0qj6zDJmkeQkejgA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:msZnwNLfPXM=:u1hP8fYgBc+XiS5hab9RnC
 LujROZ2gWID+x/xq4KEQg+S5zMNv10wxWETln0cFlMnYeYSGX/szi+FruRQhtnzygmTwwVNJ5
 5UOMO00fBQ7nJ/eEqXpCpRMfeiPYYJNwYMDc7OqwQi4l7oqbjeW/hazJ8HYOKnpXcbPDxAbJr
 MlFHPh2Hjg35qMZUPaeycZSyRrHzM6PsKesztG52JJPZqSBhUPKwb8prk4Pd8so749oruRQxu
 0nHR3NtG/n40+o9Ev42Iad3HErS34NsbfDx3fKRuGNrjN9jck2F2/IEZk4P4aW+L71kttgBLy
 JuYG7XlUUUoq+7zzH+qUTEI3AqOARkgRDDGmJFqZhMvFGxA6GI0VNlW6ou7SkZId3FL6SEx+j
 a2qkYDNB1y/ftN/K6u5BVxW1GMLQ+U45kVTO3Cdb/gOtmq/3SFnwMZupOhwCyGeRXFvldnMry
 30LVwpMmePS3zoAdBPLFIMm5OAcMXepVx9Hu++oTta9P/P5yIuFSZ1vQascFE6hoh5OELL3TE
 UE9Kb034O4xwf4EmtE861AKOxyDzJlo4fRfDh5adcSGFcotGzVnsHVsFY07BAakJrepCKkUFZ
 EMg/qlosy64e90LDaItTxskkU4GWPlEbweiKfojSS9MFBd9uZ4knBLIYjIeiQyJ/EInmZo3P/
 6FVe71bLwhyrFWr1+f1Zinf0KGvpBGHxvJqQynxfpowY+qHwh9i6wO8bHXAuKlJkUsPW5lS13
 OjjrX4MphKBVB3B6l/xD4xFN5/pvvrxTlXdLkC94/xi0sEM8cot89RFXJSEK40nRZh39FI7wm
 1MGqSB/qxIKPbOpMkrjp2t4dYA8AqAzHQCjGqPlbxppsQoi0D6c8y9/oQ/A0h0scO67ZGelmY
 vrLvCT0tQAO63tSi+tNv185PjUOXdULA7b7KhYTfwkZPfNlu6dHExXAM9k8jhhyj2FHyhrJw4
 jC+kVukYtxJAdUGKfcCjbkN4EYKRrLz3avJO8AJFKgJVw7fP5VR2f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200727_132556_730851_2A6D125E 
X-CRM114-Status: GOOD (  13.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Linux-MM <linux-mm@kvack.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Christopher Lameter <cl@linux.com>,
 Idan Yaniv <idan.yaniv@ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 linux-arch <linux-arch@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 linux-nvdimm@lists.01.org, Will Deacon <will@kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 James Bottomley <jejb@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jul 27, 2020 at 6:30 PM Mike Rapoport <rppt@kernel.org> wrote:
>
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Wire up memfd_secret system call on architectures that define
> ARCH_HAS_SET_DIRECT_MAP, namely arm64, risc-v and x86.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
