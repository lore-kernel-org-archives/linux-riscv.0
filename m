Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A48B6C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 23:36:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BB16137D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 23:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BB16137D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x0VPENSPON5DC7L1hPIgEZebgm6i3KQgxQDjwC3F/5g=; b=jOIeEJyfXkl62zZQQNWyW/cz4l
	rNwrBZjnSA96ZAz1QoacX8iLot7cLuhyrosRVOQSrqnngiXU+kLpFlgvTzBQp///TitBhV2Lq+B1j
	knzqej5Ac0nJo8K8NMdRxZ316+/bZ8o3wyzScLqfgapwoOgLrOk9M7s/OR2W38F6NmavG0IoD9GWf
	YjeBsFNkaLwYs4lPamiQlNivcX6rqjKTg82Ho6/UkrErvS12dU+EW9EgIqyDGJkv+G3i4iUJlXBX8
	VLnvJgqQBBHwQQBGtZt4j2cAB6yKNqyz9WiGpu88JSHf5L/cZsiG5PM+KfVORCPDMCXfklnZzVrql
	oHf/Uu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltIb5-003uEI-5d; Tue, 15 Jun 2021 23:35:55 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltIL5-003ouf-DJ
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 23:19:25 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15FNJKhk058328
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 02:19:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623799155; x=1626391155;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uwFXfKsUDq2hvWkMUShCCiVgWGg1LtvvqsBZuvGXYp0=;
 b=LMz1xsXB6BGLWnG55k8/4KVd5f2tm9aH0Ier9huFlt/47D4vW0sg/ztO6pSrB4uf
 PnP5v6Lk2IFZRfbxeRoVDbrfSiTG3RUvYI09ZSIPOtLY8Ipw8J+WFfznFmKDnrvJ
 dGFWD2uHkO2EPf5eLhCGxZZ7e60j+5XaUEgrq1BiQZDmh/9DEickjKKmjGvwRSW0
 fqXA8pZS0s7cU7pSVbEBuaVf4LhBFMTz//P2uBSS+eQQP8zYHd752GIG8RxC6dcf
 nfMDiTNRe/eQE29a/poJC3vogvHlxsFpSLvZiO117EWH0jxRwPTOdGFCEAQU1pd1
 y6HmTkZB3yzgPfAOx/1lhQ==;
X-AuditID: 8b5b014d-96ef2700000067b6-12-60c93573b2c3
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 87.05.26550.37539C06; Wed, 16 Jun 2021 02:19:15 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Wed, 16 Jun 2021 02:19:14 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Rob Herring <robh+dt@kernel.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Frank
 Rowand <frowand.list@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org, linux-riscv
 <linux-riscv@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] riscv: Remove non-standard linux,elfcorehdr handling
Organization: FORTH
In-Reply-To: <CAL_JsqLU7GWDxdnR2-Yd2vbj7w=5pNr_fFocDQgPbs17EpBG0g@mail.gmail.com>
References: <cover.1623780059.git.geert+renesas@glider.be>
 <bcc5c666f4ada9a8bbc26f559751f0da67f769f8.1623780059.git.geert+renesas@glider.be>
 <abadee118c1945c44d9bff7675b12ec4@mailhost.ics.forth.gr>
 <CAL_JsqLU7GWDxdnR2-Yd2vbj7w=5pNr_fFocDQgPbs17EpBG0g@mail.gmail.com>
Message-ID: <bdfbf7cc997a10a94331d77332dbe88e@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42Lpjp6urFtsejLB4M8yDYutv2exW7xf1sNo
 Mf/IOVaLmW/+s1nMnT2J0WLT42usFpd3zWGz2Pa5hc2i+d05douXl3uYLdpm8Vu07j3CbtFy
 x9SB12PNvDWMHm9evmTxONzxhd1j4lldj52z7rJ7PNx0iclj06pONo/NS+o9LjVfZ/f4vEku
 gCuKyyYlNSezLLVI3y6BK+P99/WsBRdkK2adC21gfC/excjBISFgIrFqb14XIyeHkMBRRonF
 TeEgtoSAqcTsvZ2MIDavgKDEyZlPWEBsZgELialX9jNC2PISzVtnM4PYLAKqEp2bVrKD2GwC
 mhLzLx0EqxcRUJHY8PwWUA0XUP0+Fom2lyfAioQFfCV+zbwIZvMLCEt8unuRFcTmFAiUeH/5
 GhNIg5DABCaJfV9usUFc4SLxrfU1G8R1KhIffj9gB3lAFMjePFdpAqPgLCS3zkJy6ywkty5g
 ZF7FKJBYZqyXmVysl5ZfVJKhl160iREcVYy+Oxhvb36rd4iRiYPxEKMEB7OSCK9u8YkEId6U
 xMqq1KL8+KLSnNTiQ4zSHCxK4ry8ehPihQTSE0tSs1NTC1KLYLJMHJxSDUyup6ex2j0Ib95W
 YMqsevBi9b0W7UJt5e9vPnkGn7xrOkn/1+kZ7/i3nS5ZuG6tSF9Ye+eWZaceqUcXORt8Sjzx
 7eLsBx3mAZOfTbrLa6riFmcmJ6dy5qCYd+B8HR9zS78ZCx9riKect7HYfcvabq3jwq1P7rCr
 6X/d9iaSn+lnpuX+e5LWqdPu8EdfEJqYkpw/f+HDOzpbWqWvF0zgnS3cEubaLCg4UdZ7Wqni
 xEvrvsyI2RD4cdvDd4fnR2pcyHt/P25jtIfx45B3m9ofz+tfvnqr7Pz9pQsurpdo9L+tuzzI
 Q4NXTY774FY3lto/myepLmye2j9p94eqC+4RQsUpbKrV0y5yMfxZosh98IClEktxRqKhFnNR
 cSIAWD8HaxkDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_161923_878399_823698EB 
X-CRM114-Status: GOOD (  28.54  )
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

zqPPhM65z4IgMjAyMS0wNi0xNSAyMjo1NCwgUm9iIEhlcnJpbmcgzq3Os8+BzrHPiM61Ogo+IE9u
IFR1ZSwgSnVuIDE1LCAyMDIxIGF0IDEyOjQwIFBNIE5pY2sgS29zc2lmaWRpcyA8bWlja0BpY3Mu
Zm9ydGguZ3I+IAo+IHdyb3RlOgo+PiAKPj4gzqPPhM65z4IgMjAyMS0wNi0xNSAyMToxNywgR2Vl
cnQgVXl0dGVyaG9ldmVuIM6tzrPPgc6xz4jOtToKPj4gPiBSSVNDLVYgdXNlcyBwbGF0Zm9ybS1z
cGVjaWZpYyBjb2RlIHRvIGxvY2F0ZSB0aGUgZWxmIGNvcmUgaGVhZGVyIGluCj4+ID4gbWVtb3J5
LiAgSG93ZXZlciwgdGhpcyBkb2VzIG5vdCBjb25mb3JtIHRvIHRoZSBzdGFuZGFyZAo+PiA+ICJs
aW51eCxlbGZjb3JlaGRyIiBEVCBiaW5kaW5ncywgYXMgaXQgcmVsaWVzIG9uIGEgcmVzZXJ2ZWQg
bWVtb3J5IG5vZGUKPj4gPiB3aXRoIHRoZSAibGludXgsZWxmY29yZWhkciIgY29tcGF0aWJsZSB2
YWx1ZSwgaW5zdGVhZCBvZiBvbiBhCj4+ID4gImxpbnV4LGVsZmNvcmVoZHIiIHByb3BlcnR5IHVu
ZGVyIHRoZSAiL2Nob3NlbiIgbm9kZS4KPj4gPgo+PiA+IFRoZSBub24tY29tcGxpYW50IGNvZGUg
Y2FuIGp1c3QgYmUgcmVtb3ZlZCwgYXMgdGhlIHN0YW5kYXJkIGJlaGF2aW9yIGlzCj4+ID4gYWxy
ZWFkeSBpbXBsZW1lbnRlZCBieSBwbGF0Zm9ybS1hZ25vc3RpYyBoYW5kbGluZyBpbiB0aGUgRkRU
IGNvcmUgY29kZS4KPj4gPgo+PiA+IEZpeGVzOiA1NjQwOTc1MDAzZDAyMzRkICgiUklTQy1WOiBB
ZGQgY3Jhc2gga2VybmVsIHN1cHBvcnQiKQo+PiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRl
cmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4+IAo+PiBOQUNLCj4+IAo+PiBUaGVy
ZSBpcyBub3RoaW5nIHN0YW5kYXJkIGFib3V0ICJsaW51eCxlbGZjb3JlaGRyIiwgaXQncyBhbgo+
IAo+IEl0IGlzIGFuZCBpdCBpcyBkb2N1bWVudGVkIHdoaWNoIGlzIG1vcmUgdGhhbiB3ZSBjYW4g
c2F5IGZvcgo+ICJsaW51eCxlbGZjb3JlaGRyIiBhcyBhIG5vZGUuCj4gCgpTdGFuZGFyZCBzdHVm
ZiBnb2VzIG9uIC9kcml2ZXJzL29mLCBub3Qgb24gL2FyY2gvYXJtNjQuIFRoZSAKcmVzZXJ2ZWQt
bWVtb3J5IGJpbmRpbmcgSSB1c2UgaXMgb24gL2RyaXZlcnMvb2YsIGlzIGRlZmluaXRlbHkgYSAK
c3RhbmRhcmQgLyBkb2N1bWVudGVkIGJpbmRpbmcgYW5kIHRoZSBvbmx5IGlzc3VlIGhlcmUgaXMg
dGhhdCB0aGUgCmNvbXBhdGlibGUgc3RyaW5nIEkgdXNlZCBtYXRjaGVkIHRoYXQgcHJvcGVydHkg
ZnJvbSBhcm02NC4KCj4+IGFybTY0LXNwZWNpZmljIHByb3BlcnR5IG9uIC9jaG9zZW4gYW5kIGl0
J3Mgc3Vib3B0aW1hbCwgaXQgZ2V0cyB0aGUKPj4gYWRkci9sZW5ndGggb2YgRUxGIGNvcmUgb2Yg
dGhlIHByZXZpb3VzIGtlcm5lbCB0aHJvdWdoIHRoYXQgcHJvcGVydHkgCj4+IGFuZAo+PiB0aGVu
IGdvZXMgb24gdG8gcmVzZXJ2ZSB0aGF0IHJlZ2lvbiBhdDoKPj4gaHR0cHM6Ly9lbGl4aXIuYm9v
dGxpbi5jb20vbGludXgvdjUuMTMtcmM2L3NvdXJjZS9hcmNoL2FybTY0L21tL2luaXQuYyNMMTU1
Cj4+IAo+PiBXaHkgb24gZWFydGggaXMgdGhpcyBjbGVhbmVyIHRoYW4ganVzdCBkZWZpbmluZyBh
IHJlc2VydmVkLXJlZ2lvbiBpbiAKPj4gdGhlCj4+IGZpcnN0IHBsYWNlIChhIHN0YW5kYXJkIGJp
bmRpbmcpIHdpdGggYW5kIGhvb2sgdXAgYSBjYWxsYmFjayB3aXRoCj4+IFJFU0VSVkVETUVNX09G
X0RFQ0xBUkUgZm9yIGl0IHRvIGFsc28gaW5pdGlhbGl6ZSBlbGZjb3JlaGRyX2FkZHIvc2l6ZSAK
Pj4gPwo+PiBJZiB5b3UgZG9uJ3QgbGlrZSB0aGUgY29tcGF0aWJsZSBzdHJpbmcgSSdtIG9rIHRv
IGNoYW5nZSBpdCwgYnV0IHRoaXMKPj4gcGF0Y2ggYnJlYWtzIGtkdW1wIG9uIHJpc2N2IHNpbmNl
IHRoYXQgcmVnaW9uIHdvbid0IGJlIHJlc2VydmVkIGFueSAKPj4gbW9yZQo+PiBhbmQga2VybmVs
IHdpbGwgY29ycnVwdCBpdC4KPiAKPiBJIG1pZ2h0IGFncmVlIGlmIHdlIHdlcmUgZGVzaWduaW5n
IHRoaXMgYWxsIGZyb20gc2NyYXRjaCwgYnV0IHdlJ3JlCj4gbm90LiBXZSd2ZSBnb3QgcG93ZXJw
YyBkb2luZyAvbWVtcmVzZXJ2ZS8gKyBrZXJuZWwgY21kbGluZSwgYXJtNjQKPiB1c2luZyBjaG9z
ZW4sIGFuZCBSaXNjViBhIDNyZCB3YXkuCj4gCgpJIGdldCBpdCBhbmQgSSdkIGFsc28gbGlrZSB0
byBjb25zb2xpZGF0ZSB0aGluZ3MsIGJ1dCBmb3JjaW5nIHJpc2N2IHRvIAp1c2UgYSBzdWJvcHRp
bWFsIGFwcHJvYWNoIGp1c3QgYmVjYXVzZSBhcm02NCB1c2VzIGl0IGRvZXNuJ3QgbWFrZSBzZW5z
ZSAKZWl0aGVyLCB0aGUgZ29hbCBzaG91bGQgYmUgZm9yIGFsbCB0byB1c2UgdGhlIGJlc3QgcG9z
c2libGUgYXBwcm9hY2ggCihkaXNjbGFpbWVyOiBJJ20gbm90IHNheWluZyBteSBhcHByb2FjaCBp
cyB0aGUgYmVzdCBwb3NzaWJsZSwgSSdtIHNheWluZyAKaXQncyBjbGVhbmVyIHRoYW4gYXJtNjQn
cykuCgo+IFdoYXQgaGFwcGVucyB3aGVuL2lmIFJpc2NWIHdhbnRzIHRvIGFkZCBhbiBJTUEgYnVm
ZmVyPyBUaGF0J3Mgbm8KPiBkaWZmZXJlbnQgdGhhbiB0aGlzIGNhc2UuIFRoZSAyIGFyY2hpdGVj
dHVyZXMgc3VwcG9ydGluZyBpdCBib3RoIHVzZQo+IC9jaG9zZW4uIFNwZWNpZnlpbmcgYW4gaW5p
dHJkIGlzIG5vIGRpZmZlcmVudCBlaXRoZXIuCgpUaG9zZSB0d28gYXJlIGFscmVhZHkgb24gZHJp
dmVycy9vZi9mZHQuYyBhbmQgZHJpdmVycy9vZi9rZXhlYy5jLCBpdCdzIAphbHNvIGludGVyZXN0
aW5nIHRvIG5vdGUgdGhhdCBmb3IgYm90aCBvZiB0aGVtLCBpbmNsdWRpbmcgCiJsaW51eCxlbGZj
b3JlaGRyIiwgdGhlIG5ld2x5IGFkZGVkIGRyaXZlcnMvb2Yva2V4ZWMuYyBhZGRzIGFuIGVudHJ5
IHRvIAp0aGUgZmR0J3MgbWVtb3J5IHJlc2VydmF0aW9uIG1hcCB3aGVuIGNyZWF0aW5nIHRoZSBm
ZHQgZm9yIHRoZSBuZXh0IAprZXJuZWwsIHNvIHRoZXkgYXJlIGFsbCBiYXNpY2FsbHkgcmVzZXJ2
ZWQgcmVnaW9ucy4gV2h5IHRoaXMgd2FzIGNob3NlbiAKKGEgcHJvcGVydHkgb24gL2Nob3NlbiAr
IGFuIGVudHJ5IG9uIHRoZSByZXNlcnZhdGlvbiBtYXApLCBlZmZlY3RpdmVseSAKYWRkaW5nIGVh
Y2ggcmVnaW9uIHR3aWNlIG9uIHRoZSBmZHQsIGluc3RlYWQgb2YganVzdCBhZGRpbmcgYSAKcmVz
ZXJ2ZWQtbWVtb3J5IG5vZGUgZm9yIGVhY2ggb25lIGJlYXRzIG1lLiBOb3RlIHRoYXQgaW4gY2Fz
ZSBvZiBhcm02NCAKdGhpcyBpcyBub3Qgd2hhdCBoYXBwZW5zIG9uIGtleGVjLXRvb2xzLCB3aGlj
aCBpcyBwcm9iYWJseSB0aGUgcmVhc29uIAp3aHkgYXJtNjQgc3RpbGwgcmVzZXJ2ZXMgdGhlbSBp
biBhbnkgY2FzZS4KCkFueXdheSBJIGd1ZXNzIHN3aXRjaGluZyBhcm02NCB0byByZXNlcnZlZC1t
ZW1vcnkgaXMgdG9vIG11Y2ggdG8gYXNrIApzaW5jZSB0aGV5IHdvdWxkIGhhdmUgdG8gYWxzbyBj
aGFuZ2Uga2V4ZWMtdG9vbHMsIGhhbmRsZSBkaWZmZXJlbnQgCnZlcnNpb25zIGV0YywgYW5kIGFs
dGhvdWdoIEkgZG9uJ3QgbGlrZSBpdCBjb25zb2xpZGF0aW9uIGlzIG1vcmUgCmltcG9ydGFudCB0
aGFuIGEgZHVwbGljYXRlIHJlZ2lvbiBvbiB0aGUgZmR0LCBzbyBsZXQncyBnbyB3aXRoIAoibGlu
dXgsZWxmY29yZWhkciIgb24gL2Nob3NlbiArIGVudHJ5IG9uIHRoZSByZXNlcnZhdGlvbiBtYXAu
IEknbGwgCnVwZGF0ZSBteSBrZXhlYy10b29scyBwYXRjaCBpbnN0ZWFkLgoKUmVnYXJkcywKTmlj
awoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
