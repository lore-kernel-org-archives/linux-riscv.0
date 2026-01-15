Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3C4D44C59
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 15:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7rbmDdh5c6uxeXB3YAiymiC5L+/zrXHKt+jw2hsUVJI=; b=Ph4s/aKtbukB4W
	zwCE+xyRZNiUCI9BjFmfiYf52jY8bxsMZaLTjppvqmZwr716RDvtF2PC0AwEKjmas+7rH9rauDPCd
	R13SjELwFt6+mo7Fuw1VdGCc7eAMUfYYERZExm1w3ZOlxl4elQDCrOLgkLN/vsLLqmflxiG6ebFbD
	Fbp2pjnM0olxXCuDEVgmg+hA3qo2Q8zFcVoEqq1YQ1BxiKC73ZA6jileE+2aF6Y1SMdFqaPAa6Khf
	JCNMklkKklJe7Zqpx8BBg8G+oHEzZc2TfLVuWccOrIquyXZnLQ9BcUB6NRtjCkejuG7uIfiOWI/ws
	sjWpv4Bv5GiwDbHLk6xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOxM-0000000CZCT-08Ek;
	Thu, 15 Jan 2026 15:08:16 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgOxJ-0000000CZC5-0DVN
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 15:08:14 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-661106487f9so741641eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 07:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1768489692; x=1769094492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/WDAGTa7lxdI346CUZNtUqntdwekcJCSjKlDS2a7yaE=;
        b=Dgae9g9dqEzvblxY6Y00dNhnsC4m3PWjhtqHaUA80bq6vjUj13d++A5XwCV6KWwnDb
         iI3RH/5jK77ZXgRaxbIXT7apG/+4K+3IOgoowhxNwBVHWrs8bdzY/1bXjQBz372cRqn7
         ngOKjGww5NPDhvaZHebEHAX0xwdNt8IqGXxTLDtlAf03QvBQ9aOhqkU+wW+f3u1XALqe
         Mxy7ho+mpdgvns72gQrFz3ucSaYNtBAbSr27MWqMtPirHyDRImxFItvemRHBprRcgPDp
         Ty1eunoA9jcXFdHUhKTD2fHJo0x3jaHzesQ6czWm+vGHAVl4u7FOVPdxrgHHeMAspeH/
         +gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768489692; x=1769094492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/WDAGTa7lxdI346CUZNtUqntdwekcJCSjKlDS2a7yaE=;
        b=qTHBSadoWHPgi8nmjH7smyQJjxCvECfgTFRB96sRjVlQSWk42moAzA35TtHt0CAybw
         70v8CHzLcUSZ6uGsozjZc7vgqvp8ZAJfw+fKfxnO9nqKPXpfkzrG2NTRn7UIiXAKrTaS
         CjTZCZG7GPhULg16SkYel/SDeOHLs995pngfpQ+Qx14oBy6q4eZsv7GOYLblUMImAeuu
         UPZZokkGgEsRO9YcBrNtKDxwL+lMm/ERjNXS5uzgwHOJBt+a3xH6h7FHzU/iiNlGOlSa
         sk6K3OpavBhKziK2bxrFNl/zGexC6PQbHWbXkVYIbekxVS5keXHP/jnvQJf1H+j61sR+
         EwQg==
X-Forwarded-Encrypted: i=1; AJvYcCUNVXHUzs+QfR7m4daJhCjXToU/vTDuZGC6C/Ya/gprguVGIlCQWpXVRT5emXUL1VhwDkjbliFAphsSJw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEU9rDn4R3W2SbQi3MFwM4zvh4ehxwplI/+1//jYsOwCf3Xxsx
	xfjeeBMpqPF6dAN5+P4U+hY5f4wGYf2T86+PLPobEYs4HRqj/gJbv0o/Trks9kkqCYTEjWqOwNr
	cDhmsTumNf8d6TXDWB6otTx5iVrfpTHLaRYBIVUe2+g==
X-Gm-Gg: AY/fxX4AXZqBTEkJxtYluB9K5e7eF0F82CywhY0DkQxOALwIzfPpsGCSqiovKg7ymDO
	wI5vtv4rRKKMCdtHhUhOzgzlzKJ3sdSjkWj9+H/MaBTsNO+4p2ZgP7Qh1dx4nSTIq0gJLvyn6ne
	+7p7P0LcVEnLdDkDi7e1Q+Ri/PBSNa4ArSh2rbccTLrVJpo8CS2rMpuHgLP1tagsr/KCrbmTKXF
	5pgOnWoaAiqoXOaWPcOdTqLUKDK1CgqPrOpPGnWbaCrc9tFgY5IIdgmoCyXoUXIQpuA2Fztu2Mz
	jDtUuFuVumIeFloIR9pMaG44SlQXdwvmO1TtKLa7BDx5315RpujRz/S0ug==
X-Received: by 2002:a05:6820:f015:b0:659:9a49:8f57 with SMTP id
 006d021491bc7-6611796eb8dmr26603eaf.28.1768489691647; Thu, 15 Jan 2026
 07:08:11 -0800 (PST)
MIME-Version: 1.0
References: <056a7d9af85a20633e54602b2c4d2c3bbbaadd78.1768486684.git.geert+renesas@glider.be>
In-Reply-To: <056a7d9af85a20633e54602b2c4d2c3bbbaadd78.1768486684.git.geert+renesas@glider.be>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 Jan 2026 20:37:59 +0530
X-Gm-Features: AZwV_QirfT0INJ_014FBj-iJZznt1dR8JjUdTooqlAOxrA58ebArJpuY48PF8ik
Message-ID: <CAAhSdy2jBPv1oHNMExddwkOxy8OsEfnWxOU_L+=NpbG+Eqb7MQ@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: Improve RISCV_SBI_MPXY_MBOX guidance
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Anup Patel <apatel@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_070813_358173_462102EC 
X-CRM114-Status: GOOD (  18.58  )
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

T24gVGh1LCBKYW4gMTUsIDIwMjYgYXQgNzo0OeKAr1BNIEdlZXJ0IFV5dHRlcmhvZXZlbgo8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+Cj4gUklTQy1WIFNCSSBNZXNzYWdlIFByb3h5
IChNUFhZKSBNYWlsYm94IHN1cHBvcnQgZGVmYXVsdHMgdG8gZW5hYmxlZCwgYnV0Cj4gdGhlIGhl
bHAgdGV4dCBzdGF0ZXMgIklmIHVuc3VyZSBzYXkgTiIuCj4KPiBSZWNvbW1lbmQgZW5hYmxpbmcg
dGhpcyBkcml2ZXIsIGFzIGl0IGlzIGEgdmVyeSBjcml0aWNhbCBSSVNDLVYgZHJpdmVyCj4gcHJv
dmlkaW5nIG1haWxib3ggY2hhbm5lbHMgdG8gb3RoZXIgZHJpdmVycyBzdWNoIGFzIGNsb2NrLCBz
eXN0ZW0gTVNJcywKPiBldGMuCj4KPiBGaXhlczogYmYzMDIyYTRlYjExOWM2YiAoIm1haWxib3g6
IEFkZCBSSVNDLVYgU0JJIG1lc3NhZ2UgcHJveHkgKE1QWFkpIGJhc2VkIG1haWxib3ggZHJpdmVy
IikKPiBTdWdnZXN0ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gU2ln
bmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRo
YW5rcywKQW51cAoKPiAtLS0KPiBUaGlzIGlzIHYyIG9mICJbUEFUQ0hdIG1haWxib3g6IFJJU0NW
X1NCSV9NUFhZX01CT1ggc2hvdWxkIGJlIGRpc2FibGVkCj4gYnkgZGVmYXVsdCIuCj4KPiB2MjoK
PiAgIC0gQ2hhbmdlIHRoZSBjb25maWcgZGVzY3JpcHRpb24gaW5zdGVhZCBvZiBjaGFuZ2luZyB0
byBub3QgZW5hYmxlZCBieQo+ICAgICBkZWZhdWx0LCBhcyByZXF1ZXN0ZWQgYnkgQW51cC4KPiAt
LS0KPiAgZHJpdmVycy9tYWlsYm94L0tjb25maWcgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21haWxib3gvS2NvbmZpZyBiL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnCj4gaW5kZXggZTQ3Y2I2
ODk4OTI2Nzg4MS4uYzI3YzEwOTdkYjIxYmUyNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21haWxi
b3gvS2NvbmZpZwo+ICsrKyBiL2RyaXZlcnMvbWFpbGJveC9LY29uZmlnCj4gQEAgLTM4Nyw3ICsz
ODcsNyBAQCBjb25maWcgUklTQ1ZfU0JJX01QWFlfTUJPWAo+ICAgICAgICAgICBNYWlsYm94IGRy
aXZlciBpbXBsZW1lbnRhdGlvbiBmb3IgUklTQy1WIFNCSSBNZXNzYWdlIFByb3h5IChNUFhZKQo+
ICAgICAgICAgICBleHRlbnNpb24uIFRoaXMgbWFpbGJveCBkcml2ZXIgaXMgdXNlZCB0byBzZW5k
IG1lc3NhZ2VzIHRvIHRoZQo+ICAgICAgICAgICByZW1vdGUgcHJvY2Vzc29yIHRocm91Z2ggdGhl
IFNCSSBpbXBsZW1lbnRhdGlvbiAoTS1tb2RlIGZpcm13YXJlCj4gLSAgICAgICAgIG9yIEhTLW1v
ZGUgaHlwZXJ2aXNvcikuIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gaGF2ZSB0aGlzIHN1cHBv
cnQuCj4gLSAgICAgICAgIElmIHVuc3VyZSBzYXkgTi4KPiArICAgICAgICAgb3IgSFMtbW9kZSBo
eXBlcnZpc29yKS4gU2F5IFkgaGVyZSwgdW5sZXNzIHlvdSBhcmUgc3VyZSB5b3UgZG8gbm90Cj4g
KyAgICAgICAgIG5lZWQgdGhpcy4KPgo+ICBlbmRpZgo+IC0tCj4gMi40My4wCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
