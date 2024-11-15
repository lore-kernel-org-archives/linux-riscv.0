Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E288ED68BD9
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2024 21:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e63oBLseH3s1WoWAlB5HbTd1Ff8bKAn0sxysKeFHwxc=; b=Mgkz8Tuuy8DQx4
	HO0gjTvKDvMgkhclJ9lIY6iYPC1uTrmOl3c3XYmSodU7bun8PF2bVOKku6lA39W3d8sutHOYg0KXU
	LdOki8NZQYRjKlQq5hLooypSurJfoVkTqp4Zkg2mziUUggOAjYgdkf2I++I2acIvL+PSeP021LFCE
	1MQ05wB4sRCcgysZQxBzmavFMSxgCzII46PjwIpz2RBzBIsdEGaFOHLTNJXHij95OO6A+WKDxUiYm
	PkAbJxVV0LA9bWVaVvVjuAloZHsAg9qM1xPbIbLkiMyFQNyRTAqIRjHrjwE3Qnp81gkIdTk0h3cQ8
	g8uWEjq3QXaPjvyANXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4CR-00000004Hqt-3fT3;
	Fri, 15 Nov 2024 21:49:55 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4CO-00000004Hns-3oRc
	for linux-riscv@lists.infradead.org;
	Fri, 15 Nov 2024 21:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=prMCeiS3C5eJ4JUpUHzaK1wSkzL+Nfbek9oMDzah4h0=; b=QDaSXODWgq8n0WBjsGY9mufYRE
	TprfLoI9CPd0FjQsYPK2yfUZzgi1tSu29V5Et0dXxfSrwlpnjVXwSdgVxuOcNaDT+B99oKycmjsmB
	DAABnDWgi07vWpOjFBUvxdqQ5eR3afnCJXEwU7k4FqxuQnDpot0lExyWy/eWu/KAqnGYpHkkW1HwM
	uylRomXHgYBtXoB6tACZYx/mNUrZ8SedBZSQqQrO19ColuLE/x9NgtXDJsy3Etgxj0mjJxwXTdMnW
	nhLSuiNcEworCLm/4gF1muA7o4RXFgXaC525GxvuC7BZ56mRTvSOlCbXWgiNhGFN+8m6bGS8lowou
	wlzpax5A==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1tC4Bl-00D5ON-36;
	Fri, 15 Nov 2024 22:49:13 +0100
Date: Fri, 15 Nov 2024 22:49:12 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
Message-ID: <ZzfB2LfsD0ATjLMv@aurel32.net>
Mail-Followup-To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Celeste Liu <coelacanthushex@gmail.com>,
	Celeste Liu via B4 Relay <devnull+CoelacanthusHex.gmail.com@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>, "Dmitry V. Levin" <ldv@strace.io>,
	Andrea Bolognani <abologna@redhat.com>,
	Felix Yan <felixonmars@archlinux.org>,
	Ruizhe Pan <c141028@gmail.com>,
	Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>,
	Yao Zi <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
References: <87ldya4nv0.ffs@tglx>
 <87sesgftng.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87sesgftng.fsf@all.your.base.are.belong.to.us>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_134953_398596_AD6E8379 
X-CRM114-Status: GOOD (  13.06  )
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

T24gMjAyNC0xMC0yOCAwMjo0NSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBUaGFua3MgZm9yIGhl
bHBpbmcgb3V0IHRvIGRpc3NlY3QgdGhpcyEgTXVjaCBhcHByZWNpYXRlZCEKPiAKPiBUaG9tYXMg
R2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4gd3JpdGVzOgo+IAo+ID4gTGV0IG1lIGxvb2sg
YXQgeW91ciBmYWlsdXJlIGFuYWx5c2lzIGZyb20geW91ciBmaXJzdCByZXBseToKPiA+Cj4gPj4g
IDEuIHN0cmFjZSAidHJhY2luZyI6IFJlcXVpcmVzIHRoYXQgcmVncy0+YTAgaXMgbm90IHRhbXBl
cmVkIHdpdGggcHJpb3IKPiA+PiAgICAgcHRyYWNlIG5vdGlmaWNhdGlvbgo+ID4+IAo+ID4+ICAg
ICBFLmcuOgo+ID4+ICAgICB8ICMgLi9zdHJhY2UgLwo+ID4+ICAgICB8IGV4ZWN2ZSgiLyIsIFsi
LyJdLCAweDdmZmZmYWFjMzg5MCAvKiAyMSB2YXJzICovKSA9IC0xIEVBQ0NFUyAoUGVybWlzc2lv
biBkZW5pZWQpCj4gPj4gICAgIHwgLi9zdHJhY2U6IGV4ZWM6IFBlcm1pc3Npb24gZGVuaWVkCj4g
Pj4gICAgIHwgKysrIGV4aXRlZCB3aXRoIDEgKysrCj4gPj4gICAgIHwgIyAuL2Rpc2FibGVfcHRy
YWNlX2dldF9zeXNjYWxsX2luZm8gLi9zdHJhY2UgLwo+ID4+ICAgICB8IGV4ZWN2ZSgweGZmZmZm
ZmZmZmZmZmZmZGEsIFsiLyJdLCAweDdmZmZkODkzY2UxMCAvKiAyMSB2YXJzICovKSA9IC0xIEVB
Q0NFUyAoUGVybWlzc2lvbiBkZW5pZWQpCj4gPj4gICAgIHwgLi9zdHJhY2U6IGV4ZWM6IFBlcm1p
c3Npb24gZGVuaWVkCj4gPj4gICAgIHwgKysrIGV4aXRlZCB3aXRoIDEgKysrCj4gPj4gCj4gPj4g
ICAgIEluIHRoZSBzZWNvbmQgY2FzZSwgYXJnMCBpcyBwcmVtYXR1cmVseSBzZXQgdG8gLUVOT1NZ
Uwo+ID4+ICAgICAoMHhmZmZmZmZmZmZmZmZmZmRhKS4KPiA+Cj4gPiBUaGF0J3MgZXhwZWN0ZWQg
aWYgcHRyYWNlX2dldF9zeXNjYWxsX2luZm8oKSBpcyBub3QgdXNlZC4gUGxhaW4gZHVtcGluZwo+
ID4gcmVnaXN0ZXJzIHdpbGwgZ2l2ZSB5b3UgdGhlIGN1cnJlbnQgdmFsdWUgb24gYWxsIGFyY2hp
dGVjdHVyZXMuCj4gPiBwdHJhY2VfZ2V0X3N5c2NhbGxfaW5mbygpIGV4aXN0IGV4YWN0bHkgZm9y
IHRoYXQgcmVhc29uLgo+IAo+IE5vdGVkISBTbyB0aGlzIHNob3VsZG4ndCBiZSBjb25zaWRlcmVk
IGFzIGEgcmVncmVzc2lvbi4gSU9XLCB0aGUKPiBleGlzdGluZyB1cHN0cmVhbSBjb2RlIGlzIE9L
IGZvciB0aGlzIHNjZW5hcmlvLgoKTm90IGhvd2V2ZXIgdGhhdCBpdCBicmVha3Mgc29tZSBwcm9n
cmFtcywgZm9yIGluc3RhbmNlIEkgYXJyaXZlZCBvbiB0aGlzCnRocmVhZCBieSBkZWJ1Z2dpbmcg
cHl0aG9uLXB0cmFjZS4gSSdsbCB0cnkgdG8gbG9vayBhdCBhZGRpbmcgc3VwcG9ydApmb3IgcHRy
YWNlX2dldF9zeXNjYWxsX2luZm8oKSwgYnV0IEkgYW0gYWZyYWlkIHdlIHdpbGwgZmluZCBtb3Jl
IGJyb2tlbgpwcm9ncmFtcy4KClJlZ2FyZHMKQXVyZWxpZW4KClsxXSBodHRwczovL2J1aWxkZC5k
ZWJpYW4ub3JnL3N0YXR1cy9mZXRjaC5waHA/cGtnPXB5dGhvbi1wdHJhY2UmYXJjaD1yaXNjdjY0
JnZlcj0wLjkuOS0wLjElMkJiMiZzdGFtcD0xNzMxNTQ3MDg4JnJhdz0wCgotLSAKQXVyZWxpZW4g
SmFybm8gICAgICAgICAgICAgICAgICAgICAgICAgIEdQRzogNDA5NlIvMURERDhDOUIKYXVyZWxp
ZW5AYXVyZWwzMi5uZXQgICAgICAgICAgICAgICAgICAgICBodHRwOi8vYXVyZWwzMi5uZXQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
