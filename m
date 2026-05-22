Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9677DCD5BAF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zgja7fOHNm1d8TlO41b68/LW0IC6niJjLneEYaRcvtQ=; b=X8xXXQtkqF/aAC
	+VXWUEBaj5S/BLjLH4rdmodcsFj6o7q9v7D0HWPdJNPtT0mGiAK/MF1CY5hBpH1M6HiJv35Vk+5jS
	8OBEmVzkuXSQBnNKmKi5XdMg1AamW7P/pz4q6lcyXKkPEOsx5Mlhto8j8HpBCEzN2lwbEM6MStW8K
	ldE2iPrwRXOEQBPK/twjGnS7OQyUXL55c7bw40uRIvFWXUrOBGqOprU83xYufDMRTkdojk3zvG3EY
	biSM3HYgTdT6X8iBfSTUDes4YiVTWyhFMVMHRDv9rRvQ479ltvnRBZsu+6PVgLrKoPzsijvIrS1SS
	TA+Tts6ug06yJXORd2YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDa3-00000009Ny9-1BcN;
	Fri, 22 May 2026 00:17:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDa2-00000009Nxq-01eY;
	Fri, 22 May 2026 00:17:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A502F60122;
	Fri, 22 May 2026 00:17:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB491F000E9;
	Fri, 22 May 2026 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1779409052;
	bh=CU1uL6EPLGCDhveEV6q88XhXLU9G2F321bQb4+LouN4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=tEOlAwj1g8LscGq036JIP92ztTOZa0Zgac7ekTv/50pIaaEK2W4Kh2iSs9mjKKeU3
	 0E+2P+EF9NE/33lqS+qb4XkzDA6GlEgAvB+jA6sk+cyej3pym+Q94Vs41XiDgm/F+z
	 FHXvYWEtcRfRDonE2oSvzPrH33/ywop/mXaGAjBA=
Date: Thu, 21 May 2026 17:17:30 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
Cc: Christoph Hellwig <hch@lst.de>, "H. Peter Anvin" <hpa@zytor.com>,
 kreijack@inwind.it, David Sterba <dsterba@suse.cz>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel
 <ardb@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Dan Williams
 <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>, David Sterba
 <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>, Song Liu
 <song@kernel.org>, Yu Kuai
 <yukuai@alb-78bjiv52429oh8qptp.cn-shenzhen.alb.aliyuncs.com>, Li Nan
 <linan122@huawei.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-raid@vger.kernel.org
Subject: Re: [PATCH 01/19] btrfs: require at least 4 devices for RAID 6
Message-Id: <20260521171730.7872482df453975cf60ce7dc@linux-foundation.org>
In-Reply-To: <f46636c8-80ba-4802-a6a0-74cbc35e7bee@gmx.com>
References: <20260512052230.2947683-1-hch@lst.de>
	<20260512052230.2947683-2-hch@lst.de>
	<20260512114231.GG2558453@suse.cz>
	<20260513054742.GA1018@lst.de>
	<0a8d1ff4-f5a2-49e9-aa45-d25dbe4ded40@libero.it>
	<20260515043705.GA3855@lst.de>
	<34C16854-1065-4542-8836-DDED58EC1844@zytor.com>
	<20260518051207.GB9374@lst.de>
	<f46636c8-80ba-4802-a6a0-74cbc35e7bee@gmx.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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

T24gV2VkLCAyMCBNYXkgMjAyNiAxODoxMTowOSArMDkzMCBRdSBXZW5ydW8gPHF1d2VucnVvLmJ0
cmZzQGdteC5jb20+IHdyb3RlOgoKPiAKPiAKPiDlnKggMjAyNi81LzE4IDE0OjQyLCBDaHJpc3Rv
cGggSGVsbHdpZyDlhpnpgZM6Cj4gPiBPbiBGcmksIE1heSAxNSwgMjAyNiBhdCAxMjo1OTozNFBN
IC0wNzAwLCBILiBQZXRlciBBbnZpbiB3cm90ZToKPiA+PiBJIGRvbid0IHRoaW5rIHRoaXMgaXMg
YSBnb29kIGlkZWEuIEVycm9yIG91dDsgaXQgaXMgdGhlIGJ0cmZzIG1haW50YWluZXJzJyBqb2Ig
dG8gZW5zdXJlIHVzZXIgZGF0YSBpc24ndCBsb3N0Lgo+ID4+Cj4gPj4gVGhlIFJBSUQtNiBjb2Rl
IGhhcyAqbmV2ZXIqIHN1cHBvcnRlZCBvbmx5IDMgdW5pdHMsIGFuZCBpZiBpdCBldmVyIHdvcmtl
ZCBmb3IgKmFueSogb2YgdGhlIGltcGxlbWVudGF0aW9ucyBpdCB3YXMgcHVyZWx5IGJ5IGFjY2lk
ZW50LiBTcGVha2luZyBhcyB0aGUgb3JpZ2luYWwgYXV0aG9yIEkgc2hvdWxkIGtub3c7IHRoaXMg
d2FzIGRlbGliZXJhdGUgYXMgaW4gc29tZSBjYXNlcyB0aGUgZGVnZW5lcmF0ZSBjYXNlICgzKSB3
b3VsZCBoYXZlIHJlcXVpcmVkIGV4dHJhIHRyYXlzIGluIHRoZSBjb2RlIHRvIG5vIHVzZXIgYmVu
ZWZpdC4KPiA+Pgo+ID4+IEkgd291bGQgbm90IGJlIHN1cnByaXNlZCBpZiB0aGUga2VybmVsIGNy
YXNoZWQgb3IgY29ycnVwdGVkIHRoZSBwYWdlIGNhY2hlIGluIHRoYXQgY2FzZS4KPiA+IAo+ID4g
SXQgZG9lcywgdGhhdCdzIHdoeSBJIHdhbnRlZCB0byBleGNsdWRlIGl0LiAgQW55d2F5LCBmb3Ig
dGhlIGFib3V0IHRvIGJlCj4gPiByZXNlbnQgdmVyc2lvbiBJJ2xsIGRyb3AgdGhpcyBidHJmcyBw
YXRjaCBvdmVyIHRoZSBzdGF0ZWQgb2JqZWN0aW9uIGFuZAo+ID4gd2lsbCBvdGhlcndpc2Ugbm90
IGNoYW5nZSBhbnl0aGluZy4gIFRoaXMgbWVhbnMgdGhlIChJTUhPIGh5cG90aGV0aWNhbCkKPiA+
IHVzZXJzIG9mIHRoaXMgY29uZmlndXJhdGlvbiB3aWxsIGdldCBhIFdBUk5fT05fT05DRSB0cmln
Z2VyZWQsIGJ1dAo+ID4gb3RoZXJ3aXNlIGtlZXAgd29ya2luZyAob3IgcmF0aGVyIG5vdCB3b3Jr
aW5nKSBhcyBiZWZvcmUuCj4gPiAKPiAKPiBGb3IgdGhlIGJ0cmZzIHBhcnQsIEkgYmVsaWV2ZSBJ
IGNhbiBnZXQgdGhlIGN1cnJlbnQgMi1kaXNrLXJhaWQ1IGFuZCAKPiAzLWRpc2stcmFpZDYgdG8g
ZmFsbGJhY2sgdG8gcmFpZDEgaW5zaWRlIGJ0cmZzLgo+IAo+IEkgaG9wZSB0aGUgYnRyZnMgcGFy
dCBjYW4gYmUgZmluaXNoZWQgYW5kIHJlYWNoIHRoZSBuZXh0IG1lcmdlIHdpbmRvdywgCj4gYnV0
IEknbSBub3QgMTAwJSBzdXJlLgo+IAo+IFdoYXQgaXMgdGhlIHBsYW5uZWQgY3ljbGUgdG8gbWVy
Z2UgdGhpcyByYWlkNS82IGNsZWFudXA/CgpBdCBwcmVzZW50IGl0J3Mgb24gdHJhY2sgZm9yIHRo
ZSA3LjItcmMxIG1lcmdlIHdpbmRvdy4gIERvZXMgdGhhdCBzdWl0PwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
