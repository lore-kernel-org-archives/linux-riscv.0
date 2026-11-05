Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E7E606D80E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JXUrsMVu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ewqv2x7q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=G7drVfZoUCTKf7OXj1x20x3VTkSCDBEPuOq1Nugqp6M=; b=JXUrsMVuw7mBhEk4SmYx/Rlf7Y
	+viRKLB2DJvVP4JLz/a6HqKdJnQKv6JF4tvYLCMdzz6A7yHchrapGFNTzTCRQRqyNdf9ePYk7cc5N
	HfhGRxqU4tmgUPiOYPYVzIXC/PVw/LAn2lOAP51JdRgeqokS/zVKfHgYL88sTFkBUtkwixvOPMIiS
	QOKpRobO7SuQGW+lyqxWbvteb2mMcSZMkBPaf1FrDTDL7wo7mIzo8W5ZQ0js2xYD/37KbcMpqxS4G
	yp0ey8qnUMuxs2LP6WJgJPFr06cRZ2SfU66rTSmjdoJin8KiIYxYPMTxclFG8cgxfb0ib2MsT5VyS
	gRQuzZaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsGy-000000083Zd-1MId;
	Thu, 05 Nov 2026 07:52:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsGu-000000083Yx-26Tx;
	Thu, 05 Nov 2026 07:52:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 82C67605FF;
	Thu,  5 Nov 2026 07:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90ABD1F00A15;
	Thu,  5 Nov 2026 07:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793865151;
	bh=PshXrkjIu/oVh8H0uuMMexWF+3wbEqyJSvZGNZ3+nBg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ewqv2x7qC/seZGztnmn60Jxwl1553DY/3Df5K32EVdXJ/LFXDDt8XPm0md4mvIdbe
	 O7baTlLtl+fjfHYpiP6NcAphW25/jd9J02KuH6IpVpOf128w6Gk/QhyuyYiZ8AkWEd
	 5I8acWTijjPru9qgJ7HQjHMGzi6ZlJdrE9q8FPGTREZLPcuF2t9RZCaCb3gZIq0i2F
	 0CenpiJNcoERzlwxTs0A3D2xG24ySM7ZrAY0uQR/yg7LLM7PxiAALyYLO9ZiDNOVS8
	 XhlU+5NQ65DYU30sIL8WOqi4fmSQc0g+DhJNmCoP27d9xfq6w4CfLjfd7xU/0Ji7zb
	 e/wsPKB9qBz9g==
Date: Thu, 5 Nov 2026 09:52:10 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com,
	akpm@linux-foundation.org, baoquan.he@linux.dev,
	pasha.tatashin@soleen.com, pratyush@kernel.org, thuth@redhat.com,
	leitao@debian.org, yeoreum.yun@arm.com, robh@kernel.org,
	sourabhjain@linux.ibm.com, kees@kernel.org, coiby.xu@gmail.com,
	Yeking@red54.com, tangyouling@kylinos.cn, maqianga@uniontech.com,
	zhangtianyang@loongson.cn, guodongtai@kylinos.cn, blum@kernel.org,
	adityag@linux.ibm.com, hui.wang@canonical.com,
	sohammetha01@gmail.com, guoren@kernel.org, gaohan@iscas.ac.cn,
	kai.huang@intel.com, kas@kernel.org, vishal.l.verma@intel.com,
	piliu@redhat.com, jbouron@amazon.com, mclapinski@google.com,
	me@linux.beauty, graf@amazon.com, bgwin@google.com, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [PATCH v7 00/15] kexec: Fix CMA and elf header leaks and rework
Message-ID: <auw1qgmjWko52oS_@kernel.org>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
 <179380419709.28814.2122135856184991710.b4-review@b4>
 <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <932cdfda-7030-4829-8b43-062d208450e4@huawei.com>
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

T24gVGh1LCBOb3YgMDUsIDIwMjYgYXQgMTE6NDU6MzlBTSArMDgwMCwgSmluamllIFJ1YW4gd3Jv
dGU6Cj4g5ZyoIDIwMjYvMTEvNCAyMjo1NiwgTWlrZSBSYXBvcG9ydCDlhpnpgZM6Cj4KPiA+PiBQ
YXRjaGVzIDgtMTAgcGFzcyB0aGUga2J1ZiBmaWVsZHMgdG8gY3Jhc2hfcHJlcGFyZV9oZWFkZXJz
KCkgdG8KPiA+PiBzaW1wbGZ5IGNvZGUuCj4gPj4KPiA+PiBQYXRjaCAxMSBmcmVlcyB0aGUgZWxm
IGNvcmUgaGVhZGVyIGZyb20gdGhlIGdlbmVyaWMgcG9zdC1sb2FkIGNsZWFudXAuCj4gPj4KPiA+
PiBQYXRjaGVzIDEyLTE1IGFkZCBrZXhlY19sb2FkX290aGVyX3NlZ21lbnRzKCkgYW5kIGNvbnZl
cnQgdGhlIHRocmVlCj4gPj4gYXJjaGl0ZWN0dXJlcywgYW5kIGFyY2hfa2V4ZWNfc2V0dXBfb3Ro
ZXJfc2VnbWVudHMoKSBidWlsZHMKPiA+PiB0aGUgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGJvb3Qg
cGFyYW1ldGVycyAoYSBEVEIgb3IgYSBjb21tYW5kIGxpbmUpLgo+ID4gCj4gPiBJIHRoaW5rIHRo
ZSByZWZhY3RvcmluZyBzaG91bGQgZ28gYmVmb3JlIHRoZSBpZGVudGljYWwgZml4ZXMgaW4gYXJj
aC8KPiA+IGNvZGUuCj4gCj4gSG93ZXZlciwgdGhpcyB3aWxsIGNhdXNlIHRyb3VibGUgZm9yIHRo
ZSBmaXggcGF0Y2ggaW4gdGhlIHN0YWJsZSByb3VuZC4KClRoYXQncyByaWdodCwgYnV0IHNpbmNl
IGFjdHVhbCBmaXhlcyBhbnl3YXkgcmVxdWlyZSBjaGFuZ2VzIHRvIGtleGVjIGNvcmUsCkkgdGhp
bmsgaXQncyBiZXR0ZXIgdG8gcmVmYWN0b3IgZmlyc3QuIFRoZSBjb3JlIHRoYW4gd2lsbCB0YWtl
IGNhcmUgb2YKcHJvcGVyIGZyZWVpbmcgaW4gdGhlIG1vc3QgY2FzZXMuCgpBbmQgc2luY2UgQ01B
IHN1cHBvcnQgaW4ga2V4ZWMgaXMgcXVpdGUgbmV3IEkgdGhpbmsgdGhlIGVudGlyZSBzZXQgY2Fu
IGJlCmJhY2twb3J0ZWQgdG8gc3RhYmxlIHRoZW4uCgpJJ20gcGxhbm5pbmcgdG8gaGF2ZSBhIGNs
b3NlciBsb29rIGF0IHRoZSByZWZhY3RvcmluZyBSZWFsbHkgU29vbiA6KSAKCj4gLS0gCj4gQmVz
dCByZWdhcmRzLAo+IEppbmppZQo+IAoKLS0gClNpbmNlcmVseSB5b3VycywKTWlrZS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
