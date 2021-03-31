Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A27C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 21:53:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8757461002
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 21:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8757461002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xXMs3bK+QjRRirEibajrvjvZyC8MENM3Gjltees5Id4=; b=aSuKxqRZ14OXOV9zCRcdCFgcV
	yGg3bhXTMuYpgGznaijJiiKWiKWQ6xDIdJTCdwalMSYm6q9IRWGmmJtpDYhu9skSxGRUQ6QDCBeSW
	R7BNifWouGtzgKPzSmAADRvvwdOoNhRMU/GD+JEQnLW2dzg3diSYY+uT2gSgxHi5ECmgxQGy7U1lO
	/dnGrKQQjRUODHsdfmoRaJIbo5M8tyBrpGP7bIklXJ8BLhMgj6PYuO+Zsuc11u1pY98NWpb3Uy8IC
	F6PgkbLCU8KeqOLuyCYs3RwEZF6LDOsujBMvhTarKmPmM4NFtOXr2fbS6T6hj2LqueeKT6cJc6Dkz
	cxDEWcsYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRilN-007lfk-B7; Wed, 31 Mar 2021 21:52:33 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRilB-007ldq-Bi; Wed, 31 Mar 2021 21:52:23 +0000
Received: by mail-qk1-x734.google.com with SMTP id q26so312198qkm.6;
 Wed, 31 Mar 2021 14:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iVgFfy9Gk4TopgDWAZb3OEMFsekIXo3QttoRKgThI1I=;
 b=LlC/3vOcZu0Rh5837wBCMc/jMQBLoS5tu19QTNj1eof7IhHTCSrowwreYpcEeTbT5X
 NlWLfUqhbD9HhkHO9DsT4Tyx2dRlg91X71xYeCMm7fKtrUmafIBq7/LrPrNoupfhFp3m
 GewFfvppFWbs9VRkNf6T/omLtxmxV/Um2gbRVOo+AHZwOoh9mGFiVd9+oTJRsbPr+urV
 9+SzjFJBATN+dQCPHnqvB4BC59ngCo/QcWw7P40soldfgVxjJkBfgZEWDD018mop0vXZ
 RHFwc/5vTY5r72yfm8jOOOnGx6oz9cJw+eVDnJnP827bZO8OihlinIME1rTQWHzKsxKK
 ckUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iVgFfy9Gk4TopgDWAZb3OEMFsekIXo3QttoRKgThI1I=;
 b=YpTEIPUp+qrgq7mq+Q8m3ODWK3ThxlO73K9/VPBvFH0IcL1XN25tO90XQjfvWCQpPV
 qGTSFVg+52FXHBq8Xg1KzSq2ghAYAYK5R7mltGGRLrYHnZfeF5BUMIR0nzpfviSH4aIb
 M0u7AnCu6yEZK/af6cXllxdnU10J+kuE0hWW2L3rtyCII9IvxerMiLUp4VWnaymG7hSs
 qctx/L4xrUU8s8KRMzH/UZuGuMXOEBY9zGoOqhmLbG146d+hNVQOcHqBM85KZ0yerV3e
 sm5MzZ/XtLWPtytEht84vElmVSlH2THu489yZvdJ7C56Fww5WjGHsreaFFOJqX9RTWX1
 ImEQ==
X-Gm-Message-State: AOAM532hmoSHLXJGVERi93UzA2wBspzt5FZC1BXyhGKDFtSvoqt4Gdnl
 BvCMvkyjmjLK5PsOwY5X6WA=
X-Google-Smtp-Source: ABdhPJwK1AgyeLn7/B6+lfbSP03Q/ohuFDGUVnzdZCNHOlmGfkjpcbj+5GbXHWQQi4iDLVthXpiBHg==
X-Received: by 2002:a37:78b:: with SMTP id 133mr5361746qkh.109.1617227539232; 
 Wed, 31 Mar 2021 14:52:19 -0700 (PDT)
Received: from localhost ([207.98.216.60])
 by smtp.gmail.com with ESMTPSA id d84sm2453310qke.53.2021.03.31.14.52.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 14:52:18 -0700 (PDT)
Date: Wed, 31 Mar 2021 14:52:18 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>,
 Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH] memfd_secret: use unsigned int rather than long as
 syscall flags type
Message-ID: <20210331215218.GA3437@yury-ThinkPad>
References: <20210331142345.27532-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210331142345.27532-1-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_225221_602611_B6731319 
X-CRM114-Status: GOOD (  14.22  )
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

On Wed, Mar 31, 2021 at 05:23:45PM +0300, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Yuri Norov says:
> 
>   If parameter size is the same for native and compat ABIs, we may
>   wire a syscall made by compat client to native handler. This is
>   true for unsigned int, but not true for unsigned long or pointer.
> 
>   That's why I suggest using unsigned int and so avoid creating compat
>   entry point.
> 
> Use unsigned int as the type of the flags parameter in memfd_secret()
> system call.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Acked-by: Yury Norov <yury.norov@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
