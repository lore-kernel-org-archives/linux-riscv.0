Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A32C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 18:22:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B77760FC2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 18:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B77760FC2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbRWar+M/rUZPO2kiVbuKB7MSE1efUOVbl/4J+BSGQ4=; b=WYQiPxu7oEWXr+9xWYs0Jr8stx
	df+Td4acj2jAk+/vGl0tUs+1KTZWYnCKHT8JA8WqzXt3DrOGQ5umqQqIFfNhPv+O8XwHqD57LfNka
	yCm8nSGCkUqiJJHEC53ms0jDr0PLTvCISnRnb3PZZ4iVU5BoFuwHaG0pjzQskwBeco/UjHz1oCsvq
	NRHKmw2/kUOSal6m8VaPir89JsRy5l9JaneNzT3VPXIqK4Jl3hNc7NaNMQFb5arFsbfqLTkoUgH+s
	KsBtXQ2AruqizUedV6rqDN2C/z2txY7VdeyWG4awNj8EbZtC0yASYm9+FUpzEceIRUKfw2lof2yq2
	Zcj3keyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRIUN-00EoxW-SA; Fri, 17 Sep 2021 18:21:31 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRIUL-00Eowp-5e
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 18:21:30 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60365223FA;
 Fri, 17 Sep 2021 18:21:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6E7B13C4E;
 Fri, 17 Sep 2021 18:21:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SaenGJ/cRGH7fgAAMHmgww
 (envelope-from <dave@stgolabs.net>); Fri, 17 Sep 2021 18:21:19 +0000
Date: Fri, 17 Sep 2021 11:21:13 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, alistair23@gmail.com,
 namhyung@kernel.org, jolsa@redhat.com,
 alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dvhart@infradead.org, peterz@infradead.org,
 mingo@redhat.com, tglx@linutronix.de, atish.patra@wdc.com,
 arnd@arndb.de, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 1/2] perf benchmark: Call the futex syscall from a
 function
Message-ID: <20210917182113.nacg5zbjiexmhhjk@offworld>
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
User-Agent: NeoMutt/20201120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_112129_402445_77C6AE81 
X-CRM114-Status: UNSURE (   6.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 17 Sep 2021, Alistair Francis wrote:

>From: Alistair Francis <alistair.francis@wdc.com>
>
>In preparation for a more complex futex() function let's convert the
>current macro into two functions. We need two functions to avoid
>compiler failures as the macro is overloaded.
>
>This will allow us to include pre-processor conditionals in the futex
>syscall functions.
>
>Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Acked-by: Davidlohr Bueso <dbueso@suse.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
