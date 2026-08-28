Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D5C61DB9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2026 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tOsTQxL6/1erPkcvL0hyvBXGMeGIUWm+aUVK0o3KTaY=; b=ZtNK1FFi6duNlF
	7zxOOvwsS+0ri4libcBg6bPE/bx5TJqRavzLKUx2SuNnzUR1NE+w2Mdcc54h2yZ5jL+hHwlIo6/Fg
	HhviKFaRLtzZI+pqgJgo02wBROYyv4Jqmy0dgNoX3fI53YN2htceMKgUbefBJQja2BKiAIptK0PCc
	+sxd5yQrwPBOdZMAS8Ct2BKGARDc3PRqfci4Y6NEF1iMhacqBB3TQo3u2ZiWhjOiSNIv8J8uUzG1T
	ygPEke4Bkq79+5ZsVYvzRck6pcHA7+RQZelCZHQaYTaubnnrn5NlIrg8zQPHlG0GaVW/m3JAreaYL
	Xp6HNYx6tKLtSPtu1yug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwfP-00000005pOd-1ip2;
	Fri, 28 Aug 2026 13:30:47 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwfM-00000005pNV-2VaT
	for linux-riscv@lists.infradead.org;
	Fri, 28 Aug 2026 13:30:45 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5b4e6868276so124839e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2026 06:30:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787923842; cv=none;
        d=google.com; s=arc-20260327;
        b=mfkYKjzXmUiAsNNhzhSVy3IFUXikTBcnLfiDQs4khajcRKut9R5tIB+d5JUiAUmjEC
         BVoRhsNGgKuO0+vv20E34vaIyghY2OES8WeuvDymoAbsoHSxOfA5jlgkFv0C0C4OJSGB
         Er5BHyDZPZKUSPbrytHELD2xI+yB6Iv4r9w3i0boGFzH/lRTms/4czR7pU2M+9MNRS7l
         PuhcWZG2O3hx6qYtmy3XDa8FduQKf6sfROmI9NlpV0jKR78SuHVrYAYMU4vV901h1hNo
         12TvOYTL8a9WE2UpMQhUuv5mEOUXCPwjm/yFCo7Q9sQohUzwrc6nK/Kcpex71peEazkA
         bfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        fh=+JpYnegw+bTaUDMO7hWsf9WmPeioqi3E5lYta/mva3k=;
        b=W8A6y/UviMgsQzYxuJOvKaXsB/5YIMD2O1fNUnb9YeZnQzy/tsnIMKoTgcp7sdg9pM
         QgFEOGQed2nZADx9EeKCerwkK7FpJsFvoZn8BngkA05JJTN2IPsJfhRE7cOjZMoqsWfa
         b9WN8QNDPv1Pu+puwpy4ZDzAdDdPaVjbwjVEB/lPn63ni74rT0PHyHedg8uRwyqD3LXE
         P8pBupRswjjrpkAcZcRdqQKYbkRkF2e1ALYX4q45rD275Xbf8Sg47H6wzHLZ3HSUL+CF
         p94CxkN8Rea0wViu5b5ZPvq49FisqNIWCbhg2ZGGzD+lrDbArp9fmL1X4JHemSm9ija3
         oh5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787923842; x=1788528642; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=Y1nzycaBrrwKZ2DeQ2CdAlQ7HU1Y2DfhTHw4P+N5QI2iPsIY1xhdvnWRmva0EQpwOj
         5q8nqgyphodbt4hRbTWstMcscphU1lZG+IDP8sFSfofQkQ/7HSs7ElCAvJr45UfQpS7D
         67NJoAjrarD5DBCLgkF0KG6frNGLJceiQOMr/JeZThhE7JaB5BCIj4jzMFgo0gujJf57
         eeos+Tm8j8OZMDjGHr5Zdy6DbF5H7Dj8QUTgikpdxOqjfszAoZtWMQ/ZRY/JTXMBB5hZ
         AqX9AyZzu0EkBe9fL23juN7XTjnSGXOb4Msb+tcF8144BnjDsV69FT9iw5OLY83Cw22E
         drFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787923842; x=1788528642;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hok4GvjDE1nmTNyDoS3DTDjsSlvgrhNExm+F3J3GMLI=;
        b=I+THBKoneZ8eXpwKcLZSv+jOa9eAk6S4qAkEnhx8M3GZAGq8BpDjVhrfo03dwi1YfZ
         FKKFR8Lh+v6hB8u36ErNT3OVRg46E9XftJJKpsPAlUuQ+jOivFG1uscv2Ljz0w1k5UMw
         U7GFHYOY3h3UKuILxvZ5G/TCrCSLugwVzXCKkIjtITq0x+7iro7xfxuvHkiviUH5NOIT
         NbeRKdJ7txU25AIAvQ5A2wMev4sMcVoYTT8/uoAbk/XilZY1PYAPs0dGXNjgCf6pDoe+
         tTM+pCBsvu/iQhw+yL1OmAMclaA03jBPzErCL0GM/w6o0o8sVNl/vC9VlabcqLnc89eN
         QvZA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3vGRy77H2VNDjCWAXSe0T3kPCpB9pa83cnRChwUNSSaSPxgJ3UBC8feh/uyNh9rlBGSdnbj7vA+SWRA==@lists.infradead.org
X-Gm-Message-State: AFuF++mESyHcIMcIsj09NG+5UOzV0gzkbcutg6rg1FZk1hbq6ym+WCPi
	z3E2mLDJ0ezKrUNld5rhWjq6aKntgagGS6WJPDaull0yyBbVMngouSMQ4+a/MqNjGuEUwgdbB5I
	ytFMD+Jd4rL+DfqWSvxRsk+jhG2mWgH8=
X-Gm-Gg: AR+sD13GMsMLe53344y9KumUo2sJWLDbWuhj4EShffN4VKwFFlukfsIopVj9tOidz7I
	DpR8uWArsG84hxJDeuqgQzN2NKWODDbIhfBbJ7GyNZ07UjcQz7NaT4z8cpV3RkYdD1sYJhmEzmj
	E256fti7YrYLMjkNHEeYpTaXj+XqFyNbWTjl99iXukN/zQDiB1/L1fn+klRp2eYh3juggRj6Mdz
	ZBs7eNQFFjgBBjjxEDNDGbU8ZbDufVIvd0kQfMEHgv5MykoBXZ46yWM5iAX1J2saZwJWBhkpVFX
	p3UxoCPwfUJ2MB6twyRhAJN28vdwzSNjMGw9PGMiF1/jkR0Qm5zwopq1NwZAuKW1vN+IS2jeDYe
	o8EeuvYRpgVMfbBtkb3BkLwdFdDgw1CCfRAd+tw==
X-Received: by 2002:a05:6512:118a:b0:5b4:4c8a:abc1 with SMTP id
 2adb3069b0e04-5b5e6b35c5emr1180327e87.4.1787923842021; Fri, 28 Aug 2026
 06:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260803163427.74445-1-chenyou910331@gmail.com> <aokF9v3orE3nBz4D@inochi.infowork>
In-Reply-To: <aokF9v3orE3nBz4D@inochi.infowork>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 28 Aug 2026 21:30:30 +0800
X-Gm-Features: AcwNN1U3qtWfXakKgSZWrBm0x66_gbL--qvyFVM6YD3FiR8B948w7osQE2VTpfk
Message-ID: <CAKspUhKtnmmB3UmfqgXa1Ciq=qaqHCmdTYfYDa_X-4WJSQWmfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: sophgo: cv180x: Fix internal ephy node name
To: Inochi Amaoto <inochiama@gmail.com>
Cc: chen.wang@linux.dev, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>, 
	"Anton D. Stavinskii" <stavinsky@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:SOPHGO DEVICETREES and DRIVERS" <sophgo@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_063044_793701_E4D17C50 
X-CRM114-Status: UNSURE (   5.78  )
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

> Please send this with the same thread of PATCH 1. Otherwise, LGTM
>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

Understood -- 2/2 went out as its own thread by mistake. It will be
threaded properly in v2, and I will carry your Reviewed-by over.

Thanks,
Chen-Yu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
