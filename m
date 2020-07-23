Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AE20C433E3
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 05:22:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E990420768
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 05:22:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFUbFMqQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E990420768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nBZdmjaAev4L96EICvOXEg6V8HQLZD36xDnuOlXkUTI=; b=IFUbFMqQD6/e6jO+pxs5yGyyS
	lPbpxQRYHIk8idygJc/NbgSq2/bkeU4+wfa+oMBE8F5KR1TnHLnUtEiAsFT8XCOBwXvRF89S67569
	hTahAjr/m1/iIci3VPe1Sxkl8tTYqhj+gMAuzFlKbDJxtyVu7tmFK/UQ8EIv8g28v6Xdm2MukO2Cx
	cnI1LDdt5TZHCO3ZLpTlffyGaoVggPi0bob4KcrbGgyjq/oBRtxo/2E12zAlKMIO5rPRIvqCmx/Gz
	HmhztrDnTIzaA+EIhPRkSlcXHNJqfqxXMAptI8oV7LG718XOqHM6X02FEccj7Nyqt+bPQYcEGWC9/
	dPMGtP2qg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyTgF-0007d1-Ds; Thu, 23 Jul 2020 05:22:08 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyTgB-0007bm-OC
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 05:22:04 +0000
X-Originating-IP: 90.112.45.105
Received: from [192.168.1.14] (lfbn-gre-1-325-105.w90-112.abo.wanadoo.fr
 [90.112.45.105]) (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 722BD60002;
 Thu, 23 Jul 2020 05:21:51 +0000 (UTC)
Subject: Re: [PATCH v5 1/4] riscv: Move kernel mapping to vmalloc zone
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-831c4073-aefa-4aa0-a583-6a17f9aff9b7@palmerdabbelt-glaptop1>
 <d7e3cbb7-c12a-bce2-f1db-c336d15f74bd@ghiti.fr>
 <7cb2285e-68ba-6827-5e61-e33a4b65ac03@ghiti.fr>
 <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <cade70e2-0179-2650-41c5-036679aaf30c@ghiti.fr>
Date: Thu, 23 Jul 2020 01:21:50 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <54af168083aee9dbda1b531227521a26b77ba2c8.camel@kernel.crashing.org>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_012203_927428_7DCBD79D 
X-CRM114-Status: GOOD (  18.30  )
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
Cc: aou@eecs.berkeley.edu, linux-mm@kvack.org, mpe@ellerman.id.au,
 Anup Patel <Anup.Patel@wdc.com>, linux-kernel@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, paulus@samba.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgQmVuamFtaW4sCgpMZSA3LzIxLzIwIMOgIDc6MTEgUE0sIEJlbmphbWluIEhlcnJlbnNjaG1p
ZHQgYSDDqWNyaXTCoDoKPiBPbiBUdWUsIDIwMjAtMDctMjEgYXQgMTQ6MzYgLTA0MDAsIEFsZXgg
R2hpdGkgd3JvdGU6Cj4+Pj4gSSBndWVzcyBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMgaXMg
bmVjZXNzYXJ5IGF0IGFsbC4KPj4+PiBTcGVjaWZpY2FsbHk6IHdoeQo+Pj4+IGNhbid0IHdlIGp1
c3QgcmVsb2NhdGUgdGhlIGtlcm5lbCB3aXRoaW4gdGhlIGxpbmVhciBtYXA/ICBUaGF0IHdvdWxk
Cj4+Pj4gbGV0IHRoZQo+Pj4+IGJvb3Rsb2FkZXIgcHV0IHRoZSBrZXJuZWwgd2hlcmV2ZXIgaXQg
d2FudHMsIG1vZHVsbyB0aGUgcGh5c2ljYWwKPj4+PiBtZW1vcnkgc2l6ZSB3ZQo+Pj4+IHN1cHBv
cnQuICBXZSdkIG5lZWQgdG8gaGFuZGxlIHRoZSByZWdpb25zIHRoYXQgYXJlIGNvdXBsZWQgdG8g
dGhlCj4+Pj4ga2VybmVsJ3MKPj4+PiBleGVjdXRpb24gYWRkcmVzcywgYnV0IHdlIGNvdWxkIGp1
c3QgcHV0IHRoZW0gaW4gYW4gZXhwbGljaXQgbWVtb3J5Cj4+Pj4gcmVnaW9uCj4+Pj4gd2hpY2gg
aXMgd2hhdCB3ZSBzaG91bGQgcHJvYmFibHkgYmUgZG9pbmcgYW55d2F5Lgo+Pj4KPj4+IFZpcnR1
YWwgcmVsb2NhdGlvbiBpbiB0aGUgbGluZWFyIG1hcHBpbmcgcmVxdWlyZXMgdG8gbW92ZSB0aGUg
a2VybmVsCj4+PiBwaHlzaWNhbGx5IHRvby4gWm9uZyBpbXBsZW1lbnRlZCB0aGlzIHBoeXNpY2Fs
IG1vdmUgaW4gaXRzIEtBU0xSIFJGQwo+Pj4gcGF0Y2hzZXQsIHdoaWNoIGlzIGN1bWJlcnNvbWUg
c2luY2UgZmluZGluZyBhbiBhdmFpbGFibGUgcGh5c2ljYWwgc3BvdAo+Pj4gaXMgaGFyZGVyIHRo
YW4ganVzdCBzZWxlY3RpbmcgYSB2aXJ0dWFsIHJhbmdlIGluIHRoZSB2bWFsbG9jIHJhbmdlLgo+
Pj4KPj4+IEluIGFkZGl0aW9uLCBoYXZpbmcgdGhlIGtlcm5lbCBtYXBwaW5nIGluIHRoZSBsaW5l
YXIgbWFwcGluZyBwcmV2ZW50cwo+Pj4gdGhlIHVzZSBvZiBodWdlcGFnZSBmb3IgdGhlIGxpbmVh
ciBtYXBwaW5nIHJlc3VsdGluZyBpbiBwZXJmb3JtYW5jZSBsb3NzCj4+PiAoYXQgbGVhc3QgZm9y
IHRoZSBHQiB0aGF0IGVuY29tcGFzc2VzIHRoZSBrZXJuZWwpLgo+Pj4KPj4+IFdoeSBkbyB5b3Ug
ZmluZCB0aGlzICJ1Z2x5IiA/IFRoZSB2bWFsbG9jIHJlZ2lvbiBpcyBqdXN0IGEgYnVuY2ggb2YK
Pj4+IGF2YWlsYWJsZSB2aXJ0dWFsIGFkZHJlc3NlcyB0byB3aGF0ZXZlciBwdXJwb3NlIHdlIHdh
bnQsIGFuZCBhcyBub3RlZCBieQo+Pj4gWm9uZywgYXJtNjQgdXNlcyB0aGUgc2FtZSBzY2hlbWUu
Cj4gCj4gSSBkb24ndCBnZXQgaXQgOi0pCj4gCj4gQXQgbGVhc3Qgb24gcG93ZXJwYyB3ZSBtb3Zl
IHRoZSBrZXJuZWwgaW4gdGhlIGxpbmVhciBtYXBwaW5nIGFuZCBpdAo+IHdvcmtzIGZpbmUgd2l0
aCBodWdlIHBhZ2VzLCB3aGF0IGlzIHlvdXIgcHJvYmxlbSB0aGVyZSA/IFlvdSByZWx5IG9uCj4g
cHVuY2hpbmcgc21hbGwtcGFnZSBzaXplIGhvbGVzIGluIHRoZXJlID8KPiAKCkFSQ0hfSEFTX1NU
UklDVF9LRVJORUxfUldYIHByZXZlbnRzIHRoZSB1c2Ugb2YgYSBodWdlcGFnZSBmb3IgdGhlIGtl
cm5lbCAKbWFwcGluZyBpbiB0aGUgZGlyZWN0IG1hcHBpbmcgYXMgaXQgc2V0cyBkaWZmZXJlbnQg
cGVybWlzc2lvbnMgdG8gCmRpZmZlcmVudCBwYXJ0IG9mIHRoZSBrZXJuZWwgKGRhdGEsIHRleHQu
LmV0YykuCgoKPiBBdCBsZWFzdCBpbiB0aGUgb2xkIGRheXMsIHRoZXJlIHdlcmUgYSBudW1iZXIg
b2YgYXNzdW1wdGlvbnMgdGhhdAo+IHRoZSBrZXJuZWwgdGV4dC9kYXRhL2JzcyByZXNpZGVzIGlu
IHRoZSBsaW5lYXIgbWFwcGluZy4KPiAKPiBJZiB5b3UgY2hhbmdlIHRoYXQgeW91IG5lZWQgdG8g
ZW5zdXJlIHRoYXQgaXQncyBzdGlsbCBwaHlzaWNhbGx5Cj4gY29udGlndW91cyBhbmQgeW91J2xs
IGhhdmUgdG8gdHdlYWsgX192YSBhbmQgX19wYSwgd2hpY2ggbWlnaHQgaW5kdWNlCj4gZXh0cmEg
b3ZlcmhlYWQuCj4gCgpZZXMgdGhhdCdzIGRvbmUgaW4gdGhpcyBwYXRjaCBhbmQgaW5kZWVkIHRo
ZXJlIGlzIGFuIG92ZXJoZWFkIHRvIHRob3NlIApmdW5jdGlvbnMuCgo+IENoZWVycywKPiBCZW4u
Cj4gICAKPiAKClRoYW5rcywKCkFsZXgKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
