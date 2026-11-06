Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4C0606A330
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 20:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SnDAQTzF;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R5gnvq7G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AVrAUBNCAUESwgYIm9tyUvXfYoGOSa3gilYfKWo2rLI=; b=SnDAQTzFfUZ8LxQWkIglrQyCM0
	srlhuJRNmsdEseA8apbKrjyLN4+y5zFPWpW8+WikBT6756mmP8MqfDINo66b1wHV2y1cXXIL3Hxz5
	Dlfq2SCd/zCAjR5hvXANvBM1EAIXEXlWuKvni7apXPf9Zwm6OjC0xmlNnA+X85jFL7RDYFSPxKViM
	Q2dboTNMVoZMh/xLJWnB9GA3aETnvRv0NQelWycD54z/bkfukIVWc6shGYrE6Y25+KB9p6XEwkSgz
	sHL2Bfg36LNkyxd/VPnv5eAFDNYyl/71mA1/dm0nlTBHPJodFKex8RxXZTW/EFoGevIkBoeLiS+tw
	RJTWAIGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQ6K-0000000DZ0n-0Phz;
	Fri, 06 Nov 2026 19:59:52 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPQ6H-0000000DZ0Q-1oVU
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 19:59:50 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso10530185e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2026 11:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793995187; x=1794599987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
        b=R5gnvq7GiZ8Ic7vwD2Si4tA6P1aiKZlKcoQ0XTjfCTjvFdSjU83eH5N4r1cprzgzGk
         v91wCh7Rdk3lQ8/4CcDxMgAkh323JJWZuz04sOfZnA/+MAqD6XjOh4qhU0UvgZDIBGr7
         AmJWC4+e+gqTL5YS7TAjwfKO0fI7lhPrdrXBpEmjcaIK4BfsWCWP0XHzwFFnVWO4EdjA
         dYJW54DGsEQFy55R7ucwHt3ZuJc1w3PfNCLAOp4hRCpYwf8n9dGYqekmjwqp6T4YBW7h
         VPokJJlTD4pIskJK8pa2yHdsaxS116cM8JeFaleEl7d9Sxd+LYy3/N0PvHwKIyy6HGZf
         3ZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793995187; x=1794599987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yk3scaKWk/QUvYfp97Kf/l/OTmiicn4mPluBuDOW+S0=;
        b=a3zCQ5tt6WHLXxdMJfO017bosfgyDTAJfAvfREAD6w4vWvG6dmwTwLMIkcpBzWFGGo
         txq0+2s0G57lqleUF+DsQ9oG6aeqI5/FgTgbrYFwTOUrdXJGN7ADVqny7ZsJesHjiKkU
         /aXlJ3YypD4Ec7dURf0yg747xy/i4sSbvkesLPpeRfylMycj+1ttpDyuFKUK8LDASdQY
         ld+hIJBkyzLqHQxYbpUrM6l05Rv1B3Gs0QUhXJH5wJBaWDMHEKpL4BXe4v4IYvXtni6q
         8TXj66VLsCxZKxtExguMB9sVyVRUVQ3FbLdrGuUwRaRrbGYKqWR+uFk0Egkoi62EXGgb
         /1/g==
X-Forwarded-Encrypted: i=1; AKwUvBw0oksE8ZKkUwd2HSvjCUANdqIFzwBzgBmB5xaKHGHsUqEtZz87titLTfrUzmOILue3bQ9Lg814W38t4A==@lists.infradead.org
X-Gm-Message-State: APuU4Z8Qs3JVCTcPEBTXkrY+rUUXPoA/CMbDiukOZR1JxioGpkgm8cKW
	LrwAmHKS755HQ4BDBsSO+mWCskQYukgXI4+P6Hg0CNvHvDkkKZIsn3hR
X-Gm-Gg: AYBFou2r4OXQBbLWDv5lD3Va9rgnCXw/FKyfp0Yjg4bwuTsy2rxnSNvg0VGRMNG0uVA
	TAtRzC2XfjKj9BdXA3RrrlLw/Y84kt8ISHHSYG/xQ9/5U/DzZQP6gXUfG6ZQHPLyh46vr4H2yUd
	b5FUpm2DnmlHbyWcD0ra6DbawGu4cuuz1QUkqvlMMhhXTJ79Unju9MVHdmGtCsXhgnSSitUCfyA
	JKDS8KmijG1QYrF8J+pXvXssFAquI5az3ebc3y49i1ElG5sIDmbnaIDwcN/GFTrHtuJ8SOAaUux
	eYPu3g25doz4cszKUE7mBW17tL3RQIcYhRH2KS8aYeCPM8D0q8mZaBPF0aDppHhjoq1BtPQtvRn
	TKiMvy+pm5/SbN4JCUxTpm7j99kiZ5HbY2/D/b4pKEuBES21WOW/cZhDxOUZYgnWwQmA7tVbYJg
	i6gzkUG4/ZxFnVAXoNE5ELx5nZKe4DxYeAo/37TYGHh6sTmAQ3aJwJcyFtPUGRecHag8ka2YK9D
	wmSAGoMsAsyeUsFJxxaDUcG+phsDoTmlsLeGh7UWFlvElDG2WAEmR/ppLB6FneJ18n196zuxDq+
	3RKlmMmXatQwKOOgQ9Qnd+qkIH7oUNI=
X-Received: by 2002:a05:600c:6090:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4b6db0d0817mr56859775e9.4.1793995187215;
        Fri, 06 Nov 2026 11:59:47 -0800 (PST)
Received: from hp-z640.fritz.box ([64.43.161.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7da62ecc1sm4414165e9.2.2026.11.06.11.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 11:59:46 -0800 (PST)
From: Owen O'Hehir <oo.hehir@gmail.com>
To: E Shattow <e@freeshell.de>,
	Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: keep the status power LED on
Date: Fri,  6 Nov 2026 19:59:45 +0000
Message-ID: <20261106195945.4157095-1-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
References: <20261106184055.3891621-1-oo.hehir@gmail.com> <179fe9e8-322b-4745-8734-d5de5f1e8487@freeshell.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_115949_510845_97169845 
X-CRM114-Status: UNSURE (   7.02  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi E,

Thanks for checking. You're right about the commit message: I saw the
LED lit before Linux probes and assumed the firmware set it, without
checking where it comes from.

On the Lite, the schematic (sheet 21) shows RGPIO3 driving the system
LED and also used for fastboot detection, through jumper J20 that pulls
it to 1.8 V via R257 (1k). Detection happens at reset, before Linux,
and R257 limits the current whichever level the pin is driven to
afterwards, so I don't think driving it high conflicts there.

Owen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
