Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369DBCA0EE4
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 14:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8KFlOwQ2lkZeLI2R82jFwhl1QEbb4+kcwWxpfWEzGw=; b=pFACMMbSMXZ3aq
	wjrwJCpNYXEBjZ3cHP86mgoX18QZuSQUG2Y/1F0KGh73eCdHucw/3v/Gn8BTM0w1fUi6BwAsL1MvI
	7cWPl1vtFGQWUdoBKaLyxXdjStqjb0QclDArESEl+RTIpMDUnD2lVE49pDe1qdPYtcdQvIr9gbSmS
	LNHezCHHnuWu10MjvqHE7Eowg5CNmn+VNjFstxVeqqAaaug4DD5iCUoPFYham9CEYOpu+50Vs+Dd5
	wJ2XA33D9h6VZA8fP/lf8WSd46ydYKg4JascPfj88zfPJ4R+W1ctQIFPMM/VkbyOOEdWSP12XHpzv
	UwFo7yDb4+IhkhFNhZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYtY-0000000HFZn-28EU;
	Thu, 14 Aug 2025 14:25:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYLp-0000000H6bq-31aN;
	Thu, 14 Aug 2025 13:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S5J+mLAP2QlIEt8PDLcOSFod+Rvn+2kAxka0kZb8QO0=; b=SLZ3WtGTwHNowNUvb0tI0PIxn6
	gB3MYoC6eQTDhtso4xMDxKKXDhzGmSFe/0U7uguI5/NnP1Csr+oN6VAVcAB1Q+orJOIh/tF1sT8EI
	0xRz/q1gZUfMFqarDYEFRNGUDgpXQ8shuwgNd9+TaXONapG3GisnfAP+efUX/Zg15I+yt269JY3TJ
	HlD1iF1b5MgvqapZ+mvxRigKtbdlJlVrdHXgmSHieSkReyRhoEgMNgrod5FZweFSw4WMybZipOxZq
	y8upWGcM7Yce6Bg6WsmUCEyszwtIU8Z4NJcMP+k4ZC0IfVsS8nv7b1szlonkIA/OyZS5dts4e2tMy
	6er/1qRg==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYLl-0000000GQCJ-2rxr;
	Thu, 14 Aug 2025 13:50:40 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c2mf947xHz9sSR;
	Thu, 14 Aug 2025 15:43:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPu6Xjo1vLlQ; Thu, 14 Aug 2025 15:43:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c2mf83Tw5z9sSL;
	Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D6A38B765;
	Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id eqmp3JHpIEX9; Thu, 14 Aug 2025 15:43:12 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C584A8B763;
	Thu, 14 Aug 2025 15:43:09 +0200 (CEST)
Message-ID: <86186254-b2c6-4818-af0a-4eb67d90e501@csgroup.eu>
Date: Thu, 14 Aug 2025 15:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/24] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Kees Cook <kees@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
 linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Jan Stancek <jstancek@redhat.com>,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250812-vdso-absolute-reloc-v4-0-61a8b615e5ec@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_145037_918008_53F64AFD 
X-CRM114-Status: GOOD (  20.85  )
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

CgpMZSAxMi8wOC8yMDI1IMOgIDA3OjQ0LCBUaG9tYXMgV2Vpw59zY2h1aCBhIMOpY3JpdMKgOgo+
IFRoZSBjb21waWxlciBjYW4gZW1pdCBhYnNvbHV0ZSByZWxvY2F0aW9ucyBpbiB2RFNPIGNvZGUs
Cj4gd2hpY2ggYXJlIGludmFsaWQgaW4gdkRTTyBjb2RlLgo+IERldGVjdCB0aGVtIGF0IGNvbXBp
bGUtdGltZS4KCkknbSBhIGJpdCBwdXp6bGVkIHdpdGggdGhpcyBzZXJpZXMuCgpJZiBJIHVuZGVy
c3RhbmQgY29ycmVjdGx5LCB0aGUgY2hlY2sgd2lsbCBiZSBkb25lIG9ubHkgd2hlbiB5b3UgaGF2
ZSAKUlVTVCBhdmFpbGFibGUgPwoKSSB3b3VsZG4ndCBleHBlY3QgaGF2aW5nIFJVU1QgdG8gYnVp
bGQgYSBDIGtlcm5lbC4KCkJ5IHRoZSB3YXksIGFyZW4ndCByZWxvY2F0aW9ucyBhbHJlYWR5IGRl
dGVjdGVkIGJ5IGNvbW1hbmQgCmNtZF92ZHNvX2NoZWNrIGluIGxpYi92ZHNvL01ha2VmaWxlLmlu
Y2x1ZGUgLCB1c2luZyByZWFkZWxmID8gV2h5IGlzIGEgCm5ldyB0b29sIG5lZWRlZCBhbmQgd2h5
IGRvZXMgaXQgaGF2ZSB0byBiZSB3cml0dGVuIGluIFJVU1QgbGFuZ2FnZSA/CgpUaGFua3MKQ2hy
aXN0b3BoZQoKPiAKPiBsaWJjIGVsZi5oIGlzIG1pc3Npbmcgc29tZSBvZiB0aGUgcmVsb2NhdGlv
biBjb25zdGFudHMsCj4gc28gbWFrZSB1c2VyIG9mIHRoZSBrZXJuZWxzIG93biBVQVBJIGhlYWRl
cnMgaW5zdGVhZC4KPiAKPiBLYnVpbGQgYW5kIFJ1c3QgZm9sa3M6IFRoaXMgY29udGFpbnMgY3Vz
dG9tIGRlZmluaXRpb25zIG9mIGhvc3Rwcm9nCj4gYmluZGdlbiBhbmQgcnVzdCBsaWJyYXJ5IGNv
bW1hbmRzLgo+IFRoZXNlIGFyZSBjdXJyZW50bHkgb25seSBkZWZpbmVkIGluc2lkZSB0aGUgc3Vi
c3lzdGVtIGRpcmVjdG9yeS4KPiBMZXQgbWUga25vdyBpZiB0aGV5IHNob3VsZCBnbyBpbnRvIHNj
cmlwdHMvTWFrZWZpbGUuaG9zdC4KPiAKPiBUaGlzIHdpbGwgY29uZmxpY3Qgd2l0aCBteSBTUEFS
QzY0IGdlbmVyaWMgdkRTTyBwYXRjaGVzIFswXS4KPiBJZiBib3RoIGVuZCB1cCBiZWluZyBhcHBs
aWVkIGF0IHRoZSBzYW1lIHRpbWUsIHBsZWFzZSBsZWF2ZSBvdXQgY29tbWl0Cj4gJ3Zkc28vdmRz
b2NoZWNrOiBEcm9wIHRoZSB0cmFuc2l0aW9uYWwga2NvbmZpZyBvcHRpb24nIGZyb20gdGhpcyBz
ZXJpZXMuCj4gCj4gWzBdIGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9v
ay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRmxrbWwlMkYyMDI1MDcy
NC12ZHNvLXNwYXJjNjQtZ2VuZXJpYy0yLXYxLTAtZTM3NmEzYmQyNGQxJTQwbGludXRyb25peC5k
ZSUyRiZkYXRhPTA1JTdDMDIlN0NjaHJpc3RvcGhlLmxlcm95JTQwY3Nncm91cC5ldSU3QzNmMDNm
Njc0NzMyNTQ1MWVlOTg4MDhkZGQ5NjM0ZjI3JTdDOGI4N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5YTIw
MTFiYjUlN0MwJTdDMCU3QzYzODkwNTc0Mjc0OTU2MTA2NCU3Q1Vua25vd24lN0NUV0ZwYkdac2Iz
ZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0
ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9
SGFjRiUyRnZsVW94QTlQNmZUaU4xeXR3NDlnd2F5WDF3TkU3SXhmRWtGdXRFJTNEJnJlc2VydmVk
PTAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgV2Vpw59zY2h1aCA8dGhvbWFzLndlaXNzc2No
dWhAbGludXRyb25peC5kZT4KPiAtLS0KPiBDaGFuZ2VzIGluIHY0Ogo+IC0gUmVwbGFjZSB0aGUg
aW5saW5lIHNoZWxsIGxvZ2ljIHdpdGggYSBkZWRpY2F0ZWQgYnVpbGQtdGltZSB0b29sCj4gLSBM
aW5rIHRvIHYzOiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29t
Lz91cmw9aHR0cHMlM0ElMkYlMkZsb3JlLmtlcm5lbC5vcmclMkZyJTJGMjAyNTA2MTEtdmRzby1h
YnNvbHV0ZS1yZWxvYy12My0wLTQ3ODk3ZDczNzg0YiU0MGxpbnV0cm9uaXguZGUmZGF0YT0wNSU3
QzAyJTdDY2hyaXN0b3BoZS5sZXJveSU0MGNzZ3JvdXAuZXUlN0MzZjAzZjY3NDczMjU0NTFlZTk4
ODA4ZGRkOTYzNGYyNyU3QzhiODdhZjdkODY0NzRkYzc4ZGY0NWY2OWEyMDExYmI1JTdDMCU3QzAl
N0M2Mzg5MDU3NDI3NDk1ODQzNjklN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKRmJYQjBlVTFo
Y0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFXNHpNaUlzSWtGT0lqb2lU
V0ZwYkNJc0lsZFVJam95ZlElM0QlM0QlN0MwJTdDJTdDJTdDJnNkYXRhPTdOeEFodXRrNklYbCUy
QjNmZTFra1pFemhaejZDV3llJTJGVkFjRk8lMkJndFM0dW8lM0QmcmVzZXJ2ZWQ9MAo+IAo+IENo
YW5nZXMgaW4gdjM6Cj4gLSBEcm9wIGFscmVhZHkgYXBwbGllZCBidWdmaXggZm9yIGFybTY0Cj4g
LSBEaXNhYmxlIExUTyBmb3IgdGhlIHJpc2N2IHZEU08sIGFzIGl0IGlzIGluY29tcGF0aWJsZQo+
IC0gTGluayB0byB2MjogaHR0cHM6Ly9ldXIwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGciUyRjIwMjUwNDMwLXZk
c28tYWJzb2x1dGUtcmVsb2MtdjItMC01ZWZjYzNiYzRiMjYlNDBsaW51dHJvbml4LmRlJmRhdGE9
MDUlN0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdDM2YwM2Y2NzQ3MzI1NDUx
ZWU5ODgwOGRkZDk2MzRmMjclN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAl
N0MwJTdDNjM4OTA1NzQyNzQ5NjAwNTQ2JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIw
ZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9J
am9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZzZGF0YT11djBxTVM1cXEw
RG92TEh0eGZSdlQ0MmF0YkpFa3p0eWxwT1M4enQ2Yko0JTNEJnJlc2VydmVkPTAKPiAKPiBDaGFu
Z2VzIGluIHYyOgo+IC0gTGluayB0byBvcGVuZW5kIChpbnZhbGlkKSBHQ0MgYnVnIGNvbnRhaW5p
bmcgbW9yZSBleHBsYW5hdGlvbnMKPiAtIFJlZmluZSBjb21taXQgbWVzc2FnZXMKPiAtIERvbid0
IGZhaWwgb24gY29tbWl0IGFic29sdXRlIHJlbG9jYXRpb25zIGluIGRlYnVnIGluZm8KPiAtIExp
bmsgdG8gdjE6IGh0dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRnIlMkYyMDI1MDQyOS12ZHNvLWFi
c29sdXRlLXJlbG9jLXYxLTAtOTg3YTBhZmQxMGI1JTQwbGludXRyb25peC5kZSZkYXRhPTA1JTdD
MDIlN0NjaHJpc3RvcGhlLmxlcm95JTQwY3Nncm91cC5ldSU3QzNmMDNmNjc0NzMyNTQ1MWVlOTg4
MDhkZGQ5NjM0ZjI3JTdDOGI4N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5YTIwMTFiYjUlN0MwJTdDMCU3
QzYzODkwNTc0Mjc0OTYxNjA1NyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhj
R2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRX
RnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9SzVpd296MFhxYzhraGVv
dFdFYzRNMktyWjdVVk1ET2JPeUZmQ1BqNE44USUzRCZyZXNlcnZlZD0wCj4gCj4gLS0tCj4gVGhv
bWFzIFdlacOfc2NodWggKDI0KToKPiAgICAgICAgZWxmLCB1YXBpOiBBZGQgYSBoZWFkZXIgZm9y
IHJlbG9jYXRpb24gY29uc3RhbnRzCj4gICAgICAgIHg4Ni9lbGYsIHVtL3g4Ni9lbGY6IE1vdmUg
cmVsb2NhdGlvbiBjb25zdGFudHMgdG8gVUFQSQo+ICAgICAgICBBUk06IGVsZjogTW92ZSByZWxv
Y2F0aW9uIGNvbnN0YW50cyB0byBVQVBJCj4gICAgICAgIGFybTY0OiBlbGY6IE1vdmUgcmVsb2Nh
dGlvbiBjb25zdGFudHMgdG8gVUFQSQo+ICAgICAgICBwb3dlcnBjL2VsZjogTW92ZSByZWxvY2F0
aW9uIGNvbnN0YW50cyB0byBVQVBJCj4gICAgICAgIHJpc2N2OiBlbGY6IE1vdmUgcmVsb2NhdGlv
biBjb25zdGFudHMgdG8gVUFQSQo+ICAgICAgICBMb29uZ0FyY2g6IE1vdmUgcmVsb2NhdGlvbiBj
b25zdGFudHMgdG8gVUFQSQo+ICAgICAgICBzMzkwL2VsZjogTW92ZSByZWxvY2F0aW9uIGNvbnN0
YW50cyB0byBVQVBJCj4gICAgICAgIE1JUFM6IEVMRjogTW92ZSByZWxvY2F0aW9uIGNvbnN0YW50
cyB0byBVQVBJCj4gICAgICAgIHRvb2xzIGhlYWRlcnMgVUFQSTogU3luYyBFTEYgaGVhZGVycyB3
aXRoIHRoZSBrZXJuZWwgc291cmNlcwo+ICAgICAgICB2ZHNvOiBBZGQgdGhlIHZkc29jaGVjayB0
b29sCj4gICAgICAgIHg4Ni92ZHNvOiBFbmFibGUgdGhlIHZkc29jaGVjayB0b29sCj4gICAgICAg
IEFSTTogdmRzbzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAo+ICAgICAgICBhcm02NDogdmRz
bzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAo+ICAgICAgICBwb3dlcnBjL2VsZjogQWRkIDMy
LWJpdCBSRUwxNiByZWxvY2F0aW9uIGRlZmluaXRpb25zCj4gICAgICAgIHBvd2VycGMvdmRzbzog
RW5hYmxlIHRoZSB2ZHNvY2hlY2sgdG9vbAo+ICAgICAgICByaXNjdjogdmRzbzogRGVkdXBsaWNh
dGUgQ0ZMQUdTX1JFTU9WRV8qIHZhcmlhYmxlcwo+ICAgICAgICByaXNjdjogdmRzbzogRGlzYWJs
ZSBMVE8gZm9yIHRoZSB2RFNPCj4gICAgICAgIHJpc2N2OiB2ZHNvOiBFbmFibGUgdGhlIHZkc29j
aGVjayB0b29sCj4gICAgICAgIExvb25nQXJjaDogdkRTTzogRW5hYmxlIHRoZSB2ZHNvY2hlY2sg
dG9vbAo+ICAgICAgICBzMzkwL3Zkc286IEVuYWJsZSB0aGUgdmRzb2NoZWNrIHRvb2wKPiAgICAg
ICAgTUlQUzogRUxGOiBBZGQgbW9yZSBQQy1yZWxhdGl2ZSByZWxvY2F0aW9uIGRlZmluaXRpb25z
Cj4gICAgICAgIE1JUFM6IHZkc286IEVuYWJsZSB0aGUgdmRzb2NoZWNrIHRvb2wKPiAgICAgICAg
dmRzby92ZHNvY2hlY2s6IERyb3AgdGhlIHRyYW5zaXRpb25hbCBrY29uZmlnIG9wdGlvbgo+IAo+
ICAgYXJjaC9hcm0vaW5jbHVkZS9hc20vZWxmLmggICAgICAgICAgfCAgMjQgLS0KPiAgIGFyY2gv
YXJtL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgIHwgICA0ICstCj4gICBhcmNoL2FybTY0L2lu
Y2x1ZGUvYXNtL2VsZi5oICAgICAgICB8ICA1NSAtLS0tCj4gICBhcmNoL2FybTY0L2tlcm5lbC92
ZHNvL01ha2VmaWxlICAgICB8ICAgNCArLQo+ICAgYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20v
ZWxmLmggICAgfCAxMDAgLS0tLS0tCj4gICBhcmNoL2xvb25nYXJjaC92ZHNvL01ha2VmaWxlICAg
ICAgICB8ICAgNCArLQo+ICAgYXJjaC9taXBzL2luY2x1ZGUvYXNtL2VsZi5oICAgICAgICAgfCAg
NTMgLS0tCj4gICBhcmNoL21pcHMvdmRzby9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgOCArLQo+
ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvdWFwaS9hc20vZWxmLmggfCAyMDEgLS0tLS0tLS0tLS0t
Cj4gICBhcmNoL3Bvd2VycGMva2VybmVsL3Zkc28vTWFrZWZpbGUgICB8ICAgNCArLQo+ICAgYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2VsZi5oICAgfCAgNjYgLS0tLQo+ICAgYXJjaC9yaXNj
di9rZXJuZWwvdmRzby9NYWtlZmlsZSAgICAgfCAgMTEgKy0KPiAgIGFyY2gvczM5MC9pbmNsdWRl
L2FzbS9lbGYuaCAgICAgICAgIHwgIDgzIC0tLS0tCj4gICBhcmNoL3MzOTAva2VybmVsL3Zkc28z
Mi9NYWtlZmlsZSAgICB8ICAgNCArLQo+ICAgYXJjaC9zMzkwL2tlcm5lbC92ZHNvNjQvTWFrZWZp
bGUgICAgfCAgIDQgKy0KPiAgIGFyY2gveDg2L2VudHJ5L3Zkc28vTWFrZWZpbGUgICAgICAgIHwg
ICA2ICstCj4gICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9lbGYuaCAgICAgICAgICB8ICAzNCAtLQo+
ICAgYXJjaC94ODYvdW0vYXNtL2VsZi5oICAgICAgICAgICAgICAgfCAgMzMgLS0KPiAgIGluY2x1
ZGUvdWFwaS9saW51eC9lbGYtci5oICAgICAgICAgIHwgNjMxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oICAgICAgICAgICAg
fCAgIDEgKwo+ICAgbGliL3Zkc28vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+
ICAgbGliL3Zkc28vTWFrZWZpbGUuaW5jbHVkZSAgICAgICAgICAgfCAgMTcgKwo+ICAgbGliL3Zk
c28vY2hlY2svLmdpdGlnbm9yZSAgICAgICAgICAgfCAgIDMgKwo+ICAgbGliL3Zkc28vY2hlY2sv
TWFrZWZpbGUgICAgICAgICAgICAgfCAgMjggKysKPiAgIGxpYi92ZHNvL2NoZWNrL2VsZi5ycyAg
ICAgICAgICAgICAgIHwgNDg4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgIGxpYi92
ZHNvL2NoZWNrL3Zkc29jaGVjay5ycyAgICAgICAgIHwgMjc5ICsrKysrKysrKysrKysrKysKPiAg
IHRvb2xzL2luY2x1ZGUvdWFwaS9saW51eC9lbGYtZW0uaCAgIHwgIDcxICsrKysKPiAgIHRvb2xz
L2luY2x1ZGUvdWFwaS9saW51eC9lbGYtci5oICAgIHwgNjMxICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAgdG9vbHMvaW5jbHVkZS91YXBpL2xpbnV4L2VsZi5oICAgICAg
fCAxMTIgKysrKysrLQo+ICAgMjkgZmlsZXMgY2hhbmdlZCwgMjI3NyBpbnNlcnRpb25zKCspLCA2
ODQgZGVsZXRpb25zKC0pCj4gLS0tCj4gYmFzZS1jb21taXQ6IDUxODBjNjUyNmFjYzlmMWNiNThm
OGIxMWZiYTY3NTgzYzIyZTA4NTQKPiBjaGFuZ2UtaWQ6IDIwMjUwNDI4LXZkc28tYWJzb2x1dGUt
cmVsb2MtYTIyNjI5M2MxNzYxCj4gCj4gQmVzdCByZWdhcmRzLAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
