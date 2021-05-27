Return-Path: <SRS0=ju53=KW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5ECC4707F
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:33:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5C0261059
	for <linux-riscv@archiver.kernel.org>; Thu, 27 May 2021 13:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5C0261059
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEFfgrCCIduTloWyfDDSP3+JtmmCoh8YnSgEQcN60/k=; b=YEYAi3gvpYCkLg
	l0u4XWop5qJUckpmHP3y5Ck9lO3tLiWW9ihriiv0tJan5a0wZ275ZGZ/f5fLcUsRKx2LV9S11mKdV
	GkcH55JQPM9jU8qoWcKxkwfhM9CywUhHQRmxoj6lIT2BzFbtA6utf7AzuvT2RHSqJaoXlzu3TYsNq
	lbXL6vlhi0YLEiPHgtM/tobtIaLubnjgb7/ozRtH109wc5LebztiEyIXuplEkLsJXSVYGYMWjz6Ni
	vgqmM0DF+u0meWj22Z/nY6T1sNssdEJvUp2XmsA4dFaI+MxlMU05q/TZXiIVYDZbD6P0wOG9w8TU4
	k+3C06Lij1WmyhvKJjzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmG8S-006J1X-NW; Thu, 27 May 2021 13:33:16 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmFxR-006DH5-EF
 for linux-riscv@lists.infradead.org; Thu, 27 May 2021 13:21:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id p7so4719229wru.10
 for <linux-riscv@lists.infradead.org>; Thu, 27 May 2021 06:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BxggruTfUWdNHl3y3TRgpRCywY/hoUEuMrfBZToBGqI=;
 b=UgTCvWg1W3Qnz8aZRCfNJqrTRar06ScdFDpa0ElZ7/EHbPSIV3geI4fue0jlIaX7/3
 FGr5SZRusJIaZJD3wv+VdJfAepb72xcHosUurDI2mwqe2yYJxMi9wEuVXtXw9mdu46Wp
 m/h22r222wTP1M/pPPVmrMqJPMKNhimaexe81bIGHYU91iXvD6AaMw9Mlw1fxkRK0apw
 FWfFCe177OuJA7oDy9TbH5c9WWKdKYRxiEhUW282ApdUu7zrjsM1bx9L0xdJrulMgH6z
 O+e1nH35coRn1n3a9lvuqEPgkLwlR4MQwQ63oVvTv8yHoD71vK+LiwKQSvRbBycMt78x
 FfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BxggruTfUWdNHl3y3TRgpRCywY/hoUEuMrfBZToBGqI=;
 b=Qbk2VlhbVC3Szc8zycyYQVgzjHxw9OtU7PbctwbMYX6z3wxsYtjMqyEFGbTAfpRNvo
 92moYo8w9/Jte31RD0rmvohCaSaeuRCQTpfQJJiGLmbkF0Y+5recU5URZB4JXuHEer6D
 7dxrdNsX+DAWSVBFrQkZIYLz+ykUIXCXbwyzFriIEk9MRQ2AoNPAOKGeigukxxeIh03v
 9jZGOKqYcqYntLxwdY8OKLASenhY3l+MbZgEHfMcS4JlGC53gtqZI9oAJfl6JxDihuZE
 77cS90h73kuoFf8Y3yc8pVsU4G2kZbd+VZfHZBRcafM4RX9OpSp/a/yck1JU+FMn3rnc
 tv1Q==
X-Gm-Message-State: AOAM533zGvWpn9OUFyHRq3vWtfmj9u+/tzNfhCFByhlC0N+8RNBQH1d9
 doFswzYAEMUYzgVuyx+E5+M7vWduByzE5Hg/g95goQ==
X-Google-Smtp-Source: ABdhPJwPwByaEMRwcVFuIKZwUor6cS36FxtrR3kOwnjpxuKTGZmqAmBt/J3Gh3/xk6D7oWP0tgrpAHmYrgio0IHJ+50=
X-Received: by 2002:a5d:40cd:: with SMTP id b13mr3407323wrq.356.1622121711481; 
 Thu, 27 May 2021 06:21:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210527072047.2572741-1-hch@lst.de>
 <CAAhSdy0GQNmXeOwhhaxPAPNgK+zP=EGzNc3LUPg_BhEaqv6yBg@mail.gmail.com>
 <1b8c5e1b-8997-74f1-b18c-feba8bb1711d@redhat.com>
In-Reply-To: <1b8c5e1b-8997-74f1-b18c-feba8bb1711d@redhat.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 27 May 2021 18:51:39 +0530
Message-ID: <CAAhSdy112oVRQor+HuSPL=YhTPtFdE_Qw_AVtjuvgaF02KDBLw@mail.gmail.com>
Subject: Re: [PATCH] riscv: remove unused SBI helpers and exports
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_062153_523514_DE35B9BE 
X-CRM114-Status: GOOD (  13.00  )
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

On Thu, May 27, 2021 at 6:45 PM Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 27/05/21 15:10, Anup Patel wrote:
> >> -
> >> -/**
> >> - * sbi_remote_hfence_vvma_asid() - Execute HFENCE.VVMA instructions on given
> >> - * remote harts for current guest virtual address range belonging to a specific
> >> - * ASID.
> >> - *
> >> - * @hart_mask: A cpu mask containing all the target harts.
> >> - * @start: Start of the current guest virtual address
> >> - * @size: Total size of the current guest virtual address range.
> >> - * @asid: The value of address space identifier (ASID).
> >> - *
> >> - * Return: None
> >> - */
> >> -int sbi_remote_hfence_vvma_asid(const unsigned long *hart_mask,
> >> -                               unsigned long start,
> >> -                               unsigned long size,
> >> -                               unsigned long asid)
> >> -{
> >> -       return __sbi_rfence(SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
> >> -                           hart_mask, start, size, asid, 0);
> >> -}
> >> -EXPORT_SYMBOL(sbi_remote_hfence_vvma_asid);
> > All sbi_remote_hfence_xyz() calls are used by KVM RISC-V module.
> >
>
> Why aren't all these added by the series that add the module (not
> talking about KVM only)?

These calls are part of SBI v0.2 spec hence were added as part of
SBI v0.2 support patches.

Regards,
Anup

>
> Paolo
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
