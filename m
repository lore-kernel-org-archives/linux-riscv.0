Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A57C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 22:17:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C8FB2133D
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 22:17:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MjsNFqD7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C8FB2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tPW5uGm70t21TOp1JtJMx/j7I5qB7sTDh16/xaCHzqM=; b=MjsNFqD7rMsnvb9+nUGzzc1rN
	9Xr63jo6CVXkH4ntmpN3yMM2zkBKK/AxpiKlOM9G1BmBs6NvBO/LIx0yW0zGrYMzyAnNnZYAcm5XA
	Z6ZNB7NPhgeB8eQwZobSrxFxxJzQgVLBqpaWo2t0/Gt4sXWjLU8TFTAthe2R0JwWGuk0Ty8xy5gYz
	Qno9agi8gxU+Xp9BGHYDm7Cu4P7MoPlUeUWkNbaMPqlg94Uos0J8ZXrGJm3K5DFpI/Gc6uUAORdHh
	gfvn9E2dntD5LAq0be4XouuBMXcp2UGgAQ083Fblqm36fwR7YIBd5EjgLoXHc156Q3LXkC+F07CmF
	nBOr751jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8BQs-0003X1-Ht; Sun, 24 Mar 2019 22:17:34 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8BQp-0003Vp-2S
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 22:17:33 +0000
Received: from av1.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 x2OMHBrd013639; Sun, 24 Mar 2019 22:17:13 GMT
X-AuditID: 8b5b9d4d-8f5ff7000000235c-53-5c9801e7e551
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.1.35])
 by av1.ics.forth.gr (SMTP Outbound / FORTH / ICS) with SMTP id
 E2.D9.09052.7E1089C5; Mon, 25 Mar 2019 00:17:11 +0200 (EET)
Received: from webmail.ics.forth.gr (localhost [127.0.0.1])
 by enigma.ics.forth.gr (8.15.1//ICS-FORTH/V10.5.0C-EXTNULL-SSL-SASL) with
 ESMTP id x2OMHA54006125; Mon, 25 Mar 2019 00:17:10 +0200
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Mon, 25 Mar 2019 00:17:10 +0200
From: Nick Kossifidis <mick@ics.forth.gr>
To: Atish Patra <Atish.Patra@wdc.com>
Subject: Re: Thoughts on kexec / SBI
Organization: FORTH
In-Reply-To: <6948FE9F-68BE-448A-A8B5-A293C297B088@wdc.com>
References: <032c5254b0fa91f401fc67169b8d9141@mailhost.ics.forth.gr>
 <6948FE9F-68BE-448A-A8B5-A293C297B088@wdc.com>
Message-ID: <a6d39352e96bfc95574250a303e23809@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.1.2
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrALMWRmVeSWpSXmKPExsXSHc2orPuccUaMwYXVohZPPkxks1i04juL
 xbbPLWwWze/OsVtsnrCA1YHV4+GmS0wem5fUe1xqvs7u0X6gmymAJYrLJiU1J7MstUjfLoEr
 4+b1h2wFr+Uq2p8+YG5g3CXRxcjBISFgIvFph0sXIxeHkMBhRok5B6YyQjiHGCW2vlrK0sXI
 CVRkKjF7bycjiM0rIChxcuYTsDizgIXE1Cv7GSFseYnmrbOZQWwWAVWJt+9Xg8XZBDQl5l86
 CFYvAhQ/23OEBWQBs0Aro0TzoTVgCWEBFYm5J6+wgtj8AsISn+5eBLM5Bawldvw9D2YLCZRK
 vOk9yw5xhIvE3UdH2SCOU5H48PsBWFxUQFnixYnprBMYhWYhuXUWkltnIbl1ASPzKkaBxDJj
 vczkYr20/KKSDL30ok2M4HCf67uD8dwC+0OMAhyMSjy8K2b0xwixJpYVV+YCQ4aDWUmE194T
 KMSbklhZlVqUH19UmpNafIhRmoNFSZz38IvwICGB9MSS1OzU1ILUIpgsEwenVAPjWreredVO
 kxj4j93pPifvLz5LnWGbv2PLEwvG1nyv3XOkVh+ynReUJXC/2rjKmlvHIP1d1BrWwOWCD5IV
 1JKnrRd6ZzTtTi1H3Lltol0mUwQyV7fdfHnxXO+e3c8NV4ofcc/JunjJ5JKQ/pfIPpEz1ZYL
 76d1vRSUuzvN7Q3L3Qmvn6bcYzFUYinOSDTUYi4qTgQAPzzLq3MCAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Sun, 24 Mar 2019 22:17:13 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av1.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Sun, 24 Mar 2019 22:17:13 +0000 (GMT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_151731_498900_A48F57D1 
X-CRM114-Status: GOOD (  22.24  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Anup Patel <Anup.Patel@wdc.com>,
 linux-riscv@lists.infradead.org, palmer@sifive.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gQXRpc2gsCgrOo8+EzrnPgiAyMDE5LTAzLTI0IDAwOjMxLCBBdGlzaCBQYXRyYSDOrc6z
z4HOsc+IzrU6Cj4gSGkgTmljaywKPiAKPiBPbiBNYXIgMjMsIDIwMTksIGF0IDExOjA1IEFNLCBO
aWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+IHdyb3RlOgo+IAo+PiBIZWxsbyBh
bGwsCj4+IAo+PiBJJ20gd29ya2luZyBvbiBpbXBsZW1lbnRpbmcga2V4ZWMgb24gUklTQy1WIChq
dXN0IGtleGVjIGZvciBub3csIG5vdAo+PiBrZHVtcCB5ZXQpIHNpbmNlIHdlIHdhbnQgdG8gYmUg
YWJsZSB0byB0ZXN0IG5ldyBrZXJuZWwgaW1hZ2VzIGVhc2lseQo+PiBvbiBvdXIgdGVzdGJlZHMu
IEl0J3MgcGFydCBvZiBhIGxhcmdlciBwcm9qZWN0IHdoZXJlIEknbSB0cnlpbmcgdG8KPj4gaGF2
ZSBhIHVuaWZpZWQgd2F5IG9mIHRlc3RpbmcgdmFyaW91cyBsaW51eC1jYXBhYmxlIFJJU0MtViB0
YXJnZXRzCj4+IChodHRwczovL2dpdGh1Yi5jb20vbWlja2ZsZW1tL3lhcnZ0IFsxXSkgdGhhdCB3
ZSBoYXZlIG9uIHRoZSBsYWIuCj4gCj4gR3JlYXQuIFRoaXMgcmVwbyB3aWxsIGJlIHZlcnkgaGVs
cGZ1bCB0byBiZWdpbm5lcnMuIEkgaGFkIGEgcXVpY2sgbG9vawo+IGF0IHRoZSBzaWZpdmUtZnU1
NDAvY29tbWFuZHMuc2guCj4gb2JqY29weSBzdGVwIGlzIHJlZHVuZGFudCBmb3IgT3BlblNCSSBh
cyBpdCBhbHJlYWR5IGdlbmVyYXRlcyB0aGUKPiBmd19wYXlsb2FkLmJpbiBhcyB3ZWxsLgo+IAoK
SSBob3BlIHNvLCB0aGFua3MgZm9yIHRoZSB1cGRhdGUsIEkgcHJlZmVyIGl0IHRoaXMgd2F5IHNp
bmNlIGl0IHNob3dzIApob3cgdGhlIC5iaW4gaXMgZ2VuZXJhdGVkLgoKPj4gVGhlIGlzc3VlIGlz
IHRoYXQgd2UgZG9uJ3QgaGF2ZSBhIHdheSBvZiBzdG9wcGluZyB0aGUgc2Vjb25kYXJ5Cj4+IGhh
cnRzIGluIGEgcmVjb3ZlcmFibGUgd2F5LCBzbyBhdCB0aGlzIHBvaW50IEkgaGF2ZSB0d28gb3B0
aW9ucywKPj4gZWl0aGVyIEknbSBnb2luZyB0byBjYWxsIHNtcF9zZW5kX3N0b3AoKSBvbiBtYWNo
aW5lX3NodXRkb3duKCkgYW5kCj4+IGNvbWUgYmFjayBmcm9tIGtleGVjIHdpdGggYSBzaW5nbGUg
aGFydCBydW5uaW5nICh3aGljaCBzaG91bGQgYmUKPj4gZmluZSBmb3Iga2R1bXAgYnR3KSwgb3Ig
SSBuZWVkIHRvIGhhdmUgYSByZXNlcnZlZCBtZW1vcnkgc3BhY2Ugd2hlcmUKPj4gSSdsbCBoYXZl
IHRvIGtlZXAgc29tZSBjb2RlIHRvIGJlIGV4ZWN1dGVkIGJ5IHRoZSBzZWNvbmRhcnkgaGFydHMs
Cj4+IHRoYXQgd2lsbCBiZSBwYXRjaGVkIGJ5IHRoZSBib290IGhhcnQgb25jZSB0aGUgbmV3IGtl
cm5lbCBpcyBpbgo+PiBwbGFjZSwgdG8gbGV0IHRoZW0gZXhlY3V0ZSB0aGUgbmV3IGtlcm5lbC4g
VGhlIHNlY29uZCBvcHRpb24gaXMgdG9vCj4+IGNvbXBsaWNhdGVkIGZvciBubyByZWFzb24gYW5k
IGl0IGFsc28gcmVkdWNlcyB0aGUgZmxleGliaWxpdHkgb2YgdGhlCj4+IHByb2Nlc3Mgc2luY2Ug
d2UgY2FuJ3QgdXNlIHRoZSB3aG9sZSBSQU0gZm9yIHRoZSBsb2FkZWQga2ltYWdlLCBwbHVzCj4+
IGl0IHdpbGwgYmUgb2Jzb2xldGUgd2hlbiB3ZSBoYXZlIHByb3BlciBoYW5kbGluZyBvZiBDUFUg
c3VzcGVuZCAvCj4+IHBlci1oYXJ0IHJlc2V0LCB0aHJvdWdoIFNCSS4gU28gSSdtIGdvaW5nIGZv
ciB0aGUgZmlyc3Qgb3B0aW9uIHVudGlsCj4+IHRoZW4uCj4+IAo+PiBJJ2QgbGlrZSB0byBqdW1w
LXN0YXJ0IHRoZSBkaXNjdXNzaW9uIG9uIGhvdyB3ZSBjYW4gaGFuZGxlIHRoaW5ncwo+PiB0aHJv
dWdoIFNCSSwgbXkgaW5pdGlhbCB0aHJvdWdoIHdhcyB0aGlzOgo+PiAKPj4gYSkgSGF2ZSBhIG5l
dyBJUEkgY29kZSBJUElfU1VTUEVORCwgaGFuZGxlZCBieSB0aGUgZmlybXdhcmUgKGl0cwo+PiBj
b2RlL2RhdGEgaXMgcGVyc2lzdGVudCBhY3Jvc3Mga2V4ZWNzKSwgdGhhdCBwdXRzIHRoZSBoYXJ0
IG9uIGEgd2ZpCj4+IGxvb3AsIGNoZWNraW5nIGZvciBhIHZhcmlhYmxlIHRoYXQgY29udGFpbnMg
dGhlIG5ldyB2aXJ0dWFsIGFkZHJlc3MKPj4gdG8ganVtcCB0byAod2hlcmUgdGhlIG5ldyBrZXJu
ZWwgaXMgbG9jYXRlZCkgb24gdGhpcyBoYXJ0J3Mgc2NyYXRjaAo+PiBidWZmZXIuIEFsdGVybmF0
aXZlbHkgdGhpcyBjYWxsIG1heSBkbyBwb3dlciBtYW5hZ2VtZW50IGFuZAo+PiBjb21wbGV0ZWx5
IHNodXQgZG93biB0aGUgQ1BVLCBpZiB0aGUgaGFyZHdhcmUgc3VwcG9ydHMgdGhpcy4KPj4gCj4+
IGIpIEhhdmUgYW5vdGhlciBJUEkgY29kZSBJUElfUkVTVU1FLCB0aGF0IHdha2VzIHVwIHRoZSBo
YXJ0cyBieQo+PiBwcm92aWRpbmcgdGhlbSB3aXRoIHRoZSB2aXJ0dWFsIGFkZHJlc3MgdG8ganVt
cCB0by4gVGhpcyBjYW4gYmUgYQo+PiBzaW1wbGUgd3JpdGUgb2YgdGhlIG5ldyBhZGRyZXNzIG9u
IHRoZSByZW1vdGUgaGFydCdzIHNjcmF0Y2ggYnVmZmVyCj4+ICsgaW50ZXJydXB0LCBvciBpdCBj
YW4gdXNlIHBvd2VyIG1hbmFnZW1lbnQgdG8gcG93ZXIgdXAgdGhlIGhhcnQgYW5kCj4+IGVpdGhl
ciBwcm92aWRlIGl0IHdpdGggYSBuZXcgcmVzZXQgdmVjdG9yLCBvciBkbyBzb21lIGhhbmRsaW5n
IG9uCj4+IHRoZSBCb290Uk9NIGNvZGUgZm9yIHRoYXQgKHRoaXMgYnR3IGlzIGFsc28gYW4gb3Bl
biBkaXNjdXNzaW9uIG9uCj4+IHRoZSBURUUgZ3JvdXAgd2hlcmUgd2UgYXJlIGRpc2N1c3Npbmcg
U2VjdXJlIEJvb3QpLiBBbHNvIGluIGNhc2UgdGhlCj4+IGhhcnQgaXMgYWxyZWFkeSBydW5uaW5n
IChhbiBJUElfU1VTUEVORCBoYXNuJ3QgYmVlbiBzZW50IG9uIGl0Cj4+IGJlZm9yZSwgZS5nLiBk
dXJpbmcgYm9vdCksIHRoZSBmaXJtd2FyZSB3aWxsIGlnbm9yZSB0aGUgZXZlbnQsCj4+IGFsdGVy
bmF0aXZlbHkgd2UgbWF5IGNhbGwgSVBJX1NVU1BFTkQgb24gdGhlIGZpcm13YXJlIGR1cmluZyBi
b290IHNvCj4+IHRoYXQgdGhlIGJvb3QgcHJvY2VzcyBoYXBwZW5zIHdpdGggYSBzaW5nbGUgaGFy
dCBhbmQgb3RoZXIgaGFydHMKPj4gd2FpdCBmb3IgdGhlIE9TIHRvIHdha2UgdGhlbSB1cC4KPiAK
PiBMb29rcyBnb29kIHRvIG1lLiBJIGhhZCBzaW1pbGFyIElQSSBhcHByb2FjaChJUEkgV0FLRVVQ
KSBmb3IgY3B1Cj4gaG90cGx1ZyBpbXBsZW1lbnRhdGlvbiBleGNlcHQgdGhlIHJlc3VtZSBhZGRy
ZXNzIHJlcXVpcmVtZW50Lgo+IGh0dHBzOi8vbGttbC5vcmcvbGttbC8yMDE4LzkvNi8yMTQgWzJd
Cj4gCj4gVGhlIG9ubHkgaXNzdWUgaXMgdGhhdCB3aXRoIGFsbCB0aGlzIElQSXMgd2lsbCBiZSBy
ZWR1bmRhbnQgd2hlbiBoYXJ0Cj4gcG93ZXIgbWFuYWdlbWVudCBTQkkgZXh0ZW5zaW9uIChhIG11
Y2ggY2xlYW5lciBpbnRlcmZhY2UpIHdpbGwgYmUKPiBhdmFpbGFibGUuIE15IGhvdHBsdWcgcGF0
Y2ggaXMgb24gaG9sZCBiZWNhdXNlIG9mIHRoYXQgcmVhc29uIGFzIHdlbGwuCj4gCj4gCj4gUmVn
YXJkcywKPiBBdGlzaAo+IAoKTXkgcHJvcG9zYWwgaXMgYWJvdXQgdGhlIG5ldyBTQkkgQVBJL2V4
dGVuc2lvbiwgYXMgSSBtZW50aW9uIHRoZXNlIElQSSAKY2FsbHMgaSdtIHRhbGtpbmcgYWJvdXQg
bmVlZCB0byBiZSBpbXBsZW1lbnRlZCBvbiB0aGUgZmlybXdhcmUgc2lkZSwgCnRoZXkgd29uJ3Qg
YmUgaGFuZGxlZCBieSB0aGUgT1MgbGlrZSBJUElfU09GVC4gU28gc2luY2UgeW91IHByZWZlciB0
byAKaGF2ZSBzZXBhcmF0ZSBjYWxscyBmb3IgZWFjaCBvZiB0aGUgaGFydCBzdGF0ZXMgdGhlIGlk
ZWEgaXM6CgpzYmlfaGFydF9zdXNwZW5kKGNwdW1hc2spIC0+IHNlbmQgYW4gSVBJX1NVU1BFTkQg
dG8gY3B1cyBvbiBjcHVtYXNrCnNiaV9oYXJ0X3Jlc3VtZShjcHVtYXNrKSAtPiBzZW5kIGFuIElQ
SV9SRVNVTUUgdG8gY3B1cyBvbiBjcHVtYXNrCgpSZWdhcmRzLApOaWNrCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
