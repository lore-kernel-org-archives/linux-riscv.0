Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1631FF8FA90
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 17:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxBPvjxnPZFx39Mtw40Hrb84beu7MY8kyDKILEUUEo8=; b=tJMpL50+xNJzzK
	stLCE3i3u+3GWtF8XQ6KnrlyPdWqk+j0qptgCKGugt5JFXZLcIF5mVB7kJnbQK66aKk67fogppRrU
	/3Kkn8ObcVNCB6r/a4IVRXb7SaQH0Ual3N3GAvsJt8NA/Ro4C+VIn6Yt7PcQvcSGg3l/gW7MTk2lG
	jzTsBmZPmNPA0cGUnaoHeYgHumiStN0Dr5+5Mt7CRdD0+0M+rFTjLydWAgahqu1ZQpq5Lp3N2MnCG
	4uYoKoQH9xRor6+BNzoAdA8maiS18t6YyUJloDogoRVzkeWP1CDmmvYHHnCioggNX7/XOBttf8Ikw
	8Pu5Il7NMepqtQuTvpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEd5-00000008x0k-2cAh;
	Tue, 21 Apr 2026 17:11:19 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFEd3-00000008x0O-2Xmu
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 17:11:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=VjnkFdeZK7rty5DMcJ7z5EdKxdECkqDgYWJysUP63zQ=; b=T4HGdHmrOrluO2Ljr/dWivyZ/q
	XEz+F6FFQV9KvN5chUsSMn/90jdUnWIRsl/TcM44S7Dy3dHV6YnkEsuXRIbsP6jk20vj9RHQOoH2O
	nDN+cdpnUSHl/lZ6RNkDb0eMfHZTOYkqfQbqM2xQfpO06tvvZoUkHJStS8a0CeFISAafOB8YL2qbY
	osxvAtbGVH7N5b8i/b9nP8mtQgaIYf+4vLO5KvWnEvRmgEvab04CU48qkdvM+WCvnvapYtMWsc2Sc
	Sq0YXHS/X8f0Iq7bioDgo+IV/lWNUJno4kCUM0K7wsA4JqFa04aGtX2Wvt5YbNzHckZIp6OEroajD
	Alw1SLTA==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wFEcx-0000000F5X7-3F74;
	Tue, 21 Apr 2026 19:11:11 +0200
Date: Tue, 21 Apr 2026 19:11:11 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Shuwei Wu <shuwei.wu@mailbox.org>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
Message-ID: <aeevr6Zj3Pwm9wux@aurel32.net>
Mail-Followup-To: Shuwei Wu <shuwei.wu@mailbox.org>,
	Anand Moon <linux.amoon@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
 <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org>
 <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
 <aeaXszeaE62rM6BJ@aurel32.net>
 <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DHYOIIFMGH7J.228ISQ7XYFGKE@mailbox.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_101117_668866_A0FAD66F 
X-CRM114-Status: GOOD (  16.15  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Yixun Lan <dlan@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, spacemit@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGksCgpPbiAyMDI2LTA0LTIxIDE2OjEwLCBTaHV3ZWkgV3Ugd3JvdGU6Cj4gSGkgQXVyZWxpZW4s
Cj4gCj4gVGhhbmtzIGZvciB5b3VyIGFkZGl0aW9uLgo+IAo+IE9uIFR1ZSBBcHIgMjEsIDIwMjYg
YXQgNToxNiBBTSBDU1QsIEF1cmVsaWVuIEphcm5vIHdyb3RlOgo+ID4gSGkgQW5hbmQsCj4gPgo+
ID4gT24gMjAyNi0wNC0xNiAxNzowNywgQW5hbmQgTW9vbiB3cm90ZToKPiA+PiBBZnRlciByZXZp
ZXdpbmcgdGhlIEJhbmFuYSBQaSBGMyBzY2hlbWF0aWNzLCBJIGNvbmZpcm1lZCB0aGF0IEJ1Y2sx
IGFuZCBCdWNrMgo+ID4+IEJvdGggc3VwcGx5IHRoZSBDT1JFXzBWOSB3aXRoIDAuOVbCsTElIHJh
aWwuIFRvIHJlc29sdmUgdGhlIHJlc3RyaWN0aW9uIGVycm9ycywKPiA+PiBJIGV4cGFuZGVkIHRo
ZSB2b2x0YWdlIHJhbmdlIGluIHRoZSBEVFMgdG8gNTAwLDAwMOKAkzk1MCwwMDAgwrVWLgo+ID4+
IAo+ID4+IEFkZGl0aW9uYWxseSwgSSB1cGRhdGVkIHRoZSBEVFMgdG8gbWFwIHRoZSBzZWNvbmQg
Q1BVIGNsdXN0ZXIgKGNvcmVzIDTigJM3KQo+ID4+IHRvIEJ1Y2syIHRvIGJldHRlciBhbGlnbiB3
aXRoIHRoZSBoYXJkd2FyZSdzIHBvd2VyIGRpc3RyaWJ1dGlvbi4KPiA+Cj4gPiBBY3R1YWxseSB0
aGUgb3V0cHV0IG9mIEJ1Y2sxIGFuZCBCdWNrMiBhcmUgY29ubmVjdGVkIHRvZ2V0aGVyLCBzbyB0
aGV5IAo+ID4gc2hvdWxkIGFsd2F5cyBiZSBjb25maWd1cmVkIHdpdGggdGhlIHNhbWUgb3V0cHV0
IHZvbHRhZ2UuIEFuZCBib3RoIAo+ID4gY2x1c3RlcnMgc2hvdWxkIGJlIG1hcHBlZCB0byBib3Ro
IG91dHB1dHMuCj4gCj4gWW91IGFyZSByaWdodCwgSSByZWNlaXZlZCB0aGUgc2FtZSByZXNwb25z
ZSBmcm9tIHRoZSBvZmZpY2lhbCBkZXZlbG9wZXJzLgo+IAo+IFRoZXJlZm9yZSwgSSdtIHdvbmRl
cmluZyBpZiBhbiBhZGRpdGlvbmFsIHJlZ3VsYXRvci1jb3VwbGVkLXdpdGg6IHByb3BlcnR5Cj4g
ZGVmaW5pdGlvbiBpcyBhbHNvIG5lZWRlZCBoZXJlPwoKWWVzLCBJIHRoaW5rIHRoaXMgaXMgdGhl
IHdheSB0byBnby4gSSBldmVuIHdvbmRlciBpZiB0aGlzIHNob3VsZG4ndCBiZSBhIApmaXggd2l0
aCBDYzogc3RhYmxlLiBUaGlzIGFsc28gaGFzIHRvIGJlIGRvbmUgZm9yIHRoZSBNaWxrLVYgSnVw
aXRlciAKYm9hcmQsIEkgaGF2ZW4ndCBjaGVja2VkIHRoZSBvdGhlciBib2FyZHMgeWV0LCBidXQg
SSBndWVzcyB0aGV5IGFsbCB1c2UgCnRoZSBzYW1lIHNjaGVtYXRpY3MgYXQgdGhhdCB0aGUgUE1J
QyBsZXZlbC4KClJlZ2FyZHMKQXVyZWxpZW4KCi0tIApBdXJlbGllbiBKYXJubyAgICAgICAgICAg
ICAgICAgICAgICAgICAgR1BHOiA0MDk2Ui8xREREOEM5QgphdXJlbGllbkBhdXJlbDMyLm5ldCAg
ICAgICAgICAgICAgICAgICAgIGh0dHA6Ly9hdXJlbDMyLm5ldAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
