Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AC0606A338
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 16:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YGY/gsP/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=X6cEgtil
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wAws3jDDEvl/39Wi808m+3erCIMTW8yxT2iwLyked68=; b=YGY/gsP/4wJD/37T4UAxkvu4PZ
	bjT6Sxmfjk2P3ODWvOrP4cePQhK+PKxvIRQJO8g7BTCEh/qQUpLnSVLj+gGdfFOevW9pd+BevP8kd
	MG2VpGGsIdhxhZTnKFmD8+Qk1h4qFLfvfXwJFSKv9Oi1pO6fCsl8B/urz+OBfS2Om2VQ1rsa5fRrc
	tCcwTaYR1Rgzvj3Qpxbu8odJYVFfGXOd7Aw5p55G08k+TUznSfusXberd5K1yocm+ylyzro3jNWO+
	DLwHoIYnNpxN2kZP1a/sPbTtC3fk/WWTRrX8gbi82pEPCgi1uQH41HO+zWGC3QueO+y7qDsmfW/0F
	PTwOJDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiDV-00000009Pk0-1iYZ;
	Wed, 18 Nov 2026 16:09:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiDS-00000009Pj6-0qbs;
	Wed, 18 Nov 2026 16:08:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 14695C79A9F;
	Wed, 18 Nov 2026 16:08:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 299BD5FE9B;
	Wed, 18 Nov 2026 16:08:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD37011BC244F;
	Wed, 18 Nov 2026 17:08:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795018130; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NyruYRmBJ333KKsYOsJfBubBYnjFdFekZpcsS68Afoo=;
	b=X6cEgtil8ijijO0rJLXA2fM6mfOKCqDSKEpQnIZl8O7QDvCmAFq44iTLtGiRg59T6tim+9
	BkfAmw+/K2LmZlkCdVN2sYKaDDdw/b0/mTAmoK6EDNyam9WvPm2KyqSsK6FFH80ZrBBRbl
	fOuG3P4fgquqDyFTbuhX5QPxzAzzTotAL3yURPLSCZ75iuwuF5fR7obk1dgbOVKjz5XyHU
	usLAW0L1/qdVNqF382CZu2aco6xcOyG4qofdf/C4tljy9+Ib67sXLpy0J5bWTKyaLMICZ9
	hf3TVLYsrb2HPg/gXOz12/t9aAj1TndcLvng+XJYM9BoHm2TlIq0tO3MLsgbzA==
From: =?UTF-8?B?QmVub8OudA==?= Monin <benoit.monin@bootlin.com>
To: Conor Dooley <conor@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jun Chang <jun.chang@metanoia-comm.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sebastian Reichel <sre@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ben Zong-You Xie <ben717@andestech.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, CL Wang <cl634@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Adrian Hunter <adrian.hunter@intel.com>,
 Minas Harutyunyan <hminas@synopsys.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Randolph Sheng-Kai =?UTF-8?B?TGluKOael+iBluWHsSk=?= <randolph@andestech.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-phy@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-mmc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/25] riscv: add support for the Metanoia MT2824 SoC and MT5824
 EVB
Date: Wed, 18 Nov 2026 17:08:33 +0100
Message-ID: <tSRWYJl8QRO6qpOrYOmeTA@bootlin.com>
In-Reply-To: <20261117-calamity-quiver-96d0d568b338@spud>
References: <20261106-mt2824-v1-0-86087eaf5af4@bootlin.com>
 <_koitdIgQPmk89LDhlUlJQ@bootlin.com>
 <20261117-calamity-quiver-96d0d568b338@spud>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_080858_573323_9001D999 
X-CRM114-Status: GOOD (  26.43  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlc2RheSwgMTcgTm92ZW1iZXIgMjAyNiBhdCAxODozMDo1OCBDRVQsIENvbm9yIERvb2xl
eSB3cm90ZToKPiBPbiBUdWUsIE5vdiAxNywgMjAyNiBhdCAxMTo0MTo1MkFNICswMTAwLCBCZW5v
w650IE1vbmluIHdyb3RlOgo+ID4gT24gRnJpZGF5LCA2IE5vdmVtYmVyIDIwMjYgYXQgMTI6MTU6
MDkgQ0VULCBNYXJrIEJyb3duIHdyb3RlOgo+ID4gPiBPbiBGcmksIE5vdiAwNiwgMjAyNiBhdCAx
MDoyOTo1N0FNICswMTAwLCBCZW5vw650IE1vbmluIHdyb3RlOgo+ID4gPiAKPiA+ID4gPiBUaGUg
c2VyaWVzIGlzIG9yZ2FuaXNlZCBhczoKPiA+ID4gCj4gPiA+ID4gLSBwYXRjaGVzIDEtMTQgYWRk
IHRoZSBkZXZpY2UgdHJlZSBiaW5kaW5ncywgdGhlIE1ldGFub2lhIHZlbmRvciBwcmVmaXgsCj4g
PiA+ID4gICB0aGUgUklTQy1WIGJvYXJkIHNjaGVtYSBhbmQgdGhlIFNvQyBibG9jayBjb21wYXRp
Ymxlcwo+ID4gPiA+IC0gcGF0Y2ggMTUgYWRkcyBBUkNIX01FVEFOT0lBIGFuZCBzZWxlY3RzIHRo
ZSBBWDQ1TVAgZXJyYXRhCj4gPiA+ID4gLSBwYXRjaGVzIDE2LTIzIGFkZCB0aGUgcmVzZXQsIFNQ
SSwgd2F0Y2hkb2csIE1NQywgUEhZIGFuZCBVU0IgY2hhbmdlcwo+ID4gPiA+ICAgbmVlZGVkIHRv
IGJ1aWxkIGFuZCBwcm9iZSBvbiB0aGlzIFNvQwo+ID4gPiA+IC0gcGF0Y2ggMjQgYWRkcyB0aGUg
TVQyODI0IFNvQyBhbmQgTVQ1ODI0IEVWQiBkZXZpY2UgdHJlZXMKPiA+ID4gPiAtIHBhdGNoIDI1
IGFkZHMgdGhlIE1BSU5UQUlORVJTIGVudHJ5Cj4gPiA+IAo+ID4gPiBUaGlzIHNvcnQgb2YgdGhp
bmcgdGVuZHMgdG8gd29yayBiZXR0ZXIgaWYgeW91IHN1Ym1pdCB0aGUgcGF0Y2hlcyBmb3IKPiA+
ID4gc3Vic3lzdGVtcyBhcyBzZXBhcmF0ZSBzZXJpZXNlcywgaXQgYXZvaWRzIGVub3Jtb3VzIEND
IGxpc3RzIGFuZCBrZWVwcwo+ID4gPiB0aGUgaW5kaXZpZHVhbCBzZXJpZXNlcyBhIG1hbmFnYWJs
ZSBzaXplLgo+ID4gPiAKPiA+IEkgYWdyZWUsIGFuZCBJIGFtIHJld29ya2luZyB0aGUgc2VyaWVz
IHRoYXQgd2F5LiBWZXJzaW9uIDEgd2FzIGludGVuZGVkCj4gPiBhcyBhbiBvdmVydmlldyBvZiB0
aGUgY29tcGxldGUgU29DIHN1cHBvcnQsIGJ1dCBpdCBlbmRlZCB1cCBiZWluZyB0b28KPiA+IGJp
ZyBmb3IgYSBzaW5nbGUgc2VyaWVzLgo+ID4gCj4gPiBTbyB2ZXJzaW9uIDIgb2YgdGhpcyBjdXJy
ZW50IHNlcmllcyB3aWxsIGJlIG9ubHkgdGhlIHBsYXRmb3JtIGJhc2ljcwo+ID4gKDIgcGF0Y2hl
cyk6Cj4gPiAKPiA+ICAgLSBkdC1iaW5kaW5nczogdmVuZG9yLXByZWZpeGVzOiBhZGQgTWV0YW5v
aWEgQ29tbXVuaWNhdGlvbnMKPiAKPiA+ICAgLSByaXNjdjogYWRkIEFSQ0hfTUVUQU5PSUEgS2Nv
bmZpZyBlbnRyeQo+IAo+IFJlYWxpc3RpY2FsbHksIHRoaXMgZG9lcyBub3QgbmVlZCB0byBiZSBh
IHByZXJlcSBlaXRoZXIsIGJlY2F1c2UgeW91J2xsCj4gaGF2ZSAiZGVwZW5kcyBvbiBBUkNIX01F
VEFOSU9BIHx8IENPTVBJTEVfVEVTVCIuCj4gClRydWUgYnV0IGNoZWNra2NvbmZpZ3N5bWJvbHMu
cHkgd2lsbCB0aGVuIGNvbXBsYWluIGFib3V0IGEgcmVmZXJlbmNlZCBidXQKdW5kZWZpbmVkIEtj
b25maWcgc3ltYm9sIGluIHRoZSBmb2xsb3dpbmcgc2VyaWVzLgoKPiA+IAo+ID4gSXQgd2lsbCBh
Y3QgYXMgYSBwcmVyZXF1aXNpdGUgZm9yIHRoZSBmb2xsb3dpbmcgbmV3IHNlcmllcywgb25lIHBl
cgo+ID4gc3Vic3lzdGVtOgo+ID4gCj4gPiAgIC0gcmVzZXQ6IGJpbmRpbmcgKyByZXNldC1zaW1w
bGUgc3VwcG9ydCAodGhlIHNlcGFyYXRlIHJlYm9vdCBiaW5kaW5nCj4gPiAgICAgaXMgZHJvcHBl
ZDsgdGhlIFJTVCBibG9jayBpcyBkZXNjcmliZWQgYXMgYSBzaW5nbGUgbm9kZSkKPiA+ICAgLSBT
UEk6IG9wdGlvbmFsIERNQS9JUlEgYmluZGluZywgTVQyODI0IGNvbXBhdGlibGUsIGF0Y3NwaTIw
MCBJUlEKPiA+ICAgICBzdXBwb3J0ICsgS2NvbmZpZwo+ID4gICAtIHdhdGNoZG9nOiBjb21wYXRp
YmxlICsgS2NvbmZpZwo+ID4gICAtIE1NQzogY29tcGF0aWJsZSArIE1UMjgyNCBzdXBwb3J0IChz
cGxpdCBiZXR3ZWVuIFNELCBlTU1DIGFuZAo+ID4gICAgIGF1dG8tZGV0ZWN0aW9uKSArIHR1bmlu
Zy9IUzQwMAo+ID4gICAtIFBIWTogVVNCMiBQSFkgYmluZGluZyArIGRyaXZlci9LY29uZmlnCj4g
PiAgIC0gVVNCIERXQzI6IGJpbmRpbmcgKyBwYXJhbXMKPiA+IAo+ID4gRmluYWxseSwgb25jZSB0
aGUgc3Vic3lzdGVtIGJpbmRpbmdzIGFyZSBhY2NlcHRlZCBhbmQgdGhlIGRyaXZlcnMKPiA+IGFy
ZSBxdWV1ZWQsIEknbGwgcG9zdCB0aGUgU29DIERUUyBpbiBpdHMgb3duIHNlcmllczogYm9hcmQg
c2NoZW1hICsKPiA+IGNhY2hlL1BMSUMvUExJQ1NXL1BMTVQgY29tcGF0aWJsZXMgKyB0aGUgTVQy
ODI0L01UNTgyNCBEVFMgYW5kIHRoZQo+ID4gTUFJTlRBSU5FUlMgZW50cnkKPiA+IAo+ID4gVGhh
bmtzIGV2ZXJ5b25lIGZvciB0aGUgcmV2aWV3cywgSSB3aWxsIGludGVncmF0ZSB0aGUgZmVlZGJh
Y2sgaW4gdGhlCj4gPiBuZXh0IGl0ZXJhdGlvbnMgb2YgZWFjaCBzZXJpZXMuCj4gPiAKPiA+IEJl
c3QgcmVnYXJkcywKPiA+IEJlbm/DrnQKPiA+IAo+ID4gCj4gPiAKPiAKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
