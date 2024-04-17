Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7771C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 01:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GJFo/5CSLcG7utFPRpUdEtxMZ4yPj9bjqtQQurywuMg=; b=w8YoW5urJapuAT
	gPo6OLIzIeLXBbFYDi6VuIDuWfIul/TVZcaaArTOE+hvt+e+kMQhlbvam8rPi6KVUV7mSfO0gJaoD
	fFxw0ra+HTNxayB5X8fk2fttOqfKvk5TtOBwbpQlGV6JpjwELnZ1KWH/9VlJL6bv1gJ2aGH8k8YEC
	algaj76BOAar9TODqN/kLf+g5jXsbKxf62j+OFqLnBr6cpoo2TSZu/0/8YUBTPQzWsGMNFLADKdZz
	fagzlNj+sNi6x+tBQHzt71flIsYIG1fYY1VsIzW2/5e224+1z029rpkujYQtnuTJpFjDSyOqMfYjZ
	jJ0vd5VwSbWut7s8+2lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwtid-0000000ELWr-3YVQ;
	Wed, 17 Apr 2024 01:04:11 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwtiV-0000000ELWF-3XYE
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 01:04:10 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-434b5abbb0dso109751cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 18:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713315841; x=1713920641; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DkfTVjPD3XwT0FdLWkEiWLmQxyUXEV4QDw4WnoToh/k=;
        b=iGYM98QJNvyxCpJV8Vu5IfuHzaWrlClYmUHXvyb/a+LQJEKJFER1U0pZbudL2hTY1W
         ZpXinxWs/F4Kc8Ku8lBX1IY0PoBAE3d93At3IcqhvgXmSowvCS/mrb9u4g7q1fRr3HFL
         Kz7l14ATX8gNXR9CRGLiy6zdZBfrXK+NV95qaBMJiqasgv0i/Zu8tuiFtw7NMN04aVvY
         pp/iRttqqzYDH1A60yPzAe/6dNiIZW/9BRTFNyfp/vTRVvpO8u6DVqA5F9eaJPDuEdpC
         LHJzI1HBh3h0HqUX6XhRJ+PEZIWlnTxf6XyEaLG/KR/1WR/idn/1bqEKzCHH/ABfgyWM
         M9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713315841; x=1713920641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DkfTVjPD3XwT0FdLWkEiWLmQxyUXEV4QDw4WnoToh/k=;
        b=AuJhe9E56Hb07E+3WUXmlJq3zexUd+xpeTk3/tl7dT/9Y2jfO/JOFy302Cwp7I71Pl
         ChFsj6K67mPgb+ldm4Ity6e8Z2+GW3PJLqGD46G0gAqV7urzOq9gdFs5Ju2UQPHmw+SP
         ihMaDiAP4ByMa1ywtcfmRmogWeYChiabMKID0ZRwp7GOxRf7STpuBQoqjMNUOuS4OiGh
         ImEWeWEfNmHb59oCBkRfBQGDh1twetFfLYzTSBP5B5JzpYyscbWuC/CE/sftkJbZC7on
         iA4GOu0G6Ka46hQsfmNjSP+sQpW/SS9xNzLzfxWAv+/qEwTkmE7R+yQPXoCjLdDOFVDy
         gWVg==
X-Forwarded-Encrypted: i=1; AJvYcCVcO8/KAg39T+K5AhqF+KCBTBL6k0q5JZmc5fcafrO3PEsvpnUT2jLUEqbbDpUM2v3T8sdCFbAJTQHy2/R9FhxGJAdB5p5DJLbwLQ1xu3g3
X-Gm-Message-State: AOJu0YyRdCGCLYTEyxF53SsiEUSirfKiMFxg5C3VsknzR3SyCQyY/CUo
	PciSh/s7jmTk/OutEZHM4QEfsBAINaNEaMOhVTUmLc0ic9XB77WUE9GcQ8wY7GlABs0sXjJb7Cd
	Q9RQkVJhvS7tAFVXkr9CPhKWg6F3JdwaXciGR
X-Google-Smtp-Source: AGHT+IFf/DbEiUMrNE3+3h0tNx17EZOn9EV/2/1uYIxpd1cVsA33zTZAoAPdkuvZ4k9AuW9caLh6SDxCdS61jKH0I7c=
X-Received: by 2002:ac8:580c:0:b0:436:9f37:f5e4 with SMTP id
 g12-20020ac8580c000000b004369f37f5e4mr144572qtg.8.1713315837611; Tue, 16 Apr
 2024 18:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240413091942.316054-1-apatel@ventanamicro.com> <20240416141049.GA2148267-robh@kernel.org>
In-Reply-To: <20240416141049.GA2148267-robh@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 16 Apr 2024 18:03:17 -0700
Message-ID: <CAGETcx_Ni3MjwVHDOdre1nSqQP07=gaUtCDj31ndKcMFtm+xjg@mail.gmail.com>
Subject: Re: [PATCH v2] of: property: Add fw_devlink support for interrupt-map property
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_180403_929103_80448FB3 
X-CRM114-Status: GOOD (  31.71  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBBcHIgMTYsIDIwMjQgYXQgNzoxMeKAr0FNIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU2F0LCBBcHIgMTMsIDIwMjQgYXQgMDI6NDk6NDJQTSArMDUz
MCwgQW51cCBQYXRlbCB3cm90ZToKPiA+IFNvbWUgb2YgdGhlIFBDSSBjb250cm9sbGVycyAoc3Vj
aCBhcyBnZW5lcmljIFBDSSBob3N0IGNvbnRyb2xsZXIpCj4gPiB1c2UgImludGVycnVwdC1tYXAi
IERUIHByb3BlcnR5IHRvIGRlc2NyaWJlIHRoZSBtYXBwaW5nIGJldHdlZW4KPiA+IFBDSSBlbmRw
b2ludHMgYW5kIFBDSSBpbnRlcnJ1cHQgcGlucy4gVGhpcyB0aGUgb25seSBjYXNlIHdoZXJlCj4g
PiB0aGUgaW50ZXJydXB0cyBhcmUgbm90IGRlc2NyaWJlZCBpbiBEVC4KPiA+Cj4gPiBDdXJyZW50
bHksIHRoZXJlIGlzIG5vIGZ3X2RldmxpbmsgY3JlYXRlZCBiYXNlZCBvbiAiaW50ZXJydXB0LW1h
cCIKPiA+IERUIHByb3BlcnR5CgpwYXJzZV9pbnRlcnJ1cHRzKCkgY2FsbHMgb2ZfaXJxX3BhcnNl
X29uZSgpIHRoYXQgaW4gdHVybiBjYWxscwpvZl9pcnFfcGFyc2Vfb25lKCkgdGhhdCBkb2VzIHRo
ZSAiaW50ZXJydXB0cy1tYXAiIGhhbmRsaW5nLiBJbiBmYWN0Cm9mX2lycV9wYXJzZV9wY2koKSBh
bHNvIGNhbGxzIG9mX2lycV9wYXJzZV9vbmUoKSBpZiB0aGUgUENJIGRldmljZSBoYXMKYSBEVCBu
b2RlLiBTbyBJIGRvbid0IHRoaW5rIGFueSBuZXcgZnVuY3Rpb25hbGl0eSBuZWVkcyB0byBiZSBh
ZGRlZC4KSWYgSSdtIG5vdCBtaXN0YWtlbiB3ZSBqdXN0IG5lZWQgcGFyc2VfaW50ZXJydXB0cyB0
byBub3QgaWdub3JlCmludGVycnVwdHMtbWFwPyBBIG9uZSBsaW5lIGNoYW5nZT8KCldoeSBkbyB3
ZSBuZWVkIGFsbCBvZiB0aGlzIGNvZGUgeW91IHdyb3RlIGJlbG93PwoKLVNhcmF2YW5hCgo+ID4g
IHNvIGludGVycnVwdCBjb250cm9sbGVyIGlzIG5vdCBndWFyYW50ZWVkIHRvIGJlIHByb2JlZAo+
ID4gYmVmb3JlIFBDSSBob3N0IGNvbnRyb2xsZXIuIFRoaXMgYWZmZWN0cyBldmVyeSBwbGF0Zm9y
bSB3aGVyZSBib3RoCj4gPiBQQ0kgaG9zdCBjb250cm9sbGVyIGFuZCBpbnRlcnJ1cHQgY29udHJv
bGxlcnMgYXJlIHByb2JlZCBhcyByZWd1bGFyCj4gPiBwbGF0Zm9ybSBkZXZpY2VzLgo+ID4KPiA+
IFRoaXMgY3JlYXRlcyBmd19kZXZsaW5rIGJldHdlZW4gY29uc3VtZXJzIChQQ0kgaG9zdCBjb250
cm9sbGVyKSBhbmQKPiA+IHN1cHBsaWVyIChpbnRlcnJ1cHQgY29udHJvbGxlcikgYmFzZWQgb24g
ImludGVycnVwdC1tYXAiIERUIHByb3BlcnR5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEFudXAg
UGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0tCj4gPiBDaGFuZ2VzIHNpbmNl
IHYxOgo+ID4gLSBVcGRhdGVkIGNvbW1pdCBkZXNjcmlwdGlvbiBiYXNlZCBvbiBSb2IncyBzdWdn
ZXN0aW9uCj4gPiAtIFVzZSBvZl9pcnFfcGFyc2VfcmF3KCkgZm9yIHBhcnNpbmcgaW50ZXJydXB0
LW1hcCBEVCBwcm9wZXJ0eQo+ID4gLS0tCj4gPiAgZHJpdmVycy9vZi9wcm9wZXJ0eS5jIHwgNTgg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2Yv
cHJvcGVydHkuYyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gaW5kZXggYTYzNThlZTk5Yjc0
Li42N2JlNjYzODRkYWMgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL29mL3Byb3BlcnR5LmMKPiA+
ICsrKyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+ID4gQEAgLTEzMTEsNiArMTMxMSw2MyBAQCBz
dGF0aWMgc3RydWN0IGRldmljZV9ub2RlICpwYXJzZV9pbnRlcnJ1cHRzKHN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnAsCj4gPiAgICAgICByZXR1cm4gb2ZfaXJxX3BhcnNlX29uZShucCwgaW5kZXgsICZz
dXBfYXJncykgPyBOVUxMIDogc3VwX2FyZ3MubnA7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgc3Ry
dWN0IGRldmljZV9ub2RlICpwYXJzZV9pbnRlcnJ1cHRfbWFwKHN0cnVjdCBkZXZpY2Vfbm9kZSAq
bnAsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25z
dCBjaGFyICpwcm9wX25hbWUsIGludCBpbmRleCkKPiA+ICt7Cj4gPiArICAgICBjb25zdCBfX2Jl
MzIgKmltYXAsICppbWFwX2VuZCwgKmFkZHI7Cj4gPiArICAgICBzdHJ1Y3Qgb2ZfcGhhbmRsZV9h
cmdzIHN1cF9hcmdzOwo+ID4gKyAgICAgc3RydWN0IGRldmljZV9ub2RlICp0biwgKmlwYXI7Cj4g
PiArICAgICB1MzIgYWRkcmNlbGxzLCBpbnRjZWxsczsKPiA+ICsgICAgIGludCBpLCBqLCBpbWFw
bGVuOwo+ID4gKwo+ID4gKyAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19PRl9JUlEpKQo+ID4g
KyAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsKPiA+ICsgICAgIGlmIChzdHJjbXAocHJv
cF9uYW1lLCAiaW50ZXJydXB0LW1hcCIpKQo+ID4gKyAgICAgICAgICAgICByZXR1cm4gTlVMTDsK
PiA+ICsKPiA+ICsgICAgIGlwYXIgPSBvZl9ub2RlX2dldChucCk7Cj4gPiArICAgICBkbyB7Cj4g
PiArICAgICAgICAgICAgIGlmICghb2ZfcHJvcGVydHlfcmVhZF91MzIoaXBhciwgIiNpbnRlcnJ1
cHQtY2VsbHMiLCAmaW50Y2VsbHMpKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+
ID4gKyAgICAgICAgICAgICB0biA9IGlwYXI7Cj4gPiArICAgICAgICAgICAgIGlwYXIgPSBvZl9p
cnFfZmluZF9wYXJlbnQoaXBhcik7Cj4gPiArICAgICAgICAgICAgIG9mX25vZGVfcHV0KHRuKTsK
PiA+ICsgICAgIH0gd2hpbGUgKGlwYXIpOwo+Cj4gTm8gbmVlZCBmb3IgdGhpcyBsb29wLiBXZSd2
ZSBvbmx5IGdvdHRlbiBoZXJlIGlmICdpbnRlcnJ1cHQtbWFwJyBpcwo+IHByZXNlbnQgaW4gdGhl
IG5vZGUgYW5kICcjaW50ZXJydXB0LWNlbGxzJyBpcyByZXF1aXJlZCBpZgo+ICdpbnRlcnJ1cHQt
bWFwJyBpcyBwcmVzZW50Lgo+Cj4gPiArICAgICBpZiAoIWlwYXIpCj4gPiArICAgICAgICAgICAg
IHJldHVybiBOVUxMOwo+ID4gKyAgICAgYWRkcmNlbGxzID0gb2ZfYnVzX25fYWRkcl9jZWxscyhp
cGFyKTsKPiA+ICsgICAgIG9mX25vZGVfcHV0KGlwYXIpOwo+ID4gKwo+ID4gKyAgICAgaW1hcCA9
IG9mX2dldF9wcm9wZXJ0eShucCwgImludGVycnVwdC1tYXAiLCAmaW1hcGxlbik7Cj4gPiArICAg
ICBpZiAoIWltYXAgfHwgaW1hcGxlbiA8PSAoYWRkcmNlbGxzICsgaW50Y2VsbHMpKQo+ID4gKyAg
ICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsgICAgIGltYXBfZW5kID0gaW1hcCArIGltYXBs
ZW47Cj4gPiArCj4gPiArICAgICBzdXBfYXJncy5ucCA9IE5VTEw7Cj4gPiArICAgICBmb3IgKGkg
PSAwOyBpIDw9IGluZGV4ICYmIGltYXAgPCBpbWFwX2VuZDsgaSsrKSB7Cj4gPiArICAgICAgICAg
ICAgIGlmIChzdXBfYXJncy5ucCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVf
cHV0KHN1cF9hcmdzLm5wKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBzdXBfYXJncy5ucCA9
IE5VTEw7Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgICAgICAgYWRkciA9
IGltYXA7Cj4gPiArICAgICAgICAgICAgIGltYXAgKz0gYWRkcmNlbGxzOwo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICBzdXBfYXJncy5ucCA9IG5wOwo+ID4gKyAgICAgICAgICAgICBzdXBfYXJncy5h
cmdzX2NvdW50ID0gaW50Y2VsbHM7Cj4gPiArICAgICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBp
bnRjZWxsczsgaisrKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHN1cF9hcmdzLmFyZ3Nbal0g
PSBiZTMyX3RvX2NwdShpbWFwW2pdKTsKPiA+ICsgICAgICAgICAgICAgaW1hcCArPSBpbnRjZWxs
czsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKG9mX2lycV9wYXJzZV9yYXcoYWRkciwgJnN1
cF9hcmdzKSkKPiA+ICsgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPiA+ICsgICAg
ICAgICAgICAgaW1hcCArPSBzdXBfYXJncy5hcmdzX2NvdW50ICsgMTsKPiA+ICsgICAgIH0KPgo+
IERvZXNuJ3QgdGhpcyBsZWFrIGEgcmVmIG9uIHRoZSBsYXN0IHRpbWUgdGhlIGZ1bmN0aW9uIGlz
IGludm9rZWQ/IEZvcgo+IGV4YW1wbGUsIGlmIHdlIGhhdmUgMiBlbnRyaWVzIGFuZCBpbmRleCBp
cyAyLiBXZSdsbCBnZXQgaW5kZXg9MSwgYnV0Cj4gdGhlbiBleGl0IGJlY2F1c2UgaW1hcD09aW1h
cF9lbmQuIFdlIG5lZWQgYSBwdXQgb24gaW5kZXg9PTEgbm9kZS4KPgo+IExvb2sgYXQgbXkgbmV4
dCBicmFuY2ggd2hlcmUgSSd2ZSBjb252ZXJ0ZWQgdGhpbmdzIHRvIHVzZSBfX2ZyZWUoKQo+IGNs
ZWFudXBzLiBJIGRvbid0IHNlZSBpdCBoZWxwaW5nIGhlcmUgYXMtaXMsIGJ1dCBtYXliZSB3aGVu
IGl0IGlzCj4gY29ycmVjdC4KPgo+IFJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
