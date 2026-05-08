Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E9ACD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BdsPSj9VlS4stbC435rHnGxFCblYlUpFT8oPgsk444k=; b=VatBe3SwsY2jRW
	eHmYgVLSQ4lUoqZ8FbftlaEDfbR40mkkjat3rw4/8flYUpcK3yNMtmnQRpI3zctQq85u3MNX5X59g
	TV39Qy/x8p530V+p1bGQtJzZ/sAp6PxmKvCKDNPMnxiR5CZ4dkFJUmjBzVfUxgZSzOlJ5DYdFiyPg
	wE3Tp66HyZNlELbDhZ7AAA1gOg7AL7D2p5z20xz/PZ+90RMEIUpMpTkfa5KMp5rYsWl/7lQ645li0
	Hl/Cnz4appQjPtjVPLepAHH3UMIFqg+jTIY0lp/S0mFqcNnRQFeozaKinNgpvc1yWPncTpJYgfvfy
	zWBy+EGikYaG67ntMq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHwm-00000006Ahp-0Vjx;
	Fri, 08 May 2026 09:56:40 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLHwk-00000006Agu-0M2c;
	Fri, 08 May 2026 09:56:39 +0000
Received: from [100.79.201.50] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6CF7820B7165;
	Fri,  8 May 2026 02:56:17 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6CF7820B7165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1778234192;
	bh=n1jCOVqxUTmwpgXP8ny02/M4Ut73nTiReI4y3CRTH+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QJ6oUHjrogYVM+kjRGk/5FN3Kaqyj4GlCgXNgUf9P0S+nw1wg2ye/8oHu64jq8lPQ
	 CMOhwNPm/6iMwgQU/93VXi34h8th9BR0Xss2y1PX6XpYNudLxhI968GRgCveOmj6Wd
	 6uOeIJ3fQL1Hw1yrrCTaANeT8bv9dpGVG/B1oA8k=
Message-ID: <3415fe72-0572-429c-aeff-a078dab5a930@linux.microsoft.com>
Date: Fri, 8 May 2026 15:26:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: hyperv: Add support for
 mshv_vtl_return_call
To: Marc Zyngier <maz@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Michael Kelley <mhklinux@outlook.com>,
 Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-riscv@lists.infradead.org, vdso@mailbox.org,
 ssengar@linux.microsoft.com
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-8-namjain@linux.microsoft.com>
 <aeolHwXHFH4AnX_n@J2N7QTR9R3.cambridge.arm.com>
 <f4059f5d-a82b-40c2-942e-3e24cefab94f@linux.microsoft.com>
 <86mryaxng3.wl-maz@kernel.org>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <86mryaxng3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_025638_153886_11494E19 
X-CRM114-Status: GOOD (  18.26  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiA1LzgvMjAyNiAyOjU1IFBNLCBNYXJjIFp5bmdpZXIgd3JvdGU6Cj4gT24gV2VkLCAyOSBB
cHIgMjAyNiAxMDo1NjoxMSArMDEwMCwKPiBOYW1hbiBKYWluIDxuYW1qYWluQGxpbnV4Lm1pY3Jv
c29mdC5jb20+IHdyb3RlOgo+Pgo+IAo+IFsuLi5dCj4gCj4+IE1lcmdpbmcgdGhyZWFkcyBmb3Ig
YWRkcmVzc2luZyBjb21tZW50cyBmcm9tIE1hcmsgUnV0bGFuZCBhbmQgTWFyYwo+PiBaeW5naWVy
IG9uIHRoaXMgcGF0Y2guCj4+Cj4+IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBjaGFuZ2VzLiBQ
bGVhc2UgYWxsb3cgbWUgdG8gYnJpZWZseSBleHBsYWluCj4+IHRoZSB1c2UgY2FzZSBoZXJlIGFu
ZCB0aGVuIGFkZHJlc3MgeW91ciBjb21tZW50cy4KPj4KPj4gSHlwZXItVidzIFZpcnR1YWwgVHJ1
c3QgTGV2ZWxzIChWVExzKSBwcm92aWRlIGhhcmR3YXJlLWVuZm9yY2VkCj4+IGlzb2xhdGlvbiB3
aXRoaW4gYSBzaW5nbGUgVk0sIGFuYWxvZ291cyB0byBBUk0gVHJ1c3Rab25lLiBUaGUga2VybmVs
Cj4+IHJ1bnMgaW4gVlRMMiAoaGlnaGVyIHByaXZpbGVnZSkgYXMgYSAicGFyYXZpc29yIiwgYSBz
ZWN1cml0eSBtb25pdG9yCj4+IHRoYXQgaGFuZGxlcyBpbnRlcmNlcHRzIGZvciB0aGUgcHJpbWFy
eSBPUyBpbiBWVEwwIChsb3dlcgo+PiBwcml2aWxlZ2UpLiBUaGUgVlRMIHN3aXRjaCAobXNodl92
dGxfcmV0dXJuX2NhbGwpIGlzIGZ1bmN0aW9uYWxseQo+PiBlcXVpdmFsZW50IHRvIEtWTSdzIGd1
ZXN0IGVudGVyL2V4aXQuIEl0IHNhdmVzIFZUTDIgc3RhdGUsIGxvYWRzCj4+IFZUTDAncyBHUFJz
IG90aGVyIHJlZ2lzdGVycyBmcm9tIGEgc2hhcmVkIGNvbnRleHQgc3RydWN0dXJlLCBpc3N1ZXMK
Pj4gaHZjICMzIHRvIGxldCBWVEwwIHJ1biwgYW5kIG9uIHJldHVybiBzYXZlcyBWVEwwJ3MgdXBk
YXRlZCBzdGF0ZSBiYWNrLgo+IAo+IE5vLCB0aGlzIGlzIGZ1bmRhbWVudGFsbHkgZGlmZmVyZW50
LiBLVk0gaXMgcHVyZWx5IGFyY2hpdGVjdHVyYWwsCj4gZG9lc24ndCB0cnkgdG8gInNhbml0aXNl
IiBhbnl0aGluZywgYW5kIGNvbnRleHQgc3dpdGNoZXMgKmFsbCogb2YgdGhlCj4gZ3Vlc3Qgc3Rh
dGUuIE5vIGlmcywgbm8gYnV0cywgbm8gInJlc2VydmVkIHJlZ2lzdGVycyIuCj4gCj4gWy4uLl0K
CkFja2VkLgoKPiAKPj4gUmVnYXJkaW5nIE5vbi1TTUNDQyAiaHZjICMzIiBjYWxsLCBJIGhhdmUg
YSBsaW1pdGF0aW9uIGhlcmUgb3dpbmcgdG8KPj4gdGhlIEFCSSB0aGF0IGlzIGRlZmluZWQgYnkg
dGhlIEh5cGVyLVYgaHlwZXJ2aXNvci4gRml4aW5nIHRoaXMKPj4gcmVxdWlyZXMgYSBoeXBlcnZp
c29yLXNpZGUgY2hhbmdlIHRvIHN1cHBvcnQgU01DQ0Mtc3R5bGUgZGlzcGF0Y2ggZm9yCj4+IFZU
TCByZXR1cm4uIFVudGlsIHRoZW4sIGh2YyAjMyBpcyB0aGUgb25seSB3b3JraW5nIGludGVyZmFj
ZS4gTW9yZW92ZXIKPj4gdGhlcmUgd291bGQgYmUgYmFja3dhcmQgY29tcGF0aWJpbGl0eSBpc3N1
ZXMgd2l0aCB0aGlzIG5ldyBBQkkKPj4gaW50ZXJmYWNlLCBpZiBhdCBhbGwgaXQgaXMgYWRkZWQu
Cj4gCj4gTGVmdCBoYW5kLCBwbGVhc2UgdGFsayB0byByaWdodCBoYW5kLiBUaGlzIGlzIG5vdCB0
aGUgZmlyc3QgdGltZSB3ZQo+IHB1c2ggYmFjayBvbiB0aGlzLCBhbmQgd2UgYWxyZWFkeSBoYWQg
dGhpcyBhbm5veWluZyBkaXNjdXNzaW9uIGJhY2sKPiB3aGVuIGFybTY0IGFzIGEgSHlwZXItViBn
dWVzdCB3YXMgZmlyc3QgcHJvcG9zZWQgKDYsIDcgeWVhcnMgYWdvPykuCj4gCj4gV2hhdCBoYXMg
Y2hhbmdlZCBzaW5jZT8gQWJzb2x1dGVseSBub3RoaW5nLgo+IAo+IElmIHRoZSBIeXBlci1WIGZv
bGtzIGRlY2lkZSB0byBpZ25vcmUgdGhlIHN0YW5kYXJkIGFuZCBnbyB0aGVpciBvd24KPiB3YXks
IHRoYXQncyBmaW5lLiBUaGV5IG9ubHkgZ2V0IHRvIGtlZXAgdGhlIHBpZWNlcy4KPiAKPiBUaGFu
a3MsCj4gCj4gCU0uCj4gCgpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4gSSB1bmRlcnN0YW5kIHlv
dXIgYW5kIE1hcmvigJlzIGNvbmNlcm5zIHdpdGggdGhpcyAKYXBwcm9hY2ggbm93LCBhbmQgSeKA
mXZlIGluaXRpYXRlZCBpbnRlcm5hbCBkaXNjdXNzaW9ucyB3aXRoIHRoZSB0ZWFtIHRvIApleHBs
b3JlIHBvdGVudGlhbCBzb2x1dGlvbnMuCgpSZWdhcmRzLApOYW1hbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
