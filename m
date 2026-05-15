Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF6BECD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 06:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A/dCXF4X1+qhq6badES1tGxgssjg2ihes1GdiT0Cmf4=; b=Og22fZwdQdWszb
	rmm1lDFvZ4oIBJTYlgo2ThI6wA26WrmeQQZOi6VL0lMQbl7GLqhp3AYM6ot8g2GSDu4jU/C6r9xE9
	WzikXUcG91NYFoOJLrh0dbjY5gNsSbmLufIbSLQlVlBch7MWCRLo9A913+6tivtTl2PWgz9aL91ao
	V/0pvJ13uElCD5t0hKz3h3GIc9hpes3A2t4BpCLZsuIxJwOm0l1vyoXBiYavmo9PBiY0AbVNgL+S0
	1ZgRlarrKdiHrBkQNR9MeYGMMy/P3XxJ7qHS1FdfYepZkTZHf9uoWu0JQlxFV6fvOVvalL7fvn1K1
	6DRomdFoo3B0hATOJw1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM8-00000007Xe5-3giN;
	Fri, 15 May 2026 06:49:08 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM5-00000007XcI-0neP
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 06:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MJZeZoi3lwfWnxM/Nl8ZViqM1Fkj9v9XGZB4s5D/a8M=; b=JV678qm9v3mHDMTs/Wyunvj8X1
	B9Q1AjoQhU8UVWJ3oizDHVlieBMmc1OszrqZuS5kRVjT/e1CkWYoVw7zI3sjbA4v0+eUE2dYIjgaY
	oKJydnpQMSpRtzI9XdhJtoJOiFCIFs1eqZq7hQHjGtZW7EOxMBBj+KNSHUTTbHMo1dYEAUGAop9or
	UrQy9LpW9BTGeF3m8MWk9dslHDscrsssifcSPvujGEOGJG7loZlFP9dEt9b/e6VsfZCFYVTUUIUlA
	J3yBT68pVmnsciV9r5I0gL53+wiSx2u5SNG5krj1xs8diVf3pkZ8MkVOfX4ssfJSNFROBLEbmifXl
	zAa0SgQg==;
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNmM2-000000017Qu-1D9C
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 06:49:04 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-7de431da8fbso7268513a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 14 May 2026 23:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778827739; cv=none;
        d=google.com; s=arc-20240605;
        b=f09snHcQcaPDTBSls4jhDRX1XEJq6kD0MdumNdvvEFFoUSz5eRhqD+VjDhxvOcnmIv
         57RyAtZYSCC/ACz2h0gmebVwZi9gDZnAYL4ZGvxC6brbOZErB2zMDiQ40BBvXEyT+SDI
         IkzMgu9CPRblQ6ujrTshFS9kT1fisfvh3AgeoEWeOIDfjynjWwKlMCQelOWUGVDTWC7I
         SMYNttWIRmNdh33wkyKLWrvOgTSockWTrnkozDi5A+05+Kh3iVwAzerHfbaiNQcclCUk
         pTjPR10XsM7HnY7zSl4tojb39iLki2bCqXotOyH+HBU6wpDAzFi02GG7G2nB+j+JyMOm
         rX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MJZeZoi3lwfWnxM/Nl8ZViqM1Fkj9v9XGZB4s5D/a8M=;
        fh=Y0HrPqKqB6lBYJqLA+pPy75fpVHdl1f42DnFSgoUXgs=;
        b=f902Ik1rRJEgx+wPtOirUwHRiNxabCcwcD69vfhbHssPJjjPC8MuI41VQtKq99HyAP
         CwQshaHuWCb6mchzY2UhDjdjbbHnRncpkmXqvRLySbe5m/36SR4uY2mU0QoC5Oceyg48
         qC4as5L/Lp4fCJAAQKCeJwaC/+RWb7fONle0NhPo6UR/cK0ON1SzdLZaOlyO6TeaGW7R
         xSq98aCYF5i10D+iXSZQALq0z02rkyM4FY4Edy/mxh0bTYVB+Bpb7TJ/pwOdWDqC9t0Q
         w9MWqPzDTTNi766KtB3O3vXt8kpCFVn9i+wp+C5ruCyfAu3yXeXqyc5sRU6olz4eod7O
         oLWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778827739; x=1779432539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJZeZoi3lwfWnxM/Nl8ZViqM1Fkj9v9XGZB4s5D/a8M=;
        b=dQqNSza7D9fXBUgBNB3x7dWdAWjWYSTVVsJ/TC7S1oGyJXwLnBqFQKszTWcXqDaUfy
         mFiAf7W1meWpjkDOhJcXBOc6DVKZewd2QTJGF5OJVQNRQ+bq5M+RCPvDFh3yQQ3pyARV
         Hg0WATFvpi+5UjvT2l+oqd27BHjxysQ9Br+PuawBbVO8MPHwA2/WgzHVjHgNtjMAjvh+
         dBzuLsd4B1zBP6j5Usog6KqP+oEuharTNYw2gAMKqGWYgl16htCCtTWYXYAso3zrNd2X
         +ogQdbqwjsUJkiPnMCaQBOxp/7hIMf3Thg6ixafc2h9MVDKMEQifz/zYcq07cAU4dmH9
         BUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778827739; x=1779432539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MJZeZoi3lwfWnxM/Nl8ZViqM1Fkj9v9XGZB4s5D/a8M=;
        b=e0XrdbVIIdkjVUy84lM6HTQd6qG6+dpM0b6Df3BLhesEWEwn/CB78wW83+Be1u6MnF
         iquITS2nnEA5APsp2RTnim93x3eBTMgqqdAl+TScrotQj1dRagSMyS0D9eXN5YBz0mfo
         gWp2udMBbHflCqRFFTtDOtUAbSwVoHwkTNUGIm0wY5QUwn05JyngS1NYCpKPHf9uNVmq
         TRkPgAuqMbm5bqiy4Um035jy6TX+vEBQGd9+Z7a6gA73pSR49/Mjrh03NwSN9UkiSoL2
         dGEWbbHW4N4rw+c6QM65u4h30F0/Wly4UkP0zYmOCncAlkgkWDe7EcdwhwBQ8cVR2Vxj
         cZvQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WuWnY40ZW9G+Ii0jWpS3eIg21BblfjiprdqJAgi0vaIySlUD5DQi1s8hosdiheiuxm0r9cn28+TUyHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTn33EL0lsV3qMKCJFeVhe1anL8EjNQTWtEm5yycLElzLnOAVd
	wDs8UfX837mN97i8HrpynxlI4iI7Tvp6nieVA0knoEGAd/zH5OHsvQSRhFent9PVLMe8OBjAP1N
	VrJomZD/MOQrISCo3Np4Bec4Oa1yw/SSvdbHt+ElZ5Q==
X-Gm-Gg: Acq92OGsFNWH1VYoBB3YioNYSIoKrnGQOgRB/fYacypUMrY97YRihJmM41Y6J4C81Er
	zBGTb12aKr84ZW6HAUagQqicABsRWEhHX4QLsqxNk7Vf0qp94sddbWgKdwKMf5JuVyt+GIlR3OY
	s+kZVbP3yAFpD60nkBfsnBqSitbSiy3yeyX/EsmPA9HnRJamz0aMS0lIgzvsR3/UnXuL17BRTmq
	NgRWG0fXxKBR9cz3N3NHBXySjKz2TGqfJepIH4+7C6d4ovLKKp6apbNaI0cELESwzTzFCXI4lfn
	eKtuLmE1UQeEIabz/B2JDIV4gTd4ZiRAnfgWPlTlSbBDob9+fuGj+bffOIuZFLyNoO44ItJueAP
	IivMswKo9zMbFZiOaD2uTR3PAEMk=
X-Received: by 2002:a05:6820:174b:b0:696:29cd:bf4b with SMTP id
 006d021491bc7-69c94b454admr1633046eaf.51.1778827738723; Thu, 14 May 2026
 23:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260514173642.41448-1-osama.abdelkader@gmail.com>
In-Reply-To: <20260514173642.41448-1-osama.abdelkader@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 12:18:45 +0530
X-Gm-Features: AVHnY4K8xzqoM5FY20mXX1nYOkYmhUWalyMOR_lK2NDzbN1JIwAiJwlW_5f4ndQ
Message-ID: <CAAhSdy1W_cQW0NfA6b3hX8CGtShZPgwbk1hhRB0jns6Dm+b9gg@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: kvm: return SBI_ERR_FAILURE for
 pmu_snapshot_set_shmem OOM
To: Osama Abdelkader <osama.abdelkader@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_074902_422746_1455CC74 
X-CRM114-Status: GOOD (  15.98  )
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

T24gVGh1LCBNYXkgMTQsIDIwMjYgYXQgMTE6MDbigK9QTSBPc2FtYSBBYmRlbGthZGVyCjxvc2Ft
YS5hYmRlbGthZGVyQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBrdm1fcmlzY3ZfdmNwdV9wbXVfc25h
cHNob3Rfc2V0X3NobWVtKCkgcmV0dXJuZWQgLUVOT01FTSBmcm9tIHRoZQo+IFNCSSBleHRlbnNp
b24gaGFuZGxlciwgd2hpY2ggY2F1c2VkIGt2bV9yaXNjdl92Y3B1X3NiaV9lY2FsbCgpIHRvCj4g
YWJvcnQgS1ZNX1JVTiBhbmQgc3VyZmFjZSB0aGUgZXJyb3IgdG8gdXNlcnNwYWNlIGluc3RlYWQg
b2YKPiBvbXBsZXRpbmcgdGhlIEVDQUxMIHdpdGggYSBuZWdhdGl2ZSBTQkkgZXJyb3IgaW4gYTAu
Cj4gVXNlIFNCSV9FUlJfRkFJTFVSRSBhbmQgdGhlIG5vcm1hbCByZXRkYXRhIHBhdGgsIG1hdGNo
aW5nIG90aGVyIFBNVQo+IGhhbmRsZXJzIGFuZCBrdm1fc2JpX2V4dF9wbXVfaGFuZGxlciBjb21t
ZW50Lgo+Cj4gRml4ZXM6IGMyZjQxZGRiY2RkNyAoIlJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgU0JJ
IFBNVSBTbmFwc2hvdCBmZWF0dXJlIikKPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IE9zYW1hIEFiZGVsa2FkZXIgPG9zYW1hLmFiZGVsa2FkZXJAZ21haWwuY29t
PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoK
UXVldWVkIHRoaXMgYXMgZml4IGZvciBMaW51eC03LjEtcmNYCgpUaGFua3MsCkFudXAKCgo+IC0t
LQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+IGluZGV4
IGE5MzVlZDk2YmMxNy4uOTFhYTAxNTVhNDIwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3Zt
L3ZjcHVfcG11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jCj4gQEAgLTQ1Myw4
ICs0NTMsMTAgQEAgaW50IGt2bV9yaXNjdl92Y3B1X3BtdV9zbmFwc2hvdF9zZXRfc2htZW0oc3Ry
dWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHMKPiAgICAgICAgIH0KPgo+ICAgICAg
ICAga3ZwbXUtPnNkYXRhID0ga3phbGxvYyhzbmFwc2hvdF9hcmVhX3NpemUsIEdGUF9BVE9NSUMp
Owo+IC0gICAgICAgaWYgKCFrdnBtdS0+c2RhdGEpCj4gLSAgICAgICAgICAgICAgIHJldHVybiAt
RU5PTUVNOwo+ICsgICAgICAgaWYgKCFrdnBtdS0+c2RhdGEpIHsKPiArICAgICAgICAgICAgICAg
c2JpcmV0ID0gU0JJX0VSUl9GQUlMVVJFOwo+ICsgICAgICAgICAgICAgICBnb3RvIG91dDsKPiAr
ICAgICAgIH0KPgo+ICAgICAgICAgLyogTm8gbmVlZCB0byBjaGVjayB3cml0YWJsZSBzbG90IGV4
cGxpY2l0bHkgYXMga3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QgZG9lcyBpdCBpbnRlcm5hbGx5ICovCj4g
ICAgICAgICBpZiAoa3ZtX3ZjcHVfd3JpdGVfZ3Vlc3QodmNwdSwgc2FkZHIsIGt2cG11LT5zZGF0
YSwgc25hcHNob3RfYXJlYV9zaXplKSkgewo+IC0tCj4gMi40My4wCj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
