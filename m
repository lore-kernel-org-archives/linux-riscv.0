Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1606CD3437
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Sep 2023 05:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7aPrx+1hFjvGRc/UL4mcMHsAq9tdpNU46g55NrdbbM=; b=RKwWMV3Uqw1wyS
	pDnCY9Jc/mgCz9sRCjC4nAd6/TZAgNCGCWaQefKoLft+LpcQg0SGfnA044biPSjNv+sb1+aIK4GzW
	x0jPLb6tVfcSDHr5E5aDyrvC85yfBY9Q6zEVhM52R7RLoD1jyKga0Nc2tPxhfHmCU84/ERHuBZpLh
	flVFfkuDXIjcqh0rJQlUIvyDyfpJvojRzNCpVLrF0wie2LYSZ5L29mMC9ZxRc6ttU9mWlahe8kpYg
	iBBRbNFIIiFIZeL83M+CwkNrO1vXO+hqhnO5NlnILnLwGqDCU2wGjtqEYCb9e2KbHJWrN7XKwWf0E
	7HnTq4RUHgGWZm7XjWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiTXb-00H48A-2h;
	Tue, 19 Sep 2023 05:44:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiTXY-00H477-1c
	for linux-riscv@lists.infradead.org;
	Tue, 19 Sep 2023 05:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695102291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krzHPIvPrR+mrHTfBAZKaZNmesVu7Z9/EIlgAX8o7VY=;
	b=G2007Z8ETPPmqbLEjtsGIM2CWB8gp2XKR3ysGKuPZ5w6Fzku/UgQJIzA6ARzCfif9naze1
	ANS82IxkGTBqQe95CQ5Srf59Z0PkEX2mWWilA0a3pvsKPQr/KYJOxWaiTAQc/dpO4hMPJC
	ZUROHCxtAIcsMqHUQhf0/Eynu1fH3AI=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-EJUbMyKVPSa1Pho_PpXeBg-1; Tue, 19 Sep 2023 01:44:50 -0400
X-MC-Unique: EJUbMyKVPSa1Pho_PpXeBg-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6c0ca2454dbso5817248a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 22:44:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695102289; x=1695707089;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=krzHPIvPrR+mrHTfBAZKaZNmesVu7Z9/EIlgAX8o7VY=;
        b=iHQ4jiUumygbMfhP+pH8FQiKify1vKTGlNRqb/FzZI78HVFYRw4I+IpDTGC8AFDeAy
         ALeMXF62oT06F6Mm946wblJq/HiJPgE4bANTKErhdY8MicN3KPvm0yeTH/RAqO7879vM
         C/rmLqJO5HEPtFV8wxM8yO1HqdZhAiFKDE9tvgR4bAx6rLOSXRdGNdIn5lkCDtS+CwzW
         xvk0pRIW+sE4yJbsRm5P9IsBTN08bwxqmKO+vQ+Rut+9HlfRBkGOOkzNZd1m/V9dfZur
         EWR22Pv1OSbF+kqsT7kP+rKYh3+JpGK7nT8+Oovswb0qZpr0Vs2UTD9YJCZJ7u3Wzp2V
         t1IA==
X-Gm-Message-State: AOJu0YyGwIA7QWChc7+bFwBRLBWnyNalqplth1aA1V6bKeX2xGBTZGUs
	T3YS1xxDmDZSmk/u9YP/zmtcMnlm1E6Ovu1d/sXApnUkbeI1LUGiQP9xxd2UGqS01pibkR7dwGk
	4+41wAuNErroC0ItR5ccRFiNXCvDK
X-Received: by 2002:a9d:6a8a:0:b0:6bc:be56:6b9b with SMTP id l10-20020a9d6a8a000000b006bcbe566b9bmr10927068otq.2.1695102289557;
        Mon, 18 Sep 2023 22:44:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJdB5NjDEtIXuqheBQo8aYK5FbffK/Ix4sW89JaXCyEgw9gnluw2TIPDkk/2geEreLfqtzrg==
X-Received: by 2002:a9d:6a8a:0:b0:6bc:be56:6b9b with SMTP id l10-20020a9d6a8a000000b006bcbe566b9bmr10927032otq.2.1695102289265;
        Mon, 18 Sep 2023 22:44:49 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:677d:42e9:f426:9422:f020])
        by smtp.gmail.com with ESMTPSA id d129-20020a4a5287000000b0057346742d82sm5359793oob.6.2023.09.18.22.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 22:44:48 -0700 (PDT)
Date: Tue, 19 Sep 2023 02:44:38 -0300
From: Leonardo Bras <leobras@redhat.com>
To: Guo Ren <guoren@kernel.org>
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 12/17] RISC-V: paravirt: pvqspinlock: Add nopvspin
 kernel parameter
Message-ID: <ZQk1Ri1DrchrrFLw@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-13-guoren@kernel.org>
 <ZQP0EJc4ClA-iT6J@redhat.com>
 <CAJF2gTQMNu7PXf3JT-nZt1+jp6osqERUvnvEexjK+Ak=ahxcUA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJF2gTQMNu7PXf3JT-nZt1+jp6osqERUvnvEexjK+Ak=ahxcUA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_224452_608893_E6568C8B 
X-CRM114-Status: GOOD (  24.32  )
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

T24gU3VuLCBTZXAgMTcsIDIwMjMgYXQgMTE6MDM6MzBQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBGcmksIFNlcCAxNSwgMjAyMyBhdCAyOjA14oCvUE0gTGVvbmFyZG8gQnJhcyA8bGVvYnJh
c0ByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIFNlcCAxMCwgMjAyMyBhdCAwNDoy
OTowNkFNIC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+ID4gRnJvbTogR3VvIFJl
biA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gPgo+ID4gPiBEaXNhYmxlcyB0aGUgcXNw
aW5sb2NrIHNsb3cgcGF0aCB1c2luZyBQViBvcHRpbWl6YXRpb25zIHdoaWNoCj4gPiA+IGFsbG93
IHRoZSBoeXBlcnZpc29yIHRvICdpZGxlJyB0aGUgZ3Vlc3Qgb24gbG9jayBjb250ZW50aW9uLgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5j
b20+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4g
PiAtLS0KPiA+ID4gIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMu
dHh0IHwgIDIgKy0KPiA+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3FzcGlubG9ja19wYXJhdmlydC5j
ICAgICAgICAgIHwgMTMgKysrKysrKysrKysrKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dCBiL0RvY3VtZW50YXRp
b24vYWRtaW4tZ3VpZGUva2VybmVsLXBhcmFtZXRlcnMudHh0Cj4gPiA+IGluZGV4IGY3NWJlZGM1
MGUwMC4uZTc0YWVkNjMxNTczIDEwMDY0NAo+ID4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWlu
LWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+ID4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2Fk
bWluLWd1aWRlL2tlcm5lbC1wYXJhbWV0ZXJzLnR4dAo+ID4gPiBAQCAtMzg1Nyw3ICszODU3LDcg
QEAKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGFzIGdlbmVyaWMgZ3Vlc3Qgd2l0aCBubyBQ
ViBkcml2ZXJzLiBDdXJyZW50bHkgc3VwcG9ydAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
WEVOIEhWTSwgS1ZNLCBIWVBFUl9WIGFuZCBWTVdBUkUgZ3Vlc3QuCj4gPiA+Cj4gPiA+IC0gICAg
IG5vcHZzcGluICAgICAgICBbWDg2LFhFTixLVk1dCj4gPiA+ICsgICAgIG5vcHZzcGluICAgICAg
ICBbWDg2LFhFTixLVk0sUklTQy1WXQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgRGlzYWJs
ZXMgdGhlIHFzcGlubG9jayBzbG93IHBhdGggdXNpbmcgUFYgb3B0aW1pemF0aW9ucwo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgd2hpY2ggYWxsb3cgdGhlIGh5cGVydmlzb3IgdG8gJ2lkbGUn
IHRoZSBndWVzdCBvbiBsb2NrCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBjb250ZW50aW9u
Lgo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0
LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9xc3BpbmxvY2tfcGFyYXZpcnQuYwo+ID4gPiBpbmRleCA4
NWZmNWEzZWMyMzQuLmEwYWQ0NjU3ZjQzNyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9r
ZXJuZWwvcXNwaW5sb2NrX3BhcmF2aXJ0LmMKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
cXNwaW5sb2NrX3BhcmF2aXJ0LmMKPiA+ID4gQEAgLTQxLDggKzQxLDIxIEBAIEVYUE9SVF9TVEFU
SUNfQ0FMTChwdl9xdWV1ZWRfc3Bpbl9sb2NrX3Nsb3dwYXRoKTsKPiA+ID4gIERFRklORV9TVEFU
SUNfQ0FMTChwdl9xdWV1ZWRfc3Bpbl91bmxvY2ssIG5hdGl2ZV9xdWV1ZWRfc3Bpbl91bmxvY2sp
Owo+ID4gPiAgRVhQT1JUX1NUQVRJQ19DQUxMKHB2X3F1ZXVlZF9zcGluX3VubG9jayk7Cj4gPiA+
Cj4gPiA+ICtzdGF0aWMgYm9vbCBub3B2c3BpbjsKPiA+Cj4gPiBJdCBpcyBvbmx5IHVzZWQgaW4g
aW5pdCwgc28gaXQgbWFrZXMgc2Vuc2UgdG8gYWRkIF9faW5pdGRhdGEuCj4gPgo+ID4gc3RhdGlj
IGJvb2wgbm9wdnNwaW4gX19pbml0ZGF0YTsKPiBPa2F5LgoKVGh4IQpMZW8KCj4gCj4gPgo+ID4g
T3RoZXIgdGhhbiB0aGF0LCBMR1RNOgo+ID4gUmV2aWV3ZWQtYnk6IExlb25hcmRvIEJyYXMgPGxl
b2JyYXNAcmVkaGF0LmNvbT4KPiA+Cj4gPiBUaGFua3MhCj4gPiBMZW8KPiA+Cj4gPiA+ICtzdGF0
aWMgX19pbml0IGludCBwYXJzZV9ub3B2c3BpbihjaGFyICphcmcpCj4gPiA+ICt7Cj4gPiA+ICsg
ICAgICAgbm9wdnNwaW4gPSB0cnVlOwo+ID4gPiArICAgICAgIHJldHVybiAwOwo+ID4gPiArfQo+
ID4gPiArZWFybHlfcGFyYW0oIm5vcHZzcGluIiwgcGFyc2Vfbm9wdnNwaW4pOwo+ID4gPiArCj4g
PiA+ICB2b2lkIF9faW5pdCBwdl9xc3BpbmxvY2tfaW5pdCh2b2lkKQo+ID4gPiAgewo+ID4gPiAr
ICAgICBpZiAobm9wdnNwaW4pIHsKPiA+ID4gKyAgICAgICAgICAgICBwcl9pbmZvKCJQViBxc3Bp
bmxvY2tzIGRpc2FibGVkXG4iKTsKPiA+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiA+ICsg
ICAgIH0KPiA+ID4gKwo+ID4gPiAgICAgICBpZiAobnVtX3Bvc3NpYmxlX2NwdXMoKSA9PSAxKQo+
ID4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4zNi4xCj4g
PiA+Cj4gPgo+IAo+IAo+IC0tIAo+IEJlc3QgUmVnYXJkcwo+ICBHdW8gUmVuCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
