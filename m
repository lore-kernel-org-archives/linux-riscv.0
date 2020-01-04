Return-Path: <SRS0=ik8O=2Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39252C00523
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2020 00:11:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D5102464B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2020 00:11:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GZPmdU+x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cKfo4acM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D5102464B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xKt2PPmd3ZVH3skLSMZLWe5gk5gPeWTzpSDIkOKvuyM=; b=GZPmdU+xvIaX++vSQWMJ8UT+R
	eqbC5XddZMjsJZxJfmAWKqb8tR9MnMuzWd2OsDTZFPwEIradtzaEyoSKPK7eM5WXGFrh/wWpl5pUj
	ClwANd37igHaFNPHNFl3uelmIQdukr6C1SQmQBiqxrQ28iN8uadmGQCGBb4sfKp5mTc/wy+sjCao3
	CQJwEAsgMK/g4Lq50y33IfdmcpATeqQosaPe4PXCDxXlb5CbXV7u6LUCteLWdudUx1R9nSOkR6G5A
	VLK1HjCZz3qEb9TpIcOfOpt8osrAVgc94VU51UNOJY59T6dkJ1oVI7b98+H2+HSVPso3s+c2OR8g8
	LKBA6qSRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inX2s-0004iy-5h; Sat, 04 Jan 2020 00:11:58 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inX2p-0004iZ-CD
 for linux-riscv@lists.infradead.org; Sat, 04 Jan 2020 00:11:56 +0000
Received: by mail-il1-x141.google.com with SMTP id f10so37972353ils.8
 for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2020 16:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=xKt2PPmd3ZVH3skLSMZLWe5gk5gPeWTzpSDIkOKvuyM=;
 b=cKfo4acMI290WcTrTV19qCiykdAdniIGYGGE5KiHM30OB8SfCxIKpuBwAxJY7vY7qO
 kIj6AwP6PnhvGoW/3ywmR+3axhct15ptkRvqRDHXLasYSfLjMiwvvIzNGeUdRalDi4XU
 mzABFHWUnfDK3qqqm8hGD8Nznxroh9Jsd09lwY0uXpmpisrTrxDWWilImmPtM/NXqMsk
 GxoJYdrrfA1Wq+9fwSEmbkbVOjOlYbwnNinq54Gs21jSzuLxD5VPYBhL+4G8OvVAJuXa
 58bt4kvQueCv8DPcwkWjK+tY73qS0073Ij8wtWR76qvpDQT2pLcdPR79vgE/nmIj+nTS
 O1Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=xKt2PPmd3ZVH3skLSMZLWe5gk5gPeWTzpSDIkOKvuyM=;
 b=b+Nj+NXoihTpnTKEqPCZ9urjvGRLpg41KRIb563jrlc4HKVQ7BXEw2YrzPowoDV8Os
 Gn9uj0dqA1mshinHYmgmimrZac9sWbQiUQ54fafAYIQTZuh3hqGF/jhFdO+FropnGxVZ
 JitC+fkED+nEVREics8NF/OzQbbxkd8pukYd9+6SZU0bHP2uQG72gakTcVtuIKp/8E0D
 lOK1WWZ8BWduM0wVJJ1AgRju99lUD5zgCrzMV2BVwdN16k3PbrvqIVHLQ25FIShuFWlz
 snCWu9h89SowgX4yrzVJmcDRDtiLN4t1tfa7oADJNTG2Ig5n+42nPbDIRv4VN8PDeeFm
 0YGg==
X-Gm-Message-State: APjAAAXf+jNdRrSKeO2x2ibOBdhO/Fyk0tPAj8JLjq6WIk6BeroPPI67
 zIoE2zz3MxGsekp3jx1Yj2QT1g==
X-Google-Smtp-Source: APXvYqzYxki3BWxfIgAXwBHFoYf19/w9nt614PRZ+UMaMbO8xOSp+wTCGb8tjR09++TXHdu+cm5iRw==
X-Received: by 2002:a92:d308:: with SMTP id x8mr79828277ila.42.1578096712752; 
 Fri, 03 Jan 2020 16:11:52 -0800 (PST)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id v10sm15220324iot.12.2020.01.03.16.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2020 16:11:52 -0800 (PST)
Date: Fri, 3 Jan 2020 16:11:50 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH] riscv: gcov: enable gcov for RISC-V
In-Reply-To: <20200102030954.41225-1-zong.li@sifive.com>
Message-ID: <alpine.DEB.2.21.9999.2001031611430.283180@viisi.sifive.com>
References: <20200102030954.41225-1-zong.li@sifive.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200103_161155_415482_DD44AB89 
X-CRM114-Status: UNSURE (   6.35  )
X-CRM114-Notice: Please train this message.
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
Cc: aou@eecs.berkeley.edu, linux-doc@vger.kernel.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 2 Jan 2020, Zong Li wrote:

> This patch enables GCOV code coverage measurement on RISC-V.
> Lightly tested on QEMU and Hifive Unleashed board, seems to work as
> expected.
> 
> Signed-off-by: Zong Li <zong.li@sifive.com>

Thanks, queued for v5.5-rc.


- Paul

