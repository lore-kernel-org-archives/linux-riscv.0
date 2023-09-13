Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06848EDEC6A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 14:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKl7BdieoHzmn2TIlQXsLcuJ2tZS2UlVJ/uQIrHlaWo=; b=uTqYKUzeEksri/
	ePXbCxiHdk7dSIc3T33YujWkW01oKFUwLdvz99s6UpxW+UeFSVOd5PRjVrNhzdJmV3F/tO0gyPvhA
	SCtQJBzRu1lkWxMaiJwn8oOWHKy9KFFVTm5QU22TxuTVpDZqmZ5ShUlf0h/YjvBPV5LozZ5adJVIP
	9BM6dhn9UMEWBSL/BnQbS7Ea3RSGNoC3PBp96datjboWRwwIAvPYUIB0wcUGBRE0qnEv/PO3E010Z
	ej/tNHf6dlQ+ZXSndI95uo7OQvFDcdj72E9dciwz3G14p+Uvq6JzZNsYx2076JNdvAXLeohDrwVp0
	4eQtsTdS0tMbmZ/9awGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR9a-0069LK-0I;
	Wed, 13 Sep 2023 14:47:42 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgR9W-0069KS-0q
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 14:47:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 9E30C1F385;
	Wed, 13 Sep 2023 14:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694616449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91ytSZhAZZJxRLS51DPAMbgyIGi3HFabuhDgqq8+ZcY=;
	b=pqlznT6UI67IMPdHtm8FZNrlprjno9lQRxR/VNssD6mG4gJMCHrMmzrN2gwPJeb6GxBC0B
	bWPDmDYM8Z4KwfYEDP09Csi0E7YrqjnA6DQ+3BzmZv2h6zXZMjoUcxRdaZRwxENDje5pdG
	2e1Ug5Swug0e0lzs0YBrtjGk9BeF728=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694616449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=91ytSZhAZZJxRLS51DPAMbgyIGi3HFabuhDgqq8+ZcY=;
	b=dtYqore8nc2Jlv7dpegTaDv40gsMQCTVkFUEzhxShCWbxdRvoN4pCFIdbBK1zENcYRL/3N
	HAZb6p0s7GZSs1DA==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 077842C142;
	Wed, 13 Sep 2023 14:47:29 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id D571C4A04B1; Wed, 13 Sep 2023 16:47:28 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: suagrfillet@gmail.com,  Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu,  anup@brainfault.org,  alex@ghiti.fr,  Conor
 Dooley <conor.dooley@microchip.com>,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: BUG Report: Some issues about vmlinux with emit-relocs
In-Reply-To: <mhng-0208249f-0619-4be7-bbc7-e1c0ee6e3c8c@palmer-ri-x1c9>
	(Palmer Dabbelt's message of "Wed, 13 Sep 2023 07:30:48 -0700 (PDT)")
References: <20230808085438.3445957-1-suagrfillet@gmail.com>
	<mhng-0208249f-0619-4be7-bbc7-e1c0ee6e3c8c@palmer-ri-x1c9>
X-Yow: My nose feels like a bad Ronald Reagan movie...
Date: Wed, 13 Sep 2023 16:47:28 +0200
Message-ID: <mvmcyymxh8f.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_074738_463365_9A5E57B1 
X-CRM114-Status: UNSURE (   6.24  )
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

On Sep 13 2023, Palmer Dabbelt wrote:

> Having R_RISCV_NONE in any binary is a bug, it's not a real relocation
> just an internal binutils thing.

That's not true.  It's an official part of the ELF psABI.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
