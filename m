Return-Path: <SRS0=a8/2=SE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E55C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 17:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB472070B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2019 17:57:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dMsrxlSF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="YN/2LXE4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB472070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=BcnSuHu/usgAxkngVFQnO1tc3ZGEPTERv1+i3gcgGts=; b=dMsrxlSFOIDWQbCaI4b24FLS1
	ainoBMx9lE+LSr6UO31bXz7j4KI0eKaY3J1FWND9ppH/h4r09hMTeY+7zlaf9zbKrk4SgUBkqUJvQ
	TFZDWCykvEAQsY7Ys9ysJ0efU63OzAT8uShqsj3Ltz856gO3xcszfkHJo4CiTgo47MqsSxnAaHEfJ
	Lgp1DAvYjJOkNPYkSRdurSyNDBGQPkw3Qnv+ZwV/eXIqg95P5ERnDCrUX3nsOm3i0N9GC72UaIGI0
	28ZkgX0h6UN6r8lgdI7IXN/zBdiN0kilW9fGdetK0OVESeFIYaQIVI6JDTpE30ET3o7v6PAQy4yNq
	tT948YX7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBNf0-0001ac-5W; Tue, 02 Apr 2019 17:57:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBNew-0001aJ-La
 for linux-riscv@lists.infradead.org; Tue, 02 Apr 2019 17:57:20 +0000
Received: by mail-pf1-x434.google.com with SMTP id 188so6753408pfd.8
 for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2019 10:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=cJ0N1UdH7Y8TGeNcLpHWtUlNLwmp5WywZ9zXeW2XQXw=;
 b=YN/2LXE4ZQFBz1XNHJ7tBDlTS3lU9a5juc39eixUoKgyk83mFdWsYmnMfB3n4Nozfa
 LatQQUOtEqtXrnQt3rDBuzqpJcLh18tJKOBVbDrzdq3P9wxdmU6HU9RAXfSvlxNQiudo
 0AVGMxMFSr6VlRhCD0BpKuX1761pYfqhH6qVMyAS5EYREcgzaySeusVv0kv5lynT+aOF
 bBaaLaQjP01zMHE4f7U5BeIS1U7w2zJw8pLUK1QaIWIZFiRrrOJEj/sosZelNsIbPhQV
 VRQCOVdaqL8cnyDWyPpaUMCQJWzahDIiDfVXiZrwN2dxu3F0T6O13lbKvdEN+nR7SlGB
 SUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cJ0N1UdH7Y8TGeNcLpHWtUlNLwmp5WywZ9zXeW2XQXw=;
 b=VS15IK6L68BOiuxzfuT2NJGpma4F3o4VRmYuBJHklHd3FL+1jTcLFRYPMGrM81xlJj
 0KhGUGIgaXVVbgB19XP7v9AYd3tIX1sFTHf0w42ff/d+VfBkrX0PVTJ/VRYDJMPZY8nb
 C6UjOP9fADpjfgx53gMQP1JdZ4Xwb0x3PeYNVT5hWVoVdZHUymTdKHUUWvWZfR7LNX5w
 tmn+wHVMRo1ZReOn/iDu1j1PPxIju1CA3+GzBnoskIkPQOn53lGu34TvJwyFaCzRv8zf
 a/sRwnV+nlAeNkKl9777ekh5DPRT5qoerlR+WYalspLzQc5TorOzZ9J5TInZf3yIdfYS
 cSSg==
X-Gm-Message-State: APjAAAWGh0ZBoqkVm3m6C2dTMz3qZ1bT9ju8tTa8mDYAtT7LeBcMmrgB
 vSqO7kG95mXjzoWtWMwXOGGrDJnu2zbRWQ==
X-Google-Smtp-Source: APXvYqxXPAmfNXD5LjcdATxpkmmKePQtn7jHmkJwcPX/euc+GEIWgXViL+ig3l8eie0pTWg5BzLUoA==
X-Received: by 2002:a63:481:: with SMTP id 123mr68936430pge.167.1554227835652; 
 Tue, 02 Apr 2019 10:57:15 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id k6sm5157635pfj.173.2019.04.02.10.57.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 02 Apr 2019 10:57:14 -0700 (PDT)
Date: Tue, 02 Apr 2019 10:57:14 -0700 (PDT)
X-Google-Original-Date: Tue, 02 Apr 2019 10:52:59 PDT (-0700)
Subject: Re: Perf counters on SiFive FU540-C000
In-Reply-To: <20190331143732.7n4b5llrkxs5nbvm@aurora.visucore.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: laanwj@gmail.com
Message-ID: <mhng-0cd5a4db-2499-4830-a4bf-656275714836@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190402_105718_738169_37AFF8A8 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: linux-riscv@lists.infradead.org, alankao@andestech.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCAzMSBNYXIgMjAxOSAwNzozNzozMiBQRFQgKC0wNzAwKSwgbGFhbndqQGdtYWlsLmNv
bSB3cm90ZToKPiBIZWxsbywKPgo+IEknbSBwbGFubmluZyBvbiBkb2luZyBzb21lIG9wdGltaXph
dGlvbiB3b3JrIGZvciBSSVNDLVYsIHNvIEknZCBsaWtlIHRvIGFkZAo+IHBlcmYgc3VwcG9ydCBm
b3IgdGhlIHBlcmZvcm1hbmNlIGNvdW50ZXJzIG9uIHRoZSBGVTU0MC1DMDAw4oCUYXMgZGVzY3Jp
YmVkIGluCj4gU2VjdGlvbiA0LjEwIG9mIHRoZSAiU2lGaXZlIEZVNTQwLUMwMDAgTWFudWFsIi4K
ClRoYXQgd291bGQgYmUgZ3JlYXQsIHRoYW5rcyEKCj4gVGhlc2UgYXJlIHZlcnkgYmFzaWM6IENT
UnMgbWhwbWV2ZW50MyBhbmQgbWhwbWV2ZW50NCBjYW4gYmUgdXNlZCB0byBjaG9vc2UgYSBjYXRl
Z29yeQo+IChJbnN0cnVjdGlvbiBDb21taXQgRXZlbnRzLCBNaWNyb2FyY2hpdGVjdHVyYWwgRXZl
bnRzLCBNZW1vcnkgU3lzdGVtIEV2ZW50cyksIHRoZW4KPiBmcm9tIHRoZXNlIGNhdGVnb3JpZXMg
YSBiaXRtYXNrIG9mIGV2ZW50cyBjYW4gYmUgc2V0IHRoYXQgd2lsbCBpbmNyZWFzZSB0aGUgYXNz
b2NpYXRlZAo+IGNvdW50ZXIgd2hlbiB0aGV5IGhhcHBlbi4gSSBkb24ndCB1bmRlcnN0YW5kIHRo
ZSByYXRpb25hbGUgZm9yIGNvdW50aW5nIG11bHRpcGxlCj4ga2luZHMgb2YgZXZlbnRzIGluIG9u
ZSByZWdpc3Rlciwgc28gZnJvbSB3aGF0IEkgdW5kZXJzdGFuZCwgdHdvIGNvdW50ZXJzIGNhbiBi
ZQo+IHN1cHBvcnRlZCBhdCBvbmNlIGluIHRoZSBwZXJmIGludGVyZmFjZS4KClRoZSBpZGVhIGhl
cmUgaXMgdG8gYWxsb3cgdXNlcnMgdG8gaGF2ZSBkaWZmZXJlbnQgcGVyZm9ybWFuY2UgY291bnRl
ciAKZ3JhbnVsYXJpdGllcy4gIEZvciBleGFtcGxlLCB1c2VycyBtaWdodCB3YW50IHRvIGNvdW50
IGFsbCBwaXBlbGluZSBmbHVzaGVzIAoobWF5YmUgdGhlaXIgZnJhbWV3b3JrIGRlZmluZXMgdGhh
dCBhcyBhIHBvc3NpYmxlIGNvdW50ZXIgdHlwZSkgb3IgbWF5IHdhbnQgdG8gCnNwZWNpZmljYWxs
eSBpbmRpY2F0ZSB3aGljaCBzb3J0IG9mIHBpcGVsaW5lIGZsdXNoIHNob3VsZCBiZSBjb3VudGVk
LgoKPiBJIGZvdW5kIHNvbWUgZG9jdW1lbnRhdGlvbiBhYm91dCBwbGF0Zm9ybSBzcGVjZmljIGNv
dW50ZXJzIGluIERvY3VtZW50YXRpb24vcmlzY3YvcG11LnR4dCwKPiBob3BlZnVsbHkgdGhpcyBp
cyBlbm91Z2ggdG8gZ2V0IG1lIHN0YXJ0ZWQuCj4gKElmIHNvbWVvbmUgc3RhcnRlZCB3b3JrIG9u
IHRoaXMsIHBsZWFzZSBsZXQgbWUga25vdykKClNvbWVvbmUgZnJvbSBBbmRlcyBoYWQgcGF0Y2hl
cyBvdXQgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZWlyIHBlcmZvcm1hbmNlIApjb3VudGVycyBhIHdo
aWxlIGFnby4gIFRoZSBpc3N1ZSB0aGVyZSB3YXMgdGhhdCB0aGUgcGVyZm9ybWFuY2UgY291bnRl
ciAKaW1wbGVtZW50YXRpb24gd2FzIGNob3NlbiBhdCBjb21waWxlIHRpbWUsIGJ1dCBpdCBzaG91
bGQgcmVhbGx5IGJlIGRldGVjdGVkIGF0IApydW4gdGltZSB2aWEgc29tZSBwbGF0Zm9ybS1zcGVj
aWZpYyBtZWNoYW5pc20gKGllLCBkZXZpY2UgdHJlZSkuCgpBc2lkZSBmcm9tIHRoYXQgSSB0aGlu
ayB0aGUgb25seSBpc3N1ZSB3YXMgaG93IHRvIGV4cG9zZSB0aGVzZSB0byB1c2Vyc3BhY2UgaW4g
CmEgc2FuZSBmYXNoaW9uLCB3aGljaCBpcyBzb21ldGhpbmcgSSB0aG91Z2h0IHdvdWxkIGJlIHF1
aXRlIHRyaWNreS4gIElJUkMgCnNvbWVvbmUgbWFuYWdlZCB0byBjb252aW5jZSBtZSB0aGF0IHRo
ZXJlIHdhcyBhIHJlYWxseSBzaW1wbGUgc2NoZW1lIGZvciBkb2luZyAKdGhpcywgYnV0IEkgZG9u
J3QgcmVtZW1iZXIgd2hhdCBpdCB3YXMuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
