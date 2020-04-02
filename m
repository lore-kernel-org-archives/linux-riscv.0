Return-Path: <SRS0=CVuh=5S=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6F0CC43331
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2020 17:54:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8729A2074D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2020 17:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VfLFrBUw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Mor93Vz4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8729A2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5SMpG0rss3w3oQ6D7WN4mOS98FtPFU0Jes6zebrYWHE=; b=VfLFrBUw5HV1lXr3YV3Esi6Rm
	POjkoGwqlwkONenf5gqI7yCiiYg0av0u+qxay0WDbRSqmrUKm7WptSnweCqJC75Hf8o0gjxWYaYXi
	BHlvDn2EMTLmYzMtp3hvcRXrVdxNmSDJPme7lrdM1t2YsLQ6TXj/qTQJY7UN8hekV5mllA/ibCCaE
	cRR4P6iBDmVuedsxjR1PeQzb4Z4FWzIxZMPDJxDHf6Cm1ilnO0rfxswC/9n10DW735eiRjD9Qx5Cn
	rjdMLvqN9B8wWL8qvYyy7D40WrXpaagEarL5F7MiXx3ADlWtCrck9ffQcDr7Co2uzJJYndTU3pDii
	APUumMypg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK42Z-0002qA-7w; Thu, 02 Apr 2020 17:54:07 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK42T-0002p0-Ji
 for linux-riscv@lists.infradead.org; Thu, 02 Apr 2020 17:54:05 +0000
Received: by mail-pg1-x541.google.com with SMTP id c23so2192862pgj.3
 for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2020 10:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=5SMpG0rss3w3oQ6D7WN4mOS98FtPFU0Jes6zebrYWHE=;
 b=Mor93Vz4MFfsNFsxePkYehMjJAMEY3CiU5HupagAWhMCO1/HlrYpcpnegsnNVZTY9o
 QLHQUC1Hkb93D7KekRI/c2HmA9Ba3+GgKJwkqqSulXr7YV5rn3IhEUuTRl+mvH2VKFZh
 hEJbt3yLwhHsaewvbpfqkgBZqYo9FIPhORdQz1y+EnSvTDtI89oP3M0Rdq6fQ0V8Uqy2
 m6EkxLJoWSsgM/3Vc63hkXgYUK/00SPIFluSMcuCQe5+YOEwGIj4NgRGIZudUP3yaPXs
 h3kYFaS56KTjd2XhcYldCdfcNzpydDPWhyQMLqb0EpcMcx0xwKa+F90S/9ldGlJZHUWl
 sL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5SMpG0rss3w3oQ6D7WN4mOS98FtPFU0Jes6zebrYWHE=;
 b=OsouC/8gvJJO6PXEExK170pYnVevO3QV1nbPrb7JPOY9qIB1HGV6vFkdox51uxxFif
 mpV8yUwhw3K7o9Th9zRIOP6XQrUQSZ0wiT9RJk6G+hzRvzg/xtasW4twhJ4u2zXbB/Jd
 duGkDQ+21M8/l3XzQ/j7G5H6PMhsMJgbHAGkHYLvwTUHPMO478ZsSgH6xBH4PAfd+oUa
 cHBzoKJOOyjqHQoSMxK2UK9t5jWaaf1hY2KEfUjUWo186wOUh6UW04UScTgOI/1shOTu
 xWKebA54v4vUFdBY9zCusnk8G+nkbqIe2i5JKa3zbdNncY6TYLyurlrsV1gOlXmnyNJ5
 qn0A==
X-Gm-Message-State: AGi0PuY7N18resdJWDfE53tWzNCO2QA0pTWQXtGYklpFl0IezJVwCiLa
 ciKSXbHATFmLNHwZeBYgI6TjyA==
X-Google-Smtp-Source: APiQypLxalJ5ztobr0Ak5M39+9J7TCvFQHybLTNNuQAj3QTUO7FnBzSX4CVIeiSVpfeP3eovHPCsSA==
X-Received: by 2002:a63:2a97:: with SMTP id q145mr4325152pgq.22.1585850038165; 
 Thu, 02 Apr 2020 10:53:58 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:0:9efe:9f1:9267:2b27])
 by smtp.gmail.com with ESMTPSA id q71sm4246591pfc.92.2020.04.02.10.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 10:53:57 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:53:54 -0700
From: Fangrui Song <maskray@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
 Ilie Halip <ilie.halip@gmail.com>
Subject: Re: [PATCH] riscv: fix vdso build with lld
Message-ID: <20200402175354.pzhzhumlqsjk66nu@google.com>
References: <20200402085559.24865-1-ilie.halip@gmail.com>
 <CAKwvOdnasXV2Uw1r4we_46oGD_0Ybjanm7T_-9J83bdf6jeOAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAKwvOdnasXV2Uw1r4we_46oGD_0Ybjanm7T_-9J83bdf6jeOAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_105401_673468_76CF464E 
X-CRM114-Status: GOOD (  15.82  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jordan Rupprecht <rupprecht@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Mao Han <han_mao@c-sky.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The comment of `With ld -R we can then ...` should be fixed as well.

On 2020-04-02, Nick Desaulniers wrote:
>+ Jordan, Fangrui
>
>On Thu, Apr 2, 2020 at 1:56 AM Ilie Halip <ilie.halip@gmail.com> wrote:
>>
>> When building with the LLVM linker this error occurrs:
>>     LD      arch/riscv/kernel/vdso/vdso-syms.o
>>   ld.lld: error: no input files
>>
>> This happens because the lld treats -R as an alias to -rpath, as opposed
>> to ld where -R means --just-symbols.
>>
>> Use the long option name for compatibility between the two.
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/805
>> Reported-by: Dmitry Golovin <dima@golovin.in>
>> Signed-off-by: Ilie Halip <ilie.halip@gmail.com>
>> ---
>>  arch/riscv/kernel/vdso/Makefile | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
>> index 33b16f4212f7..19f7b9ea10ab 100644
>> --- a/arch/riscv/kernel/vdso/Makefile
>> +++ b/arch/riscv/kernel/vdso/Makefile
>> @@ -41,7 +41,8 @@ SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
>>  $(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/rt_sigreturn.o FORCE
>>         $(call if_changed,vdsold)
>>
>> -LDFLAGS_vdso-syms.o := -r -R
>> +# lld aliases -R to -rpath; use the longer option name
>
>Thanks for the patch.  Maybe the comment can be dropped? It doesn't
>make sense if there's no -R in the source file you're touching.  If
>someone cares about why `--just-symbols` is spelled out, that's what
>`git log` or vim fugitive is for.  Maybe the maintainer would be kind
>enough to just drop that line for you when merging?
>
>Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
>
>Jordan, Fangrui, thoughts on this? Sounds like something other users
>of LLD might run into porting their codebase to LLVM's linker.

Independently, I noticed this ~2 days ago.
https://reviews.llvm.org/D76885#1952860

GNU ld parses options with getopt_long and -j is recognized as
--just-symbols ('R') because there is no other long options prefixed with -j.

Now, the following comment applies. Basically, --just-symbols/-R is an
overloaded option. It can be used as an -rpath if the argument is a directory.
The best practice is to use either -rpath or --just-symbols, never -R.

// binutils-gdb/ld/lexsup.c
	case 'R':
	  /* The GNU linker traditionally uses -R to mean to include
	     only the symbols from a file.  The Solaris linker uses -R
	     to set the path used by the runtime linker to find
	     libraries.  This is the GNU linker -rpath argument.  We
	     try to support both simultaneously by checking the file
	     named.  If it is a directory, rather than a regular file,
	     we assume -rpath was meant.  */
	  {
	    struct stat s;

	    if (stat (optarg, &s) >= 0
		&& ! S_ISDIR (s.st_mode))
	      {
		lang_add_input_file (optarg,
				     lang_input_file_is_symbols_only_enum,
				     NULL);
		break;
	      }
	  }




>$ ld.lld --help | grep \\-R
>  -R <value>              Alias for --rpath
>$ ld.bfd --help | grep \\-R
>  -R FILE, --just-symbols FILE
>
>> +LDFLAGS_vdso-syms.o := -r --just-symbols
>>  $(obj)/vdso-syms.o: $(obj)/vdso-dummy.o FORCE
>>         $(call if_changed,ld)
>>
>> --
>> 2.17.1
>>
>
>
>-- 
>Thanks,
>~Nick Desaulniers

