Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B2AC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 10:22:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54AF361006
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 10:22:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54AF361006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C8qA+jHAxUX4CfIv2+ECZrUBrySW+cMXncbeSsnd1gY=; b=PvQl8xpWUE+iGOrKfMC5KF1DT
	5vOZUqYrqwGbEJMSZZj+SNo2unsVuGFqrhP2tuqB43I+YdpQ6BrDdyS/1zBVoeoxcp83Hhr03z1+Q
	AcLXvIVLwQ8YByPgKT1WhodMR992cHk0nDwKPW8noBc0a1qCdmq1F/tCVj7sS/5/OYBiUM3R52C/8
	7uHQcjuFKz7TWzveRv5suq1gVj0EZkEVDvmLnI9xSceFwmz3IKYah8o17rSkx66PvJylFcFTXvtRJ
	WiLnoBlJWGhAfT5zzfKKDC+oPCuojWkLFKCXoZi492Aa+CmChvqY+qHmQeYxAfVznfv38w8Ai5YtG
	8bhlmv60w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYR2G-009f7o-JP; Mon, 19 Apr 2021 10:21:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYR2D-009f7H-2o
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 10:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Xpi5lBk+awQqaK6Y03m/CCSgGP4Mxrpo1j7RjBYWGpQ=; b=aHqrImRMuCAmwXfb0ysd/gufPi
 3fjNCyQo4BPn/nAXDfO2Myywsj3xfgJ/7yugA5dEnRRdX9qjQJZhkEZy5VsK73dmzVFz9u36MpN3U
 yn7JgeiJ+WM3hyBYjyWbAz3FXVtGQ/zJD5Xt44rjmnuX/5K3Xdmd1J9JcievNKrGuK/mIzhjzcyxp
 6gYGL6BZOdVvZbVSf/eNIziGVGYdJYZp0EcUzvkH6aMx7FzLiShw3zTMNpavBzgFfqQfUlFKD5KbP
 KudcebVEspJU3W3IbL3xlspKCpeuLhLyC1yuP/X3pWGJqEXtSDUo8YbDLgk1WJ5yrwkP0gRO+xMEW
 zG1ii4Mg==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYR29-00BGwT-Tb
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 10:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618827696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xpi5lBk+awQqaK6Y03m/CCSgGP4Mxrpo1j7RjBYWGpQ=;
 b=VQtgG7bjwPc5KvfVcRrHIyF1krPDYdvPVsUAZ+1XEaHVZGVb+Z1kzERzcc1gabboa+icfq
 l9+JuGzBsTL6cE9BVAr5kgXHx7Yq0KwJ1qYf28gspCCO7LuSAYmRcY/GTrcoOrl2r4LD8g
 VDaF4f2vBa8ARiPQ0cP4odXFg64XlJM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-481-sNDY715EMSyRv4BjGQA0tg-1; Mon, 19 Apr 2021 06:21:35 -0400
X-MC-Unique: sNDY715EMSyRv4BjGQA0tg-1
Received: by mail-ed1-f70.google.com with SMTP id
 c13-20020a05640227cdb0290385526e5de5so885440ede.21
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 03:21:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Xpi5lBk+awQqaK6Y03m/CCSgGP4Mxrpo1j7RjBYWGpQ=;
 b=e3yuqdZLSFFSrzSWIHWWoO9QlF6aQiyVeY5XMLukZpmJ1M29+Y7FGMaM8dDQtcdfSA
 1N9DWzKg/T9brFQB90i6RhL89lwvuK6MIUGsZtlIUO2P0Si75IU8uqKnaspE422anSW0
 prbpFYzUyDMIn/uJHWwU3FZ4FwNNFjqnDR/IJLlaBL3m4LrF5+mOSOTKLN3EQprN6uz2
 BX9cb3fnQgBFim/i/fg0GpnJOLqFbQsrZva9OgARVJYHUidrMW3Lyzlz5cN2ZOv2OKAw
 T2g6DmM32+48W0GVgfOSiDAD7kN+z9pLKLjJw18zum/QsOT0jRpqawCIwEFWmTZSwOPy
 ctCA==
X-Gm-Message-State: AOAM533G6L5nhY0ufD6wyMr7uic/cJGQtVcZh0hCmzjVRaXKcF9sRyIW
 THFl9R9zrb6NeWcxFPYotG4gD6ItnS6H0bHQ6yQq4y/I2gDAbSOidCagU8JNOtl4a44RYShZQ3s
 GPC0UBAJZgAOWQLNjAyIWDrGh2W7v
X-Received: by 2002:a05:6402:26c3:: with SMTP id
 x3mr25471523edd.126.1618827693685; 
 Mon, 19 Apr 2021 03:21:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmgqAt375JQolL1odKMUOeY+mBAXFeiW3PyhYVPJipQltfTGdvih9swcKv5opSGIf6ZUpLaQ==
X-Received: by 2002:a05:6402:26c3:: with SMTP id
 x3mr25471472edd.126.1618827693375; 
 Mon, 19 Apr 2021 03:21:33 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c69b8.dip0.t-ipconnect.de. [91.12.105.184])
 by smtp.gmail.com with ESMTPSA id g11sm12241330edy.9.2021.04.19.03.21.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 03:21:32 -0700 (PDT)
Subject: Re: [PATCH] secretmem: optimize page_is_secretmem()
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Christopher Lameter
 <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Elena Reshetova <elena.reshetova@intel.com>, "H. Peter Anvin"
 <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>,
 Mark Rutland <mark.rutland@arm.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Michael Kerrisk
 <mtk.manpages@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>, "Rafael J. Wysocki"
 <rjw@rjwysocki.net>, Rick Edgecombe <rick.p.edgecombe@intel.com>,
 Roman Gushchin <guro@fb.com>, Shakeel Butt <shakeelb@google.com>,
 Shuah Khan <shuah@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Tycho Andersen <tycho@tycho.ws>, Will Deacon <will@kernel.org>,
 Yury Norov <yury.norov@gmail.com>, linux-api@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-riscv@lists.infradead.org, x86@kernel.org,
 kernel test robot <oliver.sang@intel.com>
References: <20210419084218.7466-1-rppt@kernel.org>
 <3b30ac54-8a92-5f54-28f0-f110a40700c7@redhat.com>
 <YH1PE4oWeicpJT9g@kernel.org>
 <f4d0c4bf-423b-e227-444b-f1ea722dc43f@redhat.com>
 <56d8b80c-ce2c-ed86-0eda-253768d8d463@redhat.com>
 <YH1X+0CMH/2yppHK@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <0a957f9b-b4d7-869a-44ec-14e92a40d941@redhat.com>
Date: Mon, 19 Apr 2021 12:21:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YH1X+0CMH/2yppHK@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_032138_071883_8ECAC53C 
X-CRM114-Status: GOOD (  28.06  )
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

T24gMTkuMDQuMjEgMTI6MTQsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMTks
IDIwMjEgYXQgMTE6NDA6NTZBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9u
IDE5LjA0LjIxIDExOjM4LCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+IE9uIDE5LjA0LjIx
IDExOjM2LCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+Pj4+IE9uIE1vbiwgQXByIDE5LCAyMDIxIGF0
IDExOjE1OjAyQU0gKzAyMDAsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+Pj4+PiBPbiAxOS4w
NC4yMSAxMDo0MiwgTWlrZSBSYXBvcG9ydCB3cm90ZToKPj4+Pj4+IEZyb206IE1pa2UgUmFwb3Bv
cnQgPHJwcHRAbGludXguaWJtLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBLZXJuZWwgdGVzdCByb2JvdCBy
ZXBvcnRlZCAtNC4yJSByZWdyZXNzaW9uIG9mIHdpbGwtaXQtc2NhbGUucGVyX3RocmVhZF9vcHMK
Pj4+Pj4+IGR1ZSB0byBjb21taXQgIm1tOiBpbnRyb2R1Y2UgbWVtZmRfc2VjcmV0IHN5c3RlbSBj
YWxsIHRvIGNyZWF0ZSAic2VjcmV0Igo+Pj4+Pj4gbWVtb3J5IGFyZWFzIi4KPj4+Pj4+Cj4+Pj4+
PiBUaGUgcGVyZiBwcm9maWxlIG9mIHRoZSB0ZXN0IGluZGljYXRlZCB0aGF0IHRoZSByZWdyZXNz
aW9uIGlzIGNhdXNlZCBieQo+Pj4+Pj4gcGFnZV9pc19zZWNyZXRtZW0oKSBjYWxsZWQgZnJvbSBn
dXBfcHRlX3JhbmdlKCkgKGlubGluZWQgYnkgZ3VwX3BnZF9yYW5nZSk6Cj4+Pj4+Pgo+Pj4+Pj4g
ICAgICAyNy43NiAgKzIuNSAgMzAuMjMgICAgICAgcGVyZi1wcm9maWxlLmNoaWxkcmVuLmN5Y2xl
cy1wcC5ndXBfcGdkX3JhbmdlCj4+Pj4+PiAgICAgICAwLjAwICArMy4yICAgMy4xOSDCsSAyJSAg
cGVyZi1wcm9maWxlLmNoaWxkcmVuLmN5Y2xlcy1wcC5wYWdlX21hcHBpbmcKPj4+Pj4+ICAgICAg
IDAuMDAgICszLjcgICAzLjY2IMKxIDIlICBwZXJmLXByb2ZpbGUuY2hpbGRyZW4uY3ljbGVzLXBw
LnBhZ2VfaXNfc2VjcmV0bWVtCj4+Pj4+Pgo+Pj4+Pj4gRnVydGhlciBhbmFseXNpcyBzaG93ZWQg
dGhhdCB0aGUgc2xvdyBkb3duIGhhcHBlbnMgYmVjYXVzZSBuZWl0aGVyCj4+Pj4+PiBwYWdlX2lz
X3NlY3JldG1lbSgpIG5vciBwYWdlX21hcHBpbmcoKSBhcmUgbm90IGlubGluZSBhbmQgbW9yZW92
ZXIsCj4+Pj4+PiBtdWx0aXBsZSBwYWdlIGZsYWdzIGNoZWNrcyBpbiBwYWdlX21hcHBpbmcoKSBp
bnZvbHZlIGNhbGxpbmcKPj4+Pj4+IGNvbXBvdW5kX2hlYWQoKSBzZXZlcmFsIHRpbWVzIGZvciB0
aGUgc2FtZSBwYWdlLgo+Pj4+Pj4KPj4+Pj4+IE1ha2UgcGFnZV9pc19zZWNyZXRtZW0oKSBpbmxp
bmUgYW5kIHJlcGxhY2UgcGFnZV9tYXBwaW5nKCkgd2l0aCBwYWdlIGZsYWcKPj4+Pj4+IGNoZWNr
cyB0aGF0IGRvIG5vdCBpbXBseSBwYWdlLXRvLWhlYWQgY29udmVyc2lvbi4KPj4+Pj4+Cj4+Pj4+
PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPG9saXZlci5zYW5nQGludGVsLmNvbT4K
Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNvbT4K
Pj4+Pj4+IC0tLQo+Pj4+Pj4KPj4+Pj4+IEBBbmRyZXcsCj4+Pj4+PiBUaGUgcGF0Y2ggaXMgdnMg
djUuMTItcmM3LW1tb3RzLTIwMjEtMDQtMTUtMTYtMjgsIEknZCBhcHByZWNpYXRlIGlmIGl0IHdv
dWxkCj4+Pj4+PiBiZSBhZGRlZCBhcyBhIGZpeHVwIHRvIHRoZSBtZW1mZF9zZWNyZXQgc2VyaWVz
Lgo+Pj4+Pj4KPj4+Pj4+ICAgICAgaW5jbHVkZS9saW51eC9zZWNyZXRtZW0uaCB8IDI2ICsrKysr
KysrKysrKysrKysrKysrKysrKystCj4+Pj4+PiAgICAgIG1tL3NlY3JldG1lbS5jICAgICAgICAg
ICAgfCAxMiArLS0tLS0tLS0tLS0KPj4+Pj4+ICAgICAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNl
cnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPj4+Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9zZWNyZXRtZW0uaCBiL2luY2x1ZGUvbGludXgvc2VjcmV0bWVtLmgKPj4+Pj4+
IGluZGV4IDkwN2E2NzM0MDU5Yy4uYjg0MmIzOGNiZWIxIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvaW5j
bHVkZS9saW51eC9zZWNyZXRtZW0uaAo+Pj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9zZWNyZXRt
ZW0uaAo+Pj4+Pj4gQEAgLTQsOCArNCwzMiBAQAo+Pj4+Pj4gICAgICAjaWZkZWYgQ09ORklHX1NF
Q1JFVE1FTQo+Pj4+Pj4gK2V4dGVybiBjb25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFjZV9vcGVyYXRp
b25zIHNlY3JldG1lbV9hb3BzOwo+Pj4+Pj4gKwo+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBw
YWdlX2lzX3NlY3JldG1lbShzdHJ1Y3QgcGFnZSAqcGFnZSkKPj4+Pj4+ICt7Cj4+Pj4+PiArCXN0
cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nOwo+Pj4+Pj4gKwo+Pj4+Pj4gKwkvKgo+Pj4+Pj4g
KwkgKiBVc2luZyBwYWdlX21hcHBpbmcoKSBpcyBxdWl0ZSBzbG93IGJlY2F1c2Ugb2YgdGhlIGFj
dHVhbCBjYWxsCj4+Pj4+PiArCSAqIGluc3RydWN0aW9uIGFuZCByZXBlYXRlZCBjb21wb3VuZF9o
ZWFkKHBhZ2UpIGluc2lkZSB0aGUKPj4+Pj4+ICsJICogcGFnZV9tYXBwaW5nKCkgZnVuY3Rpb24u
Cj4+Pj4+PiArCSAqIFdlIGtub3cgdGhhdCBzZWNyZXRtZW0gcGFnZXMgYXJlIG5vdCBjb21wb3Vu
ZCBhbmQgTFJVIHNvIHdlIGNhbgo+Pj4+Pj4gKwkgKiBzYXZlIGEgY291cGxlIG9mIGN5Y2xlcyBo
ZXJlLgo+Pj4+Pj4gKwkgKi8KPj4+Pj4+ICsJaWYgKFBhZ2VDb21wb3VuZChwYWdlKSB8fCAhUGFn
ZUxSVShwYWdlKSkKPj4+Pj4+ICsJCXJldHVybiBmYWxzZTsKPj4+Pj4KPj4+Pj4gSSdkIGFzc3Vt
ZSBzZWNyZXRtZW0gcGFnZXMgYXJlIHJhcmUgaW4gYmFzaWNhbGx5IGV2ZXJ5IHNldHVwIG91dCB0
aGVyZS4gU28KPj4+Pj4gbWF5YmUgdGhyb3dpbmcgaW4gYSBjb3VwbGUgb2YgbGlrZWx5KCkvdW5s
aWtlbHkoKSBtaWdodCBtYWtlIHNlbnNlLgo+Pj4+Cj4+Pj4gSSdkIHNheSB3ZSBjb3VsZCBkbyB1
bmxpa2VseShwYWdlX2lzX3NlY3JldG1lbSgpKSBhdCBjYWxsIHNpdGVzLiBIZXJlIEkgY2FuCj4+
Pj4gaGFyZGx5IGVzdGltYXRlIHdoaWNoIHBhZ2VzIGFyZSBnb2luZyB0byBiZSBjaGVja2VkLgo+
Pj4+Pj4gKwo+Pj4+Pj4gKwltYXBwaW5nID0gKHN0cnVjdCBhZGRyZXNzX3NwYWNlICopCj4+Pj4+
PiArCQkoKHVuc2lnbmVkIGxvbmcpcGFnZS0+bWFwcGluZyAmIH5QQUdFX01BUFBJTkdfRkxBR1Mp
Owo+Pj4+Pj4gKwo+Pj4+Pgo+Pj4+PiBOb3Qgc3VyZSBpZiBvcGVuLWNvZGluZyBwYWdlX21hcHBp
bmcgaXMgcmVhbGx5IGEgZ29vZCBpZGVhIGhlcmUgLS0gb3IgZXZlbgo+Pj4+PiBuZWNlc3Nhcnkg
YWZ0ZXIgdGhlIGZhc3QgcGF0aCBhYm92ZSBpcyBpbiBwbGFjZS4gQW55aG93LCBqdXN0IG15IDIg
Y2VudHMuCj4+Pj4KPj4+PiBXZWxsLCBtb3N0IGlmIHRoZSAtNC4yJSBvZiB0aGUgcGVyZm9ybWFu
Y2UgcmVncmVzc2lvbiBrYnVpbGQgcmVwb3J0ZWQgd2VyZQo+Pj4+IGR1ZSB0byByZXBlYXRlZCBj
b21wb3VudF9oZWFkKHBhZ2UpIGluIHBhZ2VfbWFwcGluZygpLiBTbyB0aGUgd2hvbGUgcG9pbnQK
Pj4+PiBvZiB0aGlzIHBhdGNoIGlzIHRvIGF2b2lkIGNhbGxpbmcgcGFnZV9tYXBwaW5nKCkuCj4+
Pgo+Pj4gSSB3b3VsZCBoYXZlIHRob3VnaHQgdGhlIGZhc3QgcGF0aCAiKFBhZ2VDb21wb3VuZChw
YWdlKSB8fAo+Pj4gIVBhZ2VMUlUocGFnZSkpIiB3b3VsZCBhbHJlYWR5IGF2b2lkIGNhbGxpbmcg
cGFnZV9tYXBwaW5nKCkgaW4gbWFueSBjYXNlcy4KPj4KPj4gKGFuZCBJIGRvIHdvbmRlciBpZiBh
IGdlbmVyaWMgcGFnZV9tYXBwaW5nKCkgb3B0aW1pemF0aW9uIHdvdWxkIG1ha2Ugc2Vuc2UKPj4g
aW5zdGVhZCkKPiAKPiBOb3Qgc3VyZS4gUmVwbGFjaW5nIHBhZ2VfbWFwcGluZygpIHdpdGggcGFn
ZV9maWxlX21hcHBpbmcoKSBhdCB0aGUKPiBjYWxsIHNpdGVzIGF0IGZzLyBhbmQgbW0vIGluY3Jl
YXNlZCB0aGUgZGVmY29uZmlnIGltYWdlIGJ5IG5lYXJseSAyawo+IGFuZCBwYWdlX2ZpbGVfbWFw
cGluZygpIGlzIHdheSBzaW1wbGVyIHRoYW4gcGFnZV9tYXBwaW5nKCkKPiAKPiBhZGQvcmVtb3Zl
OiAxLzAgZ3Jvdy9zaHJpbms6IDM1LzAgdXAvZG93bjogMTk2MC8wICgxOTYwKQo+IEZ1bmN0aW9u
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGEK
PiBzaHJpbmtfcGFnZV9saXN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDM0MTQgICAgMzY3
MCAgICArMjU2Cj4gX19zZXRfcGFnZV9kaXJ0eV9ub2J1ZmZlcnMgICAgICAgICAgICAgICAgICAg
MjQyICAgICAzNDkgICAgKzEwNwo+IGNoZWNrX21vdmVfdW5ldmljdGFibGVfcGFnZXMgICAgICAg
ICAgICAgICAgIDkwNCAgICAgOTg3ICAgICArODMKPiBtb3ZlX3RvX25ld19wYWdlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICA1OTEgICAgIDY3MSAgICAgKzgwCj4gc2hyaW5rX2FjdGl2ZV9s
aXN0ICAgICAgICAgICAgICAgICAgICAgICAgICAgOTEyICAgICA5NzAgICAgICs1OAo+IG1vdmVf
cGFnZXNfdG9fbHJ1ICAgICAgICAgICAgICAgICAgICAgICAgICAgIDkxMSAgICAgOTY1ICAgICAr
NTQKPiBtaWdyYXRlX3BhZ2VzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDI1MDAgICAg
MjU1NCAgICAgKzU0Cj4gc2htZW1fc3dhcGluX3BhZ2UgICAgICAgICAgICAgICAgICAgICAgICAg
ICAxMTQ1ICAgIDExOTcgICAgICs1Mgo+IHNobWVtX3VuZG9fcmFuZ2UgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgMTY2OSAgICAxNzE5ICAgICArNTAKPiBfX3Rlc3Rfc2V0X3BhZ2Vfd3JpdGVi
YWNrICAgICAgICAgICAgICAgICAgICA2MjAgICAgIDY3MCAgICAgKzUwCj4gX19zZXRfcGFnZV9k
aXJ0eV9idWZmZXJzICAgICAgICAgICAgICAgICAgICAgMTg3ICAgICAyMzcgICAgICs1MAo+IF9f
cGFnZXZlY19scnVfYWRkICAgICAgICAgICAgICAgICAgICAgICAgICAgIDc1NyAgICAgODA3ICAg
ICArNTAKPiBfX211bmxvY2tfcGFnZXZlYyAgICAgICAgICAgICAgICAgICAgICAgICAgIDExNTUg
ICAgMTIwNSAgICAgKzUwCj4gX19kdW1wX3BhZ2UgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAxMTAxICAgIDExNTEgICAgICs1MAo+IF9fY2FuY2VsX2RpcnR5X3BhZ2UgICAgICAgICAg
ICAgICAgICAgICAgICAgIDE4MiAgICAgMjMyICAgICArNTAKPiBfX3JlbW92ZV9tYXBwaW5nICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICA0NjEgICAgIDUxMCAgICAgKzQ5Cj4gcm1hcF93YWxr
X2ZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDAyICAgICA0NDkgICAgICs0Nwo+
IGlzb2xhdGVfbW92YWJsZV9wYWdlICAgICAgICAgICAgICAgICAgICAgICAgIDI0MCAgICAgMjg3
ICAgICArNDcKPiB0ZXN0X2NsZWFyX3BhZ2Vfd3JpdGViYWNrICAgICAgICAgICAgICAgICAgICA2
NjggICAgIDcxNCAgICAgKzQ2Cj4gcGFnZV9jYWNoZV9waXBlX2J1Zl90cnlfc3RlYWwgICAgICAg
ICAgICAgICAgMTcxICAgICAyMTcgICAgICs0Ngo+IHBhZ2VfZW5kaW8gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDI0NiAgICAgMjkwICAgICArNDQKPiBwYWdlX2ZpbGVfbWFwcGlu
ZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gICAgICA0MyAgICAgKzQzCj4gX19pc29s
YXRlX2xydV9wYWdlX3ByZXBhcmUgICAgICAgICAgICAgICAgICAgMjU0ICAgICAyOTcgICAgICs0
Mwo+IGh1Z2V0bGJfcGFnZV9tYXBwaW5nX2xvY2tfd3JpdGUgICAgICAgICAgICAgICAzOSAgICAg
IDgxICAgICArNDIKPiBpb21hcF9zZXRfcGFnZV9kaXJ0eSAgICAgICAgICAgICAgICAgICAgICAg
ICAxMTAgICAgIDE1MSAgICAgKzQxCj4gY2xlYXJfcGFnZV9kaXJ0eV9mb3JfaW8gICAgICAgICAg
ICAgICAgICAgICAgMzI0ICAgICAzNjQgICAgICs0MAo+IHdhaXRfb25fcGFnZV93cml0ZWJhY2tf
a2lsbGFibGUgICAgICAgICAgICAgIDExOCAgICAgMTU3ICAgICArMzkKPiB3YWl0X29uX3BhZ2Vf
d3JpdGViYWNrICAgICAgICAgICAgICAgICAgICAgICAxMDUgICAgIDE0NCAgICAgKzM5Cj4gc2V0
X3BhZ2VfZGlydHkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMTU5ICAgICAxOTggICAg
ICszOQo+IHB1dGJhY2tfbW92YWJsZV9wYWdlICAgICAgICAgICAgICAgICAgICAgICAgICAzMiAg
ICAgIDcxICAgICArMzkKPiBwYWdlX21rY2xlYW4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAxNzIgICAgIDIxMSAgICAgKzM5Cj4gbWFya19idWZmZXJfZGlydHkgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgMTc2ICAgICAyMTUgICAgICszOQo+IGludmFsaWRhdGVfaW5vZGVfcGFn
ZSAgICAgICAgICAgICAgICAgICAgICAgIDEyMiAgICAgMTYxICAgICArMzkKPiBkZWxldGVfZnJv
bV9wYWdlX2NhY2hlICAgICAgICAgICAgICAgICAgICAgICAxMzkgICAgIDE3OCAgICAgKzM5Cj4g
UGFnZU1vdmFibGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDQ5ICAgICAgODYg
ICAgICszNwo+IGlzb2xhdGVfbWlncmF0ZXBhZ2VzX2Jsb2NrICAgICAgICAgICAgICAgICAgMjg0
MyAgICAyODcyICAgICArMjkKPiBUb3RhbDogQmVmb3JlPTE3MDY4NjQ4LCBBZnRlcj0xNzA3MDYw
OCwgY2hnICswLjAxJQo+ICAgCj4+IFdpbGx5IGNhbiBtb3N0IHByb2JhYmx5IGdpdmUgdGhlIGJl
c3QgYWR2aXNlIGhlcmUgOikKPiAKPiBJIHRoaW5rIHRoYXQncyB3aGF0IGZvbGlvcyBhcmUgZm9y
IDopCgpFeGFjdGx5IG15IHRob3VnaHQuIDopCgoKLS0gClRoYW5rcywKCkRhdmlkIC8gZGhpbGRl
bmIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
