Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0040ECFA774
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RffkO8AVw47vBswHqdskz1kkSxOLHspsklXZzfKzl88=; b=cKXCqQn3H7+Zwm
	BpQKKbuClhsNzSd07KEeOkVyTguCJw5LGp471QKLtMQWLqwDkiDhYxFgGdTcXwk8cqDhYKuO4yKAx
	YLQOcA2G94noFrZ7EYP3nX/S64aJR0TK9D/yJwjMNj2G9WCxPEAgPDKuUrL/gdlAE/sEkDLwWAozD
	1p8l2bQK4UAtNBCCDdArW/LpYk2dT9dyN2yMVsM0ODnRB5iuRbCCFAYDldL76+JAu/spcYzZsmDkI
	U+zirmricxVQhoL6G3raxMOasKchaZejEsuaT805IkyyIdZZXi+JzI/EIv+cyAtVXuczPqd3+suKP
	bMMCs96yQj0+VNMbp/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swhae-0000000CLHS-2a54;
	Fri, 04 Oct 2024 12:39:24 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swhab-0000000CLGN-1OcH
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 12:39:22 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3a0be4d803eso6766295ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Oct 2024 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1728045560; x=1728650360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrR+z/iOWphYqWkj8zj/mNFQmOZdBilN97SXK8kmVvA=;
        b=3YoGCciDryiyLHy6btrg3bZnh+O+vHzbdPAsa3lleEDUC+JUV1qdP7MDYXBcF/z+d2
         jIsHDk5xqFQObZ1ii3xWIPO3Yp5kFZfDm1cTCDvSmtIQNLbLh2LCbT6LXqrWGhHUdPJS
         1RBIdB1M1EtcQ46LVDGbA9cJUvDyJ7X+P2OQMLuPNX8czdLVBWSLCakDVEEzndTOY8H5
         pyqhbqYPotNB4wvMldvPhSY3bXah6Zpw67EwPKW0hdwo1YCcLdz3CnXxsOW6NlG3FEiD
         sP/dzkdZzVUPrYL5Bp/Oo5nXXINTdaRSsRZI55LUTWlbAJrJzs7KP1B/9JmPi91SXa4x
         2Xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728045560; x=1728650360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrR+z/iOWphYqWkj8zj/mNFQmOZdBilN97SXK8kmVvA=;
        b=MTvjhP+05rgQXoVR2z2pmJ+HQyOGIMS4ble2MXq2szCExsWjBWgBXD2wmSGGhIjUeV
         tYe1vB/ICAR8/Lz3W0X9AWVb5z0+93XrynCTNe/3AKaX7yFI/8/VXdVPOhZDDiwif7S3
         jMlvXBHg0AnEoaCK1Td1HNHujMvO/0lh7+KiSGZJVFhAKHDXeo7abncn7kk44Nq4XKWB
         K3miXAHmfwX7gcSVNGaA9hmrmtBUBfyL96+3gDUTqBbPvIGi+8KZ9741i50Shl6oMI6C
         0YY2eVrQmETv0W368pXBXs+5DgxZgZvZoWCbcvJA0IQyUmVsxw+rOYEMUC1FWLv19MoB
         92Wg==
X-Forwarded-Encrypted: i=1; AJvYcCWj8l1KtKsGfqYk7MgrbJIhF09eyzH3Gns7TtsrJbNBoqQoY6LwifL4pNYdWNMv2vUDCkYYIbDq7ONZmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+aX9vfpYRlLNokGthzlaYTEk++Is3B67fLeM+WxXRBT6JNNeC
	lF3Zgj3h7N3iwmgd+RwpQzYKJ+Ljb27/Bv2Z2K+iFWt/fA1CJWY+CV8dJ79eSxvVWCFbKPXXcvq
	+KIR5FZXm/pAjrtFo0llsS01W+y6jtCE/v7MAdg==
X-Google-Smtp-Source: AGHT+IERttoYjRNGdgoaAQ88VzrKxhKUIyjVinnKzTvAvFXZVff+YX6a4gsUWvibRQguSUrLvPreBNI4l6WqAmGFfdQ=
X-Received: by 2002:a05:6e02:13a6:b0:3a0:a385:911d with SMTP id
 e9e14a558f8ab-3a3757d92e5mr22058205ab.0.1728045559512; Fri, 04 Oct 2024
 05:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20240808081439.24661-1-yongxuan.wang@sifive.com>
In-Reply-To: <20240808081439.24661-1-yongxuan.wang@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Oct 2024 18:09:06 +0530
Message-ID: <CAAhSdy3NmwbHY9Qef9LUeXfr0iE7wC-u0d_fHzC47PXk-MzmRg@mail.gmail.com>
Subject: Re: [PATCH 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_053921_642070_088F0BFF 
X-CRM114-Status: GOOD (  19.72  )
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

T24gVGh1LCBBdWcgOCwgMjAyNCBhdCAxOjQ04oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBJbiB0aGUgc2VjdGlvbiAiNC43IFByZWNpc2Ug
ZWZmZWN0cyBvbiBpbnRlcnJ1cHQtcGVuZGluZyBiaXRzIgo+IG9mIHRoZSBSSVNDLVYgQUlBIHNw
ZWNpZmljYXRpb24gZGVmaW5lcyB0aGF0Ogo+Cj4gSWYgdGhlIHNvdXJjZSBtb2RlIGlzIExldmVs
MSBvciBMZXZlbDAgYW5kIHRoZSBpbnRlcnJ1cHQgZG9tYWluCj4gaXMgY29uZmlndXJlZCBpbiBN
U0kgZGVsaXZlcnkgbW9kZSAoZG9tYWluY2ZnLkRNID0gMSk6Cj4gVGhlIHBlbmRpbmcgYml0IGlz
IGNsZWFyZWQgd2hlbmV2ZXIgdGhlIHJlY3RpZmllZCBpbnB1dCB2YWx1ZSBpcwo+IGxvdywgd2hl
biB0aGUgaW50ZXJydXB0IGlzIGZvcndhcmRlZCBieSBNU0ksIG9yIGJ5IGEgcmVsZXZhbnQKPiB3
cml0ZSB0byBhbiBpbl9jbHJpcCByZWdpc3RlciBvciB0byBjbHJpcG51bS4KPgo+IFVwZGF0ZSB0
aGUgYXBsaWNfd3JpdGVfcGVuZGluZygpIHRvIG1hdGNoIHRoZSBzcGVjLgo+CgpGaXhlcyB0YWcg
PwoKPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUu
Y29tPgo+IFJldmlld2VkLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYyB8IDIgLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlh
X2FwbGljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfYXBsaWMuYwo+IGluZGV4IGRhNmZmMWJhZGUw
ZC4uOTdjNmRiY2FiZjQ3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKPiBAQCAtMTQyLDggKzE0Miw2IEBA
IHN0YXRpYyB2b2lkIGFwbGljX3dyaXRlX3BlbmRpbmcoc3RydWN0IGFwbGljICphcGxpYywgdTMy
IGlycSwgYm9vbCBwZW5kaW5nKQo+Cj4gICAgICAgICBpZiAoc20gPT0gQVBMSUNfU09VUkNFQ0ZH
X1NNX0xFVkVMX0hJR0ggfHwKPiAgICAgICAgICAgICBzbSA9PSBBUExJQ19TT1VSQ0VDRkdfU01f
TEVWRUxfTE9XKSB7Cj4gLSAgICAgICAgICAgICAgIGlmICghcGVuZGluZykKPiAtICAgICAgICAg
ICAgICAgICAgICAgICBnb3RvIHNraXBfd3JpdGVfcGVuZGluZzsKCkkgYWdyZWUgdGhhdCBhcGxp
Y193cml0ZV9wZW5kaW5nKCkgaXMgbm90IGhhbmRsaW5nIHRoZSBjYXNlCndoZXJlIGl0IGlzIGNh
bGxlZCBmb3IgaW5fY2xyaXAgb3IgY2xyaXBudW0gd3JpdGVzIGJ1dCB0aGlzIHN0aWxsCmxvb2tz
IGluY29tcGxldGUuCgpUaGUgYmVsb3cgdHdvIGlmKCkgc2hvdWxkIGJlIGNoZWNrZWQgb25seSB3
aGVuIHBlbmRpbmcgPT0gdHJ1ZS4KCj4gICAgICAgICAgICAgICAgIGlmICgoaXJxZC0+c3RhdGUg
JiBBUExJQ19JUlFfU1RBVEVfSU5QVVQpICYmCj4gICAgICAgICAgICAgICAgICAgICBzbSA9PSBB
UExJQ19TT1VSQ0VDRkdfU01fTEVWRUxfTE9XKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gc2tpcF93cml0ZV9wZW5kaW5nOwoKSG93IGFib3V0IHRoaXMgPwoKZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2FwbGljLmMKaW5k
ZXggZGE2ZmYxYmFkZTBkLi45M2NjYzJhNDlmMmIgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva3Zt
L2FpYV9hcGxpYy5jCisrKyBiL2FyY2gvcmlzY3Yva3ZtL2FpYV9hcGxpYy5jCkBAIC0xNDMsNyAr
MTQzLDcgQEAgc3RhdGljIHZvaWQgYXBsaWNfd3JpdGVfcGVuZGluZyhzdHJ1Y3QgYXBsaWMKKmFw
bGljLCB1MzIgaXJxLCBib29sIHBlbmRpbmcpCiAgICAgICAgaWYgKHNtID09IEFQTElDX1NPVVJD
RUNGR19TTV9MRVZFTF9ISUdIIHx8CiAgICAgICAgICAgIHNtID09IEFQTElDX1NPVVJDRUNGR19T
TV9MRVZFTF9MT1cpIHsKICAgICAgICAgICAgICAgIGlmICghcGVuZGluZykKLSAgICAgICAgICAg
ICAgICAgICAgICAgZ290byBza2lwX3dyaXRlX3BlbmRpbmc7CisgICAgICAgICAgICAgICAgICAg
ICAgIGdvdG8gbm9za2lwX3dyaXRlX3BlbmRpbmc7CiAgICAgICAgICAgICAgICBpZiAoKGlycWQt
PnN0YXRlICYgQVBMSUNfSVJRX1NUQVRFX0lOUFVUKSAmJgogICAgICAgICAgICAgICAgICAgIHNt
ID09IEFQTElDX1NPVVJDRUNGR19TTV9MRVZFTF9MT1cpCiAgICAgICAgICAgICAgICAgICAgICAg
IGdvdG8gc2tpcF93cml0ZV9wZW5kaW5nOwpAQCAtMTUxLDYgKzE1MSw3IEBAIHN0YXRpYyB2b2lk
IGFwbGljX3dyaXRlX3BlbmRpbmcoc3RydWN0IGFwbGljCiphcGxpYywgdTMyIGlycSwgYm9vbCBw
ZW5kaW5nKQogICAgICAgICAgICAgICAgICAgIHNtID09IEFQTElDX1NPVVJDRUNGR19TTV9MRVZF
TF9ISUdIKQogICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHNraXBfd3JpdGVfcGVuZGluZzsK
ICAgICAgICB9Citub3NraXBfd3JpdGVfcGVuZGluZzoKCiAgICAgICAgaWYgKHBlbmRpbmcpCiAg
ICAgICAgICAgICAgICBpcnFkLT5zdGF0ZSB8PSBBUExJQ19JUlFfU1RBVEVfUEVORElORzsKClJl
Z2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
