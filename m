Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D68C25B79
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 03:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2U1B3zWG50ItykHWVBPXE6xLTGddHJ2bJuvchsnTLN0=; b=LSszVX1RA9o0vq
	g3YLkzXMRrYtBUNewQHTlxsdMHyNuyytJ+VDVeIo/vLOVKGgJMZl/i9YgbLSX70v02i+XdYSPQm4/
	q9Ah8J1wJut3+PkMSP613ZqTHFgnj9oOCzl1BwUblf9HxJKE9+Z8hbboIxw6qroP10EQYY8NDMPEF
	bpvGQE5P1zr6GCK/Y/xWyzllC5fzDaAAAclgn+M3n9GJW1Ukk5a0yJK0MFsgwDc40c7rC7xhxyHWW
	vOg1QAa6UI8vO8bflFVSP/V0fzDzEGFvyfiw+ujcfAFKuhlITf/BEYfSeMs7jSdcCsFDz51YjhsTb
	idSP2XLuYyskiFGQ5gkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ymH-00000004qlP-1L2A;
	Thu, 23 May 2024 03:06:01 +0000
Received: from out-171.mta1.migadu.com ([95.215.58.171])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9ym8-00000004qgM-306p
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 03:05:59 +0000
X-Envelope-To: kikuchan98@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1716433542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5pCVOTMBUtF61UbWtvu2nKJhMTtTjKGnydb/Jdcjr8w=;
	b=FhxcBbdSQ46OFbvgAWdxQJA7GZW9tW+Rqg67JJJviT54ZJTH6ulBW8YIa9jNvxyuDsNw2f
	2M/1OGKt48ujYuqKtg2WOKVbf9LUj5QLVbw/xYFNEUyfmwF6cxVDatxWTSgeHR7Hpj3lwo
	p4TZSrMq25uv13sjXX7HUuRJ+wBZu1717d/7y3dAv8crxXQdQAn4NIQ2pxyxbdK73ytwhD
	CnU1avWfaB1loIYCZTer/ek+TfsfD6DdW2iZ7ZFrVwJf8eiQ0i9voPBMW9Fv0CpU0s6OfJ
	NzE/w7FHeZbUlwG2pXmyhTBWO+UfBPnwD4Mq+W+09cbkaS04YQFNocDyVfIOOg==
X-Envelope-To: privatesub2@gmail.com
X-Envelope-To: aou@eecs.berkeley.edu
X-Envelope-To: bigunclemax@gmail.com
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
X-Envelope-To: fusibrandon13@gmail.com
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-pwm@vger.kernel.org
X-Envelope-To: linux-riscv@lists.infradead.org
X-Envelope-To: linux-sunxi@lists.linux.dev
X-Envelope-To: mkl@pengutronix.de
X-Envelope-To: p.zabel@pengutronix.de
X-Envelope-To: palmer@dabbelt.com
X-Envelope-To: paul.walmsley@sifive.com
X-Envelope-To: robh@kernel.org
X-Envelope-To: samuel@sholland.org
X-Envelope-To: ukleinek@kernel.org
X-Envelope-To: wens@csie.org
Date: Thu, 23 May 2024 13:04:11 +1000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: =?utf-8?B?44GN44GP44Gh44KD44KT44GV44KT?= <kikuchan98@gmail.com>
Cc: privatesub2@gmail.com, aou@eecs.berkeley.edu, bigunclemax@gmail.com,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	fusibrandon13@gmail.com, jernej.skrabec@gmail.com,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	mkl@pengutronix.de, p.zabel@pengutronix.de, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh@kernel.org, samuel@sholland.org,
	ukleinek@kernel.org, wens@csie.org
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <Zk6yK3U9tgxOxcBb@titan>
References: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAG40kxGMu-TSchNezkcC_A97hzPnWU3KxeL-X-hJfPhjr_COyQ@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_200553_054742_F2128E2F 
X-CRM114-Status: GOOD (  19.76  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgMTE6MjY6MDdBTSArMDkwMCwg44GN44GP44Gh44KD44KT
44GV44KTIHdyb3RlOgo+IEhlbGxvIEFsZWtzYW5kciwKPiAKPiBJIGhhZCBjb2luY2lkZW50YWxs
eSBkZXZlbG9wZWQgYSBQV00gZHJpdmVyIGZvciB0aGUgZGV2aWNlLgo+IEJhc2VkIG9uIG15IGV4
cGVyaWVuY2UsIEkgZmluZCB0aGF0IGR5bmFtaWNhbGx5IGNoYW5naW5nIHRoZSBjb3VwbGVkCj4g
RElWX00gdmFsdWUgaXMgcXVpdGUgY29tcGxleC4KPiBUaGUgY3VycmVudCBhcHByb2FjaCBoYXMg
bGltaXRhdGlvbnMsIGVzcGVjaWFsbHkgd2l0aCByZXNvbHV0aW9uCj4gY2hhbmdlcywgd2hpY2gg
Y2FuIGJlIHVucHJlZGljdGFibGUgZm9yIHVzZXJzLiBGb3IgZXhhbXBsZToKPiAKPiAgIDEuIEVu
YWJsaW5nIGNoYW5uZWwgQSBhdXRvbWF0aWNhbGx5IHNlbGVjdHMgRElWX00uCj4gICAyLiBFbmFi
bGluZyBjb3VwbGVkIGNoYW5uZWwgQiB3aXRoIGEgc3BlY2lmaWMgcGVyaW9kIG1heSByZXN1bHQg
aW4KPiBwb29yIHJlc29sdXRpb24gZm9yIGNoYW5uZWwgQiwgYXMgdGhlIERJVl9NIHZhbHVlIGRl
cGVuZHMgb24gdGhlCj4gcGVyaW9kIG9mIGNoYW5uZWwgQS4KPiAgIDMuIElmIGNoYW5uZWwgQiBp
cyBlbmFibGVkIGZpcnN0LCBjaGFubmVsIEEgbWF5IG5vdCBiZSBlbmFibGVkIGlmCj4gaXRzIHBl
cmlvZCBkb2Vzbid0IGZpdCB0aGUgRElWX00gcmFuZ2Ugc2VsZWN0ZWQgYnkgY2hhbm5lbCBCLgo+
IAo+IEFkZGl0aW9uYWxseSwgdXNpbmcgQVBCIGFzIGEgY2xvY2sgc291cmNlIGZvciB0aGUgY2hh
bm5lbHMgd291bGQKPiBmdXJ0aGVyIGNvbXBsaWNhdGUgdGhlIHByb2Nlc3MuCj4gCj4gVG8gc2lt
cGxpZnkgdGhpcywgSSBzdWdnZXN0IChtYXliZSBmb3IgdGhlIGZ1dHVyZSkgc3BlY2lmeWluZyB0
aGVzZQo+IHZhbHVlcyBkaXJlY3RseSBpbiB0aGUgRGV2aWNlIFRyZWUgbGlrZSB0aGlzOgo+IGBg
YAo+IGFsbHdpbm5lcixwd20tY291cGxlZC1jaGFubmVsLWNsb2NrLXNvdXJjZXM9Imhvc2MiLCAi
YXBiIiwgImhvc2MiOwo+IGFsbHdpbm5lcixwd20tY291cGxlZC1jaGFubmVsLWNsb2NrLXByZXNj
YWxlcz08MD4sIDwzPiwgPDg+Owo+IGBgYAo+IFRoaXMgd291bGQgZGVsZWdhdGUgdGhlIGNvbXBs
ZXhpdHkgdG8gdGhlIERULCBtYWtpbmcgdGhlIHJlc29sdXRpb24KPiBwcmVkaWN0YWJsZSBmb3Ig
dXNlcnMuCj4gQXMgYSBib251cywgaXQgaW50cm9kdWNlcyBhIHdheSB0byBzZWxlY3QgY2xvY2sg
c291cmNlcyBmb3IgZWFjaAo+IGNvdXBsZWQgY2hhbm5lbHMuCj4gCj4gRm9yIHRoZSBtZWFudGlt
ZSwgSSB0aGluayBpdCBpcyBlbm91Z2ggdG8gdXNlIGZpeGVkICJob3NjIiBhbmQgPDA+IGZvcgo+
IHJlZ3VsYXIgdXNlLgo+IAo+IExvb2tpbmcgZm9yd2FyZCB0byB5b3VyIHRob3VnaHRzLgo+IAo+
IEJlc3QgcmVnYXJkcywKPiBraWt1Y2hhbi4KCkkgaGF2ZSBhIHNvbWV3aGF0IG9wcG9zaXRlIG9w
aW5pb24uIEkndmUgZGV2ZWxvcGVkIGEgZHJpdmVyIHRvbyBhbmQgcG9zdGVkIGl0Cm9uIHRoZSB1
LWJvb3QgbWFpbGluZyBsaXN0IHRoYXQgaXMgZGV0ZXJtaW5pc3RpYyBhbmQgaGFuZGxlcyBib3Ro
IGNoYW5uZWxzOgoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNTE4LXB3bV9kMS12
MS0wLTMxMWZjNWZlMjI0OEBqb29raWEub3JnLwoKSXQgZG9lcyB0aGlzIGJ5IHJlbWVtYmVyaW5n
IHRoZSBzZXR0aW5ncyBmb3IgY2hhbm5lbHMgYW5kIGRpc2FibGluZyB0aGVuCnNldHRpbmcgYm90
aCBjaGFubmVscyBhdCBvbmNlIHdoZW5ldmVyIHRoZXJlJ3MgYW4gdXBkYXRlLgoKSSB0aGluayB0
aGlzIGlzIGEgZGVjZW50IGVub3VnaCBzb2x1dGlvbiB0byB0aGUgcHJvYmxlbSBhbmQganVzdCB3
b3JrcwphdXRvbWF0aWNhbGx5IHdpdGhvdXQgcGVvcGxlIGhhdmluZyB0byBtaWNyb21hbmFnZSB0
aGUgY29udHJvbGxlci4KCkpvaG4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
