Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B16C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 08:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fF46UxpCL8K3bsy2xwwrVIHpQIAYDtSagNb1CZn6aw0=; b=HotzFx/PwgStwd
	J7dGHqHDSUGGttwYZ9uzDWaMPxmd9HOYmqLcSX/SuoM9mTbqqJHZhqD/SvPCq84q0K7fYz2GFBBNS
	+F742xDe0aaZssxwTu8CdyeobDb8vNUU4j9Z7wLXybz74Ja/XHdIxzyNarhWfmcDL8z0YYsu5RY8c
	HvAJiBJV0E8i7mrJpo0HLe6uHuO4QygVc8uyvZLC+AlEectLLEFfTElQd8gWo4/f3iT0o9MJh1/8M
	R928vES/euJdx+VNNvX9Mr6mUglIX/ApogXnJKVLA3ePfZvnbXFqugxwp087RnJRsC7WXkn9PpMjv
	NhW59gWb6ELhOiQZmbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6pc-0000000D2dX-0NxW;
	Fri, 28 Jun 2024 08:19:44 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN6pZ-0000000D2cu-1hoD
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 08:19:42 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7f38da3800aso11803139f.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 01:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719562780; x=1720167580; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/qO9FkT/vVabsz0HBj+1khfm42T6GUcPufAI2E8LYM=;
        b=m8HQpEAAuUT3fFMQ0DrzINAhgGSZ6HV/SByOqZKDn3QPXtwJTD96OLgHNtCfO3oZ+S
         GKZIPYLsMMPSn/hnctPZVGcpv+9PQP+7IrjJU0kSTNcCH/nuZq7mWwaJysIjb2ZFSr+7
         fwxeeHBztykUDwna6i7ynirxphzdzxf972AtRTwnglRbRwMbnT+1EFo1rv90MFmg2squ
         enI7xYjm7hgzUTItDvPeMmcMh/g9TLF1obiEP2RrPZvtMLykfD2Mzw4olbom3Mbew2K0
         Nua3JvlW0BmeJzVHZPBwkgI9oVMTZFnAgWaBIZup7U29DuJBYnC5Ysgd+wkPdV6Vgnhq
         4inQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562780; x=1720167580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/qO9FkT/vVabsz0HBj+1khfm42T6GUcPufAI2E8LYM=;
        b=ZFlQdr2bzxm/km+fxMGCmDTcdLNXdyS8AZFOcKFNR61NCv0VLNVC59Vteq1e2aPxyf
         22RhWUkUYEfLUrEvlaxkVXWhNj1nxtW5Slx4MT99bCLLEakyOUA5zvJAgzBqjK5X53hJ
         MYbCrOLN69bsEVLEAgkafaXUUXxa7yli4jdnqD2m8eBxunaYLlFo99kV6oK0imDbx+6s
         IMSYYLVkItWPyDqfTX6EpQygAwRxZV7fZwVByvKrK6vRz9nNHk7L2LwEnbkBj6qyk8N9
         Cr6ZjgIjzeKoS3VMVZYh3aa8rk4F3F/wzTVkbtq33N2F3ZKGpjWEFvvXaa2YcK+5ifkP
         jkyg==
X-Forwarded-Encrypted: i=1; AJvYcCUVyrO8bDwNzVFt/DoR5qFym1AcI245apUfc0KdX/KfXB2VbBWG4Y75dI4Jk8nNZfn56WDb4K5790fTlW0cW7N1x9YxKvdn0kcmzS639k4Y
X-Gm-Message-State: AOJu0YzxcXMkXOaJr+WSbaYyP9iTtVAi1U+f21kQsm5ipsslP8FgX2YO
	TYdskwoacVes0nQS1WMirKf2SJyxIfNOJys8DeVNIzpqP+tpXWHNud1akW893xqc+eVtg8WR9Lu
	tk56Mn5SD5Bk3+cQweR80usjQC/4We4Ag8aF/fw==
X-Google-Smtp-Source: AGHT+IHn2evgOJLaaJiRgXsD5cceTO6G9y4KoRv5dNvVpAYoPqBKVn2PGWboQ5lMNsbOksImkAt4wfLp1T5FCVkhq0I=
X-Received: by 2002:a05:6602:2cd5:b0:7f3:d2d5:f06a with SMTP id
 ca18e2360f4ac-7f3d2d5f2acmr952657739f.13.1719562779958; Fri, 28 Jun 2024
 01:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240614142156.29420-1-zong.li@sifive.com> <20240614142156.29420-9-zong.li@sifive.com>
 <20240619161740.GP1091770@ziepe.ca>
In-Reply-To: <20240619161740.GP1091770@ziepe.ca>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 28 Jun 2024 16:19:28 +0800
Message-ID: <CANXhq0pgQMHGVv12K0s9ovd0OkOa15QCdH4HMfZGCy5hYXSWMw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/10] iommu/riscv: support nested iommu for
 flushing cache
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	tjeznach@rivosinc.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kevin.tian@intel.com, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_011941_506045_65D11C73 
X-CRM114-Status: GOOD (  31.63  )
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

T24gVGh1LCBKdW4gMjAsIDIwMjQgYXQgMTI6MTfigK9BTSBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6
aWVwZS5jYT4gd3JvdGU6Cj4KPiBPbiBGcmksIEp1biAxNCwgMjAyNCBhdCAxMDoyMTo1NFBNICsw
ODAwLCBab25nIExpIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBpbXBsZW1lbnRzIGNhY2hlX2ludmFs
aWRhdGVfdXNlciBvcGVyYXRpb24gZm9yIHRoZSB1c2Vyc3BhY2UKPiA+IHRvIGZsdXNoIHRoZSBo
YXJkd2FyZSBjYWNoZXMgZm9yIGEgbmVzdGVkIGRvbWFpbiB0aHJvdWdoIGlvbW11ZmQuCj4gPgo+
ID4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29tPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jICB8IDkwICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQo+ID4gIGluY2x1ZGUvdWFwaS9saW51eC9pb21tdWZkLmggfCAxMSAr
KysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgOTcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jIGIvZHJp
dmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPiBpbmRleCA0MTBiMjM2ZTliMjQuLmQwOGViMGEy
OTM5ZSAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUuYwo+ID4gKysr
IGIvZHJpdmVycy9pb21tdS9yaXNjdi9pb21tdS5jCj4gPiBAQCAtMTU4Nyw4ICsxNTg3LDkgQEAg
c3RhdGljIGludCByaXNjdl9pb21tdV9hdHRhY2hfZGV2X25lc3RlZChzdHJ1Y3QgaW9tbXVfZG9t
YWluICpkb21haW4sIHN0cnVjdCBkZXYKPiA+ICAgICAgIGlmIChyaXNjdl9pb21tdV9ib25kX2xp
bmsocmlzY3ZfZG9tYWluLCBkZXYpKQo+ID4gICAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsK
PiA+Cj4gPiAtICAgICByaXNjdl9pb21tdV9pb3RsYl9pbnZhbChyaXNjdl9kb21haW4sIDAsIFVM
T05HX01BWCk7Cj4gPiAtICAgICBpbmZvLT5kY191c2VyLnRhIHw9IFJJU0NWX0lPTU1VX1BDX1RB
X1Y7Cj4gPiArICAgICBpZiAocmlzY3ZfaW9tbXVfYm9uZF9saW5rKGluZm8tPmRvbWFpbiwgZGV2
KSkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4KPiA/PyBJcyB0aGlzIGluIHRo
ZSB3cm9uZyBwYXRjaCB0aGVuPyBDb25mdXNlZAoKWWVzLCBpdCBzaG91bGQgYmUgaW4gN3RoIHBh
dGNoIGluIHRoaXMgc2VyaWVzLiBJIHdpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbi4KCj4KPiA+
ICAgICAgIHJpc2N2X2lvbW11X2lvZGlyX3VwZGF0ZShpb21tdSwgZGV2LCAmaW5mby0+ZGNfdXNl
cik7Cj4gPgo+ID4gICAgICAgaW5mby0+ZG9tYWluID0gcmlzY3ZfZG9tYWluOwo+ID4gQEAgLTE2
MTEsMTMgKzE2MTIsOTIgQEAgc3RhdGljIHZvaWQgcmlzY3ZfaW9tbXVfZG9tYWluX2ZyZWVfbmVz
dGVkKHN0cnVjdCBpb21tdV9kb21haW4gKmRvbWFpbikKPiA+ICAgICAgIGtmcmVlKHJpc2N2X2Rv
bWFpbik7Cj4gPiAgfQo+ID4KPiA+ICtzdGF0aWMgaW50IHJpc2N2X2lvbW11X2ZpeF91c2VyX2Nt
ZChzdHJ1Y3QgcmlzY3ZfaW9tbXVfY29tbWFuZCAqY21kLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBwc2NpZCwgdW5zaWduZWQgaW50IGdzY2lkKQo+
ID4gK3sKPiA+ICsgICAgIHUzMiBvcGNvZGUgPSBGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfQ01EX09Q
Q09ERSwgY21kLT5kd29yZDApOwo+ID4gKwo+ID4gKyAgICAgc3dpdGNoIChvcGNvZGUpIHsKPiA+
ICsgICAgIGNhc2UgUklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX09QQ09ERToKPiA+ICsgICAgICAg
ICAgICAgdTMyIGZ1bmMgPSBGSUVMRF9HRVQoUklTQ1ZfSU9NTVVfQ01EX0ZVTkMsIGNtZC0+ZHdv
cmQwKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgaWYgKGZ1bmMgIT0gUklTQ1ZfSU9NTVVfQ01E
X0lPVElOVkFMX0ZVTkNfR1ZNQSAmJgo+ID4gKyAgICAgICAgICAgICAgICAgZnVuYyAhPSBSSVND
Vl9JT01NVV9DTURfSU9USU5WQUxfRlVOQ19WTUEpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBwcl93YXJuKCJUaGUgSU9USU5WQUwgZnVuY3Rpb246IDB4JXggaXMgbm90IHN1cHBvcnRlZFxu
IiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZ1bmMpOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+ICsgICAgICAgICAgICAgfQo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICBpZiAoZnVuYyA9PSBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxf
RlVOQ19HVk1BKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgY21kLT5kd29yZDAgJj0gflJJ
U0NWX0lPTU1VX0NNRF9GVU5DOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGNtZC0+ZHdvcmQw
IHw9IEZJRUxEX1BSRVAoUklTQ1ZfSU9NTVVfQ01EX0ZVTkMsCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxf
RlVOQ19WTUEpOwo+ID4gKyAgICAgICAgICAgICB9Cj4gPiArCj4gPiArICAgICAgICAgICAgIGNt
ZC0+ZHdvcmQwICY9IH4oUklTQ1ZfSU9NTVVfQ01EX0lPVElOVkFMX1BTQ0lEIHwKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBSSVNDVl9JT01NVV9DTURfSU9USU5WQUxfR1NDSUQp
Owo+ID4gKyAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X3BzY2lkKGNtZCwg
cHNjaWQpOwo+ID4gKyAgICAgICAgICAgICByaXNjdl9pb21tdV9jbWRfaW52YWxfc2V0X2dzY2lk
KGNtZCwgZ3NjaWQpOwo+ID4gKyAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgIGNhc2UgUklT
Q1ZfSU9NTVVfQ01EX0lPRElSX09QQ09ERToKPiA+ICsgICAgICAgICAgICAgLyoKPiA+ICsgICAg
ICAgICAgICAgICogRW5zdXJlIHRoZSBkZXZpY2UgSUQgaXMgcmlnaHQuIFdlIGV4cGVjdCB0aGF0
IFZNTSBoYXMKPiA+ICsgICAgICAgICAgICAgICogdHJhbnNmZXJyZWQgdGhlIGRldmljZSBJRCB0
byBob3N0J3MgZnJvbSBndWVzdCdzLgo+ID4gKyAgICAgICAgICAgICAgKi8KPgo+IEknbSBub3Qg
c3VyZSB3aGF0IHRoaXMgcmVtYXJrIG1lYW5zLCBidXQgSSBleHBlY3QgeW91IHdpbGwgbmVlZCB0
bwo+IHRyYW5zbGF0ZSBhbnkgZGV2aWNlcyBJRHMgZnJvbSB2aXJ0dWFsIHRvIHBoeXNpY2FsLgoK
SSB0aGluayB3ZSBuZWVkIHNvbWUgZGF0YSBzdHJ1Y3R1cmUgdG8gbWFwIGl0LiBJIGRpZG4ndCBk
byB0aGF0IGhlcmUKYmVjYXVzZSBvdXIgaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gdHJhbnNsYXRl
cyB0aGUgcmlnaHQgSUQgaW4gVk1NLApidXQgYXMgeW91IG1lbnRpb25lZCwgd2UgY2FuJ3QgZXhw
ZWN0IHRoYXQgVk1NIHdpbGwgZG8gdGhhdCBmb3IKa2VybmVsLgoKPgo+ID4KPiA+ICBzdGF0aWMg
aW50Cj4gPiAtcmlzY3ZfaW9tbXVfZ2V0X2RjX3VzZXIoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgaW9tbXVfaHdwdF9yaXNjdl9pb21tdSAqdXNlcl9hcmcpCj4gPiArcmlzY3ZfaW9tbXVfZ2V0
X2RjX3VzZXIoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgaW9tbXVfaHdwdF9yaXNjdl9pb21t
dSAqdXNlcl9hcmcsCj4gPiArICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHJpc2N2X2lvbW11
X2RvbWFpbiAqczFfZG9tYWluKQo+ID4gIHsKPiA+ICAgICAgIHN0cnVjdCBpb21tdV9md3NwZWMg
KmZ3c3BlYyA9IGRldl9pb21tdV9md3NwZWNfZ2V0KGRldik7Cj4gPiAgICAgICBzdHJ1Y3Qgcmlz
Y3ZfaW9tbXVfZGV2aWNlICppb21tdSA9IGRldl90b19pb21tdShkZXYpOwo+ID4gQEAgLTE2NjMs
NiArMTc0Myw4IEBAIHJpc2N2X2lvbW11X2dldF9kY191c2VyKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGlvbW11X2h3cHRfcmlzY3ZfaW9tbXUgKnVzZXJfCj4gPiAgICAgICAgICAgICAgICAg
ICAgICByaXNjdl9pb21tdV9nZXRfZGMoaW9tbXUsIGZ3c3BlYy0+aWRzW2ldKSwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgIHNpemVvZihzdHJ1Y3QgcmlzY3ZfaW9tbXVfZGMpKTsKPiA+ICAgICAg
ICAgICAgICAgaW5mby0+ZGNfdXNlci5mc2MgPSBkYy5mc2M7Cj4gPiArICAgICAgICAgICAgIGlu
Zm8tPmRjX3VzZXIudGEgPSBGSUVMRF9QUkVQKFJJU0NWX0lPTU1VX1BDX1RBX1BTQ0lELCBzMV9k
b21haW4tPnBzY2lkKSB8Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFJJU0NWX0lPTU1VX1BDX1RBX1Y7Cj4gPiAgICAgICB9Cj4KPiBJdCBpcyByZWFsbHkg
d2VpcmQgdGhhdCB0aGUgczEgZG9tYWluIGhhcyBhbnkga2luZCBvZiBpZC4gV2hhdCBpcyB0aGUK
PiBQU0NJRD8gSXMgaXQgYW5hbG9nb3VzIHRvIFZNSUQgb24gQVJNPwoKSSB0aGluayB0aGUgVk1J
RCBpcyBjbG9zZXIgdG8gdGhlIEdTQ0lELiBUaGUgUFNDSUQgbWlnaHQgYmUgbW9yZSBsaWtlCnRo
ZSBBU0lELCBhcyBpdCBpcyB1c2VkIGFzIHRoZSBhZGRyZXNzIHNwYWNlIElEIGZvciB0aGUgcHJv
Y2VzcwppZGVudGlmaWVkIGJ5IHRoZSBmaXJzdC1zdGFnZSBwYWdlIHRhYmxlLgpUaGUgR1NDSUQg
dXNlZCB0byB0YWcgdGhlIEctc3RhZ2UgVExCLCB0aGUgUFNDSUQgaXMgdXNlZCB0byB0YWcgdGhl
CnNpbmdsZSBzdGFnZSBUTEIgYW5kIHRoZSB0dXBsZSB7R1NDSUQsIFBTQ0lEfSBpcyB1c2VkIHRv
IHRhZyB0aGUKVlMtc3RhZ2UgVExCLiBUaGUgSU9USU5WQUwuVk1BIGNvbW1hbmQgY2FuIGZsdXNo
IHRoZSBtYXBwaW5nIGJ5Cm1hdGNoaW5nIEdTQ0lEIG9ubHksIFBTQ0lEIG9ubHkgb3IgdGhlIHR1
cGxlIHtHU0NJRCwgUFNDSUR9LiBXZSBjYW4KY29uc2lkZXIgdGhlIHNpdHVhdGlvbiB0aGF0IHRo
ZXJlIGFyZSB0d28gZGV2aWNlcyBwYXNzIHRocm91Z2ggdG8gYQpndWVzdCwgdGhlbiB3ZSB3aWxs
IGhhdmUgdHdvIHMxIGRvbWFpbnMgdW5kZXIgdGhlIHNhbWUgczIgZG9tYWluLCBhbmQKd2UgY2Fu
IGZsdXNoIHRoZWlyIG1hcHBpbmcgYnkgeyBHU0NJRCwgUFNDSUQgfSBhbmQgeyBHU0NJRCwgUFND
SUQnIH0KcmVzcGVjdGl2ZWx5LgoKPgo+IEphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
