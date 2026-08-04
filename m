Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 044EBC55838
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 14:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7EzMP3D9SvRWHq9yjtuYKugqSzvIWgjQss1J3xjHwEg=; b=mJwpoIELyy5/gx
	Na/U40nRzfnKtHAEvwAJDjz2Rt6zbLYPbtwnPch1TI3CR/59rQqOIzZfj9JDBV/pZHedfuOpxffrx
	rVt1SV5fqdoRz20PACbfJ9fDtUfA7BRp1sLNHYrKKTzJBiLhqOSvhUT7QCJWf1rWoUBC6WIn/Onat
	opUeRhW/g1vXwWD44VNZKAeB3FXxjkiG2R9bHIek/Cs1UpBrZQkzA+z6SxPLczXS81nlA1zBbrg6f
	0KrY+oN3AJ2wN81dIxq7sffAUGsyKAHp0SPMTsBgxtOu+6QPAU8U2rST/o3UFT7Nue4sEj06G1dvp
	YDe5b65UmJ/wPw2bXAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFzL-000000022xm-1gKH;
	Tue, 04 Aug 2026 14:19:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFzI-000000022tg-0USJ
	for linux-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 14:19:26 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-381b831d535so5220329a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Aug 2026 07:19:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785853163; cv=none;
        d=google.com; s=arc-20260327;
        b=qMoVhnMBX8mC0id8xSLjJSwFScx7UbD+eAy8XN41FalBr+YLvVG8FcRfGcu0RMoCEt
         ZVpr4hsvpWGg4R6FfWZI8GfFzLxMrKn6NYCpXot9vNpVFsxMarUB39Ejag1b1dB77GW0
         4V4l72ta4Fjd5JmShPvCTrdcU4mIMCNRCd35za7BxeVD7OQG8kIJwS9hDCUyrfb+pTLu
         bgJIlSTNL8T6oZUTFmmWtYFPpharSaJJxoWW+iTeXDfxpq9g/D4tVZfTdRTYLg/qg13U
         KG8De2dGPX8uM2VW46zGaWB0JSUSK2t0gH9nwrhRu5QXWMoh6D9pud8M1c6kiZGehiTL
         UEIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        fh=bWdSE+Bny/hEDrI0ExHyGKWkJRxW5+iSpADc1FzXwwg=;
        b=M37lhoK1N6x6TrMUIfncOdOGS4m3I3sjycanMQT4pmYTR6kPKqhJTIJJJohB2sqrna
         yVWYwDBF4FTBJDtkMbFDo81UqJu/YEQZ3Spxmp3Mb9eN5bMTsecKKJygrenio4HEi3Qm
         Tn5rEQk3FeN5sgP/XfPnl31WXDb/AfzYB8jZvAv6fjhc3+/rvaV/X+LFF4Fqbbr7kfN7
         8fd9H1S8wqK24yKZ7dYyD2z3JN1pel3U7M+xyZMsPNhNK462xxZonQllVUoncEvFEeW3
         wegoVxuqNd0oBApPa+Xx+ab/nFkhnOvTB12PYcBlB5dcxiu9PlYYPiq9AVU6RIV7LbvR
         10QQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785853163; x=1786457963; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        b=OsmyyuRV5xnduHn3XZBz6f3D3+yzxGltx3nUng4fOENmui2dwJDvqlXpnquUBSqjl6
         fIi0AW1iga/QLuoaFHh6Zug7q44I7aL6sQWZazyT3+zGdtHiB3sSqEWe0ANhi2BSHgUI
         hcqLY59Ruli4jW9owKN+zG3Adxd92bN3A+GMttFG8wfNbe2FFP9fMJ0KRyIQcsgUTGeT
         XR3NHpxn4EqJ8GyiLQ8w7JPphqxnQ9/z53DpOCzFl2PI3mJNG10RsMtZb690uAYmBWDB
         dKoFzYBc4zxjTqkGPTs1vdNxd7WhQC3cm/9WAXMhl5HMarCl24BtaL5krl6mjvYQV12N
         f9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785853163; x=1786457963;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkmkxc4DOuqtEwvtF2rpwARowqLW40SS4Qr/sKzRoYg=;
        b=NrS/4Om7/1g3rH0ajjJd3vACj8RrW8HWjC3ZYphD0P//KA2/1el+cF+e/lfOoyXpwX
         4+gKc0FxPFsrX/e62gX9R36SJans4pzMUANzg7b+9XwHwNYrcDqNnv+718czdVGeaoyJ
         qWanKgskSnHemF2ok3FaKW1WfQlGLC9Da0WGwgKb85rJeve7F60yxbWdy+K1xbUt0LS7
         Gdhl4TAcHwnSmEV5H8GR0r+W5uRYExquyo9d1vbBEb9VKx4V3OshjjmusAYpgy398kYw
         ntxB4WvihToElA+o8pkz/sg/6XA8e8OqhcSzSJVzEWpi92yd90e+UvL50bvmql9F6oMI
         RZeA==
X-Forwarded-Encrypted: i=1; AHgh+RoNt8VP3xLzM4gC7gaEkLqR6UiskyIm2v9bXGcXg7OVdFSDETljxPM4171zyEGia+EpqStoLKeuswLCbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0PZueo7Qxz7rMtIPwuiPCxzh/K8P+dnYVhCnPg0SZIl/6+dzU
	y1ZL5DwaRSWwrkdRU7PsuYwjX9m4o5n+aphjH1pqngWxYResip3XpIIW8DxHmqwm7JslsGj4BEv
	fgJnQtW+xCEYdx3QnhoyrhhPTIlkYOGI=
X-Gm-Gg: AR+sD11Rmp7l1QStqRSu5wmPxeVrbRmNagrMV/D+xjW5SGw/EBEfyoXV4ISGObaiEgt
	o9owzTJL1cV2witocS5kOm+mC8JVWdqbG9W0s2G5vnXWBIoDUDLZHMjARdePIWxJpEyjsA/6HEW
	IpThR0bzMjaeXbY7msJRxeA8ttKjc7kJx4LkjPvVsjuPlpf5NZ/KYuyR6ihxqMDRX6td087N6/1
	ZpONjopIlaff3dpcaScBuEI4yAZY/CxnQ+U2us6ldQ2ZTa8h5XHqmSeLNGElVtitU2MMqk3MCq4
	Oq/P8YD6/mPtxwGfrcIH7gbvzzpxzhlUZi6RMOp8eRpyIRDhKwH5t2KpyXaoaU27H0QNM+M58Jb
	urXxMwJVo1RErYPwZxU9Huc3vENE+wMJoGB7CkHCcIfnvRKKfJllt0sie5zZ16lQN+ONVINzkPD
	3yxZGv0cPiag+O6nc=
X-Received: by 2002:a17:90b:4985:b0:38e:4f41:83df with SMTP id
 98e67ed59e1d1-38fbc44465emr15422254a91.15.1785853162959; Tue, 04 Aug 2026
 07:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260804043036.22065-1-phucduc.bui@gmail.com> <DKFYC1MGUCF0.1AQF42KLZZ0XL@linux.spacemit.com>
 <CAABR9nFn0XW3CzAEncVkVKd65yBUEmquxjag6ybf_-NRf6mA8A@mail.gmail.com> <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
In-Reply-To: <DKG2L4V8Q2EU.1W5VODY60D6D7@linux.spacemit.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 4 Aug 2026 21:19:11 +0700
X-Gm-Features: AUfX_mx_KW5_NPCjT1WIS_jueD1He7JnKmss4jz44IKDHBp3hMCmxJRzwHiKS0I
Message-ID: <CAABR9nEjZ=qHBHZ6=CWyauOVSnX1isW3Z9+BoSnmvuBBCKHiyg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: spacemit: Remove redundant DAI field initialization
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, 
	Goko Mell <goku.sonxin626@gmail.com>, Jinmei Wei <weijinmei@linux.spacemit.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_071924_189146_CA85377F 
X-CRM114-Status: GOOD (  11.78  )
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

>
> More precisely, channels_min alone is not sufficient. The codec DAI must
> also support capture (or be the dummy DAI for a dynamic link), and the link
> must not be playback_only.
>
> Under those conditions, the path is:
>
>   soc_new_pcm()
>     -> soc_get_playback_capture()
>     -> soc_create_pcm(..., capture = 1)
>     -> snd_pcm_new()
>     -> snd_pcm_new_stream(CAPTURE, 1)
>     -> snd_soc_pcm_component_new()
>     -> dmaengine_pcm_new()
>
> dmaengine_pcm_request_chan_of() tolerates a missing "rx" channel and leaves
> pcm->chan[CAPTURE] NULL. Once the capture substream exists,
> dmaengine_pcm_new() returns -EINVAL with
> "Missing dma channel for stream: 1".
> The conditional initialization prevents the CPU DAI from advertising that
> direction for a tx-only node.
>

Thanks for the detailed explanation and for tracing the call path.
I don't have Spacemit hardware available to verify this myself.
I'll update the commit message to reflect the behavior you've verified
on the hardware more accurately.

Best regards,
Phuc

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
