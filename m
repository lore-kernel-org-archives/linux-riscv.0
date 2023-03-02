Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BB6C7EE30
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 09:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/fn+3/aABT/sek7u4rQJxZheS2PvK3ffkdeY/aOw+t0=; b=30ZCWq+tkVftgD
	3igK0K64fNDqy0w0Zk+zdQjk/wWr4AilKjKBatnJqO4brm284+2zttJEfYF/M8jzvdZtPPm2xmIkc
	Q9oHY3cFhD1493xqAQ+sbHz8nlAmBRAIob3QPiIhK3WebZ/gBBYv2LVSvV7fnv5092i/yiK1v+Owg
	KMKVYhYwcgLmvaBqqDokxshQpcC42mSGmFDQ0G8cuATCmGp50N5RWlYumV0igEnggdoJGOgAEPo9e
	KDyob9RbgTsnKpDk9cQLtT4DbgX0Vii0lviWbGMRdYYPkg3/+YNVT4bTdwinwm+jxZOASl0mnLZrC
	f8yZmxJeuJfpvuF2EkjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfPW-001SlT-IR; Thu, 02 Mar 2023 09:39:38 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfPT-001SiM-EU
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 09:39:37 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 9DA1421BEC;
	Thu,  2 Mar 2023 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1677749968; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+5Eko+WcrMxC5t7d8GKXpWvxo3Yahw7e+tVwSxLpopQ=;
	b=IN/qE7OkrB4Hmr8cwo+9t0IR5oew+qfmK06LOC8isvgwUMnIFPAI+LplWKu1EQcJBcWPCb
	C1eLv6nbu8MzUPSk6pk5ztBFrQT1PpYIsyv4aCEOA8pa2QE1ITGi/NkOC0RMqf2v3glEjy
	jvEb5v2anS/2abEt7Sf/6QS8FljzW9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1677749968;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+5Eko+WcrMxC5t7d8GKXpWvxo3Yahw7e+tVwSxLpopQ=;
	b=0U1AVYw6al6TQ3XTjxUcsakH4+Fls+/amTeX3okzsVywWAVOxcVqUuos3knvjCP2/mfnEQ
	6EEpRV3W60MYkxCQ==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 071322C141;
	Thu,  2 Mar 2023 09:39:28 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id BBB3D442EE6; Thu,  2 Mar 2023 10:39:27 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: <linux-riscv@lists.infradead.org>,  <devicetree@vger.kernel.org>,
  "Daniel Lezcano" <daniel.lezcano@linaro.org>,  Thomas Gleixner
 <tglx@linutronix.de>,  Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Rob Herring <robh+dt@kernel.org>,
  Paul Walmsley <paul.walmsley@sifive.com>,  Palmer Dabbelt
 <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Samin Guo <samin.guo@starfivetech.com>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] clocksource: Add StarFive timer driver
References: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
	<20221223094801.181315-3-xingyu.wu@starfivetech.com>
X-Yow: ..  I think I'd better go back to my DESK and toy with
 a few common MISAPPREHENSIONS...
Date: Thu, 02 Mar 2023 10:39:27 +0100
In-Reply-To: <20221223094801.181315-3-xingyu.wu@starfivetech.com> (Xingyu Wu's
	message of "Fri, 23 Dec 2022 17:48:00 +0800")
Message-ID: <mvmzg8vlcfk.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_013935_727093_CF30D507 
X-CRM114-Status: UNSURE (   6.62  )
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

drivers/clocksource/timer-starfive.c:117:13: error: conflicting types for 'timer_shutdown'; have 'void(struct starfive_clkevt *)'
  117 | static void timer_shutdown(struct starfive_clkevt *clkevt)
      |             ^~~~~~~~~~~~~~
In file included from ./include/linux/workqueue.h:9,
                 from ./include/linux/srcu.h:21,
                 from ./include/linux/notifier.h:16,
                 from ./include/linux/clk.h:14,
                 from drivers/clocksource/timer-starfive.c:12:
./include/linux/timer.h:188:12: note: previous declaration of 'timer_shutdown' with type 'int(struct timer_list *)'
  188 | extern int timer_shutdown(struct timer_list *timer);
      |            ^~~~~~~~~~~~~~

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
