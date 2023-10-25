Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A07C07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YGBCkz5t4h82/uaBAm6KZyJXkkb9KPIm3PPAVFoGPhQ=; b=1Vq8UdTVqQFC0i
	eefnPv1oPabAtfTA5hPip/NYZ+IKaJeqMo8HlI9rXIiGrVXVDr9aQynHLhQo+ogBwGvCUxYkZ9iuw
	n9G+8G34DHkjpqTLCKVvBTKCJ4gqKs68wDsM2r1WV0FleZ2QxgjfRHXyV151vuCCd4Rwe3yl4+AzG
	l8rlWdY5+st55O/HciOll7bgxEkznmvWoiSfzneXjBmGdd9SKFxHITesS6vPsfel/i6cTfQB8haf5
	srXgDzSdPO8z+NrmCXlkVWG3WwvqJvpT5xS1M51G27Gx8DYvhSQIWFZDqdzk7IAwsRGvlqLcosqQY
	HqZU+7SEq/WM+pw6o9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgyC-00CivJ-0Q;
	Wed, 25 Oct 2023 16:43:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgy9-00Civ1-24
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 16:42:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 758A261E42;
	Wed, 25 Oct 2023 16:42:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9853C433C8;
	Wed, 25 Oct 2023 16:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1698252176;
	bh=gbptUxxKVfRhzYeI7PzVDZPtz+gFftTdcPkf1BwVxuY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d97s+ukdkfd6FUqWLC3HbOSzScnbD/YbVP3Un1gEKucnNuolGIplkoUjua5cJtxp7
	 /EkFjOuFR74iyaYE2jiiqR35jtHmjGNpZ51lDD2hUu2WCCefKkOoMqHPhE4XmuJMiK
	 RK6vANhli8sJyd6ZCe9/2m+OXqjNrwKC2q2x6Ohw=
Date: Wed, 25 Oct 2023 09:42:55 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, linux-mm@kvack.org, Christoph
 Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] mm: cma: report correct node id
Message-Id: <20231025094255.bb55b3ca6bb3171b04222b53@linux-foundation.org>
In-Reply-To: <20231025163703.GA2440148@dev-arch.thelio-3990X>
References: <20231019013253.2792048-1-wangkefeng.wang@huawei.com>
	<20231025163703.GA2440148@dev-arch.thelio-3990X>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_094257_749291_E176B62E 
X-CRM114-Status: UNSURE (   7.65  )
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

On Wed, 25 Oct 2023 09:37:03 -0700 Nathan Chancellor <nathan@kernel.org> wrote:

> I bisected a RISC-V boot failure in QEMU to this change in -next.

Thanks, I dropped the patch from mm.git's mm-unstable branch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
