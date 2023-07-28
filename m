Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52518C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jul 2023 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/T2l8bLdS3Dji+oot073Bd9zrqMNGVikyrUc/Dz+fQ=; b=X9WVGnYIaz6prR
	6M6LsJ1jDzkwo2n9uDFsukv4hd4djz9YA19hjqsR57visOmBE97RKFdynSu7Tgq7E+hXKVB00idDm
	cZH0Vk8pX86IC/7J9lylF9T7PSC3KiAGowA2fhJLft+iTdqRV6PSHzslkNEvHcS8mBthhxcN84+R2
	mPUMfl6RNI9rl5sX8gOOM0HqlUPGu9fltEfIVIp5XgeW3icqrmuzM5BDKUt3gBR9HLGzig4MpdI/R
	ie5RrRnZyYD4+iFGqqGitueaH00FIZ1y7WTWEIjKWv99p7TMwsBx8pDUh9ftkDEU8wJdwzJBxRf/q
	TwEbdJ8GLj5vvoTXEzYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJx3-002ehP-0g;
	Fri, 28 Jul 2023 09:40:01 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPJwz-002egV-2u
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jul 2023 09:39:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9891c73e0fbso399211166b.1
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jul 2023 02:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690537195; x=1691141995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzOjDa/NiFfXAukG8EL/eyfE/m/LqMSufMn6fl5Fd5Q=;
        b=aELCmPUKOnOtKtdIdrm1ftrjdJY25iLwulcwpTSbyw3xoxyRfGgMUQLyqC/+aYAePg
         UvMPnLwyBdbseFNQ1JAylEiuzCN7CKvfl8ZkzseqD97oBAsgz04T6tTGgRB5gHsCsUQj
         P+dKNM6UY2calrABEpr42Ers0QQc/9Nh+0pO+h66YrLdJsZwnq7HELwOktlD3FcDth6P
         yTFQqrCIkJPWlUw5/b+qKo3REf2s+h+i/dyqmM1KtBAIhmhZfBW5k1cP5JuYaUO12oz/
         ILPMZsnUrJafM7hxQQHnh8972Qh64Od7CzZTM0AfVHQ0x2DcoZ7aXXbPL0BSD+kwXldV
         uwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690537195; x=1691141995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzOjDa/NiFfXAukG8EL/eyfE/m/LqMSufMn6fl5Fd5Q=;
        b=VoP0aZIM0yyiSbsCjkPy6st1lF0RkrlkmeE7fIcMj+QE+tDI7kME29IKKzRbiWHYvD
         gMZGcMLaeYqYrqyto8Xnwd78ioMGTaBHDlxhFvnKoiesRv/HsFwwN7pkn7mBx+mgK5OM
         pKuNbYC0nFYZ8t0xi7j+VO5w9cn+iS8xHTuBMBYaKPepTLACDqzjqOEmOUYMVLv0j2eV
         6GTpcsvGyHPfDpXc7ju7BvZw0GNiaJ6WzQftVw8BlSGL6bCpKejIVsOjLM1HZ/ZgLLO2
         zbphJ0F48HVcYPuLA18oem69dpCYsjFZCd+80wb0Beq3eTRsNwbHFjmArnsN0jQ3/JtZ
         RxLg==
X-Gm-Message-State: ABy/qLZkBCxOCxTcxT1SAiOcKsrmDA7/q0fjbNYXRv7FjTE4FH1JAoYO
	hzcTEktD03pQ0iw6SdQUNMAcCg==
X-Google-Smtp-Source: APBJJlEzVY3nftGhMOjUKhGUDDP2LVoqOpi/EgmGWeNfXear+Hqdo+hio8an3wet4513dTrvaHivKQ==
X-Received: by 2002:a17:907:784d:b0:99b:50ea:2f96 with SMTP id lb13-20020a170907784d00b0099b50ea2f96mr1995415ejc.12.1690537195124;
        Fri, 28 Jul 2023 02:39:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id si15-20020a170906cecf00b00992e265495csm1860758ejb.212.2023.07.28.02.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 02:39:54 -0700 (PDT)
Message-ID: <f7df407e-1deb-f667-912c-81415fffcbfd@linaro.org>
Date: Fri, 28 Jul 2023 11:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-US
To: Eric Lin <eric.lin@sifive.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, greentime.hu@sifive.com, vincent.chen@sifive.com
References: <20230720135125.21240-1-eric.lin@sifive.com>
 <20230720135125.21240-2-eric.lin@sifive.com>
 <cbf0a8fd-3479-1684-fe90-81f2159804ef@linaro.org>
 <CAPqJEFr5h+5+F4TdNuRMaWsrmeedbfGgbgd9wh8sUUQsj2Pw-A@mail.gmail.com>
 <be748338-987b-d474-d040-82af7cfb5f01@linaro.org>
 <CAPqJEFpYOgaEiSJ4HJwxMtpu1MZeUg9=tARTWa7hwTkjsQ3UAA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPqJEFpYOgaEiSJ4HJwxMtpu1MZeUg9=tARTWa7hwTkjsQ3UAA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_023957_951151_659DC8C9 
X-CRM114-Status: GOOD (  13.88  )
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

T24gMjgvMDcvMjAyMyAxMTowNCwgRXJpYyBMaW4gd3JvdGU6Cj4gT24gRnJpLCBKdWwgMjgsIDIw
MjMgYXQgMjo1OOKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPiA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPiB3cm90ZToKPj4KPj4gT24gMjgvMDcvMjAyMyAwODowMSwgRXJpYyBMaW4g
d3JvdGU6Cj4+PiBIaSBLcnp5c3p0b2YsCj4+Pgo+Pj4gT24gRnJpLCBKdWwgMjEsIDIwMjMgYXQg
NDozNeKAr1BNIEtyenlzenRvZiBLb3psb3dza2kKPj4+IDxrcnp5c3p0b2Yua296bG93c2tpQGxp
bmFyby5vcmc+IHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjAvMDcvMjAyMyAxNTo1MSwgRXJpYyBMaW4g
d3JvdGU6Cj4+Pj4+IFRoaXMgYWRkIFlBTUwgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBT
aUZpdmUgUHJpdmF0ZSBMMgo+Pj4+PiBjYWNoZSBjb250cm9sbGVyCj4+Pj4+Cj4+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEVyaWMgTGluIDxlcmljLmxpbkBzaWZpdmUuY29tPgo+Pj4+PiBSZXZpZXdlZC1i
eTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+Pj4+PiBSZXZpZXdlZC1ieTogTmljayBI
dSA8bmljay5odUBzaWZpdmUuY29tPgo+Pj4+Cj4+Pj4KPj4+PiAuLi4KPj4+Pgo+Pj4+PiArcHJv
cGVydGllczoKPj4+Pj4gKyAgY29tcGF0aWJsZToKPj4+Pj4gKyAgICBpdGVtczoKPj4+Pj4gKyAg
ICAgIC0gY29uc3Q6IHNpZml2ZSxwbDJjYWNoZTEKPj4+Pgo+Pj4+IEkgc3RpbGwgaGF2ZSBkb3Vi
dHMgdGhhdCBpdCBpcyBub3QgdXNlZCBpbiBhbnkgU29DLiBUaGlzIGlzIHdoYXQgeW91Cj4+Pj4g
c2FpZCBsYXN0IHRpbWU6ICJpcyBub3QgcGFydCBvZiBhbnkgU29DLiIKPj4+PiBJZiBub3QgcGFy
dCBvZiBhbnkgU29DLCB0aGVuIHdoZXJlIGlzIGl0PyBXaHkgYXJlIHlvdSBhZGRpbmcgaXQgdG8g
dGhlCj4+Pj4ga2VybmVsPwo+Pj4+Cj4+Pgo+Pj4gU29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5LiBJ
IGRpZG4ndCBkZXNjcmliZSBpdCBjbGVhcmx5IGxhc3QgdGltZS4KPj4+IEN1cnJlbnRseSwgd2Ug
aGF2ZSB0d28gaGFyZHdhcmUgdmVyc2lvbnMgb2YgcGwyY2FjaGU6IHBsMmNhY2hlMCBhbmQgcGwy
Y2FjaGUxLgo+Pj4gVGhlIHBsMmNhY2hlMCBpcyB1c2VkIGluIHVubWF0Y2hlZCBib2FyZCBTb0Mu
IFRoZSBwbDJjYWNoZTEgaXMKPj4+IHV0aWxpemVkIGluIG91ciBpbnRlcm5hbCBGUEdBIHBsYXRm
b3JtIGZvciBldmFsdWF0aW9uOyBpdCdzIG91ciBjb3JlCj4+PiBJUC4KPj4KPj4gQW5kIHdoeSBk
byB5b3UgYWRkIGJpbmRpbmdzIGZvciBzb21lIGludGVybmFsIEZQR0EgSVAgYmxvY2sgd2hpY2gg
ZG9lcwo+PiBub3QgaW50ZXJmYWNlIHdpdGggYW55IFNXPwo+Pgo+IAo+IEhpIEtyenlzenRvZiwK
PiBUaGUgcGwyY2FjaGUgaGFzIG1taW8gaW50ZXJmYWNlIGZvciBTVy4gVGhhbmtzLgoKVGhlbiBk
aWQgeW91IG1lYW4gdGhhdCBGUEdBIHJlcHJlc2VudGVkIHNvbWUgbW9kZWwgb2YgeW91ciBTb0M/
IElmIHNvLAp3aGF0IGFyZSBvdGhlciBiaW5kaW5ncyBmb3IgdGhhdCBGUEdBIGNvbXBvbmVudHM/
CgpCZXN0IHJlZ2FyZHMsCktyenlzenRvZgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
