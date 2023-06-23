Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34749EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 23:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zwlER9fXoYqvY17Ry0tO3gFD9zdWbjCQCoYSwDuDfIk=; b=eA+uHNHmV/m8gT
	vpGJbib4OEQLMH7NR3d/sMLBMtrdRXna8Pmy8e0i90f3M5AkTwPS/gzxT3kl/8/Ri25BSSTuMY80k
	r4A1mp+Il8Nukzrs3xF6OZPtuNLqJAocLwkiUt8o3kuRi6eXePNnSYYee2ujpHDtxCRYqxMsMGuKH
	Oxc6ueM7MMpTpSWdOFcyMJs6jO1bY7xHZqHKfzUsLCZXVEAUDx9W78qyE4PSwcdu93DJ96jw+rNd0
	u8Bchh22gpg7iwuZwyufx4csts9tLyh+51NQTBgzsY7/TW+My5smySJo+xADj8WzxNez9usywIneG
	KDfWenV99L+4tMHJxQHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqAa-004pl8-1c;
	Fri, 23 Jun 2023 23:26:24 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCqAY-004pkR-09
	for linux-riscv@lists.infradead.org;
	Fri, 23 Jun 2023 23:26:23 +0000
Received: from i53875bdf.versanet.de ([83.135.91.223] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qCqAP-0001F3-Hv; Sat, 24 Jun 2023 01:26:13 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Stefan O'Rear <sorear@fastmail.com>
Cc: linux-riscv@lists.infradead.org, samuel@sholland.org, guoren@kernel.org,
 christoph.muellner@vrull.eu, conor.dooley@microchip.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] RISC-V: add T-Head vector errata handling
Date: Sat, 24 Jun 2023 01:26:12 +0200
Message-ID: <1788842.TLkxdtWsSY@diego>
In-Reply-To: <1961474.usQuhbGJ8B@diego>
References: <20230228215435.3366914-1-heiko@sntech.de>
 <c01ee919-9abb-4796-9ed4-9bb4565dc863@app.fastmail.com>
 <1961474.usQuhbGJ8B@diego>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_162622_090796_4A09C479 
X-CRM114-Status: GOOD (  20.32  )
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

Am Freitag, 23. Juni 2023, 12:22:35 CEST schrieb Heiko St=FCbner:
> Am Freitag, 23. Juni 2023, 05:06:44 CEST schrieb Stefan O'Rear:
> > On Thu, Jun 22, 2023, at 4:35 PM, Heiko St=FCbner wrote:
> > > Am Donnerstag, 22. Juni 2023, 20:58:37 CEST schrieb Stefan O'Rear:
> > >> Are you aware of "3.7. Vector Fixed-Point Fields in fcsr" in
> > >> riscv-v-spec-0.7.1.pdf?
> > >
> > > oh wow, thanks a lot for that pointer, now I understand your concern.
> > >
> > > So in vector-0.7.1 fcsr[10:9] mirrors vxrm and fcsr[8] mirrors vxsat.
> > >
> > >
> > > On a positive note, the T-Head cores seem to not implement the full
> > > vector 0.7.1 specification after all, in the documentation I have [0]
> > > fcsr[31:8] are declared as "0" and uppermost bits are [7:5] for the "=
frm"
> > > field.
> > =

> > Given that the pdf you linked does not mention any vector CSRs, I am not
> > confident that it provides a complete and accurate description of vector
> > functionality in other registers for the C906 with vector extension.
> > =

> > Assuming that you have access to such a chip, I would be much happier w=
ith
> > the proposed "just a comment" approach if our understanding of the beha=
vior
> > were confirmed on hardware (specifically: csr_write(CSR_FCSR, 0x700) sh=
ould
> > not affect csr_read(CSR_VXRM) or csr_read(CSR_VXSAT)).
> =

> For one, you're right that I should definitly try to confirm this on hard=
ware :-) .

ok, so now I know the documentation is wrong.

	before, vxrm 0x0, vxsat 0x0
writing the 0x700 to fcsr
	after, vxrm 0x3, vxsat 0x1

Essentially the link between the CSRs really is there - oh fun.
So we're back at your original concern - sadly.

I guess I need to figure out how to not have this stuff break
because relying on the fpu parts to handle feels not correct
at first glance.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
