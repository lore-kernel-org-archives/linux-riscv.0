Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98F3C3DA7A
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ugd7iSnLXAiC2K7TuPpGw9P+zzB6YGzlFeHCqBgWuao=; b=NnCn3yLnJFS6h0
	LXiH129wY2kfsYQHu2uzUhaiBV1oyzFiDTaTWjq8vlhbweohO/ZqZtmVTr9cLfi65auEsWVjUtPy4
	j17gIacGVRegb2J1sXHNM4DiEAnSfKinUw9NKLHOcekpgaK6ipZx9DHIcgGNlkNXI154lRph3JU3J
	KVrJz0krA21sl1hyBHFhggpKme+QVYAgmCkijwzIQIJ/cYc+JrKT8DebBgtoZM5mfGPpWgaKbbZ1q
	lkekt5LZuYEpjwGdQeBNiqbMHuTHGpUdFGTuuupTxlV9Q/2WIyJWJf8GZCJymKG3pq06ZHduPj5nv
	aFg+zMpglFlinQofqabg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhxs-006Yof-12; Fri, 06 Jan 2023 08:20:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDhxg-006Yhd-3D; Fri, 06 Jan 2023 08:20:25 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h16so590810wrz.12;
        Fri, 06 Jan 2023 00:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d7uAPc5lV4BAkd0Lt50ZSuuOGeFfN66YKgz3Zf+2KBM=;
        b=VHwkfcrVl2FfVTrKkxC0HzjPtyZ9CGNZpbIlOZe6SsFxMv2z/OFxd4MKNvDnKOzFfu
         ZJ3oDzzoxycdiEGI12BPRrXF4sQFxCCH58MkY8isbgq+azciqbC3m+PsS7ooUHxQWXlZ
         nMIKuTmjWZ13hH4a/c5AVYp3+zZjTxXpNxuM02i8LSGhj1LAxwlzCaY4cpHaJISi2fS9
         8z6g/HuFW6ZqqJ6fBIa/IbK/WHWC0l/P8/mK09kXE5AF9P5wHPopv9LoJjKcd+/xUcwB
         vMP/zcpAN2vRlZgxangN7ND+fsmHpfC9yo37R5sX9Y3BLPZ116fwdzMqBKBZtV+8t08i
         SkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d7uAPc5lV4BAkd0Lt50ZSuuOGeFfN66YKgz3Zf+2KBM=;
        b=lzG8lBsZQy8x8l+7tIwsGORn9pellYCZ9b3bxUuuWK7xKZPmscf2SQBn+rgCr+5vSU
         ldUh7R5nG7TAfkGbEq3KzxJX2djbOhG7PwtYpEJ3dkSuiYpIXOtXbntfzqs8VxpLdAd4
         DNTDEbqsSgsIgxfgyU2BExm4Exs9nGp71/6nTNXRA/FhRRcRUd8DMgtgikwZTVHrzzrd
         UT2AaVsi9j9TD8DInfeToZJshV9dhnvkYYitolWsKVgGcmg0QZV5o4wn45JyMyLO+aNs
         fRpNsKvSy9ubqwycsddpwhm/LBF/D0y7+F7Dt7cHfPoTCJPHUp8ZNR4/2vdrcBvruCt9
         eABg==
X-Gm-Message-State: AFqh2kqEWPW3mYEufo/LGCMXf4mzgHSOJ08bw1Vt+JG6evWMAY6vDRIi
	z4YbQMR02RQiEStyd2jhLXhdkp2hTlo=
X-Google-Smtp-Source: AMrXdXsSaZlnxU9wTK9Z3PLBDtebM5hY+mqg71s24qvIEUMA2DyDyulvecJ+TT82vQmAzLouQez4aw==
X-Received: by 2002:a5d:67c3:0:b0:2a4:bd16:2931 with SMTP id n3-20020a5d67c3000000b002a4bd162931mr6152301wrw.62.1672993222223;
        Fri, 06 Jan 2023 00:20:22 -0800 (PST)
Received: from Red ([2a01:cb1d:3d5:a100:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id s10-20020adfea8a000000b002421ed1d8c8sm434978wrm.103.2023.01.06.00.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 00:20:21 -0800 (PST)
Date: Fri, 6 Jan 2023 09:20:20 +0100
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: sun8i-ce: Add compatible for
 D1
Message-ID: <Y7fZxAl8WwVztDj/@Red>
References: <20221231220146.646-1-samuel@sholland.org>
 <20221231220146.646-2-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221231220146.646-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_002024_162700_37829038 
X-CRM114-Status: GOOD (  17.68  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le Sat, Dec 31, 2022 at 04:01:43PM -0600, Samuel Holland a =E9crit :
> D1 has a crypto engine similar to the one in other Allwinner SoCs.
> Like H6, it has a separate MBUS clock gate.
> =

> It also requires the internal RC oscillator to be enabled for the TRNG
> to return data, presumably because noise from the oscillator is used as
> an entropy source. This is likely the case for earlier variants as well,
> but it really only matters for H616 and newer SoCs, as H6 provides no
> way to disable the internal oscillator.
> =

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> I noticed that the vendor driver has code to explicitly enable IOSC when
> using the TRNG on A83T (search SS_TRNG_OSC_ADDR), but that is covered by
> a different binding/driver in mainline.
> =

> Changes in v2:
>  - Add TRNG clock
> =

>  .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
>  1 file changed, 25 insertions(+), 8 deletions(-)
> =


Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
