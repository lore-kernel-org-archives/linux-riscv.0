Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD18AD46BFA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqKnHnmzhTeZSAQSIdLFStGireGRxQ9lGhsEwFdu9qw=; b=WCnfHfxC86A8Cu
	/f45TWJtInin88HJLckbgTcEH121g9XWQiQHxMzBkNl07UTUVYyOAtaGpSOmD7a4FKpPuyfQT8uam
	kmLwn63n22XKAiQMQBA9pJAr7eSS77Y3NcBoFx17N+b7iI1nmy9FGxaZgVU+MzidvyCtgDSA0/Chu
	OM7lpsp9liITNmxjd+YQUQZj9eT21ilcybAeihg8SyJsvrH32FlQNPqiCLsZUYB/pVSycm0VzYHmo
	af2hvgrIVyn4uDfCO942vpadmqHh11wCCboIDe6YXgT4ibwusmtA4T7fidzC9Rni3qYxwDi9BbuyG
	W4a2aQ3h+Qvmdfzvdu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCOf-0000000GnQl-3Asl;
	Wed, 28 Jan 2026 20:44:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCOe-0000000GnQJ-0E7y
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7AC5C6001A;
	Wed, 28 Jan 2026 20:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5DDC4CEF1;
	Wed, 28 Jan 2026 20:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769633055;
	bh=PUO+i4tIhAekqR+Uw8PMdo+dTmbcqsGSIhNXAiYpKjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkqWBrgaRSfuHs8ivn8q4kTJKrQLnguldnD19wl29yGjKwQwK16VOdY69XZmtepQy
	 f6MTbt3MGqTWHnUtx+zbAOZgDtDJIfK74e1QGoc44M4sEGdE89P6Ok4TpXwdI39r1B
	 vTNV6SZ5cHidFnuzPlU98NTpPfuvylR2EqTXng9zjK3TA5QnK5YilVmbog2iIuGp7r
	 jqs1oYcdiZQIQKTYihGasQBvCrsqdjLqbQDlrqBn274xoKCc9Y/YcFE0CNoSpPpitQ
	 yBlBJLRPrRwAW+T2WcasSPoV0E1fjLx/L5iSCUiAaALO5IMPklCufSDInkRDbmssYG
	 gis+p6i9FY5tg==
Date: Wed, 28 Jan 2026 12:44:13 -0800
From: Drew Fustini <fustini@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH RFC v2 14/17] include: acpi: actbl2: Add structs for RQSC
 table
Message-ID: <aXp1HexsqZst1xXu@x1>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
 <20260128-ssqosid-cbqri-v2-14-dca586b091b9@kernel.org>
 <CAJZ5v0iSZ6qvhUWHtrWuO5XBviMcLUMfRB_hWn-FxAhe=LoA-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJZ5v0iSZ6qvhUWHtrWuO5XBviMcLUMfRB_hWn-FxAhe=LoA-Q@mail.gmail.com>
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Peter Newman <peternewman@google.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMjgsIDIwMjYgYXQgMDk6MzE6MTZQTSArMDEwMCwgUmFmYWVsIEouIFd5c29j
a2kgd3JvdGU6Cj4gT24gV2VkLCBKYW4gMjgsIDIwMjYgYXQgOToyOOKAr1BNIERyZXcgRnVzdGlu
aSA8ZnVzdGluaUBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBBZGQgc3RydWN0cyBmb3IgdGhl
IFJRU0MgdGFibGUgd2hpY2ggZGVzY3JpYmVzIHRoZSBwcm9wZXJ0aWVzIG9mIHRoZQo+ID4gUklT
Qy1WIFFvUyBjb250cm9sbGVycyAoQ0JRUkkpIGluIHRoZSBzeXN0ZW0uIFRoZSB0YWJsZSBhbHNv
IGRlc2NyaWJlcwo+ID4gdGhlIHRvcG9sb2dpY2FsIGFycmFuZ2VtZW50IG9mIHRoZSBRb1MgY29u
dHJvbGxlcnMgYW5kIHJlc291cmNlcyBpbiB0aGUKPiA+IHN5c3RlbS4gVGhlIHRvcG9sb2d5IGlz
IGV4cHJlc3NlZCBpbiB0ZXJtcyBvZiB0aGUgbG9jYXRpb24gb2YgdGhlCj4gPiByZXNvdXJjZXMg
d2l0aGluIHRoZSBzeXN0ZW0gYW5kIHRoZSByZWxhdGlvbiBiZXR3ZWVuIHRoZSBRb1MgQ29udHJv
bGxlcgo+ID4gYW5kIHRoZSByZXNvdXJjZSBpdCBtYW5hZ2VzLgo+ID4KPiA+IExpbms6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LWNicXJpL3JlbGVhc2VzL3RhZy92MS4w
Cj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1ycXNjL2Js
b2IvbWFpbi9zcmMvY2hhcHRlcjIuYWRvYwo+ID4gU2lnbmVkLW9mZi1ieTogRHJldyBGdXN0aW5p
IDxmdXN0aW5pQGtlcm5lbC5vcmc+Cj4gCj4gT2YgY291cnNlLCB0aGlzIGNoYW5nZSBuZWVkcyB0
byBnbyB0aHJvdWdoIHVwc3RyZWFtIEFDUElDQS4KClRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgdGhp
cyBvdXQuIEkndmUgbm90IHdvcmtlZCB3aXRoIEFDUEkgcHJpb3IgdG8KZGVhbGluZyB3aXRoIHRo
ZSBSUVNDIHRhYmxlLgoKSXMgdGhlIHB1bGwgcmVxdWVzdCBmb3IgUklTQy1WIFJJTVQgYSBnb29k
IGV4YW1wbGUgb2YgaG93IHRvIGRvIHRoYXQ/Cmh0dHBzOi8vZ2l0aHViLmNvbS9hY3BpY2EvYWNw
aWNhL3B1bGwvMTAwMwoKVGhhbmtzLApEcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
