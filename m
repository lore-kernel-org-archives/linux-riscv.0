Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FEBC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 16:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A4E60184
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 16:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1A4E60184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=muMnMxT+yhlbdbfQzlGRI73oy2mHPOnYVhSgq6o1xFY=; b=WwMSE8mnlZ6iez
	ZbPl4ObuffeDuK/Cei+ncp8QLm/lzHoWaK6Qp7773vhQAgnGZtAmox54VGejlGNHHU0lMDTK8Opv3
	V+1ndQCghDrDyHExO/gBhiGLJHbRGyO2gmRSMOaSGk6JkSAjXcJRdbaS0xWsbYHoPkjjmd3TRb3Fz
	uOXAVkkhjGfaqUx7CKu2KNA5KCFHQOAu75GbPJY0w9woGmOZQmiSkyYMy2sq8OS09laMKPaPDNi7b
	7+R/SMvl18dSR72325JUTqAyfj0XA8480zkL6hIC2P+HzDIFMxs9SvFJ+Hx3rSjKVPW8URVRZVY/p
	oGCbYQgL0npnEaZyn1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPokK-002MlM-6r; Mon, 13 Sep 2021 16:23:52 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPokH-002Mju-5V
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 16:23:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id oc9so6717513pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 13 Sep 2021 09:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=2/RkgLMSeLMdfX+PInPfTpRLPSRgorj3I7Mh0Kf9swA=;
 b=JmPq/ZgLDL/FyAXQlzN3Pxt/6RHQBe1O37S+nQ61rkmBypwaNCBZrelrqFzD38G68y
 ayLL6KmmBeXGuHjWhRWlBTWLjOa1UNjPI0bNb+dmgGb0u2BkXyd5S68cDztZayVOnRQr
 NZSmhj83kn4QL3EQNMIVRoRdS0yiL5duqY1Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2/RkgLMSeLMdfX+PInPfTpRLPSRgorj3I7Mh0Kf9swA=;
 b=nWypg9k7/MVhGcnbncYZgtBpKpbaQ4RQ0bh4MzPjZcNQSZdZws687yjFko07j0NQs2
 ZzeP+s/XPRzhNe6ynvL1H3N1Q+Uim0jwNXHCN3VZRYe5cMkBQozT37Ikznl0xVVM818A
 9x9SI06QMIC3/ip2JTIPgZ53vAkWpRyVF/ovnuT+VeIXpALos0iK0h6DW/6iAvVYzrVw
 U6qgPkf/11vhbLHuwNORAIw6HgAi/DY4YrhfTrxsIyP4MmGv8LwUjDQl6+xOBtePjwiJ
 QSCwoppeffvlIIVxX/SsY902rzMODpvyhkbMkDgly3txVuSRLe5zmcTN4mTTM0Vf5Jol
 S2Rg==
X-Gm-Message-State: AOAM532jWBtG1zZZZdemzVoB1eHCEJvvjoLHo8YcmSEEoZ61o89VnYUd
 yObBR0MpA2fTJUVubCS5QKP8rg==
X-Google-Smtp-Source: ABdhPJw2iVAwBpkklvDVrdBl1O3eT09j5TQwikncidkQDt4RPNA+MefgACjymKzY8c/7zuWh9A9MQA==
X-Received: by 2002:a17:90b:f08:: with SMTP id
 br8mr301973pjb.119.1631550227353; 
 Mon, 13 Sep 2021 09:23:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id d3sm7597340pjc.49.2021.09.13.09.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 09:23:46 -0700 (PDT)
Date: Mon, 13 Sep 2021 09:23:45 -0700
From: Kees Cook <keescook@chromium.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Joe Perches <joe@perches.com>, Arnd Bergmann <arnd@kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/10] riscv: remove Kconfig check for GCC version for
 ARCH_RV64I
Message-ID: <202109130923.E294BFD5C@keescook>
References: <20210910234047.1019925-1-ndesaulniers@google.com>
 <20210910234047.1019925-6-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210910234047.1019925-6-ndesaulniers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_092349_283583_37810787 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

On Fri, Sep 10, 2021 at 04:40:42PM -0700, Nick Desaulniers wrote:
> The minimum supported version of GCC is now 5.1. The check wasn't
> correct as written anyways since GCC_VERSION is 0 when CC=clang.
> 
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Yeah, good catch for Clang too.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
