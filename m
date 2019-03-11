Return-Path: <SRS0=WyFe=RO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6113CC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:48:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3260220643
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Mar 2019 16:48:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VzaAdGmV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3260220643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PoX0jbOD/YTc2mSUJY+edB3N+fWSSH+PPJCSc249CZY=; b=VzaAdGmVtscwS2
	iQAuCp/3vNTKWcoyPjBdlyndLH1zo/HKe1sFZhE5ahllzOHj5CcJEsLh2gD86728FaPd8i6z4wkcc
	fK8A5QOIRnY+SFOoOe0acb6KOC2cFb7fcHgzsSgV3Zq9ytR33m89nowXWbk6GIErzV6ZIEZai/PDq
	7YAEGIxMG1Iwj41JVnmIRnoZDJZ3suKKFJIedX3Wlng4J0iGy/iw2393hXONtabFERIWP+ReiY4gb
	MF17frU8ge3WkGKZgyDDirquNNUxdCzH9f2UdwNa8U10fFfwzbf873pfrEVcfHQRfgVP0Gseq6Qcr
	Pj/1gqd+cgS+ud51BQhQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3O6e-0006KC-L4; Mon, 11 Mar 2019 16:48:52 +0000
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]
 helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3O6U-0006CN-Nk; Mon, 11 Mar 2019 16:48:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C10FD1688;
 Mon, 11 Mar 2019 09:48:41 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F14193F59C;
 Mon, 11 Mar 2019 09:48:39 -0700 (PDT)
Date: Mon, 11 Mar 2019 16:48:37 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: per-cpu thoughts
Message-ID: <20190311164837.GD24275@lakrids.cambridge.arm.com>
References: <CAJ+HfNgSx49dRXDdJGovb=auAjSB703bN9tULjibW1OKHuHcPg@mail.gmail.com>
 <mhng-79f13983-1ea9-4f9a-949a-87dac2060f42@palmer-si-x1c4>
 <CAJ+HfNhmUdz4y81VNnTOsvyvSNw3i3E=qR+F0Qa7XThSOAiJ1A@mail.gmail.com>
 <010001696d414b3a-d35fa0a2-01fa-4e8c-be57-ff703610755a-000000@email.amazonses.com>
 <CAJ+HfNh6bc1A8vskxqJ9CP11aPdTgrPS2SOgLGXMLyefogFLtw@mail.gmail.com>
 <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1903110814130.11892@viisi.sifive.com>
User-Agent: Mutt/1.11.1+11 (2f07cb52) (2018-12-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_094842_784996_84668B32 
X-CRM114-Status: GOOD (  25.31  )
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
Cc: Paul Walmsley <paul@pwsan.com>,
 =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmer@sifive.com>, will.deacon@arm.com,
 catalin.marinas@arm.com, Nick Kossifidis <mick@ics.forth.gr>,
 Christopher Lameter <cl@linux.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGF1bCwKCk9uIE1vbiwgTWFyIDExLCAyMDE5IGF0IDA4OjI2OjQ1QU0gLTA3MDAsIFBhdWwg
V2FsbXNsZXkgd3JvdGU6Cj4gKyB0aGUgQVJNNjQgZ3V5cyBhbmQgbGFrbWwKPiAKPiBPbiBNb24s
IDExIE1hciAyMDE5LCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+IAo+ID4gT24gTW9uLCAxMSBNYXIg
MjAxOSBhdCAxNTo1NiwgQ2hyaXN0b3BoZXIgTGFtZXRlciA8Y2xAbGludXguY29tPiB3cm90ZToK
PiA+ID4KPiA+ID4gT24gTW9uLCAxMSBNYXIgMjAxOSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+
ID4KPiA+ID4gPiA+IFRoYW5rcyBhIGJ1bmNoISAgSSBmZWVsIGxpa2UgdGhlIGJlc3Qgb3B0aW9u
IGhlcmUgaXMgdG8ganVzdCB1c2UgdGhlIEFNT3MKPiA+ID4gPiA+IHdpdGhvdXQgZGlzYWJsaW5n
IHByZWVtcHRpb24gYW5kIGVuc3VyaW5nIHRoYXQgYWxsIG90aGVyIGFjY2Vzc2VzIGFyZSBhdG9t
aWMKPiA+ID4gPiA+ICh2aWEgQU1PcyBvciBMUi9TQykuICBUaGUgb25seSByZWFzb24gSSBjYW4g
c2VlIHRoYXQgd291bGRuJ3QgYmUgdGhlIHdheSB0byBnbwo+ID4gPiA+ID4gd291bGQgYmUgaWYg
aXQgcmVxdWlyZXMgbm9uLWFyY2ggbW9kaWZpY2F0aW9ucywgYXMgaWYgd2UgZ28gZG93biB0aGF0
IHBhdGgKPiA+ID4gPiA+IHdlJ2xsIGJlIGFibGUgdG8gaGFuZGxlIHRoZSBwZXJmb3JtYW5jZSBl
ZGdlIGNhc2VzIGluIHRoZSBpbXBsZW1lbnRhdGlvbi4KPiA+ID4gPgo+ID4gPiA+IEhtbSwgeW91
IG1lYW4gQU1PICp3aXRoKiBwcmVlbXB0X3tkaXMsZW59YWJsZSwgcmlnaHQ/IChObywgaW50ZXJy
dXB0Cj4gPiA+ID4gZGlzYWJsZSwgb25seSBwcmVlbXB0aW9uLikKPiA+ID4KPiA+ID4gSWYgeW91
IGRpc2FibGUgcHJlZW1wdGlvbiB0aGVuIHlvdSBkb250IG5lZWQgQU1PIGFueW1vcmUuIEluIGZh
Y3QgdGhhdCBpcwo+ID4gPiB0aGUgZGVmYXVsdCBmYWxsYmFjayBnZW5lcmljIGltcGxlbWVudGF0
aW9uLiBKdXN0IGRvbnQgZG8gYW55dGhpbmcgYW5kIHlvdQo+ID4gPiBhbHJlYWR5IGhhdmUgdGhh
dCBzb2x1dGlvbi4KPiA+IAo+ID4gQnV0IHRoZSBnZW5lcmljIG9uZSBkaXNhYmxlcyBpbnRlcnJ1
cHRzLCByaWdodD8KPiA+IAo+ID4gSSBiZWxpZXZlIHRoZSByYXRpb25hbCBmb3IgUlYgaXMgc2lt
aWxhciB0byBBUk0nczsgQU1PK3ByZWVtcHRpb24KPiA+IGRpc2FibGUgcmVnaW9ucyBpcyAqc2xp
Z2h0bHkqIGJldHRlciB0aGFuIHRoZSBnZW5lcmljLCBidXQgbm90IGFzIGdvb2QKPiA+IGFzIHRo
ZSBJQSBvbmUuIE9yIGFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gCj4gVGhlcmUncyBiZWVuIGEg
ZGlzY3Vzc2lvbiBnb2luZyBvbiBpbiBhIHByaXZhdGUgdGhyZWFkIGFib3V0IHRoaXMgdGhhdCBJ
IAo+IHVuZm9ydHVuYXRlbHkgZGlkbid0IGFkZCB5b3UgdG8uICBUaGUgZGlzY3Vzc2lvbiBpcyBz
dGlsbCBvbmdvaW5nLCBidXQgSSAKPiB0aGluayBDaHJpc3RvcGggYW5kIG15c2VsZiBhbmQgYSBm
ZXcgb3RoZXIgZm9sa3MgaGF2ZSBhZ3JlZWQgdGhhdCB0aGUgCj4gcHJlZW1wdF9kaXNhYmxlL2Vu
YWJsZSBpcyBub3QgbmVlZGVkIGZvciB0aGUgYW1vYWRkIGFwcHJvYWNoLiAgVGhpcyBpcyAKPiBz
aW5jZSB0aGUgYXBwYXJlbnQgaW50ZW50aW9uIG9mIHRoZSBwcmVlbXB0aW9uIGRpc2FibGUvZW5h
YmxlIGlzIHRvIGVuc3VyZSAKPiB0aGUgY29ycmVjdG5lc3Mgb2YgdGhlIGNvdW50ZXIgaW5jcmVt
ZW50OyBob3dldmVyIHRoZXJlIGlzIG5vIHJpc2sgb2YgCj4gaW5jb3JyZWN0bmVzcyBpbiBhbiBh
bW9hZGQgc2VxdWVuY2Ugc2luY2UgdGhlIGF0b21pYyBhZGQgaXMgbG9ja2VkIGFjcm9zcyAKPiBh
bGwgb2YgdGhlIGNhY2hlIGNvaGVyZW5jeSBkb21haW4uIAoKV2UgYWxzbyB0aG91Z2h0IHRoYXQg
aW5pdGlhbGx5LCBidXQgdGhlcmUncyBhIHNidXRsZSByYWNlIHRoYXQgY2FuCm9jY3VyLCBhbmQg
c28gd2UgYWRkZWQgY29kZSB0byBkaXNhYmxlIHByZWVtcHRpb24gaW4gY29tbWl0OgoKICBmM2Vh
YjcxODRkZGNkNDg2ICgiYXJtNjQ6IHBlcmNwdTogTWFrZSB0aGlzX2NwdSBhY2Nlc3NvcnMgcHJl
LWVtcHQgc2FmZSIpCgpUaGUgcHJvYmxlbSBvbiBhcm02NCBpcyB0aGF0IG91ciBhdG9taWNzIHRh
a2UgYSBzaW5nbGUgYmFzZSByZWdpc3RlciwKYW5kIHdlIGhhdmUgdG8gZ2VuZXJhdGUgdGhlIHBl
cmNwdSBhZGRyZXNzIHdpdGggc2VwYXJhdGUgaW5zdHJ1Y3Rpb25zCmZyb20gdGhlIGF0b21pYyBp
dHNlbGYuIFRoYXQgbWVhbnMgd2UgY2FuIGdldCBwcmVlbXB0ZWQgYmV0d2VlbiBhZGRyZXNzCmdl
bmVyYXRpb24gYW5kIHRoZSBhdG9taWMsIHdoaWNoIGlzIHByb2JsZW1hdGljIGZvciBzZXF1ZW5j
ZXMgbGlrZToKCgkvLyBUaHJlYWQtQQkJCS8vIFRocmVhZC1CCgoJdGhpc19jcHVfYWRkKHZhcikK
CQkJCQlsb2NhbF9pcnFfZGlzYWJsZShmbGFncykKCQkJCQkuLi4KCQkJCQl2ID0gX190aGlzX2Nw
dV9yZWFkKHZhcik7CgkJCQkJdiA9IHNvbWVfZnVuY3Rpb24odik7CgkJCQkJX190aGlzX2NwdV93
cml0ZSh2YXIsIHYpOwoJCQkJCS4uLgoJCQkJCWxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKQoKLi4u
IHdoaWNoIGNhbiB1bmV4cGVjdGVkbHkgcmFjZSBhczoKCgoJLy8gVGhyZWFkLUEJCQkvLyBUaHJl
YWQtQgoJCgk8IGdlbmVyYXRlIENQVSBYIGFkZHIgPgoJPCBwcmVlbXB0ZWQgPgoKCQkJCQk8IHNj
aGVkdWxlZCBvbiBDUFUgWCA+CgkJCQkJbG9jYWxfaXJxX2Rpc2FibGUoZmxhZ3MpOwoJCQkJCXYg
PSBfX3RoaXNfY3B1X3JlYWQodmFyKTsKCgk8IHNjaGVkdWxlZCBvbiBDUFUgWSA+Cgk8IGFkZCB0
byBDUFUgWCdzIHZhciA+CgkJCQkJdiA9IHNvbWVfZnVuY3Rpb24odik7CgkJCQkJX190aGlzX2Nw
dV93cml0ZSh2YXIsIHYpOwoJCQkJCWxvY2FsX2lycV9yZXN0b3JlKGZsYWdzKTsKCi4uLiBhbmQg
aGVuY2Ugd2UgbG9zZSBhbiB1cGRhdGUgdG8gYSBwZXJjcHUgdmFyaWFibGUuCgpJIHN1c3BlY3Qg
UklTQy1WIHdvdWxkIGhhdmUgdGhlIHNhbWUgcHJvYmxlbSwgdW5sZXNzIGl0cyBBTU9zIGNhbgpn
ZW5lcmF0ZSB0aGUgcGVyY3B1IGFkZHJlc3MgYW5kIHBlcmZvcm0gdGhlIHVwZGF0ZSBpbiBhIHNp
bmdsZQppbnN0cnVjdGlvbi4KCj4gVGhlcmUgYXJlIGEgZmV3IG91dHN0YW5kaW5nIHBvaW50cyB0
aGF0IHdlJ3JlIHRyeWluZyB0byB0YWxrIHRocm91Z2gsIGJ1dCAKPiBpdCBzaG91bGQgYmUgZmlu
ZSBmb3IgYW4gaW5pdGlhbCBpbXBsZW1lbnRhdGlvbiB0byBzdGFydCB3aXRoIHRoZSAKPiBhbW9h
ZGQtYmFzZWQgYXBwcm9hY2guCj4gCj4gQXMgZmFyIGFzIHRoZSBBUk0gTFNFIGF0b21pYyBpbXBs
ZW1lbnRhdGlvbiBnb2VzLCBJJ20gbm90IGFuIGV4cGVydCBvbiAKPiB0aG9zZSBpbnN0cnVjdGlv
bnMuIElmIHRob3NlIGluc3RydWN0aW9ucyBhcmUgbG9ja2VkIGFjcm9zcyBhbGwgb2YgdGhlIAo+
IGNhY2hlcyBmb3IgdGhlIGNvcmVzIGluIHRoZSBMaW51eCBzeXN0ZW0gYWxzbywgdGhlbiB0aGV5
IHByb2JhYmx5IGRvbid0IAo+IG5lZWQgdGhlIHByZWVtcHRfZGlzYWJsZS9lbmFibGUgZWl0aGVy
IC0gYXNzdW1pbmcgb3VyIGNvbGxlY3RpdmUgCj4gdW5kZXJzdGFuZGluZyBvZiB0aGUgcHVycG9z
ZSBvZiB0aGUgcHJlZW1wdF9kaXNhYmxlL2VuYWJsZSBpcyBjb3JyZWN0Lgo+IAo+IEFsbCB0aGlz
IGlzLCBvZiBjb3Vyc2UsIGFzc3VtaW5nIHRoZXJlIGlzIG5vIHNlY29uZGFyeSBwdXJwb3NlIHRv
IHRoZSAKPiBwcmVlbXB0X2Rpc2FibGUvZW5hYmxlIHRoYXQgd2UgaGF2ZW4ndCBtYW5hZ2VkIHRv
IGVsaWNpdCB5ZXQuCgpTb3JyeSB0byBiZSB0aGUgYmVhcmVyIG9mIGJhZCBuZXdzISA6KQoKRldJ
VywgSSBoYWQgYSBnbyBhdCBidWlsZGluZyBwZXJjcHUgb3BzIHRoYXQgZGlkbid0IG5lZWQgdG8g
ZGlzYWJsZQpwcmVlbXB0aW9uLCBidXQgdGhhdCByZXF1aXJlZCBMTC9TQyBhdG9taWNzLCByZXNl
cnZpbmcgYSBHUFIgZm9yIHRoZQpwZXJjcHUgb2Zmc2V0LCBhbmQgZGlkbid0IHJlc3VsdCBpbiBh
IG1lYXN1cmFibGUgZGlmZmVyZW5jZSBpbiBwcmFjdGljZS4KVGhlIHBhdGNoZXMgYXJlIGF0OgoK
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbWFyay9saW51
eC5naXQvY29tbWl0Lz9oPWFybTY0L3RoaXMtY3B1LXJlZyZpZD04NGVlNWYyM2Y5M2Q0YTY1MGU4
MjhmODMxZGE5ZWQyOWM1NDYyM2M1CgpUaGFua3MsCk1hcmsuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
