Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA82C001DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 08:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=henEQpERJglXw6+RIyhVDjp6/iT8aKZDGY6rwLgjIPY=; b=TF2BZpI7EN08LH
	SKH+zwyqBF0r2wE2Sh1XfWgatT/E1FLXN8gunAAovUaeW/5MlKs7O/dKw/jK12lwrnE3hoW0dJ090
	kNbyYiF6vFfj5BsYuTIDyVBLoXmveLm2TOla0dpQ0zXksS13IxPGZmNXZWLscsNd6Ozk5V2j8zRUH
	i26JvAVAqaAt+anixbqXCKgDZEPLQBxCnNkfcVKad6I+msjOdwwyl4zYbnXbsDbbERWvv/OpdxrNP
	+CsxZmGu+LMV0ZWZWBeAcWw8XszbDa/ICtdDG7tXrX46568x3gTs3WP4XclF1e3U06Kt8QrSbW/w/
	Vl2//shIHMk/IE9fZOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODNz-006jk3-0X;
	Tue, 25 Jul 2023 08:27:15 +0000
Received: from rivendell.linuxfromscratch.org ([208.118.68.85])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qODNv-006jjc-1t
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 08:27:13 +0000
Received: from [192.168.124.11] (unknown [61.150.43.67])
	by rivendell.linuxfromscratch.org (Postfix) with ESMTPSA id DBBB51C1D53;
	Tue, 25 Jul 2023 08:27:01 +0000 (GMT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.0 at rivendell.linuxfromscratch.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfromscratch.org;
	s=cert4; t=1690273627;
	bh=3wKBJknl28jX8dkxKDD1cetC+NZBYD4bobGI4n3fNXs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Fg6Xmz4+D2Zi8+clxXo/HI51CxqO06TGtb2ZIPbxibycD0flc8IQZS67Yc+nSqgtX
	 1wNDG0aqtVN9jHLa10Kj2PhFNeGzakE37RqNc/ahsQ0w/t8iGqswSJ5rZW5SHLnmkT
	 aHcOEL0wUfzd/XWSk4w+brCivAnAnq6OQIkMtCMdiaTRzRMsIlpslWehQwkHh9Td+w
	 u1l/TqJhp2WuoMWxP2lZpBR6glzOeGra28S7/v6kGSnTVABx4++7apy8jNkWm8FSiM
	 HpJAGaWPVaLMSrW+fEPe/mVJci1qPCNXbNNR3t920RGqRHOw3AfmkDGIRlu3XgF3dV
	 b6iSvKWNit8ag==
Message-ID: <6361277fb2784ef7eef88e19be23ad022f77e483.camel@linuxfromscratch.org>
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
From: Xi Ruoyao <xry111@linuxfromscratch.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner
 <tglx@linutronix.de>,  Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,  Daniel
 Lezcano <daniel.lezcano@linaro.org>, Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>,  linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-riscv@lists.infradead.org
Date: Tue, 25 Jul 2023 16:26:54 +0800
In-Reply-To: <20230725-unheard-dingy-42f0fafe7216@wendy>
References: <20230617161529.2092-1-jszhang@kernel.org>
	 <c9a44f534071a6d67f1e21bafdb713793c559124.camel@linuxfromscratch.org>
	 <20230725-unheard-dingy-42f0fafe7216@wendy>
User-Agent: Evolution 3.48.4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_012711_849280_9D35FB79 
X-CRM114-Status: GOOD (  12.37  )
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

T24gVHVlLCAyMDIzLTA3LTI1IGF0IDA4OjUyICswMTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4g
QXJlIHlvdSB1c2luZyB0aGUgdmVuZG9yIE9wZW5TQkk/IElJUkMsIGFuZCB0aGUgbGFkcyBjYW4g
cHJvYmFibHkKPiBjb3JyZWN0IG1lIGhlcmUsIHlvdSBuZWVkIHRvIGhhdmUgYW4gT3BlblNCSSB0
aGF0IGNvbnRhaW5zCj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVu
c2JpL2NvbW1pdC83OGMyYjE5MjE4YmQ2MjY1M2I5ZmIzMTYyM2E0MmNlZDQ1ZjM4ZWE2Cj4gd2hp
Y2ggdGhlIHZlbmRvciBzdXBwbGllZCBPcGVuU0JJIGRvZXMgbm90IGhhdmUuCgpJJ2xsIHRyeSBP
cGVuU0JJIGZyb20gdGhlIHVwc3RyZWFtLgoKPiA+IEFuZCB0aGlzIGxpbmUKPiA+IAo+ID4gTWVt
b3J5OiA4MTQ1MzA0Sy84Mzg4NjA4SyBhdmFpbGFibGUgKDQ5MjJLIGtlcm5lbCBjb2RlLCA0Nzg2
SyByd2RhdGEsIDIwNDhLIHJvZGF0YSwgMjE0OEsgaW5pdCwgMzkzSyBic3MsIDI0MzMwNEsgcmVz
ZXJ2ZWQsIDBLIGNtYS1yZXNlcnZlZCkKPiA+IAo+ID4gZG9lcyBub3QgbWF0Y2ggbXkgaGFyZHdh
cmUgKG15IGJvYXJkIGlzIGEgMTYgR0IgRFJBTSB2YXJpYW50KS7CoCBTbyBpbgo+ID4gdGhlIGZ1
dHVyZSB3ZSdsbCBuZWVkIG11bHRpcGxlIERUcyBmb3IgYWxsIHRoZSB2YXJpYW50cz8KPiAKPiBB
IGJvb3Rsb2FkZXIgc3RhZ2Ugd291bGQgaWRlYWxseSBwYXRjaCB0aGUgRFQgdGhhdCB0aGUga2Vy
bmVsIGVuZHMgdXAKPiBnZXR0aW5nLiBJZiB5b3UncmUgbG9hZGluZyB5b3VyIG93biBkdGIsIHlv
dSBjYW4gZG8gaXQgZWFzaWx5IGluIFUtQm9vdAo+IGFmdGVyIHlvdSBleHRyYWN0IGl0IGZyb20g
eW91ciBGSVQgaW1hZ2Ugb3Igd2hhdGV2ZXIuIEkgaGF2ZSBubyBpZGVhCj4gd2hhdCB0aGUgdmVu
ZG9yIFUtQm9vdCBkb2VzLgoKVGhlIHZlbmRvciBzaGlwcyB0aHJlZSBEVHMgYW5kIGluIHVib290
IHRoZXJlIGFyZSBzb21lIGZhbmN5IGxvZ2ljIHRvCmRldGVjdCB3aGljaCBzaG91bGQgYmUgdXNl
ZC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
