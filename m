Return-Path: <SRS0=mq7p=N6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53395C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:58:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B492080C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 19 Nov 2018 22:58:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ktqgIqEk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GW2jKEwt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="RFiZiaTg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B492080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9a+S/0AY6D/cfKiVcvGzsBoBqVn11+vK8227/Nkzi7o=; b=ktqgIqEk6TmOwG+LzSj9wiWBv
	xEeIM9vYKA7f0nR7IMYHikm37jwtocDzVrRuH7yAjoRtZHklyz6664hY9y8VLvT+9/FVEo9AhJC3C
	3ICMj9mOz3Rk97hdXcrziLAXdRoe6tdLyInqC32J8E6PQlsYRtTPpZnqM37mAStldg2gytX0sLRRW
	7+TY5nTWnNSRx3l5HqcbgfWg2qNVJJQPbwl/XvDFfhgq/UbC9eTdfXZlXeOSYn90Js3JVp30S22FJ
	JBDV/rVXlnmGLDjQQ0Ox3rub+tE4yUvZu1xt4x5VYxq4geiIcrcPjYdmyh6ZcrzerPcpAYbehL97i
	AwCG2Nzmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gOsVG-0005Es-C6; Mon, 19 Nov 2018 22:58:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsVF-0005Em-7P
 for linux-riscv@bombadil.infradead.org; Mon, 19 Nov 2018 22:58:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8yNeuNW1/m716Ce/+Trs0VBstMhHUhlhgMM8hPJ57Fs=; b=GW2jKEwt8GpFfa7j98OAn/2dnM
 eY0XWksqsQSN8vvUO9DrUEKfylzqVgsVlt7tkbvLuAwHvW3x3NvMwyX+cb/6c5V4MXTwMUlQpghSu
 sSF7Fr8ZARimCpAANWlIMHPtRHbOAY84MdGjKrGj67fUvOXi+fhn1lZQHp8jx1bw/wU+jXsm7O+JH
 +/yWF6oa03yqjubV4cTOLkkSev/ecOhWwk/VY5OZXBJe0TcgIC3twqkAuSSQ8WExMOm8hVD3SxzN6
 heYk9wj4396lLX+EOV5jJSj32OhJJVLhXaLMjBXK2SOg1ZF10GERhy5eYcAfs8GNy9AN/wkHOEGzt
 nxL3kLYA==;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gOsVA-0003En-HQ
 for linux-riscv@lists.infradead.org; Mon, 19 Nov 2018 22:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1542668325; x=1574204325;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=xo5Q5RV3YFX0ErLgzpSmh+1RrOQ8u6MH/2dGf1lv6Ng=;
 b=RFiZiaTg0Ys+/09Fip9k4SnwLb2ZngulWg0NVjgjHhmkquYqX+6yJ3ri
 bOl+4OiWkGTEXkS6p7Ob+B2Gh/ruPvnG9z/Y9fr9s+z72W8gMDl5ZPRe/
 pC74VFQKIqR7PYQET226UsDtIp7LiZXjYryOfkqdRyW8QMSicL17xglvF
 2+1iODM9X4O7v7pINFkVTAsTQZx+AOgy0UAaoSOhTXgJz+u1PdzI6T8W8
 ZejP4+qImN057ztW0YkyhV+kn1gQ0L0cW7jWhocHqe50UqSiGaB48bsF4
 tzN25tBWPu+PP+OBH0pL1/Pj2sAYWtweZs8z5ymyxoSoIrDLxnP6c1ini g==;
X-IronPort-AV: E=Sophos;i="5.56,254,1539619200"; d="scan'208";a="94639264"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 20 Nov 2018 06:58:33 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 19 Nov 2018 14:41:48 -0800
Received: from cnf003109.ad.shared (HELO [10.86.54.248]) ([10.86.54.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Nov 2018 14:58:32 -0800
Subject: Re: [PATCH v5] RISC-V: Update Kconfig to better handle CMDLINE
To: Nick Kossifidis <mick@ics.forth.gr>
References: <20181119210907.12040-1-palmer@sifive.com>
 <95449dce-5bca-1034-e6ed-947055a37abd@wdc.com>
 <32feca21cac15e84893eb1e39a5cf684@mailhost.ics.forth.gr>
From: Atish Patra <atish.patra@wdc.com>
Message-ID: <28d6d712-25d2-8109-f4ba-5be6af7983d1@wdc.com>
Date: Mon, 19 Nov 2018 14:58:31 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <32feca21cac15e84893eb1e39a5cf684@mailhost.ics.forth.gr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181119_225845_378737_4E1EAE5B 
X-CRM114-Status: GOOD (  32.48  )
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
Cc: "dmaliotaki@gmail.com" <dmaliotaki@gmail.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181119225831.bJ7EyNrE8qx3P1NEqN-R8IUivY44QhxPnlzsfZh6PuM@z>

T24gMTEvMTkvMTggMjo1MCBQTSwgTmljayBLb3NzaWZpZGlzIHdyb3RlOgo+IM6jz4TOuc+CIDIw
MTgtMTEtMjAgMDA6MzcsIEF0aXNoIFBhdHJhIM6tzrPPgc6xz4jOtToKPj4gT24gMTEvMTkvMTgg
MToxMCBQTSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4+PiBGcm9tOiBOaWNrIEtvc3NpZmlkaXMg
PG1pY2tAaWNzLmZvcnRoLmdyPgo+Pj4KPj4+IEFkZGVkIGEgbWVudSB0byBjaG9vc2UgaG93IHRo
ZSBidWlsdC1pbiBjb21tYW5kIGxpbmUgd2lsbCBiZQo+Pj4gdXNlZCBhbmQgQ01ETElORV9FWFRF
TkQgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCBGRFQgY29kZS4KPj4+Cj4+PiB2MjogSW1wcm92ZWQg
aGVscCBtZXNzYWdlcywgcmVtb3ZlZCByZWZlcmVuY2VzIHRvIGJvb3Rsb2FkZXIKPj4+IGFuZCBt
YWRlIHRoZW0gbW9yZSBkZXNjcmlwdGl2ZS4gSSBhbHNvIGFza2VkIGhlbHAgZnJvbSBhCj4+PiBm
cmllbmQgd2hvJ3MgYSBsYW5ndWFnZSBleHBlcnQganVzdCBpbiBjYXNlLgo+Pj4KPj4+IHYzOiBU
aGlzIHRpbWUgdXNlZCB0aGUgY29ycmVjdGVkIHRleHQKPj4+Cj4+PiB2NDogQ29weSB0aGUgY29u
ZmlnIHN0cmluZ3MgZnJvbSB0aGUgYXJtMzIgcG9ydC4KPj4+Cj4+PiB2NTogQWN0dWFsbHkgY29w
eSB0aGUgY29uZmlnIHN0cmluZ3MgZnJvbSB0aGUgYXJtMzIgcG9ydC4KPj4KPj4gV2h5IG5vdCB1
c2UgQ01ETElORV9GUk9NX0JPT1RMT0FERVIgaW5zdGVhZCBvZiBDTURMSU5FX0ZBTExCQUNLIGlu
Cj4+IHRoYXQgY2FzZT8gVG8gbXkgZWFycywgQ01ETElORV9GUk9NX0JPT1RMT0FERVIgbWFkZSBt
b3JlIHNlbnNlIGdpdmVuCj4+IHRoZSBkZXNjcmlwdGlvbi4gSWYgQ01ETElORV9GQUxMQkFDSyBp
cyByZXRhaW5lZCBpbnRlbnRpb25hbGx5LCB0aGVuCj4+IGl0J3Mgb2suCj4+Cj4+IFJlZ2FyZHMs
Cj4+IEF0aXNoCj4gCj4gVGhleSBhcmUgYm90aCB1c2VkIGFzIHBsYWNlaG9sZGVycyBzbyB0aGF0
IHdlIGRvbid0IHRyaWdnZXIKPiBDTURMSU5FX0VYVEVORCBvciBDTURMSU5FX0ZPUkNFIHNvIGl0
IGRvZXNuJ3QgcmVhbGx5IG1hdHRlcgo+IGhvdyB3ZSBjYWxsIHRoZW0uIFRvIG1lIENNRExJTkVf
RlJPTV9CT09UTE9BREVSIGltcGxpZXMgdGhhdAo+IHdlIGdldCB0aGUgY29tbWFuZCBsaW5lIGZy
b20gdGhlIGJvb3Rsb2FkZXIgd2hlcmUgaW4gZmFjdCB3ZQo+IGdldCBpdCBmcm9tIHRoZSBkZXZp
Y2UgdHJlZSBhbmQgd2UgbWlnaHQgZ2V0IGl0IGZyb20gb3RoZXIKPiBjaGFubmVscyBpbiB0aGUg
ZnV0dXJlIChlLmcuIGtleGVjKS4gSSB0aGluayBpdCdzIG1pc2xlYWRpbmcKPiB0byBoYXZlIGFu
eSByZWZlcmVuY2VzIG9uIGhvdyB3ZSBnZXQgdGhlIGNvbW1hbmQgbGluZSwgdGhhdCdzCj4gd2h5
IEkgcmVtb3ZlZCBhbnkgcmVmZXJlbmNlcyB0byB0aGUgYm9vdGxvYWRlciBmcm9tIHRoZSB0ZXh0
Cj4gYXMgd2VsbCwgQ01ETElORV9GQUxMQkFDSyBvbiB0aGUgb3RoZXIgaGFuZCBkZXNjcmliZXMg
aG93Cj4gd2UgdXNlIHRoZSBwcm92aWRlZCBjb21tYW5kIGxpbmUsIHdoaWNoIGlzIG1vcmUgYXBw
cm9wcmlhdGUKPiBJTUhPLgo+IAoKSSBhbSBub3QgdG9vIHBlZGFudGljIGFib3V0IHRoZSBuYW1l
cyBlaXRoZXIuIEJ1dCB0aGUgZGVzY3JpcHRpb24gc2F5cwoiYm9vbCBVc2UgYm9vdGxvYWRlciBr
ZXJuZWwgYXJndW1lbnRzIGlmIGF2YWlsYWJsZSIKClRoaXMgd2FzIHRoZSBleGFjdCBvbmUgdXNl
ZCBmb3IgYXJtMzIgYXMgd2VsbCBhbmQgaW5kaWNhdGVzIHRoYXQgd2UgCnByZWZlciB0byBnZXQg
aXQgZnJvbSBib290bG9hZGVyIGlmIHRoaXMgb3B0aW9uIGlzIHNldC4gSGVuY2UgdGhlIApjb21t
ZW50LiBNYXkgYmUgcmV2aXNlIHRoZSBkZXNjcmlwdGlvbiA/CgoKUmVnYXJkcywKQXRpc2gKPiBS
ZWdhcmRzLAo+IE5pY2sKPiAKPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMg
PG1pY2tAaWNzLmZvcnRoLmdyPgo+Pj4gU2lnbmVkLW9mZi1ieTogRGViYmllIE1hbGlvdGFraSA8
ZG1hbGlvdGFraUBnbWFpbC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQYWxtZXIgRGFiYmVsdCA8
cGFsbWVyQHNpZml2ZS5jb20+Cj4+PiAtLS0KPj4+ICAgIGFyY2gvcmlzY3YvS2NvbmZpZyB8IDU3
Cj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tCj4+PiAg
ICAxIGZpbGUgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjQgZGVsZXRpb25zKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvS2NvbmZpZyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+
Pj4gaW5kZXggNTVkYTkzZjRlODE4Li4yM2FjNmQ2ZjlhYjIgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNo
L3Jpc2N2L0tjb25maWcKPj4+ICsrKyBiL2FyY2gvcmlzY3YvS2NvbmZpZwo+Pj4gQEAgLTIyNywz
OSArMjI3LDQ4IEBAIGVuZG1lbnUKPj4+ICAgICAgbWVudSAiQm9vdCBvcHRpb25zIgo+Pj4gICAg
LWNvbmZpZyBDTURMSU5FX0JPT0wKPj4+IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQg
bGluZSIKPj4+ICtjb25maWcgQ01ETElORQo+Pj4gKwlzdHJpbmcgIkJ1aWx0LWluIGtlcm5lbCBj
b21tYW5kIGxpbmUiCj4+PiAgICAJaGVscAo+Pj4gLQkgIEZvciBtb3N0IHBsYXRmb3JtcywgaXQg
aXMgZmlybXdhcmUgb3Igc2Vjb25kIHN0YWdlIGJvb3Rsb2FkZXIKPj4+IC0JICB0aGF0IGJ5IGRl
ZmF1bHQgc3BlY2lmaWVzIHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIG9wdGlvbnMuCj4+PiAtCSAg
SG93ZXZlciwgaXQgbWlnaHQgYmUgbmVjZXNzYXJ5IG9yIGFkdmFudGFnZW91cyB0byBlaXRoZXIg
b3ZlcnJpZGUKPj4+IC0JICB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBsaW5lIG9yIGFkZCBh
IGZldyBleHRyYSBvcHRpb25zIHRvIGl0Lgo+Pj4gLQkgIEZvciBzdWNoIGNhc2VzLCB0aGlzIG9w
dGlvbiBhbGxvd3MgaGFyZGNvZGluZyBjb21tYW5kIGxpbmUgb3B0aW9ucwo+Pj4gLQkgIGRpcmVj
dGx5IGludG8gdGhlIGtlcm5lbC4KPj4+ICsJICBGb3IgbW9zdCBwbGF0Zm9ybXMsIHRoZSBhcmd1
bWVudHMgZm9yIHRoZSBrZXJuZWwncyBjb21tYW5kIGxpbmUKPj4+ICsJICBhcmUgcHJvdmlkZWQg
YXQgcnVuLXRpbWUsIGR1cmluZyBib290LiBIb3dldmVyLCB0aGVyZSBhcmUgY2FzZXMKPj4+ICsJ
ICB3aGVyZSBlaXRoZXIgbm8gYXJndW1lbnRzIGFyZSBiZWluZyBwcm92aWRlZCBvciB0aGUgcHJv
dmlkZWQKPj4+ICsJICBhcmd1bWVudHMgYXJlIGluc3VmZmljaWVudCBvciBldmVuIGludmFsaWQu
Cj4+PiAgICAtCSAgRm9yIHRoYXQsIGNob29zZSAnWScgaGVyZSBhbmQgZmlsbCBpbiB0aGUgZXh0
cmEgYm9vdCBwYXJhbWV0ZXJzCj4+PiAtCSAgaW4gQ09ORklHX0NNRExJTkUuCj4+PiArCSAgV2hl
biB0aGF0IG9jY3VycywgaXQgaXMgcG9zc2libGUgdG8gZGVmaW5lIGEgYnVpbHQtaW4gY29tbWFu
ZAo+Pj4gKwkgIGxpbmUgaGVyZSBhbmQgY2hvb3NlIGhvdyB0aGUga2VybmVsIHNob3VsZCB1c2Ug
aXQgbGF0ZXIgb24uCj4+PiAgICAtCSAgVGhlIGJ1aWx0LWluIG9wdGlvbnMgd2lsbCBiZSBjb25j
YXRlbmF0ZWQgdG8gdGhlIGRlZmF1bHQgY29tbWFuZAo+Pj4gLQkgIGxpbmUgaWYgQ01ETElORV9G
T1JDRSBpcyBzZXQgdG8gJ04nLiBPdGhlcndpc2UsIHRoZSBkZWZhdWx0Cj4+PiAtCSAgY29tbWFu
ZCBsaW5lIHdpbGwgYmUgaWdub3JlZCBhbmQgcmVwbGFjZWQgYnkgdGhlIGJ1aWx0LWluIHN0cmlu
Zy4KPj4+ICtjaG9pY2UKPj4+ICsJcHJvbXB0ICJCdWlsdC1pbiBjb21tYW5kIGxpbmUgdXNhZ2Ui
IGlmIENNRExJTkUgIT0gIiIKPj4+ICsJZGVmYXVsdCBDTURMSU5FX0ZBTExCQUNLCj4+PiArCWhl
bHAKPj4+ICsJICBDaG9vc2UgaG93IHRoZSBrZXJuZWwgd2lsbCBoYW5kbGUgdGhlIHByb3ZpZGVk
IGJ1aWx0LWluIGNvbW1hbmQKPj4+ICsJICBsaW5lLgo+Pj4gICAgLWNvbmZpZyBDTURMSU5FCj4+
PiAtCXN0cmluZyAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+Pj4gLQlkZXBlbmRz
IG9uIENNRExJTkVfQk9PTAo+Pj4gLQlkZWZhdWx0ICIiCj4+PiArY29uZmlnIENNRExJTkVfRkFM
TEJBQ0sKPj4+ICsJYm9vbCAiVXNlIGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyBpZiBhdmFp
bGFibGUiCj4+PiAgICAJaGVscAo+Pj4gLQkgIFN1cHBseSBjb21tYW5kLWxpbmUgb3B0aW9ucyBh
dCBidWlsZCB0aW1lIGJ5IGVudGVyaW5nIHRoZW0gaGVyZS4KPj4+ICsJICBVc2UgdGhlIGJ1aWx0
LWluIGNvbW1hbmQgbGluZSBhcyBmYWxsYmFjayBpbiBjYXNlIHdlIGdldCBub3RoaW5nCj4+PiAr
CSAgZHVyaW5nIGJvb3QuIFRoaXMgaXMgdGhlIGRlZmF1bHQgYmVoYXZpb3VyLgo+Pj4KPj4+ICtj
b25maWcgQ01ETElORV9FWFRFTkQKPj4+ICsJYm9vbCAiRXh0ZW5kIGJvb3Rsb2FkZXIga2VybmVs
IGFyZ3VtZW50cyIKPj4+ICsJaGVscAo+Pj4gKwkgIFRoZSBjb21tYW5kLWxpbmUgYXJndW1lbnRz
IHByb3ZpZGVkIGR1cmluZyBib290IHdpbGwgYmUKPj4+ICsJICBhcHBlbmRlZCB0byB0aGUgYnVp
bHQtaW4gY29tbWFuZCBsaW5lLiBUaGlzIGlzIHVzZWZ1bCBpbgo+Pj4gKwkgIGNhc2VzIHdoZXJl
IHRoZSBwcm92aWRlZCBhcmd1bWVudHMgYXJlIGluc3VmZmljaWVudCBhbmQKPj4+ICsJICB5b3Ug
ZG9uJ3Qgd2FudCB0byBvciBjYW5ub3QgbW9kaWZ5IHRoZW0uCj4+PiArCj4+PiAgICAgIGNvbmZp
ZyBDTURMSU5FX0ZPUkNFCj4+PiAtCWJvb2wgIkJ1aWx0LWluIGNvbW1hbmQgbGluZSBvdmVycmlk
ZXMgYm9vdGxvYWRlciBhcmd1bWVudHMiCj4+PiAtCWRlcGVuZHMgb24gQ01ETElORV9CT09MCj4+
PiArCWJvb2wgIkFsd2F5cyB1c2UgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+
Pj4gICAgCWhlbHAKPj4+IC0JICBTZXQgdGhpcyBvcHRpb24gdG8gJ1knIHRvIGhhdmUgdGhlIGtl
cm5lbCBpZ25vcmUgdGhlIGJvb3Rsb2FkZXIKPj4+IC0JICBvciBmaXJtd2FyZSBjb21tYW5kIGxp
bmUuICBJbnN0ZWFkLCB0aGUgYnVpbHQtaW4gY29tbWFuZCBsaW5lCj4+PiAtCSAgd2lsbCBiZSB1
c2VkIGV4Y2x1c2l2ZWx5Lgo+Pj4gKwkgIEFsd2F5cyB1c2UgdGhlIGJ1aWx0LWluIGNvbW1hbmQg
bGluZSwgZXZlbiBpZiB3ZSBnZXQgb25lIGR1cmluZwo+Pj4gKwkgIGJvb3QuIFRoaXMgaXMgdXNl
ZnVsIGluIGNhc2UgeW91IG5lZWQgdG8gb3ZlcnJpZGUgdGhlIHByb3ZpZGVkCj4+PiArCSAgY29t
bWFuZCBsaW5lIG9uIHN5c3RlbXMgd2hlcmUgeW91IGRvbid0IGhhdmUgb3Igd2FudCBjb250cm9s
Cj4+PiArCSAgb3ZlciBpdC4KPj4+ICAgIC0JICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRv
IGhlcmUsIHNheSBOLgo+Pj4gK2VuZGNob2ljZQo+Pj4gICAgICBlbmRtZW51Cj4+Pgo+IAo+IAoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
