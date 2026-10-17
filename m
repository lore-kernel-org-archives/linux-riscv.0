Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67A9CCA463
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 06:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNewsZj+n+RzWZj617jhqd6YIl9MVGC85LgqeCfx65I=; b=AcCyTMMX0lvG8N
	tYGIWlBz4L1776lq3Bn9doHTcRMUjqvMDRLP7HZZh3max24sEWvOp1RO0QiDr79ppuSg4T3CRpvem
	t0g0srRHuaakQQwpA01Pa9E7gsGi7uX7HrVLcaoyMz9M6O3ngcmNj/EebDTeuXFyB2Ggl9Qoloppq
	u//uPpqXY+cMadbCnZ2wM2ZwHhOgMJ3japk3AIf6VKEGl5Znt5vUHfjty2Ymbp2TLyjpXsEHLPvbl
	KoLLK9cQQF6DfTkwn2DplfMIk4WqNbXcSskfoyjpguiQroHOx1u2tDQeZmCcBrmXRwXqDETjsKHVl
	jRi/q0bKT+trgvvLS/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxuu-00000004TzW-3yae;
	Sat, 17 Oct 2026 06:29:19 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHxum-00000004Tz0-3otF
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 06:29:14 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66c9995ca60so1611010d50.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2026 23:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1792218547; x=1792823347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAXxfHVNqjjg/hDaqmfmaVEvPRdegvgVTMA3anU5ytA=;
        b=CdKRE+A3kFPHbUksBRZCi4aY1cPvTgw1GCRkqYavFAfMXOi8xYt7WypjOA2lCboM9z
         7JtIITIFp4GjfTPhDcxzDBDt/aKI16l25wBCvMAk5E5TYZAJDNYy26SujjXHdTn/onNu
         Wnzi3ZwvYnbfoR4gIszDrimHOqFOq4P2AOAj92V4/4T6QvJuMGmGo8V/cy7J+Uj0QHGo
         BgX8h4Hd50M6qIm4pTEdthNrVXFBnvSjeNmIe3bkcDSlJhd5qB+e3gJy56nt9OE0ZSqq
         j9UhH7Nlxsx0JhKofn7ornjEECL0vxWgpBClhq0zryNHy4bJA/2WVCHsHE5HrDXSz1mq
         uH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792218547; x=1792823347;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAXxfHVNqjjg/hDaqmfmaVEvPRdegvgVTMA3anU5ytA=;
        b=Z+NKM61gjACMT9i16A8qjYM9B/3TV5SQMf9O1/Ully62TEfsl2xpnTzVINCRQNTXe3
         N/Mt5Pwbzk/x42aEf+yGFqYblnaMjFJPTQ4QbxsyNFaZyiRiygMZBXvh2w2gVpogkXrO
         9WjD9IFWJYHBoB5WVsMTIuCdh1mJrXeWlL7aaoHPUcjyiFnBAqMD4j38zwrSWXQ2mTjp
         DnCngfGZ6iJ3BLEx+QKpwy+em4kHkX10p09Ws9qMojh8x6IYQnPyEpiF7JhavnNbWycm
         ERj8LavX1iEVDC1mheu1hQB+Ao625Cy6GpSM81Kj1HRmLvXjnI8MzoJXtcJQIGfe0iwp
         Svcg==
X-Forwarded-Encrypted: i=1; AKwUvBx3wB0jCCZLeOlBCU+PYmhLkvvY0E1sD3jheK288i3n7n5hA00yc8pamyu9VG9LUJgMNKzlkCkka+12OQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYL19zvKwgUDqBhGEud1gXZc0kNNifPFxBJX8KY+Xj/njPc6qT90
	72hSYemz56ONK2O/26rZT5dda/ImAJ7nbhH2z7U8W9pigM2o7AgQHh4aXXRr8nCDasSlo3fKaMC
	QzvnPIoQ=
X-Gm-Gg: AYBFou24s++VdN3oh6bR8r+2iSJH6GJ0mHXj2Xo0mfUqCDSN5a6jxC5MVzV8iZY/xXj
	Yqf9/q6559YgF3AbDxR8FrfEWAkWjgVLIJ6Umdl2/UYiFolkeMAS5tY0Bou8JAzo9RZ0nslnKl4
	UuQiSmlBJFGa+xRzLGPut+7hDtwF+GkVmjbcECkYxqgwcGlfzPbTVjz92FYKtshCyJwukmseGmA
	D8o9NWkag2JGXi/c51MxWHoto3p8sKxT7uUOPNmG+GWwgXdV+qIYV73MD1cLkbtGPC+o0HEFWtF
	WThdQsRnaD00L60u6Gu4xV/65bJhM1YZDbCtDkg0n6gTyEjDdJAyb4lY3VIiUFmTqxlAolbew43
	x/KNpu9OMTLxBzAMf2jKMd5JNrrYezr9+EwobINC78bJzdYbMohpglNkI0GXusiBLOLkmpFiYSL
	u2J2d+Vf95/Ai5RqkIex42JiPB3aZjMaE6ecdrXzL6RKMD8eP41dunXqF0vkcooCkmtmvnekZFB
	UIjDD336cG0RaMtMLlV
X-Received: by 2002:a05:690c:a74c:b0:8b0:cf3d:7b10 with SMTP id 00721157ae682-8b0f217d5fcmr5126757b3.28.1792218547682;
        Fri, 16 Oct 2026 23:29:07 -0700 (PDT)
Received: from localhost ([2600:1700:220:5c80:6dfb:85d9:d6b:fdcb])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e591c848sm17573967b3.35.2026.10.16.23.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 23:29:07 -0700 (PDT)
Date: Sat, 17 Oct 2026 01:29:06 -0500
From: Andy Chiu <tchiu@tenstorrent.com>
To: Paul Walmsley <pjw@kernel.org>
Cc: patchwork-bot+linux-riscv@kernel.org, linux-riscv@lists.infradead.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	andybnac@gmail.com, dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com, linux-kernel@vger.kernel.org,
	olof@lixom.net
Subject: Re:  riscv: optimize mode switch latency for Vector
Message-ID: <atMVshcr7cp5wx6-@Tao-Chiu's-Mac>
References: <20260918215154.2481482-1-tchiu@tenstorrent.com>
 <179127960878.2107992.9155163918962890142.git-patchwork-notify@kernel.org>
 <cce463c9-3a77-d21c-56e7-5eaa0a290f14@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cce463c9-3a77-d21c-56e7-5eaa0a290f14@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_232909_420722_37833E65 
X-CRM114-Status: GOOD (  14.70  )
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

On Wed, Oct 07, 2026 at 08:20:18AM -0600, Paul Walmsley wrote:
> On Tue, 6 Oct 2026, patchwork-bot+linux-riscv@kernel.org wrote:
> 
> > Hello:
> > 
> > This series was applied to riscv/linux.git (for-next)
> > by Paul Walmsley <pjw@kernel.org>:
> > 
> 
> [ ... ]
> 
> > Here is the summary with links:
> >   - [v6,1/8] riscv: do not read csr in vector context switch
> >     https://git.kernel.org/riscv/c/5fd018c630e2
> >   - [v6,2/8] riscv: vector: refactor context switch for kernel-mode vector
> >     https://git.kernel.org/riscv/c/4740b934ebe7
> >   - [v6,3/8] selftest: riscv: test vectorized user copy
> >     https://git.kernel.org/riscv/c/52318cf0fa6e
> >   - [v6,4/8] riscv: vector: refactor vector context operations
> >     https://git.kernel.org/riscv/c/1a5c75ee3d09
> >   - [v6,5/8] riscv: clarify vector state semantics on syscall and context switch
> >     https://git.kernel.org/riscv/c/cc12e55016ba
> >   - [v6,6/8] riscv: vector: adjust ptrace and signal behavior for INITIAL state
> >     https://git.kernel.org/riscv/c/0d4b43a7734d
> >   - [v6,7/8] selftests: riscv: Extend vector tests for sigreturn and ptrace
> >     https://git.kernel.org/riscv/c/6740ec489dd7
> >   - [v6,8/8] riscv: vector: optimize vstate operations
> >     (no matching commit)
> 
> Just to clarify, I only applied the first three patches, for the reason
> mentioned earlier.
> 

Hi Paul, sorry for catching up this late. The whole series should be able
to apply, as the kvm fix is already in the tree. See commit b5060a4aa33d
("RISC-V: KVM: fix vcpu vector context handling for kernel-mode
vector"). Please let me know if you had encountered any issue when
applying my series, I am also happy to respin the rest of the series for
the next release if that works better for you!

Thanks,
Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
