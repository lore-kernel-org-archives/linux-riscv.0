Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F666C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PlAiCnVr4Zxu5JNest7cX1nqp58MSg0hkoX3MLVPfOA=; b=33kdlqqfFlvS+/
	9vyI687aEOTcepisXk0xZWOWZe1C1JCNSXm6U3DSYrC8Ph4mk3UYm3imA/aq88v0E1/dKbp8rtx54
	4LJOlWNQXoDhPE3HFJ2peGQDpts85qDQQTfKS14FML0b864L8lqyvZ5XSTflFNzbL4nJkTaiBgMiZ
	Iej/TOYxZeIanQtKTt8XjjQP453KQ87oc9xwNlzrPnYHjlqMcpSDguPEvm8OlLq3V8ek67fLi20PY
	a6i2FFeUw10zhb/EQ3Ntf9r52dWu35Y+Ho5BnnFuIzh/sFS0C6E9Mk6LsP8Du9Eg9KpnkM1DVjfpQ
	czHWApu1oIVTMOgFEo3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWTj-0000000Bo8w-45uB;
	Wed, 22 Jul 2026 12:55:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWTi-0000000Bo8g-3rHB
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 12:55:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 14DC7600AB;
	Wed, 22 Jul 2026 12:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31831F000E9;
	Wed, 22 Jul 2026 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784724913;
	bh=y+cYNS3GNG+yvCv7Nu5Q9lqW/Yk+nVvFNZIaz2UfTEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nVEAhk/1YYKqQU+jVIT6MIXdaT5GvEZl/11nUiw0GXBiqn14qcM3mLuhpnghUlj9X
	 +8uagqlYI0LzTUU98MocG+8Pn5R7gGfOijocDymn1M2kz1Oo6WEN2os/LtmEsklOv1
	 zgsZ9jzhfSKLUr12Erc2+QnzR8Rbu7TL+yO2mTxOnO0iQkw7km7v48rEIjalUnGLsM
	 i8jpnjC6fpf+fxK3hsi7RfOL5XKp/yNv8QH8WKfRntxN8nrGKif1hFxt/9ETx32sQq
	 RJ9k4tRYxr0vFm5l5M1O58zQ012Th1CvbUzqHBJe4kG3Bj58z3kli4VcZr+Cugd0iZ
	 mQ5KQuvaAtSfg==
Date: Wed, 22 Jul 2026 13:55:07 +0100
From: Lee Jones <lee@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH v2 4/8] dt-bindings: mfd: syscon: add ESWIN EIC7700
 compatible
Message-ID: <20260722125507.GD11805@google.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
 <20260706081055.1126275-5-pinkesh.vaghela@einfochips.com>
 <20260716122833.GE1260374@google.com>
 <SJ2PR04MB88965A802336D3FB947B736083C32@SJ2PR04MB8896.namprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SJ2PR04MB88965A802336D3FB947B736083C32@SJ2PR04MB8896.namprd04.prod.outlook.com>
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

On Mon, 20 Jul 2026, Pinkesh Vaghela wrote:

> Hi Lee,
> 
> On Thursday, July 16, 2026 5:59 PM, Lee Jones wrote:
> > On Mon, 06 Jul 2026, Pinkesh Vaghela wrote:
> > 
> > > Document ESWIN EIC7700 SoC compatible for syscon registers.
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > > ---
> > >  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > Still doesn't apply.  What tree did you rebase on?
> > 
> > Whatever you rebase on needs to have the following commit:
> > 
> >    1d02f2a79ebe ("dt-bindings: mfd: syscon: Drop custom select for older
> > dtschema")
> 
> We rebased the patches to v7.2-rc2 on master branch of mainline tree
> before sending v2.
> We see that the patch series you are referring to is not present in
> v7.2-rc4 as well. However, they are present in linux-next.
> 
> Could you please suggest on which tree should I rebase and send this patch?

Mainline lags Next by quite a few commits.

You should generally use Next or the Subsystem tree you are working on.

95 times out of 100 Next is fine.

-- 
Lee Jones

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
