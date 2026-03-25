Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48674106B533
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=daDvw7K6YZxNldKubYJqrxg4F72/x+PsGX9Nc1sxd4k=; b=IUW1Kpgprje+cZ
	9327GeJR7V3g5H1mcxDv5UnucZ0ihl1dJouwWn6y93jqISgsjRH/Gk1uup1vra97yaR0FarZw27YS
	MVHKaOFqpMREHyS2NDAxo6b8Qf+YNT9bZxWLGkzcqacN+gqvdmm9RQrusuLkcuGUd+zdFN4vPvlmT
	pqCV6Vhq62e9Uq7AGQBp1XrXYL/xy13EyA4YUZylRGEADdf110yOgxCDgNbIKc03J4ucQVjHdpNUJ
	2dbIEcuxXOmSY5WLojh16xRF7OVAz7CR8kBbYt88vW+e0KkGuQjWFXVX7Yk+Ed4+g4KDbYZZlW4TR
	cdW5uczW5a3a/pbSNpMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O9q-00000003S1R-3OO1;
	Wed, 25 Mar 2026 13:20:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O9n-00000003S0P-2C2s
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 13:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774444821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KRyCtRyiP2wwgn3R3NnCHPYbolki/Fqd18W5MnkvIrE=;
	b=Xhdmwi/iYh0GAn1nsV/kcPC/fmamov9YSJMLQIYEnGBHDh6Dc7mmtTIdpyFQnxTMjVEBD4
	c+Ha0bq3D2dJKsgWNwH573LWK0s+SiHsQ1spor1h+j3my2fWIwiFzZvRNqRhb6WRdKqzN0
	gVjzBjXQq+Q3LvflyW1NeI423T+G0rc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-fMlzukSCORyc4ztc4nC4MA-1; Wed, 25 Mar 2026 09:20:17 -0400
X-MC-Unique: fMlzukSCORyc4ztc4nC4MA-1
X-Mimecast-MFC-AGG-ID: fMlzukSCORyc4ztc4nC4MA_1774444816
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-439af7ba802so4825590f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Mar 2026 06:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444816; x=1775049616;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRyCtRyiP2wwgn3R3NnCHPYbolki/Fqd18W5MnkvIrE=;
        b=ndtn1yTkHiz3x1pk5b1bcqAqAOzSAspLO7cOqPGeTXR9goD2eGfeRtsY9C58awG5DO
         SnTtDLzMfeXoEGsm9CLB/mX0GvfIusu5aZ4zvu8tlkrZWNzw0G9JgJKQ+oS2ymu3/xud
         SGHi2DlAIN+8n21enVvHzW4OPJje0aV9PHGPTDTEqH3pERxgb5wblhAwwBw462vbA1sT
         Urs00VIVLBq66TOcREfUumBHFVPjsYbBq1dvNLaoqnAVZL135CFqXM6phAxqFSbrD7mg
         r65B2ih/UYObLhp/DjMtRJ/RfXsZPltWiSqKZWGePFD8ovTm8TeJxa7BZBHcI1i6AjEA
         JmBA==
X-Forwarded-Encrypted: i=1; AJvYcCUKPoa5sw3cOeBVIfDpB6LUNr+0NzW7HeB6Fji0M5xHITvS6fiQSShmKy1//fY5Nz7Y7dh+5ABr1LmD7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhZP8FEYp5YI3tB4Cwo13cbqxj3A4fHVMfhYyPCvLVexsKtuSo
	7dnrUGr3wToqU1FcRFqEIvSWfVQ46oUe/D1BzvdS4pc10WIyjtbEO1MZwq9rz3tHP1yA2CAw7fs
	3CTm6KpfaxBBLFm+XD1BWhf8c8sdhVyR6mLf+UIDgGW0VeLAXrGRBvrjjUQBU4Me04iijDg==
X-Gm-Gg: ATEYQzylXb8OkrsT3hcx3pWDctpt1j6MeDcMp8RXKsmfdh74dnNVFddaM3dqwLjeXOc
	mOBp8WVrU40OtYxpn1fC61Jgs5geoD20iUdGuJ7ZxMCCwVhi+YzAqry6yoVFLcIlpUwYGgx3CJD
	LLS3ahdtQGF8ZsTgIZxhlZ5OhyAds9zvoUvPD8FmInY228GJ7USvxjv5t4TOJciQr1h3dyt2fW7
	woLBAX8sLozsknK+tWHssasyyqHHej4le6z8AXRUKWJvaMMorsn7Yxi4zTKZSydDURV4koRNkgO
	ay6LEpwDSnsKr8ZZyk807MAM9xxSOgWWq6+ppme2oxv0OKDr3eFjY7Qlixr81C45eshJ/ZqZuPz
	2xEo62O3p5n0wD0sqqoRvUxEQy06YuQz3hbQqj2EF9M6z8wg8qTXNI++x4foUCugFGckAo/G0La
	jMIc+u
X-Received: by 2002:a05:6000:2dc6:b0:43b:6955:54c5 with SMTP id ffacd0b85a97d-43b889a872bmr5150951f8f.17.1774444815977;
        Wed, 25 Mar 2026 06:20:15 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc6:b0:43b:6955:54c5 with SMTP id ffacd0b85a97d-43b889a872bmr5150862f8f.17.1774444815376;
        Wed, 25 Mar 2026 06:20:15 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8567b2e2sm11278629f8f.33.2026.03.25.06.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:20:14 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: spacemit: k3: Add compatible
In-Reply-To: <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
References: <20260325-02-k3-i2c-v1-0-78f29c83d9ac@kernel.org>
 <20260325-02-k3-i2c-v1-1-78f29c83d9ac@kernel.org>
Date: Wed, 25 Mar 2026 14:20:13 +0100
Message-ID: <87zf3w6o6q.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: szA9vVt9cAjmLOxWR2-_YhP91QEZS22jwlPwOJ1-cxo_1774444816
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_062023_633760_32A72524 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Yixun Lan <dlan@kernel.org> writes:

> Add a compatible string for the I2C controller found in SpacemiT K3 SoC
> which use same I2C IP as K1, so make it fallback to K1 compatible.
>

If is the same IP as K1, shouldn't the "spacemit,k1-i2c" compatible be
used in the k3.dtsi instead? My understanding is that this is the meaning
of compatible, and there's no need to add another compatible string for k3.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
