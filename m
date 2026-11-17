Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3A9606A31C
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 21:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TkECv+UV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aurel32.net header.i=@aurel32.net header.a=rsa-sha256 header.s=202004.hall header.b=idd9LGL/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H9aYvVKLSJPgPhGRs5FMwel57cv1h+OcQuQYnbfbGUQ=; b=TkECv+UVfF9rTIxmTLFOzUSuqJ
	k2AramAxWIP9evli/ktjr4AQN1jfPKlxSbJxTuPoRpzQgzYwtzLRXCQIXMCXST4P91Bi9qv1gZIVd
	sjbmZ5WawORxR0y+Y8IZnOI4WKHXhboMfeFHzh+WdQbFHeMUp/0e4UX1qO862GsSg0RtqYVWeydf8
	/Fv308g33A33wYEvbNzfuU5FQuWFZhWAKteF9RuCNdy+NxHkrjtIVasWxyLASaRwkFAxK26D2nSZA
	SguVNFw1POfvom9EuBqv7kymg8sHVvwlsXRKjVKtC/J4i0Ha+ASWLIFn+2/Byrr33lpqp4RAzChh8
	jOTzSdxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQwT-000000079V4-0jY2;
	Tue, 17 Nov 2026 21:42:17 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTQwQ-000000079T5-35M6
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 21:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=PrHvuwIuDErJm7EM/POsxG5qv1/2voyuislLca5+9uA=; b=idd9LGL/Vro7c0VHbgDwR/u6Iv
	E7k9Y/K/GK26hxy30CBDTzvylJ/VfXJ/vH8j3FJdIXNmiTa+MqwNYYCqVi6gnmhyGAQf9/pj4DFpB
	sgacsAUHnnGo3SsF15tqr2RXuhtyaRJAKtTJQlNB2v0cNZNFshDIo4pyqrjazGs3ltNON3VFgRCIz
	P0ZN6YdewWKbahdbNOTwZDl4PZK1StyHPpL/zf6qanH61ZhmxLPs+gKZw6FqJlklV0xuy/3LFjMPs
	ZvBdbbAQwTFg1JKQ/MhB3+ikHjl5ks21pP5zzypPqCHSgQX4AsTYDSrJBRtEoG6qV1siOgOl8SL1x
	qwebwdCQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xTQwM-0000000GaSU-2Nd8;
	Tue, 17 Nov 2026 22:42:10 +0100
Date: Tue, 17 Nov 2026 22:42:08 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: =?utf-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Encrow Thorne <encrow.thorne@linux.spacemit.com>,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: spacemit-k1: Request the Gen2 speed change once the
 link is up
Message-ID: <avzKMAtDqeqHIivr@aurel32.net>
Mail-Followup-To: =?utf-8?B?RnLDqWTDqXJpYyBNYWjDqQ==?= <frederic.mahe@cirad.fr>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Encrow Thorne <encrow.thorne@linux.spacemit.com>,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261117085508.83388-1-frederic.mahe@cirad.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261117085508.83388-1-frederic.mahe@cirad.fr>
User-Agent: Mutt/2.4.1 (2026-07-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_134214_774818_C54D2A94 
X-CRM114-Status: GOOD (  16.96  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgRnLDqWTDqXJpYywKCk9uIDIwMjYtMTEtMTcgMDk6NTUsIEZyw6lkw6lyaWMgTWFow6kgd3Jv
dGU6Cj4gT24gYSBCYW5hbmEgUGkgQlBJLUYzLCBhbiBOVk1lIFNTRCBpbiB0aGUgTS4yIHNsb3Qg
KHBjaWUxKSBhbHdheXMgY29tZXMKPiB1cCBhdCAyLjUgR1QvcywgYWx0aG91Z2ggdGhlIHJvb3Qg
cG9ydCBhbmQgdGhlIGRyaXZlIGJvdGggc3VwcG9ydAo+IDUgR1Qvcy4gVGhlIERpcmVjdGVkIFNw
ZWVkIENoYW5nZSB0aGF0IGR3X3BjaWVfc2V0dXBfcmMoKSByZXF1ZXN0cwo+IGJlZm9yZSB0aGUg
TFRTU00gaXMgZW5hYmxlZCBoYXMgbm8gZWZmZWN0IG9uIEsxLiBTZXR0aW5nIFJldHJhaW4gTGlu
awo+IGluIHRoZSByb290IHBvcnQncyBMaW5rIENvbnRyb2wgZnJvbSB1c2Vyc3BhY2UgYnJpbmdz
IHRoZSBsaW5rIHRvCj4gNSBHVC9zLCBzbyB0aGUgbGluayBpdHNlbGYgaXMgZmluZS4KPiAKPiBP
bmNlIHRoZSBsaW5rIGlzIHVwLCByZXF1ZXN0IHRoZSBzcGVlZCBjaGFuZ2UgYWdhaW4sIHdhaXQg
Zm9yIHRoZQo+IGNvbnRyb2xsZXIgdG8gY2xlYXIgU1BFRURfQ0hBTkdFIChhcyBwY2ktaW14NiBk
b2VzKSwgdGhlbiBicmllZmx5IGZvcgo+IExpbmsgU3RhdHVzIHRvIHJlcG9ydCB0aGUgbmV3IHNw
ZWVkLiBBIHBvcnQgd2l0aCBub3RoaW5nIGJlaGluZCBpdCBpcwo+IHNraXBwZWQgYWZ0ZXIgMTAw
IG1zLgo+IAo+IFdpdGggYW4gU0sgaHluaXggQkM1MTEsIHRoZSBsaW5rIG5vdyB0cmFpbnMgYXQg
NSBHVC9zIHgyIGFuZCBmaW8KPiBzZXF1ZW50aWFsIHJlYWQgZ29lcyBmcm9tIDM5NyB0byA1NzUt
NjQwIE1CL3MuIERhdGEgdmVyaWZpZWQgd2l0aCBmaW8KPiBjcmMzMmMuIFRoZSBlbXB0eSBwY2ll
MiBwb3J0IGJlaGF2ZXMgYXMgYmVmb3JlLgo+IAo+IFRoaXMgY2hhbmdlIHdhcyBkZXZlbG9wZWQg
d2l0aCB0aGUgaGVscCBvZiBDbGF1ZGUgKEFudGhyb3BpYyk7IEkKPiByZXZpZXdlZCBhbmQgdGVz
dGVkIGl0IG9uIGhhcmR3YXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyw6lkw6lyaWMgTWFow6kg
PGZyZWRlcmljLm1haGVAY2lyYWQuZnI+Cj4gLS0tCj4gVGhlIEsxIFBDSWUgY292ZXIgbGV0dGVy
IHNheXMgYWxsIHBvcnRzIHJ1biBhdCA1IEdUL3MsIHNvIG1heWJlIHRoaXMKPiBkZXBlbmRzIG9u
IHRoZSBkcml2ZSBvciB0aGUgZmlybXdhcmU7IG9uIHRoaXMgYm9hcmQgdGhlIGxpbmsgYWx3YXlz
IGNhbWUKPiB1cCBhdCAyLjUgR1QvcyBiZWZvcmUgdGhpcyBwYXRjaC4gVGVzdGVkIG9uIHRvcCBv
ZiB2Ny40LXJjMSB3aXRoICJQQ0k6Cj4gc3BhY2VtaXQ6IElnbm9yZSBQRVJTVCMgaW5wdXQgaW4g
UkMgbW9kZSBvbiBLMSIgKGFwcGxpZXMgY2xlYW5seSB3aXRob3V0Cj4gaXQgdG9vKS4KPiAKPiAg
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1zcGFjZW1pdC1rMS5jIHwgNDggKysrKysr
KysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNDggaW5zZXJ0aW9ucygrKQoKVGhhbmtz
LCBJIGNvbmZpcm1pbmcgdGhpcyB3b3JrcyB3ZWxsIGFuZCBncmVhdGx5IGltcHJvdmVzIHRoZSBO
Vk1lIApwZXJmb3JtYW5jZS4gSSBoYXZlIGp1c3QgdGVzdGVkIGl0IGZvciBhIGZldyBob3Vycywg
YW5kIEknbGwgbWFpbCBiYWNrIAppZiBJIGVuY291bnRlcmVkIGFueSBzdGFiaWxpdHkgaXNzdWUg
b24gdGhlIGxvbmcgdGVybS4gSW4gdGhlIG1lYW50aW1lOgoKVGVzdGVkLWJ5OiBBdXJlbGllbiBK
YXJubyA8YXVyZWxpZW5AYXVyZWwzMi5uZXQ+CgotLSAKQXVyZWxpZW4gSmFybm8gICAgICAgICAg
ICAgICAgICAgICAgICAgIEdQRzogNDA5NlIvMURERDhDOUIKYXVyZWxpZW5AYXVyZWwzMi5uZXQg
ICAgICAgICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
