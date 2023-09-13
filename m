Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04C8EE020A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 19:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cN5vJ30pFv15TPfMq5f5S0PqZ7H9t7jFbFsTX4Nt4y4=; b=aJFg0kLsaUbMEv
	Nz5H34M5S9N56+NraQ79AWtg78sHOVRK/JObz1D8rjADJOd5EiyTak2C2AHSuxC53JRhEFu1O4jwq
	4y4Iag/IcDfr3jUnwz0WFyK7hTXpv8ZMulBUgp3nRXf8Kgl/VmHGbxr1wlaqorFeXWP674Z1f6tPJ
	PON4LOwrCIy6Pi+sNq6OCE6swK1P8lW+Nv4tN2yY6Fxci9OLl/vNs9uVp2jW8sQRhtC6K6K5yWvSU
	HEeXAzVZyGPEgMofb9AVuTXLIef2D9rn/E5xs273BwGdSgHAY3PEAwrZGhB+QRHt8zJKRUqHlxkTz
	n7+EX7h1uzEz/xJOw2Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVtj-006dH9-2o;
	Wed, 13 Sep 2023 19:51:39 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgVtf-006dG9-3B
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 19:51:38 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9338e4695so2687871fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 12:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694634691; x=1695239491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCinIFiwyA1THjAerwaM6YAhdUmb1I6lH4Dp6saPs58=;
        b=U0px9GBTGa47e4vxFeRk92V8iC2sVsNNScOXXXYsC/dkpTtfs7mQBI+sTtnHFXwvL6
         d+S11Uu6Hv8nzHIvUXLdqki5vwgi2SRwaTFIKD9LGsUmOm1TIBY1e268y8VE8Mfe74EK
         l0Xv6HPL1UQq7E1JiWUA2YE9FXz3nzeFkYwApIUBCy5wZ6nCk3n5A5jBrTbuTMr8ITTN
         gpLa7YDAxu51G887PRUWafv8/Fs+WPVscyNNIAcMbJf6Xr1DDgikASEyw3mre4Sya12T
         vtHXWmKQyjrTTw2S2EYBXqy27szpjwxWbBO4oHImB/h84flTgExt46HG7Nj9l/SDSiEE
         rDgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694634691; x=1695239491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCinIFiwyA1THjAerwaM6YAhdUmb1I6lH4Dp6saPs58=;
        b=CkUVUGdkGDBxHFvE8BJIHab8DBKXGXoiGar06TyKSkeJJb2AeQOIO8BqyWVRIrESjy
         FFRzFuyeGJ6LTzX3uGJx9Pt9Xc0ac6Jh1G7tJcUzkk/AB0eYolPb8NZ6ppZTgLJeK+dN
         QtwBoNOblZWe5gRaHc3YnqGdaD9HfhzO0solrM5ZsZjPFhaYtsjVLXr3DoHkRGf09Y69
         1eQou7G8AEC5RQWOe7fotJLS/td1Cib4aLncHfWStI7U/aMBCPv5nMqunrYQZBtoeFnW
         PMIsKm35gry6Qkmi28maHL+rqcLh0SV2Gmfi5LbG8vBT6025SmospkfsOS9L17w0N/HZ
         6mxQ==
X-Gm-Message-State: AOJu0YyMgO2h5yeq7Hl2rlVYFgR8C1LoFr8sphj/8n5sO6GBqrMFQEUY
	gWAesDRJHx7H/cGwMmOIKpYrKdoa0lCkyKxXVUV6rQ==
X-Google-Smtp-Source: AGHT+IH6jXP4cKNsRH9wRCYsWT5MxTKk6m/JahuGmziFl8OTUz6V889TGIQaXveChjEzmUOTnwd5OKybzD3MhNC0ftY=
X-Received: by 2002:a2e:81d4:0:b0:2bd:ddf:8aa6 with SMTP id
 s20-20020a2e81d4000000b002bd0ddf8aa6mr3545643ljg.23.1694634690974; Wed, 13
 Sep 2023 12:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <ZQD+0BWNU8wlnC9d@xhacker> <17d351c6-e6c3-43ce-a466-691778ba05c3@codethink.co.uk>
 <ZQHREHx4XCN70iUq@xhacker>
In-Reply-To: <ZQHREHx4XCN70iUq@xhacker>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 13 Sep 2023 12:50:54 -0700
Message-ID: <CALs-HssesyM7RJVaoHhPFk6SQP-J1pHF79rseYDZp=A++Cuy3g@mail.gmail.com>
Subject: Re: boot time regressed a lot due to misaligned access probe
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, linux-riscv@lists.infradead.org, 
	PalmerDabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_125136_026531_8AD415E0 
X-CRM114-Status: GOOD (  23.81  )
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

T24gV2VkLCBTZXAgMTMsIDIwMjMgYXQgODoyM+KAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCAxMTo0NjoyOEFN
ICswMTAwLCBCZW4gRG9va3Mgd3JvdGU6Cj4gPiBPbiAxMy8wOS8yMDIzIDAxOjE0LCBKaXNoZW5n
IFpoYW5nIHdyb3RlOgo+ID4gPiBIaSBhbGwsCj4gPiA+Cj4gPiA+IFByb2Jpbmcgb25lIGNwdSBm
b3IgbWlzYWxpZ25lZCBhY2Nlc3MgY29zdCBhYm91dCAwLjA2cywgc28gaXQgd2lsbCBjb3N0Cj4g
PiA+IGFib3V0IDMuOHMgb24gcGxhdGZvcm1zIHdpdGggNjQgQ1BVcywgZm9yIGV4YW1wbGUsIG1p
bGt2IHBpb25lZXIgd2hpY2gKPiA+ID4gaXMgcG93ZXJlZCBieSBzZzIwNDIuCj4gPiA+Cj4gPiA+
IEknbSBub3Qgc3VyZSB0aGUgcmVhc29uIG9mIHByb2JpbmcgbWlzYWxpZ25lZCBhY2Nlc3MgZm9y
IGFsbCBDUFVzLiBJZgo+ID4gPiB0aGUgSFcgZG9lc24ndCBiZWhhdmUgYXMgU01QIGZyb20gbWlz
YWxsaWduZWQgYWNjZXNzIHNpZGUsIHRoZW4gdW5sZXNzCj4gPiA+IHVzZXJzcGFjZSBwcm9jZXNz
ZXMgZm9yY2UgY3B1IGFmZmluaXR5LCB0aGV5IGFsd2F5cyBzdWZmZXIgZnJvbSB0aGlzCj4gPiA+
IG5vbi1TTVAgcGFpbi4KPiA+ID4KPiA+ID4gU28sIGNhbiB3ZSBvbmx5IHByb2JlIHRoZSBib290
IGNwdT8KCkhpIEppc2hlbmcsClRoYW5rcyBmb3IgaWRlbnRpZnlpbmcgdGhpcyByZWdyZXNzaW9u
LiBJJ2QgcHJlZmVyIHRvIGtlZXAgdGhlIHByb2JpbmcKb24gZWFjaCBjcHUsIGFzIEkgZG9uJ3Qg
dGhpbmsgaXQncyBzYWZlIHRvIGFzc3VtZSBiZWhhdmlvciBpcyB0aGUgc2FtZQphY3Jvc3MgYWxs
IGNvcmVzLiBCdXQgdGhlcmUncyBubyByZWFzb24gdGhpcyBuZWVkcyB0byBiZSBkb25lCnNlcmlh
bGx5LCB3ZSBzaG91bGQgYmUgYWJsZSB0byBkbyB0aGUgY2hlY2tpbmcgaW4gcGFyYWxsZWwgb24g
ZWFjaApjcHUuIEkgZG9uJ3QgaGF2ZSBhIHBoeXNpY2FsIDY0LWNvcmUgc3lzdGVtLCBidXQgSSBl
eHBlcmltZW50ZWQgd2l0aApxZW11IGEgYml0OgoKV2l0aCBtaXNhbGlnbmVkIHByb2JpbmcKWyAg
ICAwLjU1ODkzMF0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAuLi4KWyAgICA3LjYz
NTU4MF0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgNjQgQ1BVcwoKV2l0aCBubyBtaXNhbGlnbmVk
IHByb2JpbmcKWyAgICAwLjQ3MzAxMl0gc21wOiBCcmluZ2luZyB1cCBzZWNvbmRhcnkgQ1BVcyAu
Li4KWyAgICA1LjQzODQ1MF0gc21wOiBCcm91Z2h0IHVwIDEgbm9kZSwgNjQgQ1BVcwoKV2l0aCBj
aGFuZ2UgYmVsb3c6ClsgICAgMC42MTU2ODRdIHNtcDogQnJpbmdpbmcgdXAgc2Vjb25kYXJ5IENQ
VXMgLi4uClsgICAgNS40ODkwNDVdIHNtcDogQnJvdWdodCB1cCAxIG5vZGUsIDY0IENQVXMKCkkg
YWxzbyBjb21tZW50ZWQgb3V0IHRoZSBwcl9pbmZvKCkgaW4gbXkgdGVzdGluZywgbW9zdGx5IHRv
IGtlZXAgdGhlClVBUlQgb3V0IG9mIHRoZSB3YXkuIFdlIHNob3VsZCBzdHJpdmUgdG8gaW1wcm92
ZSB0aGUgc21wIGNvcmUgYnJpbmd1cAp0aW1lIGluIGdlbmVyYWwsIGJ1dCBob3BlZnVsbHkgd2l0
aCB0aGlzIHRoZSBtaXNhbGlnbmVkIHByb2Jpbmcgd29uJ3QKYmUgbWFraW5nIGl0IHdvcnNlLiBJ
ZiB0aGlzIHdvcmtzIGZvciB5b3UgSSBjYW4gY2xlYW4gaXQgdXAgYW5kIHN1Ym1pdAphIHBhdGNo
IChzb3JyeSBnbWFpbCBtYW5nbGVzIHRoZSBkaWZmKToKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC9zbXBib290LmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKaW5kZXggMWI4
ZGE0ZTQwYTRkLi43ZGNlMzBiN2M4NjggMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3Nt
cGJvb3QuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zbXBib290LmMKQEAgLTIyMyw4ICsyMjMs
MTggQEAgaW50IF9fY3B1X3VwKHVuc2lnbmVkIGludCBjcHUsIHN0cnVjdCB0YXNrX3N0cnVjdCAq
dGlkbGUpCiAgICAgICAgcmV0dXJuIHJldDsKIH0KCitzdGF0aWMgdm9pZCBjaGVja191bmFsaWdu
ZWRfYWNjZXNzX2NwdSh2b2lkICp1bnVzZWQpCit7CisgICAgICAgdW5zaWduZWQgaW50IGNwdSA9
IHNtcF9wcm9jZXNzb3JfaWQoKTsKKworICAgICAgIC8qIFNvbWVvbmUgaGFzIHRvIHN0YXkgYmVo
aW5kIGFuZCB0ZW5kIHRoZSBqaWZmaWVzLiAqLworICAgICAgIGlmIChjcHUgIT0gMCkKKyAgICAg
ICAgICAgICAgIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3MoY3B1KTsKK30KKwogdm9pZCBfX2luaXQg
c21wX2NwdXNfZG9uZSh1bnNpZ25lZCBpbnQgbWF4X2NwdXMpCiB7CisgICAgICAgb25fZWFjaF9j
cHUoY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19jcHUsIE5VTEwsIDApOwogfQoKIC8qCkBAIC0yNDYs
NyArMjU2LDYgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgdm9pZCBzbXBfY2FsbGluKHZvaWQpCgog
ICAgICAgIG51bWFfYWRkX2NwdShjdXJyX2NwdWlkKTsKICAgICAgICBzZXRfY3B1X29ubGluZShj
dXJyX2NwdWlkLCAxKTsKLSAgICAgICBjaGVja191bmFsaWduZWRfYWNjZXNzKGN1cnJfY3B1aWQp
OwoKICAgICAgICBpZiAoaGFzX3ZlY3RvcigpKSB7CiAgICAgICAgICAgICAgICBpZiAocmlzY3Zf
dl9zZXR1cF92c2l6ZSgpKQoKLUV2YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
