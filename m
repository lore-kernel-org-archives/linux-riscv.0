Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC43C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 16:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sd2h6/UZ4Gt3DvYfNeFsvj/x0+U/CbJyXKp9q/Zm7cI=; b=KBQScedW5zMSNz
	CuYKzRZrUtsPnDM57Y/d5nZBzEECkJsHO2m6Dtq8LuYsXh+PNG282xoOcQIroBQbjBVccVy6fGP0Q
	9S/9vVobFXjwcd3RQC5ZR1zNQyk6C0VhexuFlvoGg6oKF9tdhRgUFn9XRGa4HzSAv43Yp2SD7DOdH
	C0rQIlX3bbJ/uHme0sU/s+diuoVx1iMFk84ZXHD6F3JpKzUeBNTUfrLNE6vVUWXWKz5V8mHCQqH8+
	VYe5iXMvNzZqZYtgB9j3ThW5NbBfH1o5iJr3p7rD9+YUQ317t5LWaY7Q24wkp01gflQ2nKztwmm24
	K35XH17BcsYtza9axHiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncrFR-000Qjj-R2; Fri, 08 Apr 2022 16:14:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncrFA-000QYn-SK
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 16:13:55 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ncrEz-0004it-3M; Fri, 08 Apr 2022 18:13:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, gfavor@ventanamicro.com,
 andrea.mondelli@huawei.com, behrensj@mit.edu, xinhaoqu@huawei.com,
 mick@ics.forth.gr, allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu
Subject: Re: [PATCH v8 10/14] riscv: add cpufeature handling via alternatives
Date: Fri, 08 Apr 2022 18:13:39 +0200
Message-ID: <5557228.DvuYhMxLoT@diego>
In-Reply-To: <20220331100139.GG23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-11-heiko@sntech.de> <20220331100139.GG23422@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_091352_956413_21594025 
X-CRM114-Status: UNSURE (   9.76  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

Am Donnerstag, 31. M=E4rz 2022, 12:01:39 CEST schrieb Christoph Hellwig:
> Can you please fold the somewhat confusingly named vendor patching
> into this instead of keeping that magic standalone function pointer
> mess?

I'm not sure it's what you meant, but I did merge patches 10+11
(cpufeatures + svpbmt), as having them separate created build =

warnings / errors, when a bisected build happens (aka up to patch10
but without patch11)

The vendor-patch-func got an overhaul in patch13
"riscv: don't use global static vars to store alternative data"


> > +static const struct cpufeature_info __initdata_or_module cpufeature_li=
st[CPUFEATURE_NUMBER] =3D {
> > +};
> =

> Overly lone line.

ok, I'll wrap that line


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
