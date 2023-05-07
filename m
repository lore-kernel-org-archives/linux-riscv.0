Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A902EC77B75
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 15:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j1DjcXLJI16aYxR092f4ApLYean5Qe8UQhm0MDS0AXk=; b=WXLP8D0XhHms6l
	+huUWLOi5NGVha8S+DLStPZvEbD+HdegJCmy/XpyDgl3YSsiHjmuCpx2Kzx2SeftQsojV32I0VlV5
	6YYEmlhgsLSu2VwUc1q+QQYOLGq1ZvIPE8mDFwB9dTeT3YwH5CDQLm8jEakF4xp0En0Mg7lzrZUxK
	AyBF1oH1fGhiM3o8rGP9j4JO8HRsecNYTVJcqB9GqAUOxRaZWHqMoa9GqVlZ3M6kv6OGyPWaFAkOW
	iSJ9JGUKj9CIArBPDV/ckWuzTn0jKc2yh6T0/svnVqSsitFL7jPPaQ/fx3vCJM+nqlN5/GKeV0735
	GQPtWfziVmgAMqkuZ8RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvg1T-00GGlX-10;
	Sun, 07 May 2023 15:10:03 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvg1Q-00GGjx-0r;
	Sun, 07 May 2023 15:10:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-966400ee79aso120583166b.0;
        Sun, 07 May 2023 08:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683472198; x=1686064198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6k7of+oD7aUsR3ZuT5Ha6yGbmcWNRVYGMihlsEz0Xhg=;
        b=cN8WCKzL3z0UDeYh32zhcfq6BPnbBq/473XGNaamAepsq0ySGTjyRZYn8xTBDG2mrx
         QYm9QwRYg8Z85CR6gGPTGK4GULfL8f+pKD68yRYQdXIAGUV3LBBHTnfMYJ8nYBT4jzVU
         Kn9p81vKiVi6kP10iYxs+NageUXik6ESyKb5ARp1JRLGmPNGA49Sd+KTCRZvAdso4I/f
         mKl6RD5w6Af+0s1ur//68pdNLm94Ol78n13MZ6N1Get+dRZGYcgDpqnGSWYnldDkRTnh
         fZkeXR5FGvujWH1pM8KZkj3kxKQWmSeIJMIfQgHkiDteGeqvZO31cZlUcdMTWKnGAx+i
         F5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683472198; x=1686064198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k7of+oD7aUsR3ZuT5Ha6yGbmcWNRVYGMihlsEz0Xhg=;
        b=Ev/DisJ3tzlqrzJDJzHqgKIB2Du+wKUDbcx8gqMFX6VjDTjD+bj3usFZuq9ruN2X//
         +zPpOTqJ6gnQ8SBPbwyvorzjKydGhVv6+bVjMolML9Xm8WVmX7hR+7H9OvgWy5z5U4DE
         FmGAUOkWYixi4FUXYDFMYyjyBs5jrw6jgpx3hDst/ZpWk42/2zm2BhcTyX9CWHs6b3Er
         g+ZdO1ek4qEtQ4ENqZiSNTGifDvrsM63farWu7EDu1v2ScoV9/4bk0rkLX4z1IiR2ZTJ
         fAGMDDRoKoG723UMk+BelJoH57ZaUH86EAoDfbwiLSAoABaZLFn6jupfSyxhyVR2wb6w
         aIdg==
X-Gm-Message-State: AC+VfDwvERFzzK4pPmjYmocuvFhxXtXwD6K8bz1Su0EyNW/KiUxoL+Lo
	Qcki7ttX4Btu+1Mvt9RIOgyGdHaqNckr/pfyZ60=
X-Google-Smtp-Source: ACHHUZ6+VFC93AW7h4sZdYiyaPqZUGGXGfe8vKSCHC7hQOOltYg0zJcH53vc/h7kUSkTyJjHMOz1gnBQknP7XOjm+v4=
X-Received: by 2002:a17:906:7955:b0:94f:9f76:c74f with SMTP id
 l21-20020a170906795500b0094f9f76c74fmr7323137ejo.52.1683472197958; Sun, 07
 May 2023 08:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
 <20230506232616.1792109-4-bigunclemax@gmail.com> <20230507105150.31643b87@slackpad.lan>
In-Reply-To: <20230507105150.31643b87@slackpad.lan>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Sun, 7 May 2023 18:09:45 +0300
Message-ID: <CALHCpMgxsLzRF0FfazMXYiWK1fV99dbxYNDvoj+a0S-RvZP9Hg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] spi: sun6i: add quirk for in-controller clock divider
To: Andre Przywara <andre.przywara@arm.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_081000_302236_A078D1CC 
X-CRM114-Status: UNSURE (   8.12  )
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

> This case assumes that the SDM bit is zero already. I think just
> masking both bits off above, right after the read, is the easiest, then
> you can also lose the else branch below entirely.

Thanks for this remark. I fixed it in the next revision.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
