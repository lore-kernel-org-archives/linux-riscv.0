Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23DBC64EC4
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 04:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSdQMDiS1ahKFAR50NC/ON4V0+3OHAtziw6NEN9XkCw=; b=KD8Ze9n9VnYxYM
	HKVqeMYdi57tmHgXxboK7rNwup9fstBjci+oE8ZYOz4jW9B/ZVDfYWtD5QpLHFbzD6GGuLQgJKy8n
	d/4j5oAchP7IQOSXZK+H4FJ4g7f0F3FZAtMHxfVFBeZ9RUdfv7h3606KK+RwWXfa2vZlmyNwNjTkP
	fWodGw7g9UGJ1uxf+WfkyrYzLrCFkBlR8OBPMGNsgpnQNYdmPGYOdA8BAnfE25YJUcT33KcBiOxLv
	7AHYzOxQxJ2ZEoUx+UO/MXOuCVZPl/6mPzmyAddrnzePSOBh5U0a/Fqs52uEIikDhBgeTmHrTvZpD
	SbsWgGWR/eHowkiQFzcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZl9Q-003QR7-7V; Wed, 08 Mar 2023 04:11:40 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZl9M-003QPZ-Ep
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 04:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678248696; x=1709784696;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LEKP7t0Aq5YbDCnt4RRCHWXDIBxw5gwoqtVyqxFEYbk=;
  b=GpZIbm1N9JkRHserJ4PyS5ZC1riw8CWaOBLe5L3Ai7Tc21zsnUYkGJk5
   y7jtZY7V1/cXeG9SgYJo8fXDhzuwY4qAdmM36Mi5XAHrqug6oI9FIIB77
   R9WYAB97OFxgE0VqPNFSdY2V/flXA689lskzhxgJfU6ncn6z2ScsTdpGv
   OQ4WebXgqC8EsJB2jZoPW9Jev3vusMblh4oScE2rcV1YSiLFf6qfrrw63
   0ktUfJBknyVNxZ5wNKK8nuz2UW/dTneTN/otSuyuMO/BclMiVKQWUtIR6
   jnem7QScX2/p4Jll1tcZKS/DzstWpoLs2Fcb0lYtkPsHwpavEDTyuOfng
   g==;
X-IronPort-AV: E=Sophos;i="5.98,242,1673884800"; 
   d="scan'208";a="225077873"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 08 Mar 2023 12:11:28 +0800
IronPort-SDR: qpOzxUqBMuDz2iXW2jwo/kJQE8zQ5Hih1+nT1wIdDCGYwRAaY/qyksrUiWM3+aJYr5zZNnJ+6N
 eexihhnRWhhzuncgv6XGA2gBkgrAiL64HYwBTmh6QmhD3C4ViOwPLerkswyyddF7U3LHfRX/nq
 sAlJ1VDDAjVS78jtWVaqgRATpy17KCBfKOa3HabM8KbGS3KlskybEtgOATq68kvQf/CK3IUku5
 EdsWhicyT9Aa9oUFMOPzl8L6NZ3w8TGsP6mEb29PH8bIRZkJxwTJqqlXvWA8vynh5QMzQmoyZz
 50I=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 19:22:26 -0800
IronPort-SDR: V2WPi/wrLS98s7j9akVLYUER3AOrwxkCzWH24iSuiiQmzOakRfD0ahoSy1tYjUxEUI+GyAtXHM
 j3DB4s6Nwpn4ZTucqXjYqOHzYPWocQ4/ESfEt8ecH1oJvqBDHYIHh/K0B0klSrDR/l3DhH710m
 HE/wW8QUtiaKPjtCfROt6qTfrtLpxiPPrSZ8OCHzF9OYUTEHgIjKgmr8zJZxIuTGZNKqzY98zx
 YyVYIwKZRZ062EYndtHOeIyeNsyjUsKikLzTz04xzNg3cI81sa6k0l40z3uRrAdACSLLR70P+f
 e6Y=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Mar 2023 20:11:29 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PWf5D4rJTz1RvTp
	for <linux-riscv@lists.infradead.org>; Tue,  7 Mar 2023 20:11:28 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1678248687; x=1680840688; bh=LEKP7t0Aq5YbDCnt4RRCHWXDIBxw5gwoqtV
	yqxFEYbk=; b=q0mnBOHsVWw3l/BRU2nYwrSd/jX0Vw2dqn55Yu+QIfz1asZFcZT
	fmwpZ50hjvsd908/9dyAhJ3YlUyn4CPA3Hg7dZ5/ruP+t5HnSJYxNzVN6a5a3Kmh
	kxx+IqYNIBf8cVwRDxDid2sbqYvONNHwEPUK6iF/ETINauMFB1EvXOHROJwEn6F/
	5T4emscBRdRieLDxsqzn+kptdNTJ4gUikkWtpLv23vZOeA8C5QmlEtz3h1cD2h1H
	5NCScFfUlFd016nEFmkZubNTi4B62bb29Qi5oSS/gTrzlNa1J5BKN5U23DLGxwng
	nzhr2EfzaGkbex7rYum1OU6KHTWJIK5QnGw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CaYdRho6L4jm for <linux-riscv@lists.infradead.org>;
	Tue,  7 Mar 2023 20:11:27 -0800 (PST)
Received: from [10.225.163.63] (unknown [10.225.163.63])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PWf594Y76z1RvLy;
	Tue,  7 Mar 2023 20:11:25 -0800 (PST)
Message-ID: <debe0a4a-126f-2308-d40c-32ed2d9f91e3@opensource.wdc.com>
Date: Wed, 8 Mar 2023 13:11:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Content-Language: en-US
To: Jesse Taube <mr.bossman075@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-riscv@lists.infradead.org
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Yimin Gu <ustcymgu@gmail.com>, Damien Le Moal <damien.lemoal@wdc.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Waldemar Brodkorb <wbx@openadk.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
 <42446784-a88b-df09-41e9-5f685b4df6ee@infradead.org>
 <556ce787-80eb-dc48-f8d6-83e415538e36@opensource.wdc.com>
 <f8f291d9-2723-4ab8-3020-49018757d470@gmail.com>
 <62852ee1-3763-3323-c3a8-f1e84f70204a@infradead.org>
 <c7941231-8ebd-dea5-81f8-3180cfc3f286@gmail.com>
 <1d858dbb-ae85-95a0-3e46-b67017733c04@infradead.org>
 <db3b3412-9616-d13c-3374-48647325e057@infradead.org>
 <7280914e-59e3-ba6d-4324-a29c1c0b4ce8@gmail.com>
 <2ebe4bc5-c11c-89b1-2644-358dc12bdfa5@infradead.org>
 <d3fb242e-646e-50b5-7dba-17b228bb32aa@opensource.wdc.com>
 <416e27cd-0826-9bfa-8ee8-cf70dfb503c1@gmail.com>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <416e27cd-0826-9bfa-8ee8-cf70dfb503c1@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_201136_678741_8903E76E 
X-CRM114-Status: GOOD (  23.12  )
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

T24gMy84LzIzIDEyOjQ2LCBKZXNzZSBUYXViZSB3cm90ZToKPiAKPiAKPiBPbiAzLzcvMjMgMjI6
NDIsIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+PiBPbiAzLzgvMjMgMTI6MjMsIFJhbmR5IER1bmxh
cCB3cm90ZToKPj4+Pj4gT0ssIEkgZG9uJ3Qga25vdyBob3cgaXQgaGFwcGVuZWQuIEkgY2Fubm90
IHJlcHJvZHVjZSBpdCBub3cuCj4+Pj4+IFRoZSBmYWlsaW5nIC5jb25maWcgZmlsZXMgaGFzIENP
TkZJR19NTVUgaXMgbm90IHNldCAoZm9yIFJWMzJJKSwgd2hpY2gKPj4+Pj4gYXBwZWFycyB0byBi
ZSBpbXBvc3NpYmxlLgo+Pj4+IFRoZXNlIHBhdGNoZXMgYWRkIGBDT05GSUdfTU1VIGlzIG5vdCBz
ZXRgIChmb3IgUlYzMkkpLgo+Pj4+IEJ1dCBubyB3b3JyaWVzIGl0IHNlZW1zIHRvIGJlIGEgbm9u
IGlzc3VlwqAgbm93Lgo+Pj4+Cj4+Pj4gWW91ciB0aG91Z2h0cyBEYW1pZW4/Cj4+Pj4KPj4+Cj4+
PiBUaGFua3MgZm9yIHJlbWluZGluZyBtZS4KPj4+Cj4+PiBXaXRoIHRoZXNlIDMgcGF0Y2hlcyBh
cHBsaWVkIHRvIGxpbnV4LW5leHQtMjAyMzAzMDcsCj4+PiBJIHN0aWxsIGdldCB0aGlzIGJ1aWxk
IGVycm9yLgo+Pgo+PiBEb2VzIHRoaXMgaGVscCA/Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3NvYy9jYW5hYW4vS2NvbmZpZyBiL2RyaXZlcnMvc29jL2NhbmFhbi9LY29uZmlnCj4+IGluZGV4
IDI1MjdjZjU3NTdlYy4uNzc5NmM1ZjFkMTA5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NvYy9j
YW5hYW4vS2NvbmZpZwo+PiArKysgYi9kcml2ZXJzL3NvYy9jYW5hYW4vS2NvbmZpZwo+PiBAQCAt
NCw3ICs0LDggQEAgY29uZmlnIFNPQ19LMjEwX1NZU0NUTAo+PiAgICAgICAgICBib29sICJDYW5h
YW4gS2VuZHJ5dGUgSzIxMCBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIiCj4+ICAgICAgICAgIGRlcGVu
ZHMgb24gUklTQ1YgJiYgU09DX0NBTkFBTiAmJiBPRgo+PiAgICAgICAgICBkZWZhdWx0IFNPQ19D
QU5BQU4KPj4gLSAgICAgICAgc2VsZWN0IFBNCj4+IC0gICAgICAgIHNlbGVjdCBNRkRfU1lTQ09O
Cj4+ICsgICAgICAgc2VsZWN0IENPTU1PTl9DTEtfSzIxMAo+PiArICAgICAgIHNlbGVjdCBQTQo+
PiArICAgICAgIHNlbGVjdCBNRkRfU1lTQ09OCj4+ICAgICAgICAgIGhlbHAKPj4gICAgICAgICAg
ICBDYW5hYW4gS2VuZHJ5dGUgSzIxMCBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIgZHJpdmVyLgo+Pgo+
PiAoanVzdCBub3RpY2VkIHRoYXQgdGhlcmUgYXJlIHdoaXRlc3BhY2UgZXJyb3JzIGhlcmUuLi4p
Cj4+Cj4+IE5vdGUgdGhhdCBib3RoIHRoZSBzeXNjdGwgYW5kIGNsayBkcml2ZXIgZGVwZW5kIG9u
IFJJU0NWLiBJIHRoaW5rIHRoZXNlIHNob3VsZAo+PiBwcm9iYWJseSBhbHNvIGRlcGVuZCBvbiA2
NEJJVCwgYW5kIGV2ZW50dWFsbHkgYWRkIGEgInx8IENPTVBJTEVfVEVTVCIgYXMgd2VsbC4KPj4g
U28gc29tZXRoaW5nIGxpa2UgdGhpczoKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xrL0tj
b25maWcgYi9kcml2ZXJzL2Nsay9LY29uZmlnCj4+IGluZGV4IGI2YzViZjY5YTJiMi4uNjU3YTM2
ZDI2NDBkIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9LY29uZmlnCj4+ICsrKyBiL2RyaXZl
cnMvY2xrL0tjb25maWcKPj4gQEAgLTQzMSw3ICs0MzEsNyBAQCBjb25maWcgQ09NTU9OX0NMS19G
SVhFRF9NTUlPCj4+Cj4+ICAgY29uZmlnIENPTU1PTl9DTEtfSzIxMAo+PiAgICAgICAgICBib29s
ICJDbG9jayBkcml2ZXIgZm9yIHRoZSBDYW5hYW4gS2VuZHJ5dGUgSzIxMCBTb0MiCj4+IC0gICAg
ICAgZGVwZW5kcyBvbiBPRiAmJiBSSVNDViAmJiBTT0NfQ0FOQUFOCj4+ICsgICAgICAgZGVwZW5k
cyBvbiBPRiAmJiBSSVNDViAmJiBTT0NfQ0FOQUFOICYmICg2NEJJVCB8fCBDT01QSUxFX1RFU1Qp
Cj4+ICAgICAgICAgIGRlZmF1bHQgU09DX0NBTkFBTgo+PiAgICAgICAgICBoZWxwCj4+ICAgICAg
ICAgICAgU3VwcG9ydCBmb3IgdGhlIENhbmFhbiBLZW5kcnl0ZSBLMjEwIFJJU0MtViBTb0MgY2xv
Y2tzLgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcgYi9kcml2ZXJz
L3NvYy9jYW5hYW4vS2NvbmZpZwo+PiBpbmRleCAyNTI3Y2Y1NzU3ZWMuLjE3NDVhNjE0ZDJhNyAx
MDA2NDQKPj4gLS0tIGEvZHJpdmVycy9zb2MvY2FuYWFuL0tjb25maWcKPj4gKysrIGIvZHJpdmVy
cy9zb2MvY2FuYWFuL0tjb25maWcKPj4gQEAgLTIsOSArMiwxMCBAQAo+Pgo+PiAgIGNvbmZpZyBT
T0NfSzIxMF9TWVNDVEwKPj4gICAgICAgICAgYm9vbCAiQ2FuYWFuIEtlbmRyeXRlIEsyMTAgU29D
IHN5c3RlbSBjb250cm9sbGVyIgo+PiAtICAgICAgIGRlcGVuZHMgb24gUklTQ1YgJiYgU09DX0NB
TkFBTiAmJiBPRgo+PiArICAgICAgIGRlcGVuZHMgb24gUklTQ1YgJiYgU09DX0NBTkFBTiAmJiBP
RiAmJiAoNjRCSVQgfHwgQ09NUElMRV9URVNUKQo+PiAgICAgICAgICBkZWZhdWx0IFNPQ19DQU5B
QU4KPj4gLSAgICAgICAgc2VsZWN0IFBNCj4+IC0gICAgICAgIHNlbGVjdCBNRkRfU1lTQ09OCj4+
ICsgICAgICAgc2VsZWN0IENPTU1PTl9DTEtfSzIxMAo+PiArICAgICAgIHNlbGVjdCBQTQo+PiAr
ICAgICAgIHNlbGVjdCBNRkRfU1lTQ09OCj4+ICAgICAgICAgIGhlbHAKPj4gICAgICAgICAgICBD
YW5hYW4gS2VuZHJ5dGUgSzIxMCBTb0Mgc3lzdGVtIGNvbnRyb2xsZXIgZHJpdmVyLgo+Pgo+PiBD
T01QSUxFX1RFU1QgaXMgb3B0aW9uYWwgdGhvdWdoLCBidXQgSSBkbyBub3Qgc2VlIGFueSByZWFz
b24gd2h5IG5vdCBldmVudGhvdWdoCj4+IGluIHByYWN0aWNlIHRoZXNlIGRyaXZlcnMgd2lsbCBs
aWtlbHkgbmV2ZXIgZW5kIHVwIGluIDMyLWJpdHMgU29DLgo+Pgo+Pgo+IAo+IE9oIHRoYW5rcyBJ
IHdhcyBpbiB0aGUgaW4gdGhlIG1pZHN0IG9mIG1ha2luZyBhIHNpbWlsYXIgcGF0Y2guCj4gRG8g
eW91IHdhbnQgdG8gc3VibWl0IGl0IG9yIHNoYWxsIEkuIEFsc28gdGhhbmtzIGZvciB0aGUgaGVs
cCB3aXRoIHRoaXMsIAo+IHdhcyB1c2luZyB0YWcgNi4yLgoKSSBhbSBidXN5IHdpdGggb3RoZXIg
c3R1ZmYgYW5kIGRvIG5vdCBoYXZlIHRpbWUgdG8gcHJvcGVybHkgdGVzdCB0aGlzLiBTbyBwbGVh
c2UKZmVlbCBmcmVlIHRvIGdvIGFoZWFkIGFuZCBzZW5kIHNvbWV0aGluZyBmdWxseSB0ZXN0ZWQu
CgotLSAKRGFtaWVuIExlIE1vYWwKV2VzdGVybiBEaWdpdGFsIFJlc2VhcmNoCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
