Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AACC001DF
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 07:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzh27af+ZUNuQ0V42K3WhA/GbjfcnzPOLTJRH/c6FuM=; b=ZIquraTLhGOXzi
	ZVuVjRu9rDZPp+eB8Ppwy/GLY2bL93lX62NtVQALKQiyNOdRGeFebsxuxe9DI4BsLIkazyVAWbpXN
	YpaVWWyj0jwetaCHQCZ0LpDrnmY9ZTnUbEfIBdbD/hML+otyThbAZp1QHli6CebPTx5lvft4xXbat
	alN6KlPsNv8ML+v9L2bduIHirCr0sU4X82nEuOM+7+nk6Ap4Ba48se0VL0JJaxiJtlfhpLZRHxiE6
	qUALKhtGV2YyG/tHtj5VOuEKc32zi914Nu1RPv2HZNy2mrNTM7t44xEnNK8dSaUhwg424GrGeO4B6
	5tUt9n/Bnlr/yGpNc8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjuH-001Roz-2H;
	Fri, 20 Oct 2023 07:26:53 +0000
Received: from mail-yw1-f179.google.com ([209.85.128.179])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtjuE-001Rnc-2l
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 07:26:52 +0000
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7af20c488so5215517b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786804; x=1698391604;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NFzM112JR4s3C3Ua1fq88pZld5Dol8WVpdGu4Jwo26s=;
        b=D/Ht2TSHqpBpyu+rS7CYyFVoMylGTbQAgGcsr9UIkAPh/s8PwbgOdllwg80bfkPfmM
         j5//vMOS96QKPGFkP4iRvYmRWJn6OfRYQ42IAXKamODUU66VLs1kDoj5G3N6Uz+5MGJg
         LGNNiXgR+Gs80hOrxNbFXPGfnYYmYWjFE9SkQhDDoVKpZAEOojygvfW7Uggtw7yB6qyh
         Gv/K0bslnUiFt8oRbLJDXuDv+5a5KsiDarY0rEV8u5ku7+88/GzPhqBQZBkz4xZ20OPV
         7TmbWBqjFu5vfAmcZkDtxNQWmDgXxDIfX6kPr8lb6sfda7S7U/bN8lsbauUVdX1Oms1/
         Q4uQ==
X-Gm-Message-State: AOJu0YwrU/aEqjdkBSp0PKqWObqQIqD5CqlyYShdyXrfkBj1Gf3YzVuL
	KSVB3q46EBy7cezvsVccqQlQuDoEomxgqA==
X-Google-Smtp-Source: AGHT+IFwVirO+NfJvY0rz+QSDAOQL/7PsT3eq7EfR/5edqjI0G7JH08WZB4Nn2pmvUSfx2sCN7lTJg==
X-Received: by 2002:a81:7782:0:b0:58c:b8b4:2785 with SMTP id s124-20020a817782000000b0058cb8b42785mr1088005ywc.45.1697786804306;
        Fri, 20 Oct 2023 00:26:44 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id n20-20020a819e54000000b0059f766f9750sm478142ywj.124.2023.10.20.00.26.43
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Oct 2023 00:26:43 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-5a822f96aedso5075667b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 00:26:43 -0700 (PDT)
X-Received: by 2002:a81:a0c9:0:b0:5a8:2b82:a031 with SMTP id
 x192-20020a81a0c9000000b005a82b82a031mr1279096ywg.26.1697786802716; Fri, 20
 Oct 2023 00:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231019135810.3657665-1-peterlin@andestech.com>
In-Reply-To: <20231019135810.3657665-1-peterlin@andestech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Oct 2023 09:26:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+8RUpmhbcBjohZ5oF+wtakfNpwrxGFbZJvTN8_aJv9g@mail.gmail.com>
Message-ID: <CAMuHMdX+8RUpmhbcBjohZ5oF+wtakfNpwrxGFbZJvTN8_aJv9g@mail.gmail.com>
Subject: Re: [PATCH v2 04/10] riscv: dts: renesas: r9a07g043f: Update
 compatible string to use Andes INTC
To: Yu Chien Peter Lin <peterlin@andestech.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, tim609@andestech.com, 
	dylan@andestech.com, locus84@andestech.com, dminus@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_002650_899861_8F79FB7C 
X-CRM114-Status: GOOD (  17.81  )
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

SGkgWXUsCgpPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCA0OjAx4oCvUE0gWXUgQ2hpZW4gUGV0ZXIg
TGluCjxwZXRlcmxpbkBhbmRlc3RlY2guY29tPiB3cm90ZToKPiBUaGUgQW5kZXMgSU5UQyBhbGxv
d3MgQVg0NU1QIGNvcmVzIHRvIGhhbmRsZSBjdXN0b20gbG9jYWwKPiBpbnRlcnJ1cHRzLCBzdWNo
IGFzIHRoZSBwZXJmb3JtYW5jZSBtb25pdG9yIG92ZXJmbG93IGludGVycnVwdC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFl1IENoaWVuIFBldGVyIExpbiA8cGV0ZXJsaW5AYW5kZXN0ZWNoLmNvbT4KPiAt
LS0KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgLSBOZXcgcGF0Y2gKClRoYW5rcyBmb3IgeW91ciBw
YXRjaCEKCj4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRz
aQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvcmVuZXNhcy9yOWEwN2cwNDNmLmR0c2kKPiBA
QCAtMzcsNyArMzcsNyBAQCBjcHUwOiBjcHVAMCB7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjcHUwX2ludGM6IGludGVycnVwdC1jb250cm9sbGVyIHsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInJpc2N2LGNwdS1pbnRjIjsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYW5kZXN0ZWNoLGNwdS1pbnRjIjsK
ClRoaXMgY29tcGF0aWJsZSB2YWx1ZSBpcyBub3QgZG9jdW1lbnRlZC4gIFBlcmhhcHMgaXQgd2Fz
IGludHJvZHVjZWQKaW4gYW4gZWFybGllciBwYXRjaCBpbiB0aGUgc2VyaWVzLCB0byB3aGljaCBJ
IHdhcyBub3QgQ0NlZD8KClRocmVhZGluZyBpcyBicm9rZW4sIHNvIEkgY2FuJ3QgZWFzaWx5IGZp
bmQgdGhlIHdob2xlIHNlcmllcyBpbiBsb3JlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMzEwMTkxMzU4MTAuMzY1NzY2NS0xLXBldGVybGluQGFuZGVzdGVjaC5jb20vCgo+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgfTsKPiAgICAgICAgICAgICAgICAgfTsKCkdye29ldGplLGVldGlu
Z31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2
ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02
OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlz
dHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
