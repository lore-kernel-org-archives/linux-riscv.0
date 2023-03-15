Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720DBC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 04:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ifhIYQpFEgKc9Nh8NwcWbr9E1Dd4s/uX8ZpytV3lCbQ=; b=gYqbEB5ZsyS0R/
	Xiz08YJa/thCwi6d+EEgAdvdFI29kTnu9HylNJRr8uc4jhcUayCFTSsFISE6+GKHpLQsmSSObNYtK
	aeCDrwkvf2Q186tbCAexuLZ2W5UwjARGf6fmGrwQOmuskvby6m2C0GR6BcUfh29OPpIfvbQzmmo6h
	o21pmGZLcj2gK8D5beV9nmbLsdh5IigCt0NbbaQqYOgSzQBQCy48/yw3EzTxDpJbOS9VwPRYXrRjw
	0uqlkJqZgumJ46+Liy0XMn9sxaTTXpHW6HJzqRIuag+cTyYRgbd+al16hy7OZDDDL3cW6htYgTFZ3
	rY8V8J7zeXiHdRHS2oNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIVZ-00CFUr-12;
	Wed, 15 Mar 2023 04:13:01 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcIVV-00CFU0-1U
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 04:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1678853577; x=1710389577;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9yzCmVnJ2ADFgpoYjZxap/HmlSXife7MeskouNF4fAo=;
  b=TBvFOfEJW5RX2kQijeYqx6yt7qbLf+5S1ImLxS001otTbmHnDSD+qswA
   e00p6UUemh3ETMrbql1GzUijZ6Z4eIJB78IUcn2znw1OzMni/slBiMzY5
   hJiqv3ykf8zOYljlPc+FVLKokt/fem/30ROIA73j7YfuAFTLOb2bi3XZ7
   UwPPOZqqT1daGjin2N/SkZ5fZSiJZ3Rrhjwn6IBO1vpDeSxLoAWVTYYwk
   +7tUOoCHZ+1luG9wWED2SaF/RMVA2c33h5SthFh9SvY5PosTXn3VEaLEv
   c3VT/g61yJGR4ZGtMISe3MLGXJ5/xGKaJH845FihT5tpP0yfsgV+3ue30
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,261,1673884800"; 
   d="scan'208";a="230609556"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 15 Mar 2023 12:12:54 +0800
IronPort-SDR: O6wMu5oseBuUs0ZHZJexlnckgu0+k4p2j5Gjlg+wNSRIGxgU56MSKHiCU2xODUdPzZOApHoyj/
 UAYeGFFhFVSLLso/q18l1p/bE36ET+ckLkt1Ejg74rHGOHZw7Q29foeiNl1KMSz9wVypJr4pqk
 t6I2TpIlIDWPpMht01sKPJZuvkvjbXJidPKtKTLtWTJfKZFjv3wTV6nDPcqIDil0+IIWrNzxGy
 EDj7ZEFAMXxd/3/ZxQt96op4QX3XWuJ48GCf1dfjghgDA/PNyCJwVZFTH11NtUXLTNfqsBvsQ5
 Zqc=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 20:23:40 -0700
IronPort-SDR: OJzWZEvqLIKcP37LHitsZ+oao5QW1ZbRph8sxr7YNIWN7+Lnlvuwlbh2SAELodG9FFtuYTB2IB
 c5AusaYD0wdxvC9Lt977weNli4KZ/JnhCXqua9UqxnLnvNMCSV4PTy+0dH762o11uQ43NUKkvM
 YNVwK2lBBHBB+syO7E0ScAmVzH2Cf5uTPgHkK98IATganaHTRw354Y4fiMNP/8vrB0FibZ8zQI
 X+CHGba5hqQoEcq8kQRme4Bia56JCJHribFhcvSqGzB2UrMdTiSD2pHmXJIa5Lb0QImEBLNvcM
 zmI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 14 Mar 2023 21:12:54 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4Pbxnf1ST0z1RtVn
	for <linux-riscv@lists.infradead.org>; Tue, 14 Mar 2023 21:12:54 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:references:to:content-language
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1678853573; x=1681445574; bh=9yzCmVnJ2ADFgpoYjZxap/HmlSXife7Mesk
	ouNF4fAo=; b=FBbk/eB6Leir1m8WJTARQJodRW25c5yVCiZrI8NcVcF7O2J1xMt
	C8BfqepJRN9OKXEvrVw3gGRmYljk51KsV+dWSqDLFzKD/jkB20gLQF4XxVtdlWQB
	rsoqP06MOheGOynGW3yA8fqrQmDvWczDM0GISt9QOcyuTWcG0I/cyNzZuhykoH5r
	dTVP1o6PWAqvuM0rJqAlWOa/JpFmZrOLVNpKmkblsZeNX6+phBQ67pEhVeRth/Jm
	WG6+6aR8pkY1MTHCmZ6P1WmpNPmBuxI9EHDg9a74LqMZtjg15+CZl1a7AxihsqzP
	fBgrdlVGQEMkmYhOWkLYiEeabP3QFh21CNw==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id EZXO_QAYZJXo for <linux-riscv@lists.infradead.org>;
	Tue, 14 Mar 2023 21:12:53 -0700 (PDT)
Received: from [10.225.163.84] (unknown [10.225.163.84])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4Pbxnc2Dq3z1RtVm;
	Tue, 14 Mar 2023 21:12:52 -0700 (PDT)
Message-ID: <9521f4da-1451-293e-ce0a-08b9edad2298@opensource.wdc.com>
Date: Wed, 15 Mar 2023 13:12:50 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/2] riscv: support ELF format binaries in nommu mode
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, gerg@kernel.org, macro@orcam.me.uk
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <mhng-a62a57b8-4268-4c51-b79e-f5f6bd0c13a2@palmer-ri-x1c9a>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <mhng-a62a57b8-4268-4c51-b79e-f5f6bd0c13a2@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_211257_566169_A5ED7614 
X-CRM114-Status: GOOD (  26.45  )
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

T24gMy8xNS8yMyAxMjo1OCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVHVlLCAyOCBGZWIg
MjAyMyAxNjoyMDozNSBQU1QgKC0wODAwKSwgZ2VyZ0BrZXJuZWwub3JnIHdyb3RlOgo+PiBIaSBQ
YWxtZXIsCj4+Cj4+IE9uIDEvMy8yMyAwNzo1MiwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+PiBP
biBUdWUsIDI4IEZlYiAyMDIzIDA1OjUxOjI0IFBTVCAoLTA4MDApLCBnZXJnQGtlcm5lbC5vcmcg
d3JvdGU6Cj4+Pj4gVGhlIGZvbGxvd2luZyBjaGFuZ2VzIGFkZCB0aGUgYWJpbGl0eSB0byBydW4g
RUxGIGZvcm1hdCBiaW5hcmllcyB3aGVuCj4+Pj4gcnVubmluZyBSSVNDLVYgaW4gbm9tbXUgbW9k
ZS4gVGhhdCBzdXBwb3J0IGlzIGFjdHVhbGx5IHBhcnQgb2YgdGhlCj4+Pj4gRUxGLUZEUElDIGxv
YWRlciwgc28gdGhlc2UgY2hhbmdlcyBhcmUgYWxsIGFib3V0IG1ha2luZyB0aGF0IHdvcmsgb24K
Pj4+PiBSSVNDLVYuCj4+Pj4KPj4+PiBUaGUgZmlyc3QgaXNzdWUgdG8gZGVhbCB3aXRoIGlzIG1h
a2luZyB0aGUgRUxGLUZEUElDIGxvYWRlciBjYXBhYmxlIG9mCj4+Pj4gaGFuZGxpbmcgNjQtYml0
IEVMRiBmaWxlcy4gQXMgY29kZWQgcmlnaHQgbm93IGl0IG9ubHkgc3VwcG9ydHMgMzItYml0Cj4+
Pj4gRUxGIGZpbGVzLgo+Pj4+Cj4+Pj4gU2Vjb25kbHkgc29tZSBjaGFuZ2VzIGFyZSByZXF1aXJl
ZCB0byBlbmFibGUgYW5kIGNvbXBpbGUgdGhlIEVMRi1GRFBJQwo+Pj4+IGxvYWRlciBvbiBSSVND
LVYgYW5kIHRvIHBhc3MgdGhlIEVMRi1GRFBJQyBtYXBwaW5nIGFkZHJlc3NlcyB0aHJvdWdoIHRv
Cj4+Pj4gdXNlciBzcGFjZSB3aGVuIGV4ZWNpbmcgdGhlIG5ldyBwcm9ncmFtLgo+Pj4+Cj4+Pj4g
VGhlc2UgY2hhbmdlcyBoYXZlIG5vdCBiZWVuIHVzZWQgdG8gcnVuIGFjdHVhbCBFTEYtRkRQSUMg
YmluYXJpZXMuCj4+Pj4gSXQgaXMgdXNlZCB0byBsb2FkIGFuZCBydW4gbm9ybWFsIEVMRiAtIGNv
bXBpbGVkIC1waWUgZm9ybWF0LiBUaG91Z2ggdGhlCj4+Pj4gdW5kZXJseWluZyBjaGFuZ2VzIGFy
ZSBleHBlY3RlZCB0byB3b3JrIHdpdGggZnVsbCBFTEYtRkRQSUMgYmluYXJpZXMgaWYKPj4+PiBv
ciB3aGVuIHRoYXQgaXMgc3VwcG9ydGVkIG9uIFJJU0MtViBpbiBnY2MuCj4+Pj4KPj4+PiBUbyBh
dm9pZCBuZWVkaW5nIGNoYW5nZXMgdG8gdGhlIEMtbGlicmFyeSAodGVzdGVkIHdpdGggdUNsaWJj
LW5nCj4+Pj4gY3VycmVudGx5KSB0aGVyZSBpcyBhIHNpbXBsZSBydW50aW1lIGR5bmFtaWMgbG9h
ZGVyIChpbnRlcnByZXRlcikKPj4+PiBhdmFpbGFibGUgdG8gZG8gdGhlIGZpbmFsIHJlbG9jYXRp
b25zLCBodHRwczovL2dpdGh1Yi5jb20vZ3JlZ3VuZ2VyZXIvdWxkc28uCj4+Pj4gVGhlIG5pY2Ug
dGhpbmcgYWJvdXQgZG9pbmcgaXQgdGhpcyB3YXkgaXMgdGhhdCB0aGUgc2FtZSBwcm9ncmFtCj4+
Pj4gYmluYXJ5IGNhbiBhbHNvIGJlIGxvYWRlZCB3aXRoIHRoZSB1c3VhbCBFTEYgbG9hZGVyIGlu
IE1NVSBsaW51eC4KPj4+Pgo+Pj4+IFRoZSBtb3RpdmF0aW9uIGhlcmUgaXMgdG8gcHJvdmlkZSBh
biBlYXN5IHRvIHVzZSBhbHRlcm5hdGl2ZSB0byB0aGUKPj4+PiBmbGF0IGZvcm1hdCBiaW5hcmll
cyBub3JtYWxseSB1c2VkIGZvciBSSVNDLVYgbm9tbXUgYmFzZWQgc3lzdGVtcy4KPj4+Pgo+Pj4+
IFNpZ25lZC1vZmYtYnk6IEdyZWcgVW5nZXJlciA8Z2VyZ0BrZXJuZWwub3JnPgo+Pj4+IC0tLQo+
Pj4+Cj4+Pj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2VsZi5owqDCoMKgwqDCoMKgwqDCoCB8
wqDCoCAxMSArKysrKysrKystCj4+Pj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5owqDC
oMKgwqDCoMKgwqDCoCB8wqDCoMKgIDQgKysrCj4+Pj4gwqBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vcHRyYWNlLmggfMKgwqDCoCA1ICsrKysKPj4+PiDCoGZzL0tjb25maWcuYmluZm10wqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAyIC0KPj4+PiDCoGZz
L2JpbmZtdF9lbGZfZmRwaWMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAz
OCArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+IMKgaW5jbHVkZS9saW51
eC9lbGYtZmRwaWMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMTQgKysrKysrKysrKyst
Cj4+Pj4gwqBpbmNsdWRlL3VhcGkvbGludXgvZWxmLWZkcGljLmjCoMKgwqDCoMKgwqAgfMKgwqAg
MTUgKysrKysrKysrKysrKwo+Pj4+IMKgNyBmaWxlcyBjaGFuZ2VkLCA2NyBpbnNlcnRpb25zKCsp
LCAyMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBBZGRpbmcgRGFtaWVuLCBhcyBJSVJDIGhlJ3MgaGFk
IHNvbWUgaGFja2VkIHVwIHVzZXJzcGFjZSBiaXRzIGZvciB0aGUgSzIxMC7CoCBJJ20geWV0IHRv
IGdldCBhbnl0aGluZyBydW5uaW5nLCBidXQgaXQnZCBiZSBncmVhdCBpZiB3ZSBnZXQgdGhpcyB0
byBhIHBvaW50IHdoZXJlIEkgY2FuIGFjdHVhbGx5IGJvb3QgdGVzdCB0aGlzIG9uIFFFTVUgKEkn
bSBqdXN0IGRvaW5nIGJ1aWxkcyBub3cpLgo+Pgo+PiBUaGlzIGlzIGEgc2ltcGxlIHNjcmlwdCBJ
IHVzZXIgdG8gZ2VuZXJhdGUgYSB3b3JraW5nIFFFTVUgZXhhbXBsZToKPj4KPj4gICAgaHR0cHM6
Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2dyZWd1bmdlcmVyL3NpbXBsZS1saW51eC9tYXN0
ZXIvYnVpbGQtcmlzY3Zub21tdS1saW51eC11Y2xpYmMtZWxmLnNoCj4+Cj4+IEl0IGRvZXMgcmVm
ZXJlbmNlIHNvbWUgY29uZmlncyBoZXJlIGh0dHBzOi8vZ2l0aHViLmNvbS9ncmVndW5nZXJlci9z
aW1wbGUtbGludXgvdHJlZS9tYXN0ZXIvY29uZmlncwo+PiBhbmQgdGhpcyBwb3N0ZWQgcGF0Y2hz
ZXQgYXMgaHR0cHM6Ly9naXRodWIuY29tL2dyZWd1bmdlcmVyL3NpbXBsZS1saW51eC90cmVlL21h
c3Rlci9wYXRjaGVzICh0aGlzIGlzCj4+IGp1c3QgdGhlc2UgMiBwYXRjaGVzIGNvbWJpbmVkIGFz
IGEgc2luZ2xlIHBhdGNoKS4KPj4KPj4KPj4+IEdpdmVuIHRoYXQgaXQncyB0aGUgc2Vjb25kIHdl
ZWsgb2YgdGhlIG1lcmdlIHdpbmRvdyBhbmQgdGhpcyBpcyBhIGJ1bmNoIG9mIG5ldyB1QUJJIGl0
IHNlZW1zIGJlc3QgdG8gaG9sZCBvZmYgdW50aWwgdGhlIG5leHQgY3ljbGUuwqAgSSBwb2tlZCBh
cm91bmQgYW5kIGRvbid0IHNlZSBhbnl0aGluZyB3cm9uZywgYnV0IEknbGwgdHJ5IGFuZCB0YWtl
IGEgbW9yZSBkZXRhaWxlZCBsb29rIGFmdGVyIHRoZSBtZXJnZSB3aW5kb3cuCj4+Cj4+IE9oLCB5
ZWFoLCBubyBodXJyeS4KPiAKPiBNYWNpZWogYW5kIERhbWllbjogSSdtIGZpbmUgdGFraW5nIHRo
aXMsIGJ1dCBub3QgaW4gYW55IHJ1c2guICBJJ2QgCj4gcmF0aGVyIGdldCB0aGUgdUFCSSByaWdo
dCBpZiB0aGluZ3MgYXJlIHN0aWxsIGluIGZsaWdodCwgYnV0IGlmIHdlJ3JlIAo+IGFsbCBqdXN0
IHdhaXRpbmcgZm9yIHNvbWV0aGluZyB0byBnZXQgbWVyZ2VkIGZpcnN0IHRoZW4gSSdtIGZpbmUg
d2l0aCAKPiB0aGF0IGJlaW5nIExpbnV4LgoKSSBkaWQgbm90IHRyeSBHZXJnIHNjcmlwdCB3aXRo
IHRoZSBrMjEwLiBObyB0aW1lIHJpZ2h0IG5vdy4KQnV0IGlmIGl0IHdvcmtzIHdpdGggUUVNVSwg
c2hvdWxkIGJlIGZpbmUuCgo+IAo+Pgo+PiBSZWdhcmRzCj4+IEdyZWcKCi0tIApEYW1pZW4gTGUg
TW9hbApXZXN0ZXJuIERpZ2l0YWwgUmVzZWFyY2gKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
