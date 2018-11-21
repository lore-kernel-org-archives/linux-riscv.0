Return-Path: <SRS0=BHV5=OA=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4CD2C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 18:03:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EB5621479
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Nov 2018 18:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UjPHxJFS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ue+vdGfU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EB5621479
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AVS4joSAUK2r4CPwmp1X4BbBtXc8kN7Sl3Cg1vnEx7Q=; b=UjPHxJFSTYADEWpys3mXmzI47
	rVQdvll4nwk3acXYwjwZ3eA1tVOdQMGoCl3P/b57qwLU+ZX+jlNw/Fou1+v9skXJgCzwlNKxF5aiS
	LenCktEfEKwPfXKYpJUFDyjIje7jsp6VwqHa0REA0/0HvX0rdGZ4mKMulvRHEIKLUDY/fJtMeLdOp
	6VXgPne1cMZAx18U1BwMQ64aHYrDcZ5f1uzjCI/5iY0pybjaq9a8BQnuSGURYuE52sLIqiDs3i30O
	rcmcjUYvuANXDaNTyX97hKF1rIpoG5aPD9YRrlxAfk0bn5dFoQtsj3vh9K/mTZGVBzMDbDCPKmcVR
	btATWxuVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gPWqx-0004xr-Df; Wed, 21 Nov 2018 18:03:55 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPWq1-0003bZ-LM
 for linux-riscv@bombadil.infradead.org; Wed, 21 Nov 2018 18:02:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X6j7ydkpyUtkV4jHARizL0HHMh3eFgRsMbm7dE03VRE=; b=ue+vdGfUxeWyqKR9AfU8jOTTRw
 Zr1SlysUnfu0UQ0ymPLBLktGfcDbrBJTqkklOloj6CJsw0flTOlLHlAxos0ifdcsc2OWh/Kc1TkgC
 VmhAvkThUdj1pk9ePI5Sv5eOEE5nihxuusqde6prpCrYiLoheODf5NetmYgq3FiIK7ZBwJ8qpk5uy
 mC+KYRHNjboyhk5uGBEiV1peaTuTdmRkbJsisIeAgPKvPbHpa67161Gpf4zNHV9ZcO515IeQb8k1E
 9ixc6Zzot8rhGBVonPYKsfMnliKxU15uVPOtq/jhHjn3z0kkLi5ClcB/N6GHCZplJ8HZmtD3t6h++
 rz2dnw0g==;
Received: from mailgate-4.ics.forth.gr ([139.91.1.7])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gPWpy-0001c4-A5
 for linux-riscv@lists.infradead.org; Wed, 21 Nov 2018 18:02:56 +0000
Received: from av1.ics.forth.gr (av3in.ics.forth.gr. [139.91.1.77])
 by mailgate-4.ics.forth.gr (8.14.5/ICS-FORTH/V10-1.9-GATE-OUT) with ESMTP id
 wALI2X5g018107; Wed, 21 Nov 2018 20:02:35 +0200 (EET)
X-AuditID: 8b5b9d4d-903ff70000000e62-d1-5bf59db91f72
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 13.49.03682.9BD95FB5; Wed, 21 Nov 2018 20:02:33 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id wALI2WrS013770; Wed, 21 Nov 2018 20:02:32 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 21 Nov 2018 20:02:32 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: RISC-V Patchwork
Organization: FORTH
In-Reply-To: <7b7de9a4-42f7-59d2-c952-bbc5ec023e56@wdc.com>
References: <mhng-f1f11265-f6fe-4284-8dc0-a28ac937fdb4@palmer-si-x1c4>
 <7b7de9a4-42f7-59d2-c952-bbc5ec023e56@wdc.com>
Message-ID: <28ee2265a0558167042f36f03b4f03c7@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsXSHc2orLtz7tdog+XtLBaLVnxnsdj2uYXN
 YvOEBawOzB6bl9R7XGq+zu7RfqCbKYA5issmJTUnsyy1SN8ugSvjxKVuloITXBU/ps9ibmA8
 y9HFyMkhIWAi8ezINuYuRi4OIYEjjBK9O/8yQjiHGCXe/epjgqgylZi9t5MRxOYVEJQ4OfMJ
 C4jNLGAhMfXKfkYIW16ieetsZhCbRUBV4vnJW2BxNgFNifmXDgLVc3CIAMVnLeKHKHeXODd3
 I9gYYQFZidYzK8Ba+QWEJT7dvcgKYnMKWEusWXAHLC4kUC7RsfIIK8QJLhI7tk1jgzhNReLD
 7wfsILaogLLEixPTWScwCs1CcuksJJfOQnLpAkbmVYwCiWXGepnJxXpp+UUlGXrpRZsYweE8
 13cH47kF9ocYBTgYlXh4NSK/RguxJpYVV+YCw4WDWUmEtyMKKMSbklhZlVqUH19UmpNafIhR
 moNFSZz38IvwICGB9MSS1OzU1ILUIpgsEwenVAOjWYj7popdr0SuTWqYeHPvOvUzPCppr3lN
 Cx4GrnVzbH/dI9YnX7rfj0HRNVp3f6jMTGuz26WfOrOm1lWZdDDfP9C0fQ3H3K87FfXeT445
 vUp+0jSJ31X3T3wrvrLFt38dQ9EOeUGPKyuvHdt4/NO8xufS2yWseyOiVzl/N4uXMDWfVmnP
 efytEktxRqKhFnNRcSIA8lNKTGMCAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181121_180254_479854_10BC46C7 
X-CRM114-Status: GOOD (  15.45  )
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
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181121180232.8x0mIa7KytyvhTo4t5DA1iV-41vmxdTj6TVuxvA_mzw@z>

zqPPhM65z4IgMjAxOC0xMS0yMCAyMDoyMywgQXRpc2ggUGF0cmEgzq3Os8+BzrHPiM61Ogo+IE9u
IDExLzIwLzE4IDg6MjEgQU0sIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+PiBBdGlzaCB0cmFja2Vk
IGRvd24gdGhlIGRvY3VtZW50YXRpb24gZm9yIGNyZWF0aW5nIGEgcGF0Y2h3b3JrLCB3aGljaCAK
Pj4gbm93IGxpdmVzCj4+IGhlcmUKPj4gCj4+ICAgICAgaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVs
Lm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2L2xpc3QvCj4+IAo+PiBJIGhhdmUgbm8gaWRlYSBob3cg
dG8gdXNlIGl0LCBzbyB3ZSBjYW4gYWxsIGxlYXJuIHRvZ2V0aGVyIDopCj4+IAo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKPj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4+IAo+IEF3
ZXNvbWUuIEkgdGhpbmsgeW91IGNhbiBjaGFuZ2UgdGhlIHN0YXR1cyBvZiB0aGUgcGF0Y2ggZnJv
bSBhCj4gZHJvcGRvd24gYm94LCBhZnRlciB5b3UgbG9nZ2VkIGluIHdpdGggeW91ciBwYXRjaHdv
cmsgaWQuIFRoZQo+IGF2YWlsYWJsZSBvcHRpb25zIGxvb2tzIHByZXR0eSBtdWNoIHNlbGYgZXhw
bGFuYXRvcnkgdW5sZXNzIHRoZXJlIGlzIGEKPiBoaWRkZW4gbWVhbmluZyB0byBpdCA7KSA7KS4g
QXMgYSBjb250cmlidXRvciwgd2UgY2FuIHRha2UgYSBsb29rIGF0Cj4gdGhlIHBhdGNod29yayB0
byBmb3IgdGhlIHN0YXR1cyBvZiB0aGUgcGF0Y2guIE5vIG5lZWQgb2YgZW1haWwgcmVwbGllcwo+
IDopLgo+IAo+IHB3Y2xpZW50IHdhcyBoZWxwZnVsIGluIGFwcGx5aW5nIHRoZSBwYXRjaGVzIGRp
cmVjdGx5IGluIGNhc2UgbGttbCB3YXMKPiBub3QgY2MnZCBvbiB0aGUgcGF0Y2guCj4gCj4gaHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LXJpc2N2Lwo+IAo+IFRoZXJl
IGlzIGdpdC1wdyBhbHNvLiBIb3dldmVyLCBJIGNvdWxkIG5vdCBnZXQgaXQgdG8gd29ya2luZyBm
b3IgCj4gbGludXgtcmlzY3YuCj4gCj4gCj4gUmVnYXJkcywKPiBBdGlzaAo+IAo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKClRoYW5rIHlvdSAh
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
