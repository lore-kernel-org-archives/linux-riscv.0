Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA055C98307
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 11:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VUPIpJtRzhDUxms//pjf/4kBqllrw+jBOmYeqMGMjNc=; b=JtH0DiFdJ5c7PD
	Wcfck6u2ZZD/rT7Ev5DLiAd6CgEEMetdIpOI4GaUY+kzpOzyLZ8ULQ/F2c7bw90g2FAiTXzXC3yoW
	mCgxZBYCTATxycXXmM8kSiU8GG2wdEDY29NvAYXaHz6EPCZZwCekoRKw9KrDfl3FAuJUW9uCCutws
	b184g+UtKJ8FbhCCPuMZhiLtHK04zmS0bS2o1ItqdCeLFx4OkeaJ1p+J8MaiopG7uyfo294hHiNBG
	PkIZCzlh9IEim8i8Vp09GU2bTTLZIp0MhbX+21AB/vV0ldXp5IcMMrwpfA6ManCiuz7zfDYjvBs2Y
	UKEgU7zL1TRVYjE+HuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ktv-000000080rZ-0efK;
	Wed, 23 Sep 2026 11:12:35 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Ktr-000000080r3-2Bjy
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 11:12:33 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-484366874b0so510106f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 23 Sep 2026 04:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790161949; cv=none;
        d=google.com; s=arc-20260327;
        b=JdcGc3dAXDfMolsql04I8W/bOBGASFustCpnn8l6I5ohPgSbZWLIaT6u1ARbGRA+/T
         C/EY9tOkZR5WxBa30R/ka3DpK46n9mqfizkl/LWrubrZJvN/WE9ptmm9J4s/tvDWNH+V
         7oFHadZ8nO4bVWkH9T2pqpFEP/A8RngwXSzXBTRNdg01LrdYgVTr7tSnLTB/GWweTS2N
         bUik0kpvZyNvWRJRmGsVL/8llgp88ajcL7GBDUABC4Shd3zzsWOKsXsXXlHSHP+VNHgG
         kPc7JPNnb2evkht9T6S+Y/+8MU7Zd7CfbVRPAqSyJZ8miDA6ratZHgWJYid3ryDNW+b7
         t6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcKgp7WxuTxdAyO4JZnM809V8L2x1IuAvkUQrt1z/LU=;
        fh=HS3Txp00xyf9utddYciDY91ufyt+7Xy6VM8JqLbVctY=;
        b=RnB/9bxZqIRmBaRRcBcLfvAlgqE72KPxQDdUJrF9tO6XnHAaUgEXIRp8HwUAeTN8oL
         OBZawCJypXgeLoxUp+tMFhBGz1VOzEvu98KbxXlMa89E5SvUVV/WifnhP9/sZL1BEGU/
         6USnIcs9uftbtm1vHQsL+YETlw7aYcVemi9ntKkN4k1L+UaKL9ar/wy4b2z0fQwI+R99
         coW7+TWPcgnVk2kpV486CGnRa40L6cp8Lyg7LNWmgezXb/t/VxLU5w2mvoBRwuhpryX/
         wPXerCurfaZfm/R+3605mQvBZBlQyXdYfQaGZ2pW12xsyyq4oNCEdSAOmMPfz/64gvRj
         A2zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790161949; x=1790766749; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcKgp7WxuTxdAyO4JZnM809V8L2x1IuAvkUQrt1z/LU=;
        b=r/mbwl6g5XG8Oz24oCZB4os1s8NVUyl6FN0nuO1qgsmktw2c9njX4roxOVdHthkJ//
         HQ8QjoSnT6DbVDd1TzKL0udCEMOodR9EYQgraY7G8g6iyuQF3sVK8JI99cnyiNdLzBg9
         t1eSDRGKWJPEeBAtozZgpmWYM79yEHjtREVbOHcUa1+GPEpMulLmFEz8/d47hct2P26u
         6lLrnqG2vRFlWx03g0ngWv+2vxNsb72HaYs04dmK6wfef1B9arh/vjTG5N975qD2Ynx4
         hIHLlnvybO0lgdVeifphLoU+V3K09yWPdOWtcCDsqwdn15c7I5ese3PaKa6648TDNHD8
         Xlug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161949; x=1790766749;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcKgp7WxuTxdAyO4JZnM809V8L2x1IuAvkUQrt1z/LU=;
        b=bAuayPgDKRr7cvY34ZbC18cbwrr6e3qmyWx5QI6mmKNc3DQvVjBO8YiK3mfS3U07ji
         YOpx94zo010zvjsdMqCKQrVN/a866kq9+EYNgWl1b3uUnjhdJlVmFAC2ijL1mI5S3IjD
         h7YOkS3L6qz5jlFkzR1CvaexBc1GLcXn4CxL1ew3w74bZWBx4YL4gueLsY1L1XJoeW76
         Cov7UF67fIt6z70Iad3ue5kGAIxhrevoYfD5AniJ7sq2W8PBsT+kpQc0Buk6KCUkDjsY
         7eSJpOfYnfY0QDBK/dHpMzUpPvM3/Yn/2i3fgtkpRR2PwOP7gNPF/8xyvc1mk7eDKnfu
         IWPg==
X-Forwarded-Encrypted: i=1; AKwUvBxYbJ7Ky4d1K/fJWLZtDMhocAUTe7wn875khCtJmztNZMd1iuOkD/IV8MPYNo+aPdkPXBkrT9O3VnC8Sw==@lists.infradead.org
X-Gm-Message-State: AFuF++lPYuQij+llcnnlh459Gd4u5YRgCvgrlA0IhykGeM1GO927ILav
	V7WhCx80+/gKYngx8trmpKt9JEgk00sXxX4isUS/TBg4KG1dQC2q/o/gQk9+So48eMXdhiPNwch
	NX42Yg/WCeQAz2jLAim94Jym/RDPRwhesWQBehmgARULyjqafVzKjf80=
X-Gm-Gg: AYBFou0pTjeD7eisshvnefh+nWtUaWiMZgxIwuWQdiuW/+qzsk52qX8F8ioyShP+OHA
	BPI2y89vMHonPtY0p5L+uW9es8KYn4zKKbGXCMZd65FZGRe8LSh4Dkfo0+3oNTi2Yjv3dMezZ85
	ZTXpu1MiTWILSmL/gT6Lnf8PR5TR1EorGX9/CEgKOGr5zqtIvaD5IiBD6MZXdNakV5d0+9yumig
	NWDA+dr4owB4KnbE3ucqDgoORu6p17jx0f1yeilfk3c25WmqxkLkp5KFQPfPrhpSOrHgfKTnEUC
	3hssuWWxjT1r4EcbI53f+0vXMY/BmVP2zgOGDEwmGBV00qbhJUHzdXHL7SgrkRBEiPoruuvkEmX
	4TK/YKPAzpr5oz7hBLXSSLuT2ea3EUoE/Q4QzahsRC0uQs3ktQZnaSbLF0avTgix889zBJ6qNH/
	brjNJkrvveBpfATxxtYpIFjw==
X-Received: by 2002:a05:6000:984:b0:487:27f6:a4de with SMTP id
 ffacd0b85a97d-488670997femr3395419f8f.46.1790161949261; Wed, 23 Sep 2026
 04:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
In-Reply-To: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Sep 2026 16:42:13 +0530
X-Gm-Features: AclHuK-jZxAsooGTuQFyAWbxOlVlJ_wooZD9l2irWRxzxDUFGfNbUwi7wtBl2nA
Message-ID: <CAAhSdy2Rso15xsRJt1Sx6XqpnJr4VKtsMfqaPNX=sVi_q2-hQQ@mail.gmail.com>
Subject: Re: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index fields
To: Pengpeng Hou <hppiscas@163.com>
Cc: tglx@kernel.org, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Bjorn Topel <bjorn@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Radu Rendec <radu@rendec.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_041231_613900_22979462 
X-CRM114-Status: GOOD (  18.36  )
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

T24gU3VuLCBTZXAgMjAsIDIwMjYgYXQgNjozOOKAr1BNIFBlbmdwZW5nIEhvdSA8aHBwaXNjYXNA
MTYzLmNvbT4gd3JvdGU6Cj4KPiBUaGUgSU1TSUMgYWRkcmVzcyBsYXlvdXQgcGxhY2VzIHRoZSBn
cm91cCBpbmRleCBhYm92ZSB0aGUgcGFnZSBvZmZzZXQsCj4gZ3Vlc3QgaW5kZXggYW5kIEhBUlQg
aW5kZXguIGltc2ljX3BhcnNlX2Z3bm9kZSgpIGNoZWNrcyB0aGUgaW5kaXZpZHVhbAo+IGZpZWxk
IHdpZHRocyBhbmQgdGhlIHVwcGVyIGVuZCBvZiB0aGUgZ3JvdXAgZmllbGQsIGJ1dCBkb2VzIG5v
dCBjaGVjawo+IHRoYXQgaXRzIGxvd2VyIGVuZCBpcyBhYm92ZSB0aGUgb3RoZXIgZmllbGRzLgo+
Cj4gUmVqZWN0IGEgbm9uemVybyBncm91cCBmaWVsZCB3aG9zZSBzaGlmdCBvdmVybGFwcyB0aGUg
bG93ZXIgZmllbGRzLgo+IE90aGVyd2lzZSBhIGZpcm13YXJlLXN1cHBsaWVkIGxheW91dCBjYW4g
YXNzaWduIHRoZSBzYW1lIGFkZHJlc3MgYml0IHRvCj4gZGlmZmVyZW50IGluZGljZXMgd2hlbiBN
U0kgdGFyZ2V0IGFkZHJlc3NlcyBhcmUgY29uc3RydWN0ZWQuCj4KPiBLZWVwIHRoZSBleGlzdGlu
ZyB1cHBlci1ib3VuZCBjaGVjayB1bmNoYW5nZWQuIFRoZSBuZXcgbG93ZXItYm91bmQKPiBjaGVj
ayBhcHBsaWVzIG9ubHkgd2hlbiBncm91cCBpbmRleCBiaXRzIGFyZSBwcmVzZW50Lgo+Cj4gVGhl
IGlzc3VlIHdhcyBmb3VuZCBieSBvdXIgc3RhdGljLWFuYWx5c2lzIHRvb2wuCj4KPiBGaXhlczog
MjFhOGY4YTBlYjM1ICgiaXJxY2hpcDogQWRkIFJJU0MtViBpbmNvbWluZyBNU0kgY29udHJvbGxl
ciBlYXJseSBkcml2ZXIiKQo+IEFzc2lzdGVkLWJ5OiBncHQgNQo+IFNpZ25lZC1vZmYtYnk6IFBl
bmdwZW5nIEhvdSA8aHBwaXNjYXNAMTYzLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKCj4gLS0tCj4gQ2hhbmdl
cyBzaW5jZSB2MTogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9jYXBsaXRtdXMtcnYuYmMzNmUz
YTBlYmNiNGEwMTgzODE3MWYyNzYyNTAwNGIuaW1zaWMtb3ZlcmxhcEAxNjMuY29tLwo+IC0gTGlt
aXQgdGhlIGNoYW5nZSB0byB0aGUgbG93ZXItYm91bmQgY2hlY2sgZGlzY3Vzc2VkIHdpdGggQW51
cC4KPiAtIEtlZXAgdGhlIGV4aXN0aW5nIHVwcGVyLWJvdW5kIGNoZWNrIHVuY2hhbmdlZC4KPiAt
IFNlbmQgdGhpcyBhcyBhIHN0YW5kYWxvbmUgcGF0Y2gsIHdpdGhvdXQgdGhlIHplcm8td2lkdGgt
Z3JvdXAgY2hhbmdlLgo+IC0gRG8gbm90IGNoYW5nZSBBUExJQyBjb25maWd1cmF0aW9uIG9yIHJl
cXVpcmUgdGhlIGVhcmxpZXIgc2VyaWVzLgo+Cj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3Yt
aW1zaWMtc3RhdGUuYyB8IDggKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3Rh
dGUuYyBiL2RyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1zaWMtc3RhdGUuYwo+IGluZGV4IGI4
ZDFiYmIuLmE3YjI0MWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1p
bXNpYy1zdGF0ZS5jCj4gKysrIGIvZHJpdmVycy9pcnFjaGlwL2lycS1yaXNjdi1pbXNpYy1zdGF0
ZS5jCj4gQEAgLTczOSw2ICs3MzksMTQgQEAgc3RhdGljIGludCBfX2luaXQgaW1zaWNfcGFyc2Vf
Zndub2RlKHN0cnVjdCBmd25vZGVfaGFuZGxlICpmd25vZGUsCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICAvKiBHcm91cCBpbmRleCBiaXRz
IG11c3Qgbm90IG92ZXJsYXAgZ3Vlc3QgYW5kIEhBUlQgaW5kZXggYml0cy4gKi8KPiArICAgICAg
IGkgPSBJTVNJQ19NTUlPX1BBR0VfU0hJRlQgKyBnbG9iYWwtPmd1ZXN0X2luZGV4X2JpdHMgKwo+
ICsgICAgICAgICAgIGdsb2JhbC0+aGFydF9pbmRleF9iaXRzOwo+ICsgICAgICAgaWYgKGdsb2Jh
bC0+Z3JvdXBfaW5kZXhfYml0cyAmJiBnbG9iYWwtPmdyb3VwX2luZGV4X3NoaWZ0IDwgaSkgewo+
ICsgICAgICAgICAgICAgICBwcl9lcnIoIiVwZndQOiBncm91cCBpbmRleCBzaGlmdCB0b28gc21h
bGxcbiIsIGZ3bm9kZSk7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAg
ICAgfQo+ICsKPiAgICAgICAgIC8qIFNhbml0eSBjaGVjayBncm91cCBpbmRleCBzaGlmdCAqLwo+
ICAgICAgICAgaSA9IGdsb2JhbC0+Z3JvdXBfaW5kZXhfYml0cyArIGdsb2JhbC0+Z3JvdXBfaW5k
ZXhfc2hpZnQgLSAxOwo+ICAgICAgICAgaWYgKGkgPj0gQklUU19QRVJfTE9ORykgewo+Cj4gYmFz
ZS1jb21taXQ6IDUxOGU1Yjc5NGMwNmMwZjBlYjQwZGYzZTIwMjI3NGE2NjIwMmMxMzcKPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
