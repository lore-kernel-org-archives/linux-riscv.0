Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2832C54E65
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vnno/xPwQBkcQQCVjA1MvMEyCiTOUqYOD/jdxbOqjhw=; b=uhRsHNA6sUemvo
	aDaUEPnkVs7B/Yi13U7PR0N9hu63xePNuINZ1kHOCKLJrJcaTDwQY3tllIIEIzqGrnEdWBBnPFgRJ
	JTLjfTamowHqi9/VnRXRFIGYdLXmD0VqsHmrNFLoXp8eN5KrWrQBu6uyDggI1oNY0CMGbMYNjXTtx
	SGWhrqOVibUtJChWjf21pAAXAkpC2Qsk2VLh5IufkMTZI3H1SOPC+kP+DWKqn5iNRg60OUDr2bx7O
	7JwkNCX0EDzGEH8itd76vHWeGIRTClyi/DLN73ph5S90vlgAQoctrQPHZdx4uN4UHQ0VG45SW31B1
	vzAuTXE8Islv9BXIjuJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEGz-00000002HSx-2SdA;
	Thu, 22 May 2025 22:20:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIEGx-00000002HSM-0Yff
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 22:20:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BF5D3A4EEED;
	Thu, 22 May 2025 22:20:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A9FC4CEEB;
	Thu, 22 May 2025 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747952417;
	bh=4pfRJM2Cisntvrl6mJz5uuoZDwcCDlg6+v8ugcnqxGI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Fa3BkRUFRaTtdoDEV9Xs9IPvAmWFjVUL5FtIUaPn+bliOUXD9oQLod1HnKRcu8apm
	 3YFSvgwVCRFJ4GLk64kcTRxbZ1l6gUsPTFgFEB9B2kfhWX55/b8gsxSIfQa5pEgM5s
	 j/LxjbC8u5UiQ3R8ZJFC0AG4kIVyBJk+Ukr78HKCYATbdnr2ucDf9VupiGRvYG66Kr
	 z8LBb7jEil7YfjRdgKPhCd4NdUln8NO8yKhIGjIR6aWDOuKnh8P1ux33ly7LsLDDbL
	 jElAj6V3UePMzCWn1/xHoWVM8MXaVdfCQEmXLIK+oQnFsgsQbNxoOSzhWYm1oJQNEb
	 kup+EVqujhKpg==
Message-ID: <98b0268e7d3ac759402ebbe0f3c51f42@kernel.org>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB226259FA30EF915465BE2759FE88A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
References: <MA0P287MB226259FA30EF915465BE2759FE88A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Subject: Re: [GIT PULL] RISC-V Sophgo clock drivers for v6.16
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, sophgo@lists.linux.dev, Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>
To: Chen Wang <unicorn_wang@outlook.com>, linux-clk@vger.kernel.org
Date: Thu, 22 May 2025 15:20:15 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_152019_237547_47FF825B 
X-CRM114-Status: UNSURE (   8.59  )
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

UXVvdGluZyBDaGVuIFdhbmcgKDIwMjUtMDUtMDYgMTg6NDI6NDYpCj4gSGV5LCBTdGVwaGVuLAo+
IAo+IFBsZWFzZSBwdWxsIGNsb2NrIGNoYW5nZXMgZm9yIFJJU0MtVi9Tb3BoZ28uCj4gCj4gSSBz
ZW5kIHRoaXMgUFIganVzdCB3YW50IHRvIGV4cGVkaXRlIHBhdGNoZXMgZm9yIHRoZXNlIGNsb2Nr
IGRyaXZlcnMuIAo+IFRoZSBwYXRjaGVzIGhhdmUgZ29uZSB0aHJvdWdoIHNldmVyYWwgcm91bmRz
IG9mIHJldmlldy4KPiAKPiBDVjE4MDAgc2VyaWVzOiBbYy12MV0gW2MtdjJdCj4gCj4gTGluazog
Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2xrLzIwMjUwNDMwMDIwOTMyLjMwNzE5
OC0xLWlub2NoaWFtYUBnbWFpbC5jb20vIAo+IFtjLXYxXQo+IAo+IExpbms6IAo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDI1MDUwNDEwNDU1My4xNDQ3ODE5LTEtaW5vY2hp
YW1hQGdtYWlsLmNvbS8gCj4gW2MtdjJdCj4gCj4gU0cyMDQ0IHBhcnQ6IFtzLXYxXSwgW3MtdjJd
LCBbcy12M10gW3MtdjRdIFtzLXY1XQo+IAo+IExpbms6IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2xpbnV4LWNsay8yMDI0MTIwOTA4MjEzMi43NTI3NzUtMS1pbm9jaGlhbWFAZ21haWwuY29t
LyAKPiBbcy12MV0KPiAKPiBMaW5rOiAKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1j
bGsvMjAyNTAyMDQwODQ0MzkuMTYwMjQ0MC0xLWlub2NoaWFtYUBnbWFpbC5jb20vIAo+IFtzLXYy
XQo+IAo+IExpbms6IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDI1MDIy
NjIzMjMyMC45Mzc5MS0xLWlub2NoaWFtYUBnbWFpbC5jb20vIAo+IFtzLXYzXQo+IAo+IExpbms6
IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDI1MDQxMzIyNDQ1MC42NzI0
NC0xLWlub2NoaWFtYUBnbWFpbC5jb20vIAo+IFtzLXY0XQo+IAo+IExpbms6IAo+IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2xpbnV4LWNsay8yMDI1MDQxODAyMDMyNS40MjEyNTctMS1pbm9jaGlh
bWFAZ21haWwuY29tLyAKPiBbcy12NV0KPiAKPiBUaGFua3MsCj4gCj4gQ2hlbgo+IAo+IFRoZSBm
b2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgMGFmMmY2YmUxYjQyODEzODViNjE4Y2I4NmFk
OTQ2ZWRlZDA4OWFjODoKPiAKPiAgwqAgTGludXggNi4xNS1yYzEgKDIwMjUtMDQtMDYgMTM6MTE6
MzMgLTA3MDApCj4gCj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkgYXQ6Cj4g
Cj4gIMKgIGh0dHBzOi8vZ2l0aHViLmNvbS9zb3BoZ28vbGludXguZ2l0IHRhZ3MvcmlzY3Ytc29w
aGdvLWNsay1mb3ItdjYuMTYKPiAKPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gNDFi
MDg2MTBkZDI2MmRjNGE1ZTFlZmY5OTNiMmQyMWVhYjhiOGJhMzoKPiAKPiAgwqAgY2xrOiBzb3Bo
Z286IEFkZCBjbG9jayBjb250cm9sbGVyIHN1cHBvcnQgZm9yIFNHMjA0NCBTb0MgKDIwMjUtMDUt
MDcgCj4gMDg6MDA6MDkgKzA4MDApCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQoKVGhhbmtzLiBQdWxsZWQgaW50byBj
bGstbmV4dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
