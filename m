Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9976CCDB474
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdb7VKD4f4hkZjoi07pUQuFCLA5bYf4Ez0MRXu9mC3s=; b=ajIi677rL2Q1Aa
	MuZ4XqYHxKGCriaJMQrpjTt6LTyYzMngViDBNzuGcoEAf8qOB9LB7qdlCR+haeEkdqo1GqjB70Qb/
	cBjxiGM4f8HzXVEalvFQSnTvecbikDTgANJ637sWikdBa3AKNsA8RzPyKZs0q3n1308dpaPJgHmBr
	tgq414a5nrjNGEKCiqW5ZG+mxoJ8P/qk7C24d0U0rgX7BenJXoAj+w+PHSRqq2q45dYqaceIR/b1N
	Ic8eU0TjFuIVJlnMGjcp50PIw8X1orwJuMc3Csjmre/Acu519PWy9L8ZQ/Xp4cbQaNxwujiGIaqv/
	ln2GLeAH8qPSF8a/DMBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpqU-002Q3O-22;
	Fri, 20 Oct 2023 13:47:22 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpqQ-002Q20-1G
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:47:20 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-5859d13f73dso572380a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Oct 2023 06:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697809636; x=1698414436; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujFKaHWQlVUmMQlPTcdZIic60Ioy7TSqQ3nDhHoDDn0=;
        b=HlYM0X5s9izCJa27KFADOfRgBD7vu18RxvjWvLu8vPUvX68XxrGuvAnTnUKd/WPjj4
         uYT2dgVEi30hVLojVJL6GHG2O9SDiuZOMl/TsZkvYJAjfKghpJAjtf9LJRrLUcPEYrEs
         kaxHLLv2ZRVY0iyG/b9eG4dmsgVK01WPuJj53DTJCXHXBi/BJHnX7zbjfkw5sxRUcCUq
         6rzLoE4lc7XUtAUMY92fjAawyOmeTdotG6tug5Bx6Dfb+SpdETnPe0Kd8L5/vlSYEarU
         HVHBMB8s2LMohKp1Zrtx3NLWERx+sBrsnlDg7ibXFJQpZqrJYyyll0ZlUMemi6xnH+hF
         9wdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697809636; x=1698414436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujFKaHWQlVUmMQlPTcdZIic60Ioy7TSqQ3nDhHoDDn0=;
        b=cNMKzS6xqyWbROmoFFAB5MV9iwAkkXo4Oyq6E0n6LTTrb+6W4zk+c+ZloCmogFBzit
         S0Zs9GTndmTEmG0UuXlAV+vKN4WNgsUQ7/vBF80Dgd63xe2iXgRdD0Q7f2Snca8Ov+pM
         92xQCg/8U7aUQ9Mwgu94VnEsQqlX4pveYkMFQ1wjaea4rCtuht6SdxCgE6WnAeH6VBu1
         C7lXE/sV+UmpAuMwzf13838K8HsL2M/czV43fEaf+THasF3mdksUIOdLn7P5FtzhEgCW
         WlYZVXGMtwqRK4IpQm/8z3DDdsQZnQQn2ms9LFYk/zUPZyVS9Qt828ZzTDPL/rHK7NHZ
         X4Qg==
X-Gm-Message-State: AOJu0YyBRN2TxnPGMMD91+CkyRsrUP6bZnJJCnWMxyz0qmdkHEW5Wl+x
	4I55jeGo3pqb1VMAC6EJYfRJ02NWSqQttvReUNa2Cg==
X-Google-Smtp-Source: AGHT+IEe1qO4q6kLy01GbxGxRAix8XMIPBN+082Nf7nryQBHvgSvHroABh+Pz6NLehEhxMDygq9zBHrYtbpZO8gR1/0=
X-Received: by 2002:a05:6a21:66cb:b0:172:f4e:5104 with SMTP id
 ze11-20020a056a2166cb00b001720f4e5104mr1738132pzb.20.1697809636011; Fri, 20
 Oct 2023 06:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <20231020072140.900967-1-apatel@ventanamicro.com>
 <20231020072140.900967-9-apatel@ventanamicro.com> <20231020-f1ec2b7e384a4cfeae39966f@orel>
In-Reply-To: <20231020-f1ec2b7e384a4cfeae39966f@orel>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 20 Oct 2023 19:17:03 +0530
Message-ID: <CAK9=C2Vg8O_6OaND_s1MhpBHpm1petoU7DNXOOaSOxXYUY1iAw@mail.gmail.com>
Subject: Re: [PATCH v3 8/9] tty: Add SBI debug console support to HVC SBI driver
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Conor Dooley <conor@kernel.org>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_064718_448847_4D56B2D5 
X-CRM114-Status: GOOD (  26.17  )
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

T24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgNDoxNuKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBPY3QgMjAsIDIwMjMgYXQgMTI6NTE6
MzlQTSArMDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IEZyb206IEF0aXNoIFBhdHJhIDxhdGlz
aHBAcml2b3NpbmMuY29tPgo+ID4KPiA+IFJJU0MtViBTQkkgc3BlY2lmaWNhdGlvbiBzdXBwb3J0
cyBhZHZhbmNlZCBkZWJ1ZyBjb25zb2xlCj4gPiBzdXBwb3J0IHZpYSBTQkkgREJDTiBleHRlbnNp
b24uCj4gPgo+ID4gRXh0ZW5kIHRoZSBIVkMgU0JJIGRyaXZlciB0byBzdXBwb3J0IGl0Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4g
U2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAt
LS0KPiA+ICBkcml2ZXJzL3R0eS9odmMvS2NvbmZpZyAgICAgICAgIHwgIDIgKy0KPiA+ICBkcml2
ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jIHwgODIgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3NiBpbnNlcnRpb25zKCspLCA4IGRlbGV0
aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9odmMvS2NvbmZpZyBiL2Ry
aXZlcnMvdHR5L2h2Yy9LY29uZmlnCj4gPiBpbmRleCA0ZjkyNjRkMDA1YzAuLjZlMDVjNWM3YmNh
MSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvdHR5L2h2Yy9LY29uZmlnCj4gPiArKysgYi9kcml2
ZXJzL3R0eS9odmMvS2NvbmZpZwo+ID4gQEAgLTEwOCw3ICsxMDgsNyBAQCBjb25maWcgSFZDX0RD
Q19TRVJJQUxJWkVfU01QCj4gPgo+ID4gIGNvbmZpZyBIVkNfUklTQ1ZfU0JJCj4gPiAgICAgICBi
b29sICJSSVNDLVYgU0JJIGNvbnNvbGUgc3VwcG9ydCIKPiA+IC0gICAgIGRlcGVuZHMgb24gUklT
Q1ZfU0JJX1YwMQo+ID4gKyAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQkkKPiA+ICAgICAgIHNlbGVj
dCBIVkNfRFJJVkVSCj4gPiAgICAgICBoZWxwCj4gPiAgICAgICAgIFRoaXMgZW5hYmxlcyBzdXBw
b3J0IGZvciBjb25zb2xlIG91dHB1dCB2aWEgUklTQy1WIFNCSSBjYWxscywgd2hpY2gKPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jIGIvZHJpdmVycy90dHkv
aHZjL2h2Y19yaXNjdl9zYmkuYwo+ID4gaW5kZXggMzFmNTNmYTc3ZTRhLi41NmRhMWE0YjVhY2Eg
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4gPiArKysg
Yi9kcml2ZXJzL3R0eS9odmMvaHZjX3Jpc2N2X3NiaS5jCj4gPiBAQCAtMzksMjEgKzM5LDg5IEBA
IHN0YXRpYyBpbnQgaHZjX3NiaV90dHlfZ2V0KHVpbnQzMl90IHZ0ZXJtbm8sIGNoYXIgKmJ1Ziwg
aW50IGNvdW50KQo+ID4gICAgICAgcmV0dXJuIGk7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgY29u
c3Qgc3RydWN0IGh2X29wcyBodmNfc2JpX29wcyA9IHsKPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0
IGh2X29wcyBodmNfc2JpX3YwMV9vcHMgPSB7Cj4gPiAgICAgICAuZ2V0X2NoYXJzID0gaHZjX3Ni
aV90dHlfZ2V0LAo+ID4gICAgICAgLnB1dF9jaGFycyA9IGh2Y19zYmlfdHR5X3B1dCwKPiA+ICB9
Owo+ID4KPiA+IC1zdGF0aWMgaW50IF9faW5pdCBodmNfc2JpX2luaXQodm9pZCkKPiA+ICtzdGF0
aWMgaW50IGh2Y19zYmlfZGJjbl90dHlfcHV0KHVpbnQzMl90IHZ0ZXJtbm8sIGNvbnN0IGNoYXIg
KmJ1ZiwgaW50IGNvdW50KQo+ID4gIHsKPiA+IC0gICAgIHJldHVybiBQVFJfRVJSX09SX1pFUk8o
aHZjX2FsbG9jKDAsIDAsICZodmNfc2JpX29wcywgMTYpKTsKPiA+ICsgICAgIHBoeXNfYWRkcl90
IHBhOwo+ID4gKyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiArCj4gPiArICAgICBpZiAoaXNf
dm1hbGxvY19hZGRyKGJ1ZikpIHsKPiA+ICsgICAgICAgICAgICAgcGEgPSBwYWdlX3RvX3BoeXMo
dm1hbGxvY190b19wYWdlKGJ1ZikpICsgb2Zmc2V0X2luX3BhZ2UoYnVmKTsKPiA+ICsgICAgICAg
ICAgICAgaWYgKFBBR0VfU0laRSA8IChvZmZzZXRfaW5fcGFnZShidWYpICsgY291bnQpKQo+Cj4g
SSB0aG91Z2h0IGNoZWNrcGF0Y2ggY29tcGxhaW5lZCBhYm91dCB1cHBlcmNhc2UgY29uc3RhbnRz
IGJlaW5nIG9uIHRoZQo+IGxlZnQgaW4gY29tcGFyaXNvbnMuCgpOb3BlIGNoZWNrcGF0Y2ggZG9l
cyBub3QgY29tcGxhaW4gYWJvdXQgdGhpcy4KCj4KPiA+ICsgICAgICAgICAgICAgICAgICAgICBj
b3VudCA9IFBBR0VfU0laRSAtIG9mZnNldF9pbl9wYWdlKGJ1Zik7Cj4gPiArICAgICB9IGVsc2Ug
ewo+ID4gKyAgICAgICAgICAgICBwYSA9IF9fcGEoYnVmKTsKPiA+ICsgICAgIH0KPiA+ICsKPiA+
ICsgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpCj4gPiArICAgICAgICAgICAgIHJl
dCA9IHNiaV9lY2FsbChTQklfRVhUX0RCQ04sIFNCSV9FWFRfREJDTl9DT05TT0xFX1dSSVRFLAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY291bnQsIGxvd2VyXzMyX2JpdHMocGEp
LCB1cHBlcl8zMl9iaXRzKHBhKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAs
IDAsIDApOwo+ID4gKyAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICByZXQgPSBzYmlfZWNhbGwo
U0JJX0VYVF9EQkNOLCBTQklfRVhUX0RCQ05fQ09OU09MRV9XUklURSwKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvdW50LCBwYSwgMCwgMCwgMCwgMCk7Cj4gPiArICAgICBpZiAo
cmV0LmVycm9yKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIHJl
dHVybiBjb3VudDsKPgo+IFNob3VsZG4ndCB3ZSByZXR1cm4gcmV0LnZhbHVlIGhlcmUgaW4gY2Fz
ZSBpdCdzIGxlc3MgdGhhbiBjb3VudD8gSSBzZWUgd2UKPiBhbHJlYWR5IGRvIHRoYXQgYmVsb3cg
aW4gZ2V0KCkuCgpBaGgsIHllcy4gR29vZCBjYXRjaCwgSSB3aWxsIHVwZGF0ZS4KCj4KPiA+ICB9
Cj4gPiAtZGV2aWNlX2luaXRjYWxsKGh2Y19zYmlfaW5pdCk7Cj4gPgo+ID4gLXN0YXRpYyBpbnQg
X19pbml0IGh2Y19zYmlfY29uc29sZV9pbml0KHZvaWQpCj4gPiArc3RhdGljIGludCBodmNfc2Jp
X2RiY25fdHR5X2dldCh1aW50MzJfdCB2dGVybW5vLCBjaGFyICpidWYsIGludCBjb3VudCkKPiA+
ICB7Cj4gPiAtICAgICBodmNfaW5zdGFudGlhdGUoMCwgMCwgJmh2Y19zYmlfb3BzKTsKPiA+ICsg
ICAgIHBoeXNfYWRkcl90IHBhOwo+ID4gKyAgICAgc3RydWN0IHNiaXJldCByZXQ7Cj4gPiArCj4g
PiArICAgICBpZiAoaXNfdm1hbGxvY19hZGRyKGJ1ZikpIHsKPiA+ICsgICAgICAgICAgICAgcGEg
PSBwYWdlX3RvX3BoeXModm1hbGxvY190b19wYWdlKGJ1ZikpICsgb2Zmc2V0X2luX3BhZ2UoYnVm
KTsKPiA+ICsgICAgICAgICAgICAgaWYgKFBBR0VfU0laRSA8IChvZmZzZXRfaW5fcGFnZShidWYp
ICsgY291bnQpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNvdW50ID0gUEFHRV9TSVpFIC0g
b2Zmc2V0X2luX3BhZ2UoYnVmKTsKPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAg
IHBhID0gX19wYShidWYpOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gKyAgICAgaWYgKElTX0VOQUJM
RUQoQ09ORklHXzMyQklUKSkKPiA+ICsgICAgICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9F
WFRfREJDTiwgU0JJX0VYVF9EQkNOX0NPTlNPTEVfUkVBRCwKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvdW50LCBsb3dlcl8zMl9iaXRzKHBhKSwgdXBwZXJfMzJfYml0cyhwYSks
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwLCAwLCAwKTsKPiA+ICsgICAgIGVs
c2UKPiA+ICsgICAgICAgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfREJDTiwgU0JJX0VY
VF9EQkNOX0NPTlNPTEVfUkVBRCwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
dW50LCBwYSwgMCwgMCwgMCwgMCk7Cj4gPiArICAgICBpZiAocmV0LmVycm9yKQo+ID4gKyAgICAg
ICAgICAgICByZXR1cm4gMDsKPiA+ICsKPiA+ICsgICAgIHJldHVybiByZXQudmFsdWU7Cj4gPiAr
fQo+ID4gKwo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaHZfb3BzIGh2Y19zYmlfZGJjbl9vcHMg
PSB7Cj4gPiArICAgICAucHV0X2NoYXJzID0gaHZjX3NiaV9kYmNuX3R0eV9wdXQsCj4gPiArICAg
ICAuZ2V0X2NoYXJzID0gaHZjX3NiaV9kYmNuX3R0eV9nZXQsCj4gPiArfTsKPiA+ICsKPiA+ICtz
dGF0aWMgaW50IF9faW5pdCBodmNfc2JpX2luaXQodm9pZCkKPiA+ICt7Cj4gPiArICAgICBpbnQg
ZXJyOwo+ID4gKwo+ID4gKyAgICAgaWYgKChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJz
aW9uKDIsIDApKSAmJgo+ID4gKyAgICAgICAgIChzYmlfcHJvYmVfZXh0ZW5zaW9uKFNCSV9FWFRf
REJDTikgPiAwKSkgewo+ID4gKyAgICAgICAgICAgICBlcnIgPSBQVFJfRVJSX09SX1pFUk8oaHZj
X2FsbG9jKDAsIDAsICZodmNfc2JpX2RiY25fb3BzLCAxNikpOwo+Cj4gV2h5IGFuIG91dGJ1ZiBz
aXplIG9mIG9ubHkgMTY/CgpUaGUgb3V0cHV0IGJ1ZmZlciBzaXplIG9mIDE2IGlzIGEgdmVyeSBj
b21tb24gY2hvaWNlIGFjcm9zcwpIVkMgZHJpdmVycy4gVGhlIG5leHQgYmVzdCBjaG9pY2UgaXMg
MjU2LgoKSSBndWVzcyAyNTYgaXMgYmV0dGVyIHNvIEkgd2lsbCBnbyB3aXRoIHRoYXQuCgo+Cj4g
PiArICAgICAgICAgICAgIGlmIChlcnIpCj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IGVycjsKPiA+ICsgICAgICAgICAgICAgaHZjX2luc3RhbnRpYXRlKDAsIDAsICZodmNfc2JpX2Ri
Y25fb3BzKTsKPiA+ICsgICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgIGlmIChJU19FTkFC
TEVEKENPTkZJR19SSVNDVl9TQklfVjAxKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGVy
ciA9IFBUUl9FUlJfT1JfWkVSTyhodmNfYWxsb2MoMCwgMCwgJmh2Y19zYmlfdjAxX29wcywgMTYp
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoZXJyKQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0dXJuIGVycjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBodmNf
aW5zdGFudGlhdGUoMCwgMCwgJmh2Y19zYmlfdjAxX29wcyk7Cj4gPiArICAgICAgICAgICAgIH0g
ZWxzZSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7Cj4gPiArICAg
ICAgICAgICAgIH0KPiA+ICsgICAgIH0KPiA+Cj4gPiAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4g
PiAtY29uc29sZV9pbml0Y2FsbChodmNfc2JpX2NvbnNvbGVfaW5pdCk7Cj4gPiArZGV2aWNlX2lu
aXRjYWxsKGh2Y19zYmlfaW5pdCk7Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgo+Cj4gVGhhbmtzLAo+
IGRyZXcKClJlZ2FyZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
