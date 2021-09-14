Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DECC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 13:49:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694DD603E7
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 13:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 694DD603E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pAUaWw702XVqUt8KIiR5rnlPFSJLYxnp6dbi13hCR34=; b=XdfXXgr2f6dOlJBzW8jCbSvasS
	u7YC4baKyToyc5vaJM7v4QCB4s5rq9vCwnrJ7fbPelop10XuZ5KhHXZe8R3YqBzqdHh3JleA87SIE
	HVqbOJVD9wSrsmmHC9XFT+/r1eTW4jAZ2s55EuARf2tyQbm9we2quXFHSUy58FPHgFooMrh2EE2Ud
	MxVqxpV/IpXG+8cuk3nyEfzVaBUl756o3sZ9DhBXWxWPd4PPU2O+V+6cgDnKbJWp+E+0F/cC3Jb1q
	IXIcs3cdvpGNw5BJJIvgS4yfhgcskn70w85gL3E6OHt5npxRjeMKiHqAW924sbMJryQOW4JeC4tHM
	Ulc+oHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ8oU-005tpj-Fl; Tue, 14 Sep 2021 13:49:30 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ8oG-005toD-Te; Tue, 14 Sep 2021 13:49:19 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H84T272hyz9sTY;
 Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bcHh4GeAshDT; Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H84T25w7Qz9sTW;
 Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5EA08B773;
 Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1mJ0k4nwiphF; Tue, 14 Sep 2021 15:49:10 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.177])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD0648B763;
 Tue, 14 Sep 2021 15:49:08 +0200 (CEST)
Subject: Re: [RFC PATCH 0/8] Move task_struct::cpu back into thread_info
To: Ard Biesheuvel <ardb@kernel.org>, linux-kernel@vger.kernel.org
Cc: Keith Packard <keithpac@amazon.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Arnd Bergmann
 <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20210914121036.3975026-1-ardb@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c21d9ee9-d0a1-a572-dda0-6ae90b417e10@csgroup.eu>
Date: Tue, 14 Sep 2021 15:49:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914121036.3975026-1-ardb@kernel.org>
Content-Language: fr-FR
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_064917_149907_3038D73B 
X-CRM114-Status: GOOD (  22.24  )
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

CgpMZSAxNC8wOS8yMDIxIMOgIDE0OjEwLCBBcmQgQmllc2hldXZlbCBhIMOpY3JpdMKgOgo+IENv
bW1pdCBjNjVlYWNiZTI5MGIgKCJzY2hlZC9jb3JlOiBBbGxvdyBwdXR0aW5nIHRocmVhZF9pbmZv
IGludG8KPiB0YXNrX3N0cnVjdCIpIG1lbnRpb25zIHRoYXQsIGFsb25nIHdpdGggbW92aW5nIHRo
cmVhZF9pbmZvIGludG8KPiB0YXNrX3N0cnVjdCwgdGhlIGNwdSBmaWVsZCBpcyBtb3ZlZCBvdXQg
b2YgdGhlIGZvcm1lciBpbnRvIHRoZSBsYXR0ZXIsCj4gYnV0IGRvZXMgbm90IGV4cGxhaW4gd2h5
LgoKSSB0aGluayBpdCBkb2VzIGV4cGxhaW4gd2h5IChpbml0L0tjb25maWcpOiAiYW4gYXJjaCB3
aWxsIG5lZWQgdG8gcmVtb3ZlIAphbGwgdGhyZWFkX2luZm8gZmllbGRzIGV4Y2VwdCBmbGFncyIu
CgpJSVVDIGluaXRpYWxseSB0aGUgaW50ZW50aW9uIHdpdGggVEhSRUFEX0lORk9fSU5fVEFTSyB3
YXMgdG8gcmVtb3ZlIApldmVyeXRoaW5nIGZyb20gdGhyZWFkX2luZm8sIGJ1dCBhdCB0aGUgZW5k
IGl0IGRpZG4ndCBoYXBwZW4gaXQgc2VlbXMuCgo+IAo+IFdoaWxlIGNvbGxhYm9yYXRpbmcgd2l0
aCBLZWl0aCBvbiBhZGRpbmcgVEhSRUFEX0lORk9fSU5fVEFTSyBzdXBwb3J0IHRvCj4gQVJNLCB3
ZSBub3RpY2VkIHRoYXQga2VlcGluZyBDUFUgaW4gdGFza19zdHJ1Y3QgaXMgcHJvYmxlbWF0aWMg
Zm9yCj4gYXJjaGl0ZWN0dXJlcyB0aGF0IGRlZmluZSByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpIGlu
IHRlcm1zIG9mIHRoaXMgZmllbGQsCj4gYXMgaXQgcmVxdWlyZXMgbGludXgvc2NoZWQuaCB0byBi
ZSBpbmNsdWRlZCwgd2hpY2ggY2F1c2VzIGEgbG90IG9mIHBhaW4KPiBpbiB0ZXJtcyBvZiBjaXJj
dWxhciBkZXBlbmRlbmNpZXMgKG9yICdoZWFkZXIgc291cCcsIGFzIHRoZSBvcmlnaW5hbAo+IGNv
bW1pdCByZWZlcnMgdG8gaXQpLgo+IAo+IEZvciBleGFtcGxlcyBvZiBob3cgZXhpc3RpbmcgYXJj
aGl0ZWN0dXJlcyB3b3JrIGFyb3VuZCB0aGlzLCBwbGVhc2UKPiByZWZlciB0byBwYXRjaGVzICM2
IG9yICM3LiBJbiB0aGUgZm9ybWVyIGNhc2UsIGl0IHVzZXMgYW4gYXdmdWwKPiBhc20tb2Zmc2V0
cyBoYWNrIHRvIGluZGV4IHRocmVhZF9pbmZvL2N1cnJlbnQgd2l0aG91dCB1c2luZyBpdHMgdHlw
ZQo+IGRlZmluaXRpb24uIFRoZSBsYXR0ZXIgYXBwcm9hY2ggc2ltcGx5IGtlZXBzIGEgY29weSBv
ZiB0aGUgdGFza19zdHJ1Y3QKPiBDUFUgZmllbGQgaW4gdGhyZWFkX2luZm8sIGFuZCBrZWVwcyBp
dCBpbiBzeW5jIGF0IGNvbnRleHQgc3dpdGNoIHRpbWUuCgpJdCB3YXMgYSBwYWluIHdoZW4gaW1w
bGVtZW50aW5nIHRoYXQgb24gcG93ZXJwYywgc28gSSByZWFsbHkgbGlrZSB5b3VyIAppZGVhLCB0
aGUgc2VyaWVzIGxvb2tzIGdvb2QgdG8gbWUuCgoKPiAKPiBQYXRjaCAjOCByZXZlcnRzIHRoaXMg
bGF0dGVyIGFwcHJvYWNoIGZvciBBUk0sIGJ1dCB0aGlzIGNvZGUgaXMgc3RpbGwKPiB1bmRlciBy
ZXZpZXcgc28gaXQgZG9lcyBub3QgY3VycmVudGx5IGFwcGx5IHRvIG1haW5saW5lLgo+IAo+IFdl
IGFsc28gZGlzY3Vzc2VkIGludHJvZHVjaW5nIHlldCBhbm90aGVyIEtjb25maWcgc3ltYm9sIHRv
IGluZGljYXRlCj4gdGhhdCB0aGUgYXJjaCBoYXMgVEhSRUFEX0lORk9fSU5fVEFTSyBlbmFibGVk
IGJ1dCBzdGlsbCBwcmVmZXJzIHRvIGtlZXAKPiBpdHMgQ1BVIGZpZWxkIGluIHRocmVhZF9pbmZv
LCBidXQgc2ltcGx5IGtlZXBpbmcgaXQgaW4gdGhyZWFkX2luZm8gaW4KPiBhbGwgY2FzZXMgc2Vl
bXMgdG8gYmUgdGhlIGNsZWFuZXN0IGFwcHJvYWNoIGhlcmUuCgpZZXMsIGlmIHdlIGNhbiBhdm9p
ZCB5ZXQgYW5vdGhlciBjb25maWcsIHRoYXQncyBiZXR0ZXIuIFdlIGFscmVhZHkgaGF2ZSAKc28g
bWFueSBjb25maWdzIHRoYXQgYXJlIHN1cHBvc2VkIHRvIGJlIHRlbXBvcmFyeSBhbmQgaGF2ZSBs
YXN0ZWQgZm9yIAp5ZWFycyBpZiBub3QgZGVjYWRlcy4KCkNocmlzdG9waGUKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
