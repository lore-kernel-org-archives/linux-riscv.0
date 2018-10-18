Return-Path: <SRS0=9tbA=M6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D1AC5ACCC
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 10:21:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AB7E20838
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Oct 2018 10:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pw8uxkBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AB7E20838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLA0l4j+I5kFe20ALumq+yB11caE7253wntDDF6CotQ=; b=pw8uxkBsBEGiKn
	htvDXN+jFU2XhNb+st/JECqy+KJIswhTASRhfh4e8hpSEjuZd2phy+KarWVg8dpSEk7ihfjciOAQl
	XrRmrStkqfw2KCl2xWd0hYBzR2izOZOiCVQ6En/7139IenznadAFzXJG7EtsC7G2WfrK7st25bTws
	uIZ/zFDAvhkuCekNTX52vbSbYTfL6T1r4DW+H/M1rl6GkKVgFVzkAZqFpiEMyjGzuemVh5JKuGtOm
	YBBW1i4fm/WzuHWUlRjnZRj/BwwpSUyZjZlGCRixtpuVcIud3kU7+FAohpn/sQAVyIzmXcRKGpiwR
	q9lNInyKOrNIi3nuye9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gD5R7-0007tk-4K; Thu, 18 Oct 2018 10:21:49 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gD5R3-0007s6-4R
 for linux-riscv@lists.infradead.org; Thu, 18 Oct 2018 10:21:46 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59A5FAFB6
 for <linux-riscv@lists.infradead.org>; Thu, 18 Oct 2018 10:21:33 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: Re: Hifive-U vs 1000baseT
References: <mvmftx3twxq.fsf@suse.de>
X-Yow: ..The TENSION mounts as I MASSAGE your RIGHT ANKLE according to
 ancient Tibetan ACCOUNTING PROCEDURES..are you NEUROTIC yet??
Date: Thu, 18 Oct 2018 12:21:33 +0200
In-Reply-To: <mvmftx3twxq.fsf@suse.de> (Andreas Schwab's message of "Thu, 18
 Oct 2018 11:40:17 +0200")
Message-ID: <mvmbm7rtv0y.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181018_032145_341575_744EBE97 
X-CRM114-Status: UNSURE (   6.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181018102133.TPWUjsMgyo5lvyv_sWYkggjze3G200cYQHcPcJZVypk@z>

It turned out that the Gb port is broken, it works fine on a different
Gb port.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
