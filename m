Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1F1C5AD4C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Nov 2023 10:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCxltryLA2bqafCR4ZPWNzRWN4HxIrfmAP8D+yWNLhg=; b=Z7/M4oUZRvPL9W
	xWkytJx+Rc88JuksN02unoRQ9jLy4vKQoJ0zlvvF9hCuGnunSpMGIUKt8JMAVl1IVnDCzWjk2rijd
	NVIyXwb/omqyvXs6VySJXHKZN2oxGGfYDxeyhqBhyEpV8Pt4dh2+nsWxfrre7CUK6A1omPkGvONUL
	em0VAcrRLIz9PEDodcJ94K4f9jTzE3RJvXgspzjQRJWhiWNgukrvammmFE0FI689ZlAyYJ1g7/JD8
	AaQBrLaxma/9dg17PSW7e1uB7hPPjnWPxw2krwwEB8ns8cHFH+Y1wb+EDyW8OiL52yv98bvGpgoK9
	AhuRoH6px0avI1V2QfSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r67CL-004Psd-0M;
	Thu, 23 Nov 2023 10:44:41 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r67CI-004Prf-1w
	for linux-riscv@lists.infradead.org;
	Thu, 23 Nov 2023 10:44:39 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso748941b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 02:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700736274; x=1701341074; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unmTJjjQSG4GhQBCjfHPKG9Uy9nrMwsNNaOqoSHqW9g=;
        b=EXEimlxPrQDc+69hyQFfuB7R3Jo7Uq+ve40K5SMQtMyTeQNRmVOvdT+udADb65z6gk
         aLPmSAugo2rQqUxldmn2wCc2L1OQCrAZjyqI7WrZNSMi3I6w83KAPtAELX5Gau3Gr3Pv
         cru/98wO4VExlQp4vbZKSLfrPMHITyyw4wuWmd27XI1If03z3OOqgzuZg9BzzF1zvxpr
         DgWb2PIzk3Tv3pNFEzwCPXPynbD8s11GILRro/P4YGOl8h+1bOuNVU/E0XnCE7HQcj2Z
         /DhVhlm4+RJR8+JsQhKP8qaf4FfRGNmeLQ3mbog5hrSHiOdRTlkROjhNdxS7IlX5YV6Z
         7AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700736274; x=1701341074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unmTJjjQSG4GhQBCjfHPKG9Uy9nrMwsNNaOqoSHqW9g=;
        b=CBfRKIuQhUTpZQ0XWegr/T1vJDxWX4mQG6ABogTsr5zlMshEZR7hZw8wCuTkSGKLHo
         g5cdu5/KEcd8QLHpF4FZnZGKYvkgX2w1/dG5UD5eB+DYqi/ZB0/9KL88Kz9x+5XSaop7
         HS4F1jD/nLOA92Xzu1FSwKDLXpJcm1gr8Nvb9+hl5F0i5F/QJmbve0oS5X1CErjhoW68
         +E4j1YBShWBXrY7s3eVP/PpzJKD8wpuJDNR0+h7djTVX0I4o3S4OfDfcytXRpERHbrTA
         lrtbME/RSkbhE30tTpai7skkQEShUt31ybWuY/0+joLTVzPEWY/9aTntJ26o5QDn+K6O
         T+Cg==
X-Gm-Message-State: AOJu0YwurcBVlpNhVAQk+JaFyJ3TjpFxGEJV0OKIP1hBKZl2wNsSTu3Z
	3CNCmHHNT4vGQ80xYnKpTzhjrx7/9t0VWi+IqHSQtg==
X-Google-Smtp-Source: AGHT+IGkFYRhyV0fxJkdmnJmDbruM7tyCPnBEy8QS6oIFkUlufe60cG/P+XEsi8T11OkZWQvkjQH/aa9Fevg/e/ljSM=
X-Received: by 2002:a05:6a20:320f:b0:187:4487:c5e9 with SMTP id
 hl15-20020a056a20320f00b001874487c5e9mr4048871pzc.47.1700736273705; Thu, 23
 Nov 2023 02:44:33 -0800 (PST)
MIME-Version: 1.0
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-3-apatel@ventanamicro.com> <adf2a8f4-f675-4d27-8b46-5d80d3251b6c@sifive.com>
In-Reply-To: <adf2a8f4-f675-4d27-8b46-5d80d3251b6c@sifive.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 23 Nov 2023 16:14:21 +0530
Message-ID: <CAK9=C2WmFFsVmZZj9j9VwdQOgBiXZOUujoj5VWcycPetkqHRMQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] RISC-V: Add SBI debug console helper routines
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_024438_646096_A64FE0A3 
X-CRM114-Status: GOOD (  18.51  )
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

T24gV2VkLCBOb3YgMjIsIDIwMjMgYXQgNDoxNeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDIzLTExLTE3
IDk6MzggUE0sIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBMZXQgdXMgcHJvdmlkZSBTQkkgZGVidWcg
Y29uc29sZSBoZWxwZXIgcm91dGluZXMgd2hpY2ggY2FuIGJlCj4gPiBzaGFyZWQgYnkgc2VyaWFs
L2Vhcmx5Y29uLXJpc2N2LXNiaS5jIGFuZCBodmMvaHZjX3Jpc2N2X3NiaS5jLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0t
Cj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCB8ICA1ICsrKysrCj4gPiAgYXJjaC9y
aXNjdi9rZXJuZWwvc2JpLmMgICAgICB8IDQzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaAo+ID4gaW5kZXggNjZmMzkzM2MxNGY2Li5lZTdhZWY1ZjYyMzMgMTAwNjQ0
Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3NiaS5oCj4gPiBAQCAtMzM0LDYgKzMzNCwxMSBAQCBzdGF0aWMgaW5s
aW5lIHVuc2lnbmVkIGxvbmcgc2JpX21rX3ZlcnNpb24odW5zaWduZWQgbG9uZyBtYWpvciwKPiA+
ICB9Cj4gPgo+ID4gIGludCBzYmlfZXJyX21hcF9saW51eF9lcnJubyhpbnQgZXJyKTsKPiA+ICsK
PiA+ICtleHRlcm4gYm9vbCBzYmlfZGVidWdfY29uc29sZV9hdmFpbGFibGU7Cj4gPiAraW50IHNi
aV9kZWJ1Z19jb25zb2xlX3dyaXRlKHVuc2lnbmVkIGludCBudW1fYnl0ZXMsIHBoeXNfYWRkcl90
IGJhc2VfYWRkcik7Cj4gPiAraW50IHNiaV9kZWJ1Z19jb25zb2xlX3JlYWQodW5zaWduZWQgaW50
IG51bV9ieXRlcywgcGh5c19hZGRyX3QgYmFzZV9hZGRyKTsKPiA+ICsKPiA+ICAjZWxzZSAvKiBD
T05GSUdfUklTQ1ZfU0JJICovCj4gPiAgc3RhdGljIGlubGluZSBpbnQgc2JpX3JlbW90ZV9mZW5j
ZV9pKGNvbnN0IHN0cnVjdCBjcHVtYXNrICpjcHVfbWFzaykgeyByZXR1cm4gLTE7IH0KPiA+ICBz
dGF0aWMgaW5saW5lIHZvaWQgc2JpX2luaXQodm9pZCkge30KPiA+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9zYmkuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3NiaS5jCj4gPiBpbmRleCA1
YTYyZWQxZGE0NTMuLjczYTljMjJjMzk0NSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3NiaS5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+ID4gQEAgLTU3MSw2
ICs1NzEsNDQgQEAgbG9uZyBzYmlfZ2V0X21pbXBpZCh2b2lkKQo+ID4gIH0KPiA+ICBFWFBPUlRf
U1lNQk9MX0dQTChzYmlfZ2V0X21pbXBpZCk7Cj4gPgo+ID4gK2Jvb2wgc2JpX2RlYnVnX2NvbnNv
bGVfYXZhaWxhYmxlOwo+ID4gKwo+ID4gK2ludCBzYmlfZGVidWdfY29uc29sZV93cml0ZSh1bnNp
Z25lZCBpbnQgbnVtX2J5dGVzLCBwaHlzX2FkZHJfdCBiYXNlX2FkZHIpCj4gPiArewo+ID4gKyAg
ICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiArCj4gPiArICAgICBpZiAoIXNiaV9kZWJ1Z19jb25z
b2xlX2F2YWlsYWJsZSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+ID4g
Kwo+ID4gKyAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHXzMyQklUKSkKPiA+ICsgICAgICAgICAg
ICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNPTEVfV1JJ
VEUsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBudW1fYnl0ZXMsIGxvd2VyXzMy
X2JpdHMoYmFzZV9hZGRyKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVwcGVy
XzMyX2JpdHMoYmFzZV9hZGRyKSwgMCwgMCwgMCk7Cj4gPiArICAgICBlbHNlCj4gPiArICAgICAg
ICAgICAgIHJldCA9IHNiaV9lY2FsbChTQklfRVhUX0RCQ04sIFNCSV9FWFRfREJDTl9DT05TT0xF
X1dSSVRFLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbnVtX2J5dGVzLCBiYXNl
X2FkZHIsIDAsIDAsIDAsIDApOwo+ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJldC5lcnJvciA/IHNi
aV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcikgOiByZXQudmFsdWU7Cj4gPiArfQo+ID4g
Kwo+ID4gK2ludCBzYmlfZGVidWdfY29uc29sZV9yZWFkKHVuc2lnbmVkIGludCBudW1fYnl0ZXMs
IHBoeXNfYWRkcl90IGJhc2VfYWRkcikKPiA+ICt7Cj4gPiArICAgICBzdHJ1Y3Qgc2JpcmV0IHJl
dDsKPiA+ICsKPiA+ICsgICAgIGlmICghc2JpX2RlYnVnX2NvbnNvbGVfYXZhaWxhYmxlKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiArCj4gPiArICAgICBpZiAoSVNf
RU5BQkxFRChDT05GSUdfMzJCSVQpKQo+ID4gKyAgICAgICAgICAgICByZXQgPSBzYmlfZWNhbGwo
U0JJX0VYVF9EQkNOLCBTQklfRVhUX0RCQ05fQ09OU09MRV9SRUFELAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbnVtX2J5dGVzLCBsb3dlcl8zMl9iaXRzKGJhc2VfYWRkciksCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1cHBlcl8zMl9iaXRzKGJhc2VfYWRkciks
IDAsIDAsIDApOwo+ID4gKyAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICByZXQgPSBzYmlfZWNh
bGwoU0JJX0VYVF9EQkNOLCBTQklfRVhUX0RCQ05fQ09OU09MRV9SRUFELAo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgbnVtX2J5dGVzLCBiYXNlX2FkZHIsIDAsIDAsIDAsIDApOwo+
ID4gKwo+ID4gKyAgICAgcmV0dXJuIHJldC5lcnJvciA/IHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5v
KHJldC5lcnJvcikgOiByZXQudmFsdWU7Cj4gPiArfQo+Cj4gU2luY2UgZXZlcnkgcGxhY2UgdGhh
dCBjYWxscyB0aGVzZSBmdW5jdGlvbnMgd2lsbCBuZWVkIHRvIGRvIHRoZSB2bWFsbG9jIGxvb2t1
cCwKPiB3b3VsZCBpdCBtYWtlIHNlbnNlIHRvIGRvIGl0IGhlcmUsIGFuZCBoYXZlIHRoZXNlIHRh
a2UgYSBwb2ludGVyIGluc3RlYWQ/CgpZZXMsIHRoYXQncyBiZXR0ZXIuIEkgd2lsbCB1cGRhdGUu
CgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
