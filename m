Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29E6E7AD7C
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 03:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2llJbUfmdblJuoECtq63nByNHVNiDt1ppSuXBAh630=; b=DrDbduJhbgkewt
	s+BK9lp9iZ7RlAIKlzq2nnW4xYKiL+HgFjCsAcM6JtQml0c7qSzHeWxUu/6A7rIlp3hEE9EaA6XXn
	fcHeQ0nYbI6HocB2UF2blvrQJMgHiDNVHirhwaP6J4g45WWel62F40Is4lGh6B9pSPUv90nhsntiQ
	fwUE+oZKMJ4/rdUuoRl3jhgqHjlVT9vattV2w7Rnmfry5JzHy3bUB4q+N/D9J9/uhHXHjRI54yGdL
	HKEQrtZax3fJqA3qzn3/jjzxxcmHNlVgefo2LDe3aSE/eDM0E3HHg1HR1AW52tna129964q4MWf3i
	xqtiMWYt2APFZ205Xr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyTP-00000000rUo-18l3;
	Fri, 26 Dec 2025 03:26:39 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYyTL-00000000rTX-2WSB
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 03:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766719558;
	bh=d4wAjrfZaiGw8WX4hHJd4M+lVGETHBvdtA4Tr1bun5g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=JANkgSTuVRx+6NDdzzzicfV1VHbc5JHd5Vz1D93L0UREW5Zu9GakNyt8QAGb/LZRo
	 u6kgHasHHosZMxyqYyassWoF8mRCSFfQsKc/lMPrkxpX6cid4/ArN42UM5j+b/rBSE
	 R06a043S+lDHiDfY358HJ9Mo4P6/cF8ajd/jC+RQ=
X-QQ-mid: esmtpgz13t1766719550t82a12a29
X-QQ-Originating-IP: PieMHnuodpUbtX3Z4xQgyrHPViUuOiKsiF0WOIWLd8k=
Received: from = ( [183.48.244.228])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 26 Dec 2025 11:25:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13964547808078100876
EX-QQ-RecipientCnt: 20
Date: Fri, 26 Dec 2025 11:25:48 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Encrow Thorne <jyc0019@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Troy Mitchell <troymitchell988@gmail.com>,
	Guodong Xu <guodong@riscstar.com>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: spacemit: add optional resets
Message-ID: <65A454B4ACFB1A38+aU4APFpyblOCKqJ4@kernel.org>
References: <20251219-i2c-reset-v2-0-ad201a602e74@gmail.com>
 <20251219-i2c-reset-v2-1-ad201a602e74@gmail.com>
 <04880c83-0b3a-4197-9043-d657db91f922@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04880c83-0b3a-4197-9043-d657db91f922@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MIfPdqFTtU/fn7oLTGYkZ0c/4VuPNpisMQEjcz/egD5/ixeXzTpYrQTv
	hjXsGTa4IeM0R0jPDjtAtLyJKJJDbZq7wnIHBc45S02KcJl4BCsspRFYdNynRUUyRVYGbCX
	KubTsh2p2G+tIelw4NUpVyzFjSXY+mPawbjf1xW3zeH4yjPfmXIrJtXiUHuRJ+DpNoCQn0Z
	EpeAPhU3x/ww7DsxWsuaZdP8mDd3UdvM0A6xy3BhKMUC47DXVSJ8elXNdU0BJMVvdm+uw3y
	o8dakn4zjJpRwXiEfcD7AYVrg/vttmmpP5DEYVFqTSkn7/t5JP8oxPllktOEwdPhf0JHZAv
	mUmF7mQiFB7lmaVWGmGMCntQs9nBcKXcMUPKEHWwJI9qEr3eGCaw/bq8/UiU4CbE2/QTNrx
	FUbzq1c9VJQaKc3PqtR7raaF3qvb1v6d4ynz6e+beQan2FwLDCuYH3UUhVyFVKlHjHfj0WX
	GhDq9c3sFleL4rQW21ejC8Iprpp2IWluBBW936nmoYxhpVmmnJZl56vvPraa/jbGL49fr1M
	cB1ZT0SBJfs5YvMfq4cVR54obauBmq0K1RhQZD2b7MxTA16ZLBgyn7sz9xPVRmFfYAkk/vG
	Mu4nukO6wXbzbv7XVHphj1hzzlxYSD0tfgfQ0Uj2SNKgQ8ojrygY1DM/89K6HetBK+l/nR9
	tLdIQps17SptGpfy5LH2ifR7MzFw7PHFYNIVQXojyNi/dpzogfU0gj7iKh/s4yphZP2Qgk3
	lBszomX49tO4dTi56OzZveb8GUoEqYfR86uSG+bhaUB+87UkXPPEXQGDJVf8poMwUGzOrA1
	dXq8RuhpCylu6PpY0BH1GzjDXAhnhSeAdf7wOG1otKQZ+SmQePhMoBpnF8iWEGFaMuxFn+u
	EiWY4iafjqaThCrBeAUGyvZhW75c1VbxKkP2EP4Tlcx2zp6ifPMuCjjtxjNcIRoxKbbqWrv
	VoOpeH5X9cl0c58zhipE6tgepGhEIvR5OpoDm3mM/IMamg1zejOlOm8Zs1WbNbNW6UvrATi
	MxVM/G6APAsukPmhZUFIOH9IO/HAbcUpVQnrq8g2+/O9f9oOzqGw03xz3idIVBEZ3Tt6kox
	Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_192636_188009_F5D7DBDC 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Dec 19, 2025 at 09:03:14AM +0100, Krzysztof Kozlowski wrote:
> On 19/12/2025 08:42, Encrow Thorne wrote:
> > The I2C controller requires a reset to ensure it starts from a clean state.
> > 
> > Add the 'resets' property to support this hardware requirement.
> > 
> > Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > index b7220fff2235..1290106e28e6 100644
> > --- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
> > @@ -32,6 +32,9 @@ properties:
> >        - const: func
> >        - const: bus
> >  
> > +  resets:
> > +    maxItems: 1
> > +
> 
> Still between other clock-related properties. You already got such
> comment...
Please replace it below clock-frequency.
With this fix, you can add my tag:

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> >    clock-frequency:
> >      description: |
> >        K1 support three different modes which running different frequencies
> > 
> 
> 
> Best regards,
> Krzysztof
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
