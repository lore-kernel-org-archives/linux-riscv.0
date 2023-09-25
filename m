Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1603CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 13:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0IphrXp7oRc+vck+Ua1Ag8+E0aHpeA0cyNL8HAJ6vk=; b=w65qCfJHv0pWvM
	VvfLizoGKNxV4OCyk2eP4GdUzpMnfpYRfpbW/h3TfUtLDPiHGtF2IF4ZJg2Gg5e0a9JcRhezjSC1d
	Qv2uboVbau6IANkUrsEHmCqAF/wUKyT7500LDZl1RjDFXJ4cAPmy73610e9YDKFdvWxlgDkii28kb
	TBBVolC5UMjWMdiG67jI1Fk5ddFFghdCA/468eI2nhIRz+/eO/O9Dm/5qdczWJtDK3/0jxKTzmr6Z
	LG/x5tzJI8wC/su5whkjF7KpWmG4PO7jPZL5kAmDHvdyPI5WjKmGZwJZJXeGgoMV5t/qtjzXH1+Ay
	4qc/O3/fJj5/gOlXcyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkli4-00ELUz-05;
	Mon, 25 Sep 2023 13:33:12 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkli1-00ELTI-0B
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 13:33:10 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2773cc1721bso1495340a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 25 Sep 2023 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695648786; x=1696253586; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWWpsmuiT0DkC2S1ORrZVL7ehSbw0Lmve5XUeVl5vjQ=;
        b=AtEbyaSKgGng0OSdN+jfs9TMhIF7VREuXUHjjeiTa6IfmFicc1mLLQDPMfJIj4qKz5
         bDDo/86oaCkj4CwJrw/qamQWCggFBdPdEfz2C18dn6bNkwKWpwx2b0dEc2zT9zX/zNFy
         Ly53WSkW+I3PVYeiP4+TXulto5J2HgG7ssd0imb2g8jser14+eOf2fJsMJLa+1UpxMlc
         9HP7w1sa1Xpe3l3oTYlVKLoIRXT+XzmHAtzSjr946ShCI1p6w1zwSdPMwbV2rU54H1Ra
         NARimzs22uchA7gUeO2idTz9I6vKEv+0tfx3wUajGWqGCqBkjxss6otNXf/PoLm6RbRt
         qHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695648786; x=1696253586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWWpsmuiT0DkC2S1ORrZVL7ehSbw0Lmve5XUeVl5vjQ=;
        b=pBudSE3tXDqzG89+r7GoNrgfKsXvMxmEDQEL4lvrJXWwuocc/d7JdGCb7aUKp3ovjV
         tNlbK95hmWgDvkgsj8kLF6mvmrX8o/0W6RPsvcTBvFJQMA+qA6wckoSusZwGOdjvpdEK
         wwzOFYCzEyeIFRck57zztA4u93RU6YgS/tQX0gcy1x6+QtGkyfb5jlXPqzEUlVSIPtA0
         2amn/xg2TNeR+iN6QPDSkC6XFCQk0LrHqs4dR/NinRjjzJpY/7RHY5NqWgAUJKmLKXPK
         KqrU7qDan6zecHsa9u9y+2lqbFATp2Sor3C6+syWyaOMUIOlyURz94e2ynJJzKlNF/Kz
         cYvQ==
X-Gm-Message-State: AOJu0YwOKpbsET8JdNVG7mhnZAuvztZF0xwing0HuaYssSrk8/RZP2EP
	5KFDAKRVsG9A58pTzyFOkMeTX0RxKn/5Fm8wlEmAqQ==
X-Google-Smtp-Source: AGHT+IHvwDRQn3v039uMTkyZOXLfNbfqYk8vrxj7zH1v4k0e9teZWE9FtAuclu3zJWXqqqQSY3Tmt4Ji3RAYL/Go4VQ=
X-Received: by 2002:a17:90a:5785:b0:274:8330:c7da with SMTP id
 g5-20020a17090a578500b002748330c7damr4567601pji.28.1695648785859; Mon, 25 Sep
 2023 06:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230919035343.1399389-1-apatel@ventanamicro.com>
 <20230919035343.1399389-8-apatel@ventanamicro.com> <20230920-d30b398a99804418792264c3@orel>
In-Reply-To: <20230920-d30b398a99804418792264c3@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 25 Sep 2023 19:02:54 +0530
Message-ID: <CAK9=C2WAZWdcKEKy6DjQRhJZxMfWZmcX4hVxSuV3=_nAQnYb4A@mail.gmail.com>
Subject: Re: [PATCH 7/7] KVM: riscv: selftests: Add condops extensions to
 get-reg-list test
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Mayuresh Chitale <mchitale@ventanamicro.com>, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_063309_099755_712CE11E 
X-CRM114-Status: GOOD (  16.26  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMTo0OOKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMTksIDIwMjMgYXQgMDk6MjM6
NDNBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFdlIGhhdmUgYSBuZXcgY29uZGl0aW9u
YWwgb3BlcmF0aW9ucyByZWxhdGVkIElTQSBleHRlbnNpb25zIHNvIGxldCB1cyBhZGQKPiA+IHRo
ZXNlIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QuCj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAtLS0KPiA+ICB0b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMgfCA0ICsrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gaW5kZXggOWY0NjRj
Nzk5NmM2Li40YWQ0YmY4N2ZhNzggMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vcmlzY3YvZ2V0LXJlZy1saXN0LmMKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9yaXNjdi9nZXQtcmVnLWxpc3QuYwo+ID4gQEAgLTUwLDYgKzUwLDggQEAgYm9v
bCBmaWx0ZXJfcmVnKF9fdTY0IHJlZykKPiA+ICAgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0Ff
RVhUIHwgS1ZNX1JJU0NWX0lTQV9FWFRfWklGRU5DRUk6Cj4gPiAgICAgICBjYXNlIEtWTV9SRUdf
UklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1pJSFBNOgo+ID4gICAgICAgY2FzZSBL
Vk1fUkVHX1JJU0NWX0lTQV9FWFQgfCBLVk1fUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU46Cj4gPiAr
ICAgICBjYXNlIEtWTV9SRUdfUklTQ1ZfSVNBX0VYVCB8IEtWTV9SSVNDVl9JU0FfRVhUX1hWRU5U
QU5BQ09ORE9QUzoKPiA+ICsgICAgIGNhc2UgS1ZNX1JFR19SSVNDVl9JU0FfRVhUIHwgS1ZNX1JJ
U0NWX0lTQV9FWFRfWklDT05EOgo+ID4gICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+ICAg
ICAgIC8qIEFJQSByZWdpc3RlcnMgYXJlIGFsd2F5cyBhdmFpbGFibGUgd2hlbiBTc2FpYSBjYW4n
dCBiZSBkaXNhYmxlZCAqLwo+ID4gICAgICAgY2FzZSBLVk1fUkVHX1JJU0NWX0NTUiB8IEtWTV9S
RUdfUklTQ1ZfQ1NSX0FJQSB8IEtWTV9SRUdfUklTQ1ZfQ1NSX0FJQV9SRUcoc2lzZWxlY3QpOgo+
ID4gQEAgLTM2MCw2ICszNjIsOCBAQCBzdGF0aWMgY29uc3QgY2hhciAqaXNhX2V4dF9pZF90b19z
dHIoX191NjQgaWQpCj4gPiAgICAgICAgICAgICAgICJLVk1fUklTQ1ZfSVNBX0VYVF9aSUZFTkNF
SSIsCj4gPiAgICAgICAgICAgICAgICJLVk1fUklTQ1ZfSVNBX0VYVF9aSUhQTSIsCj4gPiAgICAg
ICAgICAgICAgICJLVk1fUklTQ1ZfSVNBX0VYVF9TTVNUQVRFRU4iLAo+ID4gKyAgICAgICAgICAg
ICAiS1ZNX1JJU0NWX0lTQV9FWFRfWFZFTlRBTkFDT05ET1BTIiwKPiA+ICsgICAgICAgICAgICAg
IktWTV9SSVNDVl9JU0FfRVhUX1pJQ09ORCIsCj4gPiAgICAgICB9Owo+ID4KPiA+ICAgICAgIGlm
IChyZWdfb2ZmID49IEFSUkFZX1NJWkUoa3ZtX2lzYV9leHRfcmVnX25hbWUpKSB7Cj4gPiAtLQo+
ID4gMi4zNC4xCj4gPgo+Cj4gRG9uJ3Qgd2Ugd2FudCB0byBhZGQgdGVzdCBjb25maWdzIGZvciB0
aGVzZT8KCk9rYXksIEkgd2lsbCB1cGRhdGUuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
