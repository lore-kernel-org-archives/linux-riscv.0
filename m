Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BB5D2F7D8
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 23:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gJ2b13uLXj5oB5q0wu5IS9vV/vKvsBM4V6XqIxpSrRA=; b=US5NRtQul/AiCb43H9VzNdVQNj
	oZadg6VBgdUbK7u12/ZS28DQgU5Kxofkps1xdIvz8A6IDp00MvYNPShwr7nJeLRD0Ze6yQQsm5lKw
	euSb+MZUW7DfZkIut1W2cB9r3yuWapJI/G0gJyUP4CW4MYdcDRtT1W7747e9cLLs2sATbB7jvhU4G
	pY2zwg4nc2/e6kfquFmK/WJrlBl8Xpkd7lW0QlIYsaWf2Q7s140s5dqfPc2XWKVFzZw9NEhMKQjK2
	BP82sWTaS8hw6TM8X9/Wk1CDF3KhkjubcwL8f82OOBZ3jW0cGnBM01rphCk7Q5wSuj1SrvVSq3c99
	A5lSdPUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1DuX-0000000DGcl-0OyX;
	Wed, 16 Oct 2024 23:58:37 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1DuT-0000000DGar-0xQe
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 23:58:35 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-7c3e1081804so270339a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 16:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729123112; x=1729727912; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWOcAUhy/aqpDz553u2L9UKjBpofwGpehOSYl8woQYo=;
        b=p2FFZ6CraFpn9l6t3q3KED3q1p81rRvLE/544/03VMJgBtkJgcbxejwMosukRbrhR9
         fKAEpAaKYzRgvyTNkTlvi3vvoglbCDdau8UPU0zo8zMyczvjFF9rKWfUPEtTRd1NBA6L
         h1f2/adXhiX1NnwRgbrZ02zF+YNPQkNpOda8seQMtC5gPdz9JsrZauvxE+rx8R3LLJWN
         1bS3jNMv4Kqr0NKNv28SD3XmvN6lUiwnxWHj/503M/7+2hWcjAlu6AEnPH0vjxAkOnaI
         WzIQA5UeyVWYDo/l4u2y8pwJbjfAgDkg0KcR3GgGrZoU87rXEeXgNj87VV+wm63144qS
         ohhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729123112; x=1729727912;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWOcAUhy/aqpDz553u2L9UKjBpofwGpehOSYl8woQYo=;
        b=MNmFk+0MvgtbCMn21gD+IIkoJi/xVQG2S3uGIIgWJ9XhA1DiwCuLsE9jhzl/FeBzuS
         YW1DMCkB0zn2Lzxpj/YX/c1u24LMr8PJ+B8Djc/gYFiIu6HNKuohaXuebs+Y6T+gG4S2
         jvR5S5aqfgS5wOlO7lmN8KIbhiWzAr4w2+aeYLaIHM1Jb+6tW7JQiZoZIl5hPmZ9vKbN
         W56lsKjKb4SxWJiWDN037CiNoGbcxNmRdHWh0fgK1p3vn7LoflTEnuhXHVDRAq0Wubul
         CoVRB3m1fEOGAVGrBGCHg+Fp+pvNuHOn9eEsdAm8baTgDY9RCiHMRA2kOv8NDhf/Kihx
         rIbg==
X-Forwarded-Encrypted: i=1; AJvYcCWaddCqlB/ptx49bLKl0/k52sCKaK6Vi3CLMX99BO/9UOazwrB4R8E+SNEnW7o2qzCVwmStiE5ksvEZ3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqHaiE3jbOrKOPk58JP5aBhYEOXNm4gQ5C4XWkKqXTdjiEbRgX
	soJIFR51/1HrOqbkRjjFMsKy1TwVLHoauEaiUCa6gKugSSk5zHWP7pI7hZWe2Ps=
X-Google-Smtp-Source: AGHT+IHKYKyt9hGNbG2NwFr4zrQbPdHWuysp67AwdzLwlH9R+yyQs6J1fjS1SLIc3JC6hBrMbrmZMg==
X-Received: by 2002:a05:6a21:3511:b0:1d8:ae07:c02 with SMTP id adf61e73a8af0-1d8bcfc38cbmr28048215637.47.1729123111761;
        Wed, 16 Oct 2024 16:58:31 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ea9c6d2af7sm3345158a12.40.2024.10.16.16.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 16:58:30 -0700 (PDT)
Date: Wed, 16 Oct 2024 16:58:30 -0700 (PDT)
X-Google-Original-Date: Wed, 16 Oct 2024 16:58:28 PDT (-0700)
Subject: Re: [PATCH v10 0/7] Linux RISC-V IOMMU Support
In-Reply-To: <cover.1729059707.git.tjeznach@rivosinc.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tjeznach@rivosinc.com
Message-ID: <mhng-31f89051-f430-4d85-ab27-23e5e77e008f@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_165833_555416_900B5867 
X-CRM114-Status: GOOD (  30.21  )
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
Cc: apatel@ventanamicro.com, devicetree@vger.kernel.org, conor+dt@kernel.org, aou@eecs.berkeley.edu, tjeznach@rivosinc.com, linux@rivosinc.com, Will Deacon <will@kernel.org>, joro@8bytes.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, seb@rivosinc.com, iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, mick@ics.forth.gr, krzk+dt@kernel.org, robin.murphy@arm.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxNSBPY3QgMjAyNCAyMzo1MjoxMiBQRFQgKC0wNzAwKSwgdGplem5hY2hAcml2b3Np
bmMuY29tIHdyb3RlOgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGludHJvZHVjZXMgc3VwcG9ydCBmb3Ig
UklTQy1WIElPTU1VIGFyY2hpdGVjdGVkCj4gaGFyZHdhcmUgaW50byB0aGUgTGludXgga2VybmVs
Lgo+Cj4gVGhlIFJJU0MtViBJT01NVSBzcGVjaWZpY2F0aW9uLCB3aGljaCB0aGlzIHNlcmllcyBp
cyBiYXNlZCBvbiwgaXMKPiByYXRpZmllZCBhbmQgYXZhaWxhYmxlIGF0IEdpdEh1Yi9yaXNjdi1u
b24taXNhIFsxXS4KPgo+IEF0IGEgaGlnaCBsZXZlbCwgdGhlIFJJU0MtViBJT01NVSBzcGVjaWZp
Y2F0aW9uIGRlZmluZXM6Cj4KPiAxKSBEYXRhIHN0cnVjdHVyZXM6Cj4gICAtIERldmljZS1jb250
ZXh0OiBBc3NvY2lhdGVzIGRldmljZXMgd2l0aCBhZGRyZXNzIHNwYWNlcyBhbmQgaG9sZHMKPiAg
ICAgcGVyLWRldmljZSBwYXJhbWV0ZXJzIGZvciBhZGRyZXNzIHRyYW5zbGF0aW9ucy4KPiAgIC0g
UHJvY2Vzcy1jb250ZXh0czogQXNzb2NpYXRlcyBkaWZmZXJlbnQgdmlydHVhbCBhZGRyZXNzIHNw
YWNlcyBiYXNlZAo+ICAgICBvbiBkZXZpY2UtcHJvdmlkZWQgcHJvY2VzcyBpZGVudGlmaWNhdGlv
biBudW1iZXJzLgo+ICAgLSBNU0kgcGFnZSB0YWJsZSBjb25maWd1cmF0aW9uIHVzZWQgdG8gZGly
ZWN0IGFuIE1TSSB0byBhIGd1ZXN0Cj4gICAgIGludGVycnVwdCBmaWxlIGluIGFuIElNU0lDLgo+
IDIpIEluLW1lbW9yeSBxdWV1ZSBpbnRlcmZhY2U6Cj4gICAtIENvbW1hbmQtcXVldWUgZm9yIGlz
c3VpbmcgY29tbWFuZHMgdG8gdGhlIElPTU1VLgo+ICAgLSBGYXVsdC9ldmVudCBxdWV1ZSBmb3Ig
cmVwb3J0aW5nIGZhdWx0cyBhbmQgZXZlbnRzLgo+ICAgLSBQYWdlLXJlcXVlc3QgcXVldWUgZm9y
IHJlcG9ydGluZyAiUGFnZSBSZXF1ZXN0IiBtZXNzYWdlcyByZWNlaXZlZAo+ICAgICBmcm9tIFBD
SWUgZGV2aWNlcy4KPiAgIC0gTWVzc2FnZS1zaWduYWxlZCBhbmQgd2lyZS1zaWduYWxlZCBpbnRl
cnJ1cHQgbWVjaGFuaXNtcy4KPiAzKSBNZW1vcnktbWFwcGVkIHByb2dyYW1taW5nIGludGVyZmFj
ZToKPiAgIC0gTWFuZGF0b3J5IGFuZCBvcHRpb25hbCByZWdpc3RlciBsYXlvdXQgYW5kIGRlc2Ny
aXB0aW9uLgo+ICAgLSBTb2Z0d2FyZSBndWlkZWxpbmVzIGZvciBkZXZpY2UgaW5pdGlhbGl6YXRp
b24gYW5kIGNhcGFiaWxpdGllcyBkaXNjb3ZlcnkuCj4KPgo+IFRoaXMgc2VyaWVzIGludHJvZHVj
ZXMgUklTQy1WIElPTU1VIGhhcmR3YXJlIGluaXRpYWxpemF0aW9uIGFuZCBjb21wbGV0ZQo+IHNp
bmdsZS1zdGFnZSB0cmFuc2xhdGlvbiB3aXRoIHBhZ2luZyBkb21haW4gc3VwcG9ydC4KPgo+IFRo
ZSBwYXRjaGVzIGFyZSBvcmdhbml6ZWQgYXMgZm9sbG93czoKPgo+IFBhdGNoIDE6IEludHJvZHVj
ZXMgbWluaW1hbCByZXF1aXJlZCBkZXZpY2UgdHJlZSBiaW5kaW5ncyBmb3IgdGhlIGRyaXZlci4K
PiBQYXRjaCAyOiBEZWZpbmVzIFJJU0MtViBJT01NVSBkYXRhIHN0cnVjdHVyZXMsIGhhcmR3YXJl
IHByb2dyYW1taW5nIGludGVyZmFjZQo+ICAgICAgICAgIHJlZ2lzdGVycyBsYXlvdXQsIGFuZCBt
aW5pbWFsIGluaXRpYWxpemF0aW9uIGNvZGUgZm9yIGVuYWJsaW5nIGdsb2JhbAo+ICAgICAgICAg
IHBhc3MtdGhyb3VnaCBmb3IgYWxsIGNvbm5lY3RlZCBtYXN0ZXJzLgo+IFBhdGNoIDM6IEltcGxl
bWVudHMgdGhlIGRldmljZSBkcml2ZXIgZm9yIFBDSWUgaW1wbGVtZW50YXRpb24gb2YgUklTQy1W
IElPTU1VCj4gICAgICAgICAgYXJjaGl0ZWN0ZWQgaGFyZHdhcmUuCj4gUGF0Y2ggNDogSW50cm9k
dWNlcyBJT01NVSBpbnRlcmZhY2VzIHRvIHRoZSBrZXJuZWwgc3Vic3lzdGVtLgo+IFBhdGNoIDU6
IEltcGxlbWVudHMgZGV2aWNlIGRpcmVjdG9yeSBtYW5hZ2VtZW50IHdpdGggZGlzY292ZXJ5IHNl
cXVlbmNlcyBmb3IKPiAgICAgICAgICBJL08gbWFwcGVkIG9yIGluLW1lbW9yeSBkZXZpY2UgZGly
ZWN0b3J5IHRhYmxlIGxvY2F0aW9uLCBoYXJkd2FyZQo+ICAgICAgICAgIGNhcGFiaWxpdGllcyBk
aXNjb3ZlcnksIGFuZCBkZXZpY2UgdG8gZG9tYWluIGF0dGFjaCBpbXBsZW1lbnRhdGlvbi4KPiBQ
YXRjaCA2OiBJbXBsZW1lbnRzIGNvbW1hbmQgYW5kIGZhdWx0IHF1ZXVlLCBhbmQgaW50cm9kdWNl
cyBkaXJlY3RvcnkgY2FjaGUKPiAgICAgICAgICBpbnZhbGlkYXRpb24gc2VxdWVuY2VzLgo+IFBh
dGNoIDc6IEltcGxlbWVudHMgcGFnaW5nIGRvbWFpbiwgdXNpbmcgaGlnaGVzdCBwYWdlLXRhYmxl
IG1vZGUgYWR2ZXJ0aXNlZAo+ICAgICAgICAgIGJ5IHRoZSBoYXJkd2FyZS4gVGhpcyBzZXJpZXMg
ZW5hYmxlcyBvbmx5IDRLIG1hcHBpbmdzOyBjb21wbGV0ZSBzdXBwb3J0Cj4gICAgICAgICAgZm9y
IGxhcmdlIHBhZ2UgbWFwcGluZ3Mgd2lsbCBiZSBpbnRyb2R1Y2VkIGluIGZvbGxvdy11cCBwYXRj
aCBzZXJpZXMuCj4KPiBGb2xsb3ctdXAgcGF0Y2ggc2VyaWVzIHByb3ZpZGluZyBNU0kgaW50ZXJy
dXB0IHJlbWFwcGluZywgY29tcGxldGUgQVRTL1BSSS9TVkEKPiBhbmQgVkZJTy9JT01NVUZEIHN1
cHBvcnQgYXJlIGF2YWlsYWJsZSBhdCB0aGUgR2l0SHViIFsyXSwgYW5kIGhhcyBiZWVuIHRlc3Rl
ZAo+IHdpdGggcHVibGlzaGVkIFFFTVUgUklTQy1WIElPTU1VIGRldmljZSBtb2RlbCBbM10uCj4K
PiBDaGFuZ2VzIGZyb20gdjk6Cj4gLSByZWJhc2Ugb24gdjYuMTItcmMzCj4gLSAjNiBNZW1vcnkg
b3JkZXJpbmcgZml4IGFuZCB1cGRhdGVkIGNvbW1lbnRhcnksIGJhc2VkIG9uIFdpbGzigJlzIHN1
Z2dlc3Rpb25zLgo+IC0gIzcgUmVtb3ZlIHJpc2N2X2lvbW11X2RldmljZV9kb21haW5fdHlwZSgp
IGFuZCB1c2UgaGVhZC1sZXNzIGtmcmVlX3JjdSBpbgo+ICAgICAgcmlzY3ZfaW9tbXVfcmVsZWFz
ZV9kZXZpY2UoKSwgYmFzZWQgb24gSmFzb24ncyBzdWdnZXN0aW9ucy4KPgo+IEJlc3QgcmVnYXJk
cywKPiAgVG9tYXN6IEplem5hY2gKPgo+IFsxXSBsaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlz
Y3Ytbm9uLWlzYS9yaXNjdi1pb21tdQo+IFsyXSBsaW5rOiBodHRwczovL2dpdGh1Yi5jb20vdGpl
em5hY2gvbGludXgvcmlzY3ZfaW9tbXUubmV4dAo+IFszXSBsaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9xZW11LWRldmVsLzIwMjQxMDA0MTU1NzIxLjIxNTQ2MjYtMS1kYmFyYm96YUB2ZW50
YW5hbWljcm8uY29tLwo+IHY5IGxpbms6ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1p
b21tdS9jb3Zlci4xNzI4NTc5OTU4LmdpdC50amV6bmFjaEByaXZvc2luYy5jb20vCj4gdjggbGlu
azogIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11L2NvdmVyLjE3MTgzODg5MDgu
Z2l0LnRqZXpuYWNoQHJpdm9zaW5jLmNvbS8KPiB2NyBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvbGludXgtaW9tbXUvY292ZXIuMTcxNzYxMjI5OC5naXQudGplem5hY2hAcml2b3NpbmMu
Y29tLwo+IHY2IGxpbms6ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS9jb3Zl
ci4xNzE2NTc4NDUwLmdpdC50amV6bmFjaEByaXZvc2luYy5jb20vCj4gdjUgbGluazogIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWlvbW11L2NvdmVyLjE3MTU3MDg2NzkuZ2l0LnRqZXpu
YWNoQHJpdm9zaW5jLmNvbS8KPiB2NCBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGlu
dXgtaW9tbXUvY292ZXIuMTcxNDc1MjI5My5naXQudGplem5hY2hAcml2b3NpbmMuY29tLwo+IHYz
IGxpbms6ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS9jb3Zlci4xNzE0NDk0
NjUzLmdpdC50amV6bmFjaEByaXZvc2luYy5jb20vCj4gdjIgbGluazogIGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWlvbW11L2NvdmVyLjE3MTM0NTY1OTcuZ2l0LnRqZXpuYWNoQHJpdm9z
aW5jLmNvbS8KPiB2MSBsaW5rOiAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtaW9tbXUv
Y292ZXIuMTY4OTc5MjgyNS5naXQudGplem5hY2hAcml2b3NpbmMuY29tLwo+Cj4gVG9tYXN6IEpl
em5hY2ggKDcpOgo+ICAgZHQtYmluZGluZ3M6IGlvbW11OiByaXNjdjogQWRkIGJpbmRpbmdzIGZv
ciBSSVNDLVYgSU9NTVUKPiAgIGlvbW11L3Jpc2N2OiBBZGQgUklTQy1WIElPTU1VIHBsYXRmb3Jt
IGRldmljZSBkcml2ZXIKPiAgIGlvbW11L3Jpc2N2OiBBZGQgUklTQy1WIElPTU1VIFBDSWUgZGV2
aWNlIGRyaXZlcgo+ICAgaW9tbXUvcmlzY3Y6IEVuYWJsZSBJT01NVSByZWdpc3RyYXRpb24gYW5k
IGRldmljZSBwcm9iZS4KPiAgIGlvbW11L3Jpc2N2OiBEZXZpY2UgZGlyZWN0b3J5IG1hbmFnZW1l
bnQuCj4gICBpb21tdS9yaXNjdjogQ29tbWFuZCBhbmQgZmF1bHQgcXVldWUgc3VwcG9ydAo+ICAg
aW9tbXUvcmlzY3Y6IFBhZ2luZyBkb21haW4gc3VwcG9ydAo+Cj4gIC4uLi9iaW5kaW5ncy9pb21t
dS9yaXNjdixpb21tdS55YW1sICAgICAgICAgICB8ICAxNDcgKysKPiAgTUFJTlRBSU5FUlMgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgOSArCj4gIGRyaXZlcnMvaW9tbXUv
S2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgIDEgKwo+ICBkcml2ZXJzL2lvbW11
L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgICAgfCAgICAyICstCj4gIGRyaXZlcnMvaW9t
bXUvcmlzY3YvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgMjAgKwo+ICBkcml2ZXJzL2lv
bW11L3Jpc2N2L01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgICAzICsKPiAgZHJpdmVycy9p
b21tdS9yaXNjdi9pb21tdS1iaXRzLmggICAgICAgICAgICAgIHwgIDc4NCArKysrKysrKwo+ICBk
cml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXBjaS5jICAgICAgICAgICAgICAgfCAgMTIwICsrCj4g
IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtcGxhdGZvcm0uYyAgICAgICAgICB8ICAgOTIgKwo+
ICBkcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LmMgICAgICAgICAgICAgICAgICAgfCAxNjYxICsr
KysrKysrKysrKysrKysrCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuaCAgICAgICAgICAg
ICAgICAgICB8ICAgODggKwo+ICAxMSBmaWxlcyBjaGFuZ2VkLCAyOTI2IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pb21tdS9yaXNjdixpb21tdS55YW1sCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2lvbW11L3Jpc2N2L0tjb25maWcKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9t
bXUvcmlzY3YvaW9tbXUtYml0cy5oCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11
L3Jpc2N2L2lvbW11LXBjaS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2lvbW11L3Jp
c2N2L2lvbW11LXBsYXRmb3JtLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUv
cmlzY3YvaW9tbXUuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9pb21tdS9yaXNjdi9p
b21tdS5oCj4KPgo+IGJhc2UtY29tbWl0OiA4ZTkyOWNiNTQ2ZWU0MmM5YTYxZDI0ZmFlNjA2MDVl
OWUzMTkyMzU0CgpBY2tlZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+
CgppZiBhbnlvbmUgd2FzIHdhaXRpbmcgb24gbWUuICBJSVVDIHRoZSBwbGFuIGhlcmUgd2FzIHRv
IGFpbSB0aGlzIGF0IHRoZSAKSU9NTVUgdHJlZSwgYnV0IEknbSBoYXBweSB0byBsb29rIGNsb3Nl
ciBhbmQgdGFrZSBpdCB0aHJvdWdoIHRoZSBSSVNDLVYgCnRyZWUgaWYgcGVvcGxlIHdhbnQuICBK
dXN0IExNSywgZm9yIG5vdyBJJ20gIGdvaW5nIHRvIGRvIG5vdGhpbmcgOykKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
