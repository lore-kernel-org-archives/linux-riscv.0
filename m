Return-Path: <SRS0=UPnX=V4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEAB3C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 07:39:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C1720693
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2019 07:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cGT3Zf54"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C1720693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rrL962TbuLXth86l/YbGujspdMJ9H1FBzYXxEGUQF4=; b=cGT3Zf54fr5JGx
	PONaapbsgkF8NwchGPEgAgH5dqEFEDaBSfWuN/e8EwPPMLLzSO/Gqm3UvJvBf/i0FFxIpogNSwpDO
	P1Vv49wjuGnr7XgldN55LRWXxBJH8Zj2FJ0Fft2VJClaYjb7PRHIXBHPadfQHpwXt8u5+OTyXCMpG
	cvnHJSNpWnFf/Z+aqtg5FFzSD1o6ztF+rGLkRJN5CUQvKEH9/t4TQq8mbh1w5cCz/lLmdhUtpHH7W
	tx2FoeEizAyP7pYdTPsJcuXV3Db/Xfz1N4V7Zp+8uwZgx/fwmh4/BGZU8J43v7hz8Qrl8yza4mCqn
	w2EQvme93olkDO78DS1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsjCh-0005sA-4F; Wed, 31 Jul 2019 07:39:19 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsjCZ-0005rF-KC
 for linux-riscv@lists.infradead.org; Wed, 31 Jul 2019 07:39:17 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5EDE0AD35;
 Wed, 31 Jul 2019 07:39:10 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: Random memory corruption with v5.2
References: <mvm8sshcdwc.fsf@suse.de>
 <CAEn-LTpM-0TMxkNNh6nnLH9Bnr9Zm+VFLf=z1y9sER6RXrQooQ@mail.gmail.com>
 <mvm1ry8au3f.fsf@suse.de>
 <alpine.DEB.2.21.9999.1907301709510.4874@viisi.sifive.com>
X-Yow: I am having a CONCEPTION--
Date: Wed, 31 Jul 2019 09:39:10 +0200
In-Reply-To: <alpine.DEB.2.21.9999.1907301709510.4874@viisi.sifive.com> (Paul
 Walmsley's message of "Tue, 30 Jul 2019 17:22:01 -0700 (PDT)")
Message-ID: <mvmo91a8xgh.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2.90 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_003911_810261_6AE213C9 
X-CRM114-Status: UNSURE (   6.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Jul 30 2019, Paul Walmsley <paul.walmsley@sifive.com> wrote:

> - Commit bf587caae305ae3b4393077fb22c98478ee55755 ("riscv: mm: synchronize 
> MMU after pte change") 

That would be my favorite.

> - Commit 6dd91e0eacff0a5c822ca37565d6b5740c4d2a80 ("RISC-V: defconfig: 
> Enable NO_HZ_IDLE and HIGH_RES_TIMERS")

I had these enabled forever already.

> - Commit 671f9a3e2e24cdeb2d2856abee7422f093e23e29 ("RISC-V: Setup initial 
> page tables in two stages")

I don't think a one-time initial setup can have such a subtle effect.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
