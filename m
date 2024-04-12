Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E984EC4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 18:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5VE2GrAkCB6eUkgeN0gmnnZKKQdhSi3Ke3vFFXsZT8=; b=3BBhRKoXfh2pBA
	IbIko77Yam/Z6FmT1fo5wmMucKm3nWUF4n2AaC1afxifPhbONm7WkZZnPmaomMTDBXHgxPwMYe9AO
	ytKWy+A4tUAr7Ww3jkQPs06gHTfdjIfY/11wxscak7vUN8tWBw/C1NwHODWDTCcVofCpuaHypTh96
	Zl+sdkQ2RVHp6/oSmALejM6HHvm5JFdhDtIKZzqjBpcU0lExEKiDnSh20A/QpNsVkAM3sQUCpps8u
	qrub/jTdpKlKnkDRoS9SIVqC9cGpJix98EK24POgXLspeWa3snj3/8OqGv5IDTIfyH7aqvwF+6Lqe
	ThWDQX1DICJdTDRcvsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLXd-00000000q3i-2VpR;
	Fri, 12 Apr 2024 18:22:25 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvLXa-00000000q1v-0ETk
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 18:22:23 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso701264b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 11:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712946140; x=1713550940; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wCHPnhyTcC9ocJWJcXngwPv4ks2H4M0UEeE7J2w7Lsc=;
        b=kfu0L+OxOSRZdD0jiwwJ0axUcfqlNQ1ItKjFA1ytfQaAt93Kl0gtRL4Zac1q0JVZ0z
         czoDQD0+PBsGLeU3oVGrBXpoVsjM/imWY3chrUGSKjwdFTWcZuGjbkGPFTYU4WLiwTyY
         hEVCkSFFvEPALU5fji7uDG3XCyDWU/QcGRPS7BTYw2OxTN2yqDYJ7eFbO49/CMusFySr
         bt/38dE/Kcvxfvq3C9vg7UK4j/sNS3C37l3aJd2OHmMP9JTvE6V9jiFDGyFE36v/hMvR
         PwCkemxWjdhsbzJxQQw32RTDCGKoajTMKqNLB7TC1Ebr99CTTMxMR3cT/rwAV7hO6LTB
         t8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712946140; x=1713550940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wCHPnhyTcC9ocJWJcXngwPv4ks2H4M0UEeE7J2w7Lsc=;
        b=c77wNPyMuMmT40ZOYpvTCrrUG8bU0HXvyNz7sxKXsshdnMepHgIR6cadQ703NivzKV
         GkDKTOorUuuGxz4bKQrTQCw5NLM0Xq9udeNySMEPXWl+osRA5b12NEOFImZbyNYUFEAI
         NPRWKwWmm+/yqZPxqtoiZNUsxvW8NakEt/I2303Wz0LQz3pffhunNdjGdkFYfoo8mW+b
         DbL78w1PxmOLwUGjoY0LxRhMcmTGjzq9W+yvaafE6j5bM/Pj0XBpM5aI61Qf0YjFvH0J
         +XOfKhKV4jI+QWg7BUwVM5Q+gQq/oahpJjoY+1VSKtsdhS+LcZ8dhWnRZVY9RqAvNJ+n
         i3qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7OCGALuu5NAkL9a0p38NWNGbb2uDzZkQ9a6BnRtY7wQVXoldv6W/VVSnl4hB6/XLD31fOpykIhr33jVpf2F1V9oeSOYpTo5bCxFS4Smaf
X-Gm-Message-State: AOJu0YyTvnQsYSsXvO8EU6ta2zPf8nOJ/vIw40whGIFcg3BWbFyHVT2+
	J1qtO1002ZQOkCLFNWu4zzEH5pAmK+NZo0GZFh8etr1l7jfhU79ALx1dyEdpWkk=
X-Google-Smtp-Source: AGHT+IH3pC+f8pzqqXv0EovOv3q0ogIpnNxixUGOjWjSEXDo/maroqpNMt/5YXZL0hJP+QvlDJt4Ag==
X-Received: by 2002:a05:6a20:3244:b0:1a7:59b5:4276 with SMTP id hm4-20020a056a20324400b001a759b54276mr3112304pzc.54.1712946139775;
        Fri, 12 Apr 2024 11:22:19 -0700 (PDT)
Received: from ghost (mobile-166-137-160-039.mycingular.net. [166.137.160.39])
        by smtp.gmail.com with ESMTPSA id t21-20020aa78f95000000b006ed4aa9d48esm3179455pfs.212.2024.04.12.11.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 11:22:19 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:22:15 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Evan Green <evan@rivosinc.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 14/19] riscv: hwprobe: Disambiguate vector and
 xtheadvector in hwprobe
Message-ID: <Zhl717rsQ7XLBe2F@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
 <20240412-moonshine-acting-0df1a90b86d2@wendy>
 <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_112222_124990_0BFCCC8F 
X-CRM114-Status: GOOD (  26.25  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMTA6MDQ6NDJBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBGcmksIEFwciAxMiwgMjAyNCBhdCA0OjM14oCvQU0gQ29ub3IgRG9vbGV5IDxjb25v
ci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gVGh1LCBBcHIgMTEsIDIw
MjQgYXQgMDk6MTE6MjBQTSAtMDcwMCwgQ2hhcmxpZSBKZW5raW5zIHdyb3RlOgo+ID4gPiBFbnN1
cmUgdGhhdCBod3Byb2JlIGRvZXMgbm90IGZsYWcgInYiIHdoZW4geHRoZWFkdmVjdG9yIGlzIHBy
ZXNlbnQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVua2lucyA8Y2hhcmxp
ZUByaXZvc2luYy5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX2h3
cHJvYmUuYyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiA+IGlu
ZGV4IDhjYWU0MWE1MDJkZC4uZTBhNDJjODUxNTExIDEwMDY0NAo+ID4gPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC9zeXNfaHdwcm9iZS5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5
c19od3Byb2JlLmMKPiA+ID4gQEAgLTY5LDcgKzY5LDcgQEAgc3RhdGljIHZvaWQgaHdwcm9iZV9p
c2FfZXh0MChzdHJ1Y3QgcmlzY3ZfaHdwcm9iZSAqcGFpciwKPiA+ID4gICAgICAgaWYgKHJpc2N2
X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIGMpKQo+ID4gPiAgICAgICAgICAgICAgIHBh
aXItPnZhbHVlIHw9IFJJU0NWX0hXUFJPQkVfSU1BX0M7Cj4gPiA+Cj4gPiA+IC0gICAgIGlmICho
YXNfdmVjdG9yKCkpCj4gPiA+ICsgICAgIGlmIChoYXNfdmVjdG9yKCkgJiYgIXJpc2N2X2hhc192
ZW5kb3JfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9WRU5ET1JfRVhUX1hUSEVBRFZFQ1RP
UikpCj4gPgo+ID4gSG1tLCBJIHRoaW5rIHRoaXMgaXMgImRhbmdlcm91cyIuIGhhc192ZWN0b3Io
KSBpcyB1c2VkIGFjcm9zcyB0aGUga2VybmVsCj4gPiBub3cgaW4gc2V2ZXJhbCBwbGFjZXMgZm9y
IHRoZSBpbi1rZXJuZWwgdmVjdG9yLiBJIGRvbid0IHRoaW5rIHRoYXQKPiA+IGhhc192ZWN0b3Io
KSBzaG91bGQgcmV0dXJuIHRydWUgZm9yIHRoZSBULUhlYWQgc3R1ZmYgZ2l2ZW4gdGhhdCAmCj4g
PiBoYXNfdmVjdG9yKCkgc2hvdWxkIHJlcHJlc2VudCB0aGUgcmF0aWZpZWQgc3BlYy4gSSdsbCBo
YXZlIHRvIHRoaW5rCj4gPiBhYm91dCB0aGlzIG9uZSBhbmQgaG93IG5hc3R5IHRoaXMgbWFrZXMg
YW55IG9mIHRoZSBzYXZlL3Jlc3RvcmUgY29kZQo+ID4gZXRjLgo+IAo+IFllYWgsIG15IG5vc2Ug
Y3JpbmtsZWQgaGVyZSBhcyB3ZWxsLiBJZiB5b3UncmUgaGF2aW5nIHRvIGRvIGEKPiB2ZW5kb3Jp
c2ggdGhpbmcgaW4gdGhpcyBnZW5lcmljIHNwb3QsIHRoZW4gb3RoZXJzIG1heSB0b28sIHN1Z2dl
c3RpbmcKPiBwZXJoYXBzIHRoaXMgaXNuJ3QgdGhlIGNsZWFuZXN0IHdheSB0byBnbyBhYm91dCBp
dC4gSWRlYWxseSBleHRlbnNpb25zCj4gYXJlIGFsbCBhZGRpdGl2ZSwgcmF0aGVyIHRoYW4gc3Vi
dHJhY3RpdmUsIEkgZ3Vlc3M/CgpUaGlzIHdhcyB0aGUgImVhc2llc3QiIHdheSB0byBzdXBwb3J0
IHRoaXMgYnV0IEkgYWdyZWUgdGhpcyBpcyBub3QKaWRlYWwuIFRoZSB2ZWN0b3IgY29kZSBpcyBu
YXR1cmFsbHkgY291cGxlZCB3aXRoIGhhdmluZyBzdXBwb3J0IGZvcgoidiIgYW5kIEkgd2FudGVk
IHRvIGxldmVyYWdlIHRoYXQuIFRoZSBvdGhlciBjb25jZXJuIGlzIGFsbCBvZiB0aGUKaWZkZWZz
IGZvciBoYXZpbmcgViBlbmFibGVkLiBJIGNhbiBtYWtlIGFsbCBvZiB0aG9zZSBWIG9yIFhUSEVB
RFZFQ1RPUjsKdGhhdCB3aWxsIGluY3JlYXNlIHRoZSBzdXJmYWNlIGFyZWEgb2YgeHRoZWFkdmVj
dG9yIGJ1dCBpdCBpcyBwcm9iYWJseQp0aGUgcmlnaHQoPykgd2F5IHRvIGdvLgoKLSBDaGFybGll
Cgo+IAo+IAo+ID4KPiA+ID4gICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BS
T0JFX0lNQV9WOwo+ID4gPgo+ID4gPiAgICAgICAvKgo+ID4gPiBAQCAtMTEyLDcgKzExMiw3IEBA
IHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIs
Cj4gPiA+ICAgICAgICAgICAgICAgRVhUX0tFWShaQUNBUyk7Cj4gPiA+ICAgICAgICAgICAgICAg
RVhUX0tFWShaSUNPTkQpOwo+ID4gPgo+ID4gPiAtICAgICAgICAgICAgIGlmIChoYXNfdmVjdG9y
KCkpIHsKPiA+ID4gKyAgICAgICAgICAgICBpZiAoaGFzX3ZlY3RvcigpICYmICFyaXNjdl9oYXNf
dmVuZG9yX2V4dGVuc2lvbl91bmxpa2VseShSSVNDVl9JU0FfVkVORE9SX0VYVF9YVEhFQURWRUNU
T1IpKSB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICBFWFRfS0VZKFpWQkIpOwo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgRVhUX0tFWShaVkJDKTsKPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgIEVYVF9LRVkoWlZLQik7Cj4gPiA+Cj4gPiA+IC0tCj4gPiA+IDIuNDQuMAo+ID4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
