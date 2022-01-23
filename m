Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37B6C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Jan 2022 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rzcOVAqzDxNVNBRrG2r2x6FRJsziWZCJ66rUDVFjMp0=; b=r/wXd+6IyPcPMP
	ZnyWhFqx1LTSi7YmgEKxpPKGdCnEoqPT46gjezPJbve7xUa3K2ULw8DYBlWFeIKDgTZqNhu0WD1yW
	Ronab0kb+gNb2YktYVLHivG+hQdj1flZSM0MJ/ru5vVwaYO0mWTcy4ViwWa2Yes56mAwznkb/yqR4
	2+oXopYCG0oGPxXVBvybDN//b7zi6ROajICqnpxKgjQH4GqYVcZFLxCGTmNFrXHqiRhvJ2iz3mEHJ
	5Avq25AcV1FUVo9EFncJeaVHeAAsJ/PhOok5CH+gGZ07lH7aNphMxE0fQItCGbHSlzPmeAjuXBXHv
	9ow5hlQBAA7NJww7BNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBgSN-001Shm-ST; Sun, 23 Jan 2022 17:15:11 +0000
Received: from m228-6.mailgun.net ([159.135.228.6])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBgSI-001Sg7-DN
 for linux-riscv@lists.infradead.org; Sun, 23 Jan 2022 17:15:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=michaelkloos.com;
 q=dns/txt; 
 s=k1; t=1642958106; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=KMCKo4cpOIFU5Z2gsr3EOOcDEAmZ5XEZ/k/AX4zaDbA=;
 b=bBjK088xo1ObtreG6xEsbIqQcjZZvwloJ/7WIwD51x/E9qj1cBQ2HRSZTWhhvCh/sQF2AfcA
 LArShW7hQnzW8U70B+GEPoT1HwLL0LKLnN2x0ntNjQS8mluD4hsWXXbGDat5Nk2QBReNigca
 t+EPclzBoH33dCczyB8+vV3RlR8=
X-Mailgun-Sending-Ip: 159.135.228.6
X-Mailgun-Sid: WyIxOGJjMSIsICJsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnIiwgIjQ4Y2MwIl0=
Received: from drop1.michaelkloos.com (drop1.michaelkloos.com
 [67.205.190.89]) by smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61ed8d16e0071250cf5a03b6 (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Sun, 23 Jan 2022 17:15:02 GMT
Received: from [192.168.0.104] (cpe-173-88-115-50.columbus.res.rr.com
 [173.88.115.50])
 by drop1.michaelkloos.com (Postfix) with ESMTPSA id 425B240249;
 Sun, 23 Jan 2022 17:15:01 +0000 (UTC)
Message-ID: <3607326c-9d39-a9e7-8e14-65aaef2094fd@michaelkloos.com>
Date: Sun, 23 Jan 2022 12:15:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] Fixed: Misaligned memory access. Fixed pointer
 comparison.
Content-Language: en-US
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-kernel@vger.kernel.org
References: <20220123034518.3717116-1-michael@michaelkloos.com>
 <485047B2-E566-4679-87CF-C4B3CAFEF108@jrtc27.com>
From: "Michael T. Kloos" <michael@michaelkloos.com>
In-Reply-To: <485047B2-E566-4679-87CF-C4B3CAFEF108@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_091506_572021_59E2C72A 
X-CRM114-Status: GOOD (  17.10  )
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

WWVzLCB5b3UgYXJlIGNvcnJlY3QsIGJ1dCB3aGlsZSBJIGFtIG5vdCB0aGF0IGtub3dsZWRnZWFi
bGUgaW4gdGhlIGtlcm5lbApidWlsZCBzeXN0ZW0sIEkgYmVsaWV2ZSB0aGF0IGluIG1hbnkgYnVp
bGQgc3lzdGVtcywgYmludXRpbHMgImFzIiBpcyB1c3VhbGx5CmNhbGxlZCBieSB0aGUgImdjYyIg
d3JhcHBlciwgcmF0aGVyIHRoYW4gYmVpbmcgZXhlY3V0ZWQgZGlyZWN0bHkuICBUaGlzCmFsbG93
cyBmb3IgdGhlIEMgcHJlcHJvY2Vzc29yIHRvIGJlIGVhc2lseSBhbmQgYXV0b21hdGljYWxseSBy
dW4gb3ZlciAqLlMKZmlsZXMgZmlyc3QuICBCaW51dGlscyAiYXMiIGRvZXNuJ3QgY2FyZSBhYm91
dCBzdWZmaXguICBJdCBqdXN0IGFzc2VtYmxlcy4KImdjYyIgd2lsbCBjaGVjayBhbmQgY2FsbCB0
aGUgb3RoZXIgdG9vbHMgYXMgbmVjZXNzYXJ5IHRvIGJ1aWxkLgoKUGVyaGFwcyBJIHNob3VsZCBo
YXZlIGJlZW4gbW9yZSBzcGVjaWZpYyBpbiBteSBsYW5ndWFnZS4gIEhvd2V2ZXIsCkkgd2FzIHRy
eWluZyB0byByZWZlciB0byB0aGUgMiBkaWZmZXJlbnQgYnVpbGQgc3lzdGVtcyBpbiB0aGVpciBl
bnRpcmV0eSwKbm90IHRoZWlyIGluZGl2aWR1YWxseSBzdWItY29tcG9uZW50cyBiZWNhdXNlIEkg
aGFkIG9yaWdpbmFsbHkgdGVzdApidWlsdCB3aXRoIGdjYywgbm90IGNsYW5nLgoKCU1pY2hhZWwK
Ck9uIDEvMjMvMjIgMTA6NDQsIEplc3NpY2EgQ2xhcmtlIHdyb3RlOgoKPiBPbiAyMyBKYW4gMjAy
MiwgYXQgMDM6NDUsIE1pY2hhZWwgVC4gS2xvb3MgPG1pY2hhZWxAbWljaGFlbGtsb29zLmNvbT4g
d3JvdGU6Cj4+IFJld3JvdGUgdGhlIHJpc2N2IG1lbW1vdmUoKSBhc3NlbWJseSBpbXBsZW1lbnRh
dGlvbi4gIFRoZQo+PiBwcmV2aW91cyBpbXBsZW1lbnRhdGlvbiBkaWQgbm90IGNoZWNrIG1lbW9y
eSBhbGlnbm1lbnQgYW5kIGl0Cj4+IGNvbXBhcmVkIDIgcG9pbnRlcnMgd2l0aCBhIHNpZ25lZCBj
b21wYXJpc29uLiAgVGhlIG1pc2FsaWduZWQKPj4gbWVtb3J5IGFjY2VzcyB3b3VsZCBjYXVzZSB0
aGUga2VybmVsIHRvIGNyYXNoIG9uIHN5c3RlbXMgdGhhdAo+PiBkaWQgbm90IGVtdWxhdGUgaXQg
aW4gZmlybXdhcmUgYW5kIGRpZCBub3Qgc3VwcG9ydCBpdCBpbiBoYXJkd2FyZS4KPj4gRmlybXdh
cmUgZW11bGF0aW9uIGlzIHNsb3cgYW5kIG1heSBub3QgZXhpc3QuICBBZGRpdGlvbmFsbHksCj4+
IGhhcmR3YXJlIHN1cHBvcnQgbWF5IG5vdCBleGlzdCBhbmQgd291bGQgbGlrZWx5IHN0aWxsIHJ1
biBzbG93ZXIKPj4gdGhhbiBhbGlnbmVkIGFjY2Vzc2VzIGV2ZW4gaWYgaXQgZGlkLiAgVGhlIFJJ
U0MtViBzcGVjIGRvZXMgbm90Cj4+IGd1YXJhbnRlZSB0aGF0IHN1cHBvcnQgZm9yIG1pc2FsaWdu
ZWQgbWVtb3J5IGFjY2Vzc2VzIHdpbGwgZXhpc3QuCj4+IEl0IHNob3VsZCBub3QgYmUgZGVwZW5k
ZWQgb24uCj4+Cj4+IFRoaXMgcGF0Y2ggbm93IGNoZWNrcyBmb3IgdGhlIG1heGltdW0gZ3JhbnVs
YXJpdHkgb2YgY28tYWxpZ25tZW50Cj4+IGJldHdlZW4gdGhlIHBvaW50ZXJzIGFuZCBjb3BpZXMg
dGhlbSB3aXRoIHRoYXQsIHVzaW5nIHNpbmdsZS1ieXRlCj4+IGNvcHkgZm9yIGFueSB1bmFsaWdu
ZWQgZGF0YSBhdCB0aGVpciB0ZXJtaW5hdGlvbnMuICBJdCBhbHNvIG5vdyB1c2VzCj4+IHVuc2ln
bmVkIGNvbXBhcmlzb24gZm9yIHRoZSBwb2ludGVycy4KPj4KPj4gQWRkZWQgaGFsZi13b3JkIGFu
ZCwgaWYgYnVpbHQgZm9yIDY0LWJpdCwgZG91YmxlLXdvcmQgY29weS4KPj4KPj4gTWlncmF0ZWQg
dG8gdGhlCW5ld2VyIGFzc2VtYmxlciBhbm5vdGF0aW9ucyBmcm9tIHRoZSBub3cgZGVwcmVjYXRl
ZAo+PiBvbmVzLgo+Pgo+PiBDb21taXQgTWVzc2FnZSBFZGl0ZWQgb24gSmFuIDIyIDIwMjI6IEZp
eGVkIHNvbWUgdHlwb3MuCj4+Cj4+IFt2Ml0KPj4KPj4gUGVyIGtlcm5lbCB0ZXN0IHJvYm90LCBJ
IGhhdmUgZml4ZWQgdGhlIGJ1aWxkIHVuZGVyIGNsYW5nLiAgVGhpcwo+PiB3YXMgYnJva2VuIGR1
ZSB0byBhIGRpZmZlcmVuY2UgYmV0d2VlbiBnY2MgYW5kIGNsYW5nLCBjbGFuZyByZXF1aXJpbmcK
Pj4gZXhwbGljdCB6ZXJvIG9mZnNldHMgdGhlIGphbHIgaW5zdHJ1Y3Rpb24uIGdjYyBhbGxvd2Vk
IHRoZW0gdG8gYmUKPj4gb21pdHRlZCBpZiB6ZXJvLgo+IFVubGlrZSBMTFZNLCBHQ0MgZG9lcyBu
b3QgaGF2ZSBhbiBhc3NlbWJsZXIsIHRoYXTigJlzIGJpbnV0aWxz4oCZcyBHTlUgYXMuCj4KPiBK
ZXNzCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
