Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6F56EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 23:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3j4Q9UilD5vZ5ke842zcd8x2ThmuH4YR58uwqlpSvNk=; b=IrbJsj4Fm666EP
	+hu4z3eBSEmIZV1k6+syERgLI+CQbrN9Khu7J09KSgU/93Mogxdu+bdX8+kb+yoShLPAaRD6V6alm
	C6B+jo2axRQuyGX22YuadTIq65ATPQpvANRiTN/wgotJbMGMrWngcgRHoDsW3takSGbDkgQ1Pf2Z/
	gqz+PxyrljQX2dnuV+6BwOS85tYcMu4OMkQOhDgxDQ9SvEC2NrsFSWY0iVUkemXAGwReaFI+qntmj
	OjKmGeUDsDjpX1oHyatf9XuGV+F785E+Kg6nqe/pVi24LA3iNsYkNcrS4HAh2O1xwWSNC7iPSG1XY
	aDcYY/xBj8gfvVCzBD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0nr-002RFk-0s;
	Thu, 29 Jun 2023 23:11:55 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF0no-002RET-2i
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 23:11:53 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so1994163e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jun 2023 16:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688080309; x=1690672309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EwBX7q5dtknbGomGQRJHsffI3iPVn9g8XuVPo/NHc5I=;
        b=i4Jf468PDU/jpM64AFMYSZdOsJPeMOgikZjuhk9I1HT59sEShjOQa3Cz3cELcrochh
         C6KLqPsnHQUo0VMkG4S2l1qKYbKUpl1cuPjYtI9qV6upDUY3TnG+bJAZYXDtFVZ1K6u5
         o/R3yS+EqKggve5fi9XrePJiSQzvbA65XJHbZ0jkYMStC6fc9mVmrV2rFPAoLwor9byO
         IpQCNb+jcoE8DfsaliMzCrNH22W0NWw0HdcLUEP86+e5eWrW7ULbhH0JXZyM+/8+3f7U
         kEYNpW+b3y9KSqlNYGzk4JNfR3ExYDIOtNle0Nt8kwL7eHgNLUjE3yN0in2mTEAezSzE
         24Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688080309; x=1690672309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EwBX7q5dtknbGomGQRJHsffI3iPVn9g8XuVPo/NHc5I=;
        b=BoTqau3ThbjNng3h10rgCankuH1bK52BfcSCXm4Kk4af1J3uW2vsuGkH5T0VV9b60h
         ulZagAMAmgu4CLRZ9OVvBT1pahjQns7PDUZNPmU4jrDcvE/Tz7qbCjnkh12hRgEA5Mt2
         A48Dh5g/1s8zeLLtsH0SQ4FrTTf1663YwEUSMjwShb0tJP9Jdf3qdBabI8EFCjyRm9qw
         Yt125g3Gn+gMbAEy7pGtpy75Psku9T3eEXcmiPj9yTNrVSRfWaedeSSqWfy7HwLFp3oj
         nrV5nUV1Y5xETf2NvrLGoz8bbHmEdrYLNXfeca+XtAKkBnwI0LPganzMaH1y3bXqQQOt
         puVg==
X-Gm-Message-State: ABy/qLaDSusHvgI7FlS1Or1Z0r4sF/0t+YMyD9S7qTUYl7RTWG92l89j
	qdwemPo7dZA0f4kcBbIIKJ5OgGoQu5Af/NF5zh4zFw==
X-Google-Smtp-Source: APBJJlEormRhYZj0EFdg0C2hSimV6mwbCVwMKhCmJtPD2zLVec2g2bUJ3Bf7W/ZELa2aDVv6DlEX77bSge/z43MCKh8=
X-Received: by 2002:a05:6512:695:b0:4f8:68a3:38e2 with SMTP id
 t21-20020a056512069500b004f868a338e2mr1072204lfe.0.1688080309589; Thu, 29 Jun
 2023 16:11:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy> <20230629-uprising-harbor-439b85492132@wendy>
In-Reply-To: <20230629-uprising-harbor-439b85492132@wendy>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 29 Jun 2023 16:11:13 -0700
Message-ID: <CALs-Hstveza+RF0EP2XArXv1Xy5jQWv1VxjsgFbFZDn_9M03fA@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] RISC-V: add single letter extensions to riscv_isa_ext
To: Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_161152_877563_25A752EE 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, Rob Herring <robh+dt@kernel.org>, palmer@dabbelt.com, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdW4gMjksIDIwMjMgYXQgMTozMOKAr0FNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gU28gdGhhdCByaXNjdl9maWxsX2h3Y2FwKCkg
Y2FuIHVzZSByaXNjdl9pc2FfZXh0IHRvIHByb2JlIGZvciBzaW5nbGUKPiBsZXR0ZXIgZXh0ZW5z
aW9ucywgYWRkIHRoZW0gdG8gaXQuCj4gQXMgYSByZXN1bHQsIHdoYXQgZ2V0cyBzcGF0IG91dCBp
biAvcHJvYy9jcHVpbmZvIHdpbGwgYmVjb21lIGJvcmtlZCwgYXMKPiBzaW5nbGUgbGV0dGVyIGV4
dGVuc2lvbnMgd2lsbCBiZSBwcmludGVkIGFzIHBhcnQgb2YgdGhlIGJhc2UgZXh0ZW5zaW9ucwo+
IGFuZCB3aGlsZSBwcmludGluZyBmcm9tIHJpc2N2X2lzYV9hcnIuIFRha2UgdGhlIG9wcG9ydHVu
aXR5IHRvIHVuaWZ5IHRoZQo+IHByaW50aW5nIG9mIHRoZSBpc2Egc3RyaW5nLCB1c2luZyB0aGUg
bmV3IG1lbWJlciBvZiByaXNjdl9pc2FfZXh0X2RhdGEKPiBpbiB0aGUgcHJvY2Vzcy4KPgo+IFJl
dmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpSZXZp
ZXdlZC1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
