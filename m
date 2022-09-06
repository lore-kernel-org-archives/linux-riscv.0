Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2480AECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 20:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ail0z28UvmyMhZ5A7eF0UJPj4kIDqDoCkeBqkioZcy4=; b=f4oAf/3UsOnGTJ
	gIvEYcg+ndmAqUmN2kk1Uo3t9IzYlyPUBGJeDdZ7/+Q78IxDRFDn8YwRkAJtra/YBecvGzHAX81vw
	pqvasabuQzjsU0WI00k89fhY8LFBxkNSTXL6DNIw0ZH5oDaB1CKghFtzO5X54sDcI/NDky8z7iO2Z
	7e/M8lSjBGUsi7FGDCnkEgqlypiTefpsM4wTXRsRwQVWR5c+oxKcjw0Icy8Q03bW477fAR1taSQgo
	LdzQeH0gKrQsU/V+UzGNMmEUItgNxynHBLSjnh6ZHkYcqLA0WVBPNMlKenx5HhSuZhD3hKBaYR3Nj
	XSmLxndnMGUvAX6cTDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfCI-00H8Pl-Qj; Tue, 06 Sep 2022 20:29:26 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVfCF-00H8Nx-Qp
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 20:29:25 +0000
Received: by mail-ej1-x634.google.com with SMTP id lz22so5015692ejb.3
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XVGUqqzM3n2D/4jJV0ZKcJTbVHjL4eVdejQAA4KKYRk=;
        b=H7ZInpF2UhWzzqrCBfmLLea7RMaRc0IsqTMdPjIoCV1dXteLuEZBPlQdCtrM6GRXoR
         z5SBRgeL0CsNRhmwTOlQLCTOluaJwA9GbW9p+eMbx3M4UdIS2eNmqyA9acjEis1earyB
         zdzagIbpXgK4GubL47JJjwenXNMMK2GmLT+RzZTqADNemTR9KVZQV0SnXZFH4uTeUSit
         kF50jBT/hTurNyat3APUOfcRLe8s3tFloDtyzmMKuusTxds7H32K89qYfhzsLsth3+hT
         T+umwiaem8KGg4A7Qgb3pFYsTU3xKRBPr+JyQnwVUCL/dECBqxqIHc07rFvExPTiHVBe
         owxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XVGUqqzM3n2D/4jJV0ZKcJTbVHjL4eVdejQAA4KKYRk=;
        b=HgzByHls2fDJlk1XfHzDK2Hml85fe88k9ZKeY8j0w2aiGC93+YuEI3Hmwi4PcxYu2w
         DeV2Li9j4Sk6QiC5LbwNQNg4UrzaiV//tCz/XyueCjDPbTUh5mfEggry5KcCZdSj0BeF
         iZ5fQSjtrgqMU0Hx4GneIONkOWJxSNES0RSmSsfSJpRsU/1NqVwu+1FAUYAnryV41A9l
         Eup3srC8uqv3LjjpsilZSbnqYwvft9jN9Ixfg2EwiMLeR5ezvDlBSctEt6Mhm6FnyXJi
         qr7NMRTgWA/Tpmu2UHGYApSdpr5UQDuVm2IQvzhyNlpNjes9/qnsA+cyzqdaQKla25Hi
         8GoA==
X-Gm-Message-State: ACgBeo30gIbdZ+YWLM8PiHGEquK/NSUbptIjchnr/VFQ2m3Y3VXO+4kr
	Gz5ljQxMwx0ZQHVIQQYkrCE=
X-Google-Smtp-Source: AA6agR5FzHvOY7Bnao9g05Gz0yuvtXm27oREQpQ1b11WFGKhTmMQYjJTsyqae2G6XuQedGzvSAP07A==
X-Received: by 2002:a17:906:ef8c:b0:73d:db10:8825 with SMTP id ze12-20020a170906ef8c00b0073ddb108825mr139433ejb.445.1662496162405;
        Tue, 06 Sep 2022 13:29:22 -0700 (PDT)
Received: from kista.localnet (82-149-1-172.dynamic.telemach.net. [82.149.1.172])
        by smtp.gmail.com with ESMTPSA id da8-20020a056402176800b004477c582ffdsm5585194edb.80.2022.09.06.13.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 13:29:21 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: samuel@sholland.org, Palmer Dabbelt <palmer@dabbelt.com>
Cc: wens@csie.org, linux-sunxi@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, samuel@sholland.org
Subject: Re: Re: [PATCH 00/12] riscv: Allwinner D1 platform support
Date: Tue, 06 Sep 2022 22:29:20 +0200
Message-ID: <7423117.EvYhyI6sBW@kista>
In-Reply-To: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
References: <mhng-d98d3324-5f4b-4cb0-a116-522b124dcdea@palmer-ri-x1c9>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_132923_924024_126BEC5C 
X-CRM114-Status: GOOD (  23.11  )
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

RG5lIMSNZXRydGVrLCAwMS4gc2VwdGVtYmVyIDIwMjIgb2IgMjA6MTA6MTMgQ0VTVCBqZSBQYWxt
ZXIgRGFiYmVsdCBuYXBpc2FsKGEpOgo+IE9uIFN1biwgMTQgQXVnIDIwMjIgMjI6MDg6MDMgUERU
ICgtMDcwMCksIHNhbXVlbEBzaG9sbGFuZC5vcmcgd3JvdGU6Cj4gPiBUaGlzIHNlcmllcyBhZGRz
IHRoZSBLY29uZmlnL2RlZmNvbmZpZyBwbHVtYmluZyBhbmQgZGV2aWNldHJlZXMgZm9yIGEKPiA+
IHJhbmdlIG9mIEFsbHdpbm5lciBEMS1iYXNlZCBib2FyZHMuIE1hbnkgZmVhdHVyZXMgYXJlIGFs
cmVhZHkgZW5hYmxlZCwKPiA+IGluY2x1ZGluZyBVU0IsIEV0aGVybmV0LCBhbmQgV2lGaS4KPiA+
IAo+ID4gVGhlIFNvQyBkZXZpY2V0cmVlIHVzZXMgYmluZGluZ3MgZnJvbSB0aGUgZm9sbG93aW5n
IHNlcmllcyB3aGljaCBoYXZlCj4gPiBub3QgeWV0IGJlZW4gbWVyZ2VkOgo+ID4gCj4gPiAtIFNS
QU0gY29udHJvbGxlcjoKPiA+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIyMDgx
NTA0MTI0OC41MzI2OC0xLXNhbXVlbEBzaG9sbGFuZC5vcmcvCj4gPiAKPiA+IC0gTlZNRU0gY2Vs
bCBiaXRzIHByb3BlcnR5IGNoYW5nZToKPiA+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8yMDIyMDgxNDE3MzY1Ni4xMTg1Ni0xLXNhbXVlbEBzaG9sbGFuZC5vcmcvCj4gPiAKPiA+IC0g
SW4tcGFja2FnZSBMRE8gcmVndWxhdG9yczoKPiA+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
bGttbC8yMDIyMDgxNTA0MzQzNi4yMDE3MC0xLXNhbXVlbEBzaG9sbGFuZC5vcmcvCj4gPiAKPiA+
IEFsbCB0aHJlZSBvZiB0aGVzZSBhcmUgcmVxdWlyZWQgdG8gc2V0IHRoZSBjb3JyZWN0IEkvTyBk
b21haW4gdm9sdGFnZXMKPiA+IGluIHRoZSBwaW4gY29udHJvbGxlciwgd2hpY2ggSSB3b3VsZCBj
b25zaWRlciBpbXBvcnRhbnQgdG8gaGF2ZSBpbiB0aGUKPiA+IGluaXRpYWwgdmVyc2lvbiBvZiB0
aGUgZGV2aWNldHJlZS4KPiA+IAo+ID4gVGhlIFNvQyBkZXZpY2V0cmVlIGRvZXMgY29udGFpbiBv
bmUgc21hbGwgaGFjayB0byBhdm9pZCBhIGRlcGVuZGVuY3kgb24KPiA+IHRoZSBhdWRpbyBjb2Rl
YyBiaW5kaW5nLCBzaW5jZSB0aGF0IGlzIG5vdCByZWFkeSB5ZXQ6IHRoZSBjb2RlYyBub2RlCj4g
PiB1c2VzIGEgYmFyZSAic2ltcGxlLW1mZCIsICJzeXNjb24iIGNvbXBhdGlibGUuCj4gPiAKPiA+
IFNhbXVlbCBIb2xsYW5kICgxMik6Cj4gPiAgIE1BSU5UQUlORVJTOiBNYXRjaCB0aGUgc3VuMjBp
IGZhbWlseSBvZiBBbGx3aW5uZXIgU29Dcwo+ID4gICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBU
LUhFQUQgQzkwNiBhbmQgQzkxMCBjb21wYXRpYmxlcwo+ID4gICBkdC1iaW5kaW5nczogdmVuZG9y
LXByZWZpeGVzOiBBZGQgQWxsd2lubmVyIEQxIGJvYXJkIHZlbmRvcnMKPiA+ICAgZHQtYmluZGlu
Z3M6IHJpc2N2OiBBZGQgQWxsd2lubmVyIEQxIGJvYXJkIGNvbXBhdGlibGVzCj4gPiAgIHJpc2N2
OiBBZGQgdGhlIEFsbHdpbm5lciBTb0MgZmFtaWx5IEtjb25maWcgb3B0aW9uCj4gPiAgIHJpc2N2
OiBkdHM6IGFsbHdpbm5lcjogQWRkIHRoZSBEMSBTb0MgYmFzZSBkZXZpY2V0cmVlCj4gPiAgIHJp
c2N2OiBkdHM6IGFsbHdpbm5lcjogQWRkIEFsbHdpbm5lciBEMSBOZXpoYSBkZXZpY2V0cmVlCj4g
PiAgIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjogQWRkIFNpcGVlZCBMaWNoZWUgUlYgZGV2aWNldHJl
ZXMKPiA+ICAgcmlzY3Y6IGR0czogYWxsd2lubmVyOiBBZGQgTWFuZ29QaSBNUSBQcm8gZGV2aWNl
dHJlZQo+ID4gICByaXNjdjogZHRzOiBhbGx3aW5uZXI6IEFkZCBEb25nc2hhbiBOZXpoYSBTVFUg
ZGV2aWNldHJlZQo+ID4gICByaXNjdjogZHRzOiBhbGx3aW5uZXI6IEFkZCBDbG9ja3dvcmtQaSBh
bmQgRGV2VGVybSBkZXZpY2V0cmVlcwo+ID4gICByaXNjdjogZGVmY29uZmlnOiBFbmFibGUgdGhl
IEFsbHdpbm5lciBEMSBwbGF0Zm9ybSBhbmQgZHJpdmVycwo+ID4gIAo+ID4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbCAgICAgICB8ICAgMiArCj4gPiAgLi4uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3Yvc3VueGkueWFtbCAgICAgIHwgIDY0ICsrCj4gPiAgLi4uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgIHwgICA0ICsKPiA+ICBNQUlO
VEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDIgKy0KPiA+ICBh
cmNoL3Jpc2N2L0tjb25maWcuc29jcyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDkgKwo+ID4g
IGFyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUgICAgICAgICAgICAgICAgICB8ICAgMSArCj4g
PiAgYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvTWFrZWZpbGUgICAgICAgIHwgIDEwICsK
PiA+ICAuLi4vYWxsd2lubmVyL3N1bjIwaS1kMS1jbG9ja3dvcmtwaS12My4xNC5kdHMgfCAyNDIg
KysrKysKPiA+ICAuLi4vc3VuMjBpLWQxLWNvbW1vbi1yZWd1bGF0b3JzLmR0c2kgICAgICAgICAg
fCAgNTEgKwo+ID4gIC4uLi9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1kZXZ0ZXJtLXYzLjE0LmR0
cyB8ICAzNyArCj4gPiAgLi4uL3N1bjIwaS1kMS1kb25nc2hhbi1uZXpoYS1zdHUuZHRzICAgICAg
ICAgIHwgMTE0ICsrKwo+ID4gIC4uLi9zdW4yMGktZDEtbGljaGVlLXJ2LTg2LXBhbmVsLTQ4MHAu
ZHRzICAgICB8ICAyOSArCj4gPiAgLi4uL3N1bjIwaS1kMS1saWNoZWUtcnYtODYtcGFuZWwtNzIw
cC5kdHMgICAgIHwgIDEwICsKPiA+ICAuLi4vc3VuMjBpLWQxLWxpY2hlZS1ydi04Ni1wYW5lbC5k
dHNpICAgICAgICAgfCAgOTIgKysKPiA+ICAuLi4vYWxsd2lubmVyL3N1bjIwaS1kMS1saWNoZWUt
cnYtZG9jay5kdHMgICAgfCAgNzQgKysKPiA+ICAuLi4vZHRzL2FsbHdpbm5lci9zdW4yMGktZDEt
bGljaGVlLXJ2LmR0cyAgICAgfCAgODQgKysKPiA+ICAuLi4vYWxsd2lubmVyL3N1bjIwaS1kMS1t
YW5nb3BpLW1xLXByby5kdHMgICAgfCAxMjggKysrCj4gPiAgLi4uL2Jvb3QvZHRzL2FsbHdpbm5l
ci9zdW4yMGktZDEtbmV6aGEuZHRzICAgIHwgMTcxICsrKysKPiA+ICBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW4yMGktZDEuZHRzaSAgfCA5MDAgKysrKysrKysrKysrKysrKysrCj4g
PiAgYXJjaC9yaXNjdi9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgICAgICAgIHwgIDIzICst
Cj4gPiAgMjAgZmlsZXMgY2hhbmdlZCwgMjA0NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvcmlzY3Yvc3VueGkueWFtbAo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL2FsbHdpbm5lci9NYWtlZmlsZQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+ID4gIGFy
Y2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1jbG9ja3dvcmtwaS12My4xNC5k
dHMgY3JlYXRlCj4gPiAgbW9kZSAxMDA2NDQKPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdp
bm5lci9zdW4yMGktZDEtY29tbW9uLXJlZ3VsYXRvcnMuZHRzaSBjcmVhdGUKPiA+ICBtb2RlIDEw
MDY0NCBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEtZGV2dGVybS12My4x
NC5kdHMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2Fs
bHdpbm5lci9zdW4yMGktZDEtZG9uZ3NoYW4tbmV6aGEtc3R1LmR0cyBjcmVhdGUKPiA+ICBtb2Rl
IDEwMDY0NAo+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1saWNo
ZWUtcnYtODYtcGFuZWwtNDgwcC5kdHMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQKPiA+ICBhcmNo
L3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEtbGljaGVlLXJ2LTg2LXBhbmVsLTcy
MHAuZHRzCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0Cj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy9h
bGx3aW5uZXIvc3VuMjBpLWQxLWxpY2hlZS1ydi04Ni1wYW5lbC5kdHNpIGNyZWF0ZQo+ID4gIG1v
ZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMS1saWNoZWUt
cnYtZG9jay5kdHMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9ib290L2R0cy9h
bGx3aW5uZXIvc3VuMjBpLWQxLWxpY2hlZS1ydi5kdHMKPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQK
PiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDEtbWFuZ29waS1tcS1w
cm8uZHRzIGNyZWF0ZSBtb2RlCj4gPiAgMTAwNjQ0IGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lu
bmVyL3N1bjIwaS1kMS1uZXpoYS5kdHMgY3JlYXRlIG1vZGUKPiA+ICAxMDA2NDQgYXJjaC9yaXNj
di9ib290L2R0cy9hbGx3aW5uZXIvc3VuMjBpLWQxLmR0c2kKPiAKPiBJJ20gYXNzdW1pbmcgdGhl
c2UgYXJlIGFpbWVkIGF0IHRoZSBSSVNDLVYgdHJlZT8gIEknbSBnZW5lcmFsbHkgT0sgd2l0aAo+
IHRoYXQsIHRob3VnaCB0aGUgRFQgZm9sa3MgaGF2ZSBwb2ludGVkIG91dCBhIGhhbmRmdWwgb2Yg
aXNzdWVzIHRoYXQgbG9vawo+IHByZXR0eSByZWFzb25hYmxlIHRvIG1lLgoKRFQgY2hhbmdlcyBm
b3IgQWxsd2lubmVyIEFSTSBTb0NzIGdvIHRyb3VnaCBzdW54aSB0cmVlLiBTaG91bGQgdGhpcyBi
ZSBoYW5kbGVkIApkaWZmZXJlbnRseSBmb3IgUklTQy1WPwoKQmVzdCByZWdhcmRzLApKZXJuZWoK
Cj4gCj4gSSBjYW4ndCBmaW5kIGEgdjIsIG5vdCBzdXJlIGlmIEkgbWlzc2VkIGl0LiAgTm8gcnVz
aCBvbiBteSBlbmQsIGp1c3QKPiB3YW50IHRvIG1ha2Ugc3VyZSBJJ20gbm90IGRyb3BwaW5nIHRo
ZSBiYWxsIG9uIGFueXRoaW5nLgo+IAo+IFRoYW5rcyEKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
