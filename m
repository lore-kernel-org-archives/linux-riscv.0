Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE502C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jun 2023 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJkwvG8hPMdDFOdH+vVZjCJ4pYJYIhx597AKcwsALeE=; b=BT2hQReMKkkH71
	BK1BfWTb0cQBnWi1W/KaMe7t/SN7/u6u40zus+FLeaD5G5xgSDJm7tjHcbXMir58waTvu5jR3TqCh
	8pOQRqe3ScdPTyP1x5EJXyHIh6r5ooxGxwfQWfVUD/rrSrZLDxpMJ8rnGncDST1NEAeIrLOtRhjEW
	9l9ksyu18o6T0rhQhvTU+8wFJszaxVDv17dAD8Wlde/8YgH6YmbkrnYJpPQdJ6+VARbBdjQvH1KHS
	UhdpY6lp88JJDQ0QY8QaNRyvuNlk3i0lONbd27Q/gffsLXGOUR04+AoHptWDkbAZ7V0+AkSKmYT1v
	GXqyqp6tN4CNkrEkQ/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8dMS-003B4Q-2d;
	Mon, 12 Jun 2023 08:57:16 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8dMP-003B31-35
	for linux-riscv@lists.infradead.org;
	Mon, 12 Jun 2023 08:57:15 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5185f8e1067so45651a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jun 2023 01:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686560232; x=1689152232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vq/s2M0H1YpBEWwWc84/BK1dGfh4JEMbe1jCjTxpQG8=;
        b=Zvx3pTxmhOCcdamy0jWfgspLI2c3P25QDH2fEU6KcaeNBB6wCOvuCsH1DfCXlY2rix
         GrwNavx2wp06jiwkRSKkY0N5B2CJfz55RsHEgCIsDB3+MxNeZjdXEhFet1Xw+Y67EmwQ
         K3Zab7ithsSmsFQ+z/qGmc+xLIZJmCPFrejmURK9QPWLkpm2U8CoXlxYW7BO4TnXyqEr
         XoE1E14eGPqZvGCegno53VJkXOqjTQwLAyadxhZGk1AWPRKR0WnMFXAa7tXgdbgq2A5W
         Aqanwi7bsKdI/iUh2wwfo7IuP5Dq+f8i+kydMxd2M2oShZ+176nddxHBzoxVQGr2esz6
         VdvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686560232; x=1689152232;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq/s2M0H1YpBEWwWc84/BK1dGfh4JEMbe1jCjTxpQG8=;
        b=fMOSH5S+eVzot4nzXYkHT1Mt8VrCPUXUngEOBck3dXSlEb/BBX0A/Ul2sLwQ+pUVqt
         bBPGYYUimDIA3yTSjk+N1CWbYU/CUyiksksc+W5bTNQTrbUavyKI1ZVAkhUmceNgwOBR
         E1KIuSo0w3ZeGMuliwZtDp223nV0DYoe5UUOGUN/K3z4cyf/aoODJ+uJyEuGJUCMf9+R
         edWOSC3HDIs3dtplldOSpmkwX07gC/FWyQl9Z1zEFdXKzNHXGWOEkdv5DyE0n4s38RuR
         tFtOe8vLHMVVTXJOFHFI7WPtMs8h3l96w0V07g//zBBNU2qgQlxeWMVNwVwDa3fcS7UT
         xHWw==
X-Gm-Message-State: AC+VfDyp1/09pDValDA3jao2An9y0/WlIp82ED4tU7TqoJuVt35JXRr8
	MS0SIP2ni4gL8rTXgSYqK8g4FA==
X-Google-Smtp-Source: ACHHUZ4FOO/LVl8AgQkKecgccHHS4sYRKVgWaVzPYmir3ayy2BYmRbvmSwzE3ppomAG9QgpBstEahg==
X-Received: by 2002:a17:906:7945:b0:978:8e58:e1b9 with SMTP id l5-20020a170906794500b009788e58e1b9mr9960520ejo.74.1686560231841;
        Mon, 12 Jun 2023 01:57:11 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e25-20020a170906081900b0094ee3e4c934sm4849967ejd.221.2023.06.12.01.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:57:11 -0700 (PDT)
Date: Mon, 12 Jun 2023 10:57:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Haibo Xu <xiaobo55x@gmail.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, maz@kernel.org, oliver.upton@linux.dev, 
	seanjc@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Shuah Khan <shuah@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, David Matlack <dmatlack@google.com>, 
	Ben Gardon <bgardon@google.com>, Vipin Sharma <vipinsh@google.com>, 
	Colton Lewis <coltonlewis@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 09/10] KVM: riscv: selftests: Skip some registers set
 operation
Message-ID: <20230612-05314de3b73277af1ee729b0@orel>
References: <cover.1686275310.git.haibo1.xu@intel.com>
 <73045958d9ab71d5266d012f1e13061afa8c5331.1686275310.git.haibo1.xu@intel.com>
 <20230609-05521f954b0485c69612f00b@orel>
 <CAJve8omPV_XgCSvw8POZwisb6uTOFMJU4FyAKArryui2SAsqtw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJve8omPV_XgCSvw8POZwisb6uTOFMJU4FyAKArryui2SAsqtw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_015713_999544_0C59987D 
X-CRM114-Status: GOOD (  34.71  )
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

T24gU2F0LCBKdW4gMTAsIDIwMjMgYXQgMTA6MzU6MjRBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6
Cj4gT24gRnJpLCBKdW4gOSwgMjAyMyBhdCA1OjI04oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNA
dmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gRnJpLCBKdW4gMDksIDIwMjMgYXQg
MTA6MTI6MTdBTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiA+IFNldCBvcGVyYXRpb24gb24g
c29tZSByaXNjdiByZWdpc3RlcnMobW9zdGx5IHBlc3VkbyBvbmVzKSB3YXMgbm90Cj4gPiA+IHN1
cHBvcnRlZCBhbmQgc2hvdWxkIGJlIHNraXBwZWQgaW4gdGhlIGdldC1yZWctbGlzdCB0ZXN0LiBK
dXN0Cj4gPiA+IHJldXNlIHRoZSByZWplY3RzX3NldCB1dGlsaXRpZXMgdG8gaGFuZGxlIGl0IGlu
IHJpc2N2Lgo+ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBIYWlibyBYdSA8aGFpYm8xLnh1QGlu
dGVsLmNvbT4KPiA+ID4gUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFt
aWNyby5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dl
dC1yZWctbGlzdC5jIHwgMjAgKysrKysrKysrKysrKy0tLS0tLS0KPiA+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiA+IGluZGV4IGM0YmQ1YTUy
NTlkYS4uYWJhY2I5NWMyMWM2IDEwMDY0NAo+ID4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9rdm0vZ2V0LXJlZy1saXN0LmMKPiA+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2dldC1yZWctbGlzdC5jCj4gPiA+IEBAIC0yMTEsMTYgKzIxMSwyMiBAQCBzdGF0aWMg
dm9pZCBydW5fdGVzdChzdHJ1Y3QgdmNwdV9yZWdfbGlzdCAqYykKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICsrZmFpbGVkX2dldDsKPiA+ID4gICAgICAgICAgICAgICB9Cj4gPiA+Cj4gPiA+
IC0gICAgICAgICAgICAgLyogcmVqZWN0c19zZXQgcmVnaXN0ZXJzIGFyZSByZWplY3RlZCBhZnRl
ciBLVk1fQVJNX1ZDUFVfRklOQUxJWkUgKi8KPiA+ID4gKyAgICAgICAgICAgICAvKgo+ID4gPiAr
ICAgICAgICAgICAgICAqIHJlamVjdHNfc2V0IHJlZ2lzdGVycyBhcmUgcmVqZWN0ZWQgYWZ0ZXIg
S1ZNX0FSTV9WQ1BVX0ZJTkFMSVpFIG9uIGFhcmNoNjQsCj4gPiA+ICsgICAgICAgICAgICAgICog
b3IgcmVnaXN0ZXJzIHRoYXQgc2hvdWxkIHNraXAgc2V0IG9wZXJhdGlvbiBvbiByaXNjdi4KPiA+
ID4gKyAgICAgICAgICAgICAgKi8KPiA+ID4gICAgICAgICAgICAgICBmb3JfZWFjaF9zdWJsaXN0
KGMsIHMpIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIGlmIChzLT5yZWplY3RzX3NldCAm
JiBmaW5kX3JlZyhzLT5yZWplY3RzX3NldCwgcy0+cmVqZWN0c19zZXRfbiwgcmVnLmlkKSkgewo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWplY3RfcmVnID0gdHJ1ZTsKPiA+
ID4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gX192Y3B1X2lvY3RsKHZjcHUs
IEtWTV9TRVRfT05FX1JFRywgJnJlZyk7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChyZXQgIT0gLTEgfHwgZXJybm8gIT0gRVBFUk0pIHsKPiA+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwcmludGYoIiVzOiBGYWlsZWQgdG8gcmVqZWN0IChy
ZXQ9JWQsIGVycm5vPSVkKSAiLCBjb25maWdfbmFtZShjKSwgcmV0LCBlcnJubyk7Cj4gPiA+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRfcmVnKGNvbmZpZ19uYW1l
KGMpLCByZWcuaWQpOwo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHB1dGNoYXIoJ1xuJyk7Cj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKytmYWlsZWRfcmVqZWN0Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoKHJlZy5pZCAmIEtWTV9SRUdfQVJDSF9NQVNLKSA9PSBLVk1fUkVHX0FSTTY0KSB7Cj4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gX192Y3B1X2lvY3Rs
KHZjcHUsIEtWTV9TRVRfT05FX1JFRywgJnJlZyk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaWYgKHJldCAhPSAtMSB8fCBlcnJubyAhPSBFUEVSTSkgewo+ID4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCIl
czogRmFpbGVkIHRvIHJlamVjdCAocmV0PSVkLCBlcnJubz0lZCkgIiwKPiA+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25m
aWdfbmFtZShjKSwgcmV0LCBlcnJubyk7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwcmludF9yZWcoY29uZmlnX25hbWUoYyksIHJlZy5pZCk7Cj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdXRjaGFy
KCdcbicpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKytmYWlsZWRfcmVqZWN0Owo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH0KPiA+Cj4gPiBUaGlua2luZyBhYm91dCB0aGlzIHNvbWUgbW9yZSwgc2hvdWxkbid0
IHdlIGF0dGVtcHQgdGhlIHNldCBpb2N0bCBmb3IKPiA+IHJpc2N2IHJlamVjdCByZWdpc3RlcnMg
YXMgd2VsbCwgYnV0IGxvb2sgZm9yIGRpZmZlcmVudCBlcnJvciBudW1iZXJzPwo+ID4KPiAKPiBZ
ZXMsIHdlIGNhbi4gQ3VycmVudGx5LCAyIGRpZmZlcmVudCBlcnJubyhFT1BOT1RTVVBQL0VJTlZB
TCkgd291bGQgYmUKPiByZXBvcnRlZCBmb3IgdGhlIHJlamVjdGVkIHJlZ2lzdGVycyBpbiByaXNj
LXYuCj4gVGhlc2UgMiBlcnJub3MgY2FuIGJlIGhhbmRsZWQgc3BlY2lhbGx5IGxpa2UgYmVsb3c6
Cj4gCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9nZXQtcmVnLWxp
c3QuYwo+IGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gaW5k
ZXggNzNmNDBlMDg0MmI4Li5mM2YyYzQ1MTkzMTggMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMva3ZtL2dldC1yZWctbGlzdC5jCj4gQEAgLTI1NSw2ICsyNTUsMTUgQEAgc3RhdGljIHZv
aWQgcnVuX3Rlc3Qoc3RydWN0IHZjcHVfcmVnX2xpc3QgKmMpCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHV0Y2hhcignXG4nKTsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArK2ZhaWxlZF9yZWplY3Q7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiArICAgICAgICAgICAg
ICAgIH0gZWxzZSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
dCA9IF9fdmNwdV9pb2N0bCh2Y3B1LAo+IEtWTV9TRVRfT05FX1JFRywgJnJlZyk7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQgIT0gLTEgfHwgKGVycm5v
ICE9Cj4gRUlOVkFMICYmIGVycm5vICE9IEVPUE5PVFNVUFApKSB7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCIlczogRmFpbGVkIHRvCj4g
cmVqZWN0IChyZXQ9JWQsIGVycm5vPSVkKSAiLAo+ICsKPiBjb25maWdfbmFtZShjKSwgcmV0LCBl
cnJubyk7Cj4gKwo+IHByaW50X3JlZyhjb25maWdfbmFtZShjKSwgcmVnLmlkKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwdXRjaGFyKCdcbicpOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICsrZmFpbGVk
X3JlamVjdDsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQoKSW5z
dGVhZCBvZiBkdXBsaWNhdGluZyB0aGUgY29kZSBBcm0gdXNlcywgd2UganVzdCBuZWVkIGFuIGVy
cm5vIGNoZWNrCmZ1bmN0aW9uLCBwcmVmZXJhYmx5IG9uZSB0aGF0IHRha2VzIHRoZSByZWdpc3Rl
ciBhcyBhbiBpbnB1dCwgc28gd2UKY2FuIGNoZWNrIGZvciBzcGVjaWZpYyBlcnJub3MgZm9yIHNw
ZWNpZmljIHJlZ2lzdGVycy4KCj4gCj4gT25lIHBvc3NpYmxlIGlzc3VlIGZvciB0aGUgYWJvdmUg
Y2hhbmdlIGlzIHRoYXQgd2hlbiBuZXcgcmVnaXN0ZXJzCj4gdGhhdCBkb24ndCBzdXBwb3J0IHNl
dHMgd2VyZSBhZGRlZCwgd2UgbmVlZAo+IHRvIGFkZCB0aGVtIHRvIHRoZSByZWplY3QgcmVnaXN0
ZXJzIGxpc3QsIG9yIHRoZSB0ZXN0IHdvdWxkIGZhaWwuCj4gCj4gSW5pdGlhbGx5LCBpbiB0aGUg
djEgcGF0Y2gsIHRoZSBkZXNpZ24gd2FzIHRvIGp1c3Qgc2tpcCB0aGUgRU9QTk9UU1VQUAo+IGVy
cm5vIGluIHNldCBvcGVyYXRpb25zIGZvciBhbGwgcmVnaXN0ZXJzCj4gc2luY2UgaXQncyBhIGtu
b3duIGVycm5vIGZvciByZWdpc3RlcnMgdGhhdCBkb24ndCBzdXBwb3J0IHNldHMuIFRoaXMKPiBj
aGFuZ2UgY292ZXIgYWxsIHRoZSByZWdpc3RlcnMgZXZlbiBmb3IgZnV0dXJlCj4gbmV3IG9uZXMu
Cj4gCj4gV2hhdCdzIHlvdXIgb3Bpbmlvbj8KCkkgdGhpbmsgd2Ugc2hvdWxkIG9ubHkgZG8gdGhl
IGdldC9zZXQgdGVzdHMgb24gcHJlc2VudCwgYmxlc3NlZCBsaXN0CnJlZ2lzdGVycywgc2luY2Ug
aWYgaXQncyBhIG5ldyByZWdpc3RlciB3ZSBkb24ndCBrbm93IGl0cyBjYXBhYmlsaXRpZXMuCgpT
bywgaW5zdGVhZCBvZgoKICBmb3JfZWFjaF9yZWcoaSkgewogICAgIC8qIGdldC9zZXQgdGVzdHMg
Ki8KICB9Cgp3ZSBkbwogIAogIGZvcl9lYWNoX3ByZXNlbnRfYmxlc3NlZF9yZWcoaSkgewogICAg
IC8qIGdldC9zZXQgdGVzdHMgKi8KICB9Cgp3aGVyZSB3ZSBoYXZlCgogI2RlZmluZSBmb3JfZWFj
aF9wcmVzZW50X2JsZXNzZWRfcmVnKGkpIFwKICAgICBmb3IgKChpKSA9IDA7IChpKSA8IGJsZXNz
ZWRfbjsgKysoaSkpIFwKICAgICAgICAgaWYgKGZpbmRfcmVnKHJlZ19saXN0LT5yZWcsIHJlZ19s
aXN0LT5uLCBibGVzc2VkX3JlZ1tpXSkpCgoKQ2hhbmdpbmcgcnVuX3Rlc3QoKSB0byB3b3JrIHRo
aXMgd2F5IHNob3VsZCBiZSBhIHNlcGFyYXRlIHBhdGNoLgoKVGhhbmtzLApkcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
