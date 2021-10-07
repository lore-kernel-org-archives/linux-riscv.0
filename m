Return-Path: <SRS0=uA0y=O3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11AEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 02:25:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529A261248
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Oct 2021 02:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 529A261248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eot50sJhUDdamm0EifpVNNg/tIUmJXCGlR5HT1iPnTU=; b=MjtLhfbaI1BBup
	OQ/tRok0Uh8xKxxsHjGtv1IFxV5mBVYNCAOBB9Bn5tn2eZRdMRKEY2Y+tNd5JN6nqqkY6hutLs/+c
	2QSUio+qqGQOfEYjJnY9KSqevv4ohfWNX4kb6cnwqwFFpvs8omVmioptWpqzjnAJ7zkMgctc+AuT/
	1eJf1RzAr8yK/DD9uLAXmcPb5L14VlnGourex3991Hl6DRNCNHBXIBdQ8sAj9lz3mU2SbLUCjpe63
	NsaL/oeYYt5K3gnYQcIzpuI6Eba8Y3nSPrRlygESdgG6FDuEVrSmtgkxaR0WGpADLJ7HTRUGV6Ii0
	9pWunCHatuEe/oqteWwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYJ6F-00FzvR-1P; Thu, 07 Oct 2021 02:25:35 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYJ5w-00Fzst-41; Thu, 07 Oct 2021 02:25:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id b22so2946160pls.1;
 Wed, 06 Oct 2021 19:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wdvJk6D1ViEBYH6uB0AwglzPFWNo7cbOO7fkxMbJ9dA=;
 b=Sp/MggvYZ1fkKseKOIqheZEqgIYO9U7l3Fb+F7r4AF1HJvKza55doAM4VFHekfLjFx
 l0h9QKBGfCRkc0EqNboiOVTNmHzg/SEEuLqwArpOJayKxQme+kLkxEIGqZgvnMWmieNx
 fhuC+ZFrD2D0fjMPYFbqmZAg8gVdJN6nAW585b1RLttDiggeBCq69kYRXGKHA2qSZytw
 hSaCB+BvsDGvSowzyJ3w/Myei9Krute/Mf+n+VyS3y75NZoqIH2HR+hkZeD1eiqFJV9a
 +rouVDBNrFLQuldI1V/ceTpSLwESV/R60I9q1ajynvnJIpy9PEOAXakMQE5+aA6KEYjv
 CNsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wdvJk6D1ViEBYH6uB0AwglzPFWNo7cbOO7fkxMbJ9dA=;
 b=ePKlKAg570jHMbwrZmPaOuzdKUidZvU6PDot/9GBJgemrqGwA6xzRxbSBuNY418WuJ
 4qpw3nlNfo8u/WD30TXdEMdu9R7WMU1fXV95nZtIrXxf/yFmrGFOGMZFR83hk2dePnSM
 o58BI1vK+eVLSh/4RWkyYT6ibVXPMTh0f8fMtN0ywbmRw53j05+nuDX/zliRykz1qsVf
 o++20BE32DlZk/UP2jJAg4wvFCl4f/AguggNLPO/VRctekTMfNh7GFoWvbX1ufAVDrDy
 MewXfbhkbft6SzMvWvxV704p9I/bGkCAly+hGvSAWIuuYcU8rAat0sSGr/IuqzLJ/eqB
 H9Mg==
X-Gm-Message-State: AOAM530JCypOnGOd+eq9rNY1DxFySwKMCX7e2ItPllhKkgUV5nfx1Fl2
 mYJTzeOwUGXhhlfnHq3VQfA=
X-Google-Smtp-Source: ABdhPJwHRb5SJb8sNMUH9CwZYyScBHBUSvA5u2yjHWxgkKCOzGkTQ5PtC45GQtM+mqCrbUx1dMutLQ==
X-Received: by 2002:a17:90a:8b8d:: with SMTP id
 z13mr2492694pjn.214.1633573515375; 
 Wed, 06 Oct 2021 19:25:15 -0700 (PDT)
Received: from [10.230.29.137] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id k14sm22015549pgg.92.2021.10.06.19.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 19:25:14 -0700 (PDT)
Message-ID: <ad0c1e14-62f9-0b9c-0b84-d31a213d53de@gmail.com>
Date: Wed, 6 Oct 2021 19:24:58 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 03/12] ARM: broadcom: Use of_get_cpu_hwid()
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 openrisc@lists.librecores.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-4-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20211006164332.1981454-4-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211006_192516_201943_D33F3915 
X-CRM114-Status: UNSURE (   7.75  )
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



On 10/6/2021 9:43 AM, Rob Herring wrote:
> Replace open coded parsing of CPU nodes 'reg' property with
> of_get_cpu_hwid().
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
