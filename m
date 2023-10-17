Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CE9CDB474
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Oct 2023 08:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lXPoo9L/53X3yiDkbvsyeW208gP0lU9JbnxZUx6Mht4=; b=ohQOBX79ypdad1
	ZjihS2nWhEQlNJA2zqDZLdIsVmOiJHTSKGKFsuhkz6clrRIdMd80TwcHDd/u+hknZ1bqqcOxAmVRf
	rqoOh1X3yXGkVDv2w/FFuJjYOulM171irVTu4SSFBkDGUWjagLluZYt6ey+Q4chK5vmbWMyWBqxiU
	nxMTOoVzM4AHbGtLe6ehyLFvYRjjhz3+CvHMWZr1jhOj4vgJQm5ongNg2U6UCvBibWqEqAm4sdQpE
	Sx0COZP5A2ghkhY/Y7cd5GoX8whCFPLIssAUDCODEZRPq1NpyR4JsfyE1FuGgBrq3VsfcWa8MFF0X
	kZ9zDoCp+eOUvCGJHuRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfPA-00Bfe5-0d;
	Tue, 17 Oct 2023 08:26:20 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsfP7-00Bfd6-37
	for linux-riscv@lists.infradead.org;
	Tue, 17 Oct 2023 08:26:19 +0000
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-418201cb9e9so37775921cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697531176; x=1698135976;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CdUY7Js3MyY72r3pkukYQuEPFyg4hUCkNQ1ukw9r4To=;
        b=B6oZ6bdFhFwX8Qj+k+fsWrAo7sVbWJ0FvhRGnkdJsEivsK87IDTWxkZ+aH7QKeVW+V
         fk132Ez0adWws2QkpdkW4/fftCoOIvDa810jw9NxO4eoiwf7JQZwopaIHazqJn1b3yw/
         GpPOfDyikIUa7DAEJkQRRv+bxtbnhovSpf+k0I/aur792stNjTytG2AyFTH0uPIb0fxy
         ixc20Sah2Q3YIf5E50OIPgAGUhhu9J11NOkxEcF3rusASDQ1NsIKKyaPcZo8l0/GCAPS
         YCCHJ/HqvHwNafr2JSqzO1d6CFOloUdvn9yXzAKfXakNJPsnXXEykbgAyTpHfLKaDCdK
         TQog==
X-Gm-Message-State: AOJu0YxSvfZtTG1jEmq2+baHru9zWanp1pBBkTED0AYscy62rMovykva
	NUBB+KdkUMBgNxMO0LAGQdwU43s3ERpsgQ==
X-Google-Smtp-Source: AGHT+IE8tKA6udjiKiwlYrDt672KCUFmBKzAoIAs5iqWGmtUPHxDoFLV3SVbYKosrl5xNMuFJpyQ4w==
X-Received: by 2002:ac8:5bd2:0:b0:412:2d6d:932a with SMTP id b18-20020ac85bd2000000b004122d6d932amr2069580qtb.56.1697531176462;
        Tue, 17 Oct 2023 01:26:16 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id h6-20020ac87766000000b004181f542bcbsm441779qtu.11.2023.10.17.01.26.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 01:26:16 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-41b406523fcso37620851cf.2
        for <linux-riscv@lists.infradead.org>; Tue, 17 Oct 2023 01:26:16 -0700 (PDT)
X-Received: by 2002:a81:ab41:0:b0:59f:4dcd:227e with SMTP id
 d1-20020a81ab41000000b0059f4dcd227emr1543078ywk.37.1697530847545; Tue, 17 Oct
 2023 01:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-5-hch@lst.de>
In-Reply-To: <20231016054755.915155-5-hch@lst.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Oct 2023 10:20:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW=Rp8+fcGrZ5fbVDyEZgVMGH_YHMxSTBdHB+zNxw4bxA@mail.gmail.com>
Message-ID: <CAMuHMdW=Rp8+fcGrZ5fbVDyEZgVMGH_YHMxSTBdHB+zNxw4bxA@mail.gmail.com>
Subject: Re: [PATCH 04/12] soc: renesas: select RISCV_DMA_NONCOHERENT from ARCH_R9A07G043
To: Christoph Hellwig <hch@lst.de>
Cc: Greg Ungerer <gerg@linux-m68k.org>, iommu@lists.linux.dev, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Conor Dooley <conor@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Wei Fang <wei.fang@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, 
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Jim Quinlan <james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_012618_004266_B1B2FE29 
X-CRM114-Status: GOOD (  19.74  )
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

T24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgNzo0OOKAr0FNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToKPiBTZWxlY3RpbmcgRE1BX0dMT0JBTF9QT09MIHdpdGhvdXQgdGhlIHJl
c3Qgb2YgdGhlIG5vbi1jb2hlcmVudCBETUEKPiBpbmZyYXN0cnVjdHVyZSBkb2VzIG5vdCBtYWtl
IHNlbnNlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gLS0tCj4gIGRyaXZlcnMvc29jL3JlbmVzYXMvS2NvbmZpZyB8IDEgKwo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9yZW5lc2Fz
L0tjb25maWcgYi9kcml2ZXJzL3NvYy9yZW5lc2FzL0tjb25maWcKPiBpbmRleCBmMTY5NmQzYjUw
MThkMC4uZWE0NzNiNDE1MGRmYTggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zb2MvcmVuZXNhcy9L
Y29uZmlnCj4gKysrIGIvZHJpdmVycy9zb2MvcmVuZXNhcy9LY29uZmlnCj4gQEAgLTMzOCw2ICsz
MzgsNyBAQCBjb25maWcgQVJDSF9SOUEwN0cwNDMKPiAgICAgICAgIHNlbGVjdCBBUkNIX1JaRzJM
Cj4gICAgICAgICBzZWxlY3QgQVg0NU1QX0wyX0NBQ0hFCj4gICAgICAgICBzZWxlY3QgRE1BX0dM
T0JBTF9QT09MCj4gKyAgICAgICBzZWxlY3QgUklTQ1ZfRE1BX05PTkNPSEVSRU5UCj4gICAgICAg
ICBzZWxlY3QgRVJSQVRBX0FOREVTIGlmIFJJU0NWX1NCSQo+ICAgICAgICAgc2VsZWN0IEVSUkFU
QV9BTkRFU19DTU8gaWYgRVJSQVRBX0FOREVTCgpXaXRoIHByb3BlciBzb3J0IG9yZGVyLCBhbmQg
cmViYXNlZCB0byBzb2MvZm9yLW5leHQ6CkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdl
ZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAg
ICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMg
b2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9n
cmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
