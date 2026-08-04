Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A911AC55184
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 03:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4y3wZFHKwmCbWmvnCcvA9/dU27chPeRdad30DTpEdSU=; b=H8yKKQJ0CapNV8
	MVa+sOBwsUWfzO+ER2bRhviw+GRmNjUCRQygrwyWQDEojl2v0QauBpkkaHbwjRyih9vcqP8v99IHx
	Z0vsb7EbJvM3Ixdk83jjid74BTv7c7jaYT+TU437x2pIXzZXLeltNOADhA7RTL4V1LR6wgyb+9J38
	vkexDO+SaMU8rIeZqUcX5gylfibKc2vX1+LCSLL/3A5gqNOFfQTOl2+N80qdvNPJP1sA5ChJ5TN/u
	PJIsc+pz58IMnGmcmACuzc2P/lvm4F74MQAdTL847e7xjM92fSZEwSCMNPzjmqEpcJ78KWbzX/vFK
	bcAXAs7yI2yIVd5nlq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr62J-00000000wR8-1ZB0;
	Tue, 04 Aug 2026 03:41:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr62H-00000000wQY-0bso
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 03:41:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2d049069377so34957715ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 20:41:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785814908; cv=none;
        d=google.com; s=arc-20260327;
        b=a2KNEi5F6FSPW8aZC6H1dksnd0uLM3mQpnlnVpmK8vdydT9eoOC4M0OvV2O3njpysV
         AADKVaPOgg9vb+47OCADTjy1CkA15Bs0qEW4K/kz14QLYSxE/BHCGf9YH/uG01mo+YSg
         AZ7Dayo1bgDvSF9hxYFZnRi97Dp7wV1Cioy1mM/bnJta1Xze0LkbRRzQN9bj4Uxxp7Uc
         0ZIFxLcmrzh448lGm309NKMODrfY0lhYO+ma6vBUQs/056wwweqeqsYyGV7Jy1Ps34fX
         hV/ohC6gFfn5UPhU9zzehYYyFFNZIB80X2kttrjOuZHW4OQ4kGEbOZ3Vouf+9VJgTh8R
         rOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        fh=cSZ8gRMOp2GfiGzNoSHHQ1q6jUAVBptmEeZYhnjo+A4=;
        b=LtoF1/PrnpW3xU3HBFI4fUmcSvSngV5bB+4zmUvmNjHr5DZCyK17VKG+dK2IOTA88q
         h2Brt/2YLzDWqjHUz5iHPWwqSDRMe3x5ZHYCNfWRBc83ZkLG2N5UvNt7KtIU4/Z0sJfX
         T7x5wk+U8A2qxwGnUxfZMDpiqFe13hiZ3ilJi7XL/OIYkNbtcPAbRIWdaka1wIeWJgXc
         ZyTOUnGgE/MErouTjDdjegTPiD+CuH6fT5H2CzTqAFHCaTFP4ZyCgWveH/liBUtdiF9K
         w8X250Ck2gyIDnWhqDE0fYoLaIPd0DwljDHLfLaZ+AIIg49f71XwcgMGTgQARzLcVlir
         kBaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785814908; x=1786419708; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        b=bV8A0s6jfSWt30JRIL9GW8JqFupKgylT7pVt3lZnSkuQKhfaVNTJipIhyshVaOm8Ct
         CulnwRgDhSNkQRJlKWzsiCl7hVJ4/PoWCygzf8xwT+wwuevJmypyHS1xxUSQTXy6dRNy
         Qu8Fuid4MVKZsE7z9U5KZxwZwodb6fuFyLfCkcJj2mKe3en/nrj/mVFMVLm7KKDAsv0V
         bnTvuIjnzgU7yV/wEgGuH4Ily7u6rGzDU0uBeRIAfPAVRIzWGKdMsdrpvOoB475bFgBe
         iKqrScnoRAnHIFBlhVem8H2ElZxV+FlKotPzR1sY/tn5Z0EG9l2s0YER9Tn4SDcEniB6
         DrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785814908; x=1786419708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dHJdFWR6LaqfTnhSURUXcfTBvCZBNCAuZVufORAObbU=;
        b=ERiBVCjs6cNR+MdOQjaMgL6kaWHvSxMDWh3RQid4ydLl7i91V6DdLnKceVU6cJInHc
         2CYpdH+CADoJp8QWBYhFKYngZFXTB2MGZw1sBNKPHoitlDC0+HsrWgzNFws6884jJ9WK
         LijobEy8ZePpyPDz0BZm3cuJXQS6mWAUrqZMVw1DZtkusMquWNbIC/3SdrlhLf+lILgr
         Xcq6c4IEUGYJIbYQLrkV8fEAIIYTWuqKczEY5D8SUWLmkT4Lm6UIpdOcNEL+tzpmrCsQ
         BfdoidQZmHvd6nW0akDJXLthqM3luylin7Y0hWiO0T4ODhVPSd/0dNj1NI6ZBQY3YUAX
         fvwg==
X-Forwarded-Encrypted: i=1; AHgh+Rojt9QKxUyl3k/kge9VkQK/s+QExfAdZ8gTkq3jFioVWNz9zRhgk52yVoaXZAitMf/c2es06WfwJuNZ7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHmM0imGHDpy6IgI/7GU+AI93JnDlL5cSYlZO6eOxw85xxEERW
	6QTkBfCT9QalcAId9jFKF8G/hwHGc3R4wOallf0fFhTW+jIf07R7HSOxDzRPBinZZeRDGfAeQ8k
	pVp8oXpA/07yT3Q9kjHZUWjFk6vGDMEw=
X-Gm-Gg: AR+sD11X215f5MCMf/HUbBVECsdmbjG9DTKHW5TcmyAtFeOM9/eL4fbghoy4yii6Ph1
	j1wtWt8hpQS3oPH+HHSAMaE9XxMGGizLz6PxuWHnFc8quHGbl6g7qI3kHzWMGV4v+fQlFNGx7At
	ZAL1qQzLjQBhcD8++j9nCEj1tZK1bWMyLxY8UO4JfqJVmmIAKyE9FXNcAYxqtVxmtzctVgzldSg
	6eKO8ng8tGoWZKR8bgxPLGz8fjEDQIMYDMDIGj3X/Tp4lSWblzWxJt0CjZxCPzUwJ9WSqmf91dO
	BNU9uLDIM3ljtZ0ZJgWQJV5vYvA+qmSomlP4jDYQdqPMR4gjmqkjpPsObCkCpF5ftQPTrBMH7eh
	Tui0DxNTsoptx7gFY7aNoCRMcVlxxpr2XTvyytPRYU5d/ouDro/KNQWRt
X-Received: by 2002:a17:903:37c8:b0:2b2:67ca:5ff9 with SMTP id
 d9443c01a7336-2d051efd46amr123451215ad.0.1785814908348; Mon, 03 Aug 2026
 20:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
 <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com> <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
In-Reply-To: <DKF3ONLMSCC7.23CTHB22RU044@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 10:41:36 +0700
X-Gm-Features: AUfX_my_ZTitbKpIGPjAOMpa4lAbJZAoEqlQiMARrsgDTH0HTjCNWq0y94hxl8c
Message-ID: <CAABR9nHZgDvNBTT=uKO36+ExC5ozi7mWbS2J-3MxhN4GctpYHw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_204149_187121_BBF05330 
X-CRM114-Status: GOOD (  12.06  )
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

Hi Troy,

Thanks for the clarification.

> Nice catch. Please follow the Rockchip approach: keep the static
> spacemit_i2s_dai minimal and initialize the playback and capture fields
> conditionally in spacemit_i2s_init_dai().
>
> Simply removing the assignments from spacemit_i2s_init_dai() would leave
> channels_min nonzero for both directions in the static template.
> snd_soc_dai_stream_valid() treats a direction with a nonzero channels_min
> as supported, so the driver would continue advertising capture even for
> a device with only a "tx" DMA. The binding permits such a configuration.
>
> Please preserve rate_min and rate_max when moving the capability fields,
> and send this change as a separate patch.
>

I'll follow the Rockchip approach and send a separate patch.

Best regards,
Phuc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
