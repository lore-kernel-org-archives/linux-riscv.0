Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E60AC433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 00:45:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA2016135B
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 00:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA2016135B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Message-Id:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DCCOlQLcUgZmsl/Hl1kDks5F1gjKvQOHQXAGQX3ZXLU=; b=pweqHMb9HBZeKgUyrgG7+qdNh
	opSIOKejMESzMhA9dmtdtAndgxsE8xNU7jLXUfQgJxBlg8u4ErRPxYvb7s4Bd8Kjh+a5lHKcfPtzz
	PgcJqfVzY8DVa3orVdcOj0/WelPuGrmfCzWu29b+HGasKils7EDZkK2FvPvqdBExcsM90OF872uzY
	3UPSuXYpznWQGbXEKQoPt47UB3VogydW88WV0it2jvXK77duEXVh9uUk39Op8PmCwiN3Qm5zHyg4i
	tLI14dpLDxx6fRSdttsRbnOH/rolRfq326jFVKhTHZt5xbr07Ev0b32ehNYdVMZAOxFZ1GvTuHC2K
	8GFD4C1tA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljAKK-002I1U-0y; Wed, 19 May 2021 00:44:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljAK5-002Hzs-8W; Wed, 19 May 2021 00:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=CnLcMZgbcF5LBCEwpqjAmpGMq03y8rO+4/G+4msbyYQ=; b=0smD7IW6g6YH5ElvFys2P/EN/o
 73C+r9erq1oespVf2CT4sTco6WEfZsiM9IQE6vmfrNvfUqeW49JOcZOsPQ+uEeyjKOrbpwD+JQmd7
 diBoCyShJv9EcjziAQNvEAnRVfOpDu8tlng8zZE/AYYuii6xaQ1lIH1sSbKqkmF5P0Oh8xnAJ4yK0
 9weOUAYwdf4qNrVpSBd4XgP1R3TqnWSqEl0frxAJ+KNpFxVmet90TaFUrV0naYGKBmTNz4BR/oRjE
 re7HqrGfA7pJfahnThA37xuBFig3m5F+Aa0q05G2T0dpFQySzRPvswnRAD4Qnxrzehn70Ut7gE/YV
 9Ouj4mZw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljAK1-00F3Fk-8B; Wed, 19 May 2021 00:44:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D59F6135B;
 Wed, 19 May 2021 00:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1621385064;
 bh=TaIIw0YYtenqp7/hfp+Brr2pi7x+J7tKiTwiGcf4BXo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OWqlmtzTKs7bvcu6OsrPtdFoycSizT0julGnQ1nL89UDOP47oOx68Qc7/VuYXRLHl
 PNVwvj+VZTjuZY29zaA8iT4YqSTgqnpaEgh3VOC71g9NKcI8TaUUyHgG2IXdNHcZ/n
 vJFCM+BcjPVeDtUlkhRioxH5rtQ7jgaUQXdaR9z4=
Date: Tue, 18 May 2021 17:44:22 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski
 <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, Christopher
 Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Hagen Paul Pfeifer <hagen@jauu.net>, Ingo Molnar
 <mingo@redhat.com>, James Bottomley
 <James.Bottomley@HansenPartnership.com>, James Bottomley
 <jejb@linux.ibm.com>, Kees Cook <keescook@chromium.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Matthew Wilcox
 <willy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland
 <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>, Mike Rapoport
 <rppt@linux.ibm.com>, Michael Kerrisk <mtk.manpages@gmail.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Peter Zijlstra
 <peterz@infradead.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Rick
 Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>, Will Deacon
 <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH v20 4/7] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-Id: <20210518174422.399ad118a051fe4c5b11d7ba@linux-foundation.org>
In-Reply-To: <20210518072034.31572-5-rppt@kernel.org>
References: <20210518072034.31572-1-rppt@kernel.org>
 <20210518072034.31572-5-rppt@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_174425_351169_0D6A7B5A 
X-CRM114-Status: GOOD (  14.79  )
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

On Tue, 18 May 2021 10:20:31 +0300 Mike Rapoport <rppt@kernel.org> wrote:

> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Introduce "memfd_secret" system call with the ability to create memory
> areas visible only in the context of the owning process and not mapped not
> only to other processes but in the kernel page tables as well.
> 
> ...
>
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -901,4 +901,9 @@ config KMAP_LOCAL
>  # struct io_mapping based helper.  Selected by drivers that need them
>  config IO_MAPPING
>  	bool
> +
> +config SECRETMEM
> +	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
> +	select STRICT_DEVMEM
> +
>  endmenu

WARNING: unmet direct dependencies detected for STRICT_DEVMEM
  Depends on [n]: MMU [=y] && DEVMEM [=n] && (ARCH_HAS_DEVMEM_IS_ALLOWED [=y] || GENERIC_LIB_DEVMEM_IS_ALLOWED [=n])
  Selected by [y]:
  - SECRETMEM [=y]

so I went back to the v19 version, with

--- a/mm/Kconfig~mm-introduce-memfd_secret-system-call-to-create-secret-memory-areas-fix
+++ a/mm/Kconfig
@@ -907,6 +907,5 @@ config IO_MAPPING
 
 config SECRETMEM
 	def_bool ARCH_HAS_SET_DIRECT_MAP && !EMBEDDED
-	select STRICT_DEVMEM
 
 endmenu
_


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
