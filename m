Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B212CC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 20:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=QnIsAJUtmeD1m97IEOsv8Nz57K6JMRoNJ1KaVtWdTLU=; b=vfJBZ0Ag5WN1k59b1ZBFfXPQ8m
	VIyjbJyq4aRAch5QXuO44iAdxxJTBBsOJoAsmune6Mu4i8AFTHIfjlukLQDsawXsj9/UcwAYMvmkN
	HPAU4eHjxCiiNlRMpCiVwnkz7u4lBn7M9xdlNvME/VgL7Jv8a0f+dl+aazPwIZ/PXAmIY82q/kNlu
	HPOyMsff98PSkzNpXqLGWeoPAh4DGzcC2BZoMwfF16vslXRzzZphPCzL+TJ27GRsoURGnuY9095LB
	Si3L/XYFR4WOfz01aH9eJZEtZ0H5H2rXiwqs4MbjhphiOOo3Qpq0NcY0TwHfgs7Z0b+2uYSqsruBN
	gEUkF7ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oajzq-006MEw-T2; Tue, 20 Sep 2022 20:37:34 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oajzm-006MAx-RP
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 20:37:32 +0000
Received: by mail-pj1-x1032.google.com with SMTP id y11so4308663pjv.4
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 13:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=V/X2NQANvTDmkPd1F0YWtdFn++b8aCyFunzORsYrONQ=;
        b=TCs7kqkPQVrLQkRrAFwXm+g+FHBRWFoV2esGT6hmslFrkA05qpUHyeFUnJDyZ8ulQr
         I4Amixm2yJcjeuv90ODZ6IhHDPAJzeuzYkzc7zYTE1QIa8e5V/hPHIDbS5i6nOokcfr9
         cqTJAihIHVduLLHltI6VpNfxj96TgvybwBWvZKOaOI2jrMZv/U4vfBhHbr9MJYzXU839
         AqHOKNc90ry76qNuFowv999TixYYFmsATpgrYh2jV9fnUMdfFMOFi9KIVFjtEUqSJu6V
         MHzBlJB1f8iy1JgS2kMS7JK8WNIjtV1p+dvq1Z9q5xm1OfbrSw73pE/m1TpFIxsclOpR
         oh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=V/X2NQANvTDmkPd1F0YWtdFn++b8aCyFunzORsYrONQ=;
        b=jQM0oEY6+xBYW9RKsRduwxrxZ9EFIY3B6Ug694Xf3yiEQIvDDwGE99kpDwIXwmHD24
         4Eew3uIwLW7dju09cY6c4HE4BCh9+3o5HZ3YKtdluiAiIU5AKpjpj8dSC/7uMYqJQ5Av
         R/7wdNIBo4hcnfNxl4eprIrLRFesjmHh2iEnCPucBdMNperflfZZYHknd0eSX5TPJZ4D
         uHvKZms4LJx/jOn+urx53IhoUmo6jxyHAPTuPWZkPjoPI/qtGiBUdq02HD+aUyX1aCC5
         jM/LLi0p/Xf2dFZXAECXtjDj5xLROQ8lePZ8sEEDUbH9TnRqPMS60IY+M4d+nbnrLkRg
         l9CQ==
X-Gm-Message-State: ACrzQf2Hl1JD7QgbSBFk21ebk4Hjb1XIF/gRWGmaKE5zkjLAziSc3KzD
	FENqHq4KtLeJi0Yf3qQ4g6E56g==
X-Google-Smtp-Source: AMsMyM5sO4QMKnmIY21SZBsYUOz5HOAORsSvtVv/tBwcJEPQCvY+0Ll0j6T6ybkTXVyiPd865ztNaA==
X-Received: by 2002:a17:90a:4f4f:b0:202:7ab1:46ec with SMTP id w15-20020a17090a4f4f00b002027ab146ecmr5857272pjl.32.1663706247087;
        Tue, 20 Sep 2022 13:37:27 -0700 (PDT)
Received: from localhost (p57a238e9.dip0.t-ipconnect.de. [87.162.56.233])
        by smtp.gmail.com with ESMTPSA id x68-20020a623147000000b0053b850b17c8sm319621pfx.152.2022.09.20.13.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 13:37:26 -0700 (PDT)
Date: Tue, 20 Sep 2022 13:37:26 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Sep 2022 13:37:20 PDT (-0700)
Subject: Re: [PATCH v2] serial: sifive: enable clocks for UART when probed
In-Reply-To: <20220920160017.7315-1-olof@lixom.net>
CC: Greg KH <gregkh@linuxfoundation.org>, jirislaby@kernel.org,
  linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  Olof Johansson <olof@lixom.net>, u.kleine-koenig@pengutronix.de, emil.renner.berthing@canonical.com,
  Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Olof Johansson <olof@lixom.net>
Message-ID: <mhng-48b61fc8-ae88-4ebe-8d91-b49f13c5ba0f@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_133730_924731_8C817E57 
X-CRM114-Status: GOOD (  21.12  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMCBTZXAgMjAyMiAwOTowMDoxOCBQRFQgKC0wNzAwKSwgT2xvZiBKb2hhbnNzb24g
d3JvdGU6Cj4gV2hlbiB0aGUgUFdNIGRyaXZlciB3YXMgY2hhbmdlZCB0byBkaXNhYmxlIGNsb2Nr
cyBpZiBubyBQV01zIGFyZSBlbmFibGVkLAo+IGl0IGVuZGVkIHVwIGFsc28gZGlzYWJsaW5nIHRo
ZSBzaGFyZWQgcGFyZW50IHdpdGggdGhlIFVBUlQsIHNpbmNlIHRoZQo+IFVBUlQgZG9lc24ndCBk
byBhbnkgY2xvY2sgZW5hYmxlbWVudCBvbiBpdHMgb3duLgo+Cj4gVG8gYXZvaWQgdGhlc2Ugc3Vy
cHJpc2VzLCBzd2l0Y2ggdG8gY2xrX2dldF9lbmFibGVkKCkuCj4KPiBGaXhlczogYWNlNDFkNzU2
NGU2NTUgKCJwd206IHNpZml2ZTogRW5zdXJlIHRoZSBjbGsgaXMgZW5hYmxlZCBleGFjdGx5IG9u
Y2UgcGVyIHJ1bm5pbmcgUFdNIikKPiBDYzogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtv
ZW5pZ0BwZW5ndXRyb25peC5kZT4KPiBDYzogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVu
bmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4gQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+Cj4gQ2M6IFBhdWwgV2FsbXNsZXkgPHBhdWwud2FsbXNsZXlAc2lmaXZlLmNv
bT4KPiBTaWduZWQtb2ZmLWJ5OiBPbG9mIEpvaGFuc3NvbiA8b2xvZkBsaXhvbS5uZXQ+Cj4KPiAt
LS0KPgo+IHYyOiBTd2l0Y2ggdG8gZGV2bV9jbGtfZW5hYmxlZCgpIHBlciBVd2UncyBzdWdnZXN0
aW9uLgo+Cj4gLS0tCj4gIGRyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyB8IDIgKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jIGIvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2
ZS5jCj4gaW5kZXggNWMzYTA3NTQ2YTU4Li40YjFkNGZlODQ1OGUgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy90dHkvc2VyaWFsL3NpZml2ZS5jCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsL3NpZml2
ZS5jCj4gQEAgLTk0NSw3ICs5NDUsNyBAQCBzdGF0aWMgaW50IHNpZml2ZV9zZXJpYWxfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlyZXR1cm4gUFRSX0VSUihiYXNlKTsK
PiAgCX0KPgo+IC0JY2xrID0gZGV2bV9jbGtfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOwo+ICsJY2xr
ID0gZGV2bV9jbGtfZ2V0X2VuYWJsZWQoJnBkZXYtPmRldiwgTlVMTCk7Cj4gIAlpZiAoSVNfRVJS
KGNsaykpIHsKPiAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJ1bmFibGUgdG8gZmluZCBjb250cm9s
bGVyIGNsb2NrXG4iKTsKPiAgCQlyZXR1cm4gUFRSX0VSUihjbGspOwoKSSBoYXZlIG9uZSBvZiB0
aGVzZSBseWluZyBhcm91bmQgc29tZXdoZXJlIGlmIHlvdSBuZWVkIHNvbWVvbmUgdG8gdGVzdCAK
aXQsIGJ1dCBzb3VuZHMgbGlrZSB5b3UgaGFkIGZyb20gdGhlIHYxIGVtYWlsLiAgRWl0aGVyIHdh
eQoKQWNrZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29tPgpSZXZpZXdl
ZC1ieTogUGFsbWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+CgphcyB0aGlzIHNlZW1z
IGJldHRlciB0aGFuIHdoYXQgd2FzIHRoZXJlLgoKVGhhbmtzIQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
