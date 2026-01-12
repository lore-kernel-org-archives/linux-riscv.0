Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB82C9EC77
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 11:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4J1nNK5/hmWUeHB7Z0/WG+9TxuH5T7Tu7OofKx+hMXs=; b=n1LL2Qkm/XGwD+
	+ieSuKVGVGvGaTz/0lLaNb3P0erJsXz8wrvE9oYpPo01V/Da16CCmGaxZvdnhGEP5WXhi/+7hkFYD
	7flbEGvE/U6Goitkkp8t88p4QshdbvNjApVuRvnQylZRHys00p8xmCoy4buc7vHabhpCf4bbC8MV/
	OuucH4qDQpmwAC4kLtzREFjp7qDIzGoUs6Nk317hqPG71cATfwkkQtk2Va2iu3FaK8N4ZY28dgi8y
	SNQ1tuvUhZqiOu7mFdBlqpm2M/7Qa3DbdBYZLELS6eqF9YxrAr8c0/X+gPPItHKxyZgHQn38KW0hV
	8We6dFWa+BreCD10NbQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGZT-00000005IHh-21J3;
	Mon, 12 Jan 2026 11:58:55 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfGZR-00000005IHI-1PAM
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jan 2026 11:58:54 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-3f9ebb269c3so2915974fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 03:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1768219131; x=1768823931; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/STUq3tlNYx1CRPqYo/MSQ91muzU5RYxKWjoD/GoBRc=;
        b=gYfmxYmrY1156vW43DX3wR4z03tH52a0QADEh8Yp3Z2lZye/TaPwGSyW2o8RuG9dNE
         od4R5TKRmoPoJDQvAEjQnHKKcgv7Kfubbko8LIS18H9+cZKieBwKdSBL5PALyOhAZk/o
         LciLo+pHHuLisINHhh2QjUDcDCIcjs3tEONoTxpcMl5yi+XvdaOnEth5J8sUJrJqxKk2
         81hOGRVpOWgAMLz8t0/ee9fihB3zf4bbMafIyJgI8plXCUKJyf5XxZoiOqQW0fqB8kQs
         VempOM/j9gIgkmrRzl/I5PW8P2M+oBa9lKVDX8AMge6o3qvryNL2QhYisIXhtW4AkQhA
         +aKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768219131; x=1768823931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/STUq3tlNYx1CRPqYo/MSQ91muzU5RYxKWjoD/GoBRc=;
        b=wcBxvnpqKw4cBB6I/nuh+qRtASi9Iq6V6raAnn76UbYsscOcqEYiH1pwn+QPqyYMMT
         Vm/DhaJC5I1Mo8hsaAUopuefgFh3ajnZrOR2g5DWiFJ/qD94v9gBelZhsvgW8FFf8b4c
         czidpY5TjNPLkwkw3LH7ORjjq2cS7+vaxO00z9UMgjhSBFkFYE0VYbgijiNy8QqqKMl6
         M3HtQejIxQ8ots8ajFJ0yDqbAz5SMak+ogvOO5x+Rx59/92p2v9EGPtJxLi/61X2ACwW
         lOA2iFcAZfc0iIvLfKse/hJGLa71ZRZUYeVgbtZiq6BvCw0LW2gaUl+NNxN4n5dUDWxc
         yEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmMs1WA5o+vemh0gO/JCUQappNSlAhVF11KbV5sGf7FsUYBlIJB+qcjegF2zTbqIcqZTWt8R0aaUL1GA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb4fYVqAHEci+A8IqawRPkuGa8b2S4Tza0rEExzV6bU36LB8Ig
	IQo6bn4VdbLcYxtKRWOpz98zSPbmxgE5I9LFLK8po8MM4wPjjZzT66B3iiK3NXylxVZDP1DomBk
	VZ8JL7V6Mf0mK9sljvV+HnPYiDJO6JUd3NNUCp4bcuA==
X-Gm-Gg: AY/fxX4gXEz9DTZo4Uw53eeyQrGMoyVsYbMRQ5TJznlsHU3BTr+VluPs2NjJVgBhwIC
	lpuSxNjxZkOMDFNJALZzBmVd2g2efp8tMsY1Y7MH6m/QNR+K9AycKW3HjzzVcPy1fHnL4bgffYj
	BZ6LWsykUUN8GHL2biY1SFCAGS8GqPX8J930yhBfYh1aiui8uIAZFEQWSe1oUxFBui3XLqGU12o
	q3FSrO62cx9V6buoAZmVHBt4zEdBwpWBK1wVClisVHMSp/A/7VUu+m0UMzrHlLmih3OXu7Xpzy4
	Zq84QyUeqDaWqipULOUFZw1duVPvDgf+sZVZNh1zoJ547JyS84K86Y2DDg==
X-Google-Smtp-Source: AGHT+IF39t3pEDBTDiz8rtvG2ug4qMAL7z0aOTj1Od1tfioVHcOSk11OADaheOvt4o4y6lBRYQlM3myJcoiNTwzaEUw=
X-Received: by 2002:a05:6820:625:b0:65f:6705:3f83 with SMTP id
 006d021491bc7-65f6705421amr5066461eaf.28.1768219130936; Mon, 12 Jan 2026
 03:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20260106092117.3727152-1-joshua.yeong@starfivetech.com>
 <20260106092117.3727152-5-joshua.yeong@starfivetech.com> <CABdD5xmVVkQu6rYzF52V-JrsdL=NOQa9N9i8PsMgfaOh3GT-Bg@mail.gmail.com>
In-Reply-To: <CABdD5xmVVkQu6rYzF52V-JrsdL=NOQa9N9i8PsMgfaOh3GT-Bg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jan 2026 17:28:39 +0530
X-Gm-Features: AZwV_QiG8kGYWz6U6xcjoWbaLPAqYlKLwNkT660rcNE0-IopoQC27BXEnEP-0xA
Message-ID: <CAAhSdy17NphDM=bgyvM-eNA9DAGku6p56HSXv5hgZh5VmMfE7Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] cpufreq: Add cpufreq driver for the RISC-V RPMI
 performance service group
To: Rahul Pathak <rahul@summations.net>
Cc: Joshua Yeong <joshua.yeong@starfivetech.com>, leyfoon.tan@starfivetech.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, rafael@kernel.org, 
	viresh.kumar@linaro.org, sboyd@kernel.org, jms@oss.tenstorrent.com, 
	darshan.prajapati@einfochips.com, charlie@rivosinc.com, 
	dfustini@oss.tenstorrent.com, michal.simek@amd.com, cyy@cyyself.name, 
	jassisinghbrar@gmail.com, andriy.shevchenko@linux.intel.com, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_035853_481092_A3F58909 
X-CRM114-Status: GOOD (  18.17  )
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

T24gTW9uLCBKYW4gMTIsIDIwMjYgYXQgNDoxOOKAr1BNIFJhaHVsIFBhdGhhayA8cmFodWxAc3Vt
bWF0aW9ucy5uZXQ+IHdyb3RlOgo+Cj4gPiArCj4gPiArc3RhdGljIGludCBycG1pX2NwdWZyZXFf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICt7Cj4gPiArICAgICAgIHN0
cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4gPiArICAgICAgIHN0cnVjdCBycG1pX3Bl
cmYgKm1weHlfcGVyZjsKPiA+ICsgICAgICAgc3RydWN0IHJwbWlfY3R4ICptcHh5X2N0eDsKPiA+
ICsgICAgICAgaW50IG51bV9kb21haW5zID0gMDsKPiA+ICsgICAgICAgaW50IHJldCwgaTsKPiA+
ICsKPiA+ICsgICAgICAgbXB4eV9jdHggPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9m
KCptcHh5X2N0eCksIEdGUF9LRVJORUwpOwo+ID4gKyAgICAgICBpZiAoIW1weHlfY3R4KQo+ID4g
KyAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gKwo+ID4gKyAgICAgICAvKiBTZXR1
cCBtYWlsYm94IGNsaWVudCAqLwo+ID4gKyAgICAgICBtcHh5X2N0eC0+Y2xpZW50LmRldiAgICAg
ICAgICAgID0gZGV2Owo+ID4gKyAgICAgICBtcHh5X2N0eC0+Y2xpZW50LnJ4X2NhbGxiYWNrICAg
ID0gTlVMTDsKPiA+ICsgICAgICAgbXB4eV9jdHgtPmNsaWVudC50eF9ibG9jayAgICAgICA9IGZh
bHNlOwo+ID4gKyAgICAgICBtcHh5X2N0eC0+Y2xpZW50Lmtub3dzX3R4ZG9uZSAgID0gdHJ1ZTsK
PiA+ICsgICAgICAgbXB4eV9jdHgtPmNsaWVudC50eF90b3V0ICAgICAgICA9IDA7Cj4gPiArCj4g
PiArICAgICAgIC8qIFJlcXVlc3QgbWFpbGJveCBjaGFubmVsICovCj4gPiArICAgICAgIG1weHlf
Y3R4LT5jaGFuID0gbWJveF9yZXF1ZXN0X2NoYW5uZWwoJm1weHlfY3R4LT5jbGllbnQsIDApOwo+
ID4gKyAgICAgICBpZiAoSVNfRVJSKG1weHlfY3R4LT5jaGFuKSkKPiA+ICsgICAgICAgICAgICAg
ICByZXR1cm4gUFRSX0VSUihtcHh5X2N0eC0+Y2hhbik7Cj4gPiArCj4gPiArICAgICAgIHJldCA9
IHJwbWlfY3B1ZnJlcV9hdHRyX3NldHVwKGRldiwgbXB4eV9jdHgpOwo+ID4gKyAgICAgICBpZiAo
cmV0KSB7Cj4gPiArICAgICAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gdmVyaWZ5
IFJQTUkgYXR0cmlidXRlIC0gZXJyOiVkXG4iLCByZXQpOwo+ID4gKyAgICAgICAgICAgICAgIGdv
dG8gZmFpbF9mcmVlX2NoYW5uZWw7Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgLyog
R2V0IG51bWJlciBvZiBwZXJmb3JtYW5jZSBkb21haW4gKi8KPiA+ICsgICAgICAgcmV0ID0gcnBt
aV9wZXJmX2dldF9udW1fZG9tYWlucyhtcHh5X2N0eCwgJm51bV9kb21haW5zKTsKPiA+ICsgICAg
ICAgaWYgKHJldCkgewo+ID4gKyAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiaW52YWxpZCBu
dW1iZXIgb2YgcGVyZiBkb21haW5zIC0gZXJyOiVkXG4iLCByZXQpOwo+ID4gKyAgICAgICAgICAg
ICAgIGdvdG8gZmFpbF9mcmVlX2NoYW5uZWw7Cj4gPiArICAgICAgIH0KPgo+IFRoZSBkb21haW4g
c3BhY2UgaW4gUlBNSSBwZXJmb3JtYW5jZSBmb3IgQ1BVIGFuZCBEZXZpY2UKPiBpcyBub3Qgc2Vw
YXJhdGUgYW5kIGEgZG9tYWluIGNhbiBiZSBlaXRoZXIgQ1BVIG9yIGEgRGV2aWNlLgo+IEhvdyB0
aGUgZHJpdmVyIHdpbGwgbWFrZSBzdXJlIHRoYXQgdGhlIGRvbWFpbnMgd2hpY2ggYXJlIHJldHVy
bmVkCj4gYXJlIENQVSBvbmx5IGFuZCBub3QgdGhlIGRldmljZS4KPgo+ID4gK01PRFVMRV9ERVZJ
Q0VfVEFCTEUob2YsIHJwbWlfY3B1ZnJlcV9vZl9tYXRjaCk7Cj4gPiArCj4gPiArc3RhdGljIHN0
cnVjdCBwbGF0Zm9ybV9kcml2ZXIgcnBtaV9jcHVmcmVxX3BsYXRkcnYgPSB7Cj4gPiArICAgICAg
IC5kcml2ZXIgPSB7Cj4gPiArICAgICAgICAgICAgICAgLm5hbWUgPSAicmlzY3YtcnBtaS1wZXJm
b3JtYW5jZSIsCj4gPiArICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxlID0gcnBtaV9jcHVm
cmVxX29mX21hdGNoLAo+ID4gKyAgICAgICB9LAo+ID4gKyAgICAgICAucHJvYmUgPSBycG1pX2Nw
dWZyZXFfcHJvYmUsCj4gPiArICAgICAgIC5yZW1vdmUgPSBycG1pX2NwdWZyZXFfcmVtb3ZlLAo+
ID4gK307Cj4gPiArCj4gPiArbW9kdWxlX3BsYXRmb3JtX2RyaXZlcihycG1pX2NwdWZyZXFfcGxh
dGRydik7Cj4gPiArCj4gPiArTU9EVUxFX0FVVEhPUigiSm9zaHVhIFllb25nIDxqb3NodWEueWVv
bmdAc3RhcmZpdmV0ZWNoLmNvbT4iKTsKPiA+ICtNT0RVTEVfREVTQ1JJUFRJT04oIkNQVUZyZXEg
RHJpdmVyIGJhc2VkIG9uIFNCSSBNUFhZIGV4dGVuc2lvbiIpOwo+Cj4gTklUOiBDUFVGcmVxIGRy
aXZlciBiYXNlZCBvbiBTQkkgTVBYWSBleHRlbnNpb24gYW5kIFJQTUkgcHJvdG9jb2wgICAtCj4g
c29tZXRoaW5nIGxpa2UgdGhpcwoKQ3VycmVudGx5LCB0aGUgbWFpbGJveCBjb250cm9sbGVyIGlz
IGJhc2VkIG9uIFNCSSBNUFhZIGJ1dCBpbgp0aGUgZnV0dXJlIG1haWxib3ggY29udHJvbGxlciBm
b3Igc29tZSBvdGhlciBSUE1JIHRyYW5zcG9ydCBjYW4KYWxzbyBzaG93IHVwLgoKSW4gcmVhbGl0
eSwgdGhlIGRyaXZlciBpcyBvbmx5IFJQTUkgYmFzZWQgc2luY2UgaXQgdXNlcyBtYWlsYm94IEFQ
SXMuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
