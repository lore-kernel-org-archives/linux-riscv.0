Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EB0C54798
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 00:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KaLPTmgKNhBYrlndcfNm3GKnYAFmIUUe3fFLYkqUxSc=; b=l62EX6OeOttmJf
	OOOA+k0G++FfWYBsAPKscJzWsfMSv+yx0r0aHegcBfx2JZASdzmkA1hJE9ZxX3Lhkm1TGycPsHdqP
	s5jF+Z+9nKZYeSEzO4v4JPPrV2w/QHovEYXfMH3/UnTSvXP174AFYch93txPhI+ie6eSVPwkuUiIX
	Py+aNDn9PTJspT80IlJy/auh/PbhtFyGYQMMDIkAMeCxEu4ndylSdJCqPAzU0JEoFiNu0zIBVV7qb
	tScVbtujK67n8dktiA+5+FcHuAU/Q/urvD4HomYFjv4XBe20p1TLp9FMhv+fZu0P/E+nhvgHDV6N9
	VY2di1zrCNAfZQDo23dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rherN-0000000Fj3p-106L;
	Wed, 06 Mar 2024 00:10:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rherK-0000000Fj2M-0c3m
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 00:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D47A618CC;
	Wed,  6 Mar 2024 00:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3800C433C7;
	Wed,  6 Mar 2024 00:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709683808;
	bh=x1sK7a0RCA15eFFBmvlQKLOIEP3zTJjtnhBDxwr0SNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SqPxY7UlHK/zYOF7xvKx/hlPX2CABFqnw26+lqNWb7SDECXWr2WfuSppamCB+1B6h
	 /wvZv+C5/BfLN3sAxeOcvLfrTwBAuALV7KWyh4bDVbOLCnVOEt7OycTcgHoHoCPmCd
	 7ez6eJ7vRPft0wXqp+9pfgBIRBMpAcCdipLmbMEGUsy/EhqMCq81gUTfFvsWeZtcEq
	 aWOkzq15PRuGEybzP6m2YOSzSDz3XaOUIt9ArFknwM91rFBpbZ+5nI54ZA9CU9tLxy
	 9XXbyNF5ogWejOTHbDG8o1/j3+QLDpF02XwtPMu53PJYCeNmHVetod+eM98uPz7auB
	 L+ruD4+O4FzUA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org,
	Yangyu Chen <cyy@cyyself.name>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh+dt@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] riscv: dts: starfive: jh7100: fix root clock names
Date: Wed,  6 Mar 2024 00:09:20 +0000
Message-ID: <20240306-chowtime-gravel-061baa8c2214@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240305160046.46337-1-krzysztof.kozlowski@linaro.org>
References: <20240305160046.46337-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=311; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=2XRB0K85Jf3Fnq7Xb4RYLRCpkEXc0uSg595bg2V1Imc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnPtxgUb9tseKTLi5krfNm7H8qL7m+rmXF4XmOrvXHcz M7EvS49HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIKlVGhlapvzNTZbvsihez WzptZhCeZNK1nXdNZpMUb7PbPObGPobfbMurqtLOr641aeMLkF8SJ2JYz8uVbyF1iiVUPObKn5m cAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_161010_259878_F5932761 
X-CRM114-Status: UNSURE (   4.85  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Tue, 05 Mar 2024 17:00:46 +0100, Krzysztof Kozlowski wrote:
> JH7100 clock controller driver depends on certain root clock names.
> 
> 

Applied to riscv-dt-fixes, thanks!

[1/1] riscv: dts: starfive: jh7100: fix root clock names
      https://git.kernel.org/conor/c/7921e231f85a

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
