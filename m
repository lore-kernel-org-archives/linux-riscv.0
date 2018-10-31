Return-Path: <SRS0=Wf4V=NL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72367C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 10:51:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C88A205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 31 Oct 2018 10:51:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="je6EnSyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C88A205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2UEmHtrodDPVj/q9ngy4uZ2w1tUUrvUU/98QfVUMrE=; b=je6EnSyK4DN8Uy
	DfvIn1NSzJLqe7ilcNRxkR4ffZKnTSV35nPIZk9s7/NpxHYZS/O2oMPfHST9UistM5iU724kBD8DG
	1kEEmPN89VdApksEKr1wTUyIYuxYQ4jjwJ32puJp3hXTecF+Bff1Zu7rmGaYW7ZkVg4eaCi1TPKoH
	IaL3skG0H1nRgRDgyDDVHtaoYOUp0ZORM/NuJrvMhVshOIHFFAYRqoP1wXZiVK5jxRBQE4Fwsl1sU
	B2vPtE2OeyUKEvvYouX10iseKXYwQ7sbuvrsDEGVc5HnRywnVUEL9k+SFbqXKcsWfmS3e97wGvzQZ
	NNGJX3Z/A/bFppBXkyqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHo5Y-0006Fc-EJ; Wed, 31 Oct 2018 10:51:04 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHo5V-0006Ew-JP
 for linux-riscv@lists.infradead.org; Wed, 31 Oct 2018 10:51:03 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay1.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3669AEDB;
 Wed, 31 Oct 2018 10:50:47 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: riscv-linux-4.19
References: <mhng-25d728a4-465f-4f0d-99ac-8d14d6548621@palmer-si-x1c4>
X-Yow: Four thousand different MAGNATES, MOGULS & NABOBS are romping in my
 gothic solarium!!
Date: Wed, 31 Oct 2018 11:50:40 +0100
In-Reply-To: <mhng-25d728a4-465f-4f0d-99ac-8d14d6548621@palmer-si-x1c4>
 (Palmer Dabbelt's message of "Mon, 29 Oct 2018 16:55:56 -0700 (PDT)")
Message-ID: <mvmwopyl79b.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181031_035101_781246_C6CC69A7 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181031105040.gB4nRCWxbFioNEayK0goZkRthu_iAx0By7hA7WR8_Cs@z>

On Okt 29 2018, Palmer Dabbelt <palmer@sifive.com> wrote:

> I just created riscv-linux-4.19

Did you forget to push it?

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
