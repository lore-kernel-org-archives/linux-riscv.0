Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA294C001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 08:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjqa3Ysn/U/dZks7CaEBcfxf+ts4IBjweoenXvYc044=; b=DlJaNR9KjCqOgC
	P3UClrHJ8uwoHhF44z0PbYwXMej+hppxCMxkirkCWcelleqwlr2Ivoz1s3Krsk5alQYMJ3QcmYnWR
	A5rGd9EGmJGk5Wz4FvU5u6EBCtA/b6uv5/zRdirIbp6yP0CnhS/PBpMpLQHFNCveiO+n4WjS3eIJy
	/q72D0a5yRdyl5cWk34OXf0VyDOCYvObTyvSwIG9TYX5oucygfm9G2aOPOs0Vl5a3cqUDNpkUBIlA
	lVlYUMeTBufzjCpx+OUaPJnZMPsjCJJla536tblowdum5ILjaMSqCeGiw/0+Cg+stCOTEhHXDVo4F
	YuWLa1t0iT0z4hfqePwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOgs-00AErT-1s;
	Thu, 20 Jul 2023 08:07:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOgp-00AEq1-1h
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 08:07:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 72A3161924;
	Thu, 20 Jul 2023 08:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BEDCC433C8;
	Thu, 20 Jul 2023 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689840430;
	bh=vi5MjxIZvlklMNcaihqDgE+Ey3S6LNVaabLJhEHYLuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cPC6z0kskbvUNcv4M115MOTVLtsbglt8rK0i2KRR6rqcbgdsjw72deZsM6++xwAVZ
	 nVG1uYY0fGPiSkZiWHkeOi2s8SU6PO1IB5U2L7QD8umvNiGttBCAC2A1UHOYmBhe8d
	 WZqLWXfXCfmD8A7uLXQ0yFn+AmIK90Duq8fOkVWFMUnpxKfNWmYatXDzPpuJhyrIld
	 +SwKbKFQdZqsrlnoqWHc8z2rcJEPqGuQpW9Y+Bf9+H1vT3xoPPsXJb7eDYPRx+BVjH
	 M9g1ctOVesaK8lVtNqBlQxEWzrWv761zKFUM/IqfBAtKESy3l/zjgUiqco53fbF+xJ
	 a45N+IOMY/nOg==
Date: Thu, 20 Jul 2023 10:07:05 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: daire.mcnamara@microchip.com, Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 0/8] PCI: microchip: Fixes and clean-ups
Message-ID: <ZLjrKTLhNhPhlEbg@lpieralisi>
References: <20230630154859.2049521-1-daire.mcnamara@microchip.com>
 <20230719-roster-preheated-799d7e103ddb@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719-roster-preheated-799d7e103ddb@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_010711_667066_1D2B1F18 
X-CRM114-Status: GOOD (  24.88  )
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

T24gV2VkLCBKdWwgMTksIDIwMjMgYXQgMDY6MDA6MzdQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IEhleSBmb2xrcywKPiAKPiBPbiBGcmksIEp1biAzMCwgMjAyMyBhdCAwNDo0ODo1MVBN
ICswMTAwLCBkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tIHdyb3RlOgo+ID4gRnJvbTogRGFp
cmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+Cj4gPiAKPiA+IFRoaXMg
cGF0Y2ggc2VyaWVzIGNvbnRhaW5zIGZpeGVzIGFuZCBjbGVhbi11cHMgZm9yIHRoZSBNaWNyb2No
aXAgUG9sYXJGaXJlIFNvQyBQQ0llIGRyaXZlcgo+ID4gCj4gPiBUaGVzZSBwYXRjaGVzIGFyZSBl
eHRyYWN0ZWQgZnJvbSB0aGUgbGluayBiZWxvdyB0byBzZXBhcmF0ZSB0aGVtIGZyb20gdGhlIG91
dGJvdW5kIGFuZCBpbmJvdW5kCj4gPiByYW5nZSBoYW5kbGluZyB3aGljaCBpcyB0YWtpbmcgY29u
c2lkZXJhYmxlIHRpbWUuCj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1y
aXNjdi8yMDIzMDExMTEyNTMyMy4xOTExMzczLTEtZGFpcmUubWNuYW1hcmFAbWljcm9jaGlwLmNv
bS8KPiA+IAo+ID4gVGhlc2UgcGF0Y2hlcyBhcmUgcmVnZW5lcmF0ZWQgb24gdjYuNC1yYzYuCj4g
PiAKPiA+IE1haW4gQ2hhbmdlcyBmcm9tIHYxOgo+ID4gLSBEcm9wcGVkICJSZW1vdmUgY2FzdCB3
YXJuaW5nIGZvciBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoKSIuIFRoaXMKPiA+ICAgaGFzIGJl
ZW4gb3ZlcnRha2VuIGJ5IGEgcGF0Y2ggc2VyaWVzIGZyb20gS3J6eXN6dG9mIFdpbGN6eW5za2ku
Cj4gPiAtIEltcHJvdmVkIHRoZSBjb21tZW50IGZvciAiRW5hYmxlIGJ1aWxkaW5nIGRyaXZlciBh
cyBhIG1vZHVsZSIgdG8KPiA+ICAgY2xhcmlmeSB3aGF0IGVuYWJsZXMgYnVpbGRpbmcgdGhlIGRy
aXZlciBhcyBhIG1vZHVsZS4KPiA+IC0gU3BsaXQgIkdhdGhlciBNU0kgaW5mb3JtYXRpb24gZnJv
bSBoYXJkd2FyZSBjb25maWcgcmVnaXN0ZXJzIiwKPiA+ICAgZm9yIGNsYXJpdHksIGludG86Cj4g
PiAgICAtICJHYXRoZXIgTVNJIGluZm9ybWF0aW9uIGZyb20gaGFyZHdhcmUgY29uZmlnIHJlZ2lz
dGVycyIgcHVyZWx5Cj4gPiAgICAgICBjaGFuZ2luZyB0aGUgb2Ygc291cmNlIG9mIE1TSS1yZWxh
dGVkIGluZm9ybWF0aW9uIChOdW0gTVNJcyBhbmQKPiA+ICAgICAgIE1TSSBhZGRyZXNzKSBmcm9t
ICNkZWZpbmVzICh3aGljaCBjYW4gYmUgaW5jb3JyZWN0KSB0byBGUEdBCj4gPiAgICAgICBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVycyAod2hpY2ggaXMgdGhlIHVsdGltYXRlIHNvdXJjZSBvZiB0cnV0
aCksCj4gPiAgICAgICBhbmQgYQo+ID4gICAgLSAiUmVuYW1lIGFuZCByZWZhY3RvciAuLi4iIHBh
dGNoIGFzIGEgZnVuY3Rpb24ncyBjb2RlIGlzIG5vdyBjbGVhcmx5Cj4gPiAgICAgICB1bnJlbGF0
ZWQgdG8gaXRzIGN1cnJlbnQgbmFtZS4KPiAKPiBUaGlzIHNlcmllcyBoYXMgYmVlbiBzaXR0aW5n
IHdpdGggcmV2aWV3cyAoYWxiZWl0IGZyb20gbXlzZWxmKSBmb3IgYQo+IGNvdXBsZSBvZiB3ZWVr
cy4gV2hhdCdzIG1pc3NpbmcgdG8gZ2V0IHRoaXMgc2VyaWVzIHBpY2tlZCB1cD8KCldlIGFyZSBh
dCB2Ni41LXJjMiAtIGZpeGVzIGFyZSBub3QgdXJnZW50LCB0aGVyZSBpcyBub3RoaW5nIG1pc3Np
bmcKb3RoZXIgdGhhbiB1cyBnb2luZyB0aHJvdWdoIHRoZSBwYXRjaCBxdWV1ZSBhbmQgcmV2aWV3
IGl0L3BpY2sgaXQgdXAuCgpUaGFua3MsCkxvcmVuem8KCj4gVGhhbmtzLAo+IENvbm9yLgo+IAo+
ID4gY2M6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gPiBjYzog
TG9yZW56byBQaWVyYWxpc2kgPGxwaWVyYWxpc2lAa2VybmVsLm9yZz4KPiA+IGNjOiAiS3J6eXN6
dG9mIFdpbGN6ecWEc2tpIiA8a3dAbGludXguY29tPgo+ID4gY2M6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gPiBjYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4K
PiA+IGNjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBjYzogbGludXgtcGNp
QHZnZXIua2VybmVsLm9yZwo+ID4gCj4gPiBEYWlyZSBNY05hbWFyYSAoOCk6Cj4gPiAgIFBDSTog
bWljcm9jaGlwOiBDb3JyZWN0IHRoZSBERUQgYW5kIFNFQyBpbnRlcnJ1cHQgYml0IG9mZnNldHMK
PiA+ICAgUENJOiBtaWNyb2NoaXA6IEVuYWJsZSBidWlsZGluZyBkcml2ZXIgYXMgYSBtb2R1bGUK
PiA+ICAgUENJOiBtaWNyb2NoaXA6IEFsaWduIHJlZ2lzdGVyLCBvZmZzZXQsIGFuZCBtYXNrIG5h
bWVzIHdpdGggaHcgZG9jcwo+ID4gICBQQ0k6IG1pY3JvY2hpcDogRW5hYmxlIGV2ZW50IGhhbmRs
ZXJzIHRvIGFjY2VzcyBicmlkZ2UgYW5kIGN0cmwgcHRycwo+ID4gICBQQ0k6IG1pY3JvY2hpcDog
Q2xlYW4gdXAgaW5pdGlhbGlzYXRpb24gb2YgaW50ZXJydXB0cwo+ID4gICBQQ0k6IG1pY3JvY2hp
cDogR2F0aGVyIE1TSSBpbmZvcm1hdGlvbiBmcm9tIGhhcmR3YXJlIGNvbmZpZyByZWdpc3RlcnMK
PiA+ICAgUENJOiBtaWNyb2NoaXA6IFJlbmFtZSBhbmQgcmVmYWN0b3IgbWNfcGNpZV9lbmFibGVf
bXNpKCkKPiA+ICAgUENJOiBtaWNyb2NoaXA6IFJlLXBhcnRpdGlvbiBjb2RlIGJldHdlZW4gcHJv
YmUoKSBhbmQgaW5pdCgpCj4gPiAKPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL0tjb25maWcg
ICAgICAgICAgICAgICB8ICAgMiArLQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvcGNpZS1t
aWNyb2NoaXAtaG9zdC5jIHwgNDAyICsrKysrKysrKysrLS0tLS0tLS0KPiA+ICAyIGZpbGVzIGNo
YW5nZWQsIDIzOCBpbnNlcnRpb25zKCspLCAxNjYgZGVsZXRpb25zKC0pCj4gPiAKPiA+IAo+ID4g
YmFzZS1jb21taXQ6IDg1OGZkMTY4YTk1YzViOTY2OWFhYzhkYjZjMTRhOWFlYWI0NDYzNzUKPiA+
IC0tIAo+ID4gMi4yNS4xCj4gPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
