Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1777C43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 09:03:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 937F92083A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 09:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tscbgCzP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CoFkkcZl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 937F92083A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MQUEGmd7vy/5QPDqTMJFFGrZun7AAQYZofh7p1cn0nQ=; b=tscbgCzPWXJILF
	NTVnQ5XlZag4kLyZJLdLie3/hxJ1Gz5NnXpQPt93tFYwIoOqGRyScGcJbOafD4NaZdB0fhp5I0RTu
	dpfmHHw4HK+TuOsUaFQ7AGluajIaFUupV3GitunsyorOTs+OyYJ9jA6KA0JxJ+73T7+6jpxj2gTLE
	PeN1DMH1pzioaCLQwXNaHAxvOmbjV/NMz1l5b/CP7ngSre5RVUaEozPajQ8I5iUajVNBvqYvnmm0e
	zDILXVyhhg5CVC1Z9UBi3O3kfBcJ7pTFPEbQin6lGrGUmPB6vvOrvqN4B38RTFznHaxpN9kkgfS6v
	EY9aB3dM6/6SQS32VGqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g55jL-0000M8-Qf; Wed, 26 Sep 2018 09:03:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55iD-00084V-12
 for linux-riscv@bombadil.infradead.org; Wed, 26 Sep 2018 09:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
 Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NlHsx9b60PezvPV8jqHfwUhT3e7vCgcQ8/jT1fQVtjs=; b=CoFkkcZlMMHI73fr0O110o/b+A
 Xd4TPxNcj2GdjY54qKfbnEjYuwdAQdIfEy0koINaOgwtgta+aARZ0C3pl1yrMJWvqiRA/3aPY7TT8
 0tPwpqSjbROjslVQh2gayCR5skUMsOkaECEQbKwa2yXNqePSn0QXWL8A9S/+OOhkXT/GVWzqmxv0q
 W3qEIBIbO+qUNNUaJdx0w+/hCAcZiHPQFSo9+mJcFaooZYBMEXTEYyv/Uu1RC9C218NCQYhINbeuA
 XDcDWj9bpm9yXxj3SUEsQdglSOuKlom9WggSiSB2AUdZdfV7Rnq2/z0uyYipD2DzFZu6FeyzHzJ7i
 40XNydDw==;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55PD-0002zr-OT
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 08:42:49 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A3D43AE96
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 08:41:18 +0000 (UTC)
From: Andreas Schwab <schwab@suse.de>
To: linux-riscv@lists.infradead.org
Subject: futex_atomic_cmpxchg_inatomic is missing
X-Yow: I FORGOT to do the DISHES!!
Date: Wed, 26 Sep 2018 10:41:18 +0200
Message-ID: <mvmh8icabwx.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_094247_804531_7A300602 
X-CRM114-Status: UNSURE (   3.63  )
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
Message-ID: <20180926084118.4bUJWa6TVwLSls3Npw3BTjDZILSBSj-Hf2G4EYGM9ZA@z>

The riscv port does not define futex_atomic_cmpxchg_inatomic, but glibc
is assuming that set_robust_list always works.

Andreas.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
