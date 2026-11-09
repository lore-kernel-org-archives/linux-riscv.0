Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DB6606A323
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2026 05:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mV1ROCtZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=QT4OrRgU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V8k2SfBO8j5DB1VZ0BWfvpi0pg10tk4b8ZKTnATyjHk=; b=mV1ROCtZsqwMp39vqZNMkAhk5F
	+Dwc6oki8EMA4PhxsV/IQr4tcaqa4tbHvI8sxM0Z3KaBXrLFWqsIDW/fRzZbJF/OpZ5eQAdqTV2rR
	SRPCCoDoYR4mR3/PhEGpwWMdbeBSx7tjUAKcpEen+frx7TbHI6/E+vTuIEcdZAiSpYz1q8F9RjgCu
	M6YNmdKgHQwqNPKTTAFFv+8ZCNBLSjsYByiD6/C1g4yU/I1VnBx1DUM+E5ViA0vXuoJIjwdYKQh4+
	s2XkLE0Qk3MNkiBM+27oZYufjGS6zphnxKbnMxxGmInvzrAX7JGOwmapRhisaOE6Dkdc7RPKSXs8y
	tFZ1bUww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIFt-0000000HSTm-0Ajj;
	Mon, 09 Nov 2026 05:49:21 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIFq-0000000HSTQ-09N9
	for linux-riscv@lists.infradead.org;
	Mon, 09 Nov 2026 05:49:19 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-714d57774d8so301884eaf.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 21:49:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794203357; cv=none;
        d=google.com; s=arc-20260327;
        b=cbCkyU6naMTEIuD9XzNds37zxBuioIKJYe/+XD3wb8dRv/kgAnAGVcCYUhn2SBqpcO
         Ni++xshGMMqZox27wBQEI+2/97GnQhm4EwPCA5FK25Mru2dZ853NzcZAxeMziE079BSv
         jklJTRhCkbpx5xes8CPMK+vf0cYBQckxsfGdsYMRvxahvScSGfkmUmLD9CWrSpEhfnh6
         1Ceu9W7Vgl3jLTZopQH1QOiBoVuykunnipYpIG8wFc1eYOWVRX3zXoMd9rDx59/6zP8T
         Q7u033IlRCQbEkPLBelbE41ogT1SDYinO5P9cg3VTc4i97SXbtUfJVjIqTZfxE5I856b
         8xrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        fh=ghKwSOzgAr7ilZ6o6b0czl0wIY6HQoflRjgyCd0Igs0=;
        b=GJozCVhF2nxNgd3qPMQLyLegFbVt5ZPwZAW+vGKf5OGUVbJ9mgiLXBDd+1ebn/0JZN
         t272q9ZtYokOcRAIZsYRtOfZcHNW4a+Rb1eHduSfbl0Kl8UBJCFEXH0KA9/w80ELYpS9
         KTjxt3eYDNoDiSL3+cv3wtgWk0DZogIW6AoKUF2S9lMGtPU36BZjQylNOPlfqOJXCtJB
         Ylxd8z3S4q1FzVvR8+Q3sVWENBgc2908fC3/taXwHjKPGzlG9ISJ6r8lcUvXYMjw8L0W
         8ZJordeUYuxYIZo+6STv5v4k1aRoLKd0Sxgzuu2wDRGoM9k0KxHJ412B/Y1jChJTiqn2
         Ux1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794203357; x=1794808157; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        b=QT4OrRgUS1LsPO4BrpggnA6P87DCw2nbXylJCtyWui19qBnvS2Zv0d+Is0H2M6hLUp
         hoZEmwqXwvYlIcLzI15/sAW1C499CycFa/WWh9HJJ33IpzRAnaQTQGthtCaOxGDTPwZ/
         ZNOrAMIFIdq2Wcwyf0Ax6AlaCkaPvVkU6TqFpX578Zzr0TbouXnY7XDb1ayUg52uGGIJ
         wg28+gxM8nvocL84rMXth7nDoprugOF7tgeNZ+ruuFE4o00grIsOsHDGHylmfajSoda6
         a+CvTbZ/l7dMP5BwNjmE6f4yC3yH8W0IzDnVvExtL5O3kxs9PGKsGwmrLgL6e3e4UB3s
         LinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794203357; x=1794808157;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KffYBetHs8Ajm29Uu5eM47VHa8AaiRvO1sJNqwagpnE=;
        b=KGZnbbMz5ClQswJU+gacrluJarUMDtx45NdUWIYCY0bAjNc0WEqQLoRzphLJ8dUutw
         i6H1uqb8EH4aYLyKIYr6vS226w7rlnW/996vzjVO89Ju9Fjrh2KeaFn8ySWEfxXgQDbS
         4XKE+L2FDJ4UoJ7votzq7UYPNl10lvvk1avTEtSnQzGN5JVngm9gvdvMVWQAV0gfSlYK
         VKZaA/aiwonloKltb6SofbGjkswPOAt7aMZTKLR+yVcq4V0qW9o01NeqKqF2NFKS8zq0
         DQDXCuCLCZFwwSxBl7h2INDgsZkxTQ9KzDn4eekAOJ6yTtNwb55iK7gmb9l1yV1fLANY
         wOpg==
X-Forwarded-Encrypted: i=1; AL+hErHm056fqMiBwTglEjXi8EgaUXkcTyJs3A/kUZC1NZJcpzObuCUBQTBh1zNiuJJGXGzz5ojiYmzjkMsggQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/9IB33jDYOzpYpOViYbYRx9G04JfzzDjmR2aNaMqhUDlOol+z6
	5LQJ94uzfko0cBR8DEKkDlx+VQeFAaGYqRM35wNo1d8uUg562QRK3mKWKENMYdlcaIoWcWM9P7X
	fK8zU5gcFBOfqBZ5/WloB9KPsYep2dMX/IdCsL5mKHg==
X-Gm-Gg: AYBFou1zFuEFvqsmZSCXH6clSSScyxPF+496Pdr3VnMqoT6Yk5KajkWaQxN43Mc2UzX
	pR3vj19r4+aPPgNYXt2UIpaOeZOnn7GI/NKyK7Ri14Of3kfyorCn//uIQc1J6LJks2UrIWN86NE
	+vO1YC87N/KT1HwaqPC8zOa7TJbLlnKcgeipZj2xRVVxlMNyV9carMj30BO2QUgqUo0rqZ0zNkr
	GKuouguLBdsNmApJ7FkESeYjEQ7YpdvE/S2clf4D5GqKiSWh8hge3+banzWi+YFddb8gdNTq5Z/
	bBYsTiMIYpvZpl7JQT46FptNZNcnO3paPDXKSMi/ZWL7RSEDWimWfnMI56y8Vr9I4KF1i+JceeS
	zo+rsuZbudbaCDcZKY+sN5F55gDCDHRviMd5dy4YoFCY=
X-Received: by 2002:a05:6820:160b:b0:6d8:bba5:6589 with SMTP id
 006d021491bc7-7170f303df1mr1702563eaf.48.1794203356632; Sun, 08 Nov 2026
 21:49:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
 <20261108110406.97495-2-cuiyunhui@bytedance.com> <20261108213254.67805ef0@pumpkin>
 <CAEEQ3w=5QwwvMJFJkpS51APoBjhed6oriCkvcieRdUFWrKtmSg@mail.gmail.com> <avFN7LbSK0q1gsB6@xhacker>
In-Reply-To: <avFN7LbSK0q1gsB6@xhacker>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 9 Nov 2026 13:49:05 +0800
X-Gm-Features: AclHuK-yA93Gg5bVt8kCNssew6sQnM_Z05Rmq56zAts1z3WwIhtyQX6D4YptSkY
Message-ID: <CAEEQ3wmViZNwxXr8q477yHjtABStEJecCHS8=5s_UAk1hYgyfw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 1/3] riscv: implement this_cpu operations
To: Jisheng Zhang <jszhang@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, dennis@kernel.org, tj@kernel.org, 
	cl@gentwo.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, jolsa@kernel.org, bjorn@kernel.org, 
	pulehui@huawei.com, puranjay@kernel.org, thuth@redhat.com, 
	ajones@ventanamicro.com, ben.dooks@codethink.co.uk, rkrcmar@ventanamicro.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, conor.dooley@microchip.com, 
	tglx@kernel.org, debug@rivosinc.com, seanwascoding@gmail.com, 
	andybnac@gmail.com, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	qingfang.deng@siflower.com.cn, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev, dave@stgolabs.net, emil@etsalapatis.com, 
	ihor.solodrai@linux.dev, broonie@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_214918_346105_CA22886B 
X-CRM114-Status: GOOD (  28.01  )
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

SGkgSmlzaGVuZywKCk9uIE1vbiwgTm92IDksIDIwMjYgYXQgMTI6NTfigK9QTSBKaXNoZW5nIFpo
YW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBOb3YgMDksIDIwMjYg
YXQgMTE6NDc6NDNBTSArMDgwMCwgeXVuaHVpIGN1aSB3cm90ZToKPiA+IEhpIERhdmlkLAo+ID4K
PiA+IE9uIE1vbiwgTm92IDksIDIwMjYgYXQgNTozM+KAr0FNIERhdmlkIExhaWdodAo+ID4gPGRh
dmlkLmxhaWdodC5saW51eEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBTdW4sICA4
IE5vdiAyMDI2IDE5OjA0OjA0ICswODAwCj4gPiA+IFl1bmh1aSBDdWkgPGN1aXl1bmh1aUBieXRl
ZGFuY2UuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gPiBSSVNDLVYgaGFzIG5vIGFzbS9wZXJjcHUu
aCwgc28gdGhpc19jcHVfKigpIHJlYWQtbW9kaWZ5LXdyaXRlCj4gPiA+ID4gb3BlcmF0aW9ucyB1
c2UgZ2VuZXJpYyBpbXBsZW1lbnRhdGlvbnMgdGhhdCBkaXNhYmxlIGxvY2FsIGludGVycnVwdHMu
Cj4gPiA+ID4KPiA+ID4gPiBJbXBsZW1lbnQgUklTQy1WLXNwZWNpZmljIHRoaXNfY3B1IG9wZXJh
dGlvbnMgd2l0aCBwcmVlbXB0aW9uIGRpc2FibGVkCj4gPiA+ID4gdG8ga2VlcCBhY2Nlc3NlcyBv
biB0aGUgY3VycmVudCBDUFUuCj4gPiA+Cj4gPiA+IEhhdmUgeW91IGxvb2tlZCBhdCBzb21lIG9m
IHRoZSBzY2hlbWVzIChJIHRoaW5rIGFybTY0IGhhcyB0aGUgbGF0ZXN0LAo+ID4gPiBidXQgYWxz
byBzMzkwKSB0aGF0IGRvIG1vc3QgcGVyLWNwdSBvcHMgd2l0aG91dCBkaXNhYmxpbmcgcHJlZW1w
dGlvbi4KPiA+ID4gSW4gcGFydGljdWxhciB0aGV5IHNhdmUgdGhlIHByZS1lbXB0aW9uIGNoZWNr
IHdoZW4gcHJlLWVtcHRpb24KPiA+ID4gaXMgZW5hYmxlZC4KPiA+ID4KPiA+ID4gQmFzaWNhbGx5
IHRoZSBjb2RlIHRlbGxzIHRoZSBzY2hlZHVsZXIgd2hpY2ggcmVnaXN0ZXIgY29udGFpbnMgdGhl
Cj4gPiA+IHBlci1jcHUgZGF0YSBzbyB0aGF0IGl0IGNhbiBiZSAnbWFnaWNhbGx5JyBmbGlwcGVk
IGR1cmluZyBhIGNvbnRleHQKPiA+ID4gc3dpdGNoLgo+ID4KPiA+IE1hbnkgdGhhbmtzIGZvciBw
b2ludGluZyB0aGlzIG91dCBhbmQgc3VnZ2VzdGluZyB0aGlzIG9wdGltaXphdGlvbi4gVGhpcwo+
ID4gaXMgYSB2ZXJ5IHVzZWZ1bCBzdWdnZXN0aW9uLiBJbiB0aGUgY29tbW9uIGNhc2Ugbm8gcHJl
ZW1wdGlvbiBvciBtaWdyYXRpb24KPiA+IG9jY3Vycywgc28gdGhlIHByZWVtcHRpb24gYm9va2tl
ZXBpbmcgYW5kIHJlc2NoZWR1bGUgY2hlY2sgYXJlIHVubmVjZXNzYXJ5Cj4gPiBvdmVyaGVhZC4K
PiA+Cj4gPiBJbXBsZW1lbnRpbmcgdGhpcyBzY2hlbWUgZm9yIFJJU0MtViB3aWxsIHJlcXVpcmUg
YWRkaXRpb25hbCBjaGFuZ2VzIGJleW9uZAo+ID4gdGhlIGN1cnJlbnQgc2VyaWVzLiBJZiB0aGlz
IHNlcmllcyBpcyBvdGhlcndpc2UgYWNjZXB0YWJsZSwgSSB3b3VsZCBsaWtlCj4gPiB0byBsYW5k
IHRoZSBjdXJyZW50IHRoaXNfY3B1Xyogc3VwcG9ydCBmaXJzdCBhbmQgdGhlbiBwcmVwYXJlIGEg
Zm9sbG93LXVwCj4gPiBzZXJpZXMgdXNpbmcgdGhpcyBhcHByb2FjaC4KPgo+IEhpIFl1bmh1aSBh
bmQgRGF2aWQsCj4KPiBEdXJpbmcgdGhlIG1lcmdlIHdpbmRvdyBidXQgYmVmb3JlIHJjMSwgSSBp
bXBsZW1lbnRlZCBhIHJpc2N2IFBPQwo+IGZvbGxvd2luZyBhcm02NCdzIHByZWVtcHRpYmxlIHRo
aXMgY3B1IHNjaGVtZS4gRWFjaCBvcGVyYXRpb24gcmVjb3Jkcwo+IGl0cyBwZXItY3B1IHBvaW50
ZXIsIG9mZnNldCBhbmQgYWRkcmVzcyByZWdpc3RlcnMuIEV4Y2VwdGlvbiBlbnRyeSBzYXZlcwo+
IGFuZCBjbGVhcnMgdGhpcyBzdGF0ZSwgYW5kIGEgbm9pbnN0ciBjIGhlbHBlciByZXBhaXJzIHRo
ZSBzYXZlZCBvZmZzZXQKPiBhbmQgYWRkcmVzcyByZWdpc3RlcnMgb24gZXhjZXB0aW9uIHJldHVy
biBhZnRlciBhbnkgbWlncmF0aW9uLgo+Cj4gSG93ZXZlciwgbXkgUG9DIGlzIGJhc2VkIG9uIGN1
cnJlbnQgcGVyY3B1IG9mZnNldC4KPgo+IEkgcGxhbmVkIHRvIHNlbnQgaXQgb3V0IGxhc3QgU3Vu
ZGF5LCBidXQgdGhlbiBJIGZvdW5kIFl1bmh1aSBzZW50Cj4gaGlzIHBlcmNwdSBzZXJpZXMod2hp
Y2ggaXMgdXAgdG8gdjksIEkgZGlkbid0IGtub3cgdGhpcyBiZWZvcmUpIG9uIFNhdC4KPiBTbyBJ
IGhvbGQgb24gdGhlIHNlbmRpbmcuCj4KPiBOb3cgd291bGQgaXQgbWFrZSBzZW5zZSB0byByZWJh
c2UgdGhlIFBvQyBvbiBZdW5odWkncyBzZXJpZXMgcGF0Y2gyIGFuZAo+IHBhdGNoMywgZXNwZWNp
YWxseSB0aGUgcGVyY3B1IG9mZnNldCBvcHRpbWl6YXRpb24/IEkgY2FuIHBvc3QgYW4gUkZDCj4g
d2l0aCB0aGlzIHJlYmFzZWQgaW1wbGVtZW50YXRpb24uCj4KCkdpdmVuIHRoZSBzdWJzdGFudGlh
bCBlZmZvcnQgYWxyZWFkeSBpbnZlc3RlZCBpbiBicmluZ2luZyB0aGlzIHNlcmllcwp0byB2OSwg
bXkgb3JpZ2luYWwgcGxhbiB3YXMgdG8gbGFuZCB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBm
aXJzdAphbmQgYWRkIHRoZSBwcmVlbXB0aWJsZSBzY2hlbWUgYXMgYSBmb2xsb3ctdXAuCgpIb3dl
dmVyLCBpZiB0aGUgY29uc2Vuc3VzIGlzIHRvIG1vdmUgZGlyZWN0bHkgdG8gdGhlIHByZWVtcHRp
YmxlIHNjaGVtZSwKSSB3aWxsIGltcGxlbWVudCB0aGlzIHNjaGVtZSBpbiB0aGUgbmV4dCByZXZp
c2lvbiwgYnVpbGRpbmcgb24gdGhlCmNhY2hlZCBwZXJjcHUgb2Zmc2V0IGludHJvZHVjZWQgaW4g
cGF0Y2ggMi4KClRoYW5rcywKWXVuaHVpCgo+IFRoYW5rcwo+ID4KPiA+Cj4gPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
