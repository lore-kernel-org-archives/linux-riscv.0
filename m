Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24543C55162
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 04:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P78GlTfTj4JQeL/Em/dFXO8N2tapCxxOsMCu9RdxTVw=; b=oduboN6Zbf84Ui
	YnJfRnX2oe2GuyllvMnB+NMTGCrWIRL9+1yfFTLABRXUnu8a9vhZLyqndu9Lje2RHaJxJcArpwjs4
	VewekXzKezCdJUOXrtA82nLWHzoYqlzsb9IZjZ0VX0KKGcDuTGYRMgSOWft2ZwvLEPBZbXsjcI6ec
	bld05McMjCBAouFA1TQr+chTPv/uFSPlCm6A+HCHz+QfLGeN1KYVGkgtA1SXhjWpSDj2PpiCkuZ6Q
	+vCHgBV/Cju6Tkb0uJNu/F9C/N6v1MbgB7VsQ8nwbJxS+O8nPnEsoK3dSW5A2eqhYsNRsd2L/pyFL
	8Go5YV7GfFjftP0faKtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjy1-0000000GHNf-2dS7;
	Mon, 03 Aug 2026 04:07:57 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqjxy-0000000GHNG-3ckB
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 04:07:55 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2837672a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 02 Aug 2026 21:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785730074; cv=none;
        d=google.com; s=arc-20260327;
        b=qe167wQm/UmwbFz7SHwpOFMwVZ5LH0XZg3k1oXNVhiwBH77Viqwb0PAIWNjcPG8hMd
         7zEGb8egVLrnhY0xRjjl2vTGW0sZU4NKNS5EBYn04mhB7QzRayIH0n2nv3p+E8yNwvnH
         2REUlWeiL1vXpw1JxMvuXqPLla65TWGnxaxQb/WmvJpXj5TGOTUyX5iqBCYA5eDpBIjG
         qq4/Li8Uyy8EAHcXM61bRAcPmOn/G5P2ZXpW4wtyU7IAltesY8U4FXgkVx56jWIN7Ssx
         7oBnmPDyknUVo5krnG1tVmUsflzH8d1Mv5DIcEDG4REFdhd/KeKR2qZMAhvBZwr2qI4F
         po3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        fh=Bre0EX3ye+FdXaic4Tkf2VSRubHfYsqaG+MBvqzLY1k=;
        b=TfFM7LaiJMelnPdM1ybQZGVCWue9jfaRZMo1/Sf9pNDJ4at6ZOem1ndwSLmVZhtkiP
         2RJDmOVsE0BN4OJ5edY1obknx+t+ZchWRruD9EkWfpRVzIDa+Ite1TWxlrA2Txv2uH1C
         UxcXsEUfKDw6CGeDbP1SCD+PhqxbHG9gxsYrvzEQBio3LJbz4DGJKaxxyiRs0JDkFAdT
         /aqDaw0k6+g3gk+PQKK17Wiz7Za0lJv/XkzoRdNSQlkA++Mks/9DNgf0IJ4yZANjLxK6
         7qCbb4SMLPXzcJ4+woXmy+Z3Zrmf93ujXNETPQYIoZQFvpyr9UNHFi8ppt5USqfscxyv
         7sAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785730074; x=1786334874; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        b=YnkZACGFt3AelHTGs22/FOHKA+ilXj/sQ/nIXYF47v2tQ0uF2mjI2GFzn00ai86btZ
         3dcN1YzxcE9E6EURNoQK7dQTUD5nWa6TxQEl+nwPcuP+UkWdCt+AhdCv0eGUeoXBHx6b
         rA1AZjaT164vJuhzDm7Kf/8JGfF8sCVq8OV+2QvWTAV+Qg9Da/q1aslHIHMQauEyLdEK
         7QJjWqQlz5B7+/XNegAirVhCgGSHlmwmByvSL/5xQBHnuI+m0W/7TwtvIsnmRq1jrYoh
         bHPFPzkW+ZjmMEzalicJ/D0RwBl5HnOrdG1j5v+Ak67zKUVmG7gwK6LUkzfphTMtlYrD
         kvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785730074; x=1786334874;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o0bIczJYrX/P4k3ultDRs1w26VKyNpDX5L+21tUITZQ=;
        b=HjkCvE+7TAUUL3b+fzFWLlaRHoQMFGSU4NY2q2aeNaSTW9d94otGhyGQxNGUJsFPDj
         wAKoN1lvLv+GEk0QrjAzewvaxOKEMMx1rzQntwypxCyb1JGOTxNifxDDEDs4OMFNLtPe
         LtZ1gVfDm8vnMP1q+AJQQr+Q3+kEtTa1DgRF7ctiMMmzsjcD8KqsCGfz6sAd/663tSQY
         rzj4vaO6hMgDNR0sSietxtU4i0EC/GmZUkGo53PpqBu9QgjSpoSqWW4xIob+bo9UJSYy
         QI4dY16LK7iRpURQKtTkuQjg4d+o2gnvmBht14jIXFy/r/sYGpym2dxvz/ntWYV31v4m
         aXdg==
X-Forwarded-Encrypted: i=1; AHgh+RoJdB0SPaXOf3Cj9WwKPOBDPy0dZ4T5naNDmkauMLzaqFS17LSh8dsYODDe5p8oTJyGTtZnNLRHlGTkwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTLV3rTLT1/ayvt8JMxZ/snDo/nSqxuzLRSfFleOR3SRUxJD6Z
	Vo3pEbEnphmyWAOur8hq276qHH23wmAcBWtqgrj+/U7K9J1Ha5GJN2071kr+MsqfT9UptiObmDD
	L14PUj3pXeKbHg5x/ZDUXVW8WMD4IAxA=
X-Gm-Gg: AR+sD13iYGm++f102hzjVfDsRJ3ga6W2Z536ETNi1HtgT+IDuK16Qv76cjn4Y8fPn1J
	61gRpNUqA5hgjdCb0TpVFq79sd/vpKFF55O9zKB5WpA+SgvGdIVi4pn92k4rzeYPKd4FLmiCmfp
	x0TWuUYbIExYDdCvPQAgLRF+zmIJ6nZaR6So7lj9q++iiRXAXH0yxk85b7b8dc+2ys0EkNp+t5G
	Qdm0d1SPeJFDaOd2DDK9bXJSC9VvqqvQrW5No91cLpwwsIARquw1HjZKCsDPdzSSt9vRvkPV5aH
	vbmZRwdkxEQ3tvxgHNiBDDkFH7ouycBf9bA0bpBQStIeh6dzQ5S3l60uAmH9g5URRIMJasq3JmA
	YsQmU6Ih0ChEZ/0sQJ+c+vFUqX/yv9pZ1XVCnGWWT9WA1pKwJW1sqzNyk
X-Received: by 2002:a17:90b:4c0e:b0:385:393e:7124 with SMTP id
 98e67ed59e1d1-38fbc48e76cmr7516377a91.14.1785730073725; Sun, 02 Aug 2026
 21:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260731101539.36290-1-phucduc.bui@gmail.com> <20260731101539.36290-2-phucduc.bui@gmail.com>
 <DKEYE4CK1DUW.1PQ03VOZZT9TH@linux.spacemit.com> <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
In-Reply-To: <CAABR9nEqZG1Vywb2CkoLVgqoLVPKqfYt01t3dF=WTu9qJSS=bw@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 11:07:42 +0700
X-Gm-Features: AUfX_mxoZsbHdTwTqbI_xo8lAz5x-PfMgbH_dD_PFhYYBwi0-5mHQuUL3UsDbSE
Message-ID: <CAABR9nG=s78=5_tGSieN7hdCQOMNzJKdzJo5cx2bMfgAvJM+aw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: spacemit: init *dp to NULL before error paths
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_210754_908876_AD026D69 
X-CRM114-Status: UNSURE (   7.41  )
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

Hi Troy,

By the way, I noticed that spacemit_i2s_init_dai() is quite similar to
rockchip_i2s_init_dai().

However, unlike the Rockchip driver, spacemit_i2s_dai already has most
of the playback
and capture capabilities initialized statically. As a result,
spacemit_i2s_init_dai() ends up
assigning the same values again, for example channels_min, channels_max, rates,
and formats, which seems redundant.

If you think that makes sense, I can either remove those redundant assignments,
or make it follow the Rockchip approach by keeping the static spacemit_i2s_dai
minimal and initializing those fields only in spacemit_i2s_init_dai().

Best regards,
Phuc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
