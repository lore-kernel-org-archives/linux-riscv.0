Return-Path: <SRS0=Rdmy=ZK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71EECC43215
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 10:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 487DE20726
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 10:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jYXEbABI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 487DE20726
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=40cWEjjYPC0eda+LCCAuG4FHfsszj9nZrm/qhfA2NH8=; b=jYXEbABI5CCXX8
	I87XI+uFLBapjC4824bqYDdfC9qLaD2uwlKhhf5XL7Fql1zvTRNUMSXkCLmiig/HXmLV18xj0I8Cz
	Ntd5Uol46qiox1ltqHIFVccGmYXeXnq7PnargyTeNrn2S3bljfyQ7h5F6aKLodsfZkcQbAu3h1/08
	8z9Wa77UaL4SKoHzgbWpxDHC+kGCqPt47wKEhbcANeIFbmxHc7HLN51ydy28/wNX+y3dQD0Ht+MEO
	JW/6fqaWu7mgnxpML62Z4ge/rWRpfIPCSNq7I9OELyYB9SgysTY/U1qFoD9rJSP3tb6FCseGk6CEZ
	jUvlwu83xCajaNfu+pcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWecX-0002A3-R7; Mon, 18 Nov 2019 10:51:01 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWecV-00029V-3Y
 for linux-riscv@lists.infradead.org; Mon, 18 Nov 2019 10:51:00 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 95891AE3F;
 Mon, 18 Nov 2019 10:50:55 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: Experimental branch
References: <alpine.DEB.2.21.9999.1910311101480.23683@viisi.sifive.com>
X-Yow: I LIKE Aisle 7a.
Date: Mon, 18 Nov 2019 11:50:55 +0100
In-Reply-To: <alpine.DEB.2.21.9999.1910311101480.23683@viisi.sifive.com> (Paul
 Walmsley's message of "Thu, 31 Oct 2019 11:11:45 -0700 (PDT)")
Message-ID: <mvmmuctpieo.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_025059_293465_492D40A5 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Okt 31 2019, Paul Walmsley wrote:

> - Anup Patel's KVM patches (waiting for the hypervisor specification to 
>   exit draft status, and for reviews and testing)

Note that the KVM series depens on the SBI v0.2 series, but the latter
is missing from the branch.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
