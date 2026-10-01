Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17EEACA5FD4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVaBmhcUQT1FbIuhLr7yrZntH44XuQq4wwgXBC/I04Y=; b=jIE771gfrAAr+r
	vilCywOGeqzHZf70054sqUyoteX4IS6hsUFJW7RUCC8+gy36IndHHGhSg5XbMec5nakKi15X2AzzN
	22HO9Aw5WQFI5P7/HH9ejO4PkcUz1YK3jgSNQuQhDNrx/Pp3xX2jEtwUl9kNeaJ55R2MliiArZ9H9
	qK2tbAcoyxjWmX8F7yL3NqUjnb9ZWENNOG0mt2xbQvHLQJCl4mV8R0RBr/dAt5V5ZxNSROwPL0lFe
	a9pYC8dtSu65bHF9BBVCOfK4XkCcA7dyR+9o1g1PoS390uIvwCCngYHOg9fTWFldakKw/dwTzyHIN
	IQCMHLWB1LNvWoMbVteQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJL5-00000009ev3-3PdH;
	Thu, 01 Oct 2026 16:08:55 +0000
Received: from mail-vs2-x2a.google.com ([2a00:1450:4864:3a::2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJL2-00000009euP-0y9o
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 16:08:55 +0000
Received: by mail-vs2-x2a.google.com with SMTP id 71dfb90a1353d-5cdb9cb7feeso2445909e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 09:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870931; x=1791475731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Otf9/knLO98bfm0267xs+E0698DkiFYH19su1j8Mlag=;
        b=AW+GQbkEcJj4UBU7H/X9AmMwaAnYJ4xEIc5pfDM7pWnbI+K0Hzgtn/0fcmqWU4z2zB
         fuRZpjSiISA8cpFT8x9CrhULsUf6M7WTO/x8CZEEyIfkv1BiKX15lX0HMBuv52pB7X8z
         Q4euiIRmtjMVJTMMiXtvQNQk8iATBjXhyPKKHazr0cvT5EwhufuEZOTbLxQ2c1kpsMbc
         iPcVuwyuyOMn4ccf0M2qggbjvZa3C6c2AIGaqWerxd8utFG00TGHcsfedVQFA2JbCd0R
         Cx1JT7Pbz7+mFrBrygptajmrZnx89GUT9lPGM1KX+4Q3W1ZUdQybLqePa7m1XioK2Q0e
         /PFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870931; x=1791475731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Otf9/knLO98bfm0267xs+E0698DkiFYH19su1j8Mlag=;
        b=wSi1PzOMY9gT7yXX3PmuZ2gIjR9YnGXtcMgvHX6KeFMQ+dm7SOoJEM9sVrYkfEDik9
         juS/bP9I7lxpLDteknkOoPoueRaaVuBy9bxNZ3ySceEnIEHgpqbgNof5iAqfra1GwA2d
         AV5kXxbKHvY1BNgaymVR1PM3Ga8Q9XKREUYJ1v3s9pEpReSva8zSNGMESyzhgQGkOkFg
         oyctDoW32vUqxcCb3cfKXxbWzlhxZL80LDV6j5eGQm53UhY27+Vb797/RzkrpBG5F9jp
         6BGqm72WrfomJWLVpxZjzfzJslTTrQbnwCeWT2hzPJzQCfs1Lh5PlejKMAXyAnkuZ9x5
         NACA==
X-Forwarded-Encrypted: i=1; AKwUvBwqSRdp+AbJgmoMiU/VVQphtXekowysLnAnWmmMAezfUq0WjgB6sIYVZXbt6WF8VEPN86ZtXYrM61wRCQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYImqRnibf6lDjusyDxsHdZ+amYhRZo6UNDgGf4iK1ce9sqmqiHL
	RftNnWitdFTfF0Mae1eBKy5w71GDCEw5TArovEMTosRlnjYGZXpkOe+Tgc2IUc/LqXo=
X-Gm-Gg: AYBFou1Ra2U/+UJPGRJj4kkLqum54SxB8ZcKXVeq+JnL0nButAL4x5F+UN/1v5nXobJ
	4CCJiWu0JDjxhCnvmatDy0HkigmB+71a4AXfxOaNOV7c+CeUEosS0RqzkaYnkMJ/E90z4x3wTFL
	HBRyKXvN//WKK/s+1HcVBfBGe0/Oz+Kdsqy0fSDQoqKWLvTXELVomkIPwwhgEg/pW+/Yhp1Sym+
	Jqk1mMR1qinUAUanGSDlTxmr82a2j9eLamEAy7XOtCVWlKVPELm/YJIYxCdhbqHqlqrHAa3WLC6
	IsECjFQsHezdFwLxKxdV+yNrjHc73ZEe03n6aPKoiCSJOYhluWfnLQMkSGttZ5NuDT6HuwvzEZQ
	N0i1PIfBtYvxN8nIhYx6IZmY8bmmxm9NP4CI0grGbO7cYflIpwwvjSwGC3SbKU23wI5iE00mzFS
	R5JkkMv5UxYKaUc+BdkjEz5+YO9TbSNksOnIyvQJewsLHm9g97jdVngQnfE2fonZNPjnDBZ6acV
	09Iz+gNArdmDwSAgsQ6y6eZtniawmAp
X-Received: by 2002:a05:6122:551:b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5d67c10673fmr1731771e0c.14.1790870930920;
        Thu, 01 Oct 2026 09:08:50 -0700 (PDT)
Received: from hiagonb ([2804:14c:4c5:8bf0::ffae])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61f8fedesm170893e0c.9.2026.10.01.09.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:08:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:08:44 -0300
From: Hiago De Franco <hfranco@baylibre.com>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <chen.wang@linux.dev>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: dts: sophgo: cv1800b-milkv-duo: enable ethernet
Message-ID: <ar6E4bQAKonCW3st@hiagonb>
References: <20260930-milkv-duo-ethernet-v1-1-428ff137f5d3@baylibre.com>
 <20261001151447.12076-1-andrey.lalaev@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261001151447.12076-1-andrey.lalaev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090852_517878_0FBF107D 
X-CRM114-Status: GOOD (  12.10  )
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

Hi Andrei,

On Thu, Oct 01, 2026 at 05:14:47PM +0200, Andrei Lalaev wrote:
> Hi Hiago,
> 
> Please take a look at the patch [1] and the discussion.

Thanks for letting me know, I missed this patch. Do you happen to know
if any overlay was sent? I was not able to find one.

If none was sent, I am happy to send one. Sorry for all the noise here.

> 
> Thank you!
> 
> 1 - https://lore.kernel.org/sophgo/20260803163323.74414-1-chenyou910331@gmail.com/
> 
> Best regards,
> Andrei Lalaev

Best regards,
-- 
Hiago

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
