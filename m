Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AE2C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 06:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1iuSDXPsAxeYKLQF18wQ0tdh9+8FdgT4ZEOiql+YBIc=; b=wgNzAQ/h60FATQ
	nV1dZpi6iVHIYSlsFSdNRSkibfqYTky1KBQIgcs+tUS87JWwi1LVtgvo3z8L2bjgM2poG5U96KKOU
	YE1heRvsudjunlNAFHZ/W9CHIhcCSgp1lyJB5dIREeuG9wf3Cta2uvUCsY41p7Ux14ff6/Nw4sETo
	gRJ6AYogKRa/29obc/yRVO4cONlAme7xolZsbKIRIE47y/FOAYQLSgps77hogq2i6MRqmwPyfpFJm
	fBBzO451m1dEEGzDvXT2sFqZjPrUhvcCwLkq1T1dd4sSFK4VzYPLVvmvQq7pMX3fzGWQk7GrX6CCv
	hz8e1uSTWenVdAc6DNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqHI-00GK60-0y;
	Wed, 20 Dec 2023 06:42:00 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFqHE-00GK51-1g
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 06:41:58 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-591dfa6cb73so2170968eaf.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 22:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1703054513; x=1703659313; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN8ws6aob+i7GzJge6YLErack05h3kL4ycYwmV8Hv9E=;
        b=q3WW1aGZqXdc08LYDh94eEbuscqcBT1F4vteD88eUfScE3zM9IdvUNAZLfASaQcbTJ
         de79biAD4ENx2LzfbF6LBXcsLYwy5qWjGkh0gswiQB+T+ZoO8uNR6+RHORAVYhc964Nt
         XUWAoMiF9/e+5v1jxpRV1e69htl0bjLx14DGafU6lz440M/GErK1RaSNfNh49RMJg7Ry
         jvC2JeQZc8no4qi2xsGNMXD6lEMgII0iDH2hr2HfJCtEB8F/hIxx8h1sx6NJXQwA6auk
         FuqzALsOad+ugkMXPz5XuRTOKrM7Vm6fp1l7Uu2ko3mTms1S+NAUo2nLVZBwJ/k2jP5h
         biGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703054513; x=1703659313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BN8ws6aob+i7GzJge6YLErack05h3kL4ycYwmV8Hv9E=;
        b=bFYlElmONqrPD47y+gEcX00EX/F0jQ2w6Mx0TC4z9aTwFD3oNOgPVzF1rC+mh6LEOF
         OQ+6SR0upBoUKhq/MVdIthH9usk2Fte9gCe5ISsL/2siGUpTSGAT9gMsN+0M2odsIMMe
         xC4YiiY+yF9jnADfc9b4fb3KMPYPSpn6mQ38Zn/qovUwejBFz3ByszX2y//ZA4ptLx1W
         QE5Of25v0VEzBYiJnOIVh2Z2adx+oUGNB04XEm6UngJCHWKBKhJf11Xbie79d+W4G0Bd
         nqUyhmQw0DuGSRDsovyA/zdfQsTH6LILkP2kIpbQ33y2lWy8bLMqPa8dmu0CZ3L7srK/
         wtbA==
X-Gm-Message-State: AOJu0YzY7tBM32LPSzUYJmpllCpy3t92Q8RlD0osCuYuWlPxmmIkemkO
	R6DET9favCXZMHaWQsju6Gfqx/hsy61mLslZLVzF2Q==
X-Google-Smtp-Source: AGHT+IE4lLzB3fcAVMK0KRAhjf1irt6O7ewgUPrYZ00fT9i/H81XeJGqessePq38WFZQ+QslVvsXvtIcssmbbvmqkrI=
X-Received: by 2002:a05:6358:6503:b0:173:b44:1889 with SMTP id
 v3-20020a056358650300b001730b441889mr199232rwg.16.1703054513140; Tue, 19 Dec
 2023 22:41:53 -0800 (PST)
MIME-Version: 1.0
References: <20231217204019.36492-15-ajones@ventanamicro.com> <20231217204019.36492-18-ajones@ventanamicro.com>
In-Reply-To: <20231217204019.36492-18-ajones@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 20 Dec 2023 12:11:40 +0530
Message-ID: <CAAhSdy2y_scAkgEnW2VMq-VD8-pUUEfT3eFnozZBRbJ_uGgeYg@mail.gmail.com>
Subject: Re: [PATCH v3 03/13] RISC-V: paravirt: Implement steal-time support
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, 
	pbonzini@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, jgross@suse.com, srivatsa@csail.mit.edu, 
	guoren@kernel.org, conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_224156_558971_9B761562 
X-CRM114-Status: GOOD (  28.78  )
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

T24gTW9uLCBEZWMgMTgsIDIwMjMgYXQgMjoxMOKAr0FNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gV2hlbiB0aGUgU0JJIFNUQSBleHRlbnNpb24gZXhp
c3RzIHdlIGNhbiB1c2UgaXQgdG8gaW1wbGVtZW50Cj4gcGFyYXZpcnQgc3RlYWwtdGltZSBzdXBw
b3J0LiBGaWxsIGluIHRoZSBlbXB0eSBwdi10aW1lIGZ1bmN0aW9ucwo+IHdpdGggYW4gU0JJIFNU
QSBpbXBsZW1lbnRhdGlvbiBhbmQgYWRkIHRoZSBLY29uZmlnIGtub2JzIGFsbG93aW5nCj4gaXQg
dG8gYmUgZW5hYmxlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L0tjb25maWcg
ICAgICAgICAgIHwgMTkgKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQu
YyB8IDYzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gaW5kZXggOTVhMmEwNmFj
YzZhLi5iOTlmZDgxMjllZGYgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4gKysr
IGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gQEAgLTcyNCw2ICs3MjQsMjUgQEAgY29uZmlnIENPTVBB
VAo+Cj4gICAgICAgICAgIElmIHlvdSB3YW50IHRvIGV4ZWN1dGUgMzItYml0IHVzZXJzcGFjZSBh
cHBsaWNhdGlvbnMsIHNheSBZLgo+Cj4gK2NvbmZpZyBQQVJBVklSVAo+ICsgICAgICAgYm9vbCAi
RW5hYmxlIHBhcmF2aXJ0dWFsaXphdGlvbiBjb2RlIgo+ICsgICAgICAgZGVwZW5kcyBvbiBSSVND
Vl9TQkkKPiArICAgICAgIGhlbHAKPiArICAgICAgICAgVGhpcyBjaGFuZ2VzIHRoZSBrZXJuZWwg
c28gaXQgY2FuIG1vZGlmeSBpdHNlbGYgd2hlbiBpdCBpcyBydW4KPiArICAgICAgICAgdW5kZXIg
YSBoeXBlcnZpc29yLCBwb3RlbnRpYWxseSBpbXByb3ZpbmcgcGVyZm9ybWFuY2Ugc2lnbmlmaWNh
bnRseQo+ICsgICAgICAgICBvdmVyIGZ1bGwgdmlydHVhbGl6YXRpb24uCj4gKwo+ICtjb25maWcg
UEFSQVZJUlRfVElNRV9BQ0NPVU5USU5HCj4gKyAgICAgICBib29sICJQYXJhdmlydHVhbCBzdGVh
bCB0aW1lIGFjY291bnRpbmciCj4gKyAgICAgICBkZXBlbmRzIG9uIFBBUkFWSVJUCj4gKyAgICAg
ICBoZWxwCj4gKyAgICAgICAgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFibGUgZmluZSBncmFu
dWxhcml0eSB0YXNrIHN0ZWFsIHRpbWUKPiArICAgICAgICAgYWNjb3VudGluZy4gVGltZSBzcGVu
dCBleGVjdXRpbmcgb3RoZXIgdGFza3MgaW4gcGFyYWxsZWwgd2l0aAo+ICsgICAgICAgICB0aGUg
Y3VycmVudCB2Q1BVIGlzIGRpc2NvdW50ZWQgZnJvbSB0aGUgdkNQVSBwb3dlci4gVG8gYWNjb3Vu
dCBmb3IKPiArICAgICAgICAgdGhhdCwgdGhlcmUgY2FuIGJlIGEgc21hbGwgcGVyZm9ybWFuY2Ug
aW1wYWN0Lgo+ICsKPiArICAgICAgICAgSWYgaW4gZG91YnQsIHNheSBOIGhlcmUuCj4gKwo+ICBj
b25maWcgUkVMT0NBVEFCTEUKPiAgICAgICAgIGJvb2wgIkJ1aWxkIGEgcmVsb2NhdGFibGUga2Vy
bmVsIgo+ICAgICAgICAgZGVwZW5kcyBvbiBNTVUgJiYgNjRCSVQgJiYgIVhJUF9LRVJORUwKPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYyBiL2FyY2gvcmlzY3Yva2Vy
bmVsL3BhcmF2aXJ0LmMKPiBpbmRleCAxNDFkYmNjMzZmYTIuLmNjNmE4NTQzMjY3OCAxMDA2NDQK
PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXJhdmlydC5jCj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvcGFyYXZpcnQuYwo+IEBAIC02LDEyICs2LDIxIEBACj4gICNkZWZpbmUgcHJfZm10KGZt
dCkgInJpc2N2LXB2OiAiIGZtdAo+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHVob3RwbHVnLmg+Cj4g
KyNpbmNsdWRlIDxsaW51eC9jb21waWxlci5oPgo+ICsjaW5jbHVkZSA8bGludXgvZXJybm8uaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwu
aD4KPiArI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2tlcm5l
bC5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGVyY3B1LWRlZnMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4
L3ByaW50ay5oPgo+ICAjaW5jbHVkZSA8bGludXgvc3RhdGljX2NhbGwuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L3R5cGVzLmg+Cj4KPiArI2luY2x1ZGUgPGFzbS9iYXJyaWVyLmg+Cj4gKyNpbmNsdWRl
IDxhc20vcGFnZS5oPgo+ICsjaW5jbHVkZSA8YXNtL3NiaS5oPgo+ICsKPiAgc3RydWN0IHN0YXRp
Y19rZXkgcGFyYXZpcnRfc3RlYWxfZW5hYmxlZDsKPiAgc3RydWN0IHN0YXRpY19rZXkgcGFyYXZp
cnRfc3RlYWxfcnFfZW5hYmxlZDsKPgo+IEBAIC0zMSwyNCArNDAsNzIgQEAgc3RhdGljIGludCBf
X2luaXQgcGFyc2Vfbm9fc3RlYWxhY2MoY2hhciAqYXJnKQo+Cj4gIGVhcmx5X3BhcmFtKCJuby1z
dGVhbC1hY2MiLCBwYXJzZV9ub19zdGVhbGFjYyk7Cj4KPiArREVGSU5FX1BFUl9DUFUoc3RydWN0
IHNiaV9zdGFfc3RydWN0LCBzdGVhbF90aW1lKSBfX2FsaWduZWQoNjQpOwo+ICsKPiAgc3RhdGlj
IGJvb2wgX19pbml0IGhhc19wdl9zdGVhbF9jbG9jayh2b2lkKQo+ICB7Cj4gKyAgICAgICBpZiAo
c2JpX3NwZWNfdmVyc2lvbiA+PSBzYmlfbWtfdmVyc2lvbigyLCAwKSAmJgo+ICsgICAgICAgICAg
IHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9TVEEpID4gMCkgewo+ICsgICAgICAgICAgICAg
ICBwcl9pbmZvKCJTQkkgU1RBIGV4dGVuc2lvbiBkZXRlY3RlZFxuIik7Cj4gKyAgICAgICAgICAg
ICAgIHJldHVybiB0cnVlOwo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHJldHVybiBmYWxzZTsK
PiAgfQo+Cj4gLXN0YXRpYyBpbnQgcHZfdGltZV9jcHVfb25saW5lKHVuc2lnbmVkIGludCBjcHUp
Cj4gK3N0YXRpYyBpbnQgc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1lbSh1bnNpZ25lZCBsb25n
IGxvLCB1bnNpZ25lZCBsb25nIGhpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzKQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpcmV0
IHJldDsKPiArCj4gKyAgICAgICByZXQgPSBzYmlfZWNhbGwoU0JJX0VYVF9TVEEsIFNCSV9FWFRf
U1RBX1NURUFMX1RJTUVfU0VUX1NITUVNLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGxvLCBo
aSwgZmxhZ3MsIDAsIDAsIDApOwo+ICsgICAgICAgaWYgKHJldC5lcnJvcikgewo+ICsgICAgICAg
ICAgICAgICBpZiAobG8gPT0gU0JJX1NUQV9TSE1FTV9ESVNBQkxFICYmIGhpID09IFNCSV9TVEFf
U0hNRU1fRElTQUJMRSkKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJGYWlsZWQg
dG8gZGlzYWJsZSBzdGVhbC10aW1lIHNobWVtIik7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiAr
ICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJGYWlsZWQgdG8gc2V0IHN0ZWFsLXRpbWUg
c2htZW0iKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5v
KHJldC5lcnJvcik7Cj4gKyAgICAgICB9Cj4gKwo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+
ICtzdGF0aWMgaW50IHB2X3RpbWVfY3B1X29ubGluZSh1bnNpZ25lZCBpbnQgY3B1KQo+ICt7Cj4g
KyAgICAgICBzdHJ1Y3Qgc2JpX3N0YV9zdHJ1Y3QgKnN0ID0gdGhpc19jcHVfcHRyKCZzdGVhbF90
aW1lKTsKPiArICAgICAgIHBoeXNfYWRkcl90IHBhID0gX19wYShzdCk7Cj4gKyAgICAgICB1bnNp
Z25lZCBsb25nIGxvID0gKHVuc2lnbmVkIGxvbmcpcGE7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IGhpID0gSVNfRU5BQkxFRChDT05GSUdfMzJCSVQpID8gdXBwZXJfMzJfYml0cygodTY0KXBhKSA6
IDA7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHNiaV9zdGFfc3RlYWxfdGltZV9zZXRfc2htZW0obG8s
IGhpLCAwKTsKPiArfQo+ICsKPiAgc3RhdGljIGludCBwdl90aW1lX2NwdV9kb3duX3ByZXBhcmUo
dW5zaWduZWQgaW50IGNwdSkKPiAgewo+IC0gICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICByZXR1
cm4gc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1lbShTQklfU1RBX1NITUVNX0RJU0FCTEUsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfU1RBX1NITUVN
X0RJU0FCTEUsIDApOwo+ICB9Cj4KPiAgc3RhdGljIHU2NCBwdl90aW1lX3N0ZWFsX2Nsb2NrKGlu
dCBjcHUpCj4gIHsKPiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgc3RydWN0IHNiaV9zdGFf
c3RydWN0ICpzdCA9IHBlcl9jcHVfcHRyKCZzdGVhbF90aW1lLCBjcHUpOwo+ICsgICAgICAgdTMy
IHNlcXVlbmNlOwo+ICsgICAgICAgdTY0IHN0ZWFsOwo+ICsKPiArICAgICAgIC8qCj4gKyAgICAg
ICAgKiBDaGVjayB0aGUgc2VxdWVuY2UgZmllbGQgYmVmb3JlIGFuZCBhZnRlciByZWFkaW5nIHRo
ZSBzdGVhbAo+ICsgICAgICAgICogZmllbGQuIFJlcGVhdCB0aGUgcmVhZCBpZiBpdCBpcyBkaWZm
ZXJlbnQgb3Igb2RkLgo+ICsgICAgICAgICovCj4gKyAgICAgICBkbyB7Cj4gKyAgICAgICAgICAg
ICAgIHNlcXVlbmNlID0gUkVBRF9PTkNFKHN0LT5zZXF1ZW5jZSk7Cj4gKyAgICAgICAgICAgICAg
IHZpcnRfcm1iKCk7Cj4gKyAgICAgICAgICAgICAgIHN0ZWFsID0gUkVBRF9PTkNFKHN0LT5zdGVh
bCk7Cj4gKyAgICAgICAgICAgICAgIHZpcnRfcm1iKCk7Cj4gKyAgICAgICB9IHdoaWxlICgobGUz
Ml90b19jcHUoc2VxdWVuY2UpICYgMSkgfHwKPiArICAgICAgICAgICAgICAgIHNlcXVlbmNlICE9
IFJFQURfT05DRShzdC0+c2VxdWVuY2UpKTsKPiArCj4gKyAgICAgICByZXR1cm4gbGU2NF90b19j
cHUoc3RlYWwpOwo+ICB9Cj4KPiAgaW50IF9faW5pdCBwdl90aW1lX2luaXQodm9pZCkKPiAtLQo+
IDIuNDMuMAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
