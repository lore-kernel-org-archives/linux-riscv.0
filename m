Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC53CD8CA8
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jun 2026 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcPHl4rjCObSvuoAn9NomRSx2nvOLSAuMYv0MLuHg5M=; b=Q/9BkiUXRUPc9m
	GZiGezNS8RMRZ1bFBIFQyFqdqDMlUPFtiqnSI0SWljBXdQR3czHwELBQ+FTtQqG+siD3GzMtbwyxQ
	9eFy3osnDnVu+n45lgRUjsgM/FU+MWb/CKfgN8ZpLKLNDi+WwSZICoBkadESYXL7dNaqexOCdAVvT
	cmpoKWEDH7XEfnOT+yZEF9vvvnmrE78xsyYICH0AzDrf+YS1uLI+yZU1SVdpNA7G8zLJA4Bk65JSk
	yiAAhdfppNtGwmM6pfS4na1ma732iGahMGtHwUPKYVbXukCclkhm+PcntzgpAefBO7ublnwzsPjLm
	mAgqs8pU5hGwt/FRBM0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYMAe-0000000CDcg-0MoZ;
	Sat, 13 Jun 2026 11:05:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYMAc-0000000CDbz-16pi
	for linux-riscv@lists.infradead.org;
	Sat, 13 Jun 2026 11:04:59 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-490b3637b90so13431645e9.3
        for <linux-riscv@lists.infradead.org>; Sat, 13 Jun 2026 04:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348696; x=1781953496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=;
        b=AD64WDj8jSsX/ZVa6yfFTQcln7zn8a2YKqozn5gJeM1x9M62CFDgXAEsQKdZhj7cfE
         UGmv08aDl/r8U0lz+EUzHaU8EYRaEAy45yhckeTSPuBlejA9Zbgxe03CiG5UyEbNXlyi
         0Bz7Ke/4w6rGu5XvqWpXsGTJo4IH9Pa+oudFQA25G9kqlIyia8e64rII8jn74ordJs8G
         63xowiJ1wQ7a9K3xXBS8JX9FdH18nUQ1OarB1+UKum5cya6xXADjyj3e56qvoC7fpqdc
         g6hYLQNdcpUecaXaxuR49ASjD8NC7SnIHYPm65YP52dG0sEZlDXG13h0aVJkr9ant+V4
         r5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348696; x=1781953496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nBEHkzqVLw482vGdz5GT4uuKqoZ91h8lkYDukdrN6Gk=;
        b=LtWxXPd4d/ig9uf0963vWVbSN6U8oJznnWVV62oy/m74u+2jVPO43v1SaVcDW+CsRB
         wZ0k5TkIv9M4gxNiFkl0STOFY1If6ledNogBTom0WHHmfg2j9+KYGqdfqC7VFnHE+3eB
         dJK8zMLMdvNJHttSDLV+lDjDOwJogIMkWrWCp2rRO6vGHCaCA6IJLM/OrhArMuhxWx6d
         zQwivhQm5bEg5y+Xeyx/qVoqduMcxGctICBz1uINiPygyeGtnuJwsSTmQMo/1O5XkwOd
         1DJYGr0do7CVQv0BvWGS2X/CJ7+ZI+uUo78aKnCPdC89kBIIB7HVFn4VExrLK/2uUm56
         fpEA==
X-Forwarded-Encrypted: i=1; AFNElJ9mtdWgRStwUXXEOsYLVZCaTUvsb07yf8a8bS67ele47WpvYB3E75v9S35dlykQq4MswUXb7F/hB+hMTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMOkwdbRDjAaXjGjgZDunS8D3biv1DAm+LvpFq/l2YAbYTzhYG
	CyfVMPX1DU1mWjsKh9L9EzEcUi+fq00UevVR+ALwWr1yjqLWQOhhZfrW
X-Gm-Gg: Acq92OGcwY+pIOdivCvd3w+/TvnQlOjLZB/8/vZcB8czkVnLJ+Uyar0GtosUNGKKsBP
	QUah71/iHQpJ3xEPA+cycmuSvepWQo01MMhOZfmDk5hZQF5+KyE5ibezGU/4R6oSd/pbS+dlYNR
	TdnPAq94w97EBurnOwbfYCRbKHFopo8/4vx6dQB8AtBAzkKwcIEIYc3Tt0CKNFQA2bKnIzpXELL
	sgLNCDxb0ihYYSvPbMhmcixndCFXr0+ZSB/8RHhrjYEiAycYBS/HzaaJqYzU+lTeUxjMVXijSvb
	L6CP/NV3nkBb1qx+7uk0UeCsFx686i81xrLX2hFLNnCP8NUeS9MfzqsGCaYYhUxWgpCyxmZbbUy
	HUKhWcZ9xu/MDBCik0T6IHWFN5/8JeLlMFyGF4nguyYW3+RwXaFVeMKHWGeAIrErTaarGRglB5D
	jVqpniOgbOVHRrOPKGMWCw/DTuDUw9LNJ16axicOALj9qD
X-Received: by 2002:a7b:c8ca:0:b0:490:6237:521d with SMTP id 5b1f17b1804b1-49220092e7dmr27202205e9.13.1781348696232;
        Sat, 13 Jun 2026 04:04:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49220310a58sm75036335e9.4.2026.06.13.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:04:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 Lukas Schmid <lukas.schmid@netcube.li>
Cc: Lukas Schmid <lukas.schmid@netcube.li>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 3/3] ARM: dts: sunxi: add support for NetCube Systems OpenNMC
 (dobermann)
Date: Sat, 13 Jun 2026 13:04:54 +0200
Message-ID: <sTX6E5Y2SsWfe6WORpTiCA@gmail.com>
In-Reply-To: <20260606205452.2386930-4-lukas.schmid@netcube.li>
References: <20260606205452.2386930-1-lukas.schmid@netcube.li>
 <20260606205452.2386930-4-lukas.schmid@netcube.li>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_040458_309961_6FE0AD05 
X-CRM114-Status: UNSURE (   8.54  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RG5lIHNvYm90YSwgNi4ganVuaWogMjAyNiBvYiAyMjo1NDo0MyBTcmVkbmplZXZyb3Bza2kgcG9s
ZXRuaSDEjWFzIGplIEx1a2FzIFNjaG1pZCBuYXBpc2FsKGEpOgo+IE5ldEN1YmUgU3lzdGVtcyBP
cGVuTk1DIGlzIGFuIG9wZW4gcmVwbGFjZW1lbnQgZm9yIEFQQyBTbWFydFNsb3QgTWFuYWdlbWVu
dAo+IENhcmRzLiBJdCBpcyBiYXNlZCBvbiB0aGUgTmFnYW1pIFN5c3RlbS1vbi1Nb2R1bGUuIEl0
IGJyZWFrcyBvdXQgdGhlCj4gZm9sbG93aW5nIGludGVyZmFjZXM6Cj4gCj4gLSAxMC8xMDAgTWJw
cyBFdGhlcm5ldAo+IC0gVVNCIFR5cGUtQyBPVEcgdXNpbmcgYSBUVVNCMzIwICh1c2IwKQo+IC0g
VVNCIFR5cGUtQyBDb25zb2xlIFBvcnQgdXNpbmcgYSBDSDM0MCAodWFydDMpCj4gLSBVU0IgVHlw
ZS1BIEhvc3Qgd2l0aCBpbnRlcm5hbCBDSDMzNCBVU0ItSHViICh1c2IxKQo+IC0gTWljcm9TRCBT
bG90IHdpdGggQ2FyZC1EZXRlY3QgKG1tYzApCj4gLSBXaUZpL0JsdWV0b290aCB1c2luZyB0aGUg
bW9kdWxlcyBidWlsdC1pbiBFU1AzMgo+IC0gU21hcnRTbG90IHNlcmlhbCBpbnRlcmZhY2UgKHVh
cnQ0KQo+IC0gRFMzMjMyIFJUQyB3aXRoIENSMTIyMCBCYXR0ZXJ5IEJhY2t1cAo+IC0gRXh0ZW5z
aW9uIGNvbm5lY3RvciBwcm92aWRpbmcgU1BJLEkyQyxVU0IsQ0FOLFVBUlQgZm9yIGZ1dHVyZSB1
c2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogTHVrYXMgU2NobWlkIDxsdWthcy5zY2htaWRAbmV0Y3Vi
ZS5saT4KCkRUIENoZWNrIHBhc3Nlcywgc286CkFja2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVy
bmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCByZWdhcmRzLApKZXJuZWoKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
