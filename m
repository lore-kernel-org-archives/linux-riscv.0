Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1586ACA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 03:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jP41hDBXkISXMBbYWNkhATI8uhLNuEjx1r5vzK7s8NQ=; b=pQbQ2q4AGDqzAB
	wM9lk1zoKu/MGCQ69Ur8Rbu62tC/3VWdApuQDehWOIR361ovongBrJlAgaYl5/f1dlNG/PEPste88
	EP8nfHM8ZH4/iZKYmkomRH35FphptFBdyQlNNsLd1AB8i+hFeZJVB/rHvvi9UanjjtZW0ve8GCYcl
	SHS+Fs28d+aEFD4ocJ/PUeKW/OpobW6WVQplDwsI4dlnUu2Z4EL18qAI1WqzEslzHa2RDxt+3GeQp
	ccDPbm4MWr52RTCTb1AZ8t+c0J2T2isfoanb646E2KNjXBCVHqMBiQZJtiCOBirJdhcGDG66jiSs9
	RiGOJsgD4b23d6c/WwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCUHV-0000000AZMf-3GUU;
	Fri, 02 Oct 2026 03:49:58 +0000
Received: from mail-lr2-x2b.google.com ([2a00:1450:4864:38::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCUHS-0000000AZMD-37pY
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 03:49:56 +0000
Received: by mail-lr2-x2b.google.com with SMTP id 38308e7fff4ca-3a49e560a98so5194771fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 20:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790912992; cv=none;
        d=google.com; s=arc-20260327;
        b=RAkAj+uBGi6EqVMrouS/lyNpAwnrYTmvjAux7bkvv8zh7otPfJtz7HExNS9zP1k9Cm
         x43Ejhb7/+ZKJL4rRAv6xTQvzrwRiPVxVP47aTZEeL32J/awgTK5Hpe54Z8DcyurtdK8
         CDY2nU9XkdSSejYRljPksskX8bTaZfQyJXfpwFGRh3Pkf7GqdYXkTnwu0AjUlIPtudgq
         X+ZwGpNWynP/q3QXScu94HGpFDX3GjKcAdWT9WuIbWGsRCQ3GarsbiVyspjQqRpeiRGT
         u1Uh1ZAlbAR5iRoHVwAb3dshpUprZcwgc4hz+8RCDEaCb1OQkStuMSMhOJA0sDQyxu3F
         NGNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        fh=FB5dItwnhrq0HRGFGtTUEKqUPE3XfcFkYMuQRrioEV4=;
        b=oIHJbmxmfli3kwRxBlPRdcgqts2PPo/B3MK1xLDnWbFYgmfI3wVUJpHoO8TYf+sDfR
         SUqzex1yCzoObGibmeexifqQVBeVCRq4EdCm/vL9jeMp3XRD2YcaotYOj3E413ZRf9/2
         hziai8gr0pj0tXbrLPFYOaWSbGYngrt3FeQF/YhZL9efHUovfY9tBB00J5a7kuLYe0Zx
         Bs7+gSSKuLOzlEXPoKMg1bgfKUY3K2AzWswPbSBd0sUW8sW34dJHhG8dhWYcC+7hyMhD
         UOdWeHXPeHtx6jicgKWQ+Mc/L7m4JzWGnP88uwSAYj9a6JDzJ84BotWGzwkE+YjXr2LH
         WfSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790912992; x=1791517792; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=o5/ApZwJ0Bkr0kPrrgzLhNzwNddeyvnGle63dIbk4/zbzDpDB+46xhPuk2qcwpI4dE
         x15jNfMj2eyBcNT7PW9bQB6Dj9EeNu/LME9ZM5NcuIkifkwHnSBBUPdy3jb1hn6fnbK8
         i91tDn851Uk6Q0z4t3PtRfBkgUQS1HJhbquEcJrDr2U7oP1oH13XbhWcrDecqCEvQ62x
         iaTKprFH+SctROJkJUc4Kc7oct0pfvAeND4bjqsph/WhoREoSJiED1OoCmcYvYdZGre+
         fmFZ94ZgW+X+ZcU+TtQ3gZuixy1G2jqAgyVl6ghgeoH4/pt9SgrYoFhnAKrIipFWJU7j
         uemQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790912992; x=1791517792;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5sGej+DLfkAUgSW0hAN9X4g6v3915oL1VCHDIm0N3Dc=;
        b=a/JlIc9JA/tcEU8TpL1oGpc7dn5QTm4R9/OMJyCOmjHjFRX5BtmE9FUs4xMa5VMhQ+
         e6MPRDsoKF1eoyv0K0XaM0z/MwGKaThbqXCfhtY8oUTb5ZO1Puv9RkNJBOhl3KZmm1bj
         sPYvVjOiohksvh5rbsPmG8ozmari2rolM232boaEy8vd9ICb8j9NQzp4S8/SWJJD6L6m
         59uajK5pINggiCoUXLBJyary1k1M31fSH4AjEaIOsp6ZB3+YM6S3JhFkY34mTqd8+4cs
         IZUhzuZlgwVNPGHvzowOZKuVdUrCcSguOQpNLp4CAF8rWAAemoKgB9F8IEMBTxF8rtAp
         kruw==
X-Forwarded-Encrypted: i=1; AKwUvBzt+v4LCKbx+ILmuCBox/J2SKENQpj933NHVtse+UXOZSnxFAqrYd+1XemrHystUeDiS6ytZRz6vNOT6w==@lists.infradead.org
X-Gm-Message-State: AFq9FYKxm9NDMd4b9nwbf76Ay/ELIIWRNBVgGdhyU8bt20euGn9RdUpu
	dTdEbk74NfI4T7HMcJjQ7ZMBOpcB3GSEUJQt5F3O2qRX0DzX3lYOABwTduoyaSjkHZNRowTbV3t
	wn2VNgeWbdFDrjmOC04VE5H/6iDUxqSE=
X-Gm-Gg: AYBFou2nqXP2aGtjEdQ950pQRPb2B7G+N2d7bxHoNjXLNuVqlOLcnPKvA9rq3mgpMt4
	ibQg73A7kFDpwStUGQ/KNg7GAeotwrBqqd/8qwdsVxpCqZ8QnEC+wp4kwq8OVtq9OVtJIq+cYYV
	aDgDn3XIVpktoXGcbfsnbuCaQ6a4pkqKT00ckhpG5kyyGRZfdn/nNIMhO3+aOFvuifv/WbEa/II
	F9imdiw1efh3Ac0OfEamjNdZcCB/u5+dH2FHASxTHOeloPQoh2gruOgIKztlc0UnbjHOYpQGu1O
	0BXaNMviGMPEb+of2IDAYDLolgV1mjKxNWMHzC6KMhI9O+bwvrtI+ddpY3ZeVLZ95T2VifzbWSG
	hd1aYFn3A4FcgtCWwRrgG+5Z5fljzel5/mkyP
X-Received: by 2002:a05:651c:1b84:b0:3a6:629e:447c with SMTP id
 38308e7fff4ca-3a8827de31amr2384311fa.1.1790912991548; Thu, 01 Oct 2026
 20:49:51 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
In-Reply-To: <20261001-milkv-duo-eth-overlay-v1-1-78bc1454f35b@baylibre.com>
From: =?UTF-8?B?6JGJ5a645L2R?= <chenyou910331@gmail.com>
Date: Fri, 2 Oct 2026 11:49:39 +0800
X-Gm-Features: AclHuK9nOE7Cp6JUOFi-QxVBuGMkiu_Zk5X9AVbxMGFwo-WwiNAL3M8EJdWroT8
Message-ID: <CAKspUhKOwuXyweSk_EsBTTNKrUbDy4ATkHjEPSObA=zm-Hu7jw@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: sophgo: add cv1800b ethernet support overlay
To: Hiago De Franco <hfranco@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrei Lalaev <andrey.lalaev@gmail.com>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_204954_805756_1A04E28B 
X-CRM114-Status: GOOD (  11.51  )
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

On Thu, Oct 01, 2026 at 04:38:30PM -0300, Hiago De Franco wrote:
> This is a continuation of patch [1]. The same patch was sent before [2],
> and an overlay was suggested, altought it was not sent. Therefore I am
> sending this overlay now.

Thanks for picking this up. [2] was mine, for the Duo 256M; the overlay
rework stalled while I waited for the IO board, which has now arrived.
I will send the matching overlay for sg2002-milkv-duo256m in the same
shape as this one, so the two boards stay consistent.

One note, not a blocker for this patch: the internal PHY under the mdio
node this overlay enables is named phy@0 but has reg = <1> -- which is
also why it shows up as mdio_mux-0.0:01 in your log. 2/2 of my earlier
series [3] fixes the node name in cv180x.dtsi, so it covers CV1800B as
well, and already has Inochi's Reviewed-by. I will carry it in my
overlay series unless it lands first.

Reviewed-by: Chen-Yu Yeh <chenyou910331@gmail.com>

[3] https://lore.kernel.org/sophgo/20260803163427.74445-1-chenyou910331@gmail.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
