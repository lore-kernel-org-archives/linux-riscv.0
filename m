Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2BFCCF9E0
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 14:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDiNV+OcFDPsY4h2fyplQmfh4Aj/4J0sMwM4Hh7ZKUc=; b=tgucboh1YKmbtq
	F9ORrhg7TM32QizeTBN24yEKlGnAZYQyqrKXUoAtikzF7iF/7Xjv2g/54LQjAFlqD+Hshg7C7sSEC
	xkaol/3sAJXCXgON5q7pBhvIz6EOsQyELMFgdH65TT3VCfX43Gkxz60Ti5maREk8Rgu21E+HbpHh2
	v4vVcuocSibJ0lUQO7QJWluV5+2SwFGY1uhpCo3Bjruax8Z+Yogf4fqps8df2TOrPsYlP9nPADyFg
	FyeQG47sF0QCm6On7um4ZsAGQokcg6IGldqum+678UYRBcoyL/H7LThu3b8GyV2F/00S7ZQaxLMIR
	zQpXMKAcFJCGvDRyGNQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIYG-00000009dEx-2L7n;
	Fri, 24 Oct 2025 14:13:56 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCIYE-00000009dD9-0AhI
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 14:13:55 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-428564f8d16so1165883f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761315232; x=1761920032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVsA5NUMk7Er151JpLhnqPMBBeiJc/C7dvaqVJvIrmc=;
        b=zCXzRiZ0MOCPUzkRywF6tN/P8AapsHdtZUoO0+cH8BlAzt1pWr+kSMww1jQTZG2XWz
         kJ+PsK0VXfV8jwUsmWF1yN4QlCgoumKM33by6TzaNFG/YtQmPBAEXLKmoMoQaiGkewbx
         Xx7N+bhBLVF15AocNpXDJ2WRJcJpbctui/dr6PLsb+xxxnHTRSMJAE3hJHYCMp9RZhEf
         G/oc4DvBcEQkdIuCSDSFAmUsKyFjdmtuW/srcDj1uPXMe5FIdbR3rem3vorTo2Xaoy92
         REXWtI4IjmYlrdGE5jQ796/zTkozoONZ1NWx/o9JualVbCCZnOqEkczKuzrpXziQNbiY
         k4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761315232; x=1761920032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVsA5NUMk7Er151JpLhnqPMBBeiJc/C7dvaqVJvIrmc=;
        b=PeIAbeo0tnz7hTbOuFfw0GD3uCWvgdmDoLwrRua/4BKYWmrVnUVoG9+vC3O7gSZayb
         gBW3S9MOA7dCUCPtl0xRE0lDjsRDTwTRJadyEIEhi0NottvRREsFtlM0z+ZuHtYllQ1M
         x2MCuCSi1ZITIjVX8JE3lts6T9Iy9u00WAW1OXnXh5OVffeJCwSDnmt30fDbBhX6+SJ8
         LuuTlfnIADQ73AIhI5t5nwHA3TyUGskwe+UFE2ZamwhOVPo4UkvqCdD4dXLtGaJAXuIT
         DsNSoauaSWhvFpAs4ack6QuD1UsjJUR/YmjnLuYUOKSl1LYmgfpa/CqcwpbHUY10h8LI
         C5vA==
X-Forwarded-Encrypted: i=1; AJvYcCUs3OXrBMheIFx8p9tv7JYaJUvfr82UEYSO43ehreJKEb1JYJUm246NYEzYEiKLLOmTmfG9vB181HHNHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRUTi4imZniBRGeg2NBbluxlIxadBIk6PSfmtI8fHggYZDOPb0
	n+YJacGfVsHZ8asE5P+FYKLPOHgGCdkY0Smbe3ecxKi2wFcpMm5TVo9b6r/8hDjkwCg=
X-Gm-Gg: ASbGnctCZTMr7A1MhM8lY25ITb+wWpAKL26Pj5mu4GZ2rppecaDahbRmpe3OaRCGy4T
	enQSJEIWxxSfkc+CcPumh/rlQGOdh/dI5/4ECgtVh3D69Wy8mHfeViO5SHjpY/VA93ALqAktYi+
	lmhJ330PApWTS7IK4D+ON1Ui9mPMW7B6y6nqFVuZ3cM7K1Spxeng+2pMV4FKCi8bnsmpT0q7Hcf
	baKkqmjUUn6avHcs6XStvgnOzHwhZTqKI1JoZpYqXakzYHKfWrwpRok9OQTxA7CwQ94+8g6Amgg
	mRYe8tUsToM0vrSq/vyH2ecJFDpWn5QGvowzH+TCd1GhB3LHpSF5yX1FcruS21vgVKsGyYp/aMN
	EQeOOpQd8dhfk7I3KMck8dUK48j0YuC5VpM4+JJS18OF7ISk8sDBhZkyIo1M9XkeKa0YTSYcAZf
	mx6PfUS0QtYgMJ1Y97
X-Google-Smtp-Source: AGHT+IGOwSSq4cPlqfVI2+cQc4DNxAbP8ipcdaug6FB/HIUIzgkN8w1ERIrzCxdii8Zp8hIOBEEMaQ==
X-Received: by 2002:a05:6000:2912:b0:3e8:f67:894f with SMTP id ffacd0b85a97d-4298f582512mr2780216f8f.26.1761315231940;
        Fri, 24 Oct 2025 07:13:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4298b996aaasm7851320f8f.3.2025.10.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:13:51 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:13:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yixun Lan <dlan@gentoo.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: spacemit: add failure check for
 spacemit_i2s_init_dai()
Message-ID: <aPuJnJIeupM1PV09@stanley.mountain>
References: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_071354_111888_0E1763B1 
X-CRM114-Status: UNSURE (   9.35  )
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

On Fri, Oct 24, 2025 at 09:11:01PM +0800, Troy Mitchell wrote:
> Add error handling when memory allocation for dai fails in
> spacemit_i2s_init_dai() call.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Dan reported here [1].
> 
> Link: https://lore.kernel.org/all/aPtiNCZ_KBezL2Dr@stanley.mountain/#t [1]

Thanks, Troy

Normally we would say this needs a Fixes tag and the Link: should be a
Closes: tag.  It would be easy to make the argument that the
allocation won't fail in real life so a Fixes tag isn't appropriate.  But
actually it's simpler to add the tag...

regards,
dan carpenter



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
