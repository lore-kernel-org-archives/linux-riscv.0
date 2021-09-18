Return-Path: <SRS0=8Mga=OI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ED9C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 16:18:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7345610A3
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Sep 2021 16:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7345610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9UmdbIYqOo3/96nyvBKYDa9q9IgALDiMDww9EzbrkA=; b=xcoCnF3s8UVGvQ
	M3R/KHBYSCUaJoa6UybAHiyXgSmDjDgr/ElZXh1ZlNBejIv8/f3x+umwA8q3GFFlIXUEWPnnR6ocW
	sfw/dGAsHC9rmFr7ZBTV54mPyHf2eus8jovOT117xYAtkEr7akSrGwRdVLqKsEFa5Qbzf/OstSN4j
	vfa5vXhTRDYAgev+iPCmKLK8GVlFjcNYOgURn4XjYi7Id+LLbkXYR3CVwHeGPWNxMVtc7TrUNjZmf
	CRX3QnG9n24nq9bGz8h6UujZXcNhuYTraP0VqEGQlY/4+HqC44NsedP1RP8AnxlKjOhllrBHdKzXz
	+FVCIPH2gYySA/rNDwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRd2M-00G5JQ-VJ; Sat, 18 Sep 2021 16:17:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRd2J-00G5J5-Lx
 for linux-riscv@lists.infradead.org; Sat, 18 Sep 2021 16:17:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 731E761052;
 Sat, 18 Sep 2021 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631981875;
 bh=4MmZgnlBDHssMDEomRSED6gu2ktiZoxIz5uMUNmuMdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ix6Zsmct2JyKHOU30dEUG9KELrLWpEzTbY3eoiujk03VIjA0uZJQqf5RNLKEYf/qL
 yjGRGFI8VKhsytIfiQVimh6hsWPga1Zf+sGi6XRBtEG7KBujjDGxPbmStICX4O6VHh
 f+1CBxVmoo8GwY439R6D/qxVt0xS3UgqR6uwi6JY=
Date: Sat, 18 Sep 2021 18:17:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] riscv: Flush current cpu icache before other cpus
Message-ID: <YUYRMAAQ/G27vofr@kroah.com>
References: <20210918160221.111902-1-alex@ghiti.fr>
 <66013f6b-e3d0-2fbf-c02b-93899c2b4696@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <66013f6b-e3d0-2fbf-c02b-93899c2b4696@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210918_091755_778476_02AA3F2F 
X-CRM114-Status: UNSURE (   6.56  )
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

On Sat, Sep 18, 2021 at 06:05:09PM +0200, Alex Ghiti wrote:
> (+cc stable)
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
