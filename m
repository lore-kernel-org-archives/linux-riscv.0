Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C3510F92EC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 01:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/X3kpFRWB9Yde+RPqyfTef0zwrYsmhXkAsFJyKv+Dg=; b=MHM8kSW6ZwUVXt
	VzgeXxi9xp/j6ZGIpQnk7bIIms66i86hr/3NA+1WfXJUE4SnzQQnMIepazZ9PTCneNsNUkHl2rLZD
	mC3TZgS6U6mwVuxLPt67ydlAP1BCY0azJvTFRCVZM8YXUy3YHS+xV+ojX6F53Nt26/PM+QFsg67AH
	a51avUe2weZPsxpYO7xVp1cDvj+++o/sWh2Uv/QWyH1Y3Ybm2RCnsYudWFthTQg2TDQe6gWgvoOr0
	oSrqMyF1j143hWZ6fw8GMWLRR+aydjTmDj30EdI1Xd8ahgOvABCsH3vojUOhJmLMMG8kUotCkaiZp
	K4kivZH6pjiLwmb/65NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7kNS-0000000DnGK-3mZ0;
	Wed, 01 Apr 2026 01:28:14 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7kNP-0000000DnFv-40dG
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 01:28:13 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-79ed2fc6ac7so2762667b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 18:28:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775006890; cv=none;
        d=google.com; s=arc-20240605;
        b=NqSUy2rXn2RkOx4CA2NTeAevclah8fgyzuVtjEUcCpbDLFpXXH0gkmt4f2HUtd+LTN
         PbScA3wH2LZFrtV66kDRLqo/lewdDqV2O7TOa7rmBbfPLXSz5UaiZZPGVdmoOP7YVRB2
         UpAXmEf4nWS6NDGHjmWv1jdSdINg95J8pZ1mlU3WBiF7Qwwl5D0pL6UrHuMDHU23UiIa
         P26U103Cbd7LQ09cTiRhT8DmEu3QOtDklIeK9Ab2xw2sjeXd4pvQY0t1U3dT4qYoiD/7
         wm3bsiAzbyyzdL14iB+AnbK+yRTCjZC2HmUPjPj9sJAZO2SdFIWwsHFjT2sNjL2WZisM
         4eMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4IruUVcp0HjdDE9HLsgtbDaSAgdq3HRDtspM2HHU3KA=;
        fh=VkX09ixypGNr4IhqPHZBxyvwZQH/AGyqDQspNF75Qgg=;
        b=KgDeKMhSkB+pD0xozxY1yWnPJRLSlNpHWOUXBj208dXVszz6ekqj/HdEb7NkbYaBTk
         ZFe87617w8amj7IY8CVgvE7/kk3+GDDD44KbE3qCZSGAXJAAk2zfN4DszjnsuybexcC3
         tHb52TCPCkHn4CMoVG5h8/To1UhPU4b5QTTttmCfPHvCWg2r+4No5T+K6YsCSQXXdCJr
         hcRuAfC3mFveRGY0NtsSO/uTTIHVIKbuHFhrjmK26rqNtb8g+vDqhkbtLgebCE8/0jAO
         RxPcSHVyXfgzut2x483j2fU9Hh/BVfs4Nom59rvfuYAmvIZ/UFCI623+TJJ4sG5Rfb6z
         4lAQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1775006890; x=1775611690; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4IruUVcp0HjdDE9HLsgtbDaSAgdq3HRDtspM2HHU3KA=;
        b=lKQtOks1WMDaDFwowmBfax12s0H123NNj9aMGYP5rb3eAWrFxYiltQc+NkBBx7fjdU
         4RQqC6vJbiesftDgAkDod5EwXWx3P/0799uYL6WpsGcoEpForMUOiKllkMYwX8BtjZWF
         z8V6r2jILWjhm1SIrPcuILgT2FxsWU3lQVRXk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775006890; x=1775611690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IruUVcp0HjdDE9HLsgtbDaSAgdq3HRDtspM2HHU3KA=;
        b=H/SmrmLYqkI/a0suVbMxxEESSDrYtO90901KHvlSS1RwtITKQI/58Fvdd3dVN6PLwG
         JqZwrokWZYn1otPs1QN2VPIyZHbUfo9dwTXTnCPix3TSK5UaHtxF3l+zvfj4A2DXLiOw
         nxYckYCPyqHPsIVbFYw26Gru3gbyTEEvY9p36zAF98YjROQFnyibx+yJTUSTxUOfDDEJ
         3XDqZ0u2m5K0AlPgYrXJjiKAy8IJMhbEqxVMn5Syf2yN4XyLYbOrlhKO7161+H8UhgS6
         G38EEzCeWWZY3Jh93hHpxoQ+lga+6WWexgBiHjuJVfN7apiCYHI6x5svYW2VHVI0Kjhn
         hhRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHcWifgsqcDU3dYg4c4SGu9uDkDO305JghoaVQ7Vgqd6kwEk7fbwryUWVxYGSOjQnA9R+T8gFjauCshg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy46sMbBh/VVPa6nPl2F6jjOLlYSfunwNObIC9dWd8PK735Y7aB
	h0fU3MwKiT+l3OpU+z7FtDOiaKpQuGPCPMcUyiHtzR8TO3mIcWOkHYEc3MAC46UM/G3tPBA7u2Z
	ZtsxXgib48lQw3CPTBM/sU7W3Ctt1FUA=
X-Gm-Gg: ATEYQzz7YwmlnscU2RDTgsVWIghN9JebGMek/UXhVpvGVpm3IXObLybRWXPKrvvAAFZ
	bBf/VDEjUS09oUr60wwUWgxz+nU5jeZAvRLXALiCCPmSwl+6/riI+NChVEPNNXF2iF43zJ6r8Z+
	8adOHG3DoH6+bLuqqrf3bm8DrHyWFDKEICMz5Ux2sH4UOY4+pcT3UnpsOwLBxehpzI0vC283coZ
	Ym81aBCdJd/gOI2GpQ4WpVo5ZrcsCJwSAOVDnrIiHijEd5r6KK4TylqZ7Hk+1uZg24J5M9M1m6n
	V3JgV6KCJ/A8VTRuq7aa84GExSVqbKp808kzNYF05hh0xhC/IYGVI0aXjaWZoRywJ7Ai
X-Received: by 2002:a05:690c:348a:b0:798:6f0b:86b4 with SMTP id
 00721157ae682-7a21107aa7dmr20051487b3.25.1775006890078; Tue, 31 Mar 2026
 18:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260310003850.3837030-1-npiggin@gmail.com>
In-Reply-To: <20260310003850.3837030-1-npiggin@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 1 Apr 2026 11:57:57 +1030
X-Gm-Features: AQROBzArsWqts098VpZ5lUIVgJv6zvnv8uxKW8b6rDQsTlEehBLHkq47aL6BupU
Message-ID: <CACPK8Xc=imZXXPp-CYY39=Ww4oVDdXPS5My_R1qODzGhOD2qnw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: iommu: riscv: Add bindings for
 Tenstorrent RISC-V IOMMU
To: Nicholas Piggin <npiggin@gmail.com>, Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@oss.tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_182812_331741_3FFE86A7 
X-CRM114-Status: GOOD (  11.07  )
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

On Tue, 10 Mar 2026 at 11:09, Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Extend the binding to cover details specific to the Tenstorrent RISC-V
> IOMMU. In particular, a second register range is added which contains
> M-privileged registers, e.g., PMAs and PMPs.
>
> The RISC-V spec S-privileged registers remain in the first register
> range and are compatible with "riscv,iommu" so the Linux driver does not
> notice any difference, but the binding will be used by OpenSBI and
> potentially other M-mode software.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>

Drew, will you take this through the the tt soc tree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
