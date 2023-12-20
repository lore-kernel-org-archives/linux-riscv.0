Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7874AC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 03:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qpsvFLs5hJcCFHUU4uG+UrW15qk9flvFn5A+fV26JAs=; b=onmCEvgVVgIzCj
	juIaI5BhfdUkZVXwANTtlQBr97cFADFrT+Y5gWknLAg43NqXz3p9USEsvbryJkbzfuoNpWyXnWAUp
	nHfRHXv1dumspa4kvM03ORMnl57qxEylhHCkpy+boz1HxZJWwsWXX43Wbm+LTNpbH4LcUtEvE0h14
	SgDz+OU6xkMmnpPtJ9SmBVvJFUx3N7sWH7+UzQ2pNb7mgKTs8PcxjMtb3kuQHc5yM0ZO1POrvoF4P
	gGjQX5jVNSIqFrr9Qcv9kjU0wiGl5wtweWeDZW7YD2ScpuGeWwgFUEwhZZxin23btSVM0FyumMdug
	+exEM8PNwNpu9pAcJvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFnah-00G4iT-08;
	Wed, 20 Dec 2023 03:49:51 +0000
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFnac-00G4g9-2U
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 03:49:49 +0000
Received: by mail-io1-xd2b.google.com with SMTP id ca18e2360f4ac-7b7fc0e4a4dso36824439f.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Dec 2023 19:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703044184; x=1703648984; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cV23V7TOvb67CyEBq2y7tG+sTh2KHoQeq84YdzqhXCE=;
        b=N6NSaB4Y8rORN37vESDI8HXE2w+AwBk5hzetRSZDTCHI9v3XNZawGT7Zg38q9MTWDe
         K/9poZKNpJLuwkwjTB2IRWKeWUf9984NGxfBNwTupZK8HfllTwDgAUkIQiOmV/4lL9/p
         OEpKN9pXK41CC29cHPPp6maaDMcaSBohug/7BMoSvrmnC0JmNmOEmkAxzrra85SvS0nA
         hW6UT0fKgsXRRzQAnL4vW7TlSDahH7I3VWVMSb5SfU1ibX52l9TkFiYW2aRglquOx9vc
         ZKKF2qZviJyWaU8umosCJm4+YGTdmg9bir0DotznOZaigZpw9nxlIB1Z8guiumQ7w4Vf
         LbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703044184; x=1703648984;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cV23V7TOvb67CyEBq2y7tG+sTh2KHoQeq84YdzqhXCE=;
        b=mGkiB8cHkfggCILoj0RxsXDExuYrs/zOj35mzu2cWJmWioIyVnMvDYl1cqeZ2tnyp1
         KeyJkVkvjenRfpnqkHnVeXRvV47ErzPqHGAxRQtZm8pyY7zpaaBX0EtKQgb+mTCHyaq4
         HnUHebokieZ4+dsoukLFvsUYvibuwhGb2uok38gVuOPnwynFEtMdl3sx5kwBhDIuPtR5
         /mjYtoOP5+kl9DQc63/WNMbQ1irmYRXMJIE+dsww09h9QZfOCW+Lt45G2dK0PbYeNofy
         5qtfesd9bIYKRau0dr9TXWt20gyjQWSYmuw/9mFUyy6nxl/jP5y+7GfmXgFpmiWPdQrx
         XTdg==
X-Gm-Message-State: AOJu0YxfNwJOPIWVu7l0hzy4bSn3zKEsgs1C6UIjf+DjWls3vZUTH1qu
	BesWDAveWttzICa39srLYKAp/w==
X-Google-Smtp-Source: AGHT+IEFtaaGYdqONj8ZBQy1SsSMrvVpJouh1AF9l/WyoqOfDMdwX1NJFUbBjCx+mCqU4PqT2OUdiA==
X-Received: by 2002:a6b:7f0c:0:b0:7b7:faa5:954f with SMTP id l12-20020a6b7f0c000000b007b7faa5954fmr1627037ioq.23.1703044183845;
        Tue, 19 Dec 2023 19:49:43 -0800 (PST)
Received: from sunil-laptop ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id r9-20020a6bd909000000b007b42bf452f4sm6509305ioc.33.2023.12.19.19.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 19:49:43 -0800 (PST)
Date: Wed, 20 Dec 2023 09:19:32 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Len Brown <lenb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>, Haibo Xu <haibo1.xu@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC PATCH v3 00/17] RISC-V: ACPI: Add external interrupt
 controller support
Message-ID: <ZYJkTN+GNi1nMkJd@sunil-laptop>
References: <20231219174526.2235150-1-sunilvl@ventanamicro.com>
 <CAJZ5v0j6Veze8xDFKTbVZ5=WAfmLdeJ8NXRnh9kwCZgyaDdgew@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0j6Veze8xDFKTbVZ5=WAfmLdeJ8NXRnh9kwCZgyaDdgew@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_194946_808906_48991E13 
X-CRM114-Status: GOOD (  29.57  )
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

T24gVHVlLCBEZWMgMTksIDIwMjMgYXQgMDY6NTA6MTlQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gVHVlLCBEZWMgMTksIDIwMjMgYXQgNjo0NeKAr1BNIFN1bmlsIFYgTCA8
c3VuaWx2bEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHNlcmllcyBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBiZWxvdyBFQ1IgYXBwcm92ZWQgYnkgQVNXRy4KPiA+IDEpIE1BRFQg
LSBodHRwczovL2RyaXZlLmdvb2dsZS5jb20vZmlsZS9kLzFvTUdQeU9ENThKYVBnTWwxcEthc1Qt
VktzSUtpYTd6Ui92aWV3P3VzcD1zaGFyaW5nCj4gPgo+ID4gVGhlIHNlcmllcyBwcmltYXJpbHkg
ZW5hYmxlcyBpcnFjaGlwIGRyaXZlcnMgZm9yIFJJU0MtViBBQ1BJIGJhc2VkCj4gPiBwbGF0Zm9y
bXMuCj4gPgo+ID4gVGhlIHNlcmllcyBjYW4gYmUgYnJvYWRseSBjYXRlZ29yaXplZCBsaWtlIGJl
bG93Lgo+ID4KPiA+IDEpIFBDSSBBQ1BJIHJlbGF0ZWQgZnVuY3Rpb25zIGFyZSBtaWdyYXRlZCBm
cm9tIGFybTY0IHRvIGNvbW1vbiBmaWxlIHNvCj4gPiB0aGF0IHdlIGRvbid0IG5lZWQgdG8gZHVw
bGljYXRlIHRoZW0gZm9yIFJJU0MtVi4KPiA+Cj4gPiAyKSBJbnRyb2R1Y2VkIHN1cHBvcnQgZm9y
IGZ3X2RldmxpbmsgZm9yIEFDUEkgbm9kZXMgZm9yIElSUSBkZXBlbmRlbmN5Lgo+ID4gVGhpcyBo
ZWxwcyB0byBzdXBwb3J0IGRlZmVycmVkIHByb2JlIG9mIGludGVycnVwdCBjb250cm9sbGVyIGRy
aXZlcnMuCj4gPgo+ID4gMykgTW9kaWZpZWQgcG5wX2lycSgpIHRvIHRyeSByZWdpc3RlcmluZyB0
aGUgSVJRICBhZ2FpbiBpZiBpdCBzZWVzIGl0IGluCj4gPiBkaXNhYmxlZCBzdGF0ZS4gVGhpcyBz
b2x1dGlvbiBpcyBzaW1pbGFyIHRvIGhvdwo+ID4gcGxhdGZvcm1fZ2V0X2lycV9vcHRpb25hbCgp
IHdvcmtzIGZvciByZWd1bGFyIHBsYXRmb3JtIGRldmljZXMuCj4gPgo+ID4gNCkgQWRkZWQgc3Vw
cG9ydCBmb3IgcmUtb3JkZXJpbmcgdGhlIHByb2JlIG9mIGludGVycnVwdCBjb250cm9sbGVycyB3
aGVuCj4gPiBJUlFDSElQX0FDUElfREVDTEFSRSBpcyB1c2VkLgo+ID4KPiA+IDUpIEFDUEkgc3Vw
cG9ydCBhZGRlZCBpbiBSSVNDLVYgaW50ZXJydXB0IGNvbnRyb2xsZXIgZHJpdmVycy4KPiA+Cj4g
PiBUaGlzIHNlcmllcyBpcyBiYXNlZCBvbiBBbnVwJ3MgQUlBIHYxMSBzZXJpZXMuIFNpbmNlIEFu
dXAncyBBSUEgdjExIGlzCj4gPiBub3QgbWVyZ2VkIHlldCBhbmQgZmlyc3QgdGltZSBpbnRyb2R1
Y2luZyBmd19kZXZsaW5rLCBkZWZlcnJlZCBwcm9iZSBhbmQKPiA+IHJlb3JkZXJpbmcgc3VwcG9y
dCBmb3IgSVJRQ0hJUCBwcm9iZSwgdGhpcyBzZXJpZXMgaXMgc3RpbGwga2VwdCBhcyBSRkMuCj4g
PiBMb29raW5nIGZvcndhcmQgZm9yIHRoZSBmZWVkYmFjayEKPiA+Cj4gPiBDaGFuZ2VzIHNpbmNl
IFJGQyB2MjoKPiA+ICAgICAgICAgMSkgSW50cm9kdWNlZCBmd19kZXZsaW5rIGZvciBBQ1BJIG5v
ZGVzIGZvciBJUlEgZGVwZW5kZW5jeS4KPiA+ICAgICAgICAgMikgRHJvcHBlZCBwYXRjaGVzIGlu
IGRyaXZlcnMgd2hpY2ggYXJlIG5vdCByZXF1aXJlZCBkdWUgdG8KPiA+ICAgICAgICAgICAgZndf
ZGV2bGluayBzdXBwb3J0Lgo+ID4gICAgICAgICAzKSBEcm9wcGVkIHBjaV9zZXRfbXNpKCkgcGF0
Y2ggYW5kIGFkZGVkIGEgcGF0Y2ggaW4KPiA+ICAgICAgICAgICAgcGNpX2NyZWF0ZV9yb290X2J1
cygpLgo+ID4gICAgICAgICA0KSBVcGRhdGVkIHBucF9pcnEoKSBwYXRjaCBzbyB0aGF0IG5vbmUg
b2YgdGhlIGFjdHVhbCBQTlAKPiA+ICAgICAgICAgICAgZHJpdmVycyBuZWVkIHRvIGNoYW5nZS4K
PiA+Cj4gPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MToKPiA+ICAgICAgICAgMSkgQWJhbmRvbmVkIHN3
bm9kZSBhcHByb2FjaCBhcyBwZXIgTWFyYydzIGZlZWRiYWNrLgo+ID4gICAgICAgICAyKSBUbyBj
b3BlIHVwIHdpdGggQUlBIHNlcmllcyBjaGFuZ2VzIHdoaWNoIGNoYW5nZWQgaXJxY2hpcCBkcml2
ZXIKPiA+ICAgICAgICAgICAgcHJvYmUgZnJvbSBjb3JlX2luaXRjYWxsKCkgdG8gcGxhdGZvcm1f
ZHJpdmVyLCBhZGRlZCBwYXRjaGVzCj4gPiAgICAgICAgICAgIHRvIHN1cHBvcnQgZGVmZXJyZWQg
cHJvYmluZy4KPiA+ICAgICAgICAgMykgUmViYXNlZCBvbiB0b3Agb2YgQW51cCdzIEFJQSB2MTEg
YW5kIGFkZGVkIHRhZ3MuCj4gPgo+ID4gVG8gdGVzdCB0aGUgc2VyaWVzLAo+ID4KPiA+IDEpIFFl
bXUgc2hvdWxkIGJlIGJ1aWx0IHVzaW5nIHRoZSByaXNjdl9hY3BpX2IyX3Y4IGJyYW5jaCBhdAo+
ID4gaHR0cHM6Ly9naXRodWIuY29tL3Zsc3VuaWwvcWVtdS5naXQKPiA+Cj4gPiAyKSBFREsyIHNo
b3VsZCBiZSBidWlsdCB1c2luZyB0aGUgaW5zdHJ1Y3Rpb25zIGF0Ogo+ID4gaHR0cHM6Ly9naXRo
dWIuY29tL3RpYW5vY29yZS9lZGsyL2Jsb2IvbWFzdGVyL092bWZQa2cvUmlzY1ZWaXJ0L1JFQURN
RS5tZAo+ID4KPiA+IDMpIEJ1aWxkIExpbnV4IHVzaW5nIHRoaXMgc2VyaWVzIG9uIHRvcCBvZiBB
bnVwJ3MgQUlBIHYxMSBzZXJpZXMuCj4gPgo+ID4gUnVuIFFlbXU6Cj4gPiBxZW11LXN5c3RlbS1y
aXNjdjY0IFwKPiA+ICAtTSB2aXJ0LHBmbGFzaDA9cGZsYXNoMCxwZmxhc2gxPXBmbGFzaDEsYWlh
PWFwbGljLWltc2ljIFwKPiA+ICAtbSAyRyAtc21wIDggXAo+ID4gIC1zZXJpYWwgbW9uOnN0ZGlv
IFwKPiA+ICAtZGV2aWNlIHZpcnRpby1ncHUtcGNpIC1mdWxsLXNjcmVlbiBcCj4gPiAgLWRldmlj
ZSBxZW11LXhoY2kgXAo+ID4gIC1kZXZpY2UgdXNiLWtiZCBcCj4gPiAgLWJsb2NrZGV2IG5vZGUt
bmFtZT1wZmxhc2gwLGRyaXZlcj1maWxlLHJlYWQtb25seT1vbixmaWxlbmFtZT1SSVNDVl9WSVJU
X0NPREUuZmQgXAo+ID4gIC1ibG9ja2RldiBub2RlLW5hbWU9cGZsYXNoMSxkcml2ZXI9ZmlsZSxm
aWxlbmFtZT1SSVNDVl9WSVJUX1ZBUlMuZmQgXAo+ID4gIC1uZXRkZXYgdXNlcixpZD1uZXQwIC1k
ZXZpY2UgdmlydGlvLW5ldC1wY2ksbmV0ZGV2PW5ldDAgXAo+ID4gIC1rZXJuZWwgYXJjaC9yaXNj
di9ib290L0ltYWdlIFwKPiA+ICAtaW5pdHJkIHJvb3Rmcy5jcGlvIFwKPiA+ICAtYXBwZW5kICJy
b290PS9kZXYvcmFtIHJvIGNvbnNvbGU9dHR5UzAgcm9vdHdhaXQgZWFybHljb249dWFydDgyNTAs
bW1pbywweDEwMDAwMDAwIgo+ID4KPiA+IFRvIGJvb3Qgd2l0aCBBUExJQyBvbmx5LCB1c2UgYWlh
PWFwbGljLgo+ID4gVG8gYm9vdCB3aXRoIFBMSUMsIHJlbW92ZSBhaWE9IG9wdGlvbi4KPiA+Cj4g
PiBUaGlzIHNlcmllcyBpcyBhbHNvIGF2YWlsYWJsZSBpbiBhY3BpX2IyX3YzX3Jpc2N2X2FpYV92
MTEgYnJhbmNoIGF0Cj4gPiBodHRwczovL2dpdGh1Yi5jb20vdmxzdW5pbC9saW51eC5naXQKPiA+
Cj4gPiBCYXNlZC1vbjogMjAyMzEwMjMxNzI4MDAuMzE1MzQzLTEtYXBhdGVsQHZlbnRhbmFtaWNy
by5jb20KPiA+IChodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjMxMDIzMTcyODAwLjMx
NTM0My0xLWFwYXRlbEB2ZW50YW5hbWljcm8uY29tLykKPiA+Cj4gPiBTdW5pbCBWIEwgKDE3KToK
PiA+ICAgYXJtNjQ6IFBDSTogTWlncmF0ZSBBQ1BJIHJlbGF0ZWQgZnVuY3Rpb25zIHRvIHBjaS1h
Y3BpLmMKPiA+ICAgUklTQy1WOiBBQ1BJOiBJbXBsZW1lbnQgUENJIHJlbGF0ZWQgZnVuY3Rpb25h
bGl0eQo+ID4gICBQQ0k6IE1ha2UgcGNpX2NyZWF0ZV9yb290X2J1cygpIGRlY2xhcmUgaXRzIHJl
bGlhbmNlIG9uIE1TSSBkb21haW5zCj4gPiAgIEFDUEk6IEFkZCBmd19kZXZsaW5rIHN1cHBvcnQg
Zm9yIEFDUEkgZndub2RlIGZvciBJUlEgZGVwZW5kZW5jeQo+ID4gICBBQ1BJOiBpcnE6IEFkZCBz
dXBwb3J0IGZvciBkZWZlcnJlZCBwcm9iZSBpbiBhY3BpX3JlZ2lzdGVyX2dzaSgpCj4gPiAgIHBu
cC5oOiBSZWNvbmZpZ3VyZSBJUlEgaW4gcG5wX2lycSgpIHRvIHN1cHBvcnQgZGVmZXJyZWQgcHJv
YmUKPiA+ICAgQUNQSTogc2Nhbi5jOiBBZGQgd2VhayBhcmNoIHNwZWNpZmljIGZ1bmN0aW9uIHRv
IHJlb3JkZXIgdGhlIElSUUNISVAKPiA+ICAgICBwcm9iZQo+ID4gICBBQ1BJOiBSSVNDLVY6IElt
cGxlbWVudCBhcmNoIGZ1bmN0aW9uIHRvIHJlb3JkZXIgaXJxY2hpcCBwcm9iZSBlbnRyaWVzCj4g
PiAgIGlycWNoaXA6IHJpc2N2LWludGM6IEFkZCBBQ1BJIHN1cHBvcnQgZm9yIEFJQQo+ID4gICBp
cnFjaGlwOiByaXNjdi1pbXNpYzogQWRkIEFDUEkgc3VwcG9ydAo+ID4gICBpcnFjaGlwOiByaXNj
di1hcGxpYzogQWRkIEFDUEkgc3VwcG9ydAo+ID4gICBpcnFjaGlwOiBpcnEtc2lmaXZlLXBsaWM6
IEFkZCBBQ1BJIHN1cHBvcnQKPiA+ICAgQUNQSTogYnVzOiBBZGQgUklOVEMgSVJRIG1vZGVsIGZv
ciBSSVNDLVYKPiA+ICAgQUNQSTogYnVzOiBBZGQgYWNwaV9yaXNjdl9pbml0IGZ1bmN0aW9uCj4g
PiAgIEFDUEk6IFJJU0MtVjogQ3JlYXRlIEFQTElDIHBsYXRmb3JtIGRldmljZQo+ID4gICBBQ1BJ
OiBSSVNDLVY6IENyZWF0ZSBQTElDIHBsYXRmb3JtIGRldmljZQo+ID4gICBpcnFjaGlwOiByaXNj
di1pbnRjOiBTZXQgQUNQSSBpcnFtb2RlbAo+IAo+IEpGWUksIEkgaGF2ZSBubyBjYXBhY2l0eSB0
byBwcm92aWRlIGFueSBmZWVkYmFjayBvbiB0aGlzIHRpbGwgNi44LXJjMSBpcyBvdXQuCj4gCk5v
IHdvcnJpZXMhLiBJIHdpbGwgd2FpdCBmb3IgeW91ciBmZWVkYmFjay4KClRoYW5rcyEKU3VuaWwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
