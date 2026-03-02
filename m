Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591BCE9B36A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3mcOD9s5b/0qnLSVME8KE8lwjmFQte44MMU1zrzyTJM=; b=V5Ech8vp8Pt6og
	1OOnfBTtVNb4sAxdSyWcWBKPH3eXx0uN2eQwMY4t0sTTwg7PVyzAhjANiSegqqrHk8zst0mj9DFAu
	lJtTIsUgnSbjx4fb1u2L4L/BFtSBk03wr+MkRIYI2VfDe5grmNizNkkBezNJjz/Vk38qRxsmrpggh
	19h562iXSpXQwyrJB0mV1VptidkE0xFxxRgIrZwaS3syaMpTwDojEubhRvU6XCTDB4ZvxyEn0y2zl
	qRLShvDD9sN8lpCC4Q50K3JX1zrSbIjoWQtT5wJvrrGbx3vhYDrEyubDW8lXVryVhOeNiY83exWUC
	mAlcDLbsc3B0fCxAb0Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Is-0000000CvRI-1gkd;
	Mon, 02 Mar 2026 12:23:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2Io-0000000CvQa-0gS3
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 12:23:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772454188;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FrnLTibfvtaQomZCj8lbE4/9KS67i2w3nIX7Xx6+g0k=;
	b=fymQkPgRy5ZPwmyInwXGohjTd3JU7o+lUnV4gmDQIbikkugHzCPoC8r5PXPCHCIu1btkn/
	BZF57snNqACAnFe9kw1rJIidHHQpErZF6mS1B9LzmJXBMgndc3MZcNNdMnZBISI7pARLEV
	R9ibU/o8YRHA7rNh4E/Ljqwu7oDyDPo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-ztlWy8qrN525rZd55Yixxg-1; Mon, 02 Mar 2026 07:23:05 -0500
X-MC-Unique: ztlWy8qrN525rZd55Yixxg-1
X-Mimecast-MFC-AGG-ID: ztlWy8qrN525rZd55Yixxg_1772454184
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4836e35292cso37295725e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 04:23:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772454184; x=1773058984;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrnLTibfvtaQomZCj8lbE4/9KS67i2w3nIX7Xx6+g0k=;
        b=hPJb+CND5g2HKwvavlhxVSqLQ9XFkukxd7RMvnwsZbmrCy6IKNgyjQ9Nw3NuR2V50e
         jdre76wGezWeBTFT6pGj5qSarrBKENJDz2CC7nW6sB3Ny3x3TiLZv0fW0EvXtxjw8HQ/
         bHeucNflcukAsTLikxlBIXbybAG77/viWoE9PPNAK4Y8JSlFqGwZrB7ujmEbaEATcdGX
         9hXx9qHuTF4JTtHazUMOKH7xKNGJeEq4gmZEv3ypIrjX8wxxniUEtXtIo1/4IlxFaaWM
         Ifg7gCSBZ+QWi7iSTdTeTAk7EIlyZ7Om17wGp7nd1cR8MK6xqgoPSa6hKUhtpyK4iI3h
         nDJA==
X-Forwarded-Encrypted: i=1; AJvYcCWwdv+eo/Ca0UUo8TGG23EPfPAv59NvL+EBJZIXkWsrrz8euJaV+LJmWa3cuqbEDKuhPKPrmtn+z3l7RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwoJs2AJhXSXxeWvMdV/LF6rBGMPh0qa+tvekhHk7Tr/aSUzB8G
	tojaTue6Vm9jcnkN5TiMszNVEvI/wMpTqP8Vb5bD6Qw0cFA60mStrY6OmgIJ4DgdWeEyqRbFfa6
	JpcIRPUx7JP+e6JZ7k4S688odkinObEd++u3KzCFHif5oleJsiOXXmcCyV0mb6kiK7Gf8Zw==
X-Gm-Gg: ATEYQzy2HznlESWG6YJJCviXUfetApwDCNROSCUIldcsD+skBJ8pGIVZsQPlkH+rl2A
	xPeE2WEQAFlXtmVhDq5kGFnCBsE4oXzlhFelVHDUoXmZZQfe2XlnQzjZDlPfaW6G3B1h6q7JwKu
	Ogieu4dPOpB6QEeue+CMrRwsN/xwMilqkaa13JnvtuA8O9mUvSofnbHriXVuxiZwq1qBkfC7XCf
	dj4Um7VfLEMfl45shYpmihOoR3QHADHQPFli+8QSBID6bcTcLsrWWKugr7B9NaETvvGJLZLzk7A
	Df661iMwrkeMcxp029zDnaoWTHaEMJGNH4e3pjAq0nabkx/03eN1nAcywU9acBLZX7yk0h8gdYd
	+fiI8TnkHaMXcaxWYOGPnyYreq7wya+pgGkpRn3D4h97iGNnG7rGNCbnxwOSAH7dppPGu6kyBpz
	GqpUT6
X-Received: by 2002:a05:600c:6994:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-483c9c0b88amr205633565e9.22.1772454183809;
        Mon, 02 Mar 2026 04:23:03 -0800 (PST)
X-Received: by 2002:a05:600c:6994:b0:477:c478:46d7 with SMTP id 5b1f17b1804b1-483c9c0b88amr205633105e9.22.1772454183415;
        Mon, 02 Mar 2026 04:23:03 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcd0b14sm129147135e9.27.2026.03.02.04.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 04:23:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: adapt regulator node name to
 preferred form
In-Reply-To: <20260302114257-GKA289813@kernel.org>
References: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
 <87o6l6vd7l.fsf@ocarina.mail-host-address-is-not-set>
 <20260302114257-GKA289813@kernel.org>
Date: Mon, 02 Mar 2026 13:23:01 +0100
Message-ID: <87ikbev2sa.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JYcWrCgSbslj_VRDiTipzSi5Z-r5aubRxsi8E_LvfrU_1772454184
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_042310_273888_05A4F672 
X-CRM114-Status: GOOD (  16.99  )
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

Yixun Lan <dlan@kernel.org> writes:

> Hi Javier,
>
> On 09:37 Mon 02 Mar     , Javier Martinez Canillas wrote:
>> Yixun Lan <dlan@kernel.org> writes:
>> 
>> > The preferred node name for fixed-regulators has changed to pattern [1]:
>> >  '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'
>> >
>> > Adjust all SpacemiT DT regulator node names to fix this.
>> >
>> > Link: https://lore.kernel.org/r/20240426215147.3138211-1-robh@kernel.org [1]
>> > Signed-off-by: Yixun Lan <dlan@kernel.org>
>> > ---
>> > In Review of adding DTS for OrangePi, Chukun mentioned fixed-regulator
>> > has preferred node names [1], so let's change it now.
>> >
>> > This isn't strictly a bug, so I've not added the Fixes tag.
>> >
>> > Link: https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn [1]
>> > ---
>> >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 10 +++++-----
>> >  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
>> >  2 files changed, 7 insertions(+), 7 deletions(-)
>> >
>> 
>> Looks good to me.
>> 
>> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
>> 
> A little bit late, I just picked this patch, but I can amend the commit to
> add your R-b, thanks!
>

No worries, Learned about this new convention from your patch and links, thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
