Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F22CF3185
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 21:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bu7VIwfES1xYt39+qMJSiPOHU1qr4enAhGeKzh4qPGo=; b=rji5f3LOP/o7iM
	g8dv05fX4R2m9Trj4Dmt+UQpXr2p2VXDl6Jc20/zWiwcpG1xcAoQmATT56QSTmBC6xIoGYow30Drx
	QNijsD3SIAr5FO8Vos0F+HMKItvySbGjkUDueA/9QbDf4tn+PJpYdFwLirYc161jIWcV9TeVqB14L
	/y2X519nTc2CZ65V33MKmH8/+VvxfpFtHESzloFRRU+q53/tsbfCJOkXnOEm/v6WOptAXLDHubWBj
	xLHKjJY+A/ELQr9e8hY100h5MUVufD1ecqhaawwg5Pxlked79fzpU+1czdBnOA6mX6hZ0m5yVCRsn
	h9gQvxh5OPKnNIEeDvZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svk5x-000000045nz-3jtH;
	Tue, 01 Oct 2024 21:07:45 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svk5V-000000045lu-2bij
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 21:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=judJbOY3gmU+wKBnWoo2j+cjNS+mbi9MJhISOcMeMas=; b=KgMiJsOB44D7Bt7N277YCr51fT
	axj2lJ+cHvOraJl6kNKZjpAO74Mb1hFctnOxfmtXow/rW9VLXfWq1DWpdUCdiFHMJHqfBJOFPFNbs
	cN6hQuQGfWtNDX5+DlZUr9JZlQYOm3vwErzJInPoSCVIjiZO8wiZ0CDRh2xUF4+EThWOIVf8sRVDY
	9yL8AYz+EPnWRZxkwVDOxtS/qaTk+x1ur9Vgwv3Aj2IYJH/fVYzKPiMo5frNV51rPtxDKGhGejI10
	OLFY/gOEv8pZ142kv4uMoKx7n4AjUrsUoi8qse4BanGAz6qlDQy+0Qlfpiuyls/Y1L/DKW4JHNX/a
	UcHsaTgQ==;
Received: from [63.135.74.212] (helo=[192.168.1.184])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1svk5P-007BML-Bb; Tue, 01 Oct 2024 22:07:12 +0100
Message-ID: <35396a82-83c6-4e3a-a8a5-2499a9c35170@codethink.co.uk>
Date: Tue, 1 Oct 2024 22:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RFC: extern illegal instruction trap and trap RDCYCLE
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
References: <mhng-ac746ffc-8099-447d-a45f-772550f23290@palmer-ri-x1c9>
 <bab6f17a-3e39-4be4-a20e-bbdbbc2e81f8@codethink.co.uk>
 <6ea17387-6efc-49c7-b631-b6a682054d49@rivosinc.com>
 <1bf46ac0-2ab4-44d3-bcf0-7a29ba6380c1@codethink.co.uk>
 <CAHBxVyGAJOXwws92M13vf-=+7Z2Nk0c8VjwsQ_YwMa0y+PgtoQ@mail.gmail.com>
 <2ab33735-8218-4cb4-ae8f-ecca27185f66@ghiti.fr>
 <155ce5f8-083a-40b3-b38c-f01e0fbb5dde@codethink.co.uk>
Content-Language: en-GB
Organization: Codethink Limited.
In-Reply-To: <155ce5f8-083a-40b3-b38c-f01e0fbb5dde@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_140717_680996_6C8BB676 
X-CRM114-Status: GOOD (  24.08  )
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

T24gMDEvMTAvMjAyNCAyMjowMCwgQmVuIERvb2tzIHdyb3RlOgo+IE9uIDAxLzEwLzIwMjQgMTA6
NDEsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPj4gSGkgQXRpc2gsIEJlbiwKPj4KPj4gT24gMTkv
MDkvMjAyNCAwMToyMywgQXRpc2ggS3VtYXIgUGF0cmEgd3JvdGU6Cj4+PiBPbiBXZWQsIFNlcCAx
OCwgMjAyNCBhdCAyOjU34oCvQU0gQmVuIERvb2tzIDxiZW4uZG9va3NAY29kZXRoaW5rLmNvLnVr
PiAKPj4+IHdyb3RlOgo+Pj4+IE9uIDE4LzA5LzIwMjQgMTA6NTUsIEF0aXNoIFBhdHJhIHdyb3Rl
Ogo+Pj4+PiBPbiA5LzE3LzI0IDc6MDEgQU0sIEJlbiBEb29rcyB3cm90ZToKPj4+Pj4+IE9uIDE3
LzA5LzIwMjQgMTQ6NDYsIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+Pj4+Pj4+IE9uIFR1ZSwgMTcg
U2VwIDIwMjQgMDY6MDg6NTAgUERUICgtMDcwMCksIGJlbi5kb29rc0Bjb2RldGhpbmsuY28udWsK
Pj4+Pj4+PiB3cm90ZToKPj4+Pj4+Pj4gVGhpcyBpcyBhIFJGQyBzZXJpZXMgdG8gY2hhbmdlIGhv
dyB0aGUgaWxsZWdhbCBpbnN0cnVjdGlvbiB0cmFwCj4+Pj4+Pj4+IGlzIGhhbmRsZWQgYW5kIHRo
ZW4gaG93IHRvIHRyYXAgUkRDWUNMRSBhbmQgZW11bGF0ZSBpdCB3aXRoIFJEVElNRQo+Pj4+Pj4+
PiBpbnN0ZWFkLgo+Pj4+Pj4+IE9ubHkgMS8zIG1hZGUgaXQgdG8gbG9yZSBmb3IgbWUsIG5vdCBz
dXJlIGlmIGl0J3MganVzdCBzdHVjayAKPj4+Pj4+PiBzb21ld2hlcmUuCj4+Pj4+Pj4KPj4+Pj4+
Pj4gSSBkaWQgdGhpcyB3aGVuIHdlIGZvdW5kIG11bHRpcGxlIGxpYnJhcmllcyB1c2luZyBSRENZ
Q0xFIGFuZAo+Pj4+Pj4+PiB1cGdyYWRpbmcgbXVsdGlwbGUgcnVubmVycyB0byBuZXdlciBrZXJu
ZWxzIGNhdXNlZCBtYW55IHByb2JsZW1zCj4+Pj4+Pj4gT0ssIHNvIEkgdGhpbmsgd2UncmUga2lu
ZCBvZiBqdXN0IHN0dWNrIHdpdGggUkRDWUNMRSB0aGVuIC0tIGl0IHdhcwo+Pj4+Pj4+IHBhcnQg
b2YgdGhlIGJhc2UgSVNBIHdoZW4gd2UgbWVyZ2VkIHRoZSBwb3J0LCBhbmQgZXZlcnkgdGltZSBp
dAo+Pj4+Pj4+IGRpc2FwcGVhcnMgd2UgZW5kIHVwIGJyZWFraW5nIHVzZXJzcGFjZS4KPj4+Pj4+
IFllcywgaXQgd2FzIGFuIGFubm95YW5jZSwgd2UgbWFuYWdlZCB0byB0cmFjayBkb3duIGFsbCB0
aGUgdXNlcnMgYW5kCj4+Pj4+PiBwYXRjaCBvdXQuCj4+Pj4+Pgo+Pj4+Pj4gSSB0aG91Z2h0IHRo
aXMgbWlnaHQgYmUgYSB1c2VmdWwgaWRlYSBmb3IgbW9yZSBnZW5lcmljIHR5cGUsIHNvIG1pZ2h0
Cj4+Pj4+PiBsb29rIGF0IHVwZGF0aW5nIHRvIGhhdmUgYSB0YWJsZSBvZiBpbnN0cnVjdGlvbiBt
YXNrcyB0byBjYWxsLgo+Pj4+Pj4KPj4+Pj4+PiBJJ20gbm90IHN1cmUgd2hhdCBleGFjdGx5IHRo
ZSByaWdodCB3YXkgdG8gZG8gdGhpcyBpczogSUlSQyB0aGVyZSdzCj4+Pj4+Pj4gc29tZSBwZXJm
LXJlbGF0ZWQgaG9va3MgZm9yIHRoaXMsIGJ1dCB0aGVyZSdzIGFsc28gc3lzdGVtcyB0aGF0IGp1
c3QKPj4+Pj4+PiBkb24ndCBpbXBsZW1lbnQgdGhlIFJEQ1lDTEUgaW5zdHJ1Y3Rpb24gYXQgYWxs
IGFuZCB0aHVzIHdlJ2xsIG5lZWQKPj4+Pj4+PiBzb21lIHNvcnQgb2YgZW11bGF0aW9uIGZvciB0
aG9zZS4KPj4+Pj4+IEkgY291bGRuJ3QgZ2V0IHRoZSBQTVUgZHJpdmVyIHRvIGFsbG93IGl0LCBu
b3Qgc3VyZSBpZiB0aGVyZSB3YXMgYW4KPj4+Pj4+IGlzc3VlIGhpZ2hlciB1cCBvciBzb21lIG90
aGVyIGlzc3VlPwo+Pj4+Pj4KPj4+Pj4gSGVyZSBpcyB0aGUgd2F5IHRvIHByb3Blcmx5IGFsbG93
IGl0IHZpYSB0aGUgZHJpdmVyLgo+Pj4+Pgo+Pj4+PiBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL3N5c2N0bC9rZXJuZWwucnN0Cj4+Pj4+Cj4+Pj4+
IENoZWNrIHRoZSBwZXJmX3VzZXJfYWNjZXNzCj4+Pj4gRGlkbid0IHdvcmsgZm9yIG1lLCBub3Qg
c3VyZSB3aHkKPj4+Pgo+Pj4gK0FsZXhhbmRyZSBHaGl0aQo+Pj4KPj4+IEhtbS4gVGhhdCdzIHdl
aXJkLiBNYXliZSBzb21lIGJ1ZyBjcmVwdCBpbiByZWNlbnRseS4gQ2FuIHlvdSBwcm92aWRlCj4+
PiBzb21lIG1vcmUgZGV0YWlscwo+Pj4gb24gdGhlIHBsYXRmb3JtLCBrZXJuZWwgdmVyc2lvbiBh
bmQgcHJvY2VkdXJlIGZvbGxvd2VkIHRvIGNoYW5nZSBpdCA/Cj4+Cj4+Cj4+IFNvIEkgaGF2ZSBq
dXN0IHRyaWVkIHBlcmZfdXNlcl9hY2Nlc3Mgb24gNi4xMSBhbmQgaXQgd29ya3MgZmluZSwgCj4+
IG1lYW5pbmcgc2V0dGluZyB0aGUgImxlZ2FjeSIgYmVoYXZpb3VyIChpZSAyKSBhbGxvd3MgYSB1
c2Vyc3BhY2UgCj4+IGFwcGxpY2F0aW9uIHRvIGRpcmVjdGx5IGFjY2VzcyBSRENZQ0xFLgo+Pgo+
PiBDYW4geW91IHByb3ZpZGUgbW9yZSBkZXRhaWxzIEJlbj8KPiAKPiBJJ3ZlIGdvbmUgdGhyb3Vn
aCBhbmQgY2hlY2tlZCB0aGlzIGFnYWluLCBJIHRoaW5rIGl0IGlzIHZlcnkgbGlrZWx5Cj4gdGhh
dCBJIGdvdCB0aGUgZW5hYmxlIGFzIDEgaW5zdGVhZCBvZiAyLiBJdCB3b3JrcyBvbiBRRU1VLCBJ
J3ZlIG5vdAo+IGdvdCBhY2Nlc3MgdG8gdGhlIHJ1bm5lcnMgdGhhdCB3ZSB1cGdyYWRlZCBhbmQg
d2UndmUgZml4ZWQgdGhlIGlzc3VlCj4gYnkgdXBncmFkaW5nIGxpYmFic2wgdG8gYSBsYXRlciB2
ZXJzaW9uLgo+IAo+IFRoYW5rcy4KCkFuZCBJIHB1dCBzb21lIHRlc3QgY29kZSB1cCBhdCBJIHVz
ZWQgZm9yIHRlc3RpbmcgbXkgcGF0Y2ggYXQ6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9Db2RldGhpbmtM
YWJzL3Jpc2N2X3JkY3ljbGVfdGVzdAoKCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2Rl
dGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2Vu
aXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
