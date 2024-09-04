Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACE6CD4855
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwOlA9+/eWn6cVAB57SaMriEUlVYycFEF3BqiKSlWVA=; b=qTQsC0wEgiwm8+
	TNUYaG7jJIxTd90uv80G+pLOQVf+AW2OHZUOCiU00CYb2VR7582j89p+QdncMC8GmtpVL4gxmK25n
	FfH3I/ggCXKeP/Vd/kMNOtJ/dpG9s2rhDlPLuVTn9HSG4wgnryfK593QrztqlPtqfvidmEjL1sRt1
	C0WwyvizSrH2B58niygWRCHyT0WYiKhlJm1KkzMsvuZXe0STLJIwFSG5KibP3B9g1sgDCth1w8lBT
	mwbGuIzFlSfNxFGo8zirK92Gek+++qWEiRBwYmj2craWV4QnQJuYfDywH7NI1QSzArwOCqOQrXFdM
	ah99FMTnMsBVW1ifB9Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slrb3-00000004vuR-3Koj;
	Wed, 04 Sep 2024 15:07:01 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slraf-00000004vqU-0Eh1
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 15:06:40 +0000
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 0E5B91F7C5;
	Wed,  4 Sep 2024 15:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725462394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/VIUIncMDmnLDEntGjRefeTl0x6mVsbV5C4Bq49GWs=;
	b=kyTL3UsdJ40bXYAj9AitnKXbEov5Zlygobbs+Uh74Y9e6Cy1JZZ4a1+FegEPcPCepFzIM6
	I9dqgDz+rkwBn33V+owatUSOlOe9Qih1g0ifOaciX+C2NwCVmytVvS/w6Q/mwSwEMw1JIm
	DnSUs7KvEAM2tsKaHD7H21Q5/KDNneI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725462394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/VIUIncMDmnLDEntGjRefeTl0x6mVsbV5C4Bq49GWs=;
	b=zcYIYkf3JXlk/RevhF5TGTP7HJm+ngM2hvB7TZZeqNFUcbwR+BzoOE+VU1HkP1uyC8ynK2
	y98US736Wtl1zwAg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1725462394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/VIUIncMDmnLDEntGjRefeTl0x6mVsbV5C4Bq49GWs=;
	b=kyTL3UsdJ40bXYAj9AitnKXbEov5Zlygobbs+Uh74Y9e6Cy1JZZ4a1+FegEPcPCepFzIM6
	I9dqgDz+rkwBn33V+owatUSOlOe9Qih1g0ifOaciX+C2NwCVmytVvS/w6Q/mwSwEMw1JIm
	DnSUs7KvEAM2tsKaHD7H21Q5/KDNneI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1725462394;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=O/VIUIncMDmnLDEntGjRefeTl0x6mVsbV5C4Bq49GWs=;
	b=zcYIYkf3JXlk/RevhF5TGTP7HJm+ngM2hvB7TZZeqNFUcbwR+BzoOE+VU1HkP1uyC8ynK2
	y98US736Wtl1zwAg==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id F10BB4A0542; Wed,  4 Sep 2024 17:06:33 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Schedule SBI-0.1 for removal
In-Reply-To: <20240904145404.6291-2-palmer@rivosinc.com> (Palmer Dabbelt's
	message of "Wed, 4 Sep 2024 07:54:05 -0700")
References: <20240904145404.6291-2-palmer@rivosinc.com>
X-Yow: ..  I think I'd better go back to my DESK and toy with
 a few common MISAPPREHENSIONS...
Date: Wed, 04 Sep 2024 17:06:33 +0200
Message-ID: <mvmmskn5uh2.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.19 / 50.00];
	BAYES_HAM(-3.00)[99.98%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.972];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_080637_270255_35AAF0C8 
X-CRM114-Status: UNSURE (   4.52  )
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

Perhaps follow the example of commit eb07c4f39c3e ("mm/slab: rename
CONFIG_SLAB to CONFIG_SLAB_DEPRECATED")

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
