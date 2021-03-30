Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D44C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 11:42:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34ACC61964
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 11:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34ACC61964
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0KgXFNneoSDuWqS2OoUTlsPKmRopl807VDwuQDapBDg=; b=AqeUnGIgil7rPs1IdEWXYoLyT
	A/MF/oVt+LfeEQA71WnjWR1Hz89IqWXvXcHNYn9DcdMSzUlOi4Tx5/8IXNvujrurXz4fHQV7m/Dm4
	3RedyHBA0sNMs+wzW8+KBT6lfuec7/6VH+OrdpX0efv/vNnoqlRyi7NejSRCCKrl5cHxBtw9Y9pwj
	xuHINp+ofi007EMgk6FMqW9sNJBGxZ5FrxgW2hhTVRe+IwqgtaxMVJYPuFWtuM8yEs9UQwbOfxUxm
	RLwVuNYDh6zk36KRBSDz0KzPgJgpFmS7eykWV3hpy2QzPUx0fn5pBO3tiDSeb3BPGk/gyG4c8NbsH
	Lraeh0WQQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRCko-003ayL-64; Tue, 30 Mar 2021 11:41:50 +0000
Received: from imap2.colo.codethink.co.uk ([78.40.148.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRCki-003avt-LQ
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 11:41:46 +0000
Received: from [167.98.27.226] (helo=[172.16.102.109])
 by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1lRCkY-00036G-Ma; Tue, 30 Mar 2021 12:41:34 +0100
Subject: Re: [PATCH v4] riscv: evaluate put_user() arg before enabling user
 access
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, javier.jardon@codethink.co.uk,
 kejia.hu@codethink.co.uk,
 syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com,
 Arnd Bergmann <arnd@arndb.de>, schwab@linux-m68k.org, dvyukov@google.com,
 Paul Walmsley <paul.walmsley@sifive.com>, alex@ghiti.fr,
 linux-kernel@lists.codethink.co.uk
References: <mhng-3ecad305-7902-4715-a1f3-20534c101bea@palmerdabbelt-glaptop>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <bdf60e72-7f4e-8956-f706-116c5d2141b0@codethink.co.uk>
Date: Tue, 30 Mar 2021 12:41:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <mhng-3ecad305-7902-4715-a1f3-20534c101bea@palmerdabbelt-glaptop>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_124144_874025_3D615F06 
X-CRM114-Status: GOOD (  19.85  )
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

T24gMzAvMDMvMjAyMSAwNjo0NywgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gTW9uLCAyOSBN
YXIgMjAyMSAwMjo1Nzo0OSBQRFQgKC0wNzAwKSwgYmVuLmRvb2tzQGNvZGV0aGluay5jby51ayB3
cm90ZToKPj4gVGhlIDxhc20vdWFjY2Vzcy5oPiBoZWFkZXIgaGFzIGEgcHJvYmxlbSB3aXRoIHB1
dF91c2VyKGEsIHB0cikgaWYKPj4gdGhlICdhJyBpcyBub3QgYSBzaW1wbGUgdmFyaWFibGUsIHN1
Y2ggYXMgYSBmdW5jdGlvbi4gVGhpcyBjYW4gbGVhZAo+PiB0byB0aGUgY29tcGlsZXIgcHJvZHVj
aW5nIGNvZGUgYXMgc286Cj4+Cj4+IDE6wqDCoMKgIGVuYWJsZV91c2VyX2FjY2VzcygpCj4+IDI6
wqDCoMKgIGV2YWx1YXRlICdhJyBpbnRvIHJlZ2lzdGVyICdyJwo+PiAzOsKgwqDCoCBwdXQgJ3In
IHRvICdwdHInCj4+IDQ6wqDCoMKgIGRpc2FibGVfdXNlcl9hY2VzcygpCj4+Cj4+IFRoZSBpc3N1
ZSBpcyB0aGF0ICdhJyBpcyBub3cgYmVpbmcgZXZhbHVhdGVkIHdpdGggdGhlIHVzZXIgbWVtb3J5
Cj4+IHByb3RlY3Rpb25zIGRpc2FibGVkLiBTbyB3ZSB0cnkgYW5kIGZvcmNlIHRoZSBldmF1bGF0
aW9uIGJ5IGFzc2lnbmluZwo+PiAneCcgdG8gX192YWwgYXQgdGhlIHN0YXJ0LCBhbmQgaG9waW5n
IHRoZSBjb21waWxlciBiYXJyaWVycyBpbgo+PiDCoGVuYWJsZV91c2VyX2FjY2VzcygpIGRvIHRo
ZSBqb2Igb2Ygb3JkZXJpbmcgc3RlcCAyIGJlZm9yZSBzdGVwIDEuCj4+Cj4+IFRoaXMgaGFzIHNo
b3duIHVwIGluIGEgYnVnIHdoZXJlICdhJyBzbGVlcHMgYW5kIHRodXMgc2NoZWR1bGVzIG91dAo+
PiBhbmQgbG9zZXMgdGhlIFNSX1NVTSBmbGFnLiBUaGlzIGlzbid0IHN1ZmZpY2llbnQgdG8gZnVs
bHkgZml4LCBidXQKPj4gc2hvdWxkIHJlZHVjZSB0aGUgd2luZG93IG9mIG9wcG9ydHVuaXR5LiBU
aGUgZmlyc3QgaW5zdGFuY2Ugb2YgdGhpcwo+PiB3ZSBmb3VuZCBpcyBpbiBzY2hldWRsZV90YWls
KCkgd2hlcmUgdGhlIGNvZGUgZG9lczoKPj4KPj4gJCBsZXNzIC1OIGtlcm5lbC9zY2hlZC9jb3Jl
LmMKPj4KPj4gNDI2M8KgIGlmIChjdXJyZW50LT5zZXRfY2hpbGRfdGlkKQo+PiA0MjY0wqDCoMKg
wqDCoMKgwqDCoCBwdXRfdXNlcih0YXNrX3BpZF92bnIoY3VycmVudCksIGN1cnJlbnQtPnNldF9j
aGlsZF90aWQpOwo+Pgo+PiBIZXJlLCB0aGUgdGFza19waWRfdm5yKGN1cnJlbnQpIGlzIGNhbGxl
ZCB3aXRoaW4gdGhlIGJsb2NrIHRoYXQgaGFzCj4+IGVuYWJsZWQgdGhlIHVzZXIgbWVtb3J5IGFj
Y2Vzcy4gVGhpcyBjYW4gYmUgbWFkZSB3b3JzZSB3aXRoIEtBU0FOCj4+IHdoaWNoIG1ha2VzIHRh
c2tfcGlkX3ZucigpIGEgcmF0aGVyIGxhcmdlIGNhbGwgd2l0aCBwbGVudHkgb2YKPj4gb3Bwb3J0
dW5pdHkgdG8gc2xlZXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8YmVuLmRvb2tz
QGNvZGV0aGluay5jby51az4KPj4gUmVwb3J0ZWQtYnk6IHN5emJvdCtlNzRiOTRmZTYwMWFiOTU1
MmQ2OUBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCj4+IFN1Z2dlc3RlZC1ieTogQXJuZCBCZXJn
bWFuIDxhcm5kQGFybmRiLmRlPgo+IAo+IFRoYW5rcywgdGhpcyBpcyBvbiBmaXhlcy4KCkdyZWF0
LiBJIHN0aWxsIHRoaW5rIHdlIG5lZWQgYSBkaXNjdXNzaW9uIG9uIHdoZXRoZXIgX19zd2l0Y2hf
dG8oKQphbHNvIG5lZWRzIHRvIHNhdmUgc29tZSBvZiB0aGUgZmxhZ3MgZnJvbSBzc3RhdHVzLiBJ
IGRpZCBzb21lIGJhc2ljCnRlc3RzIGFuZCBzbyBmYXIgSSB0aGluayB0aGUgU1JfU1VNIGlzIHRo
ZSBvbmx5IHRoaW5nIHRoYXQgc2hvdWxkIGJlCnNhdmVkLgoKSSdsbCB0cnkgYW5kIGZpbmlzaCB3
cml0aW5nIHRoaXMgYnVnLXRyYWlsIHVwIGFuZCBzZWVpbmcgd2hhdCBlbHNlCm5lZWRzIHRvIGJl
IGRvbmUuIEkgZXhwZWN0IHRoZXJlIG1heSBiZSBvdGhlciBhcmNoaXRlY3R1cmVzIHRoYXQKaGF2
ZSBzaW1pbGFyIGlzc3VlcyB3aXRoIHB1dF91c2VyKCkgYW5kIGZyaWVuZHMKCkF0IGxlYXN0IHRo
ZSByaXNjdiBzdHJlc3MgdGVzdGluZyBjYW4gbW92ZSBmb3J3YXJkIHdpdGggdGhpcyBpbgpwbGFj
ZS4KCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5jb2RldGhpbmsuY28udWsvClNlbmlvciBF
bmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcgR2VuaXVzCgpodHRwczovL3d3dy5jb2Rl
dGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
