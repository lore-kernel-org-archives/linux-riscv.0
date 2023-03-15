Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43203C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 05:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=u5y4bjWzIbFzuvwQWnJ/inN4CSJvCL4om6HGa/CzFCU=; b=CTOZ1OcEZ2jYxcLrOVBZimfiJE
	4/9IT2TdRourmjnJgUs8kJOjzANB73BWlLgO3UJdRZ5Au0VIUwU8Ffin+aQkA9lTxvw4UAwC2LjJ/
	pT7/6LZlyC6Z4ZUGhYSCh6PlnZOoX2Dl20fhXQa3tjcOmmkT1COC3q6BI4CagFiQ9lk33DZ0lzRcH
	wsOG5aghznpmSZzmYy+mVCUp/py1YGTWGUqs089k5ULapRreoOdlaRUfbiuqhp0jtmFgWs7DxNLS4
	LPweGfFV36SiSR5CxmURjPpXF444OYG7+uzhCKks7rtMUA5ACLcGh2yUeeIn1VKPWFphaaW2mRjLz
	5hOoY/vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJhu-00CQ9q-0u;
	Wed, 15 Mar 2023 05:29:50 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcJhp-00CQ93-0x
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 05:29:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id ja10so9217242plb.5
        for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 22:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112; t=1678858182;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yO2JdZBhVT6K1R3HgGxTHc/9StnL6HlTJnhtNYvf5b8=;
        b=XuLxPRJerXkMReEgVl/f2mnOOygVmUj/lGES6XEg2QF9HGWYxHEEd7ModPiSeLoQe/
         JJhxbB0dGuJqqdYo1rbDU+5Fg/upImnHV+1uHRE+9IuE1i0NXRDZ8jTayPJXrtp76xPy
         xaWfTIasXplx/YoCYdOz5jvlONSUmo+WUBRF4DlPJqUAyktTzreZPFkPxRGLF1GFBqG4
         FQjzk/acv06/si0z0mVxBOqrN8azDRzRu3MGJqanLEsz8m07ehhutRjcqva2cAewJ2Xc
         TqGhJnfFfaWjkeHsK6u1qA8Eks0m9NItfUpJJUfSlyJnWxnqhhVVsQHb7eqmj6dDgZh+
         HCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678858182;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yO2JdZBhVT6K1R3HgGxTHc/9StnL6HlTJnhtNYvf5b8=;
        b=A721roRWzedW0/wnqXeGozH7VxZh+0Csv0KNpSlhnNNNUk5ni0jBacbzjCkVKAtr6M
         vq8cfsQles6ZN9q2IpFesVqlyrX+svBbDTIsdf8Iskx1tcqQnNuwPaf1HMRdUyKix1u5
         KBZda4Z5idq8WE1k4qUwk6YniSCZHgR0/RLURRmTFlZSMsH+BR/KwJjlK+YEvfsJuYzZ
         2d8KiLD4Q40OqFfy31nN3JuanJ6nJSUAgyLm141ZsaFSt5MDUp/JagGr8BztseZvPHcD
         nHPRVIvrEe+/r114+Qvu+H6ZwDcp5haOcBIsGxGYkOQadrHBHi/JKxBG9StoPMn32dVx
         NpZw==
X-Gm-Message-State: AO0yUKUHsGocGsfJ0aMKuKC0ipd6wM/6xX3GdcUahSgmrXOYedkh1E5S
	FWkCIE4QOdXUH3UweknAcsWsg/VVUTdt/W1L0b4=
X-Google-Smtp-Source: AK7set+xKbFQdz8ev2g2AROltE2M+kKt2ZcWLgaiLiw2loNj9CyiqQ8fdncCa1eye2Iakvln0Vx3xQ==
X-Received: by 2002:a05:6a20:4d8a:b0:c7:13be:fb53 with SMTP id gj10-20020a056a204d8a00b000c713befb53mr32479621pzb.3.1678858182370;
        Tue, 14 Mar 2023 22:29:42 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id p12-20020aa7860c000000b005cd81a74821sm2526622pfn.152.2023.03.14.22.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 22:29:41 -0700 (PDT)
Date: Tue, 14 Mar 2023 22:29:41 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Mar 2023 22:28:31 PDT (-0700)
Subject: Re: [PATCH RFC 0/2] RISC-V: T-Head vector handling
In-Reply-To: <20230228215435.3366914-1-heiko@sntech.de>
CC: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
  christoph.muellner@vrull.eu, heiko@sntech.de, Conor Dooley <conor.dooley@microchip.com>,
  linux-kernel@vger.kernel.org, heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-6d6a325c-4adb-4d9a-98a0-012c75b4562e@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_222945_358609_0AC7F69E 
X-CRM114-Status: GOOD (  22.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 28 Feb 2023 13:54:33 PST (-0800), heiko@sntech.de wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>
> As is widely known the T-Head C9xx cores used for example in the
> Allwinner D1 implement an older non-ratified variant of the vector spec.
>
> While userspace will probably have a lot more problems implementing
> support for both, on the kernel side the needed changes are actually
> somewhat small'ish and can be handled via alternatives somewhat nicely.
>
> With this patchset I could run the same userspace program (picked from
> some riscv-vector-test repository) that does some vector additions on
> both qemu and a d1-nezha board. On both platforms it ran sucessfully and
> even produced the same results.
>
>
> As can be seen in the todo list, there are 2 places where the changed
> SR_VS location still needs to be handled in the next revision
> (assembly + ALTERNATIVES + constants + probably stringify resulted in
>  some grey hair so far already)
>
>
> ToDo:
> - follow along with the base vector patchset
> - handle SR_VS access in _save_context and _secondary_start_sbi
>
>
> Heiko Stuebner (2):
>   RISC-V: define the elements of the VCSR vector CSR
>   RISC-V: add T-Head vector errata handling
>
>  arch/riscv/Kconfig.erratas           |  13 +++
>  arch/riscv/errata/thead/errata.c     |  32 ++++++
>  arch/riscv/include/asm/csr.h         |  31 +++++-
>  arch/riscv/include/asm/errata_list.h |  62 +++++++++++-
>  arch/riscv/include/asm/vector.h      | 139 +++++++++++++++++++++++++--
>  5 files changed, 261 insertions(+), 16 deletions(-)

I have no opposition to calling the T-Head vector stuff an errata 
against V, the RISC-V folks have already made it quite apparent that 
anything goes here.  I would like to get the standard V uABI sorted out 
first, though, as there's still a lot of moving pieces there.  It's kind 
of hard here as T-Head got thrown under the bus, but I'm not sure what 
else to do about it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
