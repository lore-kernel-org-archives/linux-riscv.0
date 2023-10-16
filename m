Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AA52CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tY9zcZAQrwPaftJPQWlKisQBXYF8Tt3T2AgyE5R5jk=; b=khsponF8XrZ3nM
	v5ecEWp39U5YYj5yAR9cB2RJKft3ZfUVnXsc3g3WznEeGf6vrVgseD672Tll/M7BLmNDxHnORMjJe
	KVVKG9YgVa7mBbor0YsmvTuj2yr8s7y9x0URvQzEBRPU5NPBd1R9NRIg7Hk8wGgt5yj5lYF59SqaW
	AcxMsiCyXuRK3/O4xp6EWzRxoJOYKjLHF4IvcY+RVGNzbNm/fJW7Kwhdr5q/YeAJaMZ97QVJUmHrU
	Os/uYItOkj2hKznpxaMSWgbPQSIRffWnfFr6FjEIj/wjIdfoLigwE5m+Oh+G/cDT4xjGgU4fQwd+q
	u2uT5wdWaAYKa/dDthTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPiI-00A14p-1K;
	Mon, 16 Oct 2023 15:41:02 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsPiF-00A13w-2u
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 15:41:01 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4a40d304601so1831691e0c.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Oct 2023 08:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697470858; x=1698075658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6JyrPV6/isChg/aWoV8Vdox7jNb/LeSH8h9ZE9RQZ4k=;
        b=cBGHy8e5vRRc4czfgvBLZiguTqiAG1ov20ZjuFIakVQ0Z8UVFuc8sAiYDPEGi4WWr3
         o2e3Cc7jtC95sXIKCVEZ1YWycw15XQGHAlkJ0amTRxmR8EqRAcpwGTVRpPjb/ZhgP/su
         DSOzAY83785g3X5GIZE+ofKe8gao6mxC6rIqDmHGriRqnGMoMfKK9S8nYbO0tXH8lp9I
         5kE7pfTXSROO5Lm99JKSRwzlfrIoFniM8Rfx0jopHC8pklsq02SvP+DA/5KbfUUcF2/f
         7n2DvDc6He/8CY53GVjgqxq+lDx97uuWFym47kI1a58FRYBAFDZ1VNTxw+3RBUUvaJxt
         V4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697470858; x=1698075658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6JyrPV6/isChg/aWoV8Vdox7jNb/LeSH8h9ZE9RQZ4k=;
        b=ZTDCVeXTFVDctuGI0pYCdEB4gJC/cYFCA5GBA3/FKw/2r64ekbt/FRkyY3AJ5ZFJ4Q
         Pg0MMz8lNhfKwu2E2+iXjhWWiiFqW7FOZQEr/LPI5kuH54ahTwescJgy7QhAdhTzYaqc
         N1Zw+S+iQ26itOfqveD3yXwwAUWircGk1sC/nD5XwVunbtAhPi2csqKncLfHNeK1rg6u
         sUyd27hUdjo4KCqFRtpd2QhXcJEMF7RibfimKEkNKHQlA8R0zLseXyaMZ7THgeE/YYzo
         MsvM8uu6kfv278InDS8GNjFFWvgVIdl6rfmj/jpiRDstBrvBVrKhMMAuV8vxtOkIXBfD
         f3Ng==
X-Gm-Message-State: AOJu0YwjsKEzTROk3SZtKEn5/scVzU+y/WS/TTylSbK/2Tj8jcCnH1Cn
	u2crd1xYCGgHrpA88E7E7FDyCBvZhC1MFbjt8Y0=
X-Google-Smtp-Source: AGHT+IEUS6diCI0qP0NzRCHHthfHGe1z+pXjLCt2SKZVkH+NQW/kPzzEZY2133jtIGuI9wooUY358mw8Vy0zXSvuQs4=
X-Received: by 2002:a1f:4ec4:0:b0:4a4:887:514c with SMTP id
 c187-20020a1f4ec4000000b004a40887514cmr8133579vkb.6.1697470858089; Mon, 16
 Oct 2023 08:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-3-hch@lst.de>
In-Reply-To: <20231016054755.915155-3-hch@lst.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Oct 2023 16:39:40 +0100
Message-ID: <CA+V-a8va9W7Gpgr22RcPHL=fJvbViMjrpUfqKekcQ+rSZeYebw@mail.gmail.com>
Subject: Re: [PATCH 02/12] riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_084059_940731_0CC95E3D 
X-CRM114-Status: GOOD (  14.68  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNjo0OOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPgo+IFJJU0NWX0RNQV9OT05DT0hFUkVOVCBpcyBhbHNvIHVzZWQgZm9y
IHdoYWNreSBub24tc3RhbmRhcmQKPiBub24tY29oZXJlbnQgb3BzIHRoYXQgdXNlIGRpZmZlcmVu
dCBob29rcyBpbiBkbWEtZGlyZWN0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3
aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KUmV2aWV3ZWQtYnk6
IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4K
CkNoZWVycywKUHJhYmhha2FyCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9h
cmNoL3Jpc2N2L0tjb25maWcKPiBpbmRleCAwYWMwYjUzODM3OTcxOC4uOWM0OGZlY2M2NzE5MTgg
MTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNjdi9LY29u
ZmlnCj4gQEAgLTI3Myw3ICsyNzMsNiBAQCBjb25maWcgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4g
ICAgICAgICBzZWxlY3QgQVJDSF9IQVNfU1lOQ19ETUFfRk9SX0NQVQo+ICAgICAgICAgc2VsZWN0
IEFSQ0hfSEFTX1NZTkNfRE1BX0ZPUl9ERVZJQ0UKPiAgICAgICAgIHNlbGVjdCBETUFfQk9VTkNF
X1VOQUxJR05FRF9LTUFMTE9DIGlmIFNXSU9UTEIKPiAtICAgICAgIHNlbGVjdCBETUFfRElSRUNU
X1JFTUFQIGlmIE1NVQo+Cj4gIGNvbmZpZyBSSVNDVl9OT05TVEFOREFSRF9DQUNIRV9PUFMKPiAg
ICAgICAgIGJvb2wKPiBAQCAtNTQ5LDYgKzU0OCw3IEBAIGNvbmZpZyBSSVNDVl9JU0FfWklDQk9N
Cj4gICAgICAgICBkZXBlbmRzIG9uIFJJU0NWX0FMVEVSTkFUSVZFCj4gICAgICAgICBkZWZhdWx0
IHkKPiAgICAgICAgIHNlbGVjdCBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiArICAgICAgIHNlbGVj
dCBETUFfRElSRUNUX1JFTUFQCj4gICAgICAgICBoZWxwCj4gICAgICAgICAgICBBZGRzIHN1cHBv
cnQgdG8gZHluYW1pY2FsbHkgZGV0ZWN0IHRoZSBwcmVzZW5jZSBvZiB0aGUgWklDQk9NCj4gICAg
ICAgICAgICBleHRlbnNpb24gKENhY2hlIEJsb2NrIE1hbmFnZW1lbnQgT3BlcmF0aW9ucykgYW5k
IGVuYWJsZSBpdHMKPiAtLQo+IDIuMzkuMgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
