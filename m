Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A495CCD184
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTW600LGwMp992PiRHGAB/HrEWwEMJcc4lblm1ghmDo=; b=oGPh0geGpD6J0v
	N0RYdzcShOSAhgwF5z8vD5I/7tJg6s8AItORqIZd8RKFTdj2GcxTB2X5JYuTS/GJCb3z50l2KX535
	+fk9k5Y4ZYgx1KELeWOkNjxRAVW6DEue6THbli4bu74JI3L7rF6MbpaK6DU9lPp+o5mUkFFIBVSXm
	9amAyQf6TeWubdZWD/A5D191BbrKkcL1Hsa7IJtGOJ5iJIjeUR2ScZqI12uylC97rfBJxpVmrBCzB
	VW/FA8Lc1f6WqaGUaP53I/tN7FwmdvV/fy+C9KqBv+64pEDOVOQ0rvaW+bhZ6YOTKWcHyxQX3/UX6
	WdIbE567EJv4zLEOe/9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7eRa-0000000AULb-3dSx;
	Sat, 11 Oct 2025 18:35:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7eRa-0000000AULJ-13Cd;
	Sat, 11 Oct 2025 18:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 92F54603C4;
	Sat, 11 Oct 2025 18:35:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2710C4CEF4;
	Sat, 11 Oct 2025 18:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760207749;
	bh=JeuSNzjb79cav9xRsG19ffG5ht+YAnWGI0rfqrrmt6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BkeP6di5m0EgJnl2GOAGJ5PUXel0ftXpzo47oa7h0EvDeMh9jw7oyZMPFAjin3TYz
	 qWsvH1GcS4RmDiKvBwU8vwce608CNe/q+9v1NoTqiPk7VhAitsfRX9SXuqH8DEdZxd
	 iPRdimfzkusnwIDOvr8oc1Q7aLgx/jbZ/oEUXRAaL38tI6rVKQMuBqAF/KI0RHw/wA
	 TuTZ9TofIjxUHltuAn2YdLSSP9CNhYXDIr82hec85R4rEfW/GYNxacpCGUctemaFfo
	 13y14rfKeOagDpBT1nrfGj4JQ5U/GHpR7YUX3p5rrxVh7xhkLZs58BXrrOwPwa9q8S
	 TnT2rzPjlzt4A==
Date: Sat, 11 Oct 2025 11:35:46 -0700
From: Drew Fustini <fustini@kernel.org>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kornel =?utf-8?Q?Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	James Morse <james.morse@arm.com>,
	Atish Kumar Patra <atishp@rivosinc.com>,
	Atish Patra <atish.patra@linux.dev>,
	Vasudevan Srinivasan <vasu@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, guo.wenjia23@zte.com.cn,
	liu.qingtao2@zte.com.cn, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v4 3/3] RISC-V: Add support for srmcfg CSR from Ssqosid
 ext
Message-ID: <aOqjggmTr4ioHwB/@x1>
References: <20251007-ssqosid-v4-0-e8b57e59d812@kernel.org>
 <20251007-ssqosid-v4-3-e8b57e59d812@kernel.org>
 <DDDL94HT7HYF.3VU2WQYU4WZY5@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DDDL94HT7HYF.3VU2WQYU4WZY5@ventanamicro.com>
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

T24gVGh1LCBPY3QgMDksIDIwMjUgYXQgMDg6NDc6MjdBTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+IDIwMjUtMTAtMDdUMjM6MjE6MTItMDc6MDAsIERyZXcgRnVzdGluaSA8ZnVzdGlu
aUBrZXJuZWwub3JnPjoKPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Fv
cy5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9xb3MuaAo+ID4gK3N0YXRpYyBpbmxpbmUgdm9p
ZCBfX3N3aXRjaF90b19zcm1jZmcoc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0KQo+ID4gK3sKPiA+
ICsJdTMyICpjcHVfc3JtY2ZnX3B0ciA9IHRoaXNfY3B1X3B0cigmY3B1X3NybWNmZyk7Cj4gPiAr
CXUzMiB0aHJlYWRfc3JtY2ZnOwo+ID4gKwo+ID4gKwl0aHJlYWRfc3JtY2ZnID0gUkVBRF9PTkNF
KG5leHQtPnRocmVhZC5zcm1jZmcpOwo+ID4gKwo+ID4gKwlpZiAodGhyZWFkX3NybWNmZyAhPSAq
Y3B1X3NybWNmZ19wdHIpIHsKPiAKPiBXb3VsZG4ndCBwcmV2LT50aHJlYWQuc3JtY2ZnIGhhdmUg
dGhlIHZhbHVlIG9mIENTUl9TUk1DRkcgd2hlbiBleGVjdXRpbmcKPiBzd2l0Y2hfdG8/CgpUaGFu
a3MgZm9yIHJldmlld2luZy4gWWVzLCB5b3UgYXJlIHJpZ2h0IHRoYXQgcHJldi0+dGhyZWFkLnNy
bWNmZyBzaG91bGQKaGF2ZSBzYW1lIHZhbHVlIGFzIENTUl9TUk1DRkcuIEFyZSB5b3Ugc3VnZ2Vz
dGluZyB0aGF0IHRoZSBjcHVfc3JtY2ZnIGlzCm5vdCBuZWNlc3NhcnkgYXMgcHJldi0+dGhyZWFk
LnNybWNmZyBzaG91bGQgaGF2ZSBzYW1lIHZhbHVlPwoKRHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
