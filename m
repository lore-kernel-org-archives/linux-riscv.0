Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC914C5AC67
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 01:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XUuHDls+ZrIh62oyLR4cHENGhNNVbpln532bsgw29I=; b=gbNdfzgsbYMSvF
	cztJOb6bpYM7Wt1Cf9/FP3Jn3xdYhjFRmL7PN4+k+bFOqc2Sid+XVFCeHZ/C+WQ4OLcS0Bq7AwzWW
	ktfyJg8JWrCoYafQc6afFmZsDCJW3MiCcLNEhtiWQ+g8m5fVfwGBrq67a2TvZIbHDgoDYc8Pzjuw9
	f+1l1Jbu9p7R5wWYplhTILaEdY3SjWaIJvNxx5aLyZN4mJl9OIMgD219DsaJQSa6ZjiVGa/BnbfPv
	Hll0hlmNlvpk49+89JDUEDbkgKqzvoFcCHh6HKY1cnEfLEnwmlSftj/2WG7CMKn6TenJjp6HPc+qK
	sRRWxJFe9h068xosEb9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9To-00000006wIv-2klB;
	Fri, 07 Aug 2026 01:34:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws9Tn-00000006wIn-2Vfz
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 01:34:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 21E316004E;
	Fri,  7 Aug 2026 01:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E24D1F000E9;
	Fri,  7 Aug 2026 01:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786066472;
	bh=L5j21MpRtfO+asmiAQ/sXAOoD2hdFW+jNMt120IpGnI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=d+JcOQbfmjQvbM/HFK5qfNoiRiRsAxoBwZiOrLdTadaTyGZCOYQSx0upID1p0Xj6G
	 4fc+KuHSv0s1Sy/lMtQSLBttBRv3ksS4cT1xpbg9fbsmE5AzeHIDAPnJXNdfGh9B/l
	 p9rkkUhO4m4nRyXMy3UVS1Q34EwU9+FfQ5IKrOeeKQhXo7vP9/13EKoWDqUOKC5B9H
	 CiBu+S60x4rwjL8kltrirjsMY2J1dsoovctei6CuCVQ5LRNn4c/wDyduzNE4C47lus
	 YTYzCjp39sVwvkpSUUxWKU6l/knePbrAfbKeemvIVl/iLIutnfbsE9d/5PbUfmB3Xo
	 mTXCGrrbVJ7ew==
Date: Thu, 6 Aug 2026 19:34:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Jesse Taube <jtaubepe@redhat.com>
cc: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Alexandre Ghiti <alex@ghiti.fr>, Jesse Taube <Mr.Bossman075@gmail.com>, 
    linux-kernel@vger.kernel.org, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
    Nutty Liu <nutty.liu@hotmail.com>, thecharlesjenkins@gmail.com
Subject: Re: [PATCH v4] RISC-V: hwprobe: Use BIT macro to avoid warnings
In-Reply-To: <20260805153346.1036988-1-jtaubepe@redhat.com>
Message-ID: <17aeb983-0f68-6d44-d7c4-a43bed4d525f@kernel.org>
References: <20260805153346.1036988-1-jtaubepe@redhat.com>
MIME-Version: 1.0
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

On Wed, 5 Aug 2026, Jesse Taube wrote:

> In uapi/asm/hwprobe.h file, (1 << N) is used to define the bit field
> which causes checkpatch to warn. Use _BITUL(N) and _BITULL(N) to avoid
> these warnings.
> 
> Signed-off-by: Jesse Taube <jtaubepe@redhat.com>

Thanks, queued for v7.3 (with the new extensions converted as well).


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
