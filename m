Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC76CDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hKDmvrZOhhPB5AzIchbsKpJ3KGK//6rMz57MWyc+HFs=; b=hQZ7fC/MHtjfzh
	96pmZnQZFmps7LPkv9f8mmJltu6E8TcEVEXvlfZ4dfD9J0415cNUaOLjeaIM2xoracgiVhKy+7yxa
	g/Ef/SuU5YrFYz93JwmNtTnUpis20xSjJnEU7eBmzuxRko8BzKT6uHLA6R5GrLynJQmQuK/pxUimn
	uDoZW7Azr086i4dqTiixNqkqv/PocJhTWXb9YKNkAkDgy96yFhCD4PgJfI1wLtMmQhy0hgo4t7bLQ
	u3fEya2QKzWzOlhVqD2ogOo3x9tn116QgZ4JCuxvzBVigWuiAupdi/IR4ZJQtHatfaLToimLGKpWj
	tcr9HUqvxURB8YTXKwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtk0F-001SSZ-36;
	Fri, 20 Oct 2023 07:33:03 +0000
Received: from mail-yw1-f182.google.com ([209.85.128.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtk0D-001SRo-0w
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:33:02 +0000
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7c011e113so5641357b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:32:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697787177; x=1698391977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VsN5y4fIi6cFNHhstQqXDFbqAjRT4Kg5GT/+7BP3xbs=;
        b=NQLQFIMvOCuKovG7qcgMe5YJz1ypX5v1vQGHWt9hVqskZrkWgK7gn6xInziZV7mIYd
         8cEHatEd7P9EbbNDBtiTpi++0lomrj8m7m1Q+UK4DH7DgCOnfKsFiNX9yudFNin1uWID
         cNZd9YsKtZbzCspKDQWi5SAltsOFgi+oc4ppPbX/Uwh2INN+hZvZpbhuB+Y1i9iKwLfR
         ENM89TN8M+r1PdkOZE1joiFeroynGS/FXrBq73/2hhCGAWA5qaVmHGIJfA0On7fTDkiS
         DIJYXwn45vAtKccpqU8+FGGtDEjC9aQjp9H4OmE2k8eUWXUuhKj6fQ9QKF2wmd7Xm+y9
         U2CA==
X-Gm-Message-State: AOJu0YxYcrnSdlDuNNbXb9BSLItd2X5nmyi+2mVLBDsj+Rt8R5N1+/sk
	8g74L2VouYDmvIx91coZsJRK8YweblpMHA==
X-Google-Smtp-Source: AGHT+IH+KI8wv1JemiOuZRIDtWlHNqvYS+n2l+CMfXYnxmIzMzkBKwMBHxrX+reFl5FKGHSKpbRl2w==
X-Received: by 2002:a05:690c:fd1:b0:5a7:ccf3:7163 with SMTP id dg17-20020a05690c0fd100b005a7ccf37163mr1250850ywb.15.1697787177006;
        Fri, 20 Oct 2023 00:32:57 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id s13-20020a81bf4d000000b005a7fbac4ff0sm481523ywk.110.2023.10.20.00.32.56
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 00:32:56 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5a7b3d33663so5499547b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:32:56 -0700 (PDT)
X-Received: by 2002:a81:7746:0:b0:5a8:7375:af6b with SMTP id
 s67-20020a817746000000b005a87375af6bmr1198848ywc.44.1697787176074; Fri, 20
 Oct 2023 00:32:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231019140232.3660375-1-peterlin@andestech.com>
In-Reply-To: <20231019140232.3660375-1-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Oct 2023 09:32:45 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1Ua4skxtT+9kyoSDiqt2kNiNG-1jHE8rf4+b14hX4Vg@mail.gmail.com>
Message-ID: <CAMuHMdW1Ua4skxtT+9kyoSDiqt2kNiNG-1jHE8rf4+b14hX4Vg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] riscv: dts: renesas: Add Andes PMU extension
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: magnus.damm@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com, 
	dylan@andestech.com, locus84@andestech.com, dminus@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_003301_351054_926E0E16 
X-CRM114-Status: GOOD (  17.82  )
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

SGkgUGV0ZXIsCgpPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCA0OjA14oCvUE0gWXUgQ2hpZW4gUGV0
ZXIgTGluCjxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPiBBZGQgInhhbmRlc3BtdSIg
dG8gSVNBIGV4dGVuc2lvbnMsIHRoZSBTQkkgUE1VIGRyaXZlciB3aWxsCj4gcHJvYmUgdGhlIGV4
dGVuc2lvbiBhbmQgdXNlIHRoZSBub24tc3RhbmRhcmQgaXJxIHNvdXJjZS4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KPiAtLS0K
PiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBOZXcgcGF0Y2gKClRoYW5rcyBmb3IgeW91ciBwYXRj
aCEKCj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRzaQo+
ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiBAQCAt
MjYsNyArMjYsNyBAQCBjcHUwOiBjcHVAMCB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgcmlz
Y3YsaXNhID0gInJ2NjRpbWFmZGMiOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJpc2N2LGlz
YS1iYXNlID0gInJ2NjRpIjsKPiAgICAgICAgICAgICAgICAgICAgICAgICByaXNjdixpc2EtZXh0
ZW5zaW9ucyA9ICJpIiwgIm0iLCAiYSIsICJmIiwgImQiLCAiYyIsICJ6aWNudHIiLCAiemljc3Ii
LAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgInppZmVu
Y2VpIiwgInppaHBtIjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICJ6aWZlbmNlaSIsICJ6aWhwbSIsICJ4YW5kZXNwbXUiOwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIG1tdS10eXBlID0gInJpc2N2LHN2MzkiOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGktY2FjaGUtc2l6ZSA9IDwweDgwMDA+Owo+ICAgICAgICAgICAgICAgICAgICAgICAgIGkt
Y2FjaGUtbGluZS1zaXplID0gPDB4NDA+OwoKVGhpcyBleHRlbnNpb24gaXMgbm90IGRvY3VtZW50
ZWQgaW4KRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMu
eWFtbC4gUGVyaGFwcyBpdCB3YXMKaW50cm9kdWNlZCBpbiBhbiBlYXJsaWVyIHBhdGNoIGluIHRo
ZSBzZXJpZXMsIHRvIHdoaWNoIEkgd2FzIG5vdCBDQ2VkPwoKVGhyZWFkaW5nIGlzIGJyb2tlbiwg
c28gSSBjYW4ndCBlYXNpbHkgZmluZCB0aGUgd2hvbGUgc2VyaWVzIGluIGxvcmU6Cmh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDIzMTAxOTE0MDIzMi4zNjYwMzc1LTEtcGV0ZXJsaW5AYW5k
ZXN0ZWNoLmNvbS8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJl
eW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cndo
ZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Ig
c29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
