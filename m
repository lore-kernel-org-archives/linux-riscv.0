Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A1BE9B340
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 09:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+o4j9IUh97Mf2zlnBaMmY4SrsaEn+oYh/YFrcu+lSM4=; b=pIcdBE4z9V+fcY
	LknbzxVEGU4y3N79Ye1iT91/WbUNIkpY0rQtF+DvTJOmBcGDfM1Kk2ROkj4XDl9iqquqfOBjBee/g
	teBQuSx6SekXtV3XfadqxX2oKag3E1DMB0a9tmSQjuoCz76/UP8izYqd+Qhnr7DOb4wJDW37vgHSL
	KFAtUiy0OVSBGIjbxXGEvPe1BlXpplk5qPGH5NoeASNkG1Y/mfq9I5jhd+tr/Fe6QWpTun9ZSezJH
	svPt+/eL8ECdFuNBW8Aa8EI5CIKma8lb2Zp4cTK5VzGeMLuDBOFOoq+dk4Ys0WOYzyrNJmqm1Tin8
	IuDIeeEelqbfiMWEBBGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzsX-0000000CceW-38uF;
	Mon, 02 Mar 2026 09:47:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwzsV-0000000Cce8-0PYq
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 09:47:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 416F644496
	for <linux-riscv@lists.infradead.org>; Mon,  2 Mar 2026 09:47:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1FAC2BCB4
	for <linux-riscv@lists.infradead.org>; Mon,  2 Mar 2026 09:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772444870;
	bh=n0sVEjWNofsCxgzUtyk9/qTlFP36u11HIZHhHh3t5qE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=WegT/50nZAqeMKls134gY/2OPItDepfzI1tSNMvGQNX53pkd8SR5d8r4BUs8Mn2Q6
	 gZYnhiHDRHzWzOCgW49odepaGxm9gKPnpXLvzhpHzSx4JZazi9ZFHYwoCdvL5iVnTy
	 kDN4Q6SWHV9ZS3iRDwjkfvQ7Noam4Pc3OIFFn98aZzAl2fli6ChTYpU3J/G7lKOS5L
	 aPi4pupvmepegZoPbj+2pPXk6cd5UILo3Ox+eHRr+wH1Uxjk/wluY3MBK+Ieyqt0Ri
	 PqrY5/ST0hEV7TxGEUo+MqcOVeQ4YRAfzVm7+SA86qOCI5Mhp17nlOBaZlkcEJvGIu
	 fmgyOXZBcjaAw==
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79800183233so55551987b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 01:47:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWOeae+nIlg6oS/3WmRmW0y+J/sKezpWRIatFisWxIggVMfij6iNdSTP1gTQe9nB9jA/LMWjzQIhDTNrA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVPGg2KAAk1v2EeO8HO94D8Y9MgDy/wU+/Q5+gcPotM9HtNCvX
	qHB09e/eDFV3H6OUYJlumTbjnA4PvR/P/77aMxMoTGEbwoAMtQlaorKvUv3B/9pE8BnzLM/G3A7
	tBM3unNdH/tdCoSrRI1GJBATWyNgYknY=
X-Received: by 2002:a05:690c:3686:b0:797:d46b:e86e with SMTP id
 00721157ae682-79874be88demr138701707b3.14.1772444868769; Mon, 02 Mar 2026
 01:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20260227-ajar-wolverine-7ce1ebd79821@spud>
In-Reply-To: <20260227-ajar-wolverine-7ce1ebd79821@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 2 Mar 2026 10:47:38 +0100
X-Gmail-Original-Message-ID: <CAD++jLmo91CE8Yia69trrHz3g=PXPsSW32F7+GQ-0JvrpKSFHA@mail.gmail.com>
X-Gm-Features: AaiRm53MvmsLRrrHhVdWy25oztgLPBvp02xm93HhXnpSoyRADkEyceB1uibfank
Message-ID: <CAD++jLmo91CE8Yia69trrHz3g=PXPsSW32F7+GQ-0JvrpKSFHA@mail.gmail.com>
Subject: Re: [RFC v11 0/4] PolarFire SoC GPIO interrupt support
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Herve Codina <herve.codina@bootlin.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_014751_182910_D6B78AE8 
X-CRM114-Status: GOOD (  25.03  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEZlYiAyNywgMjAyNiBhdCAzOjUz4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKCj4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPgo+IEluIDIwMjQgSSBzZW50IGEgdjcgb2YgYWRkaW5nIHN1
cHBvcnQgZm9yIHRoZSBHUElPcyBvbiBQb2xhckZpcmUgU29DLAo+IHdoaWNoIHJlbGllZCBvbiBh
biBpcnFjaGlwIGRyaXZlciBmb3IgYSBtdXggc2l0dGluZyBiZXR3ZWVuIHRoZSBHUElPCj4gY29u
dHJvbGxlcnMgYW5kIHRoZSBtYWluIGludGVycnVwdCBjb250cm9sbGVyIG9uIHRoZSBjaGlwOgo+
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDcyMy1mbGF0d29ybS1jb3JuZmxha2Ut
ODAyMzIxMmY2NTg0QHdlbmR5Lwo+Cj4gU29tZSBmZWVkYmFjayBJIGdvdCBmcm9tIFRob21hcyB0
aGVyZSBlbmRlZCB1cCBiZWluZyBhIGNvbXBsZXRlIGJsYWNrCj4gaG9sZSBmb3IgdGltZSBzcGVu
dCwgYW5kIEkgbmV2ZXIgbWFuYWdlZCB0byBtYWtlIHRoZSBjaGFuZ2UgaGUgd2FudGVkLAo+IGFz
IGEgaG91c2Ugb2YgY2FyZHMgY29sbGFwc2VkIHdoZW5ldmVyIEkgdHJpZWQgaXQuIEkgZXZlbnR1
YWxseQo+IGFiYW5kb25lZCBteSBhdHRlbXB0IHRvIHVwc3RyZWFtIHRoZSBHUElPIGRyaXZlciB3
aXRoIGludGVycnVwdCBzdXBwb3J0Cj4gYW5kIGN1dCBpdCBvdXQgb2YgdGhlIGRyaXZlciB0byBt
YWtlIHByb2dyZXNzLiBJJ3ZlIGJlZW4gY2Fycnlpbmcgd2hhdAo+IFRob21hcyBkZWVtZWQgaW5j
b3JyZWN0IGRvd25zdHJlYW0gc2luY2UuCj4KPiBSZWNlbnRseSBIZXJ2w6kgdXBzdHJlYW1lZCBh
IHBhdGNoc2V0IGZvciBhIFJlbmVzYXMgY2hpcCB0aGF0IGRlYWxzIHdpdGgKPiBhIG11eCBzaXR0
aW5nIGJldHdlZW4gYSBHUElPIGNvbnRyb2xsZXIgYW5kIHRoZSBwbGF0Zm9ybSBpbnRlcnJ1cHQK
PiBjb250cm9sbGVyIGJ5IHdheSBvZiBpbnRlcnJ1cHQtbWFwLiBJIHNhdyB0aGUgb3Bwb3J0dW5p
dHkgdG8gY29weSB3aGF0Cj4gaGUgZGlkLCBzbyBoYXZlIGdvbmUgZnJvbSBhbiBpcnFjaGlwIGRy
aXZlciB0aGF0IHJlYWQgdGhlIG11eCBzZXR0aW5nCj4gdGhhdCBmaXJtd2FyZSBoYWQgY29uZmln
dXJlZCwgdG8gdHJpdmlhbCBkcml2ZXIgdGhhdCByZWFkcyB0aGUgbXV4Cj4gY29uZmlndXJhdGlv
biBmcm9tIGRldmljZXRyZWUgYW5kIHNldHMgdGhlIGhhcmR3YXJlIHVwIHRvIG1hdGNoLgo+Cj4g
VGhpcyBnZXRzIHJpZCBlbnRpcmVseSBvZiB0aGUgaXJxY2hpcCBkcml2ZXIsIHNvIHJlc29sdmVz
IFRob21hcycKPiBjb21wbGFpbnQsIGJ1dCBJIGRvbid0IGxvdmUgaG93IHRoZSBHUElPIHNpZGUg
b2YgdGhpbmdzIHR1cm5lZCBvdXQgcXVpdGUKPiBhcyBtdWNoLiBUaGUgaGFyZHdhcmUgaGFzIDQx
IGludGVycnVwdHMgYnV0IDcwIEdQSU8gbGluZXMuIDM4IG9mIHRoZXNlCj4gYXJlIDE6MSwgZGly
ZWN0IGNvbm5lY3Rpb25zIHRvIGEgZGVkaWNhdGVkIGxpbmUgb24gdGhlIGludGVycnVwdAo+IGNv
bnRyb2xsZXIgYW5kIDMgYXJlIHNoYXJlZC4KPiBXaXRoIHRoZSBwYXJlbnQgbXV4IGRyaXZlciwg
dGhlIEdQSU8gZHJpdmVyJ3MgaW50ZXJydXB0IGhhbmRsZXIgd2FzIG9ubHkKPiBjYWxsZWQgZWl0
aGVyIGZvciBzcGVjaWZpYyBkaXJlY3QgaW50ZXJydXB0IG9yIGZvciBvbmx5IHRoZSBzdWJzZXQg
dGhhdAo+IGFyZSBmZWQgaW50byB0aGUgc2hhcmVkIGludGVycnVwdCBmb3IgdGhhdCBjb250cm9s
bGVyLiBXaXRob3V0IHRoZQo+IHBhcmVudCBpcnFjaGlwIGZyb20gbXV4IGRyaXZlciwgYW5kIHVz
aW5nIGludGVycnVwdC1tYXAsIEkgbG9zdCB0aGUKPiBhYmlsaXR5IHRvIHVzZSBtdXggZHJpdmVy
IHRvIHNlbGVjdGl2ZWx5IGNhbGwgdGhlIGhhbmRsZXIsIHNvIG5vdyB0aGUKPiBHUElPIGNvbnRy
b2xsZXIgYXR0ZW1wdHMgdG8gaGFuZGxlIGludGVycnVwdHMgb24gYWxsIGxpbmVzLgo+IFByb2Jh
Ymx5IHRoaXMgaXMgdWx0aW1hdGVseSBub3QgYSBiaWcgZGVhbCwgaXQganVzdCBmZWVscyBiYWQg
dG8gZG8uCj4KPiBHb2luZyBSRkMgaGVyZSwgc2luY2UgaXQncyBhbiBlbnRpcmVseSBkaWZmZXJl
bnQgYXBwcm9hY2guIFRoZSB2ZXJzaW9uCj4gbnVtYmVyIGlzIGEgY29udGludWF0aW9uIGZyb20g
YmVmb3JlLCBzaW5jZSB0aGUgcGF0Y2hzZXQgbGlua2VkIGFib3ZlCj4gZ290IG1lcmdlZCBhdCB2
MTAgd2hlbiBJIHN0cmlwcGVkIHRoZSBpbnRlcnJ1cHQgc3VwcG9ydC4KPgo+IFRoZSBtdXggZHJp
dmVyIGhhcyBtb3ZlZCBmcm9tIGlycWNoaXAgdG8gc29jLCBzaW5jZSB0aGF0J3Mgd2hlcmUgSGVy
dsOpJ3MKPiBlbmRlZCB1cC4KClRoaXMgc3VyZWx5IGxvb2tzIGFjY2VwdGFibGUsIEkgaGFkIGFu
IGlucXVpcnkgYWJvdXQgdXNpbmcgcHJvcGVyCmNoYWluaW5nIGZvciB0aGUgSVJRcyBidXQgb3Ro
ZXIgdGhhbiB0aGF0IGl0IGxvb2tzIGZpbmUgdG8gbWUuCgpZb3VycywKTGludXMgV2FsbGVpagoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
