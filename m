Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16202C35274
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Dec 2023 01:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VF5FQZoeZWBVaJWald7/oTVcM1xAFh0c35RQUrfkEpA=; b=C78przPtYu4slR
	4PVub0JJ4WYoeXpJsvP0Zrvj8mFJD/i22HDu9FUKBiedGZ8IRTMoRmhMCftsCqspMAKsX2O1eHS0m
	izU+llj6iRqoLYZzWIZuorMFS5lmBsA5+N4wOHOzc0v3f+szSUq6cA+5QVsf6qGg8oYcyZlUc0ov0
	nONkehGqOfMtbcup9ZGdCEMyvHXY+7hdyrdZ5OLWnufiuG62ft9h/gEPrQdqljv1BS8Pxbdpo2gkE
	Y/SskK785wvSdKU7ramP0GvFUwAwMpJLms9lAYHqbnmuRNbqwEOjslDYLTfioR3jrKLbcXJtlkT4F
	ismyqjemtAFVkOF2+zeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFP6x-00CVjg-1V;
	Tue, 19 Dec 2023 01:41:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFP6u-00CVj6-0h
	for linux-riscv@lists.infradead.org;
	Tue, 19 Dec 2023 01:41:29 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50e3cde8ab8so1552555e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Dec 2023 17:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1702950086; x=1703554886; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3GQ8Cq3fEaLyXdJSkPx9cu4LnZ4Irsf5B+p1ptTVYg=;
        b=GGI6Hz7I3Q5YW2UdJ1N7VmXQnOfc1E0n1nNpSRfdW5Bj8mvewkVCHUVSA5saRkRlid
         oZ6gg21zvf4TBf+Acwfbm78FM/OUK4TR0ZznIbKU+ZyZqcbFuNz2FJppselqHZFhcxth
         TkRxA12xNH7pLxz3qk7vq6JpiqPK2oOF7lY+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702950086; x=1703554886;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3GQ8Cq3fEaLyXdJSkPx9cu4LnZ4Irsf5B+p1ptTVYg=;
        b=Cfm1buvD7JaWKNCpmUIG64lSoel3Xn0kL8JTQbqgz6WmtdFtc/dSYPQN4Ajg8vzIAx
         scWwGDfBEEgeWbooZLJEt3dY7MZs8Wwi7KAJTJeDJVF2Y9JEGEZINdvPgFjwn83gChMS
         cuKyznQDegPxX77VPpcGmwTzZX5MHtmCILMGcDl5JArkikleBfZUR+RKxLqGDeQL1kmI
         p/ID3HC9VcVW3Hb8mCm8/QXwFenD0IByZsYUkkFOSf7D4q+SdBxGrBf0xESFuMx4O2lF
         vkfoOOi/W33TogZ7YYlTuKf7ClJpZoNSXK5Qdo2UB5B/NobbDgMR8d8Mb6spcgnNeARk
         1oIA==
X-Gm-Message-State: AOJu0YxCA8E23LRX/Sid002/R/Gn1zQ9YOGvUiOf8SG8oJlLAswbMqTU
	gMP9vBVTpy6SNuzvXt/EPj4iWEA8kT+DtXCAZpt5
X-Google-Smtp-Source: AGHT+IEefQ2JnjyFtLTwkydICnlsVATVYwHTYFdOjgKYjKt/9xal7sqttNovsA4VHYaDleVY0jkTlDg2m5TphPJhyFw=
X-Received: by 2002:a05:6512:242:b0:50e:3771:fa01 with SMTP id
 b2-20020a056512024200b0050e3771fa01mr142659lfo.4.1702950086006; Mon, 18 Dec
 2023 17:41:26 -0800 (PST)
MIME-Version: 1.0
References: <20231217204019.36492-15-ajones@ventanamicro.com> <20231217204019.36492-18-ajones@ventanamicro.com>
In-Reply-To: <20231217204019.36492-18-ajones@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 18 Dec 2023 17:41:14 -0800
Message-ID: <CAOnJCU+ospMOmJ7PnF8ynD90cN3A3YP8gx8VHgmVzLjAQsr7eQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] RISC-V: paravirt: Implement steal-time support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, anup@brainfault.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_174128_276379_7F32D026 
X-CRM114-Status: GOOD (  28.48  )
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

T24gU3VuLCBEZWMgMTcsIDIwMjMgYXQgMTI6NDDigK9QTSBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdoZW4gdGhlIFNCSSBTVEEgZXh0ZW5zaW9uIGV4
aXN0cyB3ZSBjYW4gdXNlIGl0IHRvIGltcGxlbWVudAo+IHBhcmF2aXJ0IHN0ZWFsLXRpbWUgc3Vw
cG9ydC4gRmlsbCBpbiB0aGUgZW1wdHkgcHYtdGltZSBmdW5jdGlvbnMKPiB3aXRoIGFuIFNCSSBT
VEEgaW1wbGVtZW50YXRpb24gYW5kIGFkZCB0aGUgS2NvbmZpZyBrbm9icyBhbGxvd2luZwo+IGl0
IHRvIGJlIGVuYWJsZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFqb25lc0B2
ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcgICAgICAgICAgIHwg
MTkgKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYyB8IDYzICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDc5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9L
Y29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggOTVhMmEwNmFjYzZhLi5iOTlmZDgx
MjllZGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysrIGIvYXJjaC9yaXNj
di9LY29uZmlnCj4gQEAgLTcyNCw2ICs3MjQsMjUgQEAgY29uZmlnIENPTVBBVAo+Cj4gICAgICAg
ICAgIElmIHlvdSB3YW50IHRvIGV4ZWN1dGUgMzItYml0IHVzZXJzcGFjZSBhcHBsaWNhdGlvbnMs
IHNheSBZLgo+Cj4gK2NvbmZpZyBQQVJBVklSVAo+ICsgICAgICAgYm9vbCAiRW5hYmxlIHBhcmF2
aXJ0dWFsaXphdGlvbiBjb2RlIgo+ICsgICAgICAgZGVwZW5kcyBvbiBSSVNDVl9TQkkKPiArICAg
ICAgIGhlbHAKPiArICAgICAgICAgVGhpcyBjaGFuZ2VzIHRoZSBrZXJuZWwgc28gaXQgY2FuIG1v
ZGlmeSBpdHNlbGYgd2hlbiBpdCBpcyBydW4KPiArICAgICAgICAgdW5kZXIgYSBoeXBlcnZpc29y
LCBwb3RlbnRpYWxseSBpbXByb3ZpbmcgcGVyZm9ybWFuY2Ugc2lnbmlmaWNhbnRseQo+ICsgICAg
ICAgICBvdmVyIGZ1bGwgdmlydHVhbGl6YXRpb24uCj4gKwo+ICtjb25maWcgUEFSQVZJUlRfVElN
RV9BQ0NPVU5USU5HCj4gKyAgICAgICBib29sICJQYXJhdmlydHVhbCBzdGVhbCB0aW1lIGFjY291
bnRpbmciCj4gKyAgICAgICBkZXBlbmRzIG9uIFBBUkFWSVJUCj4gKyAgICAgICBoZWxwCj4gKyAg
ICAgICAgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFibGUgZmluZSBncmFudWxhcml0eSB0YXNr
IHN0ZWFsIHRpbWUKPiArICAgICAgICAgYWNjb3VudGluZy4gVGltZSBzcGVudCBleGVjdXRpbmcg
b3RoZXIgdGFza3MgaW4gcGFyYWxsZWwgd2l0aAo+ICsgICAgICAgICB0aGUgY3VycmVudCB2Q1BV
IGlzIGRpc2NvdW50ZWQgZnJvbSB0aGUgdkNQVSBwb3dlci4gVG8gYWNjb3VudCBmb3IKPiArICAg
ICAgICAgdGhhdCwgdGhlcmUgY2FuIGJlIGEgc21hbGwgcGVyZm9ybWFuY2UgaW1wYWN0Lgo+ICsK
PiArICAgICAgICAgSWYgaW4gZG91YnQsIHNheSBOIGhlcmUuCj4gKwo+ICBjb25maWcgUkVMT0NB
VEFCTEUKPiAgICAgICAgIGJvb2wgIkJ1aWxkIGEgcmVsb2NhdGFibGUga2VybmVsIgo+ICAgICAg
ICAgZGVwZW5kcyBvbiBNTVUgJiYgNjRCSVQgJiYgIVhJUF9LRVJORUwKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3BhcmF2aXJ0
LmMKPiBpbmRleCAxNDFkYmNjMzZmYTIuLmNjNmE4NTQzMjY3OCAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2tlcm5lbC9wYXJhdmlydC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZp
cnQuYwo+IEBAIC02LDEyICs2LDIxIEBACj4gICNkZWZpbmUgcHJfZm10KGZtdCkgInJpc2N2LXB2
OiAiIGZtdAo+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHVob3RwbHVnLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9jb21waWxlci5oPgo+ICsjaW5jbHVkZSA8bGludXgvZXJybm8uaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L2luaXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KPiArI2luY2x1
ZGUgPGxpbnV4L2tjb25maWcuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5oPgo+ICsjaW5j
bHVkZSA8bGludXgvcGVyY3B1LWRlZnMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3ByaW50ay5oPgo+
ICAjaW5jbHVkZSA8bGludXgvc3RhdGljX2NhbGwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3R5cGVz
Lmg+Cj4KPiArI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gKyNpbmNsdWRlIDxhc20vcGFnZS5o
Pgo+ICsjaW5jbHVkZSA8YXNtL3NiaS5oPgo+ICsKPiAgc3RydWN0IHN0YXRpY19rZXkgcGFyYXZp
cnRfc3RlYWxfZW5hYmxlZDsKPiAgc3RydWN0IHN0YXRpY19rZXkgcGFyYXZpcnRfc3RlYWxfcnFf
ZW5hYmxlZDsKPgo+IEBAIC0zMSwyNCArNDAsNzIgQEAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vf
bm9fc3RlYWxhY2MoY2hhciAqYXJnKQo+Cj4gIGVhcmx5X3BhcmFtKCJuby1zdGVhbC1hY2MiLCBw
YXJzZV9ub19zdGVhbGFjYyk7Cj4KPiArREVGSU5FX1BFUl9DUFUoc3RydWN0IHNiaV9zdGFfc3Ry
dWN0LCBzdGVhbF90aW1lKSBfX2FsaWduZWQoNjQpOwo+ICsKPiAgc3RhdGljIGJvb2wgX19pbml0
IGhhc19wdl9zdGVhbF9jbG9jayh2b2lkKQo+ICB7Cj4gKyAgICAgICBpZiAoc2JpX3NwZWNfdmVy
c2lvbiA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSAmJgo+ICsgICAgICAgICAgIHNiaV9wcm9iZV9l
eHRlbnNpb24oU0JJX0VYVF9TVEEpID4gMCkgewo+ICsgICAgICAgICAgICAgICBwcl9pbmZvKCJT
QkkgU1RBIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7Cj4gKyAgICAgICAgICAgICAgIHJldHVybiB0
cnVlOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJldHVybiBmYWxzZTsKPiAgfQo+Cj4gLXN0
YXRpYyBpbnQgcHZfdGltZV9jcHVfb25saW5lKHVuc2lnbmVkIGludCBjcHUpCj4gK3N0YXRpYyBp
bnQgc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1lbSh1bnNpZ25lZCBsb25nIGxvLCB1bnNpZ25l
ZCBsb25nIGhpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIGZsYWdzKQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpcmV0IHJldDsKPiArCj4g
KyAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9TVEEsIFNCSV9FWFRfU1RBX1NURUFMX1RJ
TUVfU0VUX1NITUVNLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxvLCBoaSwgZmxhZ3MsIDAs
IDAsIDApOwo+ICsgICAgICAgaWYgKHJldC5lcnJvcikgewo+ICsgICAgICAgICAgICAgICBpZiAo
bG8gPT0gU0JJX1NUQV9TSE1FTV9ESVNBQkxFICYmIGhpID09IFNCSV9TVEFfU0hNRU1fRElTQUJM
RSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJGYWlsZWQgdG8gZGlzYWJsZSBz
dGVhbC10aW1lIHNobWVtIik7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAg
ICAgICAgICAgICBwcl93YXJuKCJGYWlsZWQgdG8gc2V0IHN0ZWFsLXRpbWUgc2htZW0iKTsKPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcik7
Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICtzdGF0aWMgaW50
IHB2X3RpbWVfY3B1X29ubGluZSh1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4gKyAgICAgICBzdHJ1
Y3Qgc2JpX3N0YV9zdHJ1Y3QgKnN0ID0gdGhpc19jcHVfcHRyKCZzdGVhbF90aW1lKTsKPiArICAg
ICAgIHBoeXNfYWRkcl90IHBhID0gX19wYShzdCk7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGxv
ID0gKHVuc2lnbmVkIGxvbmcpcGE7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGhpID0gSVNfRU5B
QkxFRChDT05GSUdfMzJCSVQpID8gdXBwZXJfMzJfYml0cygodTY0KXBhKSA6IDA7Cj4gKwo+ICsg
ICAgICAgcmV0dXJuIHNiaV9zdGFfc3RlYWxfdGltZV9zZXRfc2htZW0obG8sIGhpLCAwKTsKPiAr
fQo+ICsKPiAgc3RhdGljIGludCBwdl90aW1lX2NwdV9kb3duX3ByZXBhcmUodW5zaWduZWQgaW50
IGNwdSkKPiAgewo+IC0gICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICByZXR1cm4gc2JpX3N0YV9z
dGVhbF90aW1lX3NldF9zaG1lbShTQklfU1RBX1NITUVNX0RJU0FCTEUsCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfU1RBX1NITUVNX0RJU0FCTEUsIDAp
Owo+ICB9Cj4KPiAgc3RhdGljIHU2NCBwdl90aW1lX3N0ZWFsX2Nsb2NrKGludCBjcHUpCj4gIHsK
PiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgc3RydWN0IHNiaV9zdGFfc3RydWN0ICpzdCA9
IHBlcl9jcHVfcHRyKCZzdGVhbF90aW1lLCBjcHUpOwo+ICsgICAgICAgdTMyIHNlcXVlbmNlOwo+
ICsgICAgICAgdTY0IHN0ZWFsOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBDaGVjayB0
aGUgc2VxdWVuY2UgZmllbGQgYmVmb3JlIGFuZCBhZnRlciByZWFkaW5nIHRoZSBzdGVhbAo+ICsg
ICAgICAgICogZmllbGQuIFJlcGVhdCB0aGUgcmVhZCBpZiBpdCBpcyBkaWZmZXJlbnQgb3Igb2Rk
Lgo+ICsgICAgICAgICovCj4gKyAgICAgICBkbyB7Cj4gKyAgICAgICAgICAgICAgIHNlcXVlbmNl
ID0gUkVBRF9PTkNFKHN0LT5zZXF1ZW5jZSk7Cj4gKyAgICAgICAgICAgICAgIHZpcnRfcm1iKCk7
Cj4gKyAgICAgICAgICAgICAgIHN0ZWFsID0gUkVBRF9PTkNFKHN0LT5zdGVhbCk7Cj4gKyAgICAg
ICAgICAgICAgIHZpcnRfcm1iKCk7Cj4gKyAgICAgICB9IHdoaWxlICgobGUzMl90b19jcHUoc2Vx
dWVuY2UpICYgMSkgfHwKPiArICAgICAgICAgICAgICAgIHNlcXVlbmNlICE9IFJFQURfT05DRShz
dC0+c2VxdWVuY2UpKTsKPiArCj4gKyAgICAgICByZXR1cm4gbGU2NF90b19jcHUoc3RlYWwpOwo+
ICB9Cj4KPiAgaW50IF9faW5pdCBwdl90aW1lX2luaXQodm9pZCkKPiAtLQo+IDIuNDMuMAo+CgoK
UmV2aWV3ZWQtYnk6IEF0aXNoIFBhdHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgotLSAKUmVnYXJk
cywKQXRpc2gKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
