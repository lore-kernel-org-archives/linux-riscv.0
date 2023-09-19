Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC712CE79A9
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 19:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G40rmhf1+9Ir8BdhKXoaCUr6XB/Kc50qYtgG+SG4He8=; b=VEcbGL0LnYsf4D
	RVB9ZNPGnJi+pSZWlIEZv6YUdbNp8gAamDFlDHYDwS1o2lORbyGJ97Zs7dnyGhERcL9gWSGMsYD2R
	feIItpl1RrEOQnEym3rEdysReQzcm7o8czJmWxuDsxmqYfyFzI6g/2sOrqzh+dozyDapspVKaQpPW
	WJ/Ho14SRuKXLkzHLCJljl2WUqhM0LQb4qUZDGxh5kv9X4qKbbvhYS8H8RpRsU56x0O14R1mpXybf
	ybyPcN91/X5niHTbmy6iXZzHZsyhVjMmwH0cJdnL5L7ahvvsNpFryQIxwT2MnpNc/gy6sJ55jHe3d
	DvIsc9RJd/Xp92evRa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qifx1-0017KR-36;
	Tue, 19 Sep 2023 18:59:59 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qifwy-0017IH-2Q
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 18:59:57 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-502e6d632b6so9405686e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 11:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1695149994; x=1695754794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hy4ZWnzFPz+zDftN8eU6StekSEbNrmtd0J3JOw6fos=;
        b=mrGvMRwgVO7famuvhMAHqtytGecyInVFibCJ++VV0qUhMAOk79sicmvk4A71xVU0Rw
         BWk1q+z5OyrXrb3bfEW+zft3fxhfuIi26AZgIx79oOMuuTGu3xzdorsHjHKK0DXl0paL
         6enO79mcGFkqIM1MjlWBLggAUIfPpmea+NoQQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695149994; x=1695754794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hy4ZWnzFPz+zDftN8eU6StekSEbNrmtd0J3JOw6fos=;
        b=SpkjTxS540L/9qEA/0IrhLLJJsigBRa0cFLZZ6dtTUh6gcJRvRanzq2Z33itoYuNAU
         ruuq0QY5+a8r0LwKUS+8/h/gRH6wYCuuhEpYvFVSp8ldZxcQqqCyD2BiGiwx1SuqJsMA
         UkJUjiZThjanwDRYNgk+FST0LANn5c92HHm760Qrc2o5XT1j6aRykBvsJn8oQDYaSWrR
         iDrIc3C3KeXqqEzf75M/VujdBMr4cF6tY2ZopIdHKJc62ecZA2+5w+EhHMsQwPNRZVQ8
         k1CQlB7W8c9V9VcTQtYSkuZtepRflwWsU8IQOk9luTPSkznHwi8SkBKCs8Nfz9D/ntYz
         lqHQ==
X-Gm-Message-State: AOJu0YyloEaFVKZ2aghk030e7FSHkBr76uV5G+5zNdgzUUzs3ZsuAml4
	COGXQwaswlQcILy4qKdUIPxlT6FwIEDY2uAwMEJM
X-Google-Smtp-Source: AGHT+IGzXm4g2jK7Xdi6knCthlXq8nCD/mVPShAE5lRiG6xxJ8B4e0CC7iznJCYX/qjLZMxqqH/cNtHjP1O2lo0olhc=
X-Received: by 2002:a19:9111:0:b0:503:ed:8616 with SMTP id t17-20020a199111000000b0050300ed8616mr320596lfd.59.1695149994155;
 Tue, 19 Sep 2023 11:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230918180646.1398384-1-apatel@ventanamicro.com> <20230918180646.1398384-3-apatel@ventanamicro.com>
In-Reply-To: <20230918180646.1398384-3-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Sep 2023 11:59:42 -0700
Message-ID: <CAOnJCUJ-25tCN61K2Uvu__xgKWDZrxpzwCrWW_uGCBROm9pAzw@mail.gmail.com>
Subject: Re: [PATCH 2/4] RISC-V: KVM: Fix riscv_vcpu_get_isa_ext_single() for
 missing extensions
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Andrew Jones <ajones@ventanamicro.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_115956_791882_257EFBA0 
X-CRM114-Status: GOOD (  17.47  )
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

T24gTW9uLCBTZXAgMTgsIDIwMjMgYXQgMTE6MDfigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcmlzY3ZfdmNwdV9nZXRfaXNhX2V4dF9zaW5n
bGUoKSBzaG91bGQgZmFpbCB3aXRoIC1FTk9FTlQgZXJyb3IKPiB3aGVuIGNvcnJlc3BvbmRpbmcg
SVNBIGV4dGVuc2lvbiBpcyBub3QgYXZhaWxhYmxlIG9uIHRoZSBob3N0Lgo+Cj4gRml4ZXM6IGU5
OGIxMDg1YmU3OSAoIlJJU0MtVjogS1ZNOiBGYWN0b3Itb3V0IE9ORV9SRUcgcmVsYXRlZCBjb2Rl
IHRvIGl0cyBvd24gc291cmNlIGZpbGUiKQo+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFw
YXRlbEB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJl
Zy5jIHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfb25lcmVnLmMKPiBpbmRleCBlN2U4MzNjZWQ5MWIuLmI3ZTBlMDNj
NjliMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJlZy5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdV9vbmVyZWcuYwo+IEBAIC00NjAsOCArNDYwLDExIEBAIHN0YXRp
YyBpbnQgcmlzY3ZfdmNwdV9nZXRfaXNhX2V4dF9zaW5nbGUoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
LAo+ICAgICAgICAgICAgIHJlZ19udW0gPj0gQVJSQVlfU0laRShrdm1faXNhX2V4dF9hcnIpKQo+
ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0VOVDsKPgo+IC0gICAgICAgKnJlZ192YWwgPSAw
Owo+ICAgICAgICAgaG9zdF9pc2FfZXh0ID0ga3ZtX2lzYV9leHRfYXJyW3JlZ19udW1dOwo+ICsg
ICAgICAgaWYgKCFfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIGhvc3RfaXNh
X2V4dCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PRU5UOwo+ICsKPiArICAgICAgICpy
ZWdfdmFsID0gMDsKPiAgICAgICAgIGlmIChfX3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxl
KHZjcHUtPmFyY2guaXNhLCBob3N0X2lzYV9leHQpKQo+ICAgICAgICAgICAgICAgICAqcmVnX3Zh
bCA9IDE7IC8qIE1hcmsgdGhlIGdpdmVuIGV4dGVuc2lvbiBhcyBhdmFpbGFibGUgKi8KPgo+IC0t
Cj4gMi4zNC4xCj4KClJldmlld2VkLWJ5OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4KCi0tIApSZWdhcmRzLApBdGlzaAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
