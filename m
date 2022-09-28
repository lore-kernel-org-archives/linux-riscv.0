Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54530C04A95
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Sep 2022 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YceWQx5Xzo3C0Su7agF+p/beVKWL31jYbUau8ausITs=; b=IW3VR66v2rtRDU
	ZqRDCYKPZpLVMzANGGjr2FN2E/dT1+v/YlBTv5+D7natoroaJDA0yqhSGySP0iR33Dw3pcI/iMYPG
	FBef/uwG1luEyc9/RfCdWW83Oz5ZW7VwLkqq19eagQdIinvvx1RIZcZjJF/aaXMfZlmvMDXVV0YWL
	RtnWbPlAuE24XR2t3NpwL3wVMShu5YfsvlB5WsvV1DNqVmfxyc5BIGvlzNVyNiC6iSYtAJ/jlfTxk
	OZS/RUfScVBUn6sPEq613zmC2jwx0BqhgAd9FJKRH3Ng4AKxdasDliJMGZEav1Kd7p4rvFvcfW4KV
	owwXeltqPZfpSTQthkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odf07-000UZ0-Hp; Wed, 28 Sep 2022 21:53:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odf04-000UXS-7t
	for linux-riscv@lists.infradead.org; Wed, 28 Sep 2022 21:53:53 +0000
Received: by mail-pj1-x1032.google.com with SMTP id r8-20020a17090a560800b00205eaaba073so2793354pjf.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Sep 2022 14:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Ay3drFi6JCOWyd7mwYuzVhdDqZJYtGvjCnOOuic4lIQ=;
        b=d8AWbiSBxXrgrvwAoskxcicNPYKtAtvQ8eTNvx31A5tDj05HG3JYRAX8qf2vlcBFux
         Q1KTlPLAgoTxKVWu/nVzVOf7AiT7GTQhdNsUYqMxZ71hoxMdvb5Q9qsvn3yjzUg5VS4Z
         AeFBZtfNn12MoU7iIzQGkn5wjz+gaTpfVO1hEeE57+wJ12W7ze2a3aRKpnA8Lx9MTtIJ
         grbEUQMs3nxDSYRKy9B5Ov4jaMGgXhqeyepODAApSSchrz1BCHHbq4bwQtIzq5YjUq/5
         KGRlA9uTZis4skTF0coWa95GNfO6iWQbU6avtKMDiR8zb+dfBnXP+edrsxPOv/ezAxb2
         ZDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Ay3drFi6JCOWyd7mwYuzVhdDqZJYtGvjCnOOuic4lIQ=;
        b=rP7SI9yAXd6uKthHHoMXrPl5UrqbB5wS3/7UzTPzVCtwUTpRZUoSXPktSd2s88pV6m
         A7hoShfs+zT5ojEC6z/FeeahzgU9B68xB0H3IrFCfTl0KoS23T47JGnV7nVz2vM+PVeN
         wnSE3+WdFrMoy6dTCCsCvOa1UwgiRuhwHRSnzYUrvMz43QPfWwXNjVUcX3GjR+1RCE3W
         yZMFtCQA1//Oy975EIyghNvsaNyrejZd2sSslbBZ94p+Tdn9D6bDaNaI3WeLu6S5BHOs
         Uo14jyFCelaC2SBJY2Ib2BbflPO0+jh7NXL6r1CaQ0zMKLYhyfVxGYWU+NlARCBy44jd
         je9Q==
X-Gm-Message-State: ACrzQf3rAF+yQgrjc4YEWAYEB356pHRPe4JCJodqS83lLMCyZTXWViCW
	OdS+JnSmn1xxMbigYRuNVNE+uV4d+Opwb6LLOfV+hA==
X-Google-Smtp-Source: AMsMyM6+V0RnFW83E4Yey5hPTG/WNDzcVaQZ9uZmK44iTcOwLQ3OpYQRTfUlegcvBrQLEHiPkA+P6skieEZazNbCnnA=
X-Received: by 2002:a17:90a:74c4:b0:203:336d:dd36 with SMTP id
 p4-20020a17090a74c400b00203336ddd36mr12421313pjl.107.1664402030259; Wed, 28
 Sep 2022 14:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220928182523.3105953-1-nathan@kernel.org> <CAKwvOdmPLqX=oCwg43TYHj=tdoaU5OYc=bO906u=LeqcSrx+Dw@mail.gmail.com>
 <YzS+bQT1zJAUpp/6@dev-arch.thelio-3990X>
In-Reply-To: <YzS+bQT1zJAUpp/6@dev-arch.thelio-3990X>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 28 Sep 2022 14:53:38 -0700
Message-ID: <CAKwvOdk87wRWoiVjswZPwoLbSm+sYsMW6FHZv+r6MHxLHn0Trw@mail.gmail.com>
Subject: Re: [PATCH] lib/Kconfig.debug: Add check for non-constant
 .{s,u}leb128 support to DWARF5
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Tom Rix <trix@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-kbuild@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, llvm@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_145352_336914_265EBB45 
X-CRM114-Status: GOOD (  19.89  )
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

On Wed, Sep 28, 2022 at 2:36 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On Wed, Sep 28, 2022 at 02:13:47PM -0700, Nick Desaulniers wrote:
> > Reraising my concern from
> > https://github.com/ClangBuiltLinux/linux/issues/1719#issuecomment-1258678969
>
> Sorry, I thought I addressed your concern with my comment right below it
> but I probably should have worded it better.

No, I just missed your point about other architectures.

> > We've put a fair amount of work into getting CC=clang LLVM_IAS=0 to
> > work for DWARF v5 (both on the GNU binutils side, and Kbuild), I'd
> > hate to see that effectively knee-capped because of an issue in GNU
> > binutils that is only relevant for one architecture.
>
> Sure, that is a completely reasonable concern. However...
>
> > I'd concede support for ARCH=riscv, but not for all other
> > architectures, which this effectively does.
>
> No, it does not, CONFIG_AS_HAS_NON_CONST_LEB128 can still be enabled
> when GNU as supports this construct for a particular architecture; as
> far as I can tell, RISC-V is the only one that doesn't. See the tests
> with ARCH=arm64 and ARCH=x86_64 compared with ARCH=riscv below.

Ah, sorry for the noise then. Thanks for the patch.
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
