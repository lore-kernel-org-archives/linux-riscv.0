Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3386E109B46C
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 13:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrnZzQz6sZIri+aDLtlT5y9ygsWfPOi2VMiJYaFIDVI=; b=wxJb4E7rHXAfPx
	7JCWcW3dzSiYwFX2Lo52vXIYq90gUpFUZfHg5eMmm9Mch8N1KLvd/87GrInnsyVyvRWESIGt9x1z7
	yzLBkqC+JumkZo80QUiHpiEeYqnILmU6asWCpVz0BKyGf9sPFWoSBkTLppg7zOS/Vx2f2gzWSucDb
	OG2qYuMMNMGCVLjTpDCsWwX1hNVFpcO9+g6avJgoTDodbJM+Ml8tsAUnwg+KXEmklusmUTXjZK5f8
	Hgh7UCKB1Zq+cVDxU+LQZtj1iBoSLuxp44+ArlhziKD1JIIuyhorH+qQZm3xvEbVhoqfmJtr4kYuQ
	SemzFfZGT/yhfo8n84WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Z5t-0000000D0Y7-3FgZ;
	Tue, 31 Mar 2026 13:25:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Z5s-0000000D0Xo-26c3
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 13:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 98D0160133
	for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 13:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E232C2BCB4
	for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774963519;
	bh=JJjEn2iUPSf4WRGWtUsXPbnxCbplNNFpjO81ol5F2rM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZM21eHI6xZODtooYh0mRdZxdkIYM29ObMGGYF+6Dtt+FMubi2pKylWYY+DpBcUFyW
	 s8lp+pZN7vOeFa0YzvWn6lxy+07OSbeaZAxgGkX5qXtvO2g/SfINVJEGzvX45l2olU
	 Vm7OvdkPnTyUC5llUqS+6DClYyT1NpvvR873nDpHErD4EEf3QFt+YAX97jC4UXS9Ck
	 sEJIIwMoYSr4xo9E5BDpiI8K/YmxJMn9l+W2v9AJcE7tzjm+BkEE07GGEsRcZhboU0
	 w65oGdlkxxbjDzG/CEB7i7ApTEYDAaAxHYGdG7qV6/DCBP6YoE0jXsqQc1K6V9RLKP
	 7VjB4z4aGDYow==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38be66a9fc0so57930351fa.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Mar 2026 06:25:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmW9EyymcAjMNug3EDPdqZtYvyhumsVYeBGib2oZh5XREIsGT0WXg4j1QvkSbF7MrDW/uWD/lIgsrvRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtThMIo+JUVFIecCd/Za5f1feOes3zYa5FcJrmGoRXSGZ3gbHC
	hPTGP80EuuJdpDi6t9nJtzHPzK1Uqt0nUU7qpsW1iagavq1XQXsD1gErkk2y18hzHDme2l/dQ9o
	ciDlSLxTwpBb//Iy4HEPWm/ETlQnf2z8/utY8ue4Yaw==
X-Received: by 2002:a05:651c:98f:b0:38a:f5a6:9173 with SMTP id
 38308e7fff4ca-38c7327714cmr48990831fa.27.1774963517984; Tue, 31 Mar 2026
 06:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260318-gift-nearest-fd3ef3e4819b@spud> <20260331-dominion-conjoined-c87ec5bc7db2@spud>
In-Reply-To: <20260331-dominion-conjoined-c87ec5bc7db2@spud>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 31 Mar 2026 15:25:06 +0200
X-Gmail-Original-Message-ID: <CAMRc=Mfx7ydjbxonz3FL3s9WQ+y54kjzBTFy=dVm5o9Zmbb5Cw@mail.gmail.com>
X-Gm-Features: AQROBzACLRfJow72U-jm039a1d3t4rocpkEZVCM2cWqqZAHN7AaCnQuWh8wdx0M
Message-ID: <CAMRc=Mfx7ydjbxonz3FL3s9WQ+y54kjzBTFy=dVm5o9Zmbb5Cw@mail.gmail.com>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Herve Codina <herve.codina@bootlin.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMzEsIDIwMjYgYXQgMzoxNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPgo+Cj4gT24gV2VkLCAxOCBNYXIgMjAyNiAxMTowNDozMSArMDAwMCwgQ29ub3Ig
RG9vbGV5IHdyb3RlOgo+ID4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9j
aGlwLmNvbT4KPiA+Cj4gPiBZbywKPiA+Cj4gPiBIZXJlJ3MgYSB2MyB3aXRoIGFuIGV4dHJhIHBh
dGNoIHVwZGF0aW5nIHRoZSBncGlvIGJpbmRpbmcgZnJvbSBmaXNoZWQKPiA+IG91dCBmcm9tIG15
IG9sZCBicmFuY2gsIGZpeGluZyB0aGUgZXhhbXBsZXMgYW5kIHNldHRpbmcgdGhlIHBlcm1pdHRl
ZAo+ID4gdmFsdWVzIG9mIGdwaW9zIGZvciB0aGUgY29udHJvbGxlcnMgb24gcG9sYXJmaXJlIHNv
YyBhbmQgdGhlIGV4aXN0aW5nCj4gPiBiaW5kaW5nIHBhdGNoJ3MgZXhhbXBsZSBmaXhlZC4KPiA+
Cj4gPiBbLi4uXQo+Cj4gR29ubmEgaW50ZXJwcmV0IHRoZSBhY2sgYW5kIGxhY2sgb2YgcmVzcG9u
c2UgdG8gbWUgYXNraW5nIGlmIHRoZSBncGlvCj4gY2hhbmdlIHdhcyBtaW5lIHRvIHRha2UgYXMg
aXQgYmVpbmcgdGhlIGNhc2UuCj4gQXBwbGllZCB0byByaXNjdi1zb2MtZm9yLW5leHQsIHRoYW5r
cyEKPgo+IFsyLzVdIGdwaW86IG1wZnM6IEFkZCBpbnRlcnJ1cHQgc3VwcG9ydAo+ICAgICAgIGh0
dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY29ub3IvYy9lNTdiNTNmMGYzNmEKPiBbMy81XSBkdC1iaW5k
aW5nczogc29jOiBtaWNyb2NoaXA6IGRvY3VtZW50IFBvbGFyRmlyZSBTb0MncyBncGlvIGludGVy
cnVwdCBtdXgKPiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvNWYzNTc1Y2M3
M2RjCj4gWzQvNV0gc29jOiBtaWNyb2NoaXA6IGFkZCBtcGZzIGdwaW8gaW50ZXJydXB0IG11eCBk
cml2ZXIKPiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvYmQzNGNkZDZkMjE0
Cj4KPiBUaGFua3MsCj4gQ29ub3IuCgpBaCwgeWVzIHNvcnJ5LCB5b3VyIGVtYWlsIHdlbnQgdW5k
ZXIgbXkgcmFkYXIuIEZlZWwgZnJlZSB0byB0YWtlIHRoZW0uCgpCYXJ0CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
