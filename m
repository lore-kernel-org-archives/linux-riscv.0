Return-Path: <SRS0=n5X/=HD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C0FAC433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Feb 2021 13:18:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD84E64E95
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Feb 2021 13:18:56 +0000 (UTC)
Authentication-Results: mail.kernel.org; dmarc=permerror header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y1dDJrb9bOgixrg0pvuvpvXOr6qwK5ME1UvuKolbWwc=; b=V6OoBJTFCwYCxKg9sg6tHmh0v
	Vfk9Pzp0DTaXs4r+9s8nHH0pAYhRnsb9U6LN4+AO3cFqy/rWHfRs3ZrT/rdxJotg/o6kTbj1D1kDk
	TlT93IlRlv4bOFulf5ykqfIpPidW4yWJNZTr7DZf5z5/3LelR3sYAlCg51Wo0YL16dIfd7eQs0dat
	KW+8aKsfdM+7WzPu0bWJx92iU5EgTPJPGgyYCveSZ2iPAAAhYKyOkubsHAADmf7ky63qb6NzvRpDL
	rKAxNi98zcPsK/6aZtingTb7kg3yqUsnYyQYFUHh9CVZ9ooqJ0Y0+4TGCiDdTzSestOOSw3UAMJGD
	3E5RdqOSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Z6O-0007ju-Ol; Mon, 01 Feb 2021 13:18:48 +0000
Received: from imap3.hz.codethink.co.uk ([176.9.8.87])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Z6L-0007ic-4o
 for linux-riscv@lists.infradead.org; Mon, 01 Feb 2021 13:18:46 +0000
Received: from cpc79921-stkp12-2-0-cust288.10-2.cable.virginm.net
 ([86.16.139.33] helo=[192.168.0.18])
 by imap3.hz.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
 id 1l6Z6E-0003lO-2b; Mon, 01 Feb 2021 13:18:38 +0000
Subject: Re: [PATCH v3 0/2] Let illegal access to user-space memory die
To: Palmer Dabbelt <palmer@dabbelt.com>, tesheng@andestech.com
References: <mhng-607cbd62-adc5-45a7-adde-476741f9d63b@palmerdabbelt-glaptop>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
Message-ID: <ee1f254d-a06e-9725-57d1-ce0210751c05@codethink.co.uk>
Date: Mon, 1 Feb 2021 13:18:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <mhng-607cbd62-adc5-45a7-adde-476741f9d63b@palmerdabbelt-glaptop>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_081845_198074_7E7C5BAB 
X-CRM114-Status: GOOD (  13.44  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, peterx@redhat.com,
 penberg@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 akpm@linux-foundation.org, walken@google.com, linux-riscv@lists.infradead.org,
 vbabka@suse.cz
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjIvMTIvMjAyMCAwMjozNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gVGh1LCAwMyBE
ZWMgMjAyMCAyMTo0Mjo1NyBQU1QgKC0wODAwKSwgdGVzaGVuZ0BhbmRlc3RlY2guY29tIHdyb3Rl
Ogo+PiBBY2Nlc3NlcyB0byB1c2VyLXNwYWNlIG1lbW9yeSB3aXRob3V0IGNhbGxpbmcgdWFjY2Vz
cyByb3V0aW5lCj4+IGxlYWRzIHRvIGhhbmdpbmcgaW4gcGFnZSBmYXVsdCBoYW5kbGVyLiBMaWtl
IGFybTY0LCB3ZSBsZXQgaXQKPj4gZGllIGVhcmxpZXIgaW4gcGFnZSBmYXVsdCBoYW5kbGVyLgo+
Pgo+PiBDaGFuZ2VzIGluIHYzOgo+PiDCoMKgwqDCoC1MZXQgbm9fY29udGV4dCgpIHVzZSBkaWVf
a2VybmVsX2ZhdWx0KCkgaGVscGVyCj4+Cj4+IENoYW5nZXMgaW4gdjI6Cj4+IMKgwqDCoCAtQWRk
IGEgZGllX2tlcm5lbF9mYXVsdCgpIGhlbHBlcgo+PiDCoMKgwqAgLVNwbGl0IG9uZSBsb25nIGxp
bmUgY29kZSBpbnRvIHR3bwo+Pgo+PiBFcmljIExpbiAoMik6Cj4+IMKgIHJpc2N2L21tOiBJbnRy
b2R1Y2UgYSBkaWVfa2VybmVsX2ZhdWx0KCkgaGVscGVyIGZ1bmN0aW9uCj4+IMKgIHJpc2N2L21t
OiBQcmV2ZW50IGtlcm5lbCBtb2R1bGUgdG8gYWNjZXNzIHVzZXIgbWVtb3J5IHdpdGhvdXQgdWFj
Y2Vzcwo+PiDCoMKgwqAgcm91dGluZXMKPj4KPj4gwqBhcmNoL3Jpc2N2L21tL2ZhdWx0LmMgfCAy
OCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tCj4+IMKgMSBmaWxlIGNoYW5nZWQsIDIyIGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gVGhhbmtzLCB0aGVzZSB3aWxsIGJlIG9u
IGZvci1uZXh0IHdoZW4gdGhlIG1lcmdlIHdpbmRvdyBlbmRzLgoKSnVzdCB0ZXN0ZWQgdGhpcyBh
bmQgaXQgc2VlbXMgdG8gYmUgd29ya2luZy4KCi0tIApCZW4gRG9va3MJCQkJaHR0cDovL3d3dy5j
b2RldGhpbmsuY28udWsvClNlbmlvciBFbmdpbmVlcgkJCQlDb2RldGhpbmsgLSBQcm92aWRpbmcg
R2VuaXVzCgpodHRwczovL3d3dy5jb2RldGhpbmsuY28udWsvcHJpdmFjeS5odG1sCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
