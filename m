Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB17EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltkhe9BOFO+EpYawG4pYuKtayGqZ700usN8O+CwVo5g=; b=Ov5ANzoBKfun+Y
	NbkVoPTQooeGnPyalHgRLPVzoSjfxAsxmkvR97BiypWlTsaVXBfgogu34alB2wm5Tm1kTbxsymuMk
	EX7oZ6TKMGug0A6xwOfwanFAKmM4DME3wmZNnZpInHSID4T1fgZy7v47AzidiLTBF1Z7aIw4EIw9g
	r5GmoL30y1gPCgoMBtDe6zgSAOWbTn7K+4EY+f12j2MuyH4hcUTkUv1uWBY+Z8GL96i1mkF1XMqqv
	NQkjSd4Cf+LsQnfevlO/LXN6lmJEPJ/LocPA2u4Uc+d6AfUKUvK2PBOc8FdEFefTKcB7liQ6ghr1M
	dOpzHBGS2a3VY6KRaqbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q0Q-00BfnS-1Z;
	Wed, 14 Jun 2023 12:53:46 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Q0N-00BfmE-1P
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 12:53:45 +0000
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6b13e2af122so4173969a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 05:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686747222; x=1689339222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3XWEKvAMOuR1l+m/B+1m8slMbaOUqRu1ZrBY3HpAHis=;
        b=dOZUuX8i3JLoN/YNfhfXlGljfKLcQ+C5/XthWMJWhtN5S6FR7j5ZMRZTnvrv6Hm3+f
         rXSuj6M1YhT7kNkxmCcmD1H7kYEZ8aQBurSNlKPBysulLljP3p1cZ2zmUN1fuvUnVYuq
         6ThiWACiJmKlE7lM2XPFYV5YG+GAZX1sTkeXXSbH5DiICzMM9/hvSwpYDpXLjIRFeM9F
         pNQpZhkhozjMEq7Du4F9yGdBKCfvjNcpi/sdqF02PDfJiwpH7dNakTmX+hBesmS59CRZ
         a8IUGwmpeNmQXysHWyQnLZk+/VYztadwTZaF8TiiFmx7soqiGmTJL2/2sD63st1Fu4i6
         qyjg==
X-Gm-Message-State: AC+VfDx5doPOUjQc2j7V7O9HbiT5bId6RrL9TBSrRz+mIXlNKLluOQ5C
	JsUbpAreFBQtw0aPUmkvYCKJ10Kmx9CVAg==
X-Google-Smtp-Source: ACHHUZ5X10EpUbwtmGrKOTJvx1ELhd01ldo2j0nBaYqTFPloyvm7SPox8jM5qpKLm78jPdD2eiQVPA==
X-Received: by 2002:a05:6830:1548:b0:6af:9900:1a87 with SMTP id l8-20020a056830154800b006af99001a87mr10605262otp.29.1686747221930;
        Wed, 14 Jun 2023 05:53:41 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id f22-20020a9d6c16000000b006ac87b54ca4sm5709643otq.34.2023.06.14.05.53.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 05:53:40 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5556e2bddf9so550478eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jun 2023 05:53:39 -0700 (PDT)
X-Received: by 2002:a05:6359:a26:b0:129:c25e:1cb0 with SMTP id
 el38-20020a0563590a2600b00129c25e1cb0mr8260221rwb.30.1686747219592; Wed, 14
 Jun 2023 05:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230614104759.228372-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230614104759.228372-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230614104759.228372-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jun 2023 14:53:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWApGKsS8DU7-=6j6WaRBDZ8Amig2NtA8f8=PbGKoFQjQ@mail.gmail.com>
Message-ID: <CAMuHMdWApGKsS8DU7-=6j6WaRBDZ8Amig2NtA8f8=PbGKoFQjQ@mail.gmail.com>
Subject: Re: [PATCH v9 3/6] riscv: mm: dma-noncoherent: nonstandard cache
 operations support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Guo Ren <guoren@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, 
	linux-riscv@lists.infradead.org, Christoph Hellwig <hch@infradead.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_055343_479139_25ABB592 
X-CRM114-Status: GOOD (  25.43  )
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

SGkgUHJhYmhha2FyLAoKT24gV2VkLCBKdW4gMTQsIDIwMjMgYXQgMTI6NDjigK9QTSBQcmFiaGFr
YXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBGcm9tOiBMYWQgUHJhYmhh
a2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4KPiBJbnRyb2R1
Y2Ugc3VwcG9ydCBmb3Igbm9uc3RhbmRhcmQgbm9uY29oZXJlbnQgc3lzdGVtcyBpbiB0aGUgUklT
Qy1WCj4gYXJjaGl0ZWN0dXJlLiBJdCBlbmFibGVzIGZ1bmN0aW9uIHBvaW50ZXIgc3VwcG9ydCB0
byBoYW5kbGUgY2FjaGUKPiBtYW5hZ2VtZW50IGluIHN1Y2ggc3lzdGVtcy4KPgo+IFRoaXMgcGF0
Y2ggYWRkcyBhIG5ldyBjb25maWd1cmF0aW9uIG9wdGlvbiBjYWxsZWQKPiAiUklTQ1ZfTk9OU1RB
TkRBUkRfQ0FDSEVfT1BTLiIgVGhpcyBvcHRpb24gaXMgYSBib29sZWFuIGZsYWcgdGhhdAo+IGRl
cGVuZHMgb24gIlJJU0NWX0RNQV9OT05DT0hFUkVOVCIgYW5kIGVuYWJsZXMgdGhlIGZ1bmN0aW9u
IHBvaW50ZXIKPiBzdXBwb3J0IGZvciBjYWNoZSBtYW5hZ2VtZW50IGluIG5vbnN0YW5kYXJkIG5v
bmNvaGVyZW50IHN5c3RlbXMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFi
aGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gLS0tCj4gdjggLT4gdjkKPiAq
IE5ldyBwYXRjaAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9kbWEtbm9uY29oZXJlbnQuaAo+IEBAIC0wLDAgKzEs
MjggQEAKPiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seSAqLwo+ICsv
Kgo+ICsgKiBDb3B5cmlnaHQgKEMpIDIwMjMgUmVuZXNhcyBFbGVjdHJvbmljcyBDb3JwLgo+ICsg
Ki8KPiArCj4gKyNpZm5kZWYgX19BU01fRE1BX05PTkNPSEVSRU5UX0gKPiArI2RlZmluZSBfX0FT
TV9ETUFfTk9OQ09IRVJFTlRfSAo+ICsKPiArI2luY2x1ZGUgPGxpbnV4L2RtYS1kaXJlY3QuaD4K
PiArCj4gKy8qCj4gKyAqIHN0cnVjdCByaXNjdl9jYWNoZV9vcHMgLSBTdHJ1Y3R1cmUgZm9yIENN
TyBmdW5jdGlvbiBwb2ludGVycwo+ICsgKgo+ICsgKiBAY2xlYW46IEZ1bmN0aW9uIHBvaW50ZXIg
Zm9yIGNsZWFuIGNhY2hlCj4gKyAqIEBpbnZhbDogRnVuY3Rpb24gcG9pbnRlciBmb3IgaW52YWxp
ZGF0ZSBjYWNoZQo+ICsgKiBAZmx1c2g6IEZ1bmN0aW9uIHBvaW50ZXIgZm9yIGZsdXNoaW5nIHRo
ZSBjYWNoZQo+ICsgKi8KPiArc3RydWN0IHJpc2N2X2NhY2hlX29wcyB7Cj4gKyAgICAgICB2b2lk
ICgqY2xlYW4pKHBoeXNfYWRkcl90IHBhZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpOwo+ICsgICAg
ICAgdm9pZCAoKmludmFsKShwaHlzX2FkZHJfdCBwYWRkciwgdW5zaWduZWQgbG9uZyBzaXplKTsK
PiArICAgICAgIHZvaWQgKCpmbHVzaCkocGh5c19hZGRyX3QgcGFkZHIsIHVuc2lnbmVkIGxvbmcg
c2l6ZSk7Cj4gK307CgpJIGd1ZXNzIHRoZSBuYW1pbmcgY2FuIGJlIGltcHJvdmVkPwoKLmNsZWFu
KCkgaXMgdXNlZCBieSBhcmNoX2RtYV9jYWNoZV93YmFjaygpIC8gYXJjaF93Yl9jYWNoZV9wbWVt
KCksCi5pbnZhbCgpIGlzIHVzZWQgYnkgYXJjaF9kbWFfY2FjaGVfaW52KCkgLyBhcmNoX2ludmFs
aWRhdGVfcG1lbSgpLAouZmx1c2goKSBpcyB1c2VkIGJ5IGFyY2hfZG1hX2NhY2hlX3diYWNrX2lu
digpIC8gYXJjaF9kbWFfcHJlcF9jb2hlcmVudCgpLgoKUGVyaGFwcyAud2JhY2soKSwgLmludigp
LCAud2JhY2tfaW52KCkgYXJlIG1vcmUgY2xlYXI/CgpJIHVuZGVyc3RhbmQgdGhpcyBpcyBzdWJq
ZWN0IHRvIGJpa2VzaGVkZGluZy4uLgpCdXQgaGV5LCBob3cgbWFueSBpbm5vY2VudCBiaXRzIG9m
IGRhdGEgaGF2ZSBhbHJlYWR5IGJlZW4gbG9zdCBkdWUKdG8gY2FjaGUgc2VtYW50aWMgbWlzbWF0
Y2hlcz8KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
CgotLQpHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBp
YTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdp
dGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdt
IHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRo
aW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
