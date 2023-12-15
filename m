Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19FE0C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 08:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+o1jwvv7m6kLjYtV9iUq6O2veTTUSNnOHmE1rEVX7G4=; b=ncNJx7S0tKrK7c
	b24OJ3MI2J1x9uk+nSMOxMrBTE+gUQdcqfCPN4Y4CyfCI2gsaYcquaLder3lCOI94JluDS2n1mwnk
	v26X72xmiS7rRQMXMAC9NkLZEs9WYRNNDQklHjHeykP5/fCh1Y935nJ2AwWT8DTSBLGRAVxvy5AxY
	evG/1gtzdFTjvZr6mzgF272qGAIR7GAX1UeDKE3fsHJdxM3/usKufpTzEfkmobhGQ2t7YUdUjek+X
	GU3qIevc/bBUC4jt528m29wHw5JW1qZ/OAHTKETWSD0yylqTV44x7PyMuZNXtnaIBDczi2tkkoXNF
	g2qAQJu5NRUpUs9F7M3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3QP-002ROi-21;
	Fri, 15 Dec 2023 08:20:01 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE3QM-002RNk-1D
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 08:19:59 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40c6736d10fso5084175e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 00:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702628396; x=1703233196; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=woYgeynbPro+dnEqCaDchShODMHQ544hR1/ce1FiDk8=;
        b=SbnUCx3LUs7t2YrhB4ZYBoIhrzhj90jCSFdff0JmX8t8H15cbKsdNq2Ddfd63cuTqQ
         zoZoW5PvBHKsVmCST04eJ4wjHHZFtbqDHJrrH0UOm/GcMuZ+4OLq90mrG7bAcnPcmHfJ
         QoE8seZurbze35z6Fvm0g8y7J+rJVMS/Mr7k94pz3Aneboy+swLfnmxpFSTE+W3g55nt
         EfxzlrOgHiKsnIEgpandKvFxBvAbeQi5KBh4OZlBG+lLS4HIzrRndgpAmDnifCVZ/w2n
         qBVigo7okM4vfeLTHr2x/UAtv7BEswkbvQrfi6IBxaNGqvXGYcFD/okJTkZtWqpPwNDw
         yCbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702628396; x=1703233196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woYgeynbPro+dnEqCaDchShODMHQ544hR1/ce1FiDk8=;
        b=ApVLLTbH0/7twrtkEhJxbSJHS2+jjewYtI+NNVgFRHlVvyEo0ehRAwj+cUfUWJh1LY
         rZoSmXHPHkiLGgnq+SeAtauD414m5h8anUj8fJ54vPPukpe9OhIU8kcx58miJR5nAbIO
         hl56OWh9Z5ZJyNLTguxPcHH0HcsIH7SsNJ9BmluctOMl342mBDG4Fd1C34W6CzaEVz9v
         gGiPtbbieQ+yV6yaoEkemlgMFv4af/YcO+TIUqybKhuj3pMtP6U8ciy7GGsDsviz/4J8
         g39ert1YF9zGmPoTrCmCKXCC8cV11fzXrk6sQGbBsdcoKFDNqftwEAhsJIoOHe8JrIuz
         Mm/w==
X-Gm-Message-State: AOJu0Yxy2RAHY5ZlSDX0lFWebDX85zziUJ0qLCAA6ZSea7+yu9jZDBgD
	+245tQi4XWp5vAGPS/Y3nVGOAosjL1ggpSD18OQ=
X-Google-Smtp-Source: AGHT+IFmXA4U67Evgro3vYjs1InyjgMQwMhLVv7zZQ5Hg3wTPC9uFA8eoU72oEWCIW5lwgoXUGJWLg==
X-Received: by 2002:a05:600c:2047:b0:40c:3dd7:98dc with SMTP id p7-20020a05600c204700b0040c3dd798dcmr5373829wmg.75.1702628396370;
        Fri, 15 Dec 2023 00:19:56 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c35d400b0040b538047b4sm30491981wmq.3.2023.12.15.00.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 00:19:55 -0800 (PST)
Date: Fri, 15 Dec 2023 09:19:54 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <anup@brainfault.org>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	virtualization@lists.linux-foundation.org, atishp@atishpatra.org, pbonzini@redhat.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, jgross@suse.com, 
	srivatsa@csail.mit.edu, guoren@kernel.org, conor.dooley@microchip.com
Subject: Re: [PATCH v2 03/13] RISC-V: paravirt: Implement steal-time support
Message-ID: <20231215-f77bbb9f70e95c12a74c267b@orel>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
 <20231214101552.100721-18-ajones@ventanamicro.com>
 <CAAhSdy0zYkQLTuERqV4rePC8akQa90bvMNmG_QHm_5kHn1DVnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy0zYkQLTuERqV4rePC8akQa90bvMNmG_QHm_5kHn1DVnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_001958_417587_B1C7CEE2 
X-CRM114-Status: GOOD (  36.50  )
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

T24gRnJpLCBEZWMgMTUsIDIwMjMgYXQgMTE6MjQ6MDZBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBUaHUsIERlYyAxNCwgMjAyMyBhdCAzOjQ14oCvUE0gQW5kcmV3IEpvbmVzIDxham9u
ZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hlbiB0aGUgU0JJIFNUQSBleHRl
bnNpb24gZXhpc3RzIHdlIGNhbiB1c2UgaXQgdG8gaW1wbGVtZW50Cj4gPiBwYXJhdmlydCBzdGVh
bC10aW1lIHN1cHBvcnQuIEZpbGwgaW4gdGhlIGVtcHR5IHB2LXRpbWUgZnVuY3Rpb25zCj4gPiB3
aXRoIGFuIFNCSSBTVEEgaW1wbGVtZW50YXRpb24gYW5kIGFkZCB0aGUgS2NvbmZpZyBrbm9icyBh
bGxvd2luZwo+ID4gaXQgdG8gYmUgZW5hYmxlZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNj
di9LY29uZmlnICAgICAgICAgICB8IDE5ICsrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5l
bC9wYXJhdmlydC5jIHwgNjcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA4MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcgYi9hcmNoL3Jpc2N2L0tjb25maWcK
PiA+IGluZGV4IDk1YTJhMDZhY2M2YS4uYjk5ZmQ4MTI5ZWRmIDEwMDY0NAo+ID4gLS0tIGEvYXJj
aC9yaXNjdi9LY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcKPiA+IEBAIC03MjQs
NiArNzI0LDI1IEBAIGNvbmZpZyBDT01QQVQKPiA+Cj4gPiAgICAgICAgICAgSWYgeW91IHdhbnQg
dG8gZXhlY3V0ZSAzMi1iaXQgdXNlcnNwYWNlIGFwcGxpY2F0aW9ucywgc2F5IFkuCj4gPgo+ID4g
K2NvbmZpZyBQQVJBVklSVAo+ID4gKyAgICAgICBib29sICJFbmFibGUgcGFyYXZpcnR1YWxpemF0
aW9uIGNvZGUiCj4gPiArICAgICAgIGRlcGVuZHMgb24gUklTQ1ZfU0JJCj4gPiArICAgICAgIGhl
bHAKPiA+ICsgICAgICAgICBUaGlzIGNoYW5nZXMgdGhlIGtlcm5lbCBzbyBpdCBjYW4gbW9kaWZ5
IGl0c2VsZiB3aGVuIGl0IGlzIHJ1bgo+ID4gKyAgICAgICAgIHVuZGVyIGEgaHlwZXJ2aXNvciwg
cG90ZW50aWFsbHkgaW1wcm92aW5nIHBlcmZvcm1hbmNlIHNpZ25pZmljYW50bHkKPiA+ICsgICAg
ICAgICBvdmVyIGZ1bGwgdmlydHVhbGl6YXRpb24uCj4gPiArCj4gPiArY29uZmlnIFBBUkFWSVJU
X1RJTUVfQUNDT1VOVElORwo+ID4gKyAgICAgICBib29sICJQYXJhdmlydHVhbCBzdGVhbCB0aW1l
IGFjY291bnRpbmciCj4gPiArICAgICAgIGRlcGVuZHMgb24gUEFSQVZJUlQKPiA+ICsgICAgICAg
aGVscAo+ID4gKyAgICAgICAgIFNlbGVjdCB0aGlzIG9wdGlvbiB0byBlbmFibGUgZmluZSBncmFu
dWxhcml0eSB0YXNrIHN0ZWFsIHRpbWUKPiA+ICsgICAgICAgICBhY2NvdW50aW5nLiBUaW1lIHNw
ZW50IGV4ZWN1dGluZyBvdGhlciB0YXNrcyBpbiBwYXJhbGxlbCB3aXRoCj4gPiArICAgICAgICAg
dGhlIGN1cnJlbnQgdkNQVSBpcyBkaXNjb3VudGVkIGZyb20gdGhlIHZDUFUgcG93ZXIuIFRvIGFj
Y291bnQgZm9yCj4gPiArICAgICAgICAgdGhhdCwgdGhlcmUgY2FuIGJlIGEgc21hbGwgcGVyZm9y
bWFuY2UgaW1wYWN0Lgo+ID4gKwo+ID4gKyAgICAgICAgIElmIGluIGRvdWJ0LCBzYXkgTiBoZXJl
Lgo+ID4gKwo+ID4gIGNvbmZpZyBSRUxPQ0FUQUJMRQo+ID4gICAgICAgICBib29sICJCdWlsZCBh
IHJlbG9jYXRhYmxlIGtlcm5lbCIKPiA+ICAgICAgICAgZGVwZW5kcyBvbiBNTVUgJiYgNjRCSVQg
JiYgIVhJUF9LRVJORUwKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXJhdmly
dC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcGFyYXZpcnQuYwo+ID4gaW5kZXggMTQxZGJjYzM2ZmEy
Li5iMDlkZmQ4MWJjZDIgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wYXJhdmly
dC5jCj4gPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wYXJhdmlydC5jCj4gPiBAQCAtNiwxMiAr
NiwyMSBAQAo+ID4gICNkZWZpbmUgcHJfZm10KGZtdCkgInJpc2N2LXB2OiAiIGZtdAo+ID4KPiA+
ICAjaW5jbHVkZSA8bGludXgvY3B1aG90cGx1Zy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9jb21w
aWxlci5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9lcnJuby5oPgo+ID4gICNpbmNsdWRlIDxsaW51
eC9pbml0Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L2p1bXBfbGFiZWwuaD4KPiA+ICsjaW5jbHVk
ZSA8bGludXgva2NvbmZpZy5oPgo+ID4gKyNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiA+ICsj
aW5jbHVkZSA8bGludXgvcGVyY3B1LWRlZnMuaD4KPiA+ICAjaW5jbHVkZSA8bGludXgvcHJpbnRr
Lmg+Cj4gPiAgI2luY2x1ZGUgPGxpbnV4L3N0YXRpY19jYWxsLmg+Cj4gPiAgI2luY2x1ZGUgPGxp
bnV4L3R5cGVzLmg+Cj4gPgo+ID4gKyNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+ID4gKyNpbmNs
dWRlIDxhc20vcGFnZS5oPgo+ID4gKyNpbmNsdWRlIDxhc20vc2JpLmg+Cj4gPiArCj4gPiAgc3Ry
dWN0IHN0YXRpY19rZXkgcGFyYXZpcnRfc3RlYWxfZW5hYmxlZDsKPiA+ICBzdHJ1Y3Qgc3RhdGlj
X2tleSBwYXJhdmlydF9zdGVhbF9ycV9lbmFibGVkOwo+ID4KPiA+IEBAIC0zMSwyNCArNDAsNzYg
QEAgc3RhdGljIGludCBfX2luaXQgcGFyc2Vfbm9fc3RlYWxhY2MoY2hhciAqYXJnKQo+ID4KPiA+
ICBlYXJseV9wYXJhbSgibm8tc3RlYWwtYWNjIiwgcGFyc2Vfbm9fc3RlYWxhY2MpOwo+ID4KPiA+
ICtERUZJTkVfUEVSX0NQVShzdHJ1Y3Qgc2JpX3N0YV9zdHJ1Y3QsIHN0ZWFsX3RpbWUpIF9fYWxp
Z25lZCg2NCk7Cj4gPiArCj4gPiAgc3RhdGljIGJvb2wgX19pbml0IGhhc19wdl9zdGVhbF9jbG9j
ayh2b2lkKQo+ID4gIHsKPiA+ICsgICAgICAgaWYgKHNiaV9zcGVjX3ZlcnNpb24gPj0gc2JpX21r
X3ZlcnNpb24oMiwgMCkgJiYKPiA+ICsgICAgICAgICAgIHNiaV9wcm9iZV9leHRlbnNpb24oU0JJ
X0VYVF9TVEEpID4gMCkgewo+ID4gKyAgICAgICAgICAgICAgIHByX2luZm8oIlNCSSBTVEEgZXh0
ZW5zaW9uIGRldGVjdGVkXG4iKTsKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
ICsgICAgICAgfQo+ID4gKwo+ID4gICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAgfQo+ID4KPiA+
IC1zdGF0aWMgaW50IHB2X3RpbWVfY3B1X29ubGluZSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gK3N0
YXRpYyBpbnQgc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1lbSh1bnNpZ25lZCBsb25nIGxvLCB1
bnNpZ25lZCBsb25nIGhpLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gPiAgewo+ID4gKyAgICAgICBzdHJ1Y3Qgc2JpcmV0
IHJldDsKPiA+ICsKPiA+ICsgICAgICAgcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfU1RBLCBTQklf
RVhUX1NUQV9TVEVBTF9USU1FX1NFVF9TSE1FTSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGxvLCBoaSwgZmxhZ3MsIDAsIDAsIDApOwo+ID4gKyAgICAgICBpZiAocmV0LmVycm9yKSB7Cj4g
PiArICAgICAgICAgICAgICAgaWYgKGxvID09IFNCSV9TVEFfU0hNRU1fRElTQUJMRSAmJiBoaSA9
PSBTQklfU1RBX1NITUVNX0RJU0FCTEUpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwcl93
YXJuKCJGYWlsZWQgdG8gZGlzYWJsZSBzdGVhbC10aW1lIHNobWVtIik7Cj4gPiArICAgICAgICAg
ICAgICAgZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcHJfd2FybigiRmFpbGVkIHRv
IHNldCBzdGVhbC10aW1lIHNobWVtIik7Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHNiaV9l
cnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJvcik7Cj4gPiArICAgICAgIH0KPiA+ICsKPiA+ICAg
ICAgICAgcmV0dXJuIDA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW50IHB2X3RpbWVfY3B1X29u
bGluZSh1bnNpZ25lZCBpbnQgY3B1KQo+ID4gK3sKPiA+ICsgICAgICAgc3RydWN0IHNiaV9zdGFf
c3RydWN0ICpzdCA9IHRoaXNfY3B1X3B0cigmc3RlYWxfdGltZSk7Cj4gPiArICAgICAgIHBoeXNf
YWRkcl90IHBhID0gX19wYShzdCk7Cj4gPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbG8gPSAodW5z
aWduZWQgbG9uZylwYTsKPiA+ICsgICAgICAgdW5zaWduZWQgbG9uZyBoaSA9IElTX0VOQUJMRUQo
Q09ORklHXzMyQklUKSA/IHVwcGVyXzMyX2JpdHMoKHU2NClwYSkgOiAwOwo+ID4gKwo+ID4gKyAg
ICAgICByZXR1cm4gc2JpX3N0YV9zdGVhbF90aW1lX3NldF9zaG1lbShsbywgaGksIDApOwo+ID4g
K30KPiA+ICsKPiA+ICBzdGF0aWMgaW50IHB2X3RpbWVfY3B1X2Rvd25fcHJlcGFyZSh1bnNpZ25l
ZCBpbnQgY3B1KQo+ID4gIHsKPiA+IC0gICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICAgIHJldHVy
biBzYmlfc3RhX3N0ZWFsX3RpbWVfc2V0X3NobWVtKFNCSV9TVEFfU0hNRU1fRElTQUJMRSwKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgU0JJX1NUQV9TSE1F
TV9ESVNBQkxFLCAwKTsKPiA+ICB9Cj4gPgo+ID4gIHN0YXRpYyB1NjQgcHZfdGltZV9zdGVhbF9j
bG9jayhpbnQgY3B1KQo+ID4gIHsKPiA+IC0gICAgICAgcmV0dXJuIDA7Cj4gPiArICAgICAgIHN0
cnVjdCBzYmlfc3RhX3N0cnVjdCAqc3QgPSBwZXJfY3B1X3B0cigmc3RlYWxfdGltZSwgY3B1KTsK
PiA+ICsgICAgICAgdTMyIHNlcXVlbmNlOwo+ID4gKyAgICAgICB1NjQgc3RlYWw7Cj4gPiArCj4g
PiArICAgICAgIGlmIChJU19FTkFCTEVEKENPTkZJR18zMkJJVCkpIHsKPiA+ICsgICAgICAgICAg
ICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAqIENoZWNrIHRoZSBzZXF1ZW5jZSBmaWVsZCBi
ZWZvcmUgYW5kIGFmdGVyIHJlYWRpbmcgdGhlIHN0ZWFsCj4gPiArICAgICAgICAgICAgICAgICog
ZmllbGQuIFJlcGVhdCB0aGUgcmVhZCBpZiBpdCBpcyBkaWZmZXJlbnQgb3Igb2RkLgo+ID4gKyAg
ICAgICAgICAgICAgICAqLwo+ID4gKyAgICAgICAgICAgICAgIGRvIHsKPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHNlcXVlbmNlID0gUkVBRF9PTkNFKHN0LT5zZXF1ZW5jZSk7Cj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICB2aXJ0X3JtYigpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgc3RlYWwgPSBSRUFEX09OQ0Uoc3QtPnN0ZWFsKTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHZpcnRfcm1iKCk7Cj4gPiArICAgICAgICAgICAgICAgfSB3aGlsZSAoKGxlMzJfdG9fY3B1
KHNlcXVlbmNlKSAmIDEpIHx8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgc2VxdWVuY2Ug
IT0gUkVBRF9PTkNFKHN0LT5zZXF1ZW5jZSkpOwo+IAo+IEFjdHVhbGx5LCB3ZSBzaG91bGQgYmUg
ZG9pbmcgdGhpcyBzZXF1ZW5jZSBmb3IgYm90aCBSVjY0IGFuZCBSVjMyCj4gYmVjYXVzZSBmb3Ig
UlY2NCB0aGUgc3RlYWwgdGltZSB2YWx1ZSBpcyB2YWxpZCBvbmx5IHdoZW4gc2VxdWVuY2UgaXMK
PiBhbiBldmVuIG51bWJlci4KCk9oLCByaWdodC4gVGhlIHNwZWMgc3RhdGVzCgoiIiIKVGhlIHN1
cGVydmlzb3ItbW9kZSBzb2Z0d2FyZSBNVVNUIGNoZWNrIHRoaXMgZmllbGQgYmVmb3JlCmFuZCBh
ZnRlciByZWFkaW5nIHRoZSBzdGVhbCBmaWVsZCwgYW5kIHJlcGVhdCB0aGUgcmVhZCBpZgppdCBp
cyBkaWZmZXJlbnQgb3Igb2RkLgoiIiIKCndoaWNoIGdpdmVzIHRoZSBTQkkgaW1wbGVtZW50YXRp
b24gdGhlIGZyZWVkb20gdG8gdXBkYXRlIHRoZSBzdGVhbCBiaXRzCm5vbi1hdG9taWNhbGx5LgoK
SSdsbCBmaXggdGhpcyBmb3IgdjMuCgpUaGFua3MsCmRyZXcKCgo+IAo+ID4gKyAgICAgICB9IGVs
c2Ugewo+ID4gKyAgICAgICAgICAgICAgIHN0ZWFsID0gUkVBRF9PTkNFKHN0LT5zdGVhbCk7Cj4g
PiArICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgcmV0dXJuIGxlNjRfdG9fY3B1KHN0ZWFsKTsK
PiA+ICB9Cj4gPgo+ID4gIGludCBfX2luaXQgcHZfdGltZV9pbml0KHZvaWQpCj4gPiAtLQo+ID4g
Mi40My4wCj4gPgo+IAo+IFJlZ2FyZHMsCj4gQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
