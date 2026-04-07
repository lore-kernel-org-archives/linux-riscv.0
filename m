Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A8CFF5104
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 16:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVMtybf0ngjbIhQ11itBDpiXkHwOujM3bzzhdQ24JtA=; b=KA/cNi4Zz3l7sY
	o1i7koUORyxEo8Vj1R++eso3yQLiQm42oMgZ9MIGNT+wEQJgDa9erCOniPWD/urIA+7eyOzxvhjCg
	vqZOXPseKHuYW/czd8Jt+8HOdIE7MJ3gB4qcDV5JVo9/qdPj2/3sZS3IQfQGYb+0gKuYmgpCssDER
	9i91IS5GlZotuMlzB74kQCxd5/cSl7ZcmynGpI66eLQBDwcbpF0BSLGsXB7qL7i0yUlFsamR26kNb
	fY7PmAIzWaVcEovHllZL6GOyPDnV6mmOsIb0ksGAIJ5IbOk/U3256SdVlg5coKYoi1OXUBA5oVPWo
	gQ7UXNvMlZPKIOfdIDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA92x-00000006mBm-3Uj3;
	Tue, 07 Apr 2026 16:12:59 +0000
Received: from mgamail.intel.com ([192.198.163.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA92u-00000006mBQ-3pIq
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 16:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775578376; x=1807114376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rTs1/SiJnrenGDXSIYod+BZ5l+IJh78lne3Rpz5LUAw=;
  b=cw33mafx5tm5WUw7Hzdi+naGbzz4STn2r5PsfC1v8k9+M+9h2KcZiYps
   YxoKCZmaeoADyZSRl8rKJTe94DaiMW8KogrH5g+D3+qK1O3z4G2dQt/BD
   KQEdZwTBCLbK0wdPtuliP7zcsMb1cfHsoEPDf5fgq33ZXLHa056w8f++t
   gUQET37Z/sicnRUZCacrxCoxPtlvd5s+cvKbzDvqOOIjuiEjJxl6SRdoK
   moiUS9O8ZVNw9dt0OI/7qdP/cSv/bFyje5qcDzE5SlqNoTW2IjjBPXLr/
   zED10IyUPv23dSwAcsiha4t9wWfWnYeRNo5NGBtAlp1q/thQgsdOkc+PC
   w==;
X-CSE-ConnectionGUID: eIx8JzegRlSKEBxsHa+ZYg==
X-CSE-MsgGUID: DJcGH1jYQ3SZu3zphg9QPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="76667612"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="76667612"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 09:12:55 -0700
X-CSE-ConnectionGUID: 3ocMGBx1RG6ksyaAZSLvEA==
X-CSE-MsgGUID: fqq6ULw6QVWh048BQjDb+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228477703"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 09:12:53 -0700
Date: Tue, 7 Apr 2026 19:12:50 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Kees Cook <kees@kernel.org>, "Darrick J . Wong" <djwong@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 0/6] lib and lib/cmdline enhancements
Message-ID: <adUtAonhCqk_bOpl@ashevche-desk.local>
References: <20260403103338.1122415-1-dmantipov@yandex.ru>
 <20260403122549.f05ed0edb667899d25de1e31@linux-foundation.org>
 <8d04423ede3a284fb3122812810f2775345b9b38.camel@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d04423ede3a284fb3122812810f2775345b9b38.camel@yandex.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_091256_993130_136D9F64 
X-CRM114-Status: GOOD (  13.23  )
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

On Sun, Apr 05, 2026 at 12:13:04PM +0300, Dmitry Antipov wrote:
> On Fri, 2026-04-03 at 12:25 -0700, Andrew Morton wrote:
> 
> > AI review asked a few questions:
> > https://sashiko.dev/#/patchset/20260403103338.1122415-1-dmantipov@yandex.ru
> 
> Hmm....is AI the only "person" interesting in what's going on here?
> 
> Is https://lists.infradead.org/pipermail/linux-riscv/2021-June/007376.html still true?

Not sure, we probably need to Cc more Risc-V people. But don't ask me who they
should be, perhaps MAINTAINERS can give a good guess(es).

> Are there any chances to see how it works under QEMU? AFAICS riscv64
> defconfig boots just out-of-the-box with qemu-system-riscv64 -M virt,
> but riscv32 shows nothing beyond SBI messages.

Reading all this I think we may leave proposed solution (by Ard) and
if one wants to fix it in the future, it would be still doable.

Another option is to postpone memparse() patch and submit it after
v7.1-rc1 is out.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
