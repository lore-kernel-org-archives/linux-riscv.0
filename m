Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFFFBC001DF
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 06:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RSSAgTxVA5IHpI+PO4U1NY7h315KEF5WPKSh9sLFnWI=; b=iHirQlr12AqZEi
	t4kbkGImdAQM+8rDqSrFZ7nYZ3J4b1E+r6xs1AmJ6GjyUlCby23qaTxSLv7wQiWuPpyt1ry8+kvB1
	PXu+IDxkfI85uQ7KDclq8OKl8XB7rP++7HEi/ZDd5OS5HId1xbs7bxAFUX4dYzdPypyWZzYsLeXRk
	GHJlvjDDAEaRgwDn5dWx/JYulrgDBQ2rqKI4BJMhllUzXmZ3VM5MCL5sQq4msG6aY9uR5p0bzbbVp
	DsTqHtIGZYBdrfOdo9SJz+4r2xPpOXFydXzwmOMDNu/Ixy5xpHV7NEvU4/VDK+CrnW9eE+4M371mg
	h4Xu2KX7lyrwd05guX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWAUi-003MA4-1w;
	Wed, 16 Aug 2023 06:59:04 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWAUf-003M98-0e
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 06:59:02 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9bb097c1bso93575401fa.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 23:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1692169138; x=1692773938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1T/ffbIc8NzM+seoeRvplgSZxtS5aju9Sme8SwmA5k=;
        b=rLNsh48s270TNVjFbA4/UMUVRld/7joa9DNt091Sna1Fy8+SbkgWUZb63CjSDyzJoQ
         iNwjI7dGXS6ILEwe480QupUxM5LQjcmuRgi1eg5dE79OU3G7WGel5+pH5BD2buBQxH7h
         rzxJvwGDA6K/N5lkL9J+c8vaN5OniJkVz4zfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692169138; x=1692773938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1T/ffbIc8NzM+seoeRvplgSZxtS5aju9Sme8SwmA5k=;
        b=UXhrORIFiiNyFRueynTxM33DAAtzglV1aswVA9y9i0R+1rXnJZtKj8DN543rT2Oc9X
         D9h8M7d1O1jnQp0ePee2X3dKm827XVvOZoayGhz9KcKyPH4X/qVV6Rv/VovnSsaLPFY1
         J6oYOKRUav+PwqTVWe5NDk5Gr7c4pthmAHsw1RZQW1B6MX9bjkoCOsucUtDSHE4TYYVw
         O1iakBDgllEImtuUy9DIJMx3wz1jya968LzvchfR4N/bKMMSNIKIpVrQvircMvQeFplm
         j7ofA3aHdGZDT0m0XOpYZCFdqzUaOS7UFtKWbjXa6G5Rjy8IM3EPsIU+6uLK9LYajJdU
         nSnQ==
X-Gm-Message-State: AOJu0Yzy9huR40yh1j622SUzCGKuTSLCeYSI0noiOZzPaucdLKYG6Ymq
	9+XquyN17wo3jKN+hlbkTEsRaTBdDc+cRFMKCQdy
X-Google-Smtp-Source: AGHT+IHh6hMd2Stt6NKj8pRtv/Ou1P9dak4/LxwKcazsZ5kZdz0d5VHrt8dBIrqQH2CUugTZmTNk59T++P27nIDiBpI=
X-Received: by 2002:a2e:9b51:0:b0:2b9:5b06:b73c with SMTP id
 o17-20020a2e9b51000000b002b95b06b73cmr786986ljj.17.1692169138032; Tue, 15 Aug
 2023 23:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230814043134.367280-1-mchitale@ventanamicro.com> <20230815-myself-disk-61b0a5535624@spud>
In-Reply-To: <20230815-myself-disk-61b0a5535624@spud>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 15 Aug 2023 23:58:47 -0700
Message-ID: <CAOnJCULjFsgxVotnDFH15h_TgXcBt4+eo-8228V=q6Mu6CrffQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/perf: Risc-V: Update platform specific firmware
 event handling
To: Conor Dooley <conor@kernel.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_235901_408364_FA6F1DE1 
X-CRM114-Status: GOOD (  15.10  )
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

T24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgNjoxOeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEF1ZyAxNCwgMjAyMyBhdCAxMDowMTozNEFNICsw
NTMwLCBNYXl1cmVzaCBDaGl0YWxlIHdyb3RlOgo+ID4gU0JJIHNwZWNpZmljYXRpb24gWzFdIHJl
c2VydmVzIGFuIGV2ZW50IGNvZGUgZm9yIHBsYXRmb3JtIHNwZWNpZmljCj4gPiBmaXJtd2FyZSBl
dmVudHMuIFVwZGF0ZSB0aGUgZHJpdmVyIHRvIHVzZSB0aGUgbmV3IHJlc2VydmVkIGV2ZW50IGNv
ZGUKPiA+IGZvciBwbGF0Zm9ybSBzcGVjaWZpYyBmaXJtd2FyZSBldmVudHMuIEFsc28gdXBkYXRl
IHRoZSByYXcgZXZlbnQgcGFyc2luZwo+ID4gdG8gdXNlIGJpdHMgNjM6NjIgaW5zdGVhZCBvZiBv
bmx5IGJpdCA2MyB0byBkaXN0aW5ndWlzaCBiZXR3ZWVuIHRoZSByYXcKPiA+IGV2ZW50IHR5cGVz
LiBUaGUgcGxhdGZvcm0gc3BlY2lmaWMgZmlybXdhcmUgZXZlbnRzIG11c3QgYmUgc3BlY2lmaWVk
IGluCj4gPiB0aGUgcGVyZiBjb21tYW5kIGFzIGluIHRoZSBiZWxvdyBleGFtcGxlOgo+ID4gcGVy
ZiBzdGF0ICAtZSByYzAwMDAwMDAwMDAwMDAwMSA8Y29tbWFuZD4KPiA+IHdoZXJlIFs2Mzo2Ml0g
PSAweDMgaW5kaWNhdGVzIGEgcGxhdGZvcm0gc3BlY2lmaWMgZmlybXdhcmUgZXZlbnQKPiA+Cj4g
PiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1zYmktZG9jL2Nv
bW1pdC9jNGJmZGY5IFsxXQo+ID4gU2lnbmVkLW9mZi1ieTogTWF5dXJlc2ggQ2hpdGFsZSA8bWNo
aXRhbGVAdmVudGFuYW1pY3JvLmNvbT4KPgo+IEhtbSwgYW5vdGhlciBxdWVzdGlvbiAtIGlzIHRo
aXMgYWN0dWFsbHkgaW4gYSBmcm96ZW4gdmVyc2lvbiBvZiB0aGUgU0JJCj4gc3BlYz8gSSBtaWdo
dCd2ZSBnb3QgZGlzdHJhY3RlZCBkdXJpbmcgdGhlIGxhc3QgUFJTIG1lZXRpbmcgYW5kIGJlCj4g
dW5hd2FyZSwgYnV0IEkgaGFkIGl0IGluIG15IGhlYWQgdGhhdCBpdCB3YXMgbm90IGZyb3plbi4K
Clllcy4gSXQgaXMgbm90IGZyb3plbiB5ZXQuIFdlIGFyZSBpbiB0aGUgcHJvY2VzcyBvZiBnZXR0
aW5nIGFsbCB0aGUKUlZJIGFwcHJvdmFscyB0byBmcmVlemUgdGhlIHNwZWMuCgotLSAKUmVnYXJk
cywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
