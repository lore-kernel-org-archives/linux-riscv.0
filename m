Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319B3EE4993
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 18:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WO6F/D+jP+y+MmZaOHjeTsMBud3tFofxmSsBY/VLeEI=; b=MBlVYCLKxHdnqa
	3bDKiKQxhmb8h8fYdGdjy3tJNWB9mY14f0YmRav16EZnF/+wHvUXGTnJxc6AO/Z6ifLJSdNClJO6j
	fhjSyQgUnaM9nM5eRAOZ5QZOUTg/fz+J3idbHUjyviOpOBlazIX3VllPektc4+VEtxyx3kF/N3VR+
	Kg5EXw+bE1L8ga7flkgQox9Q59cpVAUbZQNWx6MTPv/oIqH9mZrpkwCCHDEqwD6EYznompNfxFtg3
	EqmH2MVwL5E7AKXjmtc/HAGdvWae664w1mDYFDRyseqQsSpBMVsfHlsWGJjlfaW7+8iblSJBPKy8d
	p/AnAiNyiFkMIYsDDjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVh7-00Gc75-10;
	Tue, 22 Aug 2023 18:01:33 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYVh4-00Gc6V-0p
	for linux-riscv@lists.infradead.org;
	Tue, 22 Aug 2023 18:01:31 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50078eba7afso4526372e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Aug 2023 11:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1692727286; x=1693332086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArdacZGEgxuaEmK7vOrYzLuRAXKPxRu+VtDpBr1+HRs=;
        b=IojyaF6e+Q8WGZrKhBsJYYiKQ4u6GXM6D1Y4/mCvY7Q8ehNQ5SwGnnnComT6yZVx9t
         H58jW1IFwJ9Lqyhx5XQiV54UIH3anU3jQAjCpIhYzZ+247T5DBuGacyYboZo60rTo9ZI
         Ak7EhsMFVj0CIlQd63S06Sfq59pXi6reqBIUIVFhdpnXauEt7bHBbfzs4BlJNRqzmw97
         lXEr+l+8nckBfK9I8j5GwrJSJ1c0460huQxyD3APapxbuBawdQauLkKGCBEyElJ/Iq3v
         Vr7Y6ZI7Eh+QznPuk6fa8+7Rw02QDEyqJUJjt8StL6HK8+L+P0qSrUBd6ns9CfdOLEVe
         Tp9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692727286; x=1693332086;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArdacZGEgxuaEmK7vOrYzLuRAXKPxRu+VtDpBr1+HRs=;
        b=dx4m/JEGnLETXGVxsyHAFJJyrxSbj6zGUesi5s7115mD4PpTqlprfonJ8RtckNpPFY
         ayJrWox3BUSa3Kqg8Z3XM5KfHa+DoxpNHR+ClSplgKHzTd5dSKuayzC7eg+UwrnasQ6M
         /PY9gegZIUryOIG7Uod+sN0DzxMvM3vYy1dObsNPbHUPzJNZ5A/+eGMdLhhVr7WDMj3Q
         tfPozGuVEJpdbnzHpnvCT/yR5aPSStTUACS0ewyHRYk4bBMqEgWlBTwiHVQJSs8RyHM3
         qA5DzcBiegArj1+cksAiW7h0TrIK03zdawwIFH5lNVXg4RUVD2TLDCuLNDOQ00jIEyzQ
         WZhA==
X-Gm-Message-State: AOJu0YwBypMIKS8Vdts9rmq9FCuE05ix1+o/EKj9oZsK4oosLs5oYAaZ
	00t9iFbGdS09z8PVAnDgexjUrwMqakcbNnnBAlQGWg==
X-Google-Smtp-Source: AGHT+IH8+8934lpXLpE9LLvD3qN+X24ItiZOlPXefsbhiLzvHNufQ1fzSCxeHP93gpT8srnmrOuDQr6CMTvqOzU2A8I=
X-Received: by 2002:a05:6512:704:b0:500:8fe8:7e80 with SMTP id
 b4-20020a056512070400b005008fe87e80mr1441064lfs.26.1692727286154; Tue, 22 Aug
 2023 11:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230816155450.26200-1-andy.chiu@sifive.com> <20230816155450.26200-3-andy.chiu@sifive.com>
 <alpine.DEB.2.21.2308170158460.8596@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2308170158460.8596@angie.orcam.me.uk>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Wed, 23 Aug 2023 02:01:14 +0800
Message-ID: <CABgGipXhfz6iQgf86wj-=e9kzxiJp5N-u7OjL_Aj=wTP1MvRnQ@mail.gmail.com>
Subject: Re: [v1, 2/3] RISC-V: vector: export VLENB csr in __sc_riscv_v_state
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	greentime.hu@sifive.com, guoren@linux.alibaba.com, bjorn@kernel.org, 
	conor.dooley@microchip.com, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Vincent Chen <vincent.chen@sifive.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_110130_328060_0BF3D82B 
X-CRM114-Status: GOOD (  19.32  )
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

SGksCgpPbiBUaHUsIEF1ZyAxNywgMjAyMyBhdCA4OjM14oCvUE0gTWFjaWVqIFcuIFJvenlja2kg
PG1hY3JvQG9yY2FtLm1lLnVrPiB3cm90ZToKPgo+IE9uIFdlZCwgMTYgQXVnIDIwMjMsIEFuZHkg
Q2hpdSB3cm90ZToKPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2Fz
bS9wdHJhY2UuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9wdHJhY2UuaAo+ID4gaW5k
ZXggZTE3YzU1MDk4NmE2Li4yODM4MDAxMzA2MTQgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vcHRyYWNlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9wdHJhY2UuaAo+ID4gQEAgLTk3LDYgKzk3LDcgQEAgc3RydWN0IF9fcmlzY3Zfdl9l
eHRfc3RhdGUgewo+ID4gICAgICAgdW5zaWduZWQgbG9uZyB2bDsKPiA+ICAgICAgIHVuc2lnbmVk
IGxvbmcgdnR5cGU7Cj4gPiAgICAgICB1bnNpZ25lZCBsb25nIHZjc3I7Cj4gPiArICAgICB1bnNp
Z25lZCBsb25nIHZsZW5iOwo+ID4gICAgICAgdm9pZCAqZGF0YXA7Cj4KPiAgSSB0aGluayB3ZSBy
ZWFsbHkgb3VnaHQgdG8gbWFrZSBhIGRpc3RpbmN0IHN0cnVjdHVyZSBob2xkaW5nIHRoZSB2ZWN0
b3IKPiBDU1Igc3RhdGUgb25seSwgYW5kIHRoZW4gaGF2ZSBpdCBpbmNsdWRlZCBhcyBhIGxlYWRp
bmcgbWVtYmVyIG9mIGEgcGFpciBvZgo+IG90aGVyIHN0cnVjdHVyZXMsIG9uZSBmb3IgdGhlIHNp
Z25hbCBjb250ZXh0IHdpdGggYSB0cmFpbGluZyBgZGF0YXAnIChvcgo+IGB2cmVncCcgb3IgYHZy
ZWcnKSBtZW1iZXIgYW5kIGFub3RoZXIgb25lIGZvciB0aGUgcmVnc2V0IHdpdGggYSBmbGV4aWJs
ZQo+IGFycmF5IG1lbWJlciBvZiB0aGUgYGNoYXInIHR5cGUsIGUuZy4gKGFjdHVhbCBuYW1lcyBU
QkQpOgo+Cj4gc3RydWN0IF9fcmlzY3Zfdl9jc3Jfc3RhdGUgewo+ICAgICAgICAgdW5zaWduZWQg
bG9uZyB2c3RhcnQ7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHZsOwo+ICAgICAgICAgdW5zaWdu
ZWQgbG9uZyB2dHlwZTsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgdmNzcjsKPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgdmxlbmI7Cj4gfTsKPgo+IHN0cnVjdCBfX3Jpc2N2X3Zfc2lnbmFsX3N0YXRl
IHsKPiAgICAgICAgIHN0cnVjdCBfX3Jpc2N2X3ZfY3NyX3N0YXRlIGNzcjsKPiAgICAgICAgIHZv
aWQgKnZyZWdwOwo+IH07Cj4KPiBzdHJ1Y3QgX19yaXNjdl92X3JlZ3NldF9zdGF0ZSB7Cj4gICAg
ICAgICBzdHJ1Y3QgX19yaXNjdl92X2Nzcl9zdGF0ZSBjc3I7Cj4gICAgICAgICBjaGFyIHZyZWdb
XTsKPiB9Owo+Cj4gVGhpcyB3aWxsIG1ha2UgdGhlIEFQSSBjbGVhbmVyIGFuZCBhdm9pZCBib3Ro
IFVCIHdpdGggbWFraW5nIGFjY2Vzc2VzCj4gYmV5b25kIHRoZSBlbmQgb2YgYSBzdHJ1Y3R1cmUg
YW5kIGNsdXR0ZXIgd2l0aCBhbiB1bnVzZWQgZW50cnkgaW4gY29yZQo+IGZpbGVzIGFuZCBkYXRh
IGV4Y2hhbmdlZCB2aWEgcHRyYWNlKDIpLgoKWWVzLCBhbmQgbWF5IEkgdW5kZXJzdGFuZCB3aHkg
dGhlcmUgaXMgYSBuZWVkIGZvciBoYXZpbmcgc3RydWN0Cl9fcmlzY3Zfdl9jc3Jfc3RhdGU/IFVu
bGVzcyB0aGVyZSBpcyBhIG5lZWQgZm9yIGdldHRpbmcgQ1NScyBvbmx5LCB5ZXQKdmVjdG9yIENT
UnMgYXJlIG5vdCBtZWFuaW5nZnVsIHdpdGhvdXQgdGhlIGNvbnRlbnQgb2YgVmVjdG9yCnJlZ2lz
dGVycy4gUGVyc29uYWxseSBJJ2QgbGlrZSB0byBoYXZlIG9uZSB1bml2ZXJzYWwgc3RydWN0dXJl
IGZvcgpib3RoIHB0cmFjZS9zaWduYWwvY29udGV4dC1zd2ljdGgoaW50ZXJuYWwgdG8gdGhlIGtl
cm5lbCksIG9yIG9uZSBmb3IKVUFQSSBhbmQgdGhlIG90aGVyIGZvciBrZXJuZWwgaW50ZXJuYWwt
dXNlZC4gQmVjYXVzZSB0aGVuIHdlIGRvbid0CmhhdmUgdG8gbWVzcyB3aXRoIGFsbCBraW5kcyBv
ZiBhY2Nlc3MgaGVscGVycyBmb3Igc2ltaWxhciB0aGluZ3MuCk1heWJlIEkgbG9zdCBzb21ldGhp
bmcgb3IganVzdCBoYXZlbid0IHJlYWQgZW5vdWdoIGJ1dCBkb2Vzbid0IGl0CnNvdW5kIGNvbmZ1
c2luZyB0aGF0IHdlIGNyZWF0ZSB0d28gc3RydWN0dXJlcyBpbiBVQVBJIGp1c3QgZm9yIHRoZQpW
ZWN0b3IgcmVnaXN0ZXJzIGR1bXA/Cgo+Cj4gIFNpbmNlIHRoaXMgaXMgYSBwYXJ0IG9mIHRoZSBV
QVBJIEkgc3VnZ2VzdCBjb25zdWx0aW5nIHdpdGggbGliYyBwZW9wbGUsCj4gcG9zc2libHkgYnkg
cG9zdGluZyBhbiBSRkMgdG8gPGxpYmMtYWxwaGFAc291cmNld2FyZS5vcmc+Lgo+Cj4gICBNYWNp
ZWoKClRoYW5rcywKQW5keQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
