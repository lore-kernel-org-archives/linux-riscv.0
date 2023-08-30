Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6AAC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 07:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nhPSMzsyMvkDcwg8eKAmK8MWJm8M/mkz3ax3p6nxrg=; b=jTgpTqR4RjTtH7
	mirK7u6sJs3NitEUMfJbEI+QhvdHt681CTR4DZi0loWajwoCAHIsOfQbS/uzFgIbi5z9MCaf7uj4W
	Tkj+RqOa+V7nR6Lin5d8EBXPEZMh03+pEUGiYX74FJ+uxkgByZy1qnCqOlF6xTZPP0TQbF0rR150T
	MgEqCO8QeeoYun6WUScOb5f/OLB6XrolSYUxfsZQwrAg3MwnFpFDFSOb9pjKoJEMfj+sVrYe3tx7M
	c98BmQYBsjAXRFmHbxY/eAP930qxArYldfG/fCUQLtjDqk3lTtwsozeJDDtx/cK6vmUTOR1YfxAUi
	swU7T+OhvjC34ikZuMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFZC-00CzJz-2J;
	Wed, 30 Aug 2023 07:24:42 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbFZ9-00CzIO-0B
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 07:24:40 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 5135121860;
	Wed, 30 Aug 2023 07:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1693380274; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axaL9ZP5OcS0CsYrai2CnzHIn/ti9r5RP/T3400Brzo=;
	b=segRofjBOjlgR5b4WEGTYP/15oWV7e3e52dWOMo2ydQiaDlf4xEgW9IkBH/srEr66OKYoT
	n1hyAx2RjCDw/RL6/jfPQZPL7vN3RvDl8qh1YmxXg1mnMT5xJ9lcNx61koF8A3OadduFCB
	qdttRyrKAjkvw5C782F1bmKn0gxFfrc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693380274;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axaL9ZP5OcS0CsYrai2CnzHIn/ti9r5RP/T3400Brzo=;
	b=ljRs8UXjvGxGJvoXN9gpt0j+FVCZg3sBwuUCgfsmdmuRGsF4tI62+qmaTgVOZdUyFK2HX6
	LXEwJbISgzRpwGDQ==
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id B54F22C142;
	Wed, 30 Aug 2023 07:24:33 +0000 (UTC)
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id A416E4A0399; Wed, 30 Aug 2023 09:24:33 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Song Shuai <songshuaishuai@tinylab.org>
Cc: paul.walmsley@sifive.com,  palmer@dabbelt.com,  aou@eecs.berkeley.edu,
  mick@ics.forth.gr,  alex@ghiti.fr,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: kexec: Cleanup riscv_kexec_relocate
In-Reply-To: <20230830063435.1105726-1-songshuaishuai@tinylab.org> (Song
	Shuai's message of "Wed, 30 Aug 2023 14:34:35 +0800")
References: <20230830063435.1105726-1-songshuaishuai@tinylab.org>
X-Yow: They collapsed....  like nuns in the street...
 they had no teen appeal!
Date: Wed, 30 Aug 2023 09:24:33 +0200
Message-ID: <mvmmsy956xa.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_002439_261211_EC95A7E9 
X-CRM114-Status: UNSURE (   8.46  )
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

On Aug 30 2023, Song Shuai wrote:

> @@ -52,21 +42,27 @@ SYM_CODE_START(riscv_kexec_relocate)
>  	 * the start of the loop below so that we jump there in
>  	 * any case.
>  	 */
> -	la	s8, 1f
> -	sub	s8, s8, s7
> -	csrw	CSR_STVEC, s8
> +	la	s6, 1f
> +	sub	s6, s6, s4
> +	csrw	CSR_STVEC, s6
> +
> +	/*
> +	 * With C-extension, here we get 42 Bytes and the next
> +	 * .align directive would pad zeros here up to 44 Bytes.
> +	 * So manually put a nop here to avoid zeros padding.
> +	*/
> +	nop
>  
>  	/* Process entries in a loop */
>  .align 2

While you are at it, I'd suggest being explicit about .palign
vs. .balign.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
