Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EACEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 18:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uEyt7L4G8xDP2lT+z9S0hAcwqavEHPtW5+dOiVnUkcI=; b=C3mqDbxbwnQl26
	QzsenTxyKtViNUhPJX36xsq/SA5IRcfmXUKSmuemHgNOE2mfmbobe7ZameyWaRFIMM1L+qoULayTd
	1VC9tT/0nXXig4qn4q+nZsoa3UmaXuJYklNFHvvwpfK1OtHCipswyGcy2dOerxv7wDq0CSxvxIV8i
	rtE5W7cGdAD//mwvG6S2ePufkzkldzkB2y6dH7DePtXUR6wW+U2hsRv6epQGmeT/VUhVxNijY5FXb
	S6Qc0Ju3RgUUgBSMfG0FMvZe77MD6mG/RTgYxsl8E6zQT0lIdws/wKzq45S22rmnhhC7mZdZ4EJIK
	+6dC/JiRx4bfLxl7YYZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2W7-00FNle-2a;
	Wed, 21 Jun 2023 18:25:19 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qC2W2-00FNl3-2h;
	Wed, 21 Jun 2023 18:25:14 +0000
Message-ID: <14aa23d6-b4c2-190f-0d6c-22a82befa04d@infradead.org>
Date: Wed, 21 Jun 2023 11:25:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: linux-next: Tree for Jun 21 (riscv/errata/thead)
Content-Language: en-US
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Conor Dooley <conor@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, wefu@redhat.com
References: <20230621145917.3635a2f1@canb.auug.org.au>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230621145917.3635a2f1@canb.auug.org.au>
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



On 6/20/23 21:59, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20230620:
> 

on riscv 32-bit:


WARNING: unmet direct dependencies detected for ERRATA_THEAD
  Depends on [n]: RISCV_ALTERNATIVE [=n]
  Selected by [y]:
  - ARCH_THEAD [=y]

WARNING: unmet direct dependencies detected for ERRATA_THEAD
  Depends on [n]: RISCV_ALTERNATIVE [=n]
  Selected by [y]:
  - ARCH_THEAD [=y]

WARNING: unmet direct dependencies detected for ERRATA_THEAD
  Depends on [n]: RISCV_ALTERNATIVE [=n]
  Selected by [y]:
  - ARCH_THEAD [=y]

../arch/riscv/errata/thead/errata.c: In function 'errata_probe_pbmt':
../arch/riscv/errata/thead/errata.c:29:22: error: 'RISCV_ALTERNATIVES_EARLY_BOOT' undeclared (first use in this function)
   29 |         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT ||
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/errata/thead/errata.c:29:22: note: each undeclared identifier is reported only once for each function it appears in
../arch/riscv/errata/thead/errata.c:30:22: error: 'RISCV_ALTERNATIVES_MODULE' undeclared (first use in this function)
   30 |             stage == RISCV_ALTERNATIVES_MODULE)
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/errata/thead/errata.c: In function 'errata_probe_cmo':
../arch/riscv/errata/thead/errata.c:45:22: error: 'RISCV_ALTERNATIVES_EARLY_BOOT' undeclared (first use in this function)
   45 |         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/errata/thead/errata.c: In function 'errata_probe_pmu':
../arch/riscv/errata/thead/errata.c:63:22: error: 'RISCV_ALTERNATIVES_EARLY_BOOT' undeclared (first use in this function)
   63 |         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
      |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/errata/thead/errata.c: At top level:
../arch/riscv/errata/thead/errata.c:86:37: warning: 'struct alt_entry' declared inside parameter list will not be visible outside of this definition or declaration
   86 | void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
      |                                     ^~~~~~~~~
../arch/riscv/errata/thead/errata.c: In function 'thead_errata_patch_func':
../arch/riscv/errata/thead/errata.c:95:41: error: increment of pointer to an incomplete type 'struct alt_entry'
   95 |         for (alt = begin; alt < end; alt++) {
      |                                         ^~
../arch/riscv/errata/thead/errata.c:96:24: error: invalid use of undefined type 'struct alt_entry'
   96 |                 if (alt->vendor_id != THEAD_VENDOR_ID)
      |                        ^~
../arch/riscv/errata/thead/errata.c:98:24: error: invalid use of undefined type 'struct alt_entry'
   98 |                 if (alt->patch_id >= ERRATA_THEAD_NUMBER)
      |                        ^~
../arch/riscv/errata/thead/errata.c:101:33: error: invalid use of undefined type 'struct alt_entry'
  101 |                 tmp = (1U << alt->patch_id);
      |                                 ^~
../arch/riscv/errata/thead/errata.c:103:34: error: implicit declaration of function 'ALT_OLD_PTR' [-Werror=implicit-function-declaration]
  103 |                         oldptr = ALT_OLD_PTR(alt);
      |                                  ^~~~~~~~~~~
../arch/riscv/errata/thead/errata.c:103:32: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  103 |                         oldptr = ALT_OLD_PTR(alt);
      |                                ^
../arch/riscv/errata/thead/errata.c:104:34: error: implicit declaration of function 'ALT_ALT_PTR' [-Werror=implicit-function-declaration]
  104 |                         altptr = ALT_ALT_PTR(alt);
      |                                  ^~~~~~~~~~~
../arch/riscv/errata/thead/errata.c:104:32: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  104 |                         altptr = ALT_ALT_PTR(alt);
      |                                ^
../arch/riscv/errata/thead/errata.c:107:38: error: 'RISCV_ALTERNATIVES_EARLY_BOOT' undeclared (first use in this function)
  107 |                         if (stage == RISCV_ALTERNATIVES_EARLY_BOOT) {
      |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../arch/riscv/errata/thead/errata.c:108:59: error: invalid use of undefined type 'struct alt_entry'
  108 |                                 memcpy(oldptr, altptr, alt->alt_len);
      |                                                           ^~
../arch/riscv/errata/thead/errata.c:111:70: error: invalid use of undefined type 'struct alt_entry'
  111 |                                 patch_text_nosync(oldptr, altptr, alt->alt_len);
      |                                                                      ^~
cc1: some warnings being treated as errors


-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
