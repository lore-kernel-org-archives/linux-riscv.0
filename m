Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B24C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JiTLXj8phZMI9ai4p8FI6/XmJisGzkhcDOE8GqKtq7w=; b=xAniavHlXl6FpG
	5RTpsdDMs10GxADLUqes/2cvEEJB9Tk0QW8vtYuIrPLfpMf2/3C533HZ68089aWmZ2p/9z/lGJY0s
	colzvLZnGPxirQgfxEcZxogUO3CNONzYw9Ic/YFlP7BCZPPdBcxxfp/d1NPF9lEgMuEJgA00cHgG8
	UeNuY5wKpPLEhIQn1obIUVWjm6XmmCmv2qAU/C7d/CevU8DMSOroZ1BP1FfGVxL8Z0wtumrSi5Cp7
	PSr8S7YX3c0fGbCfvFVDldfsE/2ETvUpMAVhESi0FID3NS/e4nJZtjlQCdhlSasGByPBUW87YZ81f
	OVXERMpBeK2MtlqyQUcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8GG-0000000HQpf-3P7v;
	Fri, 29 Mar 2024 09:10:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8GE-0000000HQoh-3Lmx
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 09:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5D67618CC;
	Fri, 29 Mar 2024 09:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C95C433F1;
	Fri, 29 Mar 2024 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711703453;
	bh=vY/FJp6qrT1tKYNcxeFTW8hugbxrKmwQdnT/CQhbR5Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eaY/ZtZHjovhpyorRysQzrSvwlw75euFhSBKmnQXN4v3DgdaYp9046mnYet+XRpW3
	 UUrxLttZ7gI1jUpxEbQQjFNAiRz6I9nWbPkcba4rCc7sZG5DrddxBrsqU5WkVHSoOF
	 nSACZAw+mLwl4P4zWoBvKykmU8ETj3EN/OamHwKM8/rmKw6gs3rAIdkvqAk9isEVr+
	 1rzLlkIN3JNVSuxTuNBiyA6701F/jmtzQkGj8RkHqbbZY1jcZxV9i0erMg+H5FZ2jk
	 gsu+08acrGMvte6ez3tsgZ6iH7cUMCz1cB/n86GRorzHlrV+l13H1HrjsYEC8GHTAx
	 KLmHKeBN7f5oA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>, Alexandre Ghiti
 <alexghiti@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Emil Renner Berthing <kernel@esmil.dk>, Samuel
 Holland <samuel.holland@sifive.com>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>,
 linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>, Jakub
 Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: RISC-V for-next/fixes (cont'd from PW sync)
In-Reply-To: <20240329-fanning-woven-7dbb6cfdde9b@wendy>
References: <87ttkro3b5.fsf@all.your.base.are.belong.to.us>
 <20240327-irrigate-unread-d9de28174437@spud>
 <CAHVXubgMTe83sYaNO+SG=90=k5scaQrpApveTCO163MhUc1tdA@mail.gmail.com>
 <20240329-fanning-woven-7dbb6cfdde9b@wendy>
Date: Fri, 29 Mar 2024 10:10:49 +0100
Message-ID: <87sf09pfmu.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_021054_939623_7643B684 
X-CRM114-Status: GOOD (  17.53  )
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

Q29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JpdGVzOgoKPiBPbiBG
cmksIE1hciAyOSwgMjAyNCBhdCAwNzo0NjozOEFNICswMTAwLCBBbGV4YW5kcmUgR2hpdGkgd3Jv
dGU6Cj4+IE9uIFdlZCwgTWFyIDI3LCAyMDI0IGF0IDk6MzLigK9QTSBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+Cj4+ID4gT24gV2VkLCBNYXIgMjcsIDIwMjQgYXQg
MDg6NTc6NTBQTSArMDEwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gPiA+IEhpLAo+PiA+ID4K
Pj4gPiA+IEkgZmlndXJlZCBJJ2QgcHV0IHNvbWUgd29yZHMgb24gdGhlICJob3cgdG8gdXBkYXRl
IHRoZSBSSVNDLVYKPj4gPiA+IGZvci1uZXh0L2ZpeGVzIGJyYW5jaGVzIFsxXSIgdGhhdCBjYW1l
IHVwIG9uIHRoZSBwYXRjaHdvcmsgY2FsbCB0b2RheS4KPj4gPiA+Cj4+ID4gPiBJbiBSSVNDLVYg
bGFuZCwgdGhlIGZvci1uZXh0IGJyYW5jaCBpcyB1c2VkIGZvciBmZWF0dXJlcywgYW5kIHR5cGlj
YWxseQo+PiA+ID4gc2VudCBhcyBhIGNvdXBsZSBvZiBQUnMgdG8gTGludXMgd2hlbiB0aGUgbWVy
Z2Ugd2luZG93IGlzIG9wZW4uIFRoZQo+PiA+ID4gZml4ZXMgYnJhbmNoIGlzIHNlbnQgYXMgUFIo
cykgYmV0d2VlbiB0aGUgUkNzIG9mIGEgcmVsZWFzZS4KPj4gPiA+Cj4+ID4gPiBUb2RheSwgdGhl
IGJhc2VsaW5lIGZvciBmb3ItbmV4dC9maXhlcyBpcyB0aGUgQ1VSUkVOVF9SRUxFQVNFLXJjMSwg
YW5kCj4+ID4gPiBmZWF0dXJlcy9maXhlcyBhcmUgYmFzZWQgb24gdGhhdC4KPj4gPiA+Cj4+ID4g
PiBUaGlzIGhhcyBJTU8gYSBjb3VwbGUgb2YgaXNzdWVzOgo+PiA+ID4KPj4gPiA+IDEuIGZpeGVz
IGlzIG1pc3NpbmcgdGhlIG5vbi1SSVNDLVYgZml4ZXMgZnJvbSByZWxlYXNlcyBsYXRlciB0aGFu
Cj4+ID4gPiAgICAtcmMxLCB3aGljaCBtYWtlcyBpdCBoYXJkZXIgZm9yIGNvbnRyaWJ1dG9ycy4K
Pj4gCj4+IFRoZSBzeXpib3QgcmVwb3J0IFsxXSByZXF1aXJlcyBmaXhlcyBpbiBtbSBbMl0sIGlm
IHdlIGRvbid0IHVwZGF0ZQo+PiBmaXhlcyBvbiB0b3Agb2YgdGhlIGxhdGVzdCAtcmNYLCB3ZSds
bCBrZWVwIGhpdHRpbmcgdGhpcyBidWcsIHNvCj4+IHJlYmFzaW5nIC1maXhlcyBvbiB0b3Agb2Yg
dGhlIGxhdGVzdCAtcmNYIGlzIG5lY2Vzc2FyeSB0byBtZS4KPgo+IE5vIG5vbi1mZiByZWJhc2lu
ZyBvZiBicmFuY2hlcyB1bmxlc3MgaXRzIDEwMSUgcmVxdWlyZWQsIHBsZWFzZS4gVGhpcwo+IHNl
ZW1zIGxpa2UgYSBqdXN0aWZpYWJsZSByZWFzb24gdG8gbWVyZ2UgdGhlIHJjIGl0IGFwcGVhcnMg
aW4gaW50byB0aGUKPiByaXNjdiBicmFuY2hlcyB0aG91Z2guCgpBcmUgeW91IHRhbGtpbmcgcGFz
dCBlYWNoIG90aGVyPyBJJ20gKm5vdCogc2F5aW5nIHJlYmFzZSAoYWdyZWUgd2l0aApDb25vciEp
LiBJJ20gc2F5aW5nICJsZXQncyBtb3ZlIGZpeGVzIHVwIHRvIHRoZSBwb2ludCB0byBpbmNsdWRl
IHRoZQptZXJnZSAoYW5kIHdoYXRldmVyIG9uIExpbnVzJyB0aXAgYXQgdGhlIHBvaW50IG9mIG1l
cmdlKSwgaS5lLgoqZmYtb25seSouCgpOb3csIHJlc3QgeW91ciBleWVzIG9uIHRoaXMgZmFidWxv
dXMgY2FydG9vbjoKCiAgTGludXMnIG1hc3RlcgogIHwKICB2CiAgbyBvIDwtLSBSSVNDLVYgZml4
ZXMKICB8IHwKICAuIC4KICAuIC4KICAKICBMaW51cyBhY2NlcHRzIHRoZSBQUi4uLgogIAogIG8g
PC0tIE1lcmdlIHRhZyAncmlzY3YtZm9yLWxpbnVzLW1laC1yYzcnLi4uCiAgfFwKICBvIG8gPC0t
IFJJU0MtViBmaXhlcwogIHwgfAogIC4gLgogIC4gLgogIAogIGFuZCB0aGVuIG1vdmUgZml4ZXMs
IGdpdCBtZXJnZSAtLWZmLW9ubHk6CiAgCiAgbyA8LS0gTWVyZ2UgdGFnICdyaXNjdi1mb3ItbGlu
dXMtbWVoLXJjNycuLi4sIFJJU0MtViBmaXhlcwogIHxcCiAgbyBvIAogIHwgfAogIC4gLgogIC4g
LgoKQ2xlYXJlcj8KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
