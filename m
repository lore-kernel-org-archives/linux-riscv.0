Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17B39C282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 07:27:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA0AB222BE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 07:27:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k3GMRi1/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Il8S2LIQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA0AB222BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2kmScppg/VEdrt9GB0xpw16kzfQsJEFrAVS7dQYykHQ=; b=k3GMRi1/BpsXZ9
	UxnbI8EBNyhs0fhIw1br8spRgSBqcPCPsWg9w4KAR2ASDRF1aKv35uZPd+Cfm1lEVHLsvNcyiXww3
	X9GOz6iyQgflVCDRucu1UMk9K32meErXBueobo2Wk4TybroffSWebbDTWwBJEpI8jnUv876k7D8mh
	ZQUivAMU302kWu/4hYafUTnJNdrBMojrHVA+N3kkaxk7eRQVkTb6EJCC55ZLc2VwvpjIOXaNjQR7b
	Y92y3drQ40UWhG4dNMnFqqE0ArOp/LAyT0b/QdxNgWF24xcpTVponpS5se4AWWImekwdDQxLJ/6ZG
	Cg284BZJuc55FGSdao+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtox4-0003no-EE; Wed, 13 Feb 2019 07:27:26 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtox0-0003mF-RZ
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 07:27:24 +0000
Received: by mail-wm1-x344.google.com with SMTP id m1so1246655wml.2
 for <linux-riscv@lists.infradead.org>; Tue, 12 Feb 2019 23:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ougDmMsACf0IXoScSd8bSpPQfh5iP2Vt3unj4CIa8E8=;
 b=Il8S2LIQg33Qcq8+uP7U/u3imYzP54lQZDAEEM5CF+kzID+q9sgm0f1PMHhfWqZiXS
 sh4DwdtHssUQrTbvsgx/oN/zcldkDP8Y8AeZzzRpPf1/injx//G+/Cf2r9GxWr4arkMl
 qCn6fydje/0+xe2IbXvOI0key5mboqPkQuUJ2aw8uOlM4sJVE1UARhZIKvW7hordAhSn
 +mVl08ksWPLgh21Ba7GdUgWYDOSD17cDkb57YKWs1Q69ULviavQangrTgmzX8DKCm5F1
 2hv9/wSO2ZgTfUhXjLdT/7j08glaH7922e9zMgNG7RB4Gf+HoF3hv0LQiWm+LqwXzCuu
 0qiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ougDmMsACf0IXoScSd8bSpPQfh5iP2Vt3unj4CIa8E8=;
 b=GRZypkdUTGb0OeTwg82MnlvcKs5QAB3J9HvValAoHeTQgTDrn7o8vJizK4kZX2EKFe
 uSfkN1KvGXH6oAoSNWTTdx+IM+X+aJ0srvcGeX0zZ9ZxD7DqBFgHiGtc8sPqcDizSu15
 ADGvxQ4R1OjFAbNE62V1Q9zLBv+deNdX9pFbVat5L3isilW4R0LzDdR8Hl66urBmeeub
 Nhle1RBMdfGNmEhHEEfrwl4tc5P7BzpGhuOoVdmfIvut/X9fmXuGA4tSuLKIz1SB9mXJ
 wCnw1tzAOWycwZ+bEoguJCQTmO2SlI4QFKaezt+W3P9HUBEbkqw0cANoiLRLxsLNmCz7
 gdTA==
X-Gm-Message-State: AHQUAuYp0biZizcL1WoTT9bojpxHp1ud1S2/VmdWCfhM4K70IKme1EKQ
 IRgFJQQS35I+5fl1mf26PP+UTA==
X-Google-Smtp-Source: AHgI3IbW4eZ4PSEG6OMXvEyDow8gFmlqHoPShqVgICSkNax3h+8NXljNYO2fYKDgGUm+UxblAX9GyA==
X-Received: by 2002:a1c:c441:: with SMTP id u62mr2202451wmf.69.1550042838527; 
 Tue, 12 Feb 2019 23:27:18 -0800 (PST)
Received: from dell ([2.27.35.171])
 by smtp.gmail.com with ESMTPSA id n9sm12417168wrx.80.2019.02.12.23.27.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 12 Feb 2019 23:27:17 -0800 (PST)
Date: Wed, 13 Feb 2019 07:27:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 06/12] dma-mapping: improve selection of
 dma_declare_coherent availability
Message-ID: <20190213072716.GC1863@dell>
References: <20190211133554.30055-1-hch@lst.de>
 <20190211133554.30055-7-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190211133554.30055-7-hch@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190212_232722_894114_FFBD4FF3 
X-CRM114-Status: GOOD (  12.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMSBGZWIgMjAxOSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cgo+IFRoaXMgQVBJ
IGlzIHByaW1hcmlseSB1c2VkIHRocm91Z2ggRFQgZW50cmllcywgYnV0IHR3byBhcmNoaXRlY3R1
cmVzCj4gYW5kIHR3byBkcml2ZXJzIGNhbGwgaXQgZGlyZWN0bHkuICBTbyBpbnN0ZWFkIG9mIHNl
bGVjdGluZyB0aGUgY29uZmlnCj4gc3ltYm9sIGZvciByYW5kb20gYXJjaGl0ZWN0dXJlcyBwdWxs
IGl0IGluIGltcGxpY2l0bHkgZm9yIHRoZSBhY3R1YWwKPiB1c2Vycy4gIEFsc28gcmVuYW1lIHRo
ZSBLY29uZmlnIG9wdGlvbiB0byBkZXNjcmliZSB0aGUgZmVhdHVyZSBiZXR0ZXIuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGFyY2gv
YXJjL0tjb25maWcgICAgICAgICAgICB8IDEgLQo+ICBhcmNoL2FybS9LY29uZmlnICAgICAgICAg
ICAgfCAyICstCj4gIGFyY2gvYXJtNjQvS2NvbmZpZyAgICAgICAgICB8IDEgLQo+ICBhcmNoL2Nz
a3kvS2NvbmZpZyAgICAgICAgICAgfCAxIC0KPiAgYXJjaC9taXBzL0tjb25maWcgICAgICAgICAg
IHwgMSAtCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyAgICAgICAgICB8IDEgLQo+ICBhcmNoL3NoL0tj
b25maWcgICAgICAgICAgICAgfCAyICstCj4gIGFyY2gvdW5pY29yZTMyL0tjb25maWcgICAgICB8
IDEgLQo+ICBhcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgfCAxIC0KCj4gIGRyaXZlcnMvbWZk
L0tjb25maWcgICAgICAgICB8IDIgKysKCklmIGV2ZXJ5b25lIGVsc2UgaXMgaGFwcHkgd2l0aCB0
aGVzZSBjaGFuZ2VzLCB0aGVuIHNvIGFtIEkuCgogIEFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZS5q
b25lc0BsaW5hcm8ub3JnPgoKPiAgZHJpdmVycy9vZi9LY29uZmlnICAgICAgICAgIHwgMyArKy0K
PiAgaW5jbHVkZS9saW51eC9kZXZpY2UuaCAgICAgIHwgMiArLQo+ICBpbmNsdWRlL2xpbnV4L2Rt
YS1tYXBwaW5nLmggfCA4ICsrKystLS0tCj4gIGtlcm5lbC9kbWEvS2NvbmZpZyAgICAgICAgICB8
IDIgKy0KPiAga2VybmVsL2RtYS9NYWtlZmlsZSAgICAgICAgIHwgMiArLQo+ICAxNSBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCi0tIApMZWUgSm9uZXMg
W+adjueQvOaWr10KTGluYXJvIFNlcnZpY2VzIFRlY2huaWNhbCBMZWFkCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
