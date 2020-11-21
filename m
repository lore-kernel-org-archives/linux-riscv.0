Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8610AC56202
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9BE2408E
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3CRVdJB+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="BZyizWUD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9BE2408E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=5j8wv/F4c50OVxeW1I/kJwg7gZsBCnzG1W1Swlsu9Tw=; b=3CRVdJB+m65UtcXZWGa1WofXn
	mrQM7pll5tGR07dX4XiI61AvGEfvQZfGF+4rs4BbTWYrRETHbFWp00tn9bvZhZWSWOBUL4SgIo3Dd
	XM0LRN4ZobA5rgHOTMI/6OJdjpQ4T4rwHW1GLWCgokhzocLqJPYywpz0B0hRkq3388EUEtR8uog6R
	zalZccV2DHk1ljbua31Dh32VuAQ1OH6IG4r2/cPgfwldApNKuZ+GmYLUjepLGny410nApVB2N3zxZ
	j+gwyDk28dqwaw3APQdy7lxricftkXC5nZDWJh37/ko+013GLQP8g9BRJZzolOevMerxolPxnIlwh
	6ITkNXSlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgHiZ-0004jM-3y; Sat, 21 Nov 2020 01:29:35 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgHiV-0004i5-E2
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 01:29:32 +0000
Received: by mail-pf1-x442.google.com with SMTP id q10so9592872pfn.0
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=RYuSCvZCwqyETo386P8sWNEaEYD1M71i/48IDc0TFTI=;
 b=BZyizWUDJ58KxyEwloasLLYMqzf6DIXdjtsJk44VEXmk/u216pKjQlq7/ta3/5wFFA
 /4a1L2Ln7y7QbpgpFLdiABUhqqSjISSB/7Kb23itU+UyexMH2/Jh3yGser3zTAFH/lFK
 1fYzSPyPpRPjeM0bKK1SQ7wbv5TiZRt5PLTNnpdn6dRohqWNQXBKt6mTows04Tlo3pQ/
 dwP4Dw+1fPBXPcJZNvvKrMfz/YIiIhUcF/ekNF6Ezbrk/hCx1fm0lDX4hiwzQFPxgoWJ
 idBjz2XwcC7OF72rqcacDJRbLSgVd508HBUyE5GUN6I0iVteXikZgW6v9JsPkNTclE6q
 ppoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=RYuSCvZCwqyETo386P8sWNEaEYD1M71i/48IDc0TFTI=;
 b=ZAQOC3mLsUYxZZnF3cGCWtMMUDDb5hYkVHtp17lje6oDwoHIZaMtvMHpjo/cY7GGV0
 A5RkSoCXr53RF9e86W9vFWOZkvczFasbIP281rvyamkXIIp6OdX81qhUSvO/5UPUfuIB
 DiUs/p/0wmqAsvhMgKFPRFkJ1VQx2jmeLhOFiJO5sRtSPWfOeTLsHQ3fGifR4nG/gpqF
 dJ7lW07ZZlTT3P25tUlArZx+XTh8J05ULqAs4foO2fKG0BFHf3brbYL6MwjSj9nBSk9x
 dIyj/MGXcZDpyKlzuaLKUYzwXZl7VOnf2atCPEJiKMxvwSComO3RVZvN1CGiPUvbRFBf
 7OTg==
X-Gm-Message-State: AOAM532AEZzYO55VwUR69D0gg44vlfXL/kudFA41hv4nmuRVXrMEU288
 PImoXKToxjCgG2IhJ9NCq6S6eg==
X-Google-Smtp-Source: ABdhPJzOQ5N9xyaCCoDJftWz+nA3rWzAz1qtBnDtfpqbHEcjJOeCYjsDG9EoKozAfWZzau5aySWivQ==
X-Received: by 2002:a63:f20:: with SMTP id e32mr19335777pgl.130.1605922169524; 
 Fri, 20 Nov 2020 17:29:29 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e8sm4607562pfn.175.2020.11.20.17.29.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 17:29:28 -0800 (PST)
Date: Fri, 20 Nov 2020 17:29:28 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 17:26:26 PST (-0800)
Subject: Re: [PATCH v4 4/4] clk: sifive: Fix the wrong bit field shift
In-Reply-To: <20201111100608.108842-5-zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-738e4a27-9751-4937-b3ed-efdcdce56f0c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_202931_568243_4EC9D57C 
X-CRM114-Status: GOOD (  19.81  )
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
Cc: aou@eecs.berkeley.edu, sboyd@kernel.org, mturquette@baylibre.com,
 linux-kernel@vger.kernel.org, pragnesh.patel@openfive.com,
 yash.shah@sifive.com, schwab@linux-m68k.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, pragnesh.patel@sifive.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 02:06:08 PST (-0800), zong.li@sifive.com wrote:
> The clk enable bit should be 31 instead of 24.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  drivers/clk/sifive/sifive-prci.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
> index 802fc8fb9c09..da7be9103d4d 100644
> --- a/drivers/clk/sifive/sifive-prci.h
> +++ b/drivers/clk/sifive/sifive-prci.h
> @@ -59,7 +59,7 @@
>
>  /* DDRPLLCFG1 */
>  #define PRCI_DDRPLLCFG1_OFFSET		0x10
> -#define PRCI_DDRPLLCFG1_CKE_SHIFT	24
> +#define PRCI_DDRPLLCFG1_CKE_SHIFT	31
>  #define PRCI_DDRPLLCFG1_CKE_MASK	(0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
>
>  /* GEMGXLPLLCFG0 */
> @@ -81,7 +81,7 @@
>
>  /* GEMGXLPLLCFG1 */
>  #define PRCI_GEMGXLPLLCFG1_OFFSET	0x20
> -#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	24
> +#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	31
>  #define PRCI_GEMGXLPLLCFG1_CKE_MASK	(0x1 << PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
>
>  /* CORECLKSEL */

Section 7.3 of v1.0 of the FU540 manual says that bit 24 contains the PLL clock
enable for both of these.  I don't know if that's accurate, but if it is then I
believe this would break the FU540.  Don't have one to test on, though.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
