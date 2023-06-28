Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62490EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 06:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAXG00JfL5HtD3h5J/Nt5Mz8lKQdgKHlBiad1G7NUtc=; b=hyzCwb+doK9SD3
	A0+BUWV1xxDVzf1CzOkRfwe+07HwS8n5nP1fMnZhLPaMtbSFw2WJVWuuHuZxl27u5wGCDg8VDSxqE
	jZkjf2rHQIZQfE9tXes+BFdraBMPY+ufO1+krsfuBdKZj2ZJd+iv/XnkdINvJmZ44uqx+hrR0wdtV
	pYwGGKKLpAKgvSENRYTy/SmS2HounIA8IDgHXYLzL+zxyG4Jexe/tsVHlrJ6QDEKOMpkqKVrCsDaP
	xWMPlHUT9iarrtYjfcFI1h7Y4I9uz3c76QGQDJ4LNpgluglTwFDG+j28YOsztyMi1RyHoGLn2HqkL
	rP51KTREjmixP+kHmP+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEOEs-00EvRt-1a;
	Wed, 28 Jun 2023 06:01:14 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEOEp-00EvRC-1q;
	Wed, 28 Jun 2023 06:01:12 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b5c231f842so55449471fa.2;
        Tue, 27 Jun 2023 23:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687932069; x=1690524069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g54qKoeGjWz5wLaqSLQFYfEyGEtCRjTvx7zRiV5BneY=;
        b=pRHmeOTKG1duvuJdNrnOYKjshYw/mxtRaKMgxu4E1HMkpMdYmGSzyB4cg3zihRBtPP
         0NmsViUdeBCv8M0Z3VRMzR1C4Ts6OfTwvNR7BZVtnTDzqaklNhPUJYysZ0kyHY110omI
         bhOi2BP90QAPOwLl7+qaczPrpcEWNepM2g+UWzbepApTyOLlhPqcSrSJ80RXe4c3WZyz
         1R4eyC3FfhCWkcQgC1Tp+r2jdZ3fv+qiSWe/IzZGKGH5vN5o9goeoEn9wggd/W83197l
         GEsNLEo+0d68XFI//YuPtaVErM049r73/DGqxY2YaEe+QOh+VwuEixrCFPLlrljSXJq3
         DhEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687932069; x=1690524069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g54qKoeGjWz5wLaqSLQFYfEyGEtCRjTvx7zRiV5BneY=;
        b=crH1+gdXSVU6WU93tYSXK9DpNUZjZiYYmzmXF+AUrl9rxduLmNb97ICIe7fBbC9S94
         TFsozgTpdMAVnkXXwU9Mr0c9bk6F5Y4iZed4Fq4jHx1Iq4M9idcrwL/5qhn5qOWsesaK
         +We/nK6Iom1K98dWdoBNVFdKtJomFa6yy4S44rRvyS+u65s7y2fuv56k21/QV8dSAyfi
         fhb2RV2EZzzqveGJKSlW6QH0cQoXK+gJh2lq99nYALsDCqjQLYRhG0TfW0UCEpE7BesN
         q51yY07vPy7LheRQpXZMrdwq2lsk8e06cjR05fipUxvLixAoLmYZRWgZcivB/zdfMppG
         DxBQ==
X-Gm-Message-State: AC+VfDzP48ZS9Hju2tncxsl+pPhhSOSRCM2zqVZL5G8MwuMDYmP6DgEt
	w86ciQjupgrRaC6uP0UXR8w5Qik/TB43lBs1k7A=
X-Google-Smtp-Source: ACHHUZ7VQCn+YpLvmFmYlf+FOQl2niELacwE4Dcgqiq8I8RkRNKRsyCtVuMehnHMGr1vYCdhl+c2sAGOLh6Bb/4fwYA=
X-Received: by 2002:a05:651c:8f:b0:2b6:a17b:a120 with SMTP id
 15-20020a05651c008f00b002b6a17ba120mr5672641ljq.22.1687932068929; Tue, 27 Jun
 2023 23:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687515463.git.haibo1.xu@intel.com> <47f0502d076c071260a87953cbabadfc85d278cf.1687515463.git.haibo1.xu@intel.com>
 <20230627-adcb173b3ee813e2e16353bd@orel>
In-Reply-To: <20230627-adcb173b3ee813e2e16353bd@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 28 Jun 2023 14:00:57 +0800
Message-ID: <CAJve8onuBoOOOL4yp3wTTsBMqxf4MZL6uUjgMBjUmWsTO61A2g@mail.gmail.com>
Subject: Re: [PATCH v4 09/12] KVM: selftests: Only do get/set tests on present
 blessed list
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Ben Gardon <bgardon@google.com>, 
	David Matlack <dmatlack@google.com>, Ricardo Koller <ricarkol@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_230111_612787_3DB12F60 
X-CRM114-Status: GOOD (  24.99  )
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

T24gVHVlLCBKdW4gMjcsIDIwMjMgYXQgNToxMeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjMsIDIwMjMgYXQgMDY6NDA6
MTFQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBPbmx5IGRvIHRoZSBnZXQvc2V0IHRlc3Rz
IG9uIHByZXNlbnQgYW5kIGJsZXNzZWQgcmVnaXN0ZXJzCj4gPiBzaW5jZSB3ZSBkb24ndCBrbm93
IHRoZSBjYXBhYmlsaXRpZXMgb2YgYW55IG5ldyBvbmVzLgo+ID4KPiA+IFN1Z2dlc3RlZC1ieTog
QW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6
IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAgdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jIHwgMjkgKysrKysrKysrKysrKystLS0tLS0t
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkK
PiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWct
bGlzdC5jIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiBp
bmRleCBiOTU2ZWU0MTA5OTYuLjNiZWI2YjYyZGUwYSAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxpc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiBAQCAtNTIsNiArNTIsMTAgQEAgZXh0
ZXJuIGludCB2Y3B1X2NvbmZpZ3NfbjsKPiA+ICAgICAgIGZvcl9lYWNoX3JlZ19maWx0ZXJlZChp
KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAg
ICAgICAgICAgICAgaWYgKCFmaW5kX3JlZyhibGVzc2VkX3JlZywgYmxlc3NlZF9uLCByZWdfbGlz
dC0+cmVnW2ldKSkKPiA+Cj4gPiArI2RlZmluZSBmb3JfZWFjaF9wcmVzZW50X2JsZXNzZWRfcmVn
KGkpICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICsgICAgIGZvciAoKGkpID0gMDsgKGkpIDwg
Ymxlc3NlZF9uOyArKyhpKSkgICAgICAgICAgIFwKPiA+ICsgICAgICAgICAgICAgaWYgKGZpbmRf
cmVnKHJlZ19saXN0LT5yZWcsIHJlZ19saXN0LT5uLCBibGVzc2VkX3JlZ1tpXSkpCj4gPiArCj4g
PiAgc3RhdGljIGNvbnN0IGNoYXIgKmNvbmZpZ19uYW1lKHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpj
KQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCB2Y3B1X3JlZ19zdWJsaXN0ICpzOwo+ID4gQEAgLTE4
OSw2ICsxOTMsMTYgQEAgc3RhdGljIHZvaWQgcnVuX3Rlc3Qoc3RydWN0IHZjcHVfcmVnX2xpc3Qg
KmMpCj4gPiAgICAgICAgICAgICAgIHJldHVybjsKPiA+ICAgICAgIH0KPiA+Cj4gPiArICAgICBm
b3JfZWFjaF9zdWJsaXN0KGMsIHMpCj4gPiArICAgICAgICAgICAgIGJsZXNzZWRfbiArPSBzLT5y
ZWdzX247Cj4gPiArICAgICBibGVzc2VkX3JlZyA9IGNhbGxvYyhibGVzc2VkX24sIHNpemVvZihf
X3U2NCkpOwo+ID4gKwo+ID4gKyAgICAgbiA9IDA7Cj4gPiArICAgICBmb3JfZWFjaF9zdWJsaXN0
KGMsIHMpIHsKPiA+ICsgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IHMtPnJlZ3NfbjsgKytp
KQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJsZXNzZWRfcmVnW24rK10gPSBzLT5yZWdzW2ld
Owo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAgICAgLyoKPiA+ICAgICAgICAqIFdlIG9ubHkgdGVz
dCB0aGF0IHdlIGNhbiBnZXQgdGhlIHJlZ2lzdGVyIGFuZCB0aGVuIHdyaXRlIGJhY2sgdGhlCj4g
PiAgICAgICAgKiBzYW1lIHZhbHVlLiBTb21lIHJlZ2lzdGVycyBtYXkgYWxsb3cgb3RoZXIgdmFs
dWVzIHRvIGJlIHdyaXR0ZW4KPiA+IEBAIC0xOTgsOCArMjEyLDExIEBAIHN0YXRpYyB2b2lkIHJ1
bl90ZXN0KHN0cnVjdCB2Y3B1X3JlZ19saXN0ICpjKQo+ID4gICAgICAgICogYmUgd3JpdHRlbiBu
ZWVkIHRvIGhhdmUgdGhlIG90aGVyIHZhbHVlcyB0ZXN0ZWQsIHRoZW4gd2Ugc2hvdWxkCj4gPiAg
ICAgICAgKiBjcmVhdGUgYSBuZXcgc2V0IG9mIHRlc3RzIGZvciB0aG9zZSBpbiBhIG5ldyBpbmRl
cGVuZGVudCB0ZXN0Cj4gPiAgICAgICAgKiBleGVjdXRhYmxlLgo+ID4gKyAgICAgICoKPiA+ICsg
ICAgICAqIE9ubHkgZG8gdGhlIGdldC9zZXQgdGVzdHMgb24gcHJlc2VudCwgYmxlc3NlZCBsaXN0
IHJlZ2lzdGVycywKPiA+ICsgICAgICAqIHNpbmNlIHdlIGRvbid0IGtub3cgdGhlIGNhcGFiaWxp
dGllcyBvZiBhbnkgbmV3IHJlZ2lzdGVycy4KPiA+ICAgICAgICAqLwo+ID4gLSAgICAgZm9yX2Vh
Y2hfcmVnKGkpIHsKPiA+ICsgICAgIGZvcl9lYWNoX3ByZXNlbnRfYmxlc3NlZF9yZWcoaSkgewo+
ID4gICAgICAgICAgICAgICB1aW50OF90IGFkZHJbMjA0OCAvIDhdOwo+ID4gICAgICAgICAgICAg
ICBzdHJ1Y3Qga3ZtX29uZV9yZWcgcmVnID0gewo+ID4gICAgICAgICAgICAgICAgICAgICAgIC5p
ZCA9IHJlZ19saXN0LT5yZWdbaV0sCj4gPiBAQCAtMjQyLDE2ICsyNTksNiBAQCBzdGF0aWMgdm9p
ZCBydW5fdGVzdChzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ICAgICAgICAgICAgICAgfQo+
ID4gICAgICAgfQo+ID4KPiA+IC0gICAgIGZvcl9lYWNoX3N1Ymxpc3QoYywgcykKPiA+IC0gICAg
ICAgICAgICAgYmxlc3NlZF9uICs9IHMtPnJlZ3NfbjsKPiA+IC0gICAgIGJsZXNzZWRfcmVnID0g
Y2FsbG9jKGJsZXNzZWRfbiwgc2l6ZW9mKF9fdTY0KSk7Cj4gPiAtCj4gPiAtICAgICBuID0gMDsK
PiA+IC0gICAgIGZvcl9lYWNoX3N1Ymxpc3QoYywgcykgewo+ID4gLSAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgcy0+cmVnc19uOyArK2kpCj4gPiAtICAgICAgICAgICAgICAgICAgICAgYmxl
c3NlZF9yZWdbbisrXSA9IHMtPnJlZ3NbaV07Cj4gPiAtICAgICB9Cj4gPiAtCj4gPiAgICAgICBm
b3JfZWFjaF9uZXdfcmVnKGkpCj4gPiAgICAgICAgICAgICAgICsrbmV3X3JlZ3M7Cj4gPgo+ID4g
LS0KPiA+IDIuMzQuMQo+ID4KPgo+IFJldmlld2VkLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPgo+Cj4gVGhhbmtzLAo+IGRyZXcKClRoYW5rcyBmb3IgdGhlIHJldmll
dyEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
