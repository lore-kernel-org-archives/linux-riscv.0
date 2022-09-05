Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5ECECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 17:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZE1Vh5v/wdAZfjZXOeN/hB3QsZIHXe8BpRbuIJ+r6A=; b=WATh3nIa7EQMlt
	0bvkXDAD9kPlbevxqCuc24YSlks5bA6l59IUQQ3vo7G9mXmkXs0Nkaigbp0mKfVThAfAfkS3jRWir
	SymxkwmvmNUf2ogeztqCqIfHgVqgMDqcEeYFknHS51sBvtKNuPeeNsy2sUBzrqCvwmLQ/Sq/Z/pkn
	ySrhATkrA2usaP9iOrOj+X8wyb544Gku8Ur7KAeTfKxg5Cjn/ADJPSauIf77hmYc463JZqHbJkJ5c
	P24LLNeWhJzzCuUb5471TTW8UHmG60PsEf5Dq9eUYXzg8c0gxFXexlqY2L9lJ5y3YoPjYWx/y2Ctv
	HL+XzZoa08EMmnGEHbdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVFZ9-007GLZ-CV; Mon, 05 Sep 2022 17:07:19 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVD80-004SSl-BN
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 14:31:13 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 2EC911F9ED;
	Mon,  5 Sep 2022 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1662388251; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZY74CtrE2fNgBYPVcD9k7Aap6fAvNiS5mnQBJZXgfk=;
	b=Y/sqvnNEb0jqjQip4GXS88Ch8H/DcZq7iVMHNE55WU6sJEmuy80sE2hSUZzklm47Vud7Tv
	GaYLg9C/znmcnt40i6HNIirNichH0DDFmZcJstBQk+KznnSIlSLtXNKh3gqFQcM23c3YHM
	usntVtX+azNzsWOe/Vhq5X+Pl62xyVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1662388251;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QZY74CtrE2fNgBYPVcD9k7Aap6fAvNiS5mnQBJZXgfk=;
	b=JuuVPbKcN+146YtgSa5ELPUX+CWIK61n5BXmhJTwNDw/+cjRDPry6M5iM0kdQR1lmidbGQ
	c+VZXhF3nKuL3SCg==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 83EC32C141;
	Mon,  5 Sep 2022 14:30:50 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 92308444AFD; Mon,  5 Sep 2022 16:30:48 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: atishp@atishpatra.org,  anup@brainfault.org,  will@kernel.org,
  mark.rutland@arm.com,  paul.walmsley@sifive.com,  palmer@dabbelt.com,
  aou@eecs.berkeley.edu,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Conor.Dooley@microchip.com
Subject: Re: [PATCH v3] drivers/perf: riscv_pmu_sbi: add support for PMU
 variant on T-Head C9xx cores
References: <20220905141644.2468891-1-heiko@sntech.de>
X-Yow: Everybody gets free BORSCHT!
Date: Mon, 05 Sep 2022 16:30:48 +0200
In-Reply-To: <20220905141644.2468891-1-heiko@sntech.de> (Heiko Stuebner's
	message of "Mon, 5 Sep 2022 16:16:44 +0200")
Message-ID: <mvm4jxlao6f.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1.91 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_073110_873484_572AE468 
X-CRM114-Status: UNSURE (   8.40  )
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

On Sep 05 2022, Heiko Stuebner wrote:

> To work properly, this requires a matching change in SBI, though the actual
> interface between kernel and SBI does not change.

What happens if you mix different kernel and SBI versions?

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
