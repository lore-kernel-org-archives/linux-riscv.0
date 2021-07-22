Return-Path: <SRS0=ruHO=MO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D36C6377D
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 05:54:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C481A6120C
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jul 2021 05:54:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C481A6120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Nl89REbkjRBxfXHq7gN+7H3bmDavDIfkg0qxLN2zg6g=; b=aSk7G4cPSAgcdAkvan8ZUso0ZQ
	rhVhVfUXqqVb9bRGS4qP9L45UdLPj8QD8/hioW5kJHNSHCK/wZU84RcgwJZPsGmnDZm/Wacf1TqPy
	ygahN0ek3rhmaA9USf+ekNyWGnSOedg2Z65dAaAqJuVFkH9syu8JT4hS6jc36C25RtS3DqINIBzkf
	kRbLs7VHdllr+tc8R3A2/f78TeDFwcVtybU4A2DU3AeOuWuRNJtOX+3isaWP1OcFlgevkiWy2RhKq
	Qk6NFdVIAu46TZ/XE8FqNd5jKVmr+329S+6aPUmxoZuGNB/list3ExexUBalxJqfCos5TMn6FzmFA
	zNDvjonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ReU-000Hly-Ru; Thu, 22 Jul 2021 05:53:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ReS-000Hl7-HK
 for linux-riscv@lists.infradead.org; Thu, 22 Jul 2021 05:53:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id gx2so4646768pjb.5
 for <linux-riscv@lists.infradead.org>; Wed, 21 Jul 2021 22:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=28owLvv+vL6tVtuvmnfHr7+qgTSNqBXGBIr+3Xh6M9I=;
 b=hpbQp607GEFF9BCuVfEbDnBl6wt+QGW+IpFzORDnEq6cmOEC3dka+R5HSzK07WOoTN
 UsWZ1gJQGUo9muaSIl3PVyy+mYkPB+BWkp7DntatitzmvMxcR3je7f0avV6Db4ND6xFm
 9dBHri4GY2RS6qRoy2pgleiJgnn2O2oW5/nxLEr07DIZjiszDijILxRJKh6+uBRJtbVg
 M7aDC6ykEPFUQ/SnhrnikWg0yz2y2c80GVmd91tqhsh25jusi/Q4UE5CJCyXGRX2c3/4
 1wlXUiDx8PscIshdELj+35VYcbXbl5YU68Esmx7mcs60tZXSEhcWH5dbKux8ixpQkdVO
 Aj1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=28owLvv+vL6tVtuvmnfHr7+qgTSNqBXGBIr+3Xh6M9I=;
 b=DfTjtovuEb+14hFV5HOGk/c/3wV2cRkfzrZ+BgKJyzVgi2nIuLmOQ6wZ0gap0oTNtm
 ihrdR9N3eHnquWrb6L56mp8+HA7cic2yzF1gwTDLUaww+zJmt2/hJBNfZTl3XCHnWr6M
 Mz4GggqQB/zuxYvOsVR8roT3fWUt4XoneIYqqabAwn+y5U9AzgJ8IhEabdOom/KpD7sZ
 MwWcwKU/uPURaV8AAbhlL+0K3kc5Bp/Fw6HJfoigjEAYEjIuX1uH+s3fNZyMSM0sdTJJ
 YhANbTMZ7CEmpbTd8RpooMPuYRTfOSn2HrvdU1tnr5t7w3k5MEwVEh+U/oD5+6eU9HrW
 Cw7Q==
X-Gm-Message-State: AOAM530adU4IefTHP/SP/RPN7JtxDxrP17OMM3hS+JnfksrnzINy0IRh
 fXqcxXure2S0crefXYvgTJG+EA==
X-Google-Smtp-Source: ABdhPJwg4kNrjPL5wglKUZNAdm57nuCLNRhTw7Jq2LqJ9dqrvFwcFcEnvN1fCwH5tuB07Uvu4TvIhw==
X-Received: by 2002:a17:90b:4ac9:: with SMTP id
 mh9mr7595414pjb.226.1626933220572; 
 Wed, 21 Jul 2021 22:53:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id z15sm32360128pgc.13.2021.07.21.22.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 22:53:40 -0700 (PDT)
Date: Wed, 21 Jul 2021 22:53:40 -0700 (PDT)
X-Google-Original-Date: Wed, 21 Jul 2021 22:23:26 PDT (-0700)
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
In-Reply-To: <CAEUhbmVO_dV86LJLz3S4PFu9oFp4_5HWSkKLwqc-ZkQK=yYZfw@mail.gmail.com>
CC: wangkefeng.wang@huawei.com, Atish Patra <Atish.Patra@wdc.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 stable@vger.kernel.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: bmeng.cn@gmail.com, Greg KH <gregkh@linuxfoundation.org>
Message-ID: <mhng-4e9664d5-a766-40d3-8757-230788677472@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_225344_639633_260A44C2 
X-CRM114-Status: GOOD (  37.66  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAxNSBKdWwgMjAyMSAxOToxNDoyMCBQRFQgKC0wNzAwKSwgYm1lbmcuY25AZ21haWwu
Y29tIHdyb3RlOgo+IE9uIFRodSwgSnVsIDgsIDIwMjEgYXQgOToyOSBQTSBCaW4gTWVuZyA8Ym1l
bmcuY25AZ21haWwuY29tPiB3cm90ZToKPj4KPj4gSGkgUGFsbWVyLAo+Pgo+PiBPbiBUaHUsIEp1
bCAxLCAyMDIxIGF0IDEwOjIwIEFNIEJpbiBNZW5nIDxibWVuZy5jbkBnbWFpbC5jb20+IHdyb3Rl
Ogo+PiA+Cj4+ID4gT24gVGh1LCBKdWwgMSwgMjAyMSBhdCAxMDowOCBBTSBLZWZlbmcgV2FuZyA8
d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+PiA+ID4KPj4gPiA+Cj4+ID4gPiBP
biAyMDIxLzYvMzAgMTk6NTgsIEJpbiBNZW5nIHdyb3RlOgo+PiA+ID4gPiBPbiBNb24sIEp1biAy
OCwgMjAyMSBhdCAxMToyMSBBTSBCaW4gTWVuZyA8Ym1lbmcuY25AZ21haWwuY29tPiB3cm90ZToK
Pj4gPiA+ID4+IE9uIE1vbiwgSnVuIDI4LCAyMDIxIGF0IDEwOjI4IEFNIEtlZmVuZyBXYW5nIDx3
YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4gd3JvdGU6Cj4+ID4gPiA+Pj4KPj4gPiA+ID4+PiBP
biAyMDIxLzYvMjggOToxNSwgQmluIE1lbmcgd3JvdGU6Cj4+ID4gPiA+Pj4+IE9uIE1vbiwgSnVu
IDI4LCAyMDIxIGF0IDg6NTMgQU0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWku
Y29tPiB3cm90ZToKPj4gPiA+ID4+Pj4+IEhp77yMIHNvcnJ5IGZvciB0aGUgbWlzdGFrZe+8jHRo
ZSBidWcgaXMgZml4ZWQgYnkKPj4gPiA+ID4+Pj4+Cj4+ID4gPiA+Pj4+PiBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIxMDYwMjA4NTUxNy4xMjc0ODEtMi13YW5na2VmZW5n
LndhbmdAaHVhd2VpLmNvbS8KPj4gPiA+ID4+Pj4gV2hhdCBhcmUgd2Ugb24gdGhlIHBhdGNoIHlv
dSBtZW50aW9uZWQ/Cj4+ID4gPiA+Pj4+Cj4+ID4gPiA+Pj4+IEkgZG9uJ3Qgc2VlIGl0IGFwcGxp
ZWQgaW4gdGhlIGxpbnV4L21hc3Rlci4KPj4gPiA+ID4+Pj4KPj4gPiA+ID4+Pj4gQWxzbyB0aGVy
ZSBzaG91bGQgYmUgYSAiRml4ZXMiIHRhZyBhbmQgc3RhYmxlQHZnZXIua2VybmVsLm9yZyBjYydl
ZAo+PiA+ID4gPj4+PiBiZWNhdXNlIDMyLWJpdCBpcyBicm9rZW4gc2luY2UgdjUuMTIuCj4+ID4g
PiA+Pj4gaHR0cHM6Ly9rZXJuZWwuZ29vZ2xlc291cmNlLmNvbS9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvcmlzY3YvbGludXgvKy9jOTgxMWUzNzliMjExYzY3YmEyOWZiMDlkNmY2NDRkZDQ0Y2Zj
ZmYyCj4+ID4gPiA+Pj4KPj4gPiA+ID4+PiBpdCdzIG9uIFBhbG1lcicgcmlzY3YtbmV4dC4KPj4g
PiA+ID4+IE5vdCBzdXJlIHJpc2N2LW5leHQgaXMgZm9yIHdoaWNoIHJlbGVhc2U/IFRoaXMgaXMg
YSByZWdyZXNzaW9uIGFuZAo+PiA+ID4gPj4gc2hvdWxkIGJlIG9uIDUuMTMuCj4+ID4gPiA+Pgo+
PiA+ID4gPj4+IEhpIFBhbG1lciwgc2hvdWxkIEkgcmVzZW5kIG9yIGNvdWxkIHlvdSBoZWxwIG1l
IHRvIGFkZCB0aGUgZml4ZXMgdGFnPwo+PiA+ID4gPiBZb3VyIHBhdGNoIG1peGVkIDIgdGhpbmdz
IChmaXggcGx1cyBvbmUgZmVhdHVyZSkgdG9nZXRoZXIsIHNvIGl0IGlzCj4+ID4gPiA+IG5vdCBw
cm9wZXIgdG8gYmFjayBwb3J0IHlvdXIgcGF0Y2guCj4+ID4gPgo+PiA+ID4gIm1lbT0iIHdpbGwg
Y2hhbmdlIHRoZSByYW5nZSBvZiBtZW1ibG9jaywgc28gdGhlIGZpeCBwYXJ0IG11c3QgYmUgaW5j
bHVkZWQuCj4+ID4gPgo+PiA+Cj4+ID4gWWVzLCBzbyB5b3UgY2FuIHJlYmFzZSB0aGUgIm1lbT0i
IGNoYW5nZXMgb24gdG9wIG9mIG15IHBhdGNoLgo+PiA+Cj4+ID4gVGhlIHByYWN0aWNlIGlzIHRo
YXQgd2Ugc2hvdWxkIG5vdCBtaXggMiB0aGluZ3MgaW4gb25lIHBhdGNoLiBJIGNhbgo+PiA+IGlt
YWdpbmUgdGhhdCB5b3Ugd2FudGVkIHRvIGFkZCAibWVtPSIgdG8gUklTQy1WIGFuZCBzdWRkZW5s
eSBmb3VuZCB0aGUKPj4gPiBleGlzdGluZyBsb2dpYyB3YXMgYnJva2VuLCBzbyB5b3Ugc2VudCBv
bmUgcGF0Y2ggdG8gZG8gYm90aC4KPj4gPgo+PiA+ID4KPj4gPiA+ID4KPj4gPiA+ID4gSGVyZSBp
cyBteSAyIGNlbnRzOgo+PiA+ID4gPgo+PiA+ID4gPiAxLiBEcm9wIHlvdXIgcGF0Y2ggZnJvbSBy
aXNjdi1uZXh0Cj4+ID4gPiA+IDIuIEFwcGx5IG15IHBhdGNoIGFzIGl0IGlzIGEgc2ltcGxlIGZp
eCB0byBwcmV2aW91cyBjb21taXQuIFRoaXMKPj4gPiA+ID4gYWxsb3dzIHN0YWJsZSBrZXJuZWwg
dG8gY2hlcnJ5LXBpY2sgdGhlIGZpeCB0byB2NS4xMiBhbmQgdjUuMTMuCj4+ID4gPiA+IDMuIFJl
YmFzZSB5b3VyIHBhdGNoIGFnYWluc3QgbWluZSwgYW5kIHJlc2VuZCB2Mgo+PiA+ID4gPgo+PiA+
ID4gPiBMZXQgbWUga25vdyBpZiB0aGlzIG1ha2VzIHNlbnNlLgo+PiA+ID4KPj4gPiA+IEl0IGlz
IG5vdCBhIGJpZyBwcm9ibGVtIGZvciBtZSwgYnV0IEkgaGF2ZSBubyByaWdodCBhYm91cnQgcmlz
Y3YtbmV4dCwKPj4gPiA+Cj4+ID4gPiBsZXQncyB3YWl0IFBhbG1lcidzIGFkdmlzZS4KPj4gPiA+
Cj4+ID4KPj4gPiBTdXJlLiBQYWxtZXIsIGxldCBtZSBrbm93IHlvdXIgdGhvdWdodHMuCj4+Cj4+
IFBpbmc/Cj4KPiBQaW5nPwoKU29ycnksIEkgbWlzc2VkIHRoaXMgb25lLiAgSXQgbG9va3MgbGlr
ZSB0aGUgcGF0Y2ggdGhhdCBhZGRzIG1lbT0gYW5kIApmaXhlcyB0aGUgYnVnIGhhcyBhbHJlYWR5
IGJlZW4gbWVyZ2VkLCBzbyBJJ20gbm90IHJlYWxseSBxdWl0ZSBzdXJlIHdoYXQgCnRoZSByaWdo
dCB0aGluZyB0byBkbyBpcyBoZXJlOiB3ZSBkb24ndCByZWFsbHkgd2FudCB0aGUgbWVtPSBjb2Rl
IG9uIApzdGFibGUsIGJ1dCB3ZSBkbyB3YW50IHRoZSBmaXguICBJIHdlbnQgYWhlYWQgYW5kIGRp
ZAoKY29tbWl0IDQ0NDgxOGI1OTkxODlmZDhiNmM4MTRkYTU0MmZmOGNmYzlmZTY3ZDQgKEhFQUQg
LT4gZml4ZXMsIHBhbG1lci9maXhlcykKZ3BnOiBTaWduYXR1cmUgbWFkZSBXZWQgMjEgSnVsIDIw
MjEgMTA6MjE6MDUgUE0gUERUCmdwZzogICAgICAgICAgICAgICAgdXNpbmcgUlNBIGtleSAyQjND
Mzc0NzQ0Njg0M0IyNEE5NDNBN0EyRTEzMTlGMzVGQkIxODg5CmdwZzogICAgICAgICAgICAgICAg
aXNzdWVyICJwYWxtZXJAZGFiYmVsdC5jb20iCmdwZzogR29vZCBzaWduYXR1cmUgZnJvbSAiUGFs
bWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4iIFt1bHRpbWF0ZV0KZ3BnOiAgICAgICAg
ICAgICAgICAgYWthICJQYWxtZXIgRGFiYmVsdCA8cGFsbWVyZGFiYmVsdEBnb29nbGUuY29tPiIg
W3VsdGltYXRlXQpNZXJnZTogZTczZjBmMGVlNzU0IGQwZTRkYWU3NDQ3MApBdXRob3I6IFBhbG1l
ciBEYWJiZWx0IDxwYWxtZXJkYWJiZWx0QGdvb2dsZS5jb20+CkRhdGU6ICAgV2VkIEp1bCAyMSAy
MjoxODo1OCAyMDIxIC0wNzAwCgogICAgTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAncmlz
Y3YvcmlzY3YtZml4LTMyYml0JyBpbnRvIGZpeGVzCgogICAgVGhpcyBjb250YWlucyBhIHNpbmds
ZSBmaXggZm9yIDMyLWJpdCBib290LiAgSXQgaGFwcGVucyB0aGlzIHdhcyBhbHJlYWR5CiAgICBm
aXhlZCBieSBjOTgxMWUzNzliMjEgKCJyaXNjdjogQWRkIG1lbSBrZXJuZWwgcGFyYW1ldGVyIHN1
cHBvcnQiKSwgYnV0CiAgICB0aGUgYnVnIGV4aXN0ZWQgYmVmb3JlIHRoYXQgZmVhdHVyZSBhZGRp
dGlvbiBzbyBJJ3ZlIGFwcGxpZWQgdGhlIHBhdGNoCiAgICBlYXJsaWVyIGFuZCB0aGVuIG1lcmdl
ZCBpdCBpbiAod2hpY2ggcmVzdWx0cyBpbiBhIGNvbmZsaWN0LCB3aGljaCBpcwogICAgZml4ZWQg
dmlhIG5vdCBjaGFuZ2luZyB0aGUgcmVzdWx0aW5nIHRyZWUpLgoKICAgICogcmlzY3YvcmlzY3Yt
Zml4LTMyYml0OgogICAgICByaXNjdjogRml4IDMyLWJpdCBSSVNDLVYgYm9vdCBmYWlsdXJlCgph
cyB0aGF0InMgdGhlIGJlc3QgSSBjb3VsZCBjb21lIHVwIHdpdGggLS0gdGhlbiB0aGUgZml4IHdp
bGwgbGFuZCBvbiAKbWFzdGVyLCB3aGljaCBzaG91bGQgY2F1c2UgaXQgdG8gZ2V0IHB1bGxlZCBv
bnRvIHN0YWJsZS4KCkdyZWc6IGlzIHRoZXJlIGEgYmV0dGVyIHdheSB0byBtYWtlIHNvbWV0aGlu
ZyBsaWtlIHRoaXMgZ2V0IHRvIHN0YWJsZT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
