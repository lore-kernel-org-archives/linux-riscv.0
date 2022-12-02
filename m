Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44CF4C4321E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Dec 2022 12:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zog7AwZYLc+OBsSmFKkcuQlRplVf34eRNLPEWLj1ILM=; b=svIJxZfuK171iM
	eyhYRxqj5ebg8ImFNPkqxi/jXSFQjZNrArXd+Qicr6KdM+vSL8x924vHVBdtaG3VmTauDM/CUK4ni
	h0nDIOXQunKguIaIBdV6pIIJkLHEdJ5PPv3tUEVQecX7R/19vhDLdFotpyxtr87X5NatksC0cAYUP
	EidLpcRhCbxfiESATfMndVHFHF5TZzRIhDkN53DdNwygLEyouSUP/5p4Z4dhHaOmP70OPWpNEO2Yc
	UgKeDW8R61lbXMZo1SnXYLNi2WCm5pKELPW6cmupfj2S7GVc3VPtQh8AR2v0C7l0mgwplfNLRrq2u
	63d2tQDLRWjVOhh9QdsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14kO-00GAn3-Nz; Fri, 02 Dec 2022 12:02:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p14kM-00GAks-BN
	for linux-riscv@lists.infradead.org; Fri, 02 Dec 2022 12:02:27 +0000
Received: by mail-wm1-x336.google.com with SMTP id h4-20020a1c2104000000b003d0760654d3so4899085wmh.4
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 04:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RpJJe85twj+DqYyXL/s0dzOOxqTpU+8HJZNbE6nNAm4=;
        b=TbYqREFfKDudPtNNaQlBTIjpk3g1IQekqJ6OTobHF73WAJj2lgZYDazNHNpW5/lJTc
         K7HsdUExWrBtTiQZWZMbRA8gNeMmIhRBniPH26QtWveLG2Ry5RMKjsIaEeFytRq9MzTJ
         VVwkhFLy6xdgYxgUrDesxVU+bci/W/N6YZ8T3iJ1w6Q2BIZA3Vb03Hq7xISXOVGQJv+j
         L6NSqFgrSKhAScdvJsFapiCq6D3HfnHC3hxkNTJiXVmw+fb1pd7iisaXYPsg/OGIHqWo
         vM73UQiFfmjmzgJ8go3uUe2lDz/uibbBisez+HrGybwfBNQwffXdJ4CKGUGoD6fqFSqQ
         Rx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpJJe85twj+DqYyXL/s0dzOOxqTpU+8HJZNbE6nNAm4=;
        b=EzbIvhDk1L6s7kmUZK2ZxPx93Y2d9W+UgTzy7XrV36Lx1s3vORMntuh98+qAOACxyn
         K5eYV/EEsdzGRD0qYso+RvDQ+mg3cJksKpbfqDJO7ycfV3dapUUn39vfbuRLss4gzZMl
         /bjGQx5NhmwQ5h9UDCBlzyrlFF8jIJAPRNdl/JSLPsFM6Bj6q1zc0mB2+HKv/BjXe3nu
         9GVHZJQOfYxIT7ak08L3VA6j3OzA1gTzvFlvcssvzU8DTHi67nHOEm9wGZNARVQHBFtW
         PS9Kr1PXm9bcqFe1GuimzkjYia0AUlTWl0lc13sprIAP3QX9uAhW55JBrZJe9H/6yL2u
         Uy9A==
X-Gm-Message-State: ANoB5plhlVT4U+kTmiei6aVuZcyF9HzAh9oiXYu4Zz3FB/f3fiWxj06i
	ar7V40wZGrwh+MP5T0HE29G1QA==
X-Google-Smtp-Source: AA0mqf7uZ5EqVr2msuRIYwr+5h/ZK1uNqMYUI8ptWdTfMCCaWEAJwNXATh/9uyhoxowtKP2kxb/oIg==
X-Received: by 2002:a05:600c:4f12:b0:3cf:e7bd:303a with SMTP id l18-20020a05600c4f1200b003cfe7bd303amr40210209wmq.151.1669982543107;
        Fri, 02 Dec 2022 04:02:23 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id n3-20020a05600c3b8300b003cfbbd54178sm14256059wms.2.2022.12.02.04.02.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Dec 2022 04:02:22 -0800 (PST)
Message-ID: <9d0211d8-eefe-9464-940f-ac113ddbb0a7@linaro.org>
Date: Fri, 2 Dec 2022 13:02:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] Revert "clocksource/drivers/riscv: Events are stopped
 during CPU suspend"
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, tglx@linutronix.de
Cc: Conor Dooley <conor.dooley@microchip.com>, samuel@sholland.org,
 aou@eecs.berkeley.edu, atishp@atishpatra.org, dmitriy@oss-tech.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
References: <20221023185444.678573-1-conor@kernel.org>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20221023185444.678573-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_040226_505310_EEA1CD35 
X-CRM114-Status: UNSURE (   6.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjMvMTAvMjAyMiAyMDo1NCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IEZyb206IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gCj4gVGhpcyByZXZlcnRzIGNvbW1p
dCAyMzJjY2FjMWJkOWI1YmZlNzM4OTVmNTI3YzA4NjIzZTdmYTA3NTJkLgo+IElmIGFuIEFYSSBy
ZWFkIHRvIHRoZSBQQ0llIGNvbnRyb2xsZXIgb24gUG9sYXJGaXJlIFNvQyB0aW1lcyBvdXQsIHRo
ZQo+IHN5c3RlbSB3aWxsIHN0YWxsLCAKCkFwcGxpZWQsIHRoYW5rcwoKLS0gCjxodHRwOi8vd3d3
LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJN
IFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGlu
YXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVy
IHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
