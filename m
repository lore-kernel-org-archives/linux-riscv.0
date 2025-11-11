Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB6ACCFA1A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 10:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WcA0ZEneVF3mu6mzgZuLH42nrtRcOWdKl1jpokB+CLs=; b=L1Y+n9Sye3spgM
	aPJJvNyHXVs8OAKWv1ELhdKaP7job2MVGVyHUe26N2s3g7bh9Rl3y849CiOgNL/LuNAo8g0SXHlNP
	n7vxNW7qCdqcBJtR+Ym2/sUneW1aUcHTne35hoVKV5O32Dn26UKlMTDQDHJSSRSDTPGpek9CKrYnR
	BC+1+9a22Sisg05VDG7UggONI0wLn2P6bPuanlw2/DKqnPJWDaG0OIQaY8ahAtrIbCWvISY4ks5oC
	fxiQVPVRjnxz8LHS80tWtoTrT17M/obavubjzz+BMICDJGHFStbYT9VaxRBNBVSJk3FGTr+0bntcV
	7v/2cSpDV7juBHdFmz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlM3-00000006ua8-2loX;
	Tue, 11 Nov 2025 10:12:03 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlM1-00000006uZa-4133
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 10:12:03 +0000
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3F108340DD9;
	Tue, 11 Nov 2025 10:11:58 +0000 (UTC)
Date: Tue, 11 Nov 2025 18:11:49 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: riscv: spacemit: Add OrangePi R2S
 board
Message-ID: <20251111101149-GYE1651402@gentoo.org>
References: <20251110220641.1751392-1-michael.opdenacker@rootcommit.com>
 <20251110220641.1751392-2-michael.opdenacker@rootcommit.com>
 <20251111-inquisitive-ambrosial-chicken-861542@kuoka>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251111-inquisitive-ambrosial-chicken-861542@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021202_021650_2FB3BF8F 
X-CRM114-Status: GOOD (  11.18  )
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

Hi Krzysztof, 

On 08:43 Tue 11 Nov     , Krzysztof Kozlowski wrote:
> On Mon, Nov 10, 2025 at 10:06:48PM +0000, michael.opdenacker@rootcommit.com wrote:
> > From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> > 
> > Document the compatible string for the OrangePi R2S board [1], which
> > is marketed as using the Ky X1 SoC but is in fact identical to
Maybe, just say it "same" to clarify the ambiguity?

> > the SpacemiT K1 SoC [2].
> 
> Different SoC means different compatible. It is very, very unlikely that
> different vendor made same die, which would warrant same compatible.
> Identical does not mean the same die, so your explanation is not
> complete.
Unfortunately, it's true that Ky X1 is just a rebrand of SpacemiT K1 SoC.

I guess it's a marketing strategy although personally I don't know
what's the motivation behind and even wish it never happens..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
