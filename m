Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A5F60A3822
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 12:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AusnyDpR;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z05EBtcw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uNouLSadjSWT5oATEMACgdfAh2+smgvgr5KygIZqo4Q=; b=AusnyDpRX88zRKFvIwyv5o8JR3
	dek2tR42TJ69BOyGYHMrsKQ+rhoknOltSs+CyXoW/5qAiSp2H1l20J5mdFoIRFzbKiMJhT1Kv4dmL
	sRyig12iHNqskjj5GwJr34UCQTMPYSZlwjEI3W+GiT5Vhw5MJxwb46IxRKeTAcoGb+FPY8zLm9P6l
	YOVEcmoSPMEbzLw+Cj5V/zkZ++wCEIl3cGE+1FH9uWCYpS3XBA44n9sajKejIMyaYi7Lbf8OD94uT
	6oVwNSitzZQ293cZCOcQII+/vG2XumH6zEj+5P1QYoEYJDVKUSo4T7KI8R47Doe67byciQ6ed8Vo9
	ZNS8aP/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJ6-00000002VEq-0AQY;
	Mon, 16 Nov 2026 12:59:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSwJ4-00000002VEh-2j5q
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 12:59:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C2B044003;
	Mon, 16 Nov 2026 12:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4FE31F000C4;
	Mon, 16 Nov 2026 12:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833974;
	bh=H0ZkNNcZYDe7VlHkuwH0d8aoRRKZdBPLeqP/TuARMR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z05EBtcwSpXoYHkEF5iaYXC/SUkFKTYxy8n50qUine3tJTmnGMUtZqx2CyqmYlD3g
	 KpvOznUOSxNVSxLdQjaxPSolgVv9alnguD2E2zeltouNszcEDJkO7o72flqbHAmtDs
	 CNXEg5ChRbfBWT2utgtNqzUe9qVyoBkJRQEbaxP+cY0cCI9NWWRR6Hq2gHNJF+UegZ
	 0u4jJaaHpQtvGjwvdq2Y6Zhy4Cs/Qt9nib63N4OM/9Iv/SBYjPqgtn5VThiuy1CKW4
	 xnXV9FC5mQNBs/4fJY7DS3INYfRN5G17PaWVCoR3cggAivxXLCN9osWWpwDgVUmMcD
	 LLp5oAL9B1SNQ==
Date: Mon, 16 Nov 2026 12:59:31 +0000
From: Yixun Lan <dlan@kernel.org>
To: Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree <devicetree@vger.kernel.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit <spacemit@lists.linux.dev>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 Enable SD card support
Message-ID: <20261116125931-GKC100890@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io>
 <20261109033348.361452-1-sandie.cao@deepcomputing.io>
 <20261114075506-GKB100523@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
 <20261116082350-GKB100890@kernel.org>
 <407ce3d77416bb2522b7906b0df3d5adf02c27ee.63da97eb.e7e5.488f.8751.a4a1c53db9df@feishu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.63da97eb.e7e5.488f.8751.a4a1c53db9df@feishu.cn>
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

SGkgU2FuZGllLAoKT24gMTc6NTIgTW9uIDE2IE5vdiAgICAgLCBTYW5kaWUgQ2FvIHdyb3RlOgo+
IEhpLCBZaXh1bjoKPiAKPiA+IEZyb206ICJZaXh1biBMYW4iPGRsYW5Aa2VybmVsLm9yZz4KPiA+
IERhdGU6wqAgTW9uLCBOb3YgMTYsIDIwMjYsIDE2OjI0Cj4gCj4gPiA+wqAKPiA+ID4gSW4gdmVy
c2lvbiAxIFsxXSzCoCB0aGUgcGF0Y2ggaXMgY2QtZ3Bpb3MgPSA8JmdwaW8gSzNfR1BJTyg4OCkg
R1BJT19BQ1RJVkVfTE9XPjsKPiA+ID4gYnV0IEszX0dQSU8oODgpIGlzIGZha2UgY2QtZ3Bpbywg
aXQncyB0aWVkIGxvdyBvbiBib2FyZC4KPiA+IFNvLCB0aGVyZSBpcyBncGlvIGNkIHBpbiwgYnV0
IGRpZG4ndCB3b3JrPyBpdCdzIGhhcmQgdG8gc2F5IHdpdGhvdXQKPiA+IHRoZSBzY2hlbWF0aWMs
IGJ1dCBjYW4geW91IGNoZWNrIHdpdGggaGFyZHdhcmUgcGVvcGxlLCBpZiBpdAo+ID4gY2FuIGJl
IGZpeGVkIHdpdGggU29DJ3MgaW50ZXJuYWwgR1BJTyBCSUFTIHB1bGx1cCBvciBwdWxsZG93bj8K
PiA+IFNvLCBncGlvIHBpbiBpcyBhYmxlIHRvIHJlZmxlY3QgY2FyZCBpbnNlcnQgc3RhdHVzCj4g
PsKgCj4gPsKgCj4gCj4gSSBkaWQgY2hlY2sgd2l0aCBvdXIgaGFyZHdhcmUgdGVhbSwgYW5kIHRo
ZSBhbnN3ZXIgaXM6wqAKPiB0aGVyZSBpcyBhIENEIG5ldCBvbiB0aGUgc2xvdCwgcm91dGVkIHRv
IEszX0dQSU8oODgpLCBidXQgaXQgaXMgaGFyZC10aWVkCj4gwqB0byBHTkQgb24gdGhlIGJvYXJk
LiAodjEgb2YgdGhpcyBzZXJpZXMgdXNlZMKgCj4gY2QtZ3Bpb3MgPSA8JmdwaW8gSzNfR1BJTyg4
OCkgR1BJT19BQ1RJVkVfTE9XPiwgd2hpY2ggb2YgY291cnNlCj4gYWx3YXlzIHJlcG9ydHMgImNh
cmQgcHJlc2VudCIuKSBJdCBpcyBhIGRpcmVjdCBjb25uZWN0aW9uIHRvIEdORCwgbm90IGEKPiBz
dHJhcCByZXNpc3Rvciwgc28gdGhlIFNvQydzIGludGVybmFsIGJpYXMgY2Fubm90IHB1bGwgaXQg
dXAuCj4gCk9rLCBzbyB0aGVyZSBpcyBDRCBwaW4sIGJ1dCB3aXRoIGhhcmR3YXJlIGRlc2lnbiBm
bGF3LCBpdCdzIGluZGVlZCBicm9rZW4sCnRoYXQncyAiYnJva2VuLWNkIiBwcm9wZXJ0eSBmb3IK
Cj4gPiA+IFNvIEluIHZlcnNpb24yIFsyXSwgdGhlIHBhdGNoIGNoYW5nZXMgdG8gbm9uLXJlbW92
YWJsZS4KPiA+ID4gQW5kIEluIHZlcnNpb24zIFszXSwgYWRkIGNvbW1lbnQuwqAKPiA+ID7CoAo+
ID4gPiBUaGUgb3B0aW9uczogY2QtZ3Bpbywgbm9uLXJlbW92YWJsZSwgYnJva2VuLWNkwqAgYWxs
IHdvcmsgb24gdGhpcyBib2FyZC4KPiA+ID7CoAo+ID4gaXQgd29ya3MsIGJ1dCBkb2VzIG5vdCBy
ZWZsZWN0IHRoZSBoYXJkd2FyZSBzdGF0dXMKPiA+wqAKPiA+ID4gV2UganVzdCBuZWVkIHRvIGRl
dGVjdCB0aGUgU0QgY2FyZCB3aGVuIGJvb3R1cCwgZG9uJ3QgbmVlZCB0aGUgZHJpdmVywqAKPiA+
ID4gdG8gZGV0ZWN0IGhvdC1wbHVnIGV2ZW50ICwgbm9uLXJlbW92YWJsZSBzaG91bGQgYmUgc3Vp
dGFibGUgYW5kIGZhc3RlcizCoAo+ID4gPiB3ZSByZWNvbW1lbnQgdG8gdXNlIG5vbi1yZW1vdmFi
bGUuCj4gPiA+wqAKPiA+IE5vLCB0aGlzIGlzbid0IGEgdmFsaWQgcmVhc29uLCBpdCdzIHVzZSBj
YXNlIHNob3VsZCBoYXZlIG5vdGhpbmcgdG8gZG8KPiA+IHdpdGggdGhlIHByb3BlcnR5Lgo+ID7C
oAo+ID4gTXkgcG9pbnQgaXM6IGlmIHRoZSBncGlvIGNkIHBpbiBzdGlsbCBkb2Vzbid0IHdvcmss
IGFuZCB0aGUgU0QgY2FyZCBpcwo+ID4gYWN0dWFsbHkgcGh5c2ljYWwgcGx1Z2FibGUsIHRoZW4g
c2hvdWxkIHVzZSAiYnJva2VuLWNkIi4KPiAKPiBUaGUgU0QgY2FyZCBzbG90IGlzIG9uYm9hcmQg
WzFdLMKgIHB1dCB0aGUgYm9hcmQgaW50byBjYXNpbmcsIHRoZXJlIGlzIG5vCj4gd2F5IHRvIHBs
dWdpbi8gcGx1Z291dCB0aGUgY2FyZC4gU28gdGhlcmUgaXMgbm8gY2FyZC1kZXRlY3QgZXZlbnQg
dGhhdCBjYW4KPiBldmVyIGhhcHBlbiBhdCBydW50aW1lLgo+IApObywgaWYgb3BlbiB0aGUgY2Fz
ZSwgdGhlIGNhcmQgaXMgc3RpbGwgcGx1Z2FibGUuLiAKCj4gSWYgeW91IHN0aWxsIHByZWZlciBi
cm9rZW4tY2QswqAgSSB3aWxsIGZvbGxvdyBpbiBuZXh0IHZlcnNpb24uwqAKPiAKWWVzLCBwbGVh
c2UgdXBkYXRlCgo+IFsxXTogaHR0cHM6Ly9kZWVwY29tcHV0aW5nLmlvL2RjLXJvbWEtcmlzYy12
LW1haW5ib2FyZC1paWktdW52ZWlsZWQtYXQtZm9zZGVtLXBvd2VyZWQtYnktc3BhY2VtaXQtazMt
Zm9yLWZyYW1ld29yay1sYXB0b3AtMTMvCj4gCj4gQmVzdCByZWdhcmRzCj4gU2FuZGllCgotLSAK
WWl4dW4gTGFuIChkbGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
