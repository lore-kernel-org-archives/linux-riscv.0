Return-Path: <SRS0=snBs=OH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED7BC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 18:34:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2733611C4
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Sep 2021 18:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2733611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jinaP+rYQ/LOv1ahBCDW6z61YVMxU3jwtbWoZtrPjL0=; b=rUu7Ky05R8V7GU/wmr3QZoNJiA
	ijbQMZwHWyw5RHkDylanfpukENs3hCERM1crIMB502uY6FJ6j52/AY7Eekg6HihOR4E+joc8LgzeA
	VltzNW54iqoO5q28kqcQgTT1+R8JD0nPWQt5zjcRqCd2CFDY07iGokEjxlOBiQClUHYU/wjcOr5SL
	WLScc7TDNCBEhukykAOijhfRps7JEcvrkXOT6JuPrZC3+94NXqz4ySsF3Xe71xpq6ICg2z2Jcs1TY
	hd6KBlJvuEoqUWZKzVEFvSP5+4fFDcNADeTSDkSCe1u88VdpAPCixqiupsSlowVcdANeY71K0y5Wv
	HG3vvfqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRIgC-00Eq17-87; Fri, 17 Sep 2021 18:33:44 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRIg9-00Eq0Q-Cr
 for linux-riscv@lists.infradead.org; Fri, 17 Sep 2021 18:33:42 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D0FC51FF75;
 Fri, 17 Sep 2021 18:33:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D11EE13A96;
 Fri, 17 Sep 2021 18:33:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dMMdKH3fRGGZBAAAMHmgww
 (envelope-from <dave@stgolabs.net>); Fri, 17 Sep 2021 18:33:33 +0000
Date: Fri, 17 Sep 2021 11:33:28 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
 linux-kernel@vger.kernel.org, alistair23@gmail.com,
 namhyung@kernel.org, jolsa@redhat.com,
 alexander.shishkin@linux.intel.com, mark.rutland@arm.com,
 acme@kernel.org, dvhart@infradead.org, peterz@infradead.org,
 mingo@redhat.com, tglx@linutronix.de, atish.patra@wdc.com,
 arnd@arndb.de, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH v3 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
Message-ID: <20210917183328.fpybzahm5flcxexm@offworld>
References: <20210917061040.2270822-1-alistair.francis@opensource.wdc.com>
 <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210917061040.2270822-2-alistair.francis@opensource.wdc.com>
User-Agent: NeoMutt/20201120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_113341_612185_0FFC8788 
X-CRM114-Status: UNSURE (   6.81  )
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
>Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
>time_t and as such don't have the SYS_futex syscall. This patch will
>allow us to use the SYS_futex_time64 syscall on those platforms.

Not objecting, but this ifdefiry will hurt my eyes every time I have
to look at this file :)

Acked-by: Davidlohr Bueso <dbueso@suse.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
