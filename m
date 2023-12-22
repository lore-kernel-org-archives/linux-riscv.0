Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07086C46CD2
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 04:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WLw7J7sxwfCEjdQ686TqBqsh4j+KBIMBPR0EAtjnqSY=; b=m1j0AnI/4QoFGC
	GDIOC7G1Pc5rtqczqYdHyi5bQsRtj5wdXu86iVjn0xGtAorKWhb0vRZYcoyYM9/L11zIHir6+qevf
	EU3blM3wuQZO+/KXed9wAaPAiv04l+CptPm20YwWBrqFre4YIzV/pSbuFKD1fPsPnecVBqEO/vg1b
	gtHeKj72NhjKpm0PHYqDlB9JMJI2Qed091JgRLqLNKKYtXtnlq0oBa/GOO6AEPDbhNq9VGSfGo3S6
	P1hIQHQRxEoyO3j0HmKjHjeIJ73KBqBRgO5hUhrZaMcm7UGMZRayxXQit7yQXsr6T5KTwJw8ojopV
	CpgaEeMDrXqvDRW3+DFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWvm-004ogl-2y;
	Fri, 22 Dec 2023 04:14:38 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGWvi-004ogO-2f
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 04:14:36 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 6048B68AFE; Fri, 22 Dec 2023 05:14:28 +0100 (CET)
Date: Fri, 22 Dec 2023 05:14:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Maxim Kochetkov <fido_max@inbox.ru>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, robh@kernel.org, mpe@ellerman.id.au,
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com,
	Conor Dooley <conor@kernel.org>, hch@lst.de
Subject: Re: [PATCH 1/1] riscv: set ARCH_DMA_DEFAULT_COHERENT if
 RISCV_DMA_NONCOHERENT is not set
Message-ID: <20231222041428.GA2803@lst.de>
References: <20231221185152.327231-1-fido_max@inbox.ru> <20231221-discount-decade-e306e5878c46@spud> <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f31d929c-fa0a-4046-be05-38e92afa5d92@flygoat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_201435_016976_08B72CC6 
X-CRM114-Status: GOOD (  14.18  )
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

T24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMTA6Mjc6MzNQTSArMDAwMCwgSmlheHVuIFlhbmcgd3Jv
dGU6Cj4KPgo+IOWcqCAyMDIzLzEyLzIxIDIwOjI5LCBDb25vciBEb29sZXkg5YaZ6YGTOgo+PiAr
IENocmlzdG9waAo+Pgo+PiBJIGRvbid0IHRoaW5rIHRoaXMgcGF0Y2ggaXMgY29ycmVjdC4gUmVn
YXJkbGVzcyBvZiB3aGV0aGVyIHdlIHN1cHBvcnQKPj4gY2FjaGUgbWFuYWdlbWVudCBvcGVyYXRp
b25zLCBETUEgaXMgYXNzdW1lZCB0byBiZSBjb2hlcmVudCB1bmxlc3MKPj4gcGVyaXBoZXJhbHMg
ZXRjIGFyZSBzcGVjaWZpZWQgdG8gb3RoZXJ3aXNlIGluIERUIChvciBob3dldmVyIEFDUEkgZGVh
bHMKPj4gd2l0aCB0aGF0IGtpbmQgb2YgdGhpbmcpLgo+Pgo+PiBXaGF0IHByb2JsZW0gYXJlIHlv
dSB0cnlpbmcgdG8gc29sdmUgaGVyZT8KPj4KPj4gT24gVGh1LCBEZWMgMjEsIDIwMjMgYXQgMDk6
NTE6NTJQTSArMDMwMCwgTWF4aW0gS29jaGV0a292IHdyb3RlOgo+Pj4gTm90IGFsbCB0aGUgUklT
Q1YgYXJlIERNQSBjb2hlcmVudCBieSBkZWZhdWx0Lgo+Cj4gU29ycnkgZm9yIGNoaW1lIGluIGhl
cmUuCj4gSU1PIGlmIHlvdXIgcGxhdGZvcm0gaXMgbm90IGNvaGVyZW50IGJ5IGRlZmF1bHQsIGp1
c3QgaW5zZXJ0IAo+ICJkbWEtbm9uY29oZXJlbnQiCj4gYXQgZGV2aWNldHJlZSByb290IG5vZGUu
CgpFeGFjdGx5LiAgQVJDSF9ETUFfREVGQVVMVF9DT0hFUkVOVGlzIGEgc2V0dGluZyB0aGF0IGp1
c3Qgc2F5cyBmb3IKYSBnaXZlbiBhcmNoaXRlY3R1cmUgYXNzdW1lcyBjb2hlcmVudCB1bmxlc3Mg
b3RoZXJ3aXNlIHNwZWNpZmllZCwKd2hpY2ggaGFzIGhpc3RvcmljYWxseSBiZWVuIHRoZSBjYXNl
IGZvciBtaXBzLiAgTm90IHNldHRpbmcgaXQgbWVhbnMKbm9uLWNvaGVyZW50IHVubGVzcyBzcGVj
aWZpZWQsIHdoaWNoIGhhcyBoaXN0b3JpYWxseSBiZWVuIHRoZSBjYXNlCmZvciBhcm0uCgpSSVND
LVYgc3RhcnRlIG91dCB3aXRob3V0IHN1cHBvcnQgZm9yIG5vbi1jb2hlcmVudCBETUEsIGFuZCBo
aWdoIHVwcwppbiBSSVNDViBzdGlsbCB0b2xkIG1lIGluIDIwMTkgdGhhdCBSSVNDLVYgZG9lc24n
dCBuZWVkIGNhY2hlCm1hbmFnZW1lbnQgaW5zdHJ1Y3Rpb25zIGJlY2F1c2Ugbm8gbmV3IGhhcmR3
YXJlIHdvdWxkIGV2ZXIgbm90IGJlCmRtYSBjb2hlcmVudC4gIFllYWgsIHJpZ2h0Li4KCkFueWF5
LCBMaW51eCBmb3IgUklTQy1WIGhhcyBoaXN0b3JpY2FsbHkgYmVlbiBjb2hlcmVudCBvbmx5IGFu
ZCB0aGVuCmNvaGVyZW50IGRlZmF1bHQsIHNvIHRoaXMgb3B0aW9uIGlzIHdyb25nLCBhbmQgeW91
IG5lZWQgdG8gbWFyawp5b3UgcGxhdGZvcm0gYXMgbm9uLWNvaGVyZW50IGJ5IGluc2VydGluZyBk
bWEtbm9uY29oZXJlbnQgc29tZXdoZXJlLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
