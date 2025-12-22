Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14299E67482
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 10:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=990QFeR/XP5qr6cWXjM/Xta8aCH5SDjQs3tqLDiNfUA=; b=NnCXWydAo4CEQ4
	uaBdSJ7ZdMRb3SREIXa3bAH4aUvejhEHNiDQd0iNW6JId0/O9l/zcaZ85oBkU1wZclJo6UYbx2404
	rlMchjNu1istt28k66WTH96KBfZXvDcIH02ztab3vpDZjeWg+gpuKXRGnh6I3nv1xGJ+Z8pbc3I7V
	2d4Abn3xh48HMBATTVAlXYyLuSZu0hKTkkKiMwDSwfCOrLWT2+73tyc4bBxa9RWMkdYMxe94X8I0J
	wIkEF5Ak8XG/c9q/y78n3EVammUeYXSR9lCA0yR6zmfpeheLN59s3fbBxhxv04p6loJMtYZO9qHgY
	bcwHvEqhcKYRv4E9fX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdZ3-0000000DeNW-203z;
	Mon, 22 Dec 2025 10:54:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXdZ0-0000000DeN2-36Zu
	for linux-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 10:54:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0811B42E47;
	Mon, 22 Dec 2025 10:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6255C4CEF1;
	Mon, 22 Dec 2025 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766400892;
	bh=cv/VTMXLxul+HjudSJW7wkMxfJdfBr+el6AQMlItv9w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TBbcOWnSr19MwF0MKrCb2IoabYD0Nb+Hare+gEpTLzqusRx2+g7sBBoVWN7mXfVuZ
	 9g48PR844JLrnIVBXNJDcPRzZ9OqZquI7XiHNGeRwHRykZYpEycTOUpmGN0z4nW/2x
	 exNm6rPf3N4LEfbJUmfd492tMzcaecLPdXqfDuC4XviG8bw0zrKfc340q+uV2v7A31
	 tSGddRTWmUAG4XhmWs/NugkfoosrV9ks7Kz30Zoom9Se8/nzViTi1v4hjixSRy25gU
	 EU0bg8YbcDJPHiMekaav/bto5jUZ768ihhxepiBF9REEAyupmmRO5IMAzEtlO7J7ps
	 8hPuYpgjOVq+g==
Message-ID: <e97c41cd-44f7-4560-bc75-79283a438e91@kernel.org>
Date: Mon, 22 Dec 2025 11:54:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages
 are unsupported
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Borislav Petkov <bp@alien8.de>, Heiko Carstens <hca@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>,
 Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
 <87a4zcml36.ritesh.list@gmail.com>
 <655cc605-2ce1-4ccb-8cc0-a0a31a9c89fd@kernel.org>
 <87fr93ky5i.ritesh.list@gmail.com>
 <16fef7a5-6853-4a6f-8d27-e005fa351eb7@linux.ibm.com>
 <051628be-ed70-4a56-8704-f2b8cdea1984@kernel.org>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <051628be-ed70-4a56-8704-f2b8cdea1984@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_025454_844439_A1C754FE 
X-CRM114-Status: GOOD (  20.50  )
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

CgpMZSAyMi8xMi8yMDI1IMOgIDExOjI4LCBEYXZpZCBIaWxkZW5icmFuZCAoUmVkIEhhdCkgYSDD
qWNyaXTCoDoKPiBPbiAxMi8yMi8yNSAwNjo1NywgU291cmFiaCBKYWluIHdyb3RlOgo+Pgo+Pgo+
PiBPbiAyMi8xMi8yNSAwODo0MiwgUml0ZXNoIEhhcmphbmkgKElCTSkgd3JvdGU6Cj4+PiAiRGF2
aWQgSGlsZGVuYnJhbmQgKFJlZCBIYXQpIiA8ZGF2aWRAa2VybmVsLm9yZz4gd3JpdGVzOgo+Pj4K
Pj4+Pj4gQ29taW5nIGJhY2sgdG8gdGhlIGZpeGVzIHRhZy4gSSBkaWQgbWVudGlvbiBhIGJpdCBv
ZiBhIGhpc3RvcnkgWzJdIG9mCj4+Pj4+IHdoYXRldmVyIEkgY291bGQgZmluZCB3aGlsZSByZXZp
ZXdpbmcgdGhpcyBwYXRjaC4gSSBhbSBub3Qgc3VyZSAKPj4+Pj4gd2hldGhlcgo+Pj4+PiB5b3Ug
aGF2ZSBsb29rZWQgaW50byB0aGUgbGlua3Mgc2hhcmVkIGluIHRoYXQgZW1haWwgb3Igbm90LiBI
ZXJlIFsyXToKPj4+Pj4KPj4+Pj4gWzJdOiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz8gCj4+Pj4+IHVybD1odHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9y
ZyUyRmxpbnV4cHBjLSAKPj4+Pj4gZGV2JTJGODc1eGEza3N6OS5yaXRlc2gubGlzdCU0MGdtYWls
LmNvbSUyRiZkYXRhPTA1JTdDMDIlN0NjaHJpc3RvcGhlLmxlcm95JTQwY3Nncm91cC5ldSU3Q2Zl
NDBmNDg4MWU4NDQxYWIzZWJmMDhkZTQxNDRlNzQ3JTdDOGI4N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5
YTIwMTFiYjUlN0MwJTdDMCU3QzYzOTAxOTk2MTM3NzA5NjI5MiU3Q1Vua25vd24lN0NUV0ZwYkda
c2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlpT2lJd0xqQXVNREF3TUNJc0lsQWlPaUpY
YVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lmUSUzRCUzRCU3QzAlN0MlN0MlN0Mmc2Rh
dGE9RG52enk1a0olMkJ5RjlHSmpJdyUyQjEyRlRqYVZnZUFNMmdBOWc3aHNZbDdRb2slM0QmcmVz
ZXJ2ZWQ9MAo+Pj4+Pgo+Pj4+PiBXaGVyZSBJIGFtIGNvbWluZyBmcm9tIGlzLi4gVGhlIGN1cnJl
bnQgcGF0Y2ggaXMgYWN1dGFsbHkgYSBwYXJ0aWFsCj4+Pj4+IHJldmVydCBvZiB0aGUgcGF0Y2gg
bWVudGlvbmVkIGluIHRoZSBmaXhlcyB0YWcuIFRoYXQgbWVhbnMgaWYgdGhpcyAKPj4+Pj4gcGF0
Y2gKPj4+Pj4gZ2V0cyBhcHBsaWVkIHRvIHRoZSBvbGRlciBzdGFibGUga2VybmVscywgaXQgd291
bGQgZW5kIHVwIGJyaW5naW5nIHRoZQo+Pj4+PiBzYW1lIHByb2JsZW0gYmFjaywgd2hpY2ggdGhl
ICJGaXhlcyIgdGFnZ2VkIHBhdGNoIGlzIGZpeGluZyBpbiB0aGUgMXN0Cj4+Pj4+IHBsYWNlLCBp
c250JyBpdD8gU2VlIHRoaXMgZGlzY3Vzc2lvbiBbM10uLi4KPj4+Pj4KPj4+Pj4gWzNdOiBodHRw
czovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz8gCj4+Pj4+IHVybD1o
dHRwcyUzQSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRmFsbCUyRmIxZjA0ZjlmLWZhNDYtIAo+Pj4+
PiBjMmEwLTc2OTMtNGEwNjc5ZDJhMWVlJTQwb3JhY2xlLmNvbSUyRlQlMkYlMjNtMGVlZTg3YjQ1
OGQ5MzU1OTQyNmI4YjBlNzhkYzZlYmNkMjZhZDNhZSZkYXRhPTA1JTdDMDIlN0NjaHJpc3RvcGhl
Lmxlcm95JTQwY3Nncm91cC5ldSU3Q2ZlNDBmNDg4MWU4NDQxYWIzZWJmMDhkZTQxNDRlNzQ3JTdD
OGI4N2FmN2Q4NjQ3NGRjNzhkZjQ1ZjY5YTIwMTFiYjUlN0MwJTdDMCU3QzYzOTAxOTk2MTM3NzEx
NzE1MCU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpGYlhCMGVVMWhjR2tpT25SeWRXVXNJbFlp
T2lJd0xqQXVNREF3TUNJc0lsQWlPaUpYYVc0ek1pSXNJa0ZPSWpvaVRXRnBiQ0lzSWxkVUlqb3lm
USUzRCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9Yk9PN0ZHTjRqQXRYM2pqQm5KVnBTdXJtTTlyR216
OHZJczFpR3RibTFnVSUzRCZyZXNlcnZlZD0wCj4+Pj4+Cj4+Pj4+IC4uLiBTbywgSU1PIC0gdGhl
IHJpZ2h0IGZpeGVzIHRhZywgaWYgd2UgaGF2ZSB0byBhZGQsIGl0IHNob3VsZCBiZSB0aGUKPj4+
Pj4gcGF0Y2ggd2hpY2ggbW92ZWQgdGhlIGhwYWdlX3NoaWZ0IGluaXRpYWxpemF0aW9uIHRvIGhh
cHBlbiBlYXJseSAKPj4+Pj4gaS5lLiBpbgo+Pj4+PiBtbXVfZWFybHlfaW5pdF9kZXZ0cmVlLiBU
aGF0IHdvdWxkIGJlIHRoaXMgcGF0Y2ggWzRdOgo+Pj4+Pgo+Pj4+PiBbNF06IGh0dHBzOi8vZXVy
MDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vPyAKPj4+Pj4gdXJsPWh0dHBzJTNB
JTJGJTJGZ2l0Lmtlcm5lbC5vcmclMkZwdWIlMkZzY20lMkZsaW51eCUyRmtlcm5lbCUyRmdpdCUy
RnRvcnZhbGRzJTJGbGludXguZ2l0JTJGY29tbWl0JTJGJTNGaWQlM0QyMzU0YWQyNTJiNjY2OTVi
ZTAyZjRhY2QxOGUzN2JmNjI2NGYwNDY0JmRhdGE9MDUlN0MwMiU3Q2NocmlzdG9waGUubGVyb3kl
NDBjc2dyb3VwLmV1JTdDZmU0MGY0ODgxZTg0NDFhYjNlYmYwOGRlNDE0NGU3NDclN0M4Yjg3YWY3
ZDg2NDc0ZGM3OGRmNDVmNjlhMjAxMWJiNSU3QzAlN0MwJTdDNjM5MDE5OTYxMzc3MTMzODYwJTdD
VW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpB
dU1EQXdNQ0lzSWxBaU9pSlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNE
JTdDMCU3QyU3QyU3QyZzZGF0YT0weVR1RUN5JTJCQkdETGlTTll1cVlIOXhHQk9TeGlSTHhBdFcl
MkZXVFFVJTJGQiUyQkElM0QmcmVzZXJ2ZWQ9MAo+Pj4+Pgo+Pj4+PiBOb3csIGl0J3Mgbm90IHJl
YWxseSB0aGF0IHRoZSBwYXRjaCBbNF0gaGFkIGFueSBpc3N1ZSBhcyBzdWNoLiBCdXQgaXQKPj4+
Pj4gc2VlbXMgbGlrZSwgdGhhdCB0aGUgY3VycmVudCBmaXggY2FuIG9ubHkgYmUgYXBwbGllZCBh
ZnRlciBwYXRjaCAKPj4+Pj4gWzRdIGlzCj4+Pj4+IHRha2VuLgo+Pj4+Pgo+Pj4+PiBEbyB3ZSBh
Z3JlZT8KPj4+PiBJIHRoaW5rIHdlIHNob3VsZCBkb2N1bWVudCBhbGwgdGhhdCBpbiB0aGUgY292
ZXIgbGV0dGVyLCBhbiBkZXNjcmliZQo+Pj4+IHRoYXQgdGhpcyBwYXJ0aWFsIHJldmVydCBpcyBv
bmx5IHBvc3NpYmxlIGFmdGVyIFs0XSwKPj4+IFllcywgSSBhZ3JlZS4gTGV0J3MgYWRkIHRoZSBh
Ym92ZSBkZXRhaWxzIGluIHRoZSBjb21taXQgbXNnLgo+Pj4KPj4+PiBhbmQgdGhhdCB0aGF0IG11
c3QKPj4+PiBiZSBjb25zaWRlcmVkIHdoZW4gYXR0ZW1wdGluZyBhbnkga2luZCBvZiBzdGFibGUg
YmFja3BvcnRzLgo+Pj4gU3VyZS4gSSB3b3VsZCBwcmVmZXIgaWYgd2UgY2hhbmdlIHRoZSBGaXhl
cyB0YWcgdG8gdGhlIG9uZSB3aGljaCBJCj4+PiBwb2ludGVkIGluIGFib3ZlIFs0XSAod2l0aCBl
eHBsYWluYXRpb24gaW4gdGhlIGNvbW1pdCBtc2cpLiBIb3dldmVyIEkgYW0KPj4+IHN0aWxsIG9r
IGlmIHdlIHdvdWxkIGxpa2UgdG8gcmV0YWluIHRoZSBleGlzdGluZyBmaXhlcyB0YWcgYW5kIHNo
b3cgWzRdCj4+PiBhcyBhIGRlcGVuZGVuY3kuCj4+Cj4+IEkgdGhpbmsgd2Ugc2hvdWxkIGtlZXAg
dGhlIGN1cnJlbnQgRml4ZXMgdGFnIHdpdGggYW4gZXhwbGFuYXRpb24gZm9yCj4+IGRlcGVuZGVu
Y3kKPj4gb24gWzFdIGluIHRoZSBjb21taXQgbWVzc2FnZS4KPj4KPj4gV291bGQgYW55b25lIGhh
dmUgYSBkaWZmZXJlbnQgdmlldz8KPiAKPiBXaGF0ZXZlciBpbnRyb2R1Y2VkIHRoZSBpc3N1ZSBz
aG91bGQgYmUgY2FsbGVkIG91dCBpbiB0aGUgRml4ZXMgdGFnOyBpZiAKPiB0aGVyZSBhcmUgZGVw
ZW5kZW5jaWVzIGZvciB0aGUgZml4IHRocm91Z2ggb3RoZXIgcGF0Y2hlcyB0aGF0IHdlcmUgCj4g
YWxyZWFkeSBtZXJnZWQsIHRoYXQgY2FuIGJlIGRvY3VtZW50ZWQgaW4gdGhlIHBhdGNoIGRlc2Ny
aXB0aW9uIAo+IChyZWxldmFudCBmb3Igc3RhYmxlIG9yIGRpc3RybyBiYWNrcG9ydHMgb25seSku
Cj4gCgpXZSBjYW4gYWxzbyB1c2UgdGhlIERlcGVuZHMtb246IHRhZywgc2VlIGZvciBleGVtcGxl
IGNvbW1pdCA5NTE3YjgyZDhkNDIgCigibmJkOiBkZWZlciBjb25maWcgcHV0IGluIHJlY3Zfd29y
ayIpOgoKICAgICBSZXBvcnRlZC1ieTogc3l6Ym90KzU2ZmJmNGM3ZGRmNjVlOTVjN2NjQHN5emth
bGxlci5hcHBzcG90bWFpbC5jb20KICAgICBDbG9zZXM6IApodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvNjkwN2VkY2UuYTcwYTAyMjAuMzczNTFiLjAwMTQuR0FFQGdvb2dsZS5jb20vVC8KICAg
ICBGaXhlczogODdhYWMzYTgwYWY1ICgibmJkOiBtYWtlIHRoZSBjb25maWcgcHV0IGlzIGNhbGxl
ZCBiZWZvcmUgdGhlIApub3RpZnlpbmcgdGhlIHdhaXRlciIpCiAgICAgRGVwZW5kcy1vbjogZTJk
YWVjNDg4YzU3ICgibmJkOiBGaXggaHVuZ3Rhc2sgd2hlbiBuYmRfY29uZmlnX3B1dCIpCiAgICAg
U2lnbmVkLW9mZi1ieTogWmhlbmcgUWl4aW5nIDx6aGVuZ3FpeGluZ0BodWF3ZWkuY29tPgogICAg
IFNpZ25lZC1vZmYtYnk6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4KCgpDaHJpc3RvcGhl
CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
