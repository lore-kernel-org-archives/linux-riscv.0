Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EA2AE65298
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 01:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IO7KbjFEw/8K1yp5TwZ+EmGmIxmQ/ps/381yO/GQyDQ=; b=dNLPhSrhAZPMqq
	FHu5MsIO2VJ2KiTNNjzL8SvU57qgmdBbiJK+TU21TWVTMNIjSr8Xh97lDhu8dML276faXp9I3FJs7
	hcnJ6CB4DQFEvMwzuC4Y5HqT0Hj3kdbo1dTsE1XojgDcDBdSs9/5JHKc2UAkVOtpG++YLhverrfGU
	GQKC8wQQXaFMpVKB9GppWOUD4U33/bDWwh8/3BU9g4fOXCi9IrgmtQu2ZMlh7ExqwHZ8u/ytUzmc8
	9N1xi3zy1uZ5kjOhqlhgx3Lkkkp6Fi23jUkawAEhd43XSKZ8ZHLy0CbiAxSau9OmB2rr6b4NzPcQZ
	mqiusDI7NtSh4qGgRpAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmipH-00000004IrI-3lLf;
	Mon, 02 Feb 2026 01:34:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmipG-00000004Ir3-3eb9
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Feb 2026 01:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sfOtsTEwzQyZo7aWxIzzb0f0umFbLM5XMTv7y63rVss=; b=Ebt1qpjIW3BbJuw2aoyBTgJpNY
	RUAYFRP2yFlKErAAN/J1/xphXs9TmhmkrhvxdVslDLO7YJGqb7zr//ohbCKjH3QEH5wzYofUmXd8y
	seNBpbI05DjzPqq3c7Q6w68dBnLo6qyxEPwM4anVjVC452DbIAzkypsE07bo5f0QGhdXLVLLc8jKB
	+E0nkcER/kSlQBMYNj7MFn13C2WSfcNBu5Yg2gLoM3p+MbAtVkh+YsXm9GZjMPCL4BNmSbGHCk/t0
	bNxVrzwM578B5bRusor1VyuH6mZCEqLY6uoN/Q1tmNV0ceRBy9PG13Xkzcnrd8qOLyOxXLLLLuOt/
	UyxfGnVA==;
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmipB-0000000DnNr-41Ty
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 01:34:00 +0000
X-UUID: 6ea9a1faffd611f0b0f03b4cfa9209d1-20260202
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:ca328545-2630-42e0-a62c-96e9863b6705,IP:0,UR
	L:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:2
X-CID-META: VersionHash:a9d874c,CLOUDID:5b59c78184618424a391219ec9acb505,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:4|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6ea9a1faffd611f0b0f03b4cfa9209d1-20260202
X-User: jiangfeng@kylinos.cn
Received: from [10.42.12.56] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <jiangfeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 419090633; Mon, 02 Feb 2026 09:28:09 +0800
Message-ID: <47264a53-aa5c-4814-ba3c-270e544cab88@kylinos.cn>
Date: Mon, 2 Feb 2026 09:28:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] riscv: optimize string functions and add kunit
 tests
To: Andy Shevchenko <andriy.shevchenko@intel.com>, Kees Cook <kees@kernel.org>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 akpm@linux-foundation.org, andy@kernel.org, ebiggers@kernel.org,
 martin.petersen@oracle.com, herbert@gondor.apana.org.au,
 samuel.holland@sifive.com, ajones@ventanamicro.com,
 conor.dooley@microchip.com, charlie@rivosinc.com, nathan@kernel.org,
 linusw@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20260130025018.172925-1-jiangfeng@kylinos.cn>
 <202601300936.6EDA32E96@keescook> <aX3Q3O8qEasNeso8@smile.fi.intel.com>
Content-Language: en-US
From: Feng Jiang <jiangfeng@kylinos.cn>
In-Reply-To: <aX3Q3O8qEasNeso8@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_013358_685871_7D902FFC 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

T24gMjAyNi8xLzMxIDE3OjUyLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4gT24gRnJpLCBKYW4g
MzAsIDIwMjYgYXQgMDk6Mzc6MzZBTSAtMDgwMCwgS2VlcyBDb29rIHdyb3RlOgo+PiBPbiBGcmks
IEphbiAzMCwgMjAyNiBhdCAxMDo1MDoxMEFNICswODAwLCBGZW5nIEppYW5nIHdyb3RlOgo+Pj4g
VGhpcyBzZXJpZXMgcHJvdmlkZXMgb3B0aW1pemVkIGltcGxlbWVudGF0aW9ucyBvZiBzdHJubGVu
KCksIHN0cmNocigpLAo+Pj4gYW5kIHN0cnJjaHIoKSBmb3IgdGhlIFJJU0MtViBhcmNoaXRlY3R1
cmUuIFRoZSBzdHJubGVuKCkgaW1wbGVtZW50YXRpb24KPj4+IGlzIGRlcml2ZWQgZnJvbSB0aGUg
ZXhpc3Rpbmcgb3B0aW1pemVkIHN0cmxlbigpLiBGb3Igc3RyY2hyKCkgYW5kCj4+PiBzdHJyY2hy
KCksIHRoZSBjdXJyZW50IHZlcnNpb25zIHVzZSBzaW1wbGUgYnl0ZS1ieS1ieXRlIGFzc2VtYmx5
IGxvZ2ljLAo+Pj4gd2hpY2ggd2lsbCBzZXJ2ZSBhcyBhIGJhc2VsaW5lIGZvciBmdXR1cmUgWmJi
LWJhc2VkIG9wdGltaXphdGlvbnMuCj4+Cj4+IEknbSBoYXBweSB3aXRoIHRoZSBLdW5pdCBlbGVt
ZW50cyBoZXJlLCBzbyB1bmxlc3MgQW5keSBoYXMgb3RoZXIKPj4gZmVlZGJhY2ssIHBsZWFzZSBm
ZWVsIGZyZWUgdG8gdGFrZSB0aGlzIHZpYSB0aGUgcmlzY3YgdHJlZS4gKE9yIGlmIHJpc2N2Cj4+
IG1haW50YWluZXJzIHdvdWxkIHByZWZlciwgSSBjYW4gdGFrZSBpdCB2aWEgc3RyaW5nLikKPiAK
PiBJIGhhdmUgYW4gaW1wcmVzc2lvbiB0aGF0IEkgYWxyZWFkeSBnYXZlIHNvbWUgdGFnLiBXaHkg
YXJlbid0IG5vdCBoZXJlPwo+IAoKSSBhcG9sb2dpemUgZm9yIHRoZSBjb25mdXNpb24uCgpJbiB2
NiwgZm9sbG93aW5nIEtlZXMgQ29vaydzIHN1Z2dlc3Rpb24sIEkgaW50cm9kdWNlZCBhIHNpZ25p
ZmljYW50IGNoYW5nZSB0bwp0aGUgY29ycmVjdG5lc3MgdGVzdCBsb2dpY+KAlHVzaW5nIHZtYWxs
b2MoKSBhbmQgcGFnZS1ib3VuZGFyeSBhbGlnbm1lbnQgdG8KZGV0ZWN0IG92ZXItcmVhZHMuIFNp
bmNlIHRoaXMgcGFydCBvZiB0aGUgY29kZSB3YXMgc3Vic3RhbnRpYWxseSByZXdyaXR0ZW4sCkkg
ZmVsdCBpdCB3YXMgbW9yZSByZXNwb25zaWJsZSB0byBkcm9wIHRoZSBwcmV2aW91cyBBY2tlZC1i
eSBhbmQgVGVzdGVkLWJ5CnRhZ3MgZm9yIHRoZSBhZmZlY3RlZCBwYXRjaGVzLgoKSSB3b3VsZCBi
ZSB2ZXJ5IGdyYXRlZnVsIGlmIHlvdSBjb3VsZCB0YWtlIGEgcXVpY2sgbG9vayBhdCB0aGUgbmV3
IHRlc3QKaW1wbGVtZW50YXRpb24gaW4gdjcuIElmIHlvdSBhcmUgc2F0aXNmaWVkIHdpdGggdGhl
IGNoYW5nZXMsIEkgd291bGQgYmUKaG9ub3JlZCB0byBhZGQgeW91ciB0YWdzIGJhY2suCgotLSAK
V2l0aCBCZXN0IFJlZ2FyZHMsCkZlbmcgSmlhbmcKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
