Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D67CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZSFOqaMnF6vMaPSUv19XdFFJmcKAVTBa4HYA67w8E0=; b=YaCi8CDoot0fP+
	uZzxPeLQ4hEkEY5Y+VhJ+E0W30s1x8c9uGTVMif3jsxjRT8DYgVffZPsmP5rKkAAIPKl4hugk/ZMI
	Rhl9vRiK5lWGGWWkoLUDfvExVvhDXRp8bdr+kKHCsMP9wNWEDy8/0jMAUA8qznw7/OB9oNAyHpk2T
	zg3WBfsTsquAE4u1WyksADc1uUu5Y3Wz37P8/7JUKt90Rljpr/N3MpV7BRhELX0WzexcS7Q8ig5/A
	eoed6/lodNDeg1f61upMSaz1ynerKe2OMpT+wi+iEoUl2IPzsWrX0X8MNIQ5wD7G+5ibtPLZ0wRXS
	gwNsCiqztp/1ovIAGiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAIV-00FIxH-13;
	Wed, 18 Oct 2023 17:25:31 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtAIS-00FIwP-2N
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 17:25:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2c5071165d5so12136491fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 18 Oct 2023 10:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1697649925; x=1698254725; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tbixeUBAnXxzznhgP0IZfHR6Ap9ypS+fHg7KPLOGdDs=;
        b=xP2DJm2U1HM9udxYNGIBDhRF4RQIDNxs8fEVfQj86wPW1LBiiMjE7kRcxSJaYUvzxE
         OHtOt+qxM1A+6nzrsZv/RN8uwktLNmw3GafnD3R26nKayWxh13yCaDC6IxdogUXfNo6w
         uts8HNDEyWKtQ1VU62kz0fVhLYkb6DijpAuDuXUD9s8uqlL2BcxzbqpCYtJPrPSRCSeJ
         aT1MGitoi1r9eucg5i1LeFb9qna03al9N6mVCBkHw64CfLEA5uUJ+QnA5cKVROVb1BDW
         WjsLDpFWK1d7Q0d40GClfMja4kuABWVVbm/7MhYzKILAhGfl2r62LqaHy/5PeZ4nBonw
         A2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697649925; x=1698254725;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbixeUBAnXxzznhgP0IZfHR6Ap9ypS+fHg7KPLOGdDs=;
        b=D1LrbUcHLCc5rUWIVE5v5XvIRqocVxJ8uZizCmj8x2Ln6A9sTkED2puPhXyS0FYK4R
         xM7FLl/RWzCszu+wQnR3nqEwTzSxB0Wt08h7fy7ZLuYwM1yYvs6rbK4nXCXdqW5VkUT/
         1eSs34b0a9j2L52aIGe6vytkhNTzXzEt8BCBdhDr+pd1hBVNVBFzkMcpI5fpsNRonp06
         +Uhu1dKfAsc6ILbcUd5xq1JosG6McCrGgMGpN2U6dmUmD28FVZXwt150dTOGG5nMXtys
         TmwOj8fSMWjSrgjcq6qTUEVihpdWJZsLDgivrDCF8EBoHpvLzB5z0ZCWBBPuw48Sd4a6
         6O3Q==
X-Gm-Message-State: AOJu0YzH3ZKFes7YRV1iwfGIsLyDTH6TVtUSn8ZiTxX3kzGw3bELXi0o
	TqQjLapFASJtzKZCEPNMXWE1qsut341PUOWgJAD2yMz4cvL65I01
X-Google-Smtp-Source: AGHT+IHzFya1PKaT/fp+v+fPaWtz2nZSKePWthzhWNxfg7RP5nxfUjweywZ3NPnQfQWgt7OXrR8rjvSgSZf0oZQ26Nk=
X-Received: by 2002:a05:651c:10b2:b0:2c1:522a:8e25 with SMTP id
 k18-20020a05651c10b200b002c1522a8e25mr3786476ljn.32.1697649925479; Wed, 18
 Oct 2023 10:25:25 -0700 (PDT)
MIME-Version: 1.0
References: <20231017131456.2053396-1-cleger@rivosinc.com> <20231017131456.2053396-4-cleger@rivosinc.com>
In-Reply-To: <20231017131456.2053396-4-cleger@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 18 Oct 2023 10:24:49 -0700
Message-ID: <CALs-HssE=denuwBqH4KtCr1QqTzPb9rELW1ZXR5Cr-nqQQWQoA@mail.gmail.com>
Subject: Re: [PATCH v2 03/19] riscv: hwprobe: add support for scalar crypto
 ISA extensions
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Jones <ajones@ventanamicro.com>, 
	Conor Dooley <conor@kernel.org>, Samuel Ortiz <sameo@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_102528_771789_1C223741 
X-CRM114-Status: GOOD (  14.40  )
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

T24gVHVlLCBPY3QgMTcsIDIwMjMgYXQgNjoxNeKAr0FNIENsw6ltZW50IEzDqWdlciA8Y2xlZ2Vy
QHJpdm9zaW5jLmNvbT4gd3JvdGU6Cj4KPiBFeHBvcnQgdGhlIGZvbGxvd2luZyBzY2FsYXIgY3J5
cHRvIGV4dGVuc2lvbnMgdGhyb3VnaCBod3Byb2JlOgo+Cj4gLSBaYmtiCj4gLSBaYmtjCj4gLSBa
Ymt4Cj4gLSBaa25kCj4gLSBaa25lCj4gLSBaa25oCj4gLSBaa3NlZAo+IC0gWmtzaAo+IC0gWmt0
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+
Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgfCAzMCArKysr
KysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3
cHJvYmUuaCB8IDEwICsrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYyAg
ICAgICAgIHwgMTAgKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1
bWVudGF0aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4gaW5kZXggYTUyOTk2YjIyZjc1Li45Njg4OTU1
NjJkNDIgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKPiBAQCAtNzcsNiArNzcsMzYgQEAg
VGhlIGZvbGxvd2luZyBrZXlzIGFyZSBkZWZpbmVkOgo+ICAgICogOmM6bWFjcm86YFJJU0NWX0hX
UFJPQkVfRVhUX1pCU2A6IFRoZSBaYnMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5l
ZAo+ICAgICAgICAgaW4gdmVyc2lvbiAxLjAgb2YgdGhlIEJpdC1NYW5pcHVsYXRpb24gSVNBIGV4
dGVuc2lvbnMuCj4KPiArICAqIDpjOm1hY3JvOmBSSVNDVl9IV1BST0JFX0VYVF9aQkNgIFRoZSBa
YmMgZXh0ZW5zaW9uIGlzIHN1cHBvcnRlZCwgYXMgZGVmaW5lZAo+ICsgICAgICAgaW4gdmVyc2lv
biAxLjAgb2YgdGhlIFNjYWxhciBDcnlwdG8gSVNBIGV4dGVuc2lvbnMuCgpBdCBsZWFzdCBpbiBt
eSB2MS4wLjEgdmVyc2lvbiBvZiB0aGUgY3J5cHRvIHNjYWxhciBzcGVjLCBJIGRvbid0IHNlZQpa
YmMuIFRoYXQgc2VlbXMgdG8gYmUgZGVmaW5lZCBpbiB0aGUgYml0IG1hbmlwdWxhdGlvbiBleHRl
bnNpb25zLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
