Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B125CD1284
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2024 12:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/ZCw/1OPR/knF9rnPQuDGL9/haBv87NUpQYtkLnhlU=; b=xgYrkYmYj31tdy
	zyjE2dXIHUEvzdHWoeqQhG8kPQD8WP5fQ20AtKUcevqo/P6BeN1bWdsNb8Gbalp7bcML9DfykAZ7W
	BTQmjgkAPOD2keXhB/yaQt3wq2H6UI6XcC+qITdqsPrfVFxW7XWPWyul3J3fikfUmu0ABiFDC46ig
	Splr6KJMcBgpanyRP33tPNoVsedFk5JqupCGMo6fupeLbTAQ1PSts2l53/lK5BYUgBZuFABxkrt8y
	cOU2kSJFD5ZRWJdFNSZSM0Ko6Hvf9DxQYnzGRjONqJafYJRDrwtWewJHP6PUnlILXMY2sWoehJ1wa
	G2FfuF5lD0Aeqw6Wz+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM0o-00000002Xak-38xx;
	Thu, 04 Apr 2024 12:16:10 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rsM0k-00000002XX7-1aGm
	for linux-riscv@lists.infradead.org;
	Thu, 04 Apr 2024 12:16:08 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2d715638540so11887561fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 04 Apr 2024 05:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712232963; x=1712837763; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M7CUkDVzN7ZtwbkfqhOOiERTsuLZVsBjpzU4ddI5VKM=;
        b=XHfRcjK2LJgBbspGRY0pH0uQx0oP/IFIFCYldwVeMCT/XeUYKdZ1xy3KALxwJ0rQFF
         mJFp0riXsifVyZ/M7/m+dR6KcBxSr6X8edOUyDUfyJFuAyX7r5TesjvrSXV2ZnYZtsmZ
         TJTUDN+q+c6Dh3m63EmDiNU9dRia+3M+glDPi94RxncbfYsM5fzb3BHY28HN32NDqDoE
         j9jn5H67stz+toSU/QLo5+wX+fOnoqmoEFHx17EP8Flz8zp15XIfsi2q/ww7KmTQUj3g
         lgPm7lDXqYyXJGH2zsvWMB0eyiq+5TV5GAY/wYpCNvl0Iui7AcQkv42LmeH03JW3zgDn
         WBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712232963; x=1712837763;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M7CUkDVzN7ZtwbkfqhOOiERTsuLZVsBjpzU4ddI5VKM=;
        b=Vf4I6Hdw4MFpln6SBs4McBztsgA1xr6qSD0gh8Y0gMYcXJCHdSM7Bi9cqAbfcbkMuK
         5omX8zoY8yfnqJv+LHn5xbCsUz7G4Q1uk6LAmbYxUXbESReYIP0l875FPlCt2OqJSqJo
         VM9Vfji2xzc595OZvbcgMgK6dxXd+0ISGlRi2e3s2zTLOV02FeqVy2FN7KNH1ui5zFP0
         z19/oxLpP6lj+EjcxSL6B9/EvJVJ3FlEvyUEHgnUn9T1oFk0cs4JcTx69mgdCFistui7
         BgIiyvvrdBAXS1UJEuHEg1uWNoh1PkzQyk2SicB2Xlwq0k22TtZmV9D0Gq6SZPdowg5k
         5Fgg==
X-Forwarded-Encrypted: i=1; AJvYcCX9/+w9KkBHWzjdH/jGc7Zso0slPxOcbnzHx984jmp9Uibzf06vEVl+RMGkoBlrnTB+dTUPZPlSS1w++N2WDS4Pg2yy/2FlahuHR8n8SwPA
X-Gm-Message-State: AOJu0Yy9mautb7Bm0GHA9Tku7sXWeKWDFLYFXAvJHjUv3O0z6jJhCoQJ
	JPo2itKAk/q02kvIzM4UHBHhm4k1WYgOrxg8HprzQeD8/E+coLAFkiwPveXkyxY=
X-Google-Smtp-Source: AGHT+IHYFdWmSj7wn8SFyRFXMduCoplAQPqaPLjEPnPkn3UWdbmb8OMIHJOSpfY0ndz+qQW8DO3Ptg==
X-Received: by 2002:a2e:8e6d:0:b0:2d8:2799:c3b1 with SMTP id t13-20020a2e8e6d000000b002d82799c3b1mr1596767ljk.10.1712232963336;
        Thu, 04 Apr 2024 05:16:03 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ck5-20020a5d5e85000000b0034349225fbcsm12841155wrb.114.2024.04.04.05.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:16:02 -0700 (PDT)
Date: Thu, 4 Apr 2024 14:16:01 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>
Subject: Re: [PATCH v4 07/15] RISC-V: KVM: No need to exit to the user space
 if perf event failed
Message-ID: <20240404-ea40bc0237635d671e64fef6@orel>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
 <20240229010130.1380926-8-atishp@rivosinc.com>
 <20240302-1a3c0df25f2422e1e6abecf3@orel>
 <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOnJCUJCQjBfLZFW-3iLUB6ygyRmz1Anu+fhfrT4Lpoj2iNB5Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240404_051606_434478_5452E88F 
X-CRM114-Status: GOOD (  44.86  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBBcHIgMDEsIDIwMjQgYXQgMDM6Mzc6MDFQTSAtMDcwMCwgQXRpc2ggUGF0cmEgd3Jv
dGU6Cj4gT24gU2F0LCBNYXIgMiwgMjAyNCBhdCAxMjoxNuKAr0FNIEFuZHJldyBKb25lcyA8YWpv
bmVzQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgRmViIDI4LCAyMDI0
IGF0IDA1OjAxOjIyUE0gLTA4MDAsIEF0aXNoIFBhdHJhIHdyb3RlOgo+ID4gPiBDdXJyZW50bHks
IHdlIHJldHVybiBhIGxpbnV4IGVycm9yIGNvZGUgaWYgY3JlYXRpbmcgYSBwZXJmIGV2ZW50IGZh
aWxlZAo+ID4gPiBpbiBrdm0uIFRoYXQgc2hvdWxkbid0IGJlIG5lY2Vzc2FyeSBhcyBndWVzdCBj
YW4gY29udGludWUgdG8gb3BlcmF0ZQo+ID4gPiB3aXRob3V0IHBlcmYgcHJvZmlsaW5nIG9yIHBy
b2ZpbGluZyB3aXRoIGZpcm13YXJlIGNvdW50ZXJzLgo+ID4gPgo+ID4gPiBSZXR1cm4gYXBwcm9w
cmlhdGUgU0JJIGVycm9yIGNvZGUgdG8gaW5kaWNhdGUgdGhhdCBQTVUgY29uZmlndXJhdGlvbgo+
ID4gPiBmYWlsZWQuIEFuIGVycm9yIG1lc3NhZ2UgaW4ga3ZtIGFscmVhZHkgZGVzY3JpYmVzIHRo
ZSByZWFzb24gZm9yIGZhaWx1cmUuCj4gPgo+ID4gSSBkb24ndCBrbm93IGVub3VnaCBhYm91dCB0
aGUgcGVyZiBzdWJzeXN0ZW0gdG8ga25vdyBpZiB0aGVyZSBtYXkgYmUKPiA+IGEgY29uY2VybiB0
aGF0IHJlc291cmNlcyBhcmUgdGVtcG9yYXJpbHkgdW5hdmFpbGFibGUuIElmIHNvLCB0aGVuIHRo
aXMKPiAKPiBEbyB5b3UgbWVhbiB0aGUgaGFyZHdhcmUgcmVzb3VyY2VzIHVuYXZhaWxhYmxlIGJl
Y2F1c2UgdGhlIGhvc3QgaXMgdXNpbmcgaXQgPwoKWWVzIChJIHRoaW5rKS4gVGhlIGlzc3VlIEkn
bSB0aGlua2luZyBvZiBpcyBpZiBrdm1fcG11X2NyZWF0ZV9wZXJmX2V2ZW50CihwZXJmX2V2ZW50
X2NyZWF0ZV9rZXJuZWxfY291bnRlcikgcmV0dXJucyBzb21ldGhpbmcgbGlrZSBFQlVTWSBhbmQg
dGhlbgp3ZSB0cmFuc2xhdGUgdGhhdCB0byBTQklfRVJSX05PVF9TVVBQT1JURUQuIEknbSBub3Qg
c3VyZSBndWVzdHMgd291bGQKaW50ZXJwcmV0IG5vdC1zdXBwb3J0ZWQgYXMgYW4gZXJyb3Igd2hp
Y2ggbWVhbnMgdGhleSBjYW4gcmV0cnkuIE9yIGlmCnRoZXkgcmV0cnkgYW5kIGdldCBzb21ldGhp
bmcgb3RoZXIgdGhhbiBub3Qtc3VwcG9ydGVkIGlmIHRoZXknZCBiZQpjb25mdXNlZC4KClRoYW5r
cywKZHJldwogIAoKPiAKPiA+IHBhdGNoIHdvdWxkIG1ha2UgaXQgcG9zc2libGUgZm9yIGEgZ3Vl
c3QgdG8gZG8gdGhlIGV4YWN0IHNhbWUgdGhpbmcsCj4gPiBidXQgc29tZXRpbWVzIHN1Y2NlZWQg
YW5kIHNvbWV0aW1lcyBnZXQgU0JJX0VSUl9OT1RfU1VQUE9SVEVELgo+ID4gc2JpX3BtdV9jb3Vu
dGVyX2NvbmZpZ19tYXRjaGluZyBkb2Vzbid0IGN1cnJlbnRseSBoYXZlIGFueSBlcnJvciB0eXBl
cwo+ID4gc3BlY2lmaWVkIHRoYXQgc2F5ICJ1bnN1cHBvcnRlZCBhdCB0aGUgbW9tZW50LCBtYXli
ZSB0cnkgYWdhaW4iLCB3aGljaAo+ID4gd291bGQgYmUgbW9yZSBhcHByb3ByaWF0ZSBpbiB0aGF0
IGNhc2UuIEkgZG8gc2VlCj4gPiBwZXJmX2V2ZW50X2NyZWF0ZV9rZXJuZWxfY291bnRlcigpIGNh
biByZXR1cm4gRU5PTUVNIHdoZW4gbWVtb3J5IGlzbid0Cj4gPiBhdmFpbGFibGUsIGJ1dCBpZiB0
aGUga2VybmVsIGlzbid0IGFibGUgdG8gYWxsb2NhdGUgYSBzbWFsbCBhbW91bnQgb2YKPiA+IG1l
bW9yeSwgdGhlbiB3ZSdyZSBpbiBiaWdnZXIgdHJvdWJsZSBhbnl3YXksIHNvIHRoZSBjb25jZXJu
IHdvdWxkIGJlCj4gPiBpZiB0aGVyZSBhcmUgcGVyZiByZXNvdXJjZSBwb29scyB3aGljaCBtYXkg
dGVtcG9yYXJpbHkgYmUgZXhoYXVzdGVkIGF0Cj4gPiB0aGUgdGltZSB0aGUgZ3Vlc3QgbWFrZXMg
dGhpcyByZXF1ZXN0Lgo+ID4KPiAKPiBGb3Igb3RoZXIgY2FzZXMsIHRoaXMgcGF0Y2ggZW5zdXJl
cyB0aGF0IGd1ZXN0cyBjb250aW51ZSB0byBydW4gd2l0aG91dCBmYWlsdXJlCj4gd2hpY2ggYWxs
b3dzIHRoZSB1c2VyIGluIHRoZSBndWVzdCB0byB0cnkgYWdhaW4gaWYgdGhpcyBmYWlscyBkdWUg
dG8gYSB0ZW1wb3JhcnkKPiByZXNvdXJjZSBhdmFpbGFiaWxpdHkuCj4gCj4gPiBPbmUgY29tbWVu
dCBiZWxvdy4KPiA+Cj4gPiA+Cj4gPiA+IEZpeGVzOiAwY2I3NGI2NWQyZTUgKCJSSVNDLVY6IEtW
TTogSW1wbGVtZW50IHBlcmYgc3VwcG9ydCB3aXRob3V0IHNhbXBsaW5nIikKPiA+ID4gUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+ID4gPiAtLS0KPiA+ID4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfcG11LmMgICAgIHwgMTQgKysrKysrKysrLS0tLS0KPiA+ID4gIGFy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jIHwgIDYgKysrLS0tCj4gPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9w
bXUuYwo+ID4gPiBpbmRleCBiMTU3NGMwNDNmNzcuLjI5YmY0Y2E3OThjYiAxMDA2NDQKPiA+ID4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9wbXUuYwo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2t2
bS92Y3B1X3BtdS5jCj4gPiA+IEBAIC0yMjksOCArMjI5LDkgQEAgc3RhdGljIGludCBrdm1fcG11
X3ZhbGlkYXRlX2NvdW50ZXJfbWFzayhzdHJ1Y3Qga3ZtX3BtdSAqa3ZwbXUsIHVuc2lnbmVkIGxv
bmcgY3QKPiA+ID4gICAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IC1zdGF0aWMg
aW50IGt2bV9wbXVfY3JlYXRlX3BlcmZfZXZlbnQoc3RydWN0IGt2bV9wbWMgKnBtYywgc3RydWN0
IHBlcmZfZXZlbnRfYXR0ciAqYXR0ciwKPiA+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzLCB1bnNpZ25lZCBsb25nIGVpZHgsIHVuc2lnbmVk
IGxvbmcgZXZ0ZGF0YSkKPiA+ID4gK3N0YXRpYyBsb25nIGt2bV9wbXVfY3JlYXRlX3BlcmZfZXZl
bnQoc3RydWN0IGt2bV9wbWMgKnBtYywgc3RydWN0IHBlcmZfZXZlbnRfYXR0ciAqYXR0ciwKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmbGFn
cywgdW5zaWduZWQgbG9uZyBlaWR4LAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGV2dGRhdGEpCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHN0cnVj
dCBwZXJmX2V2ZW50ICpldmVudDsKPiA+ID4KPiA+ID4gQEAgLTQ1NCw3ICs0NTUsOCBAQCBpbnQg
a3ZtX3Jpc2N2X3ZjcHVfcG11X2N0cl9jZmdfbWF0Y2goc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1
bnNpZ25lZCBsb25nIGN0cl9iYQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZWlkeCwgdTY0IGV2dGRhdGEsCj4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGt2bV92Y3B1X3NiaV9yZXR1cm4gKnJldGRhdGEp
Cj4gPiA+ICB7Cj4gPiA+IC0gICAgIGludCBjdHJfaWR4LCByZXQsIHNiaXJldCA9IDA7Cj4gPiA+
ICsgICAgIGludCBjdHJfaWR4LCBzYmlyZXQgPSAwOwo+ID4gPiArICAgICBsb25nIHJldDsKPiA+
ID4gICAgICAgYm9vbCBpc19mZXZlbnQ7Cj4gPiA+ICAgICAgIHVuc2lnbmVkIGxvbmcgZXZlbnRf
Y29kZTsKPiA+ID4gICAgICAgdTMyIGV0eXBlID0ga3ZtX3BtdV9nZXRfcGVyZl9ldmVudF90eXBl
KGVpZHgpOwo+ID4gPiBAQCAtNTEzLDggKzUxNSwxMCBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfcG11
X2N0cl9jZmdfbWF0Y2goc3RydWN0IGt2bV92Y3B1ICp2Y3B1LCB1bnNpZ25lZCBsb25nIGN0cl9i
YQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAga3ZwbXUtPmZ3X2V2ZW50W2V2ZW50X2NvZGVd
LnN0YXJ0ZWQgPSB0cnVlOwo+ID4gPiAgICAgICB9IGVsc2Ugewo+ID4gPiAgICAgICAgICAgICAg
IHJldCA9IGt2bV9wbXVfY3JlYXRlX3BlcmZfZXZlbnQocG1jLCAmYXR0ciwgZmxhZ3MsIGVpZHgs
IGV2dGRhdGEpOwo+ID4gPiAtICAgICAgICAgICAgIGlmIChyZXQpCj4gPiA+IC0gICAgICAgICAg
ICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiArICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHNiaXJldCA9IFNCSV9FUlJfTk9UX1NVUFBPUlRFRDsK
PiA+ID4gKyAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gPiArICAgICAgICAgICAg
IH0KPiA+ID4gICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICBzZXRfYml0KGN0cl9pZHgsIGt2cG11
LT5wbWNfaW5fdXNlKTsKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2Jp
X3BtdS5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfcG11LmMKPiA+ID4gaW5kZXggN2VjYTcy
ZGYyY2JkLi5iNzAxNzllOWU4NzUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3Zj
cHVfc2JpX3BtdS5jCj4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX3BtdS5jCj4g
PiA+IEBAIC00Miw5ICs0Miw5IEBAIHN0YXRpYyBpbnQga3ZtX3NiaV9leHRfcG11X2hhbmRsZXIo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuLAo+ID4gPiAgI2VuZGlm
Cj4gPiA+ICAgICAgICAgICAgICAgLyoKPiA+ID4gICAgICAgICAgICAgICAgKiBUaGlzIGNhbiBm
YWlsIGlmIHBlcmYgY29yZSBmcmFtZXdvcmsgZmFpbHMgdG8gY3JlYXRlIGFuIGV2ZW50Lgo+ID4g
PiAtICAgICAgICAgICAgICAqIEZvcndhcmQgdGhlIGVycm9yIHRvIHVzZXJzcGFjZSBiZWNhdXNl
IGl0J3MgYW4gZXJyb3Igd2hpY2gKPiA+ID4gLSAgICAgICAgICAgICAgKiBoYXBwZW5lZCB3aXRo
aW4gdGhlIGhvc3Qga2VybmVsLiBUaGUgb3RoZXIgb3B0aW9uIHdvdWxkIGJlCj4gPiA+IC0gICAg
ICAgICAgICAgICogdG8gY29udmVydCB0byBhbiBTQkkgZXJyb3IgYW5kIGZvcndhcmQgdG8gdGhl
IGd1ZXN0Lgo+ID4gPiArICAgICAgICAgICAgICAqIE5vIG5lZWQgdG8gZm9yd2FyZCB0aGUgZXJy
b3IgdG8gdXNlcnNwYWNlIGFuZCBleGl0IHRoZSBndWVzdAo+ID4KPiA+IFBlcmlvZCBhZnRlciBn
dWVzdAo+ID4KPiA+Cj4gPiA+ICsgICAgICAgICAgICAgICogb3BlcmF0aW9uIGNhbiBjb250aW51
ZSB3aXRob3V0IHByb2ZpbGluZy4gRm9yd2FyZCB0aGUKPiA+Cj4gPiBUaGUgb3BlcmF0aW9uCj4g
Pgo+IAo+IEZpeGVkIHRoZSBhYm92ZSB0d28uCj4gCj4gCj4gPiA+ICsgICAgICAgICAgICAgICog
YXBwcm9wcmlhdGUgU0JJIGVycm9yIHRvIHRoZSBndWVzdC4KPiA+ID4gICAgICAgICAgICAgICAg
Ki8KPiA+ID4gICAgICAgICAgICAgICByZXQgPSBrdm1fcmlzY3ZfdmNwdV9wbXVfY3RyX2NmZ19t
YXRjaCh2Y3B1LCBjcC0+YTAsIGNwLT5hMSwKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjcC0+YTIsIGNwLT5hMywgdGVtcCwgcmV0ZGF0
YSk7Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgo+ID4KPiA+IFRoYW5rcywKPiA+IGRyZXcK
PiAKPiAKPiAKPiAtLQo+IFJlZ2FyZHMsCj4gQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
