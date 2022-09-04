Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694F3ECAAD5
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Sep 2022 04:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVOV7nrLmg30b1abpTESt7uifavTR6s/wFlepQFWxjM=; b=aB5tW7+5z+S30l
	TFMiU1BZyszftfVI71k+qLgkwQJFI2FQVDiE7YiweLwWlGcXdDilZ2ynzyKEXx0FOYNOD4tL6ds+L
	W9STnRNe0b+q+kuEI489MX+egfQXMigDkk8nshDVSm5gPvBKugMZoQYvVU513dydXPnoCq1deZfqB
	DM/wxy3nx4oNkOJvBI4w5eCc3FpjAUAWAdQ7l4l//Z85Ogd0LRYa1tntKUwvNGhaoFsQAQ8HgX89g
	c9P24f0t0W2QPOU121Pt56YjBc/wAsHwEJDCYEosV7czwY2bukOMmY3M9bvzoPXEY8JsWj4UNd8NH
	L+Eay99eZkYf/mk+QUTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUhQc-00DPgI-M5; Sun, 04 Sep 2022 04:40:14 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUhQZ-00DPfd-QX
	for linux-riscv@lists.infradead.org; Sun, 04 Sep 2022 04:40:13 +0000
Received: by mail-lf1-x130.google.com with SMTP id q7so8867340lfu.5
        for <linux-riscv@lists.infradead.org>; Sat, 03 Sep 2022 21:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=C+MS/rLzegvRZFnaDUJAp+enUiI0lNSEcdyO2eVVcK8=;
        b=G4gAsMuv0P8H+nBLOqzCRSWqbhtTbBSkz/95S9yAjWf3yZYsRsbqvkZTzOmJvyvhv/
         pVrq5fotce93LD67GojA0A49rdFv0wD0DaH1UmFUQT11HcZ/oS7cpQVbr7n8ntJ07oLR
         ql5hlk/Rx5lkEPV8XxlV0+Yp3SObDekEvWibgX3o1uKXRMKmFc2GU4idGIBwOMmfc+Ro
         wfXPVUTsBQMPySyjRqhNH2Q+ZUbUFPwvzQpAg+NNWoSoEyox+G33/iSon+8myWWlUs49
         NjzAKgS+QiSL6UPgnHAFKHDc7BzRTA2TjPIy8l5VljJlMhGcBRa88rk9WEn2ICUnPXAQ
         aG8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=C+MS/rLzegvRZFnaDUJAp+enUiI0lNSEcdyO2eVVcK8=;
        b=6QYvUqJWqmFCxeATg5RkAZYlq/zjf9INPZtmevZLSf+y0PKXiqXljGGJWzvjtGzt6C
         +YrpRfT9Ylla3COolHb8VvYA9kSU/8EH2y+W8xCvc/Hw/q/e6BBT+XGRaKpndGcKoRLH
         TJ2om9JYL620v4Ilg0zOAndQ8GzX9byVGUfEEBg+MSD7vmWUWouxHizrjw1sEhEeHl1q
         K0hDy6ad+lGpXQMOnafFXYC77en8C/VDI3ZG2ddyOyXxUCVuMI7jhAHEUv9Y5DmoaOOp
         /uyxN0qyscdHAQjvRTQjhtfHyJG1iZ40OENXODomWofSVrWm/ueIcHCZgMFMqTbhoZPg
         zv1w==
X-Gm-Message-State: ACgBeo0rLIoDuuKDOooI913KUcwyZFo3q45SqGk/G0D9EeKRYAEkA/Hv
	tdPeIba9GZi9Ucsk+BSF+eq/KXGxBEVGDeg7VGtPEA==
X-Google-Smtp-Source: AA6agR7ckTj8b5QhYpebuLxLKt59X4YF2FXMEDbWQ6L1sRSUtKCxlaVrahea05qZGmgZmOqEIG6a6BAiIb8atqq4LWQ=
X-Received: by 2002:a05:6512:158b:b0:48b:38:cff8 with SMTP id
 bp11-20020a056512158b00b0048b0038cff8mr13497279lfb.100.1662266409662; Sat, 03
 Sep 2022 21:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220903161309.32848-1-apatel@ventanamicro.com>
 <20220903161309.32848-2-apatel@ventanamicro.com> <6ABE254E-C7DA-468B-9A6B-D10FF32E0E89@jrtc27.com>
In-Reply-To: <6ABE254E-C7DA-468B-9A6B-D10FF32E0E89@jrtc27.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 4 Sep 2022 10:09:57 +0530
Message-ID: <CAK9=C2U5MjF+qv9z=_cSS4iN66dCY_goF0D_-ujcPPG9VrReDw@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] RISC-V: Clear SIP bit only when using SBI IPI operations
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org, 
	Bin Meng <bmeng.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220903_214011_883519_ACDB2F4A 
X-CRM114-Status: GOOD (  30.10  )
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

T24gU3VuLCBTZXAgNCwgMjAyMiBhdCAxOjQ2IEFNIEplc3NpY2EgQ2xhcmtlIDxqcnRjMjdAanJ0
YzI3LmNvbT4gd3JvdGU6Cj4KPiBdT24gMyBTZXB0IDIwMjIsIGF0IDE3OjEzLCBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4gPgo+ID4gVGhlIHNvZnR3YXJlIGlu
dGVycnVwdCBwZW5kaW5nIChpLmUuIFtNfFNdU0lQKSBiaXQgaXMgd3JpdGVhYmxlIGZvcgo+ID4g
Uy1tb2RlIGJ1dCByZWFkLW9ubHkgZm9yIE0tbW9kZSBzbyB3ZSBjbGVhciB0aGlzIGJpdCBvbmx5
IHdoZW4gdXNpbmcKPiA+IFNCSSBJUEkgb3BlcmF0aW9ucy4KPgo+IFVoLCB3aGVyZSBpcyB0aGlz
IHNwZWNpZmllZD8gSSBkb27igJl0IHNlZSB0aGF0LCBhbmQgdGhhdCB3b3VsZCBiZSBvZGQuCj4g
VGhlIHNwZWMgY2xlYXJseSBzYXlzIHRoYXQgaWYgc3VwZXJ2aXNvciBzb2Z0d2FyZSBpbnRlcnJ1
cHRzIGFyZQo+IGltcGxlbWVudGVkIHRoZW4gdGhlIGJpdCBpcyB3cml0ZWFibGUsIHdpdGggbm8g
Y2F2ZWF0cyBvbiB3aGVuIChiZXlvbmQKPiB0aGUgcGVybWlzc2lvbnMgcmVxdWlyZWQgdG8gYWNj
ZXNzIHRoZSBDU1IgaW4gZ2VuZXJhbCkuCgpGb3IgbWlwLk1TSVAsIHJlZmVyIHRoZSBiZWxvdyB0
ZXh0IGZyb20gc2VjdGlvbiAzLjEuOSBvZiB0aGUgUklTQy1WIHByaXZpbGVnZWQKc3BlY2lmaWNh
dGlvbjoKCiJNU0lQIGlzIHJlYWQtb25seSBpbiBtaXAsIGFuZCBpcyB3cml0dGVuIGJ5IGFjY2Vz
c2VzIHRvIG1lbW9yeS1tYXBwZWQKY29udHJvbCByZWdpc3RlcnMsIHdoaWNoIGFyZSB1c2VkIGJ5
IHJlbW90ZSBoYXJ0cyB0byBwcm92aWRlIG1hY2hpbmUtbGV2ZWwKaW50ZXJwcm9jZXNzb3IgaW50
ZXJydXB0cy4iCgpGb3Igc2lwLlNTSVAsIHJlZmVyIHRoZSBiZWxvdyB0ZXh0IGZyb20gc2VjdGlv
biA0LjEuMyBvZiB0aGUgUklTQy1WIHByaXZpbGVnZWQKc3BlY2lmaWNhdGlvbjoKCiJJZiBpbXBs
ZW1lbnRlZCwgU1NJUCBpcyB3cml0YWJsZSBpbiBzaXAgYW5kIG1heSBhbHNvIGJlIHNldCB0byAx
IGJ5IGEKcGxhdGZvcm0tc3BlY2lmaWMgaW50ZXJydXB0IGNvbnRyb2xsZXIuIgoKPgo+IFRoaXMg
cGF0Y2ggZG9lcyBtYWtlIHNlbnNlIGZvciBhIGRpZmZlcmVudCByZWFzb24gdGhvdWdoOiB0aGF0
IElQSXMgbWF5Cj4gbm90IGJlIHVzaW5nIHNvZnR3YXJlIGludGVycnVwdHMgYXQgYWxsIChpbiB0
aGUgSU1TSUMgY2FzZSkuCgpTdXJlLCBsZXQgbWUgaGVscCB5b3UgdW5kZXJzdGFuZCB0aGlzIGJl
dHRlci4KClRoZSBJUEkgc3VwcG9ydCBpbiBMaW51eCBSSVNDLVYgZG9lcyBub3QgYXNzdW1lIGFu
eSBwYXJ0aWN1bGFyIElQSQptZWNoYW5pc20uIEluIGZhY3QsIHdlIHdpbGwgYmUgc3VwcG9ydGlu
ZyBtdWx0aXBsZSBJUEkgbWVjaGFuaXNtIGluCkxpbnV4IFJJU0MtViBhbmQgb25lIG9mIHRoZXNl
IHdpbGwgYmUgc2VsZWN0ZWQgYXQgYm9vdC10aW1lIGJhc2VkCm9uIHBsYXRmb3JtIGNhcGFiaWxp
dGllczoKCjEpIExpbnV4IFJJU0MtViBOb01NVSAoTS1tb2RlKSBrZXJuZWwgd2lsbCB1c2UgSVBJ
cyBwcm92aWRlZCBieQp0aGUgQ0xJTlQgdGltZXIgZHJpdmVyIChyZWZlciwgZHJpdmVycy9jbG9j
a3NvdXJjZS90aW1lci1jbGludC5jKS4gVGhpcwptZWNoYW5pc20gdXNlcyB0aGUgQ0xJTlQgTU1J
TyByZWdpc3RlcnMgdG8gdXBkYXRlIHRoZSBzdGF0ZSBvZgptaXAuTVNJUCBiaXQuIFRoZSBNLW1v
ZGUga2VybmVsIGNhbm5vdCBkaXJlY3RseSBtb2RpZnkgdGhlIG1pcC5NU0lQCmJpdCB3aXRob3V0
IGdvaW5nIHRocm91Z2ggdGhlIENMSU5UIE1NSU8gcmVnaXN0ZXJzLgoKMikgTGludXggUklTQy1W
IE1NVSAoUy1tb2RlKSBrZXJuZWwgd2l0aG91dCBJTVNJQyB3aWxsIHVzZSBJUElzCnByb3ZpZGVk
IGJ5IHRoZSBTQkkgSVBJIGNhbGxzIChyZWZlciwgYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMpLiBU
aGlzCm1lY2hhbmlzbSB1c2VzIHRoZSBTQkkgU0VORF9JUEkgY2FsbCB3aGljaCBzZXRzIHRoZSBz
aXAuU1NJUApiaXQgZnJvbSBNLW1vZGUgZmlybXdhcmUgYW5kIGtlcm5lbCBpdHNlbGYgd2lsbCBj
bGVhciBzaXAuU1NJUCBiaXQKYWZ0ZXIgaGFuZGxpbmcgSVBJIG9uIHRhcmdldCBIQVJULgoKMykg
TGludXggUklTQy1WIE1NVSAoUy1tb2RlKSBrZXJuZWwgd2l0aCBJTVNJQyB3aWxsIHVzZSBJUElz
CmFzIHNvZnR3YXJlIGluamVjdGVkIE1TSXMgKHJlZmVyLApodHRwczovL2dpdGh1Yi5jb20vYXZw
YXRlbC9saW51eC9ibG9iL3Jpc2N2X2FpYV92MS9kcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2LWlt
c2ljLmMpLgpUaGlzIG1lY2hhbmlzbSBkb2VzIG5vdCB1c2UgIlNvZnR3YXJlIEludGVycnVwdCIg
Yml0cyBkZWZpbmVkIGluCnRoZSBtaXAvc2lwIENTUi4gSW5zdGVhZCBJUElzIGFyZSByZWd1bGFy
IGV4dGVybmFsIGludGVycnVwdHMgaW5qZWN0ZWQKdmlhIElNU0lDIGFuZCBpbXNpY19oYW5kbGVf
aXJxKCkgb2YgdGhlIElNU0lDIGRyaXZlciBjbGVhcnMgdGhlCklQSSBwZW5kaW5nIHRocm91Z2gg
c3RvcGVpIENTUi4KCkN1cnJlbnRseSwgd2Ugd2VyZSBibGluZGx5IGNsZWFyaW5nIG1pcC5bTXxT
XVNJUCBiaXQgaW4gcmlzY3ZfY2xlYXJfaXBpKCkKd2hpY2ggaXMgYSBjb21tb24gZnVuY3Rpb24g
Zm9yIGFsbCB0aHJlZSBtZWNoYW5pc21zIGFib3ZlIHdoaWNoCmlzIG5vdCByaWdodCBjb25zaWRl
cmluZyB0aGUgZGl2ZXJzaXR5IGluIElQSSBtZWNoYW5pc21zIHN1cHBvcnRlZApieSBMaW51eCBS
SVNDLVYuCgpUaGlzIHBhdGNoIG1vdmVzIHRoZSBjbGVhcmluZyBvZiBTU0lQIGJpdCB0byBTQkkg
SVBJIGNvZGUgc28gdGhhdCBpdCBpcwpvbmx5IGRvbmUgZm9yIG1lY2hhbmlzbSAjMiAoZGVzY3Jp
YmVkIGFib3ZlKSBhbmQgbm90IGRvbmUgZm9yCm1lY2hhbmlzbXMgIzEgJiAjMyAoZGVzY3JpYmVk
IGFib3ZlKS4KClJlZ2FyZHMsCkFudXAKCj4KPiBKZXNzCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEFu
dXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gUmV2aWV3ZWQtYnk6IEJpbiBN
ZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+IGFyY2gvcmlzY3Yva2VybmVsL3Ni
aS5jIHwgOCArKysrKysrLQo+ID4gYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMgfCAyIC0tCj4gPiAy
IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
YmkuYwo+ID4gaW5kZXggNzc1ZDMzMjJiNDIyLi5mYzYxNDY1MGEyZTMgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMKPiA+IEBAIC02NDMsOCArNjQzLDE0IEBAIHN0YXRpYyB2b2lkIHNiaV9zZW5kX2NwdW1hc2tf
aXBpKGNvbnN0IHN0cnVjdCBjcHVtYXNrICp0YXJnZXQpCj4gPiAgICAgICBzYmlfc2VuZF9pcGko
dGFyZ2V0KTsKPiA+IH0KPiA+Cj4gPiArc3RhdGljIHZvaWQgc2JpX2lwaV9jbGVhcih2b2lkKQo+
ID4gK3sKPiA+ICsgICAgIGNzcl9jbGVhcihDU1JfSVAsIElFX1NJRSk7Cj4gPiArfQo+ID4gKwo+
ID4gc3RhdGljIGNvbnN0IHN0cnVjdCByaXNjdl9pcGlfb3BzIHNiaV9pcGlfb3BzID0gewo+ID4g
LSAgICAgLmlwaV9pbmplY3QgPSBzYmlfc2VuZF9jcHVtYXNrX2lwaQo+ID4gKyAgICAgLmlwaV9p
bmplY3QgPSBzYmlfc2VuZF9jcHVtYXNrX2lwaSwKPiA+ICsgICAgIC5pcGlfY2xlYXIgPSBzYmlf
aXBpX2NsZWFyCj4gPiB9Owo+ID4KPiA+IHZvaWQgX19pbml0IHNiaV9pbml0KHZvaWQpCj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc21wLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9z
bXAuYwo+ID4gaW5kZXggNzYwYTY0NTE4YzU4Li5jNTZkNjdmNTNlYTkgMTAwNjQ0Cj4gPiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9zbXAuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc21w
LmMKPiA+IEBAIC04Myw4ICs4Myw2IEBAIHZvaWQgcmlzY3ZfY2xlYXJfaXBpKHZvaWQpCj4gPiB7
Cj4gPiAgICAgICBpZiAoaXBpX29wcyAmJiBpcGlfb3BzLT5pcGlfY2xlYXIpCj4gPiAgICAgICAg
ICAgICAgIGlwaV9vcHMtPmlwaV9jbGVhcigpOwo+ID4gLQo+ID4gLSAgICAgY3NyX2NsZWFyKENT
Ul9JUCwgSUVfU0lFKTsKPiA+IH0KPiA+IEVYUE9SVF9TWU1CT0xfR1BMKHJpc2N2X2NsZWFyX2lw
aSk7Cj4gPgo+ID4gLS0KPiA+IDIuMzQuMQo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
