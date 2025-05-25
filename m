Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3611DC5AE59
	for <linux-riscv@archiver.kernel.org>; Sun, 25 May 2025 21:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To:Date:From:
	Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erxtk+DkU6LdzlIQa7jkwCEPvHiSvnNSqsYknxT74ss=; b=BQ+VFaDis63OtDZtehR/uw5QdK
	i8/BUapyah+mFlDqdaVHMCAEymC0vMHThhQ0y0QJX7lLvF+qAjgF/LAgxodcni6DEXbhj5KfiYkDo
	Dk+1h6Lz5i1XJ4tZFu65I2Jy+d1ftTOfojmCjwf30aR7WeYZomM/SpjNmwyRdlq2BKT2Sz6mXgBZq
	bkcdQMk2cflFDnkVdeEs/0+t0VSSieCpwxdyRB5T6s+9pcHg/33OI1Hm7NLo98ngwkcFRgVIB7Jq1
	INlNSgxhbi/fi73jFd/9XnYroDMTUjk7XxHF0otKOVjN4nPkBJvB5gXE6OcJx+pWxFiXLBpLbuZaU
	qDn5zhIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJJHl-00000007jyl-3Lg8;
	Sun, 25 May 2025 21:53:37 +0000
Received: from mgamail.intel.com ([198.175.65.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJJHi-00000007jy7-46yG;
	Sun, 25 May 2025 21:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748210015; x=1779746015;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=y5rT2ewj429hL1YZNClBKAuoapp2CjjiHYqsoHYBDa8=;
  b=n1thvU2nsN1FekQdLWKzOwYQeuWZcLH4BM61MM6F/Lveg8ERF3nrMIUP
   mkAREHfVaZCius/8GkG9imgSXPV0oo48VuUmmgI8gU8AztmBoLLdhSPF0
   oCH+3OqERJTs8rxkrfXfPHfsHWnDFGNfwNZz9jClh/Xru/Namb4AqyGuB
   3skJ60V6LGOOQVKijDHWh0saYGFNojrrTPzjeDLjhCIp+AYB84l0YW3Wb
   gJHGm2tG3mv8MHjzAPZTMHJY1Qc29ElxMKf9+HlgZSl6R55lCHBicJLAr
   V17yIdDC9O+67KroxtscWk4nRjAdyWmnOYUUK7pzwebacR81rf+he13h8
   w==;
X-CSE-ConnectionGUID: we3o1whcT5+ZmU/UNIEyeg==
X-CSE-MsgGUID: LN02mRA0RNu8Q8tW98ijhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="60435803"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="60435803"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:53:32 -0700
X-CSE-ConnectionGUID: srkUUk2LSiS9AVRoLfAP+A==
X-CSE-MsgGUID: abYToWTKQVe6L6ZrKUUaNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="141991367"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:53:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 May 2025 00:53:13 +0300 (EEST)
To: Kees Cook <kees@kernel.org>
cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, 
    Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
    Vitaly Kuznetsov <vkuznets@redhat.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hdegoede@redhat.com>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
    Masami Hiramatsu <mhiramat@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
    Mike Rapoport <rppt@kernel.org>, 
    Michal Wilczynski <michal.wilczynski@intel.com>, 
    Juergen Gross <jgross@suse.com>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, 
    David Woodhouse <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>, 
    "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
    Thomas Huth <thuth@redhat.com>, Brian Gerst <brgerst@gmail.com>, 
    kvm@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
    platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
    linux-trace-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
    linux-mm@kvack.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
    Christoph Hellwig <hch@lst.de>, Marco Elver <elver@google.com>, 
    Andrey Konovalov <andreyknvl@gmail.com>, 
    Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
    Masahiro Yamada <masahiroy@kernel.org>, 
    Nathan Chancellor <nathan@kernel.org>, 
    Nicolas Schier <nicolas.schier@linux.dev>, 
    Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
    Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
    LKML <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com, 
    linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org, 
    linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org, 
    linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org, 
    llvm@lists.linux.dev
Subject: Re: [PATCH v2 04/14] x86: Handle KCOV __init vs inline mismatches
In-Reply-To: <20250523043935.2009972-4-kees@kernel.org>
Message-ID: <ba4f4fd0-1bcf-3d84-c08e-ba0dd040af16@linux.intel.com>
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-4-kees@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-965883235-1748206555=:933"
Content-ID: <8656ab6c-8f8d-81d1-5dfa-740e7f21544c@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_145335_056513_153A674B 
X-CRM114-Status: GOOD (  16.22  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-965883235-1748206555=:933
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <fa62886f-fdfb-f2a5-84db-475ce3a46169@linux.intel.com>

On Thu, 22 May 2025, Kees Cook wrote:

> When KCOV is enabled all functions get instrumented, unless the
> __no_sanitize_coverage attribute is used. To prepare for
> __no_sanitize_coverage being applied to __init functions, we have to
> handle differences in how GCC's inline optimizations get resolved. For
> x86 this means forcing several functions to be inline with
> __always_inline.
>=20
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: <x86@kernel.org>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: "Ilpo J=E4rvinen" <ilpo.jarvinen@linux.intel.com>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Michal Wilczynski <michal.wilczynski@intel.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: Usama Arif <usama.arif@bytedance.com>
> Cc: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Brian Gerst <brgerst@gmail.com>
> Cc: <kvm@vger.kernel.org>
> Cc: <ibm-acpi-devel@lists.sourceforge.net>
> Cc: <platform-driver-x86@vger.kernel.org>
> Cc: <linux-acpi@vger.kernel.org>
> Cc: <linux-trace-kernel@vger.kernel.org>
> Cc: <linux-efi@vger.kernel.org>
> Cc: <linux-mm@kvack.org>
> ---

> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index e7350c9fa3aa..0518d5b1f4ec 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -559,12 +559,12 @@ static unsigned long __init tpacpi_check_quirks(
>  =09return 0;
>  }
> =20
> -static inline bool __pure __init tpacpi_is_lenovo(void)
> +static __always_inline bool __pure tpacpi_is_lenovo(void)
>  {
>  =09return thinkpad_id.vendor =3D=3D PCI_VENDOR_ID_LENOVO;
>  }
> =20
> -static inline bool __pure __init tpacpi_is_ibm(void)
> +static __always_inline bool __pure tpacpi_is_ibm(void)
>  {
>  =09return thinkpad_id.vendor =3D=3D PCI_VENDOR_ID_IBM;
>  }

Hi Kees,

What's your plan on upstreaming route/timeline for this? I'd prefer to=20
retain full control over this file as we were planning on some=20
reorganization of files into lenovo/ subdir.


--=20
 i.
--8323328-965883235-1748206555=:933
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323328-965883235-1748206555=:933--

