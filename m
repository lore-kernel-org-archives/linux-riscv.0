Return-Path: <SRS0=oSgD=R4=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03167C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 00:16:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5A5D20896
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2019 00:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nXOZ/7ub";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="XXEnzswY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5A5D20896
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SMpc8xLGjqtYuXyARNUllz7XeA6qdzHK92C7LFMLr5o=; b=nXOZ/7ub4cNiIe
	Ioeo4pc8IMu73gOUIRx7Hkuqf3LdKeP6AT9FNB/nP7MtJJt3VJ+XuaPmyzvknWjDtFLEjNfvhxvWh
	TB6IyR4jR5Lqh4c+D5zIuHXteFbY+9G3BlMfIaPK9t6F9mcem7EKaA+U9Z1sTtpb2OS8YYX+xiod8
	aLQRSOmr1+Wt0UvjEgH2CgeC4pDHf01iuygJALsx/p8tlcUXajyl+O//AZnA7DqrUuX57rsSBYokz
	KkKYNDRZeCeqdFCCPQlYZR84uiR/raBbZ5NOAiDbRhStQ0tYFMq0fTOmmfcSXvF0MocD2uDvtHSU2
	x0Xw4bY/4Rkpt1s9CLrQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8DHr-0005MJ-It; Mon, 25 Mar 2019 00:16:23 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8DHo-0005Lt-3J
 for linux-riscv@lists.infradead.org; Mon, 25 Mar 2019 00:16:21 +0000
Received: by mail-pg1-x542.google.com with SMTP id f6so1036129pgs.8
 for <linux-riscv@lists.infradead.org>; Sun, 24 Mar 2019 17:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Vve4evhn0lRnLQezicMi7GhNDGoE6UDoZug273oRMZ0=;
 b=XXEnzswY1jeOkcGf35AsJsOWVik3AN3tVasK0WJ8/rD4ExFkeLInq5BJiQ6WSr37zs
 E8jvmdDn/1PDVOwKMmFaBKbh036ef7fRgXxItuKlQG2+W4GP+0sABr6+ccJWQz4G4FJB
 vGitIPolrs8/iNfGzxq4zJli0Zl1mp5tHp6JuU7nJAR5XV+ItVrcvpTgpk0yUy2FfhuA
 20jThP6PEX2lE8htYjEScOMvzeWAL6ApDnNsjOL9z5anyTLb0+054KXZ7bXVMBfhxiMo
 Pp6tsitHDv5t6PmoY9edqXYnBVUtBPSEIULonF+kDM+VdTZUU0xUaStOrp3ibQQcE8yV
 IYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Vve4evhn0lRnLQezicMi7GhNDGoE6UDoZug273oRMZ0=;
 b=Pvl1PSiicnAYd+IhbF7durqngpZPasY/ItFAqDEzXUzQzOgnrdGvkU4dgpP2XQppCk
 d9pPgad4s9UOti6Wo9E1ZZl+g4euwm04MbOv3dj02yxLMEarHY24iMwK/5kZnDoNOWkJ
 iOoTHKeuRVsGHJeJbdicptPIblwZn+vmBEwdNSC8gQJ/zBIGHZCld1W4X/aBSLxBh/gT
 a/bje8BPfM8158Dfj/5ancEUVla6SUksmJVTrZiKPwbistATqBgD0wPjOfUnMDF8vTBA
 qVHDXNrZfrCPq8nWafZfN2O6sAVN3UKwAleQWnLTSK6oy7lG6Yhw1K8nhsw7Kih5cQxE
 2FJA==
X-Gm-Message-State: APjAAAXBpCwryhVR3d/SayW4rYxp9MwYckrIouBRvHas9Lp+5UZ7kVjW
 VtrMjHJcqQrt8sXbTdbGPA+idA==
X-Google-Smtp-Source: APXvYqwoY8F8b4unLXEd5uXPG6iBkpF6y3j8pspmt3vdMCRCHVZK48S/RA+b8EhpK2fEdEJ0H3ftiw==
X-Received: by 2002:a62:54c5:: with SMTP id
 i188mr20825688pfb.188.1553472978496; 
 Sun, 24 Mar 2019 17:16:18 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id j9sm22106586pfc.67.2019.03.24.17.16.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 24 Mar 2019 17:16:17 -0700 (PDT)
Date: Sun, 24 Mar 2019 17:16:17 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 2/2] sifive: edac: Add EDAC driver for Sifive l2 Cache
 Controller
In-Reply-To: <20190312092842.GC28589@zn.tnic>
Message-ID: <alpine.DEB.2.21.9999.1903241705460.8028@viisi.sifive.com>
References: <1552382461-13051-1-git-send-email-yash.shah@sifive.com>
 <1552382461-13051-3-git-send-email-yash.shah@sifive.com>
 <20190312092842.GC28589@zn.tnic>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_171620_156723_14FD3871 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 palmer@sifive.com, linux-kernel@vger.kernel.org,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, mchehab@kernel.org,
 linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Mar 2019, Borislav Petkov wrote:

> Please no EDAC drivers for a single functional unit with RAS
> capabilities. Rather, a sifive_edac or riscv_edac driver which covers
> the whole platform or even architecture and contains support for all the
> RAS functionality there. See altera_edac, for example.

Looking at the Synopsys, Highbank, PowerPC 4xx, and TI EDAC drivers, all 
of those are clearly for IP block error management, rather than platform 
error management.  Has the upstream guidance changed since those drivers 
were merged?

The core issue for us is that we don't have a generalized "ECC management" 
IP block.  And I would just as soon not fake one in the DT data, since the 
general DT guidance is that the data in DT is meant to describe the actual 
hardware.

Would it make more sense to put this driver outside of drivers/edac?


 - Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
