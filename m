Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB360C4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Mar 2022 07:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=XNjzKPn+JmkUbtRuVnkOwQgeCH92fXjc18BV0cGGF4U=; b=OYVuQWezBd+csB59FLFgu0Y/vo
	fRKOPArCSf1L4Gr6R5CB0flTTC2ZD14vKitW7tNU/rygHwFFxwe0HEHeZaSDyleRaKeERM54ZFHaE
	V2tuM9HDloSswHGUsfpgreQ96ekC0wg9ub6Us/rnuZWZK2XhYNOMObdb6vMlLoMJI8nG/J9t6St8i
	0DbuY82Sl8a0l3GtIsm49ynD0+pNRPhM69GZ0z/5sF2EjE8GyLwaEvGU+pmIC1NO7OoCyoGtOx/Et
	2ZMKqdxyDOMBE1CfeZtze4zszTey3cupw70m+EB8NBTchUZ7B1bAUrnitTGxAJjtygt0LHVBFAip4
	ScdqZ9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSDJh-00Blbx-3u; Thu, 10 Mar 2022 07:34:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSDJc-00BlaF-TR
 for linux-riscv@lists.infradead.org; Thu, 10 Mar 2022 07:34:30 +0000
Received: by mail-pl1-x635.google.com with SMTP id n15so4143720plh.2
 for <linux-riscv@lists.infradead.org>; Wed, 09 Mar 2022 23:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pB6gK1JUXPe0uL+qrSzcwuxnE8NCS9QIX0sZYbeurTo=;
 b=lAb20Kihrehyn5GddRYNlLZde6SVbtLD6FzerIMv7eZvtL3sbdj+73S+tLhpNmw5UJ
 tshNHs/Mi7cANEP1Zj80aQ/N5B0sz2O5kjImG8/+T3cwq+8FG2XPkFmaHqa6/9chZ7g8
 /nOihdYxiR7PaKacSgWlLKnP207Jz1eV2gEFGOiGLn/I6vzc+PrfyUx+6/GNK9XFM73f
 r97IA57ckoafcvjVae9/dGfBjF2FeWg5v/Io4Cgwhgsompar72JizyqqaqRszXs+wYz/
 Hp9Cb3jtY2nMfID2JLvQRcs/WJdmvo2czFLzJQXcB1SgseLV+79NKd+T/7EjuUJzpXRp
 fgZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pB6gK1JUXPe0uL+qrSzcwuxnE8NCS9QIX0sZYbeurTo=;
 b=7uI1HQiLgLia4SsAmIrOLYLd454eKWTj50Vl5pTCi/5m2Y7SXw1DCCa6B8nFXqSFo4
 kQpAa9JA16iwEJFgefgkWDb1lGpdayZrPXbgSU3/sbfplVQzJGwuaaSYgdh6qEsJVAs+
 hiaPrlaRy1Q6PNL9p/ve4OHupgyBG0lfJ3NORnNGO+w1hU1o+8s17YJzGqfSr5orcCrB
 eILVFiNc/YjXm2jQCELcEXAyU/oTKpO32HlYzUJrO4IxdMyVyyFZDBLSRvFUH/TX3hom
 G+PeCF5YkyV/OMaSvdCZtyP1adUTJmK+F9NbA35akokiOb08SX9QF6UCWPOU4uflFHSP
 5UCA==
X-Gm-Message-State: AOAM5322GRZnvY1/5MORnIJjekLHwof2xgGnAy+eplXsl8uxExzOq4Oc
 tZkB1KkOYxhYaFb9ShJl7OUSZA==
X-Google-Smtp-Source: ABdhPJz3jbz0Ao1c1aN34ZBdfv3vtjWtKrnKEumeNN4OD89F9XtIYbdZBYzODo25zFpeltVWYBT47A==
X-Received: by 2002:a17:902:cf08:b0:151:9d28:f46f with SMTP id
 i8-20020a170902cf0800b001519d28f46fmr3544457plg.53.1646897667710; 
 Wed, 09 Mar 2022 23:34:27 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223]) by smtp.gmail.com with ESMTPSA id
 e4-20020a17090ab38400b001bf9519fe8bsm7946653pjr.38.2022.03.09.23.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 23:34:27 -0800 (PST)
Date: Wed, 09 Mar 2022 23:34:27 -0800 (PST)
X-Google-Original-Date: Wed, 09 Mar 2022 23:33:55 PST (-0800)
Subject: Re: [PATCH] riscv: Work to remove kernel dependence on the M-extension
In-Reply-To: <CAK8P3a2Mr_z6h7eg1O8ZN5_qE-o+8KFFBum3CxyuDYeF50s1dw@mail.gmail.com>
CC: michael@michaelkloos.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <mhng-1ed81282-b17a-43ef-9030-fc538d96892b@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_233428_997258_EE2F5354 
X-CRM114-Status: GOOD (  25.69  )
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

On Wed, 09 Mar 2022 02:02:27 PST (-0800), Arnd Bergmann wrote:
> On Wed, Mar 9, 2022 at 6:28 AM Michael T. Kloos
> <michael@michaelkloos.com> wrote:
>>
>> Added a new config symbol RISCV_ISA_M to enable the usage of the
>> multiplication, division, and remainder (modulus) instructions
>> from the M-extension.  This configures the march build flag to
>> either include or omit it.
>>
>> I didn't find any assembly using any of the instructions from
>> the M-extension.  However, the BPF JIT is a complicating factor.
>> Currently, it emits M-extension instructions to implement various
>> BPF operations.  For now, I have made HAVE_EBPF_JIT depend on
>> CONFIG_RISCV_ISA_M.
>>
>> I have added the supplementary integer arithmetic functions in
>> the file "arch/riscv/lib/ext_m_supplement.c".  All the code
>> contained in this file is wrapped in an ifndef contingent on the
>> presence of CONFIG_RISCV_ISA_M.
>>
>> Signed-off-by: Michael T. Kloos <michael@michaelkloos.com>
>
> The patch looks fine to me, but I increasingly get the feeling that the
> entire platform feature selection in Kconfig should be guarded with
> a global flag that switches between "fully generic" and "fully custom"
> builds, where the generic kernel assumes that all the standard
> features (64-bit, C, M, FPU, MMU, UEFI, ...) are present, the
> incompatible options (XIP, PHYS_RAM_BASE_FIXED,
> CMDLINE_FORCE, BUILTIN_DTB, ...) are force-disabled,
> and all optional features (V/B/P/H extensions, custom instructions,
> platform specific device drivers, ...) are runtime detected.

That'd be wonderful, but unfortunately we're trending the other way -- 
we're at the point where "words in the specification have meaning" is 
controversial, so trying to talk about which flavors of the 
specification are standard is just meaningless.  I obviously hope that 
gets sorted out, as we've clearly been pointed straight off a cliff for 
a while now, but LMKL isn't the place to have that discussion.  We've 
all seen this before, nobody needs to be convinced this leads to a mess.

Until we get to the point where "I wrote 'RISC-V' on that potato I found 
in my couch" can be conclusively determined not compliant with the spec, 
it's just silly to try and talk about what is.

> At the moment, those three types are listed at the same level,
> which gives the impression that they can be freely mixed.
>
>          Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
