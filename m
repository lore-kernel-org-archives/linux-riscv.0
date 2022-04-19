Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6170C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z586/6jsU8CUG5iSm+OTndTCvghttTk2fyLHmwZCB9E=; b=c20jDvBeyMhqq5
	ZrFhLuiesRgV0le719gwc8nG/ePFHihSSp1iOSumKAJLju5ECUrcEySucJLbXwennzMEPVTnw1Yif
	+itrlwEetK2ksS/RLnQNBdl0AlLE+h9l2O7vIRn+G5+xd5F0O9OP4mRgJL5y3h2anAHtI9w/UydYv
	4D1kyOkBdtWZU/9hPZNDH3fniK08fAVNfkNMYvyttJ+GRO4W5ttuD5a/N/UjJ5EVwtSm06lpbjX2m
	p0TmTh8X66NbteqiqcRG4CDMgUfaUjojA/elEp/TEJ3hFO0O5V9ua0ftl+K6lqnZ6wtWh5+EZ6i3L
	5pUnss3kIsTsxJ4bM3AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngoMZ-00444B-R7; Tue, 19 Apr 2022 13:57:51 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngnlu-003n0O-Mq
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 13:20:01 +0000
Received: by mail-ej1-x62e.google.com with SMTP id g18so32843899ejc.10
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 06:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soleen.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cWoWgEcXIMYRuEsZLERLpvc6D4fQ6dZb3dEHGDCcqIs=;
 b=fY6TQpn2KPv+1NlQy1Jow9T1OohAsjrB3oV9ppqNtHvd0r+4OW08v/avNwv1G8Odjm
 D/2GsdfYMSvjtxG1P4B7SzmR2XTR5xS2bZ0XXxMVMHNciSyV6R5MO6AkQwLdeFk1lHfh
 Cgt7v30oEPEsJbmsWTr9+ULhOcR1ribWin+0SWBgoc1mhBYRwOlMDx37E219LP/c8iur
 e8Jl67Cq3yYNgZHQHPlunLvMK0ujRMh0wPaA5jNKhTst45qBNw6ujFZl8BZe81KmcSAw
 S+BsJt8ItH1FzOurK6u7x4BM44CcrZpOkFaSvq0vaqehD0L+SUhwh2c75xAXXhRm0fg5
 rMMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cWoWgEcXIMYRuEsZLERLpvc6D4fQ6dZb3dEHGDCcqIs=;
 b=pBDCEO5ouq6EEpRGU32+NHOfWsxXZbhv9buzYUE7fEYDZ/v/FrF2I1i8WlWUAwt3ch
 HxWB6WpJQNDqqmilZQ48CLpv5B4BXxJOpOxvqcUwPYGTiJnBVYqy2ul7NyMaz8B+YohM
 jAx5pZSqqyAevMWYxssXRSNMxeAegCtCGS6PckLnYfByX3JyXZjvAKbHnTmzR4KzSvr4
 P1yuH3i/EU3efz6leN2I6TXj9oIjgmKisY5m1ZExcvyV+8e4egp+uh5zw50VlOgg8/vs
 +LepT0aGeojop42rF7epBxxMhkcFLW4BTZOjwWH4JjVvLz4rXtJF4kkX6RccZguR4BTc
 Kuug==
X-Gm-Message-State: AOAM533jtcBLMONkZSCMx3M2Y9uencLVgLi7CcEVbtbUwiOAUCr5xm/c
 joI9Vsw4kk+TfpJb4oq30D2tMh2N81WY9YjLIpd+jw==
X-Google-Smtp-Source: ABdhPJwnqnEl1PogZpbrEzxXO0aXN+psYbjJRFm+NSGmxo/x2WJ/ZC6/8hzNHXDDrwtWHaCSyZ4gF5RFiYFl5n9G5cc=
X-Received: by 2002:a17:907:1c8a:b0:6e9:2a0d:d7b7 with SMTP id
 nb10-20020a1709071c8a00b006e92a0dd7b7mr13404246ejc.572.1650374394669; Tue, 19
 Apr 2022 06:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220418034444.520928-1-tongtiangen@huawei.com>
 <20220418034444.520928-4-tongtiangen@huawei.com>
 <073cb6a6-3dbc-75d4-dbfe-a5299a6b0510@arm.com>
In-Reply-To: <073cb6a6-3dbc-75d4-dbfe-a5299a6b0510@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 19 Apr 2022 09:19:16 -0400
Message-ID: <CA+CK2bCPrQ=F0jNRxcVZ9f18Rm-kAATO3xFE79TZDoWQ99GC4Q@mail.gmail.com>
Subject: Re: [PATCH -next v4 3/4] arm64: mm: add support for page table check
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Tong Tiangen <tongtiangen@huawei.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 LKML <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-riscv@lists.infradead.org, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Guohanjun <guohanjun@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_061959_066614_D6CB9CDD 
X-CRM114-Status: GOOD (  12.95  )
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

On Tue, Apr 19, 2022 at 6:22 AM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
>
> On 4/18/22 09:14, Tong Tiangen wrote:
> > +#ifdef CONFIG_PAGE_TABLE_CHECK
> > +static inline bool pte_user_accessible_page(pte_t pte)
> > +{
> > +     return pte_present(pte) && (pte_user(pte) || pte_user_exec(pte));
> > +}
> > +
> > +static inline bool pmd_user_accessible_page(pmd_t pmd)
> > +{
> > +     return pmd_present(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
> > +}
> > +
> > +static inline bool pud_user_accessible_page(pud_t pud)
> > +{
> > +     return pud_present(pud) && pud_user(pud);
> > +}
> > +#endif
> Wondering why check for these page table entry states when init_mm
> has already being excluded ? Should not user page tables be checked
> for in entirety for all updates ? what is the rationale for filtering
> out only pxx_user_access_page entries ?

The point is to prevent false sharing and memory corruption issues.
The idea of PTC to be simple and relatively independent  from the MM
state machine that catches invalid page sharing. I.e. if an R/W anon
page is accessible by user land, that page can never be mapped into
another process (internally shared anons are treated as named
mappings).

Therefore, we try not to rely on MM states, and ensure that when a
page-table entry is accessible by user it meets the required
assumptions: no false sharing, etc.

For example, one bug that was caught with PTC was where a driver on an
unload would put memory on a freelist but memory is still mapped in
user page table.

Pasha

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
