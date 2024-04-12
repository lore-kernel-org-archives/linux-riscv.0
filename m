Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B434C00A94
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2024 22:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+e4KNvnfMo+uDl/BSi0UWuK8kI7b7mpbgJ3N4dCflY=; b=g0YuOKBsF0WBWe
	+kbj4d1ooL/Alq/hVmQukK0ilHxumXeHM71sHa9AGpWTlEUkUOnJE5S2LVM1VxOxi6ehM3aC8Q98c
	XRvRSX3c/7ssE+GahUa3JViHg7tlbQOI2OK+PtEaOTWpkxC343VUAfXEy9wI6D9EfEBdvHHbw8FKD
	/SI7stOEHNGTu0xgXSj0on6FhvzMDBJ05y/VhyJTDzA9BsR8HdnYILdOmQYmeIh52Tllsieq3LgLC
	pAdgAOX8H05Zqy0gUrWR3uRtiUXJ0O4yF7gd/2OEcbdroH2oPLWhloFmGzSH4PNlubJpvZmCNbrrv
	51Aov+D1GW8/N3+AdjoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvPWO-00000001YvK-2pS0;
	Fri, 12 Apr 2024 22:37:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvPWL-00000001YuM-18k7
	for linux-riscv@lists.infradead.org;
	Fri, 12 Apr 2024 22:37:22 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1e4f341330fso13519565ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 12 Apr 2024 15:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712961440; x=1713566240; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HKc5QOf/ZMb9xWTXmeJjFB5DhU65yjVEdJ5QMQR8HHA=;
        b=oxEmK9LT9ppDjllVStWJ8l6pPvR2DoTWfQs/guExSvc/A6+n4M+LpXyllsWlStdrXU
         0ug0sGeniUjX5tIC5UW6ds0/0A3mV+ImfPok6t8OKn8YE+3HVGojUWJlMPeGyS6TpSi7
         qoCsav3RREBzFc+c2RNHd07MJ+ACmKMleUOgdZF6kJA9hWuMIGA4va48Ej1vFj84kbrv
         3LJbGg6ZrbNEBMo3DzZXinSa9G4t49ZJckQhHWe1e3197THjAj+8UdQ4Oiboipk5UbZb
         HwXrl4NbL7aNLQu/yKkqJS5R91/oTmqfgj+gTEoLyCyjX9cQAOqCf7N7ZBwMOiynMoUf
         Ym8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712961440; x=1713566240;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HKc5QOf/ZMb9xWTXmeJjFB5DhU65yjVEdJ5QMQR8HHA=;
        b=p2QqeqllKV4aFYOWmGQopLm61oGyxRABNTH9yw8hFPdpq/RmXkM+KjwF83xwVW3Sr9
         ewWpxnwRwnJ4k21yk3BNQ+EwLEl7jz5FVMEjtzkRUrvgcmiEawy7Kd4d0pTAa5bHYfGe
         GC972nREsOMLfhD4zBxM5zglllWHgFjuVnz+oxzJ+ZPkJIn5vKDrZKHpLuP79NrRGcej
         yfGu/CHmToVt0GTc3+xdtl5Na0L4j/JtXW4J0AdZUm1ffIB0URLDg7zIqOqFjxFNIOmj
         Pq+O8y5X23UJx4DPtDwR/O4Qi0qgZt3Q7gzYREJJ303H6XZGz2NQ2IRJ442nuGDQIKM9
         X2ag==
X-Forwarded-Encrypted: i=1; AJvYcCWRcourj9Z3CJcNoFPrcSvcSaPq3SF/0bBVICsXcKN/5Q7/TUPSEFa5W8Snbatrj+j3OtAyQcbUtOcJLUc+KV93kX1xrWb7RJh5RJHnAoE0
X-Gm-Message-State: AOJu0Ywl7A8Jdc2hSA6Fp6LKQA4qIfVDRQiKfvWiFoFqtqFag7gE4sHu
	nTRsCcnZQqbnvaCfBaJp5soNuIP9BebB8Zgfa+/9zpGTiDBZVCjj1lgPBjn+x4M=
X-Google-Smtp-Source: AGHT+IEjBUFJuPCaqfHwY1NRFXkkjNtUpEOC6DeTaS2W69mFFwgwmcA7KU2icsnyyk7nr0iryOxGtg==
X-Received: by 2002:a17:902:e5cd:b0:1e4:952c:fafb with SMTP id u13-20020a170902e5cd00b001e4952cfafbmr5259647plf.2.1712961439988;
        Fri, 12 Apr 2024 15:37:19 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902a50e00b001ddc83fda95sm3492795plq.186.2024.04.12.15.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 15:37:19 -0700 (PDT)
Date: Fri, 12 Apr 2024 15:37:17 -0700
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
Message-ID: <Zhm3nflMIuue2/RS@ghost>
References: <20240411-dev-charlie-support_thead_vector_6_9-v1-0-4af9815ec746@rivosinc.com>
 <20240411-dev-charlie-support_thead_vector_6_9-v1-14-4af9815ec746@rivosinc.com>
 <20240412-moonshine-acting-0df1a90b86d2@wendy>
 <CALs-HsviR8E-sRvzz7pd5eVGb4+XsAdG1hhbZOPf+m3Cu4JP_Q@mail.gmail.com>
 <Zhl717rsQ7XLBe2F@ghost>
 <CALs-HsuL8A87mCRU2+1F2sEPYmZWTz_MFwAys0h=1uKhb7EYqg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALs-HsuL8A87mCRU2+1F2sEPYmZWTz_MFwAys0h=1uKhb7EYqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_153721_457305_7581700B 
X-CRM114-Status: GOOD (  34.04  )
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

T24gRnJpLCBBcHIgMTIsIDIwMjQgYXQgMDM6MDg6MzFQTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90
ZToKPiBPbiBGcmksIEFwciAxMiwgMjAyNCBhdCAxMToyMuKAr0FNIENoYXJsaWUgSmVua2lucyA8
Y2hhcmxpZUByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgQXByIDEyLCAyMDI0
IGF0IDEwOjA0OjQyQU0gLTA3MDAsIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+IE9uIEZyaSwgQXBy
IDEyLCAyMDI0IGF0IDQ6MzXigK9BTSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2No
aXAuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgQXByIDExLCAyMDI0IGF0IDA5
OjExOjIwUE0gLTA3MDAsIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiA+ID4gPiA+IEVuc3VyZSB0
aGF0IGh3cHJvYmUgZG9lcyBub3QgZmxhZyAidiIgd2hlbiB4dGhlYWR2ZWN0b3IgaXMgcHJlc2Vu
dC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNo
YXJsaWVAcml2b3NpbmMuY29tPgo+ID4gPiA+ID4gLS0tCj4gPiA+ID4gPiAgYXJjaC9yaXNjdi9r
ZXJuZWwvc3lzX2h3cHJvYmUuYyB8IDQgKystLQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+ID4gPgo+ID4gPiA+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zeXNfaHdwcm9iZS5jCj4gPiA+ID4gPiBpbmRleCA4Y2FlNDFhNTAyZGQuLmUwYTQyYzg1MTUx
MSAxMDA2NDQKPiA+ID4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMK
PiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3N5c19od3Byb2JlLmMKPiA+ID4gPiA+
IEBAIC02OSw3ICs2OSw3IEBAIHN0YXRpYyB2b2lkIGh3cHJvYmVfaXNhX2V4dDAoc3RydWN0IHJp
c2N2X2h3cHJvYmUgKnBhaXIsCj4gPiA+ID4gPiAgICAgICBpZiAocmlzY3ZfaXNhX2V4dGVuc2lv
bl9hdmFpbGFibGUoTlVMTCwgYykpCj4gPiA+ID4gPiAgICAgICAgICAgICAgIHBhaXItPnZhbHVl
IHw9IFJJU0NWX0hXUFJPQkVfSU1BX0M7Cj4gPiA+ID4gPgo+ID4gPiA+ID4gLSAgICAgaWYgKGhh
c192ZWN0b3IoKSkKPiA+ID4gPiA+ICsgICAgIGlmIChoYXNfdmVjdG9yKCkgJiYgIXJpc2N2X2hh
c192ZW5kb3JfZXh0ZW5zaW9uX3VubGlrZWx5KFJJU0NWX0lTQV9WRU5ET1JfRVhUX1hUSEVBRFZF
Q1RPUikpCj4gPiA+ID4KPiA+ID4gPiBIbW0sIEkgdGhpbmsgdGhpcyBpcyAiZGFuZ2Vyb3VzIi4g
aGFzX3ZlY3RvcigpIGlzIHVzZWQgYWNyb3NzIHRoZSBrZXJuZWwKPiA+ID4gPiBub3cgaW4gc2V2
ZXJhbCBwbGFjZXMgZm9yIHRoZSBpbi1rZXJuZWwgdmVjdG9yLiBJIGRvbid0IHRoaW5rIHRoYXQK
PiA+ID4gPiBoYXNfdmVjdG9yKCkgc2hvdWxkIHJldHVybiB0cnVlIGZvciB0aGUgVC1IZWFkIHN0
dWZmIGdpdmVuIHRoYXQgJgo+ID4gPiA+IGhhc192ZWN0b3IoKSBzaG91bGQgcmVwcmVzZW50IHRo
ZSByYXRpZmllZCBzcGVjLiBJJ2xsIGhhdmUgdG8gdGhpbmsKPiA+ID4gPiBhYm91dCB0aGlzIG9u
ZSBhbmQgaG93IG5hc3R5IHRoaXMgbWFrZXMgYW55IG9mIHRoZSBzYXZlL3Jlc3RvcmUgY29kZQo+
ID4gPiA+IGV0Yy4KPiA+ID4KPiA+ID4gWWVhaCwgbXkgbm9zZSBjcmlua2xlZCBoZXJlIGFzIHdl
bGwuIElmIHlvdSdyZSBoYXZpbmcgdG8gZG8gYQo+ID4gPiB2ZW5kb3Jpc2ggdGhpbmcgaW4gdGhp
cyBnZW5lcmljIHNwb3QsIHRoZW4gb3RoZXJzIG1heSB0b28sIHN1Z2dlc3RpbmcKPiA+ID4gcGVy
aGFwcyB0aGlzIGlzbid0IHRoZSBjbGVhbmVzdCB3YXkgdG8gZ28gYWJvdXQgaXQuIElkZWFsbHkg
ZXh0ZW5zaW9ucwo+ID4gPiBhcmUgYWxsIGFkZGl0aXZlLCByYXRoZXIgdGhhbiBzdWJ0cmFjdGl2
ZSwgSSBndWVzcz8KPiA+Cj4gPiBUaGlzIHdhcyB0aGUgImVhc2llc3QiIHdheSB0byBzdXBwb3J0
IHRoaXMgYnV0IEkgYWdyZWUgdGhpcyBpcyBub3QKPiA+IGlkZWFsLiBUaGUgdmVjdG9yIGNvZGUg
aXMgbmF0dXJhbGx5IGNvdXBsZWQgd2l0aCBoYXZpbmcgc3VwcG9ydCBmb3IKPiA+ICJ2IiBhbmQg
SSB3YW50ZWQgdG8gbGV2ZXJhZ2UgdGhhdC4gVGhlIG90aGVyIGNvbmNlcm4gaXMgYWxsIG9mIHRo
ZQo+ID4gaWZkZWZzIGZvciBoYXZpbmcgViBlbmFibGVkLiBJIGNhbiBtYWtlIGFsbCBvZiB0aG9z
ZSBWIG9yIFhUSEVBRFZFQ1RPUjsKPiA+IHRoYXQgd2lsbCBpbmNyZWFzZSB0aGUgc3VyZmFjZSBh
cmVhIG9mIHh0aGVhZHZlY3RvciBidXQgaXQgaXMgcHJvYmFibHkKPiA+IHRoZSByaWdodCg/KSB3
YXkgdG8gZ28uCj4gCj4gRm9yIHRoZSBpZmRlZnMsIGlmIHlvdSd2ZSBnb3QgYSBLY29uZmlnIHNv
bWV3aGVyZSBmb3IgVEhFQURfVkVDVE9SLAo+IGNhbid0IHRoYXQganVzdCBkZXBlbmQgb24gdGhl
IFYgY29uZmlnPyBXZSdkIGVuZCB1cCB3aXRoIHRoZQo+IGxpbWl0YXRpb24gdGhhdCB5b3UgY2Fu
J3QgYWRkIFYgMC43IHN1cHBvcnQgd2l0aG91dCBhbHNvIGRyYWdnaW5nIGluCj4gVjEuMCBzdXBw
b3J0LCBidXQgdGhhdCdzIHByb2JhYmx5IGZpbmUsIHJpZ2h0PwoKVGhhdCdzIGEgZ3JlYXQgaWRl
YSwgdGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4KCi0gQ2hhcmxpZQoKPiAKPiAtRXZhbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
