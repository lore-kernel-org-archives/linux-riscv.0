Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D57606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 23:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rob3KtrQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=alistair23.me header.i=@alistair23.me header.a=rsa-sha256 header.s=fm3 header.b=SLTRwptr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=LvIryW+U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=XpN5snmQqKVMbemXOS4o0xRQXjOccaormykMX/Mb3Dk=; b=rob3KtrQ3s8F6kh5nnu5PLOwUi
	DMhp5qgQbLgCNo40Jap1F0wLBVqCQ84wdT7ahqcrMoDUtOudwjyFQMipYsPKeavaDsrYxOHH2i8BC
	zOxMalSsUIMGD4ptozAxFQSDANZwImaZ7RwJTrMxbeuQ9a3SERIht+mbD0nX826N2Te2xr6lAnYA0
	MTExflHAAZujCTErGbFqLpGeVONb27yHFy6VzHw5emgC0RhL7tMgBmAgTikpoUUk03OKHcOe+zaIy
	hs7koYcB55AnVmsspRbu5vaJQwziPXahSlX1RGlfNj4K0BnzNjpIe7EIKh03CE5MB2GhNH8H9LO+q
	mS7aypEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvUr-00000005G7l-3ISv;
	Tue, 10 Nov 2026 23:43:25 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQvUo-00000005G7A-2zEK
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 23:43:24 +0000
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id 01648EC05F5
	for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2026 18:43:21 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Tue, 10 Nov 2026 18:43:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1794354200; x=1794440600; bh=0x6QN9wo/gIl6u/ONE+WuFx2SJWN+x0p
	CIuLNaVpstw=; b=SLTRwptregmi5YgLcqMIJr1XNTmok1drjTOQY8r7bwcZnPJY
	e3WMsgkDUiQBxSB6DEYNqLWcK4F8oo8eJw9LTPyiJBn4PZMWJ7YTPHQrrDiRgejZ
	CP8gY++zNgjuAAkDbIxIatPrnGggdEiamfEIqb72zQ1bvwbj0Lqbw2GBr4Sm3vA2
	DwEeNElmboQe3Kn//Rfhkx84HRAH3wIE637Glo5jhbRXbLkdjoM9liT6PIGCZH7A
	vHxB9KthZ6mV8pQToL9FokWuKrFFXLZQmD24ZLWR513xzcglC/eJYuiL3+t67YQL
	vYsRF/O2EbsacqFxAAOihJwY/dHgqsZTTi9ySw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794354200; x=
	1794440600; bh=0x6QN9wo/gIl6u/ONE+WuFx2SJWN+x0pCIuLNaVpstw=; b=L
	vIryW+Uc//8KT1///hSFZ5BUkFs5DKzbZtv9/CNM/3k3Q6wDtjwFMcPnN8OwxQNm
	EUtTpvdIjQvFZfDX5b4qK1ECoJQ4+EQ3VLSlswSlJy/BVEzw6MPcrCi5ahBowtH6
	NBEbzAzU/LW1xHdP3pSi6zsLtoOgL7KfyetPbw7ycGdn68Ee/I4qjv20rQLyWO70
	DDHZ72z8+l8u6dcm+6EgsZdLlxMq93ONZZXmXBtpayNSw4GNV8cjIeu6aAZ9ePxa
	O/G/7WYKnBDnU1fN3y3ltodBRa52YcfOMKeYaizTOpafz6CnSJmNJdrGMS7K0giG
	sJKYHRYvfEP2pIE2rPk3w==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=alistair23.me a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794354200; d=alistair23.me;
	mf=PGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+;
	rt=PGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc+;
	s=fm3:rsa-sha256:BbIEiHWhSOc6EFbOQrT4NAX19sEbiG/jf9O3wXwkSo7CHhD
	cIacwZ34d+SNauLY0EWHSwkcaHpiSzx2mV0rkRmx2qOngHP/DxSlHhaexgYOmJjF
	+h96NGd2U2b6O5Mq8zrCzisfP73RG4dV5GrTSTdM6X+Jr3pGh1+7FFG7IpQgYcLI
	xvxFixzl1HWxqxCE6Wtp2k8rhMj2qfL7EiBbdSjKhsn6uX0VvIzpb08qKm67wzDE
	o3dI8TH1lNgimQTm3QefgD0z6YLaV7ORMLDSxPy1ACDa7jE1PY4rN2ch+sf7EUh7
	QzthZ6uNF4qZJrCXjQ6OXVbp6J5jWfkICkjnJ/Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to,
	user-agent;
Message-Instance: m=1; h=sha256:Qk7gK0IsGB1Q6aMT9k9ePKHHzrDKj/tmy1PB+LqXS+8=:0x6QN9wo/gIl6u/ONE+WuFx2SJWN+x0pCIuLNaVpstw=;
X-ME-Sender: <xms:Fqzzav6CaRv0CZbpxaOaxI427YxzI0JXQeiBEP_FEXoTduxxdSW9KA>
    <xme:Fqzzar1XqJKXDv2fua0IUkpihguiZF-Qx6aLA8ONrbsGVXIzDnDN0ErOEiEGSkTC8
    5UTtqjBatuyRVNJiI8mNr5ZKRIrqVfut_k589jJma_ZL-ZRH4N2wHXP>
X-ME-Received: <xmr:Fqzzarh7rCqzpoW2_Ze1VXOpeFiDtFZ-HYgAXPzeAZFzbk2Tybau9VCEwHTuwtDUvv27UKLQLcHDpk8j1Rcp>
X-ME-Proxy-Cause: dmFkZTFEX2UJcgpQyiNt+GxCdCP+sn8sCJSYmF1dP9IOYwinxKt8hHWepJE33Bo25oa75j
    7gYdW9w0WbI1jJmzHwxrRwYH/Xkjfzj1yd9rLQkOTNeYP831KcvJRlyXTPGSQntqNX989A
    rJ1Zv+fbrOEP/F1XVyGYnhaIFK2xhP3dYOl1BebBb9gXvOcQfiXrvc3yExHxVmuC3DQ3S0
    IrX3U95+MFySpqTExrClQ99RERJLeLlqG5NK7HRE2QLNSdmp1C7JQGLx7RRqoYYPQlFJZy
    fYNjsLgymWFoiNeFxev51sYd0FUYH6bv6duka8km9mkgrCBoXVpgMooGzQuArczz/S0zjF
    89VpIcB+8BgGiEqNTOMqmqWpArDL00KPCSx2ZdPUXc2L4Exmfoj+27+VnHOZBbu8Ac7HgB
    q2YkjksWafyjGGs9Iu95Z32qXKTMWdJEvixQ+ByAd7GSyLoimQrcIjtICLp45ZWR3PmevI
    yVO0bxLh2ji5bMhtqUzh9YIuA9OPL1cyhZVLmRX5XKYJV4zQI7u1J2o6xCBPHxRtziYFY3
    DG/t4hLh+MjwNGQIZUcbiThQqLn4C3EvgJ84tcb2sALmQ7YX3iQ1ionCAt1bLwaJqwXChL
    2wN4nvBvJshvhI8X+7wZIyqrpMHa/3jL2PaDkVTIvrcRpGOUSTIj5VcN2L1Q
X-ME-Proxy: <xmx:FqzzanQ17uTRRiZOYy9o-IGG0nlVQclLbKF8PHhe7VVHf3OGtWQJaQ>
    <xmx:Fqzzat7uwXYoFXrH1gMhNdWKIwL6bfq7JMDDnbN8p_6ymoRAN1feVw>
    <xmx:Fqzzavz_pwLK_ml4Tho34EuPc1x8Jg81BmUW6ftWq9xEgWr89JhJtw>
    <xmx:FqzzatCuIMkDsSetXx98vgWYEBIUs-IEK98FOma_PsVTFHQXUUwr0w>
    <xmx:GKzzasWECsVibloWQs9MRGueFVep43cowMHxf1hnUYg2YjXDMRaTJ1dM>
Feedback-ID: ifd214418:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 18:43:13 -0500 (EST)
Message-ID: <7ba76316996d17efab87a180c88da4c3300f075c.camel@alistair23.me>
Subject: Re: [PATCH 1/2] dt-bindings: net: bluetooth: realtek: Add RTL8852BS
From: Alistair <alistair@alistair23.me>
To: =?ISO-8859-1?Q?Fr=E9d=E9ric_Mah=E9?= <frederic.mahe@cirad.fr>, Marcel
 Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Rob Herring	 <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Yixun Lan
 <dlan@kernel.org>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 11 Nov 2026 09:43:10 +1000
In-Reply-To: <20261110074607.363918-2-frederic.mahe@cirad.fr>
References: <20261110074607.363918-1-frederic.mahe@cirad.fr>
	 <20261110074607.363918-2-frederic.mahe@cirad.fr>
User-Agent: Evolution 3.62.1 (by Flathub.org) 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_154323_148988_2B6B050B 
X-CRM114-Status: GOOD (  13.23  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCAyMDI2LTExLTEwIGF0IDA4OjQ2ICswMTAwLCBGcsOpZMOpcmljIE1haMOpIHdyb3Rl
Ogo+IFRoZSBSVEw4ODUyQlMgaXMgYSBXaS1GaSA2ICsgQmx1ZXRvb3RoIDUuMiBjaGlwIHdpdGgg
V2ktRmkgb24gU0RJTwo+IGFuZCBCbHVldG9vdGggb24gVUFSVCAoSDUpLiBJdHMgQmx1ZXRvb3Ro
IHBhcnQgd29ya3Mgd2l0aCB0aGUKPiBSVEw4ODIyQ1MgZHJpdmVyIGRhdGEsIHNvIHVzZSByZWFs
dGVrLHJ0bDg4MjJjcy1idCBhcyBmYWxsYmFjay4KPiAKPiBUaGlzIHBhdGNoIHdhcyBwcmVwYXJl
ZCB3aXRoIHRoZSBoZWxwIG9mIGFuIEFJIGFzc2lzdGFudCAoQ2xhdWRlKSwKPiB3aGljaCBhbHNv
IHJhbiB0aGUgdGVzdHMuCj4gCj4gU2lnbmVkLW9mZi1ieTogRnLDqWTDqXJpYyBNYWjDqSA8ZnJl
ZGVyaWMubWFoZUBjaXJhZC5mcj4KClJldmlld2VkLWJ5OiBBbGlzdGFpciBGcmFuY2lzIDxhbGlz
dGFpckBhbGlzdGFpcjIzLm1lPgoKQWxpc3RhaXIKCj4gLS0tCj4gwqAuLi4vYmluZGluZ3MvbmV0
L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55YW1swqDCoMKgwqAgfCAxMSArKysrKysrLS0K
PiAtLQo+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0Cj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55Cj4gYW1sCj4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbmV0L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55Cj4gYW1s
Cj4gaW5kZXggN2Q1NjcxMjJiLi5mZmRmMTNiMDUgMTAwNjQ0Cj4gLS0tCj4gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2JsdWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55
Cj4gYW1sCj4gKysrCj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L2Js
dWV0b290aC9yZWFsdGVrLGJsdWV0b290aC55Cj4gYW1sCj4gQEAgLTQsMTYgKzQsMTYgQEAKPiDC
oCRpZDoKPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9uZXQvYmx1ZXRvb3RoL3JlYWx0
ZWssYmx1ZXRvb3RoLnlhbWwjCj4gwqAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKPiDCoAo+IC10aXRsZTogUlRMODcyM0JTL1JUTDg3MjNDUy9S
VEw4ODIxQ1MvUlRMODgyMkNTIEJsdWV0b290aAo+ICt0aXRsZTogUlRMODcyM0JTL1JUTDg3MjND
Uy9SVEw4ODIxQ1MvUlRMODgyMkNTL1JUTDg4NTJCUyBCbHVldG9vdGgKPiDCoAo+IMKgbWFpbnRh
aW5lcnM6Cj4gwqDCoCAtIFZhc2lseSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+Cj4g
wqDCoCAtIEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWlyMjMubWU+Cj4gwqAKPiDC
oGRlc2NyaXB0aW9uOgo+IC3CoCBSVEw4NzIzQlMvUlRMODcyM0NTL1JUTDg4MjFDUy9SVEw4ODIy
Q1MgaXMgYSBXaUZpICsgQlQgY2hpcC4gV2lGaQo+IHBhcnQKPiAtwqAgaXMgY29ubmVjdGVkIG92
ZXIgU0RJTywgd2hpbGUgQlQgaXMgY29ubmVjdGVkIG92ZXIgc2VyaWFsLiBJdAo+IHNwZWFrcwo+
IC3CoCBINSBwcm90b2NvbCB3aXRoIGZldyBleHRyYSBjb21tYW5kcyB0byB1cGxvYWQgZmlybXdh
cmUgYW5kIGNoYW5nZQo+ICvCoCBSVEw4NzIzQlMvUlRMODcyM0NTL1JUTDg4MjFDUy9SVEw4ODIy
Q1MvUlRMODg1MkJTIGlzIGEgV2lGaSArIEJUCj4gY2hpcC4KPiArwqAgV2lGaSBwYXJ0IGlzIGNv
bm5lY3RlZCBvdmVyIFNESU8sIHdoaWxlIEJUIGlzIGNvbm5lY3RlZCBvdmVyCj4gc2VyaWFsLiBJ
dAo+ICvCoCBzcGVha3MgSDUgcHJvdG9jb2wgd2l0aCBmZXcgZXh0cmEgY29tbWFuZHMgdG8gdXBs
b2FkIGZpcm13YXJlIGFuZAo+IGNoYW5nZQo+IMKgwqAgbW9kdWxlIHNwZWVkLgo+IMKgCj4gwqBw
cm9wZXJ0aWVzOgo+IEBAIC0yOCw2ICsyOCw5IEBAIHByb3BlcnRpZXM6Cj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgLSBlbnVtOgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSByZWFsdGVr
LHJ0bDg4MjFjcy1idAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gY29uc3Q6IHJlYWx0ZWsscnRs
ODcyM2JzLWJ0Cj4gK8KgwqDCoMKgwqAgLSBpdGVtczoKPiArwqDCoMKgwqDCoMKgwqDCoMKgIC0g
Y29uc3Q6IHJlYWx0ZWsscnRsODg1MmJzLWJ0Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAtIGNvbnN0
OiByZWFsdGVrLHJ0bDg4MjJjcy1idAo+IMKgCj4gwqDCoCBkZXZpY2Utd2FrZS1ncGlvczoKPiDC
oMKgwqDCoCBtYXhJdGVtczogMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
