Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EAECC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 07:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VC205jFUdP5Fn/2GYCAYnB/7rvaHyXz6NzgKlZC5Zgo=; b=MmEkxpPAd8dm3R
	st7sfr3whmv4vvWjSwbb+2OBSNqNdisV4EpV48CFJDlVLcTQus4bOJVZzFerr2jiXuGk/eisujYdJ
	h1y8mBPRaMQXDFWMpo7IKFQCXlbSayWyWnLupOLX7ULSnjfsm979B3SrhuDqFU1OWAwGnMb0tIKuF
	j2HevYyNx6QO89b8E8aWDwJYIKjDtn5V/KIureSV/L0QJp/Hv7ow5g57hxmqKT4UNa4vyaUlpdaFE
	WAuKXRrSWcP2hc5L0XlE2WiamitX2LNp6kCqSaZCMR6XrTp0EBbioYMWljY5NRte8tAJiVNCIhI76
	18qW9YjKw/e13BJagQ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roeiK-0000000FttV-28K8;
	Mon, 25 Mar 2024 07:25:48 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roeiF-0000000FtoN-0dxi
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 07:25:45 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56277240002;
	Mon, 25 Mar 2024 07:25:29 +0000 (UTC)
Message-ID: <1883cf6b-7756-405b-a843-d8ae31e01d61@ghiti.fr>
Date: Mon, 25 Mar 2024 08:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Samuel Holland
 <samuel.holland@sifive.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Andrew Morton
 <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
 guoren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Kemeng Shi <shikemeng@huaweicloud.com>, Matthew Wilcox
 <willy@infradead.org>, Mike Rapoport <rppt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Xiao W Wang
 <xiao.w.wang@intel.com>, Yangyu Chen <cyy@cyyself.name>,
 linux-kernel@vger.kernel.org
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <b0a07878-a9f1-40aa-b177-423b05137d2e@app.fastmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <b0a07878-a9f1-40aa-b177-423b05137d2e@app.fastmail.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_002543_476079_3D5370BD 
X-CRM114-Status: GOOD (  22.47  )
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

SGkgQXJuZCwKCk9uIDI0LzAzLzIwMjQgMjM6MDUsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gT24g
VHVlLCBNYXIgMTksIDIwMjQsIGF0IDE3OjUxLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+IE9u
IDE4LzAzLzIwMjQgMjI6MjksIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+Pj4gT24gMjAyNC0wMy0x
OCAzOjUwIFBNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4+Pj4gT24gV2VkLCBNYXIgMTMsIDIw
MjQgYXQgNzowMOKAr1BNIFNhbXVlbCBIb2xsYW5kCj4+PiBJdCBsb29rcyBsaWtlIHRoZSBjYWxs
IHRvIGZpeHVwX2V4Y2VwdGlvbigpIFthZGRlZAo+Pj4gaW4gNDE2NzIxZmYwNWZkICgicmlzY3Ys
IG1tOiBQZXJmb3JtIEJQRiBleGhhbmRsZXIgZml4dXAgb24gcGFnZSBmYXVsdCIpXSBpcwo+Pj4g
b25seSBpbnRlbmRlZCB0byBjYXRjaCBudWxsIHBvaW50ZXIgZGVyZWZlcmVuY2VzLiBTbyBtYWtp
bmcgdGhlIGNoYW5nZSB3b3VsZG4ndAo+Pj4gaGF2ZSBhbnkgZnVuY3Rpb25hbCBpbXBhY3QsIGJ1
dCBpdCB3b3VsZCBzdGlsbCBiZSBhIHZhbGlkIG9wdGltaXphdGlvbi4KPj4+Cj4+Pj4gT3IgSSB3
YXMgd29uZGVyaW5nIGlmIGl0IHdvdWxkIG5vdCBiZSBiZXR0ZXIgdG8gZG8gbGlrZSB4ODYgYW5k
IHVzZSBhbgo+Pj4+IGFsdGVybmF0aXZlLCBpdCB3b3VsZCBiZSBtb3JlIGNvcnJlY3QgKGV2ZW4g
dGhvdWdoIEkgYmVsaWV2ZSB5b3VyCj4+Pj4gc29sdXRpb24gd29ya3MpCj4+Pj4gaHR0cHM6Ly9l
bGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9hcmNoL3g4Ni9pbmNsdWRlL2Fz
bS9wYWdlXzY0LmgjTDgyLgo+Pj4gV2hhdCB3b3VsZCBiZSB0aGUgYmVuZWZpdCBvZiB1c2luZyBh
biBhbHRlcm5hdGl2ZT8gQW55IGFjY2VzcyB0byBhbiBhZGRyZXNzCj4+PiBiZXR3ZWVuIFRBU0tf
U0laRSBhbmQgVEFTS19TSVpFX01BWCBpcyBndWFyYW50ZWVkIHRvIGdlbmVyYXRlIGEgcGFnZSBm
YXVsdCwgc28KPj4+IHRoZSBvbmx5IGJlbmVmaXQgSSBzZWUgaXMgcmV0dXJuaW5nIC1FRkFVTFQg
c2xpZ2h0bHkgZmFzdGVyIGF0IHRoZSBjb3N0IG9mCj4+PiBhcHBseWluZyBhIGZldyBodW5kcmVk
IGFsdGVybmF0aXZlcyBhdCBib290LiBCdXQgaXQncyBwb3NzaWJsZSBJJ20gbWlzc2luZwo+Pj4g
c29tZXRoaW5nLgo+Pgo+PiBUaGUgdXNlIG9mIGFsdGVybmF0aXZlcyBhbGxvd3MgdG8gcmV0dXJu
IHJpZ2h0IGF3YXkgaWYgdGhlIGJ1ZmZlciBpcwo+PiBiZXlvbmQgdGhlIHVzYWJsZSB1c2VyIGFk
ZHJlc3Mgc3BhY2UsIGFuZCBpdCdzIG5vdCBqdXN0ICJzbGlnaHRseQo+PiBmYXN0ZXIiIGZvciBz
b21lIGNhc2VzIChhIHZlcnkgbGFyZ2UgYnVmZmVyIHdpdGggb25seSBhIGZldyBieXRlcyBiZWlu
Zwo+PiBiZXlvbmQgdGhlIGxpbWl0IG9yIHNvbWVvbmUgY291bGQgZmF1bHQtaW4gYWxsIHRoZSB1
c2VyIHBhZ2VzIGFuZCBmYWlsCj4+IHZlcnkgbGF0ZS4uLmV0YykuIGFjY2Vzc19vaygpIGlzIGhl
cmUgdG8gZ3VhcmFudGVlIHRoYXQgc3VjaCBzaXR1YXRpb25zCj4+IGRvbid0IGhhcHBlbiwgc28g
YWN0dWFsbHkgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byB1c2UgYW4gYWx0ZXJuYXRpdmUgdG8KPj4g
YXZvaWQgdGhhdC4KPiBUaGUgYWNjZXNzX29rKCkgZnVuY3Rpb24gcmVhbGx5IHdhbnRzIGEgY29t
cGlsZS10aW1lIGNvbnN0YW50Cj4gdmFsdWUgZm9yIFRBU0tfU0laRV9NQVggc28gaXQgY2FuIGRv
IGNvbnN0YW50IGZvbGRpbmcgZm9yCj4gcmVwZWF0ZWQgY2FsbHMgaW5zaWRlIG9mIG9uZSBmdW5j
dGlvbiwgc28gZm9yIGNvbmZpZ3VyYXRpb25zCj4gd2l0aCBhIGJvb3QtdGltZSBzZWxlY3RlZCBU
QVNLX1NJWkVfNjQgaXQncyBhbHJlYWR5IG5vdCBpZGVhbCwKPiB3aXRoIG9yIHdpdGhvdXQgYWx0
ZXJuYXRpdmVzLgo+Cj4gSWYgSSByZWFkIHRoZSBjdXJyZW50IGNvZGUgY29ycmVjdGx5LCByaXNj
diBkb2Vzbid0IGV2ZW4KPiBoYXZlIGEgd2F5IHRvIGJ1aWxkIHdpdGggYSBjb21waWxlLXRpbWUg
c2VsZWN0ZWQKPiBWQV9CSVRTL1BHRElSX1NJWkUsIHdoaWNoIGlzIHByb2JhYmx5IGEgYmV0dGVy
IHBsYWNlIHRvCj4gc3RhcnQgb3B0aW1pemluZywgc2luY2UgdGhpcyByYXJlbHkgbmVlZHMgdG8g
YmUgc2VsZWN0ZWQKPiBkeW5hbWljYWxseS4KCgpJbmRlZWQsIHdlIGRvIG5vdCBzdXBwb3J0IGNv
bXBpbGUtdGltZSBmaXhlZCBWQV9CSVRTISBXZSBjb3VsZCwgYnV0IHRoYXQgCndvdWxkIG9ubHkg
YmUgdXNlZCBmb3IgY3VzdG9tIGtlcm5lbHMuIEkgZG9uJ3QgdGhpbmsgZGlzdHJvIGtlcm5lbHMg
d2lsbCAKZXZlciAoPykgcHJvcG9zZSAzIGRpZmZlcmVudCBrZXJuZWxzIGZvciBzdjM5LCBzdjQ4
IGFuZCBzdjU3IGJlY2F1c2UgdGhlIApjb3N0IG9mIGR5bmFtaWNhbGx5IGNob29zaW5nIHRoZSBh
ZGRyZXNzIHNwYWNlIHdpZHRoIGlzIG5vdCBiaWcgZW5vdWdoIAp0byBtZSAoYW5kIHRoZSBidXJk
ZW4gb2YgbWFpbnRhaW5pbmcgMyBkaWZmZXJlbnQga2VybmVscyBpcykuCgpMZXQgbWUga25vdyBp
ZiBJJ20gd3JvbmcsIEknZCBiZSBoYXBweSB0byB3b3JrIG9uIHRoYXQuCgpUaGFua3MsCgpBbGV4
CgoKPgo+ICAgICAgICBBcm5kCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
