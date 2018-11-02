Return-Path: <SRS0=t+eB=NN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 142EBC65C22
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 22:19:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C684B2082D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  2 Nov 2018 22:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ue5Ky9J5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C684B2082D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HMF9tpMizJNyyq6BPFiqc27L7KOXS/htb+8fADqBzRw=; b=Ue5Ky9J5i+DXoo57mPQMkttFD
	wWhbONEvtqwhd+VSg3bAefxgTJvbuxTIbfP3/7SyhvcuWh/RlER0l9jYN2lHNFPwbf2OpqDbVxchi
	Uj1qe02lgHiRcuNKogp8mYkNx9oA+ITEir+3WQR8Z5VV5MMWyEXemsa/9FsJP4nLsPo6x3Jc06MQL
	gEw6mh9p3otpBSz6cRgWASHoA7nxNfI1GRiTnONIeAHz9tecySaFuErIfTI7istWngXMXOYo//Fso
	F4YqFLr2OQT3GEM9/tdnI0OjZ1ILFnaTBpc4G5gcsfRqMNAHwM4oietS8Gt6TyLbCc4In5RKqwDnY
	RA2LnBwIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIhmm-0007oa-V3; Fri, 02 Nov 2018 22:19:24 +0000
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIhmi-0007nn-PS
 for linux-riscv@lists.infradead.org; Fri, 02 Nov 2018 22:19:22 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wA2MIYnb072516; Sat, 3 Nov 2018 00:18:36 +0200 (EET)
X-AuditID: 8b5b9d4d-91bff70000000e62-ae-5bdccd3984e5
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 27.46.03682.93DCCDB5; Sat,  3 Nov 2018 00:18:33 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wA2MIVSD005173; Sat, 3 Nov 2018 00:18:31 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sat, 03 Nov 2018 00:18:31 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [RFC 0/2] Add RISC-V cpu topology
Organization: FORTH
In-Reply-To: <9385b2eb-4729-8247-b0ae-1540793d078b@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
 <866dedbc78ab4fa0e3b040697e112106@mailhost.ics.forth.gr>
 <9385b2eb-4729-8247-b0ae-1540793d078b@wdc.com>
Message-ID: <ffc68a79af6e981654bef5bcdb283161@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsXSHc2orGt59k60wZwOPYttS1azWrR8eMdq
 sWjFdxaL1vZvTBbzj5xjtTg9YRGTxeVdc9gstn1uYbNYev0ik0Xzu3PsFpsnLGC1aN17BMja
 NJXZ4vnKXjYHPo89p2cxe6yZt4bRY+rvMyweDzddYvLYvELLY9OqTjaPd+fOsXtsXlLvcan5
 OrvH501yHu0HupkCuKO4bFJSczLLUov07RK4MlbtPMBa0KFZMW/RSqYGxq/yXYycHBICJhLr
 D99i7WLk4hASOMIo8WzzRjaQhJDAQUaJtTvcIYpMJWbv7WQEsXkFBCVOznzCAmIzC1hITL2y
 nxHClpdo3jqbGcRmEVCVuHikC6yGTUBTYv6lg0A2B4cIUHzWIn6QXcwCv5kkTmy4DFYvLKAn
 0bThJiuIzS8gLPHp7kUwm1PAWmLFoUksEMetZ5S4vHgZC8QRLhInnh5igzhOReLD7wfsILao
 gLLEixPTWScwCs1CcussJLfOQnLrAkbmVYwCiWXGepnJxXpp+UUlGXrpRZsYwbE413cH47kF
 9ocYBTgYlXh4DSrvRAuxJpYVV+YeYpTgYFYS4f3SChTiTUmsrEotyo8vKs1JLT7EKM3BoiTO
 e/hFeJCQQHpiSWp2ampBahFMlomDU6qBMfnG4kVTq5/Kutvrhi6e8F9Yap0c37LuM5bBSwTa
 ZLLOVi/bs/Dt5bdRbTOLby1PscgTNr25N3pqSuzmSnHrk4/9va33d58O8DS4I3W6UrvTOuHv
 pQunHLbeXfvokeLuHeFTln7d/7FqWn1OwXQXu6KSO3+anHNcXvzuK5+5TorF7fg92Rdck5RY
 ijMSDbWYi4oTAeXAX0zBAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181102_151921_379939_31858390 
X-CRM114-Status: GOOD (  17.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Damien Le Moal <Damien.LeMoal@wdc.com>, alankao@andestech.com,
 zong@andestech.com, anup@brainfault.org, palmer@sifive.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, robh+dt@kernel.org,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181102221831.JrbTAFn027Y8Qyv6ZRLn7VIM2ACshlOzyp34newJtpU@z>

zqPPhM65z4IgMjAxOC0xMS0wMiAyMzoxNCwgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+IE9u
IDExLzIvMTggMTE6NTkgQU0sIE5pY2sgS29zc2lmaWRpcyB3cm90ZToKPj4gSGVsbG8gQWxsLAo+
PiAKPj4gzqPPhM65z4IgMjAxOC0xMS0wMiAwMTowNCwgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61
Ogo+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyB0aGUgY3B1IHRvcG9sb2d5IGZvciBSSVNDLVYu
IEl0IGNvbnRhaW5zCj4+PiBib3RoIHRoZSBEVCBiaW5kaW5nIGFuZCBhY3R1YWwgc291cmNlIGNv
ZGUuIEl0IGhhcyBiZWVuIHRlc3RlZCBvbgo+Pj4gUUVNVSAmIFVubGVhc2hlZCBib2FyZC4KPj4+
IAo+Pj4gVGhlIGlkZWEgaXMgYmFzZWQgb24gY3B1LW1hcCBpbiBBUk0gd2l0aCBjaGFuZ2VzIHJl
bGF0ZWQgdG8gaG93Cj4+PiB3ZSBkZWZpbmUgU01UIHN5c3RlbXMuIFRoZSByZWFzb24gZm9yIGFk
b3B0aW5nIGEgc2ltaWxhciBhcHByb2FjaAo+Pj4gdG8gQVJNIGFzIEkgZmVlbCBpdCBwcm92aWRl
cyBhIHZlcnkgY2xlYXIgd2F5IG9mIGRlZmluaW5nIHRoZQo+Pj4gdG9wb2xvZ3kgY29tcGFyZWQg
dG8gcGFyc2luZyBjYWNoZSBub2RlcyB0byBmaWd1cmUgb3V0IHdoaWNoIGNwdXMKPj4+IHNoYXJl
IHRoZSBzYW1lIHBhY2thZ2Ugb3IgY29yZS4gIEkgYW0gb3BlbiB0byBhbnkgb3RoZXIgaWRlYSB0
bwo+Pj4gaW1wbGVtZW50IGNwdS10b3BvbG9neSBhcyB3ZWxsLgo+Pj4gCj4+IAo+PiBJIHdhcyBh
bHNvIGFib3V0IHRvIHN0YXJ0IGEgZGlzY3Vzc2lvbiBhYm91dCBDUFUgdG9wb2xvZ3kgb24gUklT
Qy1WCj4+IGFmdGVyIHRoZSBsYXN0IHN3dG9vbHMgZ3JvdXAgbWVldGluZy4gVGhlIGdvYWwgaXMg
dG8gcHJvdmlkZSB0aGUKPj4gc2NoZWR1bGVyIHdpdGggaGludHMgb24gaG93IHRvIGRpc3RyaWJ1
dGUgdGFza3MgbW9yZSBlZmZpY2llbnRseQo+PiBiZXR3ZWVuIGhhcnRzLCBieSBwb3B1bGF0aW5n
IHRoZSBzY2hlZHVsaW5nIGRvbWFpbiB0b3BvbG9neSBsZXZlbHMKPj4gKGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y0LjE5L2lkZW50L3NjaGVkX2RvbWFpbl90b3BvbG9neV9sZXZl
bCkuCj4+IFdoYXQgd2Ugd2FudCB0byBkbyBpcyBkZWZpbmUgY3B1IGdyb3VwcyBhbmQgYXNzaWdu
IHRoZW0gdG8KPj4gc2NoZWR1bGluZyBkb21haW5zIHdpdGggdGhlIGFwcHJvcHJpYXRlIFNEXyBm
bGFncwo+PiAoaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL2lu
Y2x1ZGUvbGludXgvc2NoZWQvdG9wb2xvZ3kuaCNMMTYpLgo+PiAKPiAKPiBTY2hlZHVsZXIgZG9t
YWluIHRvcG9sb2d5IGlzIGFscmVhZHkgZ2V0dGluZyBhbGwgdGhlIGhpbnRzIGluIHRoZSAKPiBm
b2xsb3dpbmcgd2F5Lgo+IAo+IHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfZG9tYWluX3RvcG9sb2d5X2xl
dmVsIGRlZmF1bHRfdG9wb2xvZ3lbXSA9IHsKPiAjaWZkZWYgQ09ORklHX1NDSEVEX1NNVAo+ICAg
ICAgICAgeyBjcHVfc210X21hc2ssIGNwdV9zbXRfZmxhZ3MsIFNEX0lOSVRfTkFNRShTTVQpIH0s
Cj4gI2VuZGlmCj4gI2lmZGVmIENPTkZJR19TQ0hFRF9NQwo+ICAgICAgICAgeyBjcHVfY29yZWdy
b3VwX21hc2ssIGNwdV9jb3JlX2ZsYWdzLCBTRF9JTklUX05BTUUoTUMpIH0sCj4gI2VuZGlmCj4g
ICAgICAgICB7IGNwdV9jcHVfbWFzaywgU0RfSU5JVF9OQU1FKERJRSkgfSwKPiAgICAgICAgIHsg
TlVMTCwgfSwKPiB9Owo+IAo+ICNpZmRlZiBDT05GSUdfU0NIRURfU01UCj4gc3RhdGljIGlubGlu
ZSBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X3NtdF9tYXNrKGludCBjcHUpCj4gewo+ICAgICAg
ICAgcmV0dXJuIHRvcG9sb2d5X3NpYmxpbmdfY3B1bWFzayhjcHUpOwo+IH0KPiAjZW5kaWYKPiAK
PiBjb25zdCBzdHJ1Y3QgY3B1bWFzayAqY3B1X2NvcmVncm91cF9tYXNrKGludCBjcHUpCj4gewo+
ICAgICAgICAgcmV0dXJuICZjcHVfdG9wb2xvZ3lbY3B1XS5jb3JlX3NpYmxpbmc7Cj4gfQo+IAo+
IAoKVGhhdCdzIGEgc3RhdGljIGRlZmluaXRpb24gb2YgdHdvIHNjaGVkdWxpbmcgZG9tYWlucyB0
aGF0IG9ubHkgZGVhbAp3aXRoIFNNVCBhbmQgTUMsIHRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2Vl
biB0aGVtIGlzIHRoZQpTRF9TSEFSRV9QS0dfUkVTT1VSQ0VTIGZsYWcuIFlvdSBjYW4ndCBldmVu
IGhhdmUgbXVsdGlwbGUgbGV2ZWxzCm9mIHNoYXJlZCByZXNvdXJjZXMgdGhpcyB3YXksIHdoYXRl
dmVyIHlvdSBoYXZlIGxhcmdlciB0aGFuIGEgY29yZQppcyBpZ25vcmVkIChpdCBqdXN0IGdvZXMg
dG8gdGhlIE1DIGRvbWFpbikuIFRoZXJlIGlzIGFsc28gbm8gaGFuZGxpbmcKb2YgU0RfU0hBUkVf
UE9XRVJET01BSU4gb3IgU0RfU0hBUkVfQ1BVQ0FQQUNJVFkuCgo+PiBTbyB0aGUgY29yZXMgdGhh
dCBiZWxvbmcgdG8gYSBzY2hlZHVsaW5nIGRvbWFpbiBtYXkgc2hhcmU6Cj4+IENQVSBjYXBhY2l0
eSAoU0RfU0hBUkVfQ1BVQ0FQQUNJVFkgLyBTRF9BU1lNX0NQVUNBUEFDSVRZKQo+PiBQYWNrYWdl
IHJlc291cmNlcyAtZS5nLiBjYWNoZXMsIHVuaXRzIGV0Yy0gKFNEX1NIQVJFX1BLR19SRVNPVVJD
RVMpCj4+IFBvd2VyIGRvbWFpbiAoU0RfU0hBUkVfUE9XRVJET01BSU4pCj4+IAo+PiBJbiB0aGlz
IGNvbnRleHQgSSBiZWxpZXZlIHVzaW5nIHdvcmRzIGxpa2UgImNvcmUiLCAicGFja2FnZSIsCj4+
ICJzb2NrZXQiIGV0YyBjYW4gYmUgbWlzbGVhZGluZy4gRm9yIGV4YW1wbGUgdGhlIHNhbXBsZSB0
b3BvbG9neSB5b3UKPj4gdXNlIG9uIHRoZSBkb2N1bWVudGF0aW9uIHNheXMgdGhhdCB0aGVyZSBh
cmUgNCBjb3JlcyB0aGF0IGFyZSBwYXJ0Cj4+IG9mIGEgcGFja2FnZSwgaG93ZXZlciAicGFja2Fn
ZSIgaGFzIGEgZGlmZmVyZW50IG1lYW5pbmcgdG8gdGhlCj4+IHNjaGVkdWxlci4gQWxzbyB3ZSBk
b24ndCBzYXkgYW55dGhpbmcgaW4gY2FzZSB0aGV5IHNoYXJlIGEgcG93ZXIKPj4gZG9tYWluIG9y
IGlmIHRoZXkgaGF2ZSB0aGUgc2FtZSBjYXBhY2l0eSBvciBub3QuIFRoaXMgbWFwcGluZyBkZWFs
cwo+PiBvbmx5IHdpdGggY2FjaGUgaGllcmFyY2h5IG9yIG90aGVyIHNoYXJlZCByZXNvdXJjZXMu
Cj4+IAo+PiBIb3cgYWJvdXQgZGVmaW5pbmcgYSBkdCBzY2hlbWUgdG8gZGVzY3JpYmUgdGhlIHNj
aGVkdWxlciBkb21haW4KPj4gdG9wb2xvZ3kgbGV2ZWxzIGluc3RlYWQgPyBlLmc6Cj4+IAo+PiAy
IHNldHMgKG9yIGNsdXN0ZXJzIGlmIHlvdSBwcmVmZXIpIG9mIDIgU01UIGNvcmVzLCBlYWNoIHNl
dCB3aXRoCj4+IGEgZGlmZmVyZW50IGNhcGFjaXR5IGFuZCBwb3dlciBkb21haW46Cj4+IAo+PiBz
Y2hlZF90b3BvbG9neSB7Cj4+ICAgIGxldmVsMCB7IC8vIFNNVAo+PiAgICAgc2hhcmVkID0gInBv
d2VyIiwgImNhcGFjaXR5IiwgInJlc291cmNlcyI7Cj4+ICAgICBncm91cDAgewo+PiAgICAgIG1l
bWJlcnMgPSA8JmhhcnQwPiwgPCZoYXJ0MT47Cj4+ICAgICB9Cj4+ICAgICBncm91cDEgewo+PiAg
ICAgIG1lbWJlcnMgPSA8JmhhcnQyPiwgPCZoYXJ0Mz47Cj4+ICAgICB9Cj4+ICAgICBncm91cDIg
ewo+PiAgICAgIG1lbWJlcnMgPSA8JmhhcnQ0PiwgPCZoYXJ0NT47Cj4+ICAgICB9Cj4+ICAgICBn
cm91cDMgewo+PiAgICAgIG1lbWJlcnMgPSA8JmhhcnQ2PiwgPCZoYXJ0Nz47Cj4+ICAgICB9Cj4+
ICAgIH0KPj4gICAgbGV2ZWwxIHsgLy8gTUMKPj4gICAgIHNoYXJlZCA9ICJwb3dlciIsICJjYXBh
Y2l0eSIKPj4gICAgIGdyb3VwMCB7Cj4+ICAgICAgbWVtYmVycyA9IDwmaGFydDA+LCA8JmhhcnQx
PiwgPCZoYXJ0Mj4sIDwmaGFydDM+Owo+PiAgICAgfQo+PiAgICAgZ3JvdXAxIHsKPj4gICAgICBt
ZW1iZXJzID0gPCZoYXJ0ND4sIDwmaGFydDU+LCA8JmhhcnQ2PiwgPCZoYXJ0Nz47Cj4+ICAgICB9
Cj4+ICAgIH0KPj4gICAgdG9wX2xldmVsIHsgLy8gQSBncm91cCB3aXRoIGFsbCBoYXJ0cyBpbiBp
dAo+PiAgICAgc2hhcmVkID0gIiIgLy8gVGhlcmUgaXMgbm90aGluZyBjb21tb24gZm9yIEFMTCBo
YXJ0cywgd2UgY291bGQgCj4+IGhhdmUKPj4gY2FwYWNpdHkgaGVyZQo+PiAgICB9Cj4+IH0KPj4g
Cj4gCj4gSSBhZ3JlZSB0aGF0IG5hbWluZyBjb3VsZCBoYXZlIGJlZW4gYmV0dGVyIGluIHRoZSBw
YXN0LiBCdXQgaXQgaXMgd2hhdAo+IGl0IGlzIG5vdy4gSSBkb24ndCBzZWUgYW55IGJpZyBhZHZh
bnRhZ2VzIGluIHRoaXMgYXBwcm9hY2ggY29tcGFyZWQgdG8KPiB0aGUgZXhpc3RpbmcgYXBwcm9h
Y2ggd2hlcmUgRFQgc3BlY2lmaWVzIHdoYXQgaGFyZHdhcmUgbG9va3MgbGlrZSBhbmQKPiBzY2hl
ZHVsZXIgc2V0cyB1cCBpdCdzIGRvbWFpbiBiYXNlZCBvbiBkaWZmZXJlbnQgY3B1bWFza3MuCj4g
CgpJdCBpcyB3aGF0IGl0IGlzIG9uIEFSTSwgaXQgZG9lc24ndCBoYXZlIHRvIGJlIHRoZSBzYW1l
IG9uIFJJU0MtViwgCmFueXdheQp0aGUgbmFtZSBpcyBhIG1pbm9yIGlzc3VlLiBUaGUgYWR2YW50
YWdlIG9mIHRoaXMgYXBwcm9hY2ggaXMgdGhhdCB5b3UgCmRlZmluZSB0aGUKc2NoZWR1bGluZyBk
b21haW5zIG9uIHRoZSBkZXZpY2UgdHJlZSB3aXRob3V0IG5lZWRpbmcgYSAidHJhbnNsYXRpb24i
IG9mIAphCnRvcG9sb2d5IG1hcCB0byBzY2hlZHVsaW5nIGRvbWFpbnMuIEl0IGNhbiBoYW5kbGUg
YW55IHNjZW5hcmlvIHRoZSAKc2NoZWR1bGVyCmNhbiBoYW5kbGUsIHVzaW5nIGFsbCB0aGUgYXZh
aWxhYmxlIGZsYWdzLiBJbiB5b3VyIGFwcHJvYWNoIG5vIG1hdHRlciAKd2hhdApnZXRzIHB1dCB0
byB0aGUgZGV2aWNlIHRyZWUsIHRoZSBvbmx5IGhpbnQgdGhlIHNjaGVkdWxlciB3aWxsIGdldCBp
cyBvbmUKbGV2ZWwgb2YgU01ULCBvbmUgbGV2ZWwgb2YgTUMgYW5kIHRoZSByZXN0IG9mIHRoZSBz
eXN0ZW0uIE5vIHBvd2VyIApkb21haW4Kc2hhcmluZywgbm8gYXN5bW1ldHJpYyBzY2hlZHVsaW5n
LCBubyBtdWx0aXBsZSBsZXZlbHMgcG9zc2libGUuIE1hbnkgCmZlYXR1cmVzCm9mIHRoZSBzY2hl
ZHVsZXIgcmVtYWluIHVudXNlZC4gVGhpcyBhcHByb2FjaCBjYW4gYWxzbyBnZXQgZXh0ZW5kZWQg
bW9yZSAKZWFzaWx5CnRvIGUuZy4gc3VwcG9ydCBOVU1BIG5vZGVzIGFuZCBhc3NvY2lhdGUgbWVt
b3J5IHJlZ2lvbnMgd2l0aCBncm91cHMuCgpSZWdhcmRzLApOaWNrCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
