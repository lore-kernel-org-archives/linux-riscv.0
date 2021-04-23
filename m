Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC298C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:33:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BBDE6128D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 03:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BBDE6128D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=MPWpHURzm3v1F75Ri5cxP8wdiLDO8L8W2m2K1YWUSdo=; b=WR+g7rZvzpJjfhYsKdssYaFWB
	AbZJL8RTDALE3ilX7JRKDjMoTdEXGIyiZ7JayUa+dDOJ8XXvsGqgl/zEF942TxAV90oCdKQfsfMj6
	85iC3mjRYTbh1CRDPQGobu10krbCaavOWpYRsHwYoURz0MFEvYTQsV/GJhQ6gpiy/Y5OmjrZcZGwL
	Hp7NRDVcZQITpvQViSFcKVIMclvfcWMbZHT6YaJUChscR92LqSz83MKaRAM0KxSBvFS0aIeu3sb1p
	Wi87TN3lwMljkSa4tjWJzPzhjJDh3u0bzZic9YJBrZ+lEKJNZEOAHkn1fLKh0GFOkUKD4glMUuCPm
	+AR36M1/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZmYu-000Tl7-8k; Fri, 23 Apr 2021 03:33:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmYh-000Tj8-Qx
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 03:32:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=BzcRr/BEJlxG1MpN8LmOK5QXIGm507wREeeatIRcmts=; b=zHgmkR3JDbBphcWKmO829r8H04
 uBBUwcH8vOfkAUE0m247sJs+kdz8SN2xs+pkApW4xH2SyAGmJywEigZcN2opE7yy6ti7+/Zt4dUuX
 7JZQdEuS4vam0AWbGmJpthBg1SkxpoIRdCHKo3hsGsWsCXvE7Ux8BBLe1LOGq2LyQJ6WRKcc77A91
 5lXoVtVvSGv34bIIqPN6BAB7sL6XD+kcyebaH4S1ptQ65IkxJ+U4Vd4qRIIkpHbzXWa9BfZtD5dV0
 68Qm/8q4YYauLURWd30iTtWH7nr33Rpcm+FM/OzWVtdDNlzsbfyApsdgLFmhnK60P7Vyouh72TF5u
 tEM7Tovw==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZmYf-00E7Mc-Cy
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 03:32:46 +0000
Received: by mail-pg1-x532.google.com with SMTP id q10so34276918pgj.2
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 20:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=BzcRr/BEJlxG1MpN8LmOK5QXIGm507wREeeatIRcmts=;
 b=HjgJfX4AGivc/yz15utqAttjyCo8TXvjXlokGilyhSygKgtXnyvysUjh3O/opPQ41b
 8W+q43D466oP0P8GXVp1bM+zsLGZ/tvn9XRfNNAqG5a2r/FlkrZiJETcM2cX3vMrBes5
 spbmOgoPfZfHUNibT56s2tZvv04L9WgFW2tlZb7mGjDgE4syYduOsvMkEFwK95GBCplG
 5mspC06tvcUxxCiYidGMHgFr8Cbxl3NJGc4pXK+8IBEXq0cNwMTRsDZ4LjEY0JW0V1nA
 EjvwnB3gl3Wxcw8RF0rE3GmJffXKBvFP27b4aAYKrGUNm+5+wE4I4phyZq1rZuH+AxIc
 JDVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=BzcRr/BEJlxG1MpN8LmOK5QXIGm507wREeeatIRcmts=;
 b=Fm4Rxk4FfiakOJ9VGEu97lHtq7PeryOZ39U5VKQc++pOiPClrnYQYHAK+lcONpvT+e
 QGcLm6A/a0UwGU/NCuNaUh9h0uPkMhD098xa1BQaBU0Bug0+nQoyiIVxgHLC0m4c99ml
 Ei+qYm4xjJJGc/UBQZRGy2+f9dO/fs1MPttI8cPW1mmWhaxHcj7OFgoXARsLDjEtoRq7
 tJB7zdrGjdYejP/DBNc1oqRQ/92pC9L1HFRj0lnuqPA2Lg0FwmvQZlHk+BY24g3+Txi4
 EpjVQ7Xe0KPRx9O5SaI0h6ECH/kjweRJxy0Doabe5Q1Claer5xcDy2Bk/uuRdXtQTiak
 ykkQ==
X-Gm-Message-State: AOAM5339ePfqOUD0Ud1gFaG3urNr9TdOFeJtNdMYh7CFbkqwPyvbC2tU
 Lpao9pslPEVsQZykf5Uo+UpLrQ==
X-Google-Smtp-Source: ABdhPJy6qJxJ8lRees7PAkjHN4lM1cwhzbiZJmx3wp7by094PXqPDiT6QTymt1lj7cT+q0VRg0zOkA==
X-Received: by 2002:a05:6a00:23c2:b029:24c:4748:4a80 with SMTP id
 g2-20020a056a0023c2b029024c47484a80mr1857979pfc.13.1619148764766; 
 Thu, 22 Apr 2021 20:32:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id e1sm3493455pgl.25.2021.04.22.20.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 20:32:44 -0700 (PDT)
Date: Thu, 22 Apr 2021 20:32:44 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Apr 2021 20:32:42 PDT (-0700)
Subject: Re: [RFC] dt-bindings: riscv: enum for riscv,isa
In-Reply-To: <5385012d-9f09-d7d9-7b6a-cef7de2d4056@gmx.de>
CC: robh+dt@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: xypron.glpk@gmx.de
Message-ID: <mhng-cec1febb-7da2-4d6e-9c38-3b1580b75e19@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_203245_457298_EFDC2D22 
X-CRM114-Status: GOOD (  13.25  )
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

On Tue, 06 Apr 2021 12:05:34 PDT (-0700), xypron.glpk@gmx.de wrote:
> In Documentation/devicetree/bindings/riscv/cpus.yaml I find for riscv,isa:
>
>      enum:
>        - rv64imac
>        - rv64imafdc
>
> This implies that 'rv64imafc' or 'rv64imafdqc' would be illegal values
> while these combinations of extensions would be compliant with "The
> RISC-V Instruction Set Manual".
>
> To me it does not make much sense to try to enumerate all permissible
> permutations of RISC-V extensions.
>
> Shouldn't this enum be removed and replaced by examples?

I'm generally OK with that, but I'm not sure how to do it: won't we fail 
the scheme checks if we don't have something defined for "riscv,isa"?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
