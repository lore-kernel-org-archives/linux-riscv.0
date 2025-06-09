Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 921F4C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 12:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRq0Fq/H6rI5Pt2uh0DGjLGyYBb5NqPtep4AmYaxpPs=; b=qmpJdOzRU9lL9W
	VQ3/I9EA0M30x0uiRLHPX1nbfKV4jQToK6tz7hHsHTacSnN9YUDlMuT/O3KITlaMn6dSQg1AIprU7
	zshRRbv/kgRJZSIk24LKElUoq2hVINmR9aRYZsT1L5savkoVTw6m+c6/Jfpjt8JotRHuSp51bz85u
	Qc3hm6xqLRI0H6t3Bq7MzBfgyTFtmRLPT9sQd5s/yp1FjVioaRSVb/drnk2pcAXIU19hTABAoxCUh
	LqZQy0TBFNe8X0MG3IeM4qbak0Rm9ESjo6btWfbxUCN/3eU+shl8u8ozLYB66hWbdByDG0IsYMl3t
	V+bjgiP0HhL234Qweb0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObLm-000000045Eg-3QQv;
	Mon, 09 Jun 2025 12:11:38 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObHQ-000000044qO-1AOW
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 12:07:09 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 559C67ue032205
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Mon, 9 Jun 2025 20:06:07 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 20:06:07 +0800
Date: Mon, 9 Jun 2025 20:06:07 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: Conor Dooley <conor@kernel.org>
CC: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <tim609@andestech.com>
Subject: Re: [PATCH v5 0/8] add Voyager board support
Message-ID: <aEbOLztcBsKs84pn@atctrx.andestech.com>
References: <20250602060747.689824-1-ben717@andestech.com>
 <20250606-booth-icky-b416c1827a43@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250606-booth-icky-b416c1827a43@spud>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 559C67ue032205
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_050708_627192_A51C039B 
X-CRM114-Status: GOOD (  16.63  )
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

T24gRnJpLCBKdW4gMDYsIDIwMjUgYXQgMDU6MDA6MDZQTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+IFtFWFRFUk5BTCBNQUlMXQoKPiBEYXRlOiBGcmksIDYgSnVuIDIwMjUgMTc6MDA6MDYg
KzAxMDAKPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Cj4gVG86IEJlbiBa
b25nLVlvdSBYaWUgPGJlbjcxN0BhbmRlc3RlY2guY29tPgo+IENjOiBwYXVsLndhbG1zbGV5QHNp
Zml2ZS5jb20sIHBhbG1lckBkYWJiZWx0LmNvbSwgYW91QGVlY3MuYmVya2VsZXkuZWR1LAo+ICBh
bGV4QGdoaXRpLmZyLCByb2JoQGtlcm5lbC5vcmcsIGtyemsrZHRAa2VybmVsLm9yZywgY29ub3Ir
ZHRAa2VybmVsLm9yZywKPiAgdGdseEBsaW51dHJvbml4LmRlLCBkYW5pZWwubGV6Y2Fub0BsaW5h
cm8ub3JnLAo+ICBwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20sIGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnLAo+ICBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
LCBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLAo+ICB0aW02MDlAYW5kZXN0ZWNoLmNvbQo+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMC84XSBhZGQgVm95YWdlciBib2FyZCBzdXBwb3J0Cj4g
Cj4gT24gTW9uLCBKdW4gMDIsIDIwMjUgYXQgMDI6MDc6MzlQTSArMDgwMCwgQmVuIFpvbmctWW91
IFhpZSB3cm90ZToKPiA+IFRoZSBWb3lhZ2VyIGlzIGEgOS424oCdIHggOS424oCdIE1pY3JvIEFU
WCBmb3JtIGZhY3RvciBkZXZlbG9wbWVudCBib2FyZAo+ID4gaW5jbHVkaW5nIEFuZGVzIFFpTGFp
IFNvQy4gVGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBtaW5pbWFsIGRldmljZSB0cmVlCj4gPiBmaWxl
cyBmb3IgdGhlIFFpTGFpIFNvQyBhbmQgdGhlIFZveWFnZXIgYm9hcmQgWzFdLgo+ID4gCj4gPiBO
b3cgb25seSBzdXBwb3J0IGJhc2ljIHVhcnQgZHJpdmVycyB0byBib290IHVwIGludG8gYSBiYXNp
YyBjb25zb2xlLiBPdGhlcgo+ID4gZmVhdHVyZXMgd2lsbCBiZSBhZGRlZCBsYXRlci4KPiA+IAo+
ID4gWzFdIGh0dHBzOi8vd3d3LmFuZGVzdGVjaC5jb20vZW4vcHJvZHVjdHMtc29sdXRpb25zL2Fu
ZGVzaGFwZS1wbGF0Zm9ybXMvcWlsYWktY2hpcC8KPiAKPiBCYWxsIGlzIGluIHlvdXIgY291cnQg
bm93LCBhZnRlciByYzEgbWFrZSBhIHRyZWUgYW5kIGdldCBpdCBpbgo+IGxpbnV4LW5leHQsIGFu
ZCB0aGVuIHNlbmQgYSBwciB0byBzb2NAa2VybmVsLm9yZyB3aXRoIHRoaXMgbmV3IGNvbnRlbnQu
Cj4gUGVyaGFwcyB0aGUgZGVmY29uZmlnIHNob3VsZCBnbyBzZXBhcmF0ZWx5LCBJIGNhbiB0YWtl
IHRoYXQgb25lIGlmIHlvdQo+IHdhbnQuCj4gCj4gQ2hlZXJzLAo+IENvbm9yLgoKSGkgQ29ub3Is
CgpUaGFua3MgZm9yIHlvdXIgZ3VpZGFuY2Ugb24gdGhlc2UgcGF0Y2hlcy4gSSB3aWxsIHNlbmQg
YSBQUiB0bwpzb2NAa2VybmVsLm9yZyBhcyB5b3Ugc3VnZ2VzdGVkLgoKRm9yIHRoZSBkZWZjb25m
aWcgcGF0Y2gsIEknbSBoYXBweSBmb3IgeW91IHRvIGhhbmRsZSBpdC4gSnVzdCBsZXQgbWUKa25v
dyBpZiB0aGVyZSdzIGFueXRoaW5nIHNwZWNpZmljIHlvdSdkIGxpa2UgbWUgdG8gaW5jbHVkZS4K
ClRoYW5rcywKQmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
