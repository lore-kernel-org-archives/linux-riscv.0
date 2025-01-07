Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F81BE77188
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bn+cPoMXgKXpJnR3e5vuumOnDbEli3c2mxM+Zt7z/fM=; b=k1AqxpVVXNbGq9
	YMz0NJtHnMl5kpnuHqjCRu9QC1SeEmsxMN2UilrQJVNy7v7yYNY4NNUCXj79z/nia+0ieAwSY11Hb
	u8QruOdP+zkRVK85IwCtX3RK7D7uHeMiSM06vyJADoPUW3XFJFgKgc5U8rJAyR6/Rc2eAZLNYKp3j
	8yCM3jTFa+03PL3x79Y0z4E00MAu8MayFAvFBC2b44YQnmhDyl8cRi1f3gfsGsyESdxgXMtBcGQHy
	6rdBIwSZvICXptzIDbHlQfHTyVw1LgA6tXuPN8ndyu5wJst5TnEb++4InNhLc5Eb5l8NGBvjFB/kg
	5uLLc68KtS8yhOxwB62w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzPf-00000003DW2-35km;
	Tue, 07 Jan 2025 02:33:47 +0000
Received: from angie.orcam.me.uk ([78.133.224.34])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUzPd-00000003DVc-1Lpu
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 02:33:46 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 1D40392009C; Tue,  7 Jan 2025 03:33:40 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 1757692009B;
	Tue,  7 Jan 2025 02:33:40 +0000 (GMT)
Date: Tue, 7 Jan 2025 02:33:40 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: =?UTF-8?Q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
cc: Alexandre Ghiti <alex@ghiti.fr>, Paul Walmsley <paul.walmsley@sifive.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, 
    "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
    open list <linux-kernel@vger.kernel.org>, 
    Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH] riscv: misaligned: disable pagefault before accessing
 user memory
In-Reply-To: <e155b489-e511-4a8a-948c-c6838fc7a679@rivosinc.com>
Message-ID: <alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk>
References: <20250103160214.657508-1-cleger@rivosinc.com> <e68e8c3a-2d22-4385-9de5-e167974604fd@ghiti.fr> <e155b489-e511-4a8a-948c-c6838fc7a679@rivosinc.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_183345_523923_CAE1FDC3 
X-CRM114-Status: GOOD (  15.40  )
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

T24gTW9uLCA2IEphbiAyMDI1LCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cgo+ID4gSSdtIHdvbmRl
cmluZyB3aHkgdGhlIGlycXMgYXJlIGRpc2FibGVkIGhlcmU/IFdoYXQgcHJldmVudHMgdXMgZnJv
bQo+ID4gZW5hYmxpbmcgdGhlbT8gSUlVQywgaWYgZm9yIHNvbWUgcmVhc29uIHRoZSB1c2VyIHBh
Z2UgaXMgbm90IGluIG1lbW9yeSwKPiA+IHdlIHdpbGwgZmFpbCB0aGUgbWlzYWxpZ25lZCBhY2Nl
c3MgYW5kIGtpbGwgdGhlIHByb2Nlc3MsIHNvIHN1Y2gKPiA+IGZhaWx1cmVzIGNvdWxkIGJlIGNv
bXBsZXRlbHkgcmFuZG9tIHJpZ2h0Pwo+IAo+IEhpIEFsZXgsCj4gCj4gVGhpcyBjb2RlIGlzIGNh
bGxlZCBmcm9tIGludGVycnVwdCBjb250ZXh0IGFzIGEgcmVzdWx0IGZyb20gYW4KPiBleGNlcHRp
b24uIEFGQUlLLCBpbnRlcnJ1cHRzIGFyZSBkaXNhYmxlZCBkdXJpbmcgdGhlIHdob2xlIGV4Y2Vw
dGlvbgo+IGhhbmRsaW5nIGFuZCByZS1lbmFibGVkIHdoZW4gcmV0dXJuaW5nIHRvIHVzZXIgbW9k
ZSBpbgo+IGRvX25vdGlmeV9yZXN1bWUoKS4gU28gdGhhdCdzIHdoeSBpdCB0cmlnZ2VycyB0aGlz
IHdhcm5pbmcuCgogVGhpcyBmZWVscyBvdXRyaWdodCB3cm9uZy4gIFdlIGhhdmUgYW5hbG9nb3Vz
IGVtdWxhdGlvbiBjb2RlIGluIEFscGhhIGFuZCAKTUlQUyBwb3J0cyBhbmQgd2Ugc3RheSBhd2F5
IGZyb20gcXVpY2sgc2FuZHMgYnkgZW5hYmxpbmcgaW50ZXJydXB0cyBpbiB0aGUgCnJlbGV2YW50
IGV4Y2VwdGlvbiBoYW5kbGVycyBhcyBzb29uIGFzIGl0IGlzIHNhZmUgdG8gZG8gc287IGluIHBh
cnRpY3VsYXIgCndoZW4gZW11bGF0aW5nIHVzZXItbW9kZSB1bmFsaWduZWQgYWNjZXNzZXMuICBX
aGF0IGNhdXNlcyB0aGUgUklTQy1WIHBvcnQgCnRvIGJlIGRpZmZlcmVudCBoZXJlPwoKIFNlZSBl
LmcuIHRoZSBNSVBTIGV4Y2VwdGlvbiBkaXNwYXRjaGVyIGluIGFyY2gvbWlwcy9rZXJuZWwvZ2Vu
ZXguUyB3aGVyZSAKQlVJTERfSEFORExFUiBpbnZvY2F0aW9ucyBleHBsaWNpdGx5IGVuYWJsZSBp
bnRlcnJ1cHRzIGZvciBtb3N0IG9mIHRoZSAKaGFuZGxlcnMgKHZpYSBgc3RpJyAtPiBgX19idWls
ZF9jbGVhcl9zdGknKS4gIFRoZW4gdW5hbGlnbmVkIGVtdWxhdGlvbiBpcyAKcnVuIHdpdGggdGhl
IGludGVycnVwdCBlbmFibGUgc2V0dGluZyBwcmVzZXJ2ZWQgZnJvbSB0aGUgY29udGV4dCB0aGUg
ZmF1bHQgCmhhcHBlbmVkIGluICh2aWEgYGFkZScgLT4gYF9fYnVpbGRfY2xlYXJfYWRlJyksIGNs
ZWFybHkgYmVjYXVzZSBpdCBjYW4gaW4gCnByaW5jaXBsZSB0cmlnZ2VyIGZyb20ga2VybmVsIGNv
ZGUgcnVuIHdpdGggaW50ZXJydXB0cyBkaXNhYmxlZC4gIEJ1dCBzdWNoIApjb2RlIGlzIG5vdCBz
dXBwb3NlZCB0byBhY2Nlc3MgdXNlciBtZW1vcnkgaW4gdGhlIGZpcnN0IHBsYWNlIGFuZCB0cmFw
cyAKZnJvbSB0aGUgdXNlciBtb2RlIHdpbGwgaGF2ZSBoYWQgaW50ZXJydXB0cyBlbmFibGVkLgoK
IEkgdGhpbmsgdGhlIFJJU0MtViBwb3J0IGhhcyB0byBkbyB0aGUgc2FtZSwgaS5lLiBydW4gdGhl
IGhhbmRsZXIgd2l0aCB0aGUgCnN1cGVydmlzb3IgaW50ZXJydXB0IGVuYWJsZSBiaXQgc2V0IGFj
Y29yZGluZyB0byB3aGV0aGVyIGludGVycnVwdHMgd2VyZSAKZW5hYmxlZCBvciBub3QgZm9yIHRo
ZSBtb2RlIHRoZSBmYXVsdCBoYXMgdHJpZ2dlcmVkIGluLgoKICBNYWNpZWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
