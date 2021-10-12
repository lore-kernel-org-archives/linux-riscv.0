Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC01C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 00:55:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F32C560EE2
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 00:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F32C560EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nq8kIU0D1wNMIGQh2Fo8mwXmNYUjY9OCPBIsmT8CoVs=; b=fT6NtCx0guZcqp
	ghSDKp1LQlf5ALbMX9f1eZ55l/dR7b5xd5Ihp/y5gzVSsTOGwXEdMVW0Iz+ZMjw/WKiXV6xzDrxWQ
	+CGSN5ltjGDpc950hWC94nny/o2AXQrLfzPErkdp5rSGSxDqqkVVz8Cq6sC5GmRVjuepwZp5O0xLp
	M3VgmLHvNX67BlXEWpSeTLPzM6Hx3NO0aJqlzZq5rx8Dje1H9VlAkCMyekniHD+U+1Wl9cGYpfHQR
	j6RZ/yBomVMiEKIzT90aSYQwbMAEWR9evdrKU67UAgM/wVIIB5AhThHZ8mk0w6Sy45Zrc5jS8lOdC
	VdZCYLIoTLHvRcpZnN+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma64h-00B70l-3g; Tue, 12 Oct 2021 00:55:23 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma63g-00B6ef-R5
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 00:54:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id m22so61580266wrb.0
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 17:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/ncnaD26X/UBXH1jDnofX2X5t1TXsmS8IeZbZwTuTT0=;
 b=2tyXQPIuTCJVQeHdTmecUXm097J2f8VrYJdpSh2jjUOoeFCIG4dVdhYeV0I0luOHyG
 f7MusH1iiwM9Pub3gBSo5IeaZlKbkEayBEdLRr7pi7LlT4FFstCgBKkRIhepXi0DEOp1
 Xrg1d0+WYXvN5tEIpz4XfnkrMZaDXoDYDcDsEfXqp4ptrbPDCm7Xp84ZczmtpcR7GOGZ
 OQ3DHXJGybknJ7OvHXXFOcpMwftSN47sMGKB01NPi+lgP4sHjK05RC4PmjMo2cwB5u2U
 wSskp3sWXd7SJ0i37XPRFBOEZIAfDPT12jooOoZOMoKHnMNQsE6eYspAx6x7cetZybao
 I3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/ncnaD26X/UBXH1jDnofX2X5t1TXsmS8IeZbZwTuTT0=;
 b=PVjBwmrVaV1xR+uK1OsCNxnxvvGkcPgVbCS0SOJRfsznuYeSshsYvDnJQ3j42NTRa8
 uCEmFInB44njya+iLRoxEZv3GMOE0hQVj+BaEtyc5VU1vuQm1sT7HJGPdKgnpTGR5mpx
 UtbNTKBD6YNlUQYFgQNzqzAOFDmRt2yfJmyTf+mE2CfyYzd29qY0gevsZr6yTytItQsa
 0uk7H1iDTW/EkAs1Ppg43Ds2rQrmCI77neDNAdsxGmNK+Q5jzx3FkH2W/M+AapMQUUEo
 yA9oViCYl6yVf19xUYN5ThGVrKDdNd+L5zfQyCH7pxANG7SB3YTCYRfJ3kmYAku6yWOg
 oybw==
X-Gm-Message-State: AOAM531C3NzRE9rJtuNA5AJLgomYgLN1QyoJU2C8KQD4Ve6+WMMUPOwf
 ALABIWcePjL93CzoALatl7vD3nsfYituwrZaAEyRIQ==
X-Google-Smtp-Source: ABdhPJyvzMX6zyEq4jQHSpgK+w9LNXwraC3Ngj4XFOnaT0BiC/mAGAEM3+8LeP3Ow+tFlGuxcsowI0rLPQkF8oSdK2E=
X-Received: by 2002:adf:f949:: with SMTP id q9mr28343183wrr.331.1634000059274; 
 Mon, 11 Oct 2021 17:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211011081820.1135261-1-anup.patel@wdc.com>
 <20211011081820.1135261-2-anup.patel@wdc.com>
 <30695639.mNO2d7px6N@diego>
In-Reply-To: <30695639.mNO2d7px6N@diego>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Oct 2021 06:24:07 +0530
Message-ID: <CAAhSdy0C6rcavMiPgzxejrxevjvorM=BWbtO8gLMTATSg9DUHg@mail.gmail.com>
Subject: Re: [PATCH v8 1/8] RISC-V: Enable CPU_IDLE drivers
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 DTML <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 "open list:THERMAL" <linux-pm@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Anup Patel <anup.patel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_175420_977403_4ED91970 
X-CRM114-Status: GOOD (  28.80  )
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

T24gVHVlLCBPY3QgMTIsIDIwMjEgYXQgMzozNCBBTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250
ZWNoLmRlPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBBbSBNb250YWcsIDExLiBPa3RvYmVyIDIw
MjEsIDEwOjE4OjEzIENFU1Qgc2NocmllYiBBbnVwIFBhdGVsOgo+ID4gV2UgZm9yY2Ugc2VsZWN0
IENQVV9QTSBhbmQgcHJvdmlkZSBhc20vY3B1aWRsZS5oIHNvIHRoYXQgd2UgY2FuCj4gPiB1c2Ug
Q1BVIElETEUgZHJpdmVycyBmb3IgTGludXggUklTQy1WIGtlcm5lbC4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsQHdkYy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNo
L3Jpc2N2L0tjb25maWcgICAgICAgICAgICAgICAgfCAgNyArKysrKysrCj4gPiAgYXJjaC9yaXNj
di9jb25maWdzL2RlZmNvbmZpZyAgICAgIHwgIDEgKwo+ID4gIGFyY2gvcmlzY3YvY29uZmlncy9y
djMyX2RlZmNvbmZpZyB8ICAxICsKPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWlkbGUu
aCAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICBhcmNoL3Jpc2N2L2tlcm5lbC9w
cm9jZXNzLmMgICAgICAgfCAgMyArKy0KPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9jcHVpZGxlLmgKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29u
ZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4gPiBpbmRleCA4ZGUyYWZiNDYwZjcuLmQwMmYxZjVh
MjQzMSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZwo+ID4gKysrIGIvYXJjaC9y
aXNjdi9LY29uZmlnCj4gPiBAQCAtNDYsNiArNDYsNyBAQCBjb25maWcgUklTQ1YKPiA+ICAgICAg
IHNlbGVjdCBDTE9ORV9CQUNLV0FSRFMKPiA+ICAgICAgIHNlbGVjdCBDTElOVF9USU1FUiBpZiAh
TU1VCj4gPiAgICAgICBzZWxlY3QgQ09NTU9OX0NMSwo+ID4gKyAgICAgc2VsZWN0IENQVV9QTSBp
ZiBDUFVfSURMRQo+ID4gICAgICAgc2VsZWN0IEVEQUNfU1VQUE9SVAo+ID4gICAgICAgc2VsZWN0
IEdFTkVSSUNfQVJDSF9UT1BPTE9HWSBpZiBTTVAKPiA+ICAgICAgIHNlbGVjdCBHRU5FUklDX0FU
T01JQzY0IGlmICE2NEJJVAo+ID4gQEAgLTU2NCw1ICs1NjUsMTEgQEAgc291cmNlICJrZXJuZWwv
cG93ZXIvS2NvbmZpZyIKPiA+Cj4gPiAgZW5kbWVudQo+ID4KPiA+ICttZW51ICJDUFUgUG93ZXIg
TWFuYWdlbWVudCIKPiA+ICsKPiA+ICtzb3VyY2UgImRyaXZlcnMvY3B1aWRsZS9LY29uZmlnIgo+
ID4gKwo+ID4gK2VuZG1lbnUKPiA+ICsKPiA+ICBzb3VyY2UgImFyY2gvcmlzY3Yva3ZtL0tjb25m
aWciCj4gPiAgc291cmNlICJkcml2ZXJzL2Zpcm13YXJlL0tjb25maWciCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyBiL2FyY2gvcmlzY3YvY29uZmlncy9kZWZj
b25maWcKPiA+IGluZGV4IGJlMjFmNTRlOWI5MS4uMzliNGMzMmU3OTk3IDEwMDY0NAo+ID4gLS0t
IGEvYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZwo+ID4gKysrIGIvYXJjaC9yaXNjdi9jb25m
aWdzL2RlZmNvbmZpZwo+ID4gQEAgLTIwLDYgKzIwLDcgQEAgQ09ORklHX1NPQ19TSUZJVkU9eQo+
ID4gIENPTkZJR19TT0NfVklSVD15Cj4gPiAgQ09ORklHX1NNUD15Cj4gPiAgQ09ORklHX0hPVFBM
VUdfQ1BVPXkKPiA+ICtDT05GSUdfQ1BVX0lETEU9eQo+ID4gIENPTkZJR19WSVJUVUFMSVpBVElP
Tj15Cj4gPiAgQ09ORklHX0tWTT15Cj4gPiAgQ09ORklHX0pVTVBfTEFCRUw9eQo+Cj4gVGhpcyBk
b2Vzbid0IGFwcGx5Lgo+Cj4gSW4gdGhlIGhpc3Rvcnkgb2YgeW91ciB0cmVlIHRoYXQgeW91IHJl
ZmVyZW5jZWQgaW4gdGhlIGNvdmVyLWxldHRlcgo+IEkgZm91bmQgIlJJU0MtVjogRW5hYmxlIEtW
TSBmb3IgUlY2NCBhbmQgUlYzMiIKPiB3aXRoIHRoYXQgbmljZSAiRE8gTk9UIFVQU1RSRUFNICEh
ISEhIiBtZXNzYWdlIGluIGNhcHMgaW4gaXQgOy0pCj4KPiBUaGlzIG9mIGNvdXJzZSBtYWtlcyB0
aGlzIG5vdCBhcHBseSBvbiB0aGUgbWFpbiByaXNjdiB0cmVlLgo+Cj4gU28geW91IG1pZ2h0IHdh
bnQgdG8gYmFzZSB5b3VyIHNlcmllcyBvbiB0b3Agb2YgYSBjbGVhbiAiZm9yLW5leHQiCj4gYnJh
bmNoIG9mIFBhbG1lcidzIHRyZWUgaW5zdGVhZCBvZiBjb2xsZWN0aW5nIG90aGVyIHN0dWZmIGJl
bG93IGl0LgoKSSB1c3VhbGx5IGJhc2UgZXZlcnl0aGluZyBvbiB0aGUgbW9zdCByZWNlbnQgTGlu
dXMgcmVsZWFzZSB0YWcuCgpUaGlzIHRpbWUgSSBhY2NpZGVudGFsbHkgcmViYXNlZCBvbiBteSBL
Vk0gUklTQy1WIGJyYW5jaCB3aGljaAp3YXMgbWVyZ2VkIHJlY2VudGx5LgoKSSB3aWxsIGFueXdh
eSBzZW5kIHY5LgoKUmVnYXJkcywKQW51cAoKPgo+IFNhbWUgZm9yIHJ2MzJfZGVmY29uZmlnIGJl
bG93Lgo+Cj4KPiBIZWlrbwo+Cj4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2NvbmZpZ3Mv
cnYzMl9kZWZjb25maWcgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvcnYzMl9kZWZjb25maWcKPiA+IGlu
ZGV4IGFkMDFmNTBjOThmMS4uZmVkODI3YzgyYTllIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9jb25maWdzL3J2MzJfZGVmY29uZmlnCj4gPiArKysgYi9hcmNoL3Jpc2N2L2NvbmZpZ3MvcnYz
Ml9kZWZjb25maWcKPiA+IEBAIC0yMCw2ICsyMCw3IEBAIENPTkZJR19TT0NfVklSVD15Cj4gPiAg
Q09ORklHX0FSQ0hfUlYzMkk9eQo+ID4gIENPTkZJR19TTVA9eQo+ID4gIENPTkZJR19IT1RQTFVH
X0NQVT15Cj4gPiArQ09ORklHX0NQVV9JRExFPXkKPiA+ICBDT05GSUdfVklSVFVBTElaQVRJT049
eQo+ID4gIENPTkZJR19LVk09eQo+ID4gIENPTkZJR19KVU1QX0xBQkVMPXkKPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NwdWlkbGUuaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS9hc20vY3B1aWRsZS5oCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAw
MDAwMDAwLi43MWZkYzYwN2Q0YmMKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20vY3B1aWRsZS5oCj4gPiBAQCAtMCwwICsxLDI0IEBACj4gPiArLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KPiA+ICsvKgo+ID4gKyAqIENvcHlyaWdo
dCAoQykgMjAyMSBBbGx3aW5uZXIgTHRkCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIxIFdlc3Rl
cm4gRGlnaXRhbCBDb3Jwb3JhdGlvbiBvciBpdHMgYWZmaWxpYXRlcy4KPiA+ICsgKi8KPiA+ICsK
PiA+ICsjaWZuZGVmIF9BU01fUklTQ1ZfQ1BVSURMRV9ICj4gPiArI2RlZmluZSBfQVNNX1JJU0NW
X0NQVUlETEVfSAo+ID4gKwo+ID4gKyNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+ID4gKyNpbmNs
dWRlIDxhc20vcHJvY2Vzc29yLmg+Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGNwdV9k
b19pZGxlKHZvaWQpCj4gPiArewo+ID4gKyAgICAgLyoKPiA+ICsgICAgICAqIEFkZCBtYigpIGhl
cmUgdG8gZW5zdXJlIHRoYXQgYWxsCj4gPiArICAgICAgKiBJTy9NRU0gYWNjZXNzZXMgYXJlIGNv
bXBsZXRlZCBwcmlvcgo+ID4gKyAgICAgICogdG8gZW50ZXJpbmcgV0ZJLgo+ID4gKyAgICAgICov
Cj4gPiArICAgICBtYigpOwo+ID4gKyAgICAgd2FpdF9mb3JfaW50ZXJydXB0KCk7Cj4gPiArfQo+
ID4gKwo+ID4gKyNlbmRpZgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nl
c3MuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ID4gaW5kZXggMDNhYzNhYTYxMWY1
Li41MDRiNDk2Nzg3YWEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNz
LmMKPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3MuYwo+ID4gQEAgLTIzLDYgKzIz
LDcgQEAKPiA+ICAjaW5jbHVkZSA8YXNtL3N0cmluZy5oPgo+ID4gICNpbmNsdWRlIDxhc20vc3dp
dGNoX3RvLmg+Cj4gPiAgI2luY2x1ZGUgPGFzbS90aHJlYWRfaW5mby5oPgo+ID4gKyNpbmNsdWRl
IDxhc20vY3B1aWRsZS5oPgo+ID4KPiA+ICByZWdpc3RlciB1bnNpZ25lZCBsb25nIGdwX2luX2ds
b2JhbCBfX2FzbV9fKCJncCIpOwo+ID4KPiA+IEBAIC0zNyw3ICszOCw3IEBAIGV4dGVybiBhc21s
aW5rYWdlIHZvaWQgcmV0X2Zyb21fa2VybmVsX3RocmVhZCh2b2lkKTsKPiA+Cj4gPiAgdm9pZCBh
cmNoX2NwdV9pZGxlKHZvaWQpCj4gPiAgewo+ID4gLSAgICAgd2FpdF9mb3JfaW50ZXJydXB0KCk7
Cj4gPiArICAgICBjcHVfZG9faWRsZSgpOwo+ID4gICAgICAgcmF3X2xvY2FsX2lycV9lbmFibGUo
KTsKPiA+ICB9Cj4gPgo+ID4KPgo+Cj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
