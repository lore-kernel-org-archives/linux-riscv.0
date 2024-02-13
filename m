Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D32C48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UC9f0rFMXULdRVYT4LDHQyCT+YFFRz43EsBicjInKQ8=; b=RN45MU8/xQz0ua
	SHpaV+G1SPuHb0l85K23lVdt2tEFmfiyGwlFe9p8oqCRKe9/3+gd7g2hzXmPdKUjSqtnh+lHDEI2I
	PcWddD73Pi94wO7cptC/tIockL4HnamESgotA5biLs8FKodB9869M58YNOcHDcxlVMgPvkxoAaUz3
	coccISkdywRr2NuxMrY0riLfMCEhhHem4/xeYM1P2jEnC/KKva85JNpYNksxIkwpy7diAo2C72x5I
	lckt0SzEGIihw87PJbZsnLOq3lmGYVEcRTn/7CmtB11/JF+kjyhDxR0FWjXklE2BVGGrOvOG0HG06
	TXX8n7P7XC5FOQaMKtlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqBv-00000008ri7-3f6Q;
	Tue, 13 Feb 2024 10:39:07 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZqBs-00000008rfC-37WK
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 10:39:06 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-561587ce966so5814349a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 02:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707820742; x=1708425542; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=99+dlQnmmbwfzZHXcOtlcot/gJ/sAgU+2AfoLVc2BmA=;
        b=aeFzvYjYYvKIdojeDQsPJ3wsWav7+Z1mWlgDXHisL/hgmTXmIQ1SUOl6ZxdH8VKEyY
         oOPan0IvjCdcoN5bWJ1ijAcE6TCIQya/Nt+ddoJGouqQbjDZRUDNVxbnEt5sIxsrTCp1
         T98HSoVVMaHRDVV8tJ714dr55Vt8wjI6KXGpgQgCbao4GliIrdKramIuY3QXkSR3/j8V
         qgEUIJ9TkMDDFXM0tl19hqNmUegdsTSVCL7Gr/F5yAf3jKI8jo30woToaJdCfLAxDns9
         lBW8/rc9zW5D/KCuCxgpx/W5+nFAM/DWK1MfcG3c2MCkbngu/M6mbQQ0c4OYq6Xl94t/
         HQGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707820742; x=1708425542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=99+dlQnmmbwfzZHXcOtlcot/gJ/sAgU+2AfoLVc2BmA=;
        b=ksZBCMJ7mm8URmBdy6VZIwqK1H1r+cQPAa7gapJ6zt+UYtsgNX37wTyFEoWsGrWApI
         Uua4SM4lprb2V93m1Td0PaRU6+Cykpm10FsSSKUvqrrbpvD1Q5liJnQ+qWkvC/LZScoq
         Rj/Vem8iI4WxdIFT8gkmgADMo78vccNPD5q8i07i8gSoBH5fZOncx38u1hKc0oov9nhT
         EqRqLtrmg0YnBQQvYVRTBEQIIxM8CO0awOkQGj3l60kN6DdEUZGDEFAiNFaGLCUpLKe4
         m++nWkEO1AzEaUPI7M6kd1FEF7Z67stiWtCGA78Z4U5GjTBeUJAL8YlSp6PmtIiSH/m4
         REaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsoKZIROiQewtz894IwuZ365nZCKtkzofQW+7Bej0pWFhCR4Sd6ikQ649AuBVglgb0GbBc7HFe2vyjbWfWLW/iqVJ9w6ut6+LPdq0XbQmJ
X-Gm-Message-State: AOJu0YwKa4fgNGVmceoRSYgSkRN/ORwlcz9rErjXUltjfzoHiv8VrpUX
	/lhvC/c2pHa+ukfjOHrw77BgAczEQNCNZ5HwwQ0vb2QadzvFCltA
X-Google-Smtp-Source: AGHT+IEwDNgVcPUJWxRahWyBCf8IjXub0vy03iUtob4mGtDxKnzJrX/QbaA4pxRUih2wB3UnEMrt0Q==
X-Received: by 2002:a05:6402:3605:b0:55f:d7f8:1072 with SMTP id el5-20020a056402360500b0055fd7f81072mr1864764edb.3.1707820742256;
        Tue, 13 Feb 2024 02:39:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0v2tlfdoYrSx2OW8B07sma4E5XVwxOFU7X4nbYjErD8VpRK/rL7Ls7WZ/hBHTrpztXy3A8miT+AxqWDKLupkTGYM3nB2MC2Hdho90ar1lupWY9YTHdQIAmYoLb1JWGpiaoMZhH0ubAiL3JraxdUT/G7OaAJxKB+sEVX4Bu0mbO/KjqLTkFUWjJ4sOPF6gL2yFhSNDGbs4oJ0KyCWtIppixKEoris8x2UhvmLHRFXryekQ
Received: from andrea ([31.189.95.98])
        by smtp.gmail.com with ESMTPSA id f17-20020a056402355100b005620a2b5cedsm102875edd.49.2024.02.13.02.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 02:39:01 -0800 (PST)
Date: Tue, 13 Feb 2024 11:38:57 +0100
From: Andrea Parri <parri.andrea@gmail.com>
To: Eric Chan <ericchancf@google.com>
Cc: conor.dooley@microchip.com, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH v2] riscv/fence: Consolidate fence definitions and define
 __{mb,rmb,wmb}
Message-ID: <ZctGwaTnEfkum50a@andrea>
References: <20240212-projector-dangle-7815fa2f7415@wendy>
 <20240212105946.1241100-1-ericchancf@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240212105946.1241100-1-ericchancf@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_023904_829811_1533A03D 
X-CRM114-Status: GOOD (  11.77  )
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

Eric,

On Mon, Feb 12, 2024 at 10:59:46AM +0000, Eric Chan wrote:
> Disparate fence implementations are consolidated into fence.h.
> 
> Introduce __{mb,rmb,wmb}, and rely on the generic definitions
> for {mb,rmb,wmb}. A first consequence is that __{mb,rmb,wmb}
> map to a compiler barrier on !SMP (while their definition remains
> unchanged on SMP).
> 
> Introduce RISCV_FULL_BARRIER and use in arch_atomic* function.
> like RISCV_ACQUIRE_BARRIER and RISCV_RELEASE_BARRIER, The fence
> instruction can be eliminated When SMP is not enabled.
> 
> Also clean up the warning with scripts/checkpatch.pl.
> 
> Signed-off-by: Eric Chan <ericchancf@google.com>

I suggest to split this patch into multiple patches ("one problem per
patch" and all that), say:

  1/3 - riscv/barrier: Define __{mb,rmb,wmb}
  2/3 - riscv/barrier: Define RISCV_FULL_BARRIER
  3/3 - riscv/barrier: Resolve checkpath.pl warnings

Please also review the changelog(s), since the description above (in
particular the information about __{mb,rmb,wmb}) doesn't seem to match
the code changes.

  Andrea

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
