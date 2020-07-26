Return-Path: <SRS0=UGSk=BF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB49C433EC
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 17:45:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E593A206D8
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jul 2020 17:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rfdIGZEb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="QWRKokJ1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E593A206D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=KCzoPfZkL2JsIgmADIXVPi3RFoBe5HW6suovc+/Kau0=; b=rfdIGZEbR4YRxSn3wAJ5y6Yu/
	eEavbfQGdqT/aiwlCF1TkfWCpcoHe7E5V2MV6kiSHL1yVKbGQYL2zZG4dTC9nsuAwUvZWlkLtIOcM
	2rDzLuzgj8JQ2t0cU635Vao8+6s1sOZVs9SHGpIO4f7tcT/9JABowl96rzeAZISK9H2ZSp19ieNPl
	8WnjIasZqoEUqiLlZ/OPnbAatkRXsyqp/SIwPXceQYI+03Rf13g6F5YN8Ja5pIsCCS7Y6o76j/GYp
	w7j957odYrFnqTorvUQLf22wQvXxr3DRBgo9da7vA1y0CXxuL2Y3fCbh5+vUtrWkw/zhM9QIHbfK3
	OIxsK1USw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jzkhl-0004Zi-Ut; Sun, 26 Jul 2020 17:44:57 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzkhh-0004XB-NH
 for linux-riscv@lists.infradead.org; Sun, 26 Jul 2020 17:44:55 +0000
Received: by mail-pf1-x441.google.com with SMTP id z188so4283pfc.6
 for <linux-riscv@lists.infradead.org>; Sun, 26 Jul 2020 10:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rz8PmAevX+AVytGTYCByWyvIy1/4eNHrEUMkdI13ieQ=;
 b=QWRKokJ1jbQuW0PkRJtwvVGJquSmHlRYaYTPngCykthHbtqC79WUZMe9dn94R+JHQ3
 MD6r4dbJ5S5EaTgzrs+PGRazPszQO6zgfKXIJWnhSpchzyta3doIZ1/mZ5P+pYMOJDQz
 H3b5dNV2gTNEO8N8SPevaOxawfoYNgAXdLyr0+yPXY3YUsKjNCb7/MEFYzngumWotZa2
 SRpKioyQgEhCAChtQDAJaDviE+f1X6taWqAtuQ0sMa5r2GQyorbXhCUrIaxkZai+xhQ/
 gE9k0/WeZ7f9KgmR16E5JMvK0QwTmEkUJjdbe7w5yBQg5IhZ/XLHXP1aTWzYshwZtbN7
 T23w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rz8PmAevX+AVytGTYCByWyvIy1/4eNHrEUMkdI13ieQ=;
 b=ELfw1f7t4cpwmgK+v4c+sZ4kdUay+zQnfM7srH6Idatnh6zDCH8zfiWk/15HAkg6c9
 sHoO7Uyz2TK951AdI6mKMhcv4+IxSITGAkzbfihv7/kRdXhegRtYeN2VS2AN5AMkD1//
 +85Y27zLJ3+hs4mufWatkTDb4njqBD4rqivpHw1qtHbp3yyRDVMzqtLmqaHiGnj6aU93
 mVXeIQgQXTHgSFa/inczbf+CA6iW0BpVIRiAPhzhOWuEkUWkdvFhTgpBvstyDJ7U9DSv
 0bZmXvnCBQkz0/21TiQfvl3uBl0UACbFSFhAPT5uKLEcbluic4DTyjNroaLTlueOGoWS
 LPqQ==
X-Gm-Message-State: AOAM530ARbTFVTE8PePAMkliKJ4gGco7HJy09vs+DxmCivGot3p3dEHo
 CTRbjCLtz8fouNc5HW6VSsraNQ==
X-Google-Smtp-Source: ABdhPJwMFBKRD5d4MvMpsgEw1KumsNACvODlt+6//ct5AFSF4islz3zAwhx/bKFoMeysRB9OE9FIlA==
X-Received: by 2002:a62:8081:: with SMTP id j123mr30331pfd.80.1595785489483;
 Sun, 26 Jul 2020 10:44:49 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u2sm12465061pfl.21.2020.07.26.10.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 10:44:48 -0700 (PDT)
Date: Sun, 26 Jul 2020 10:44:48 -0700 (PDT)
X-Google-Original-Date: Sun, 26 Jul 2020 10:44:45 PDT (-0700)
Subject: Re: [PATCH 4/6] arch,
 mm: wire up secretmemfd system call were relevant
In-Reply-To: <20200720092435.17469-5-rppt@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rppt@kernel.org
Message-ID: <mhng-ffb01b1d-16c2-4998-8434-99f1cae575bd@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200726_134453_793581_C5FD7353 
X-CRM114-Status: GOOD (  15.13  )
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
Cc: peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com,
 linux-mm@kvack.org, hpa@zytor.com, cl@linux.com, idan.yaniv@ibm.com,
 dan.j.williams@intel.com, elena.reshetova@intel.com,
 linux-arch@vger.kernel.org, tycho@tycho.ws, linux-nvdimm@lists.01.org,
 will@kernel.org, x86@kernel.org, willy@infradead.org, rppt@linux.ibm.com,
 mingo@redhat.com, Arnd Bergmann <arnd@arndb.de>, jejb@linux.ibm.com,
 bp@alien8.de, viro@zeniv.linux.org.uk, luto@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, kirill@shutemov.name,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 akpm@linux-foundation.org, rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 20 Jul 2020 02:24:33 PDT (-0700), rppt@kernel.org wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> Wire up secretmemfd system call on architectures that define
> ARCH_HAS_SET_DIRECT_MAP, namely arm64, risc-v and x86.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>  arch/arm64/include/asm/unistd32.h      | 2 ++
>  arch/arm64/include/uapi/asm/unistd.h   | 1 +
>  arch/riscv/include/asm/unistd.h        | 1 +
>  arch/x86/entry/syscalls/syscall_32.tbl | 1 +
>  arch/x86/entry/syscalls/syscall_64.tbl | 1 +
>  include/linux/syscalls.h               | 1 +
>  include/uapi/asm-generic/unistd.h      | 7 ++++++-
>  7 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
> index 977ee6181dab..9e47d9aed5eb 100644
> --- a/arch/riscv/include/asm/unistd.h
> +++ b/arch/riscv/include/asm/unistd.h
> @@ -9,6 +9,7 @@
>   */
>
>  #define __ARCH_WANT_SYS_CLONE
> +#define __ARCH_WANT_SECRETMEMFD
>
>  #include <uapi/asm/unistd.h>

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
