Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC14106F2E2
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 07:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pUU3zFp3IWsftw+CFfz9+HveLmBT+o2Gr3bzBDHBTWQ=; b=sBZxvr+LYmtAEm
	5PjGmxumMVQUgptlkZwmC9a+WJzofkJmxklP3De81UD0YvMTArBM6RjPTFtzhKMzchp/4Hu+EIqXq
	j2BhHyeWVI0F6XigJzqglogiglu7f502zi++Wr6+SXF8l9gtwBivsd0B006fNTS41GMEDsOqu1ewN
	mheq4iJkEJ3o4u8j7ei+xvmRl4DtrrfDegGkEg/RK/x3pR57lD+wMJM8TmscVHWa2a6R3wyEJpmyb
	ngKFO++ioJmFpJcoZ8F2f2BwhNKq9NUNo0yi9LShkzjTqjPr4MV1dz1ESPbJfGbTIsHOw5a7ED1Oa
	mD3pRYRpsrXlhFxnoR4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fRE-00000004xKQ-20QX;
	Thu, 26 Mar 2026 07:47:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fRB-00000004xK4-2DcF
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 07:47:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774511247;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8jsqEMVBo618iREZvKPp9ckkBj0Js5bgevHsPaD2c9U=;
	b=OTlQB8lyqYiPtmwramwqWPJa8xnfXgCV9GIvYY7FXLhVQQv6VATiLjSILW5ukBbETj7LaQ
	ngmKrLR+CtaVxpTNtfAaLpeu2Hs5eGPg+y5r9/9jTY1UPxFsMAdqBND3uBSD/k+EHnrvN0
	/b7ZEMDKbJHS7HMjqdQoPQQABN4kpdw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-ww0h0-seOE2oomWv0OaIVA-1; Thu, 26 Mar 2026 03:47:26 -0400
X-MC-Unique: ww0h0-seOE2oomWv0OaIVA-1
X-Mimecast-MFC-AGG-ID: ww0h0-seOE2oomWv0OaIVA_1774511245
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4362197d1easo404115f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 00:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511245; x=1775116045;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8jsqEMVBo618iREZvKPp9ckkBj0Js5bgevHsPaD2c9U=;
        b=cVFCMC/Udr3675bjTmcSqsOVon4j7mNOTwdHevRlSC2674VVljo09Z47mJqeB0Suib
         EPP5x6gdS1Jtu2HCj5g1e16Mw80GOWZedyo7SgdOWBymdZyWlIsZ7fs6mAzUsxz8Hjxr
         M1BS4n5fKhprKRTxAkwt7yvj+KG51Mw/K/C0PikY20YTVPjoEm2RYhyqOZF3mWlgEURJ
         EIuHnpLyg2FRNpfDTmQZFE1OamoULieyloQl9BqSrkTIV4eWnGqysqVzNLzRMYRm7UBy
         qtIK2U1UEOjds8YXOeCSyXWke89C+LHlTRUUrxGNbM7vQOnxViq+VKy2MEX7o07jcL45
         k9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5UmUJDH9EMy3/I1vLUr0cERL10TY8N+aUcX3uEdOxyHe3ZL4o36WKzCKJBu1aej+GIS2lFMOeKCIjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YybjyvzgTBp+TEgZcIErijRPfvaHOzXR8JiH+vEzLj5Z3Kg0y3n
	NA2zXy78fU3Ak6YEwCjgKdnBRBfuzMwr96kZhNp4Dxo+RX2a7pKroFIlRC2JCRQOooYVv0LLN6D
	+oSn9xwM5nA+cgKBHz3MuG5EmsYfLKJybqNAhwI2XKlBAWzQjEHYG5DlCidRHIlubgqef1w==
X-Gm-Gg: ATEYQzzvHu0tOQyt33WIGtKjSeLyUHBL4WzLL46JCDvTxUvVAr+DIWPeBTaf0GCpyhE
	sFIMcJ48v+Bajb460NVM+2q7dJ9T6AwMBIcTbEEWa3h/u9TUnN2OcpBQnC9mdFxQ90ErXLU6eEs
	NWNXJbRpOrt0yDwe4x8ehME59+FAoKUI1sk0aGwAu3ZkRumpprJLGA8z6gEaGu2/iWornWzs++7
	scVMMqk4x8gaU+Iy2s+tMiomAI0h8aHVsZGLjfYEEkikOam+X1J24fM1bR31a9Xr4LvEqEK7nJk
	55Zk5ni3uxH60/xkYSXfZ0V0fEF93kmzAHRsRKJ+nT9lv9sBqYaxkrpLtlONQQzf+JoOykGNybZ
	qj0BcjadhxMd7QL3f/6wxbWh1WR2Xel0zZDW94Yk8p5rw3Wl+Vbd0c3y5fz/Cxmq+USV2FewgK+
	MI8EGd
X-Received: by 2002:a05:6000:4312:b0:43b:54c9:85f4 with SMTP id ffacd0b85a97d-43b88a8ee05mr9887129f8f.39.1774511244665;
        Thu, 26 Mar 2026 00:47:24 -0700 (PDT)
X-Received: by 2002:a05:6000:4312:b0:43b:54c9:85f4 with SMTP id ffacd0b85a97d-43b88a8ee05mr9887076f8f.39.1774511244195;
        Thu, 26 Mar 2026 00:47:24 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e722dsm5509708f8f.35.2026.03.26.00.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:47:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Conor Dooley <conor@kernel.org>
Cc: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
In-Reply-To: <20260325-thinning-apricot-c156914803d6@spud>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
 <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
 <20260325-thinning-apricot-c156914803d6@spud>
Date: Thu, 26 Mar 2026 08:47:22 +0100
Message-ID: <87wlyz6nhx.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fQdraV9kKYWaEk_TWaA5fOf7DGyC0YnN0dhIS9lC-RU_1774511245
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_004729_648383_333D5D74 
X-CRM114-Status: GOOD (  14.40  )
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

Conor Dooley <conor@kernel.org> writes:

Hello Conor,

> On Wed, Mar 25, 2026 at 02:20:13PM +0100, Javier Martinez Canillas wrote:
>> Yixun Lan <dlan@kernel.org> writes:
>> 
>> > Add a compatible string for the I2C controller found in SpacemiT K3 SoC
>> > which use same I2C IP as K1, so make it fallback to K1 compatible.
>> >
>> 
>> If is the same IP as K1, shouldn't the "spacemit,k1-i2c" compatible be
>> used in the k3.dtsi instead? My understanding is that this is the meaning
>> of compatible, and there's no need to add another compatible string for k3.
>
> Your understanding is incorrect! What Yixun has done here is what we
> want people to do, because even if the IP is the same there can be
> differences due to integration that are problematic. Having a device
> specific compatible allows us to handle these kinds of problems if they
> crop up in the future.

Thanks for the clarification! It seems the convention changed over the
years then.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
