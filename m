Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82283C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:48:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB4760FF1
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB4760FF1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=US1hbPKV1MJRw0dOOJnt0MR1qr7Tkn6PK+QBc7epSck=; b=pe1JlavNMlhboMf9ER+P+kT4L
	hexZKZSk0z/yGOhYoKr0TYAgsjxPNAkeaKd8tsbxidZ/YjjRsKHl9T8e4mTs8FeXmUoIWrh0tYriv
	Ue2AUu/NCwLBxg+ZqRpFyCDggMKxgYeRMpnYkJJF3O3pGV4SMdPS/i+i0qYPr22s8GAgTmn8IImHS
	zvcceEG13M2XrKuhAHwS04VzAxGsWrouDKw1OoRFssruEXDotB+oBAjHGMZIX/yW3NUBSQEswJT0q
	GC1lntoopYHwHaF0gGT1ygcYCbdpt4mj+XUDkmF51fPBuR7Kd39CO43hfOMkmiorY0G9kOHPCCmXA
	xA5aHYI3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQVT-009cMd-Vu; Mon, 19 Apr 2021 09:47:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQOv-009aaO-Ep
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 09:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=GeFgKAw6h+mPcXVcc4bWq1BMFLAt/JiFop1ZWmN9P3g=; b=G/QmngpDt2DNTTsjVrWyHLhhFp
 ac3ndyzk259HWIijzFioY0AF36C2oD8O5KyTZcrUx/QSaatvkKECXf0iIOeVXSjFZklQZlRmmpWhY
 bVXgdPP7csVjqRnEr89cs0oZ24de2csRalExcXBwVBB6Likf3kf5C6pgxQs6hOQnpAbD2rMMtjKYX
 GX0i6QBEjwvqK/7bAEUx4cdhj8L2xjWk8FFunMhyeHZEei76ibIcusmbnr/TtyoybJH3Q/MiyuwUI
 8KO91iAc1TORP+35PwWCN5xWrdMvr+/kXz9g+lYtVGPpjXuYWpJpmkbK8fhOObpYQOFu7IJ6Ez7Hx
 mLh8ESOA==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQOs-00BF41-ML
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 09:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618825261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GeFgKAw6h+mPcXVcc4bWq1BMFLAt/JiFop1ZWmN9P3g=;
 b=LYf2L6MEpGP+taPQ+c71oAmRp8HJgwKb7RBJ87QLn7kCr7/xDesXz/eCHmpIcgC6DuN4rS
 EnUgA2hKvqPei03QRgn35CSIfXSuEAs2INKeoKfbyDI34Z4EzbgOoTDT+l+TfwmapM2W66
 LWylpYS9oGZhE0k+btfc3shU57PBn6E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-3NOD9oSbOgmnXDndehwtKg-1; Mon, 19 Apr 2021 05:41:00 -0400
X-MC-Unique: 3NOD9oSbOgmnXDndehwtKg-1
Received: by mail-ej1-f71.google.com with SMTP id
 c18-20020a17090603d2b029037c77ad778eso3424059eja.1
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 02:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GeFgKAw6h+mPcXVcc4bWq1BMFLAt/JiFop1ZWmN9P3g=;
 b=EFN/T0vnaTG971ylQsu9n2UVzA/vr8TvP0ssY4OoDC/L9cmGxh+6p5vhgLbFw5STTX
 0EBpQhR6KE5c3Cx+V8xzopJP1JTHtgpP7EyTosW0BwwuDswPMLAPP/CVZDBVZNxc6F/o
 ZqNCqmNdcNN+Dljs0NH64+GOg2onrx0z17A0J0LbSVLKCQ/w3HxIavxlFz7RdN8IAJ4U
 +SbfqBwSGXRc6hL9yQSpKF1nR/vLJs0sOC3jC392WOXpbf3gb7ret17a59FjkXfaRvC8
 tU8JMl6Ci53GT77BjL8ruSsm7Kht59P8GNCRFOzHpznv4VH+4+RYEE1oCuleAPCDsjuW
 jrRA==
X-Gm-Message-State: AOAM531rhP8YXpzhjlpbCRTxDivAYElZFqgNbtKicNM5ArgZy98JrKf4
 XXEaIDICn5uY03KPzUjM8E+dLZGBKZZFF2Ds2sh+ff+9TqvSwL7wgpyYFEmaZ8SxPLbtvGvCGtP
 UUVPjOssBxOoK+nJ9trG+GMHhG3mY
X-Received: by 2002:aa7:dcd3:: with SMTP id w19mr404791edu.157.1618825258843; 
 Mon, 19 Apr 2021 02:40:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUep/F2sYsfc/GbdpC874xEruErysvjZiJSGRDsYz4g5yz9xbr6J9pJm9MKGKGsnTSZWCpUQ==
X-Received: by 2002:aa7:dcd3:: with SMTP id w19mr404773edu.157.1618825258627; 
 Mon, 19 Apr 2021 02:40:58 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c69b8.dip0.t-ipconnect.de. [91.12.105.184])
 by smtp.gmail.com with ESMTPSA id b6sm1276048edd.18.2021.04.19.02.40.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:40:58 -0700 (PDT)
Subject: Re: [PATCH] secretmem: optimize page_is_secretmem()
From: David Hildenbrand <david@redhat.com>
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
Organization: Red Hat
Message-ID: <56d8b80c-ce2c-ed86-0eda-253768d8d463@redhat.com>
Date: Mon, 19 Apr 2021 11:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <f4d0c4bf-423b-e227-444b-f1ea722dc43f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_024102_821053_A67880F5 
X-CRM114-Status: GOOD (  26.18  )
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

T24gMTkuMDQuMjEgMTE6MzgsIERhdmlkIEhpbGRlbmJyYW5kIHdyb3RlOgo+IE9uIDE5LjA0LjIx
IDExOjM2LCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+PiBPbiBNb24sIEFwciAxOSwgMjAyMSBhdCAx
MToxNTowMkFNICswMjAwLCBEYXZpZCBIaWxkZW5icmFuZCB3cm90ZToKPj4+IE9uIDE5LjA0LjIx
IDEwOjQyLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+Pj4+IEZyb206IE1pa2UgUmFwb3BvcnQgPHJw
cHRAbGludXguaWJtLmNvbT4KPj4+Pgo+Pj4+IEtlcm5lbCB0ZXN0IHJvYm90IHJlcG9ydGVkIC00
LjIlIHJlZ3Jlc3Npb24gb2Ygd2lsbC1pdC1zY2FsZS5wZXJfdGhyZWFkX29wcwo+Pj4+IGR1ZSB0
byBjb21taXQgIm1tOiBpbnRyb2R1Y2UgbWVtZmRfc2VjcmV0IHN5c3RlbSBjYWxsIHRvIGNyZWF0
ZSAic2VjcmV0Igo+Pj4+IG1lbW9yeSBhcmVhcyIuCj4+Pj4KPj4+PiBUaGUgcGVyZiBwcm9maWxl
IG9mIHRoZSB0ZXN0IGluZGljYXRlZCB0aGF0IHRoZSByZWdyZXNzaW9uIGlzIGNhdXNlZCBieQo+
Pj4+IHBhZ2VfaXNfc2VjcmV0bWVtKCkgY2FsbGVkIGZyb20gZ3VwX3B0ZV9yYW5nZSgpIChpbmxp
bmVkIGJ5IGd1cF9wZ2RfcmFuZ2UpOgo+Pj4+Cj4+Pj4gICAgIDI3Ljc2ICArMi41ICAzMC4yMyAg
ICAgICBwZXJmLXByb2ZpbGUuY2hpbGRyZW4uY3ljbGVzLXBwLmd1cF9wZ2RfcmFuZ2UKPj4+PiAg
ICAgIDAuMDAgICszLjIgICAzLjE5IMKxIDIlICBwZXJmLXByb2ZpbGUuY2hpbGRyZW4uY3ljbGVz
LXBwLnBhZ2VfbWFwcGluZwo+Pj4+ICAgICAgMC4wMCAgKzMuNyAgIDMuNjYgwrEgMiUgIHBlcmYt
cHJvZmlsZS5jaGlsZHJlbi5jeWNsZXMtcHAucGFnZV9pc19zZWNyZXRtZW0KPj4+Pgo+Pj4+IEZ1
cnRoZXIgYW5hbHlzaXMgc2hvd2VkIHRoYXQgdGhlIHNsb3cgZG93biBoYXBwZW5zIGJlY2F1c2Ug
bmVpdGhlcgo+Pj4+IHBhZ2VfaXNfc2VjcmV0bWVtKCkgbm9yIHBhZ2VfbWFwcGluZygpIGFyZSBu
b3QgaW5saW5lIGFuZCBtb3Jlb3ZlciwKPj4+PiBtdWx0aXBsZSBwYWdlIGZsYWdzIGNoZWNrcyBp
biBwYWdlX21hcHBpbmcoKSBpbnZvbHZlIGNhbGxpbmcKPj4+PiBjb21wb3VuZF9oZWFkKCkgc2V2
ZXJhbCB0aW1lcyBmb3IgdGhlIHNhbWUgcGFnZS4KPj4+Pgo+Pj4+IE1ha2UgcGFnZV9pc19zZWNy
ZXRtZW0oKSBpbmxpbmUgYW5kIHJlcGxhY2UgcGFnZV9tYXBwaW5nKCkgd2l0aCBwYWdlIGZsYWcK
Pj4+PiBjaGVja3MgdGhhdCBkbyBub3QgaW1wbHkgcGFnZS10by1oZWFkIGNvbnZlcnNpb24uCj4+
Pj4KPj4+PiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPG9saXZlci5zYW5nQGludGVs
LmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LmlibS5j
b20+Cj4+Pj4gLS0tCj4+Pj4KPj4+PiBAQW5kcmV3LAo+Pj4+IFRoZSBwYXRjaCBpcyB2cyB2NS4x
Mi1yYzctbW1vdHMtMjAyMS0wNC0xNS0xNi0yOCwgSSdkIGFwcHJlY2lhdGUgaWYgaXQgd291bGQK
Pj4+PiBiZSBhZGRlZCBhcyBhIGZpeHVwIHRvIHRoZSBtZW1mZF9zZWNyZXQgc2VyaWVzLgo+Pj4+
Cj4+Pj4gICAgIGluY2x1ZGUvbGludXgvc2VjcmV0bWVtLmggfCAyNiArKysrKysrKysrKysrKysr
KysrKysrKysrLQo+Pj4+ICAgICBtbS9zZWNyZXRtZW0uYyAgICAgICAgICAgIHwgMTIgKy0tLS0t
LS0tLS0tCj4+Pj4gICAgIDIgZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9zZWNyZXRtZW0u
aCBiL2luY2x1ZGUvbGludXgvc2VjcmV0bWVtLmgKPj4+PiBpbmRleCA5MDdhNjczNDA1OWMuLmI4
NDJiMzhjYmViMSAxMDA2NDQKPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NlY3JldG1lbS5oCj4+
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9zZWNyZXRtZW0uaAo+Pj4+IEBAIC00LDggKzQsMzIgQEAK
Pj4+PiAgICAgI2lmZGVmIENPTkZJR19TRUNSRVRNRU0KPj4+PiArZXh0ZXJuIGNvbnN0IHN0cnVj
dCBhZGRyZXNzX3NwYWNlX29wZXJhdGlvbnMgc2VjcmV0bWVtX2FvcHM7Cj4+Pj4gKwo+Pj4+ICtz
dGF0aWMgaW5saW5lIGJvb2wgcGFnZV9pc19zZWNyZXRtZW0oc3RydWN0IHBhZ2UgKnBhZ2UpCj4+
Pj4gK3sKPj4+PiArCXN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5nOwo+Pj4+ICsKPj4+PiAr
CS8qCj4+Pj4gKwkgKiBVc2luZyBwYWdlX21hcHBpbmcoKSBpcyBxdWl0ZSBzbG93IGJlY2F1c2Ug
b2YgdGhlIGFjdHVhbCBjYWxsCj4+Pj4gKwkgKiBpbnN0cnVjdGlvbiBhbmQgcmVwZWF0ZWQgY29t
cG91bmRfaGVhZChwYWdlKSBpbnNpZGUgdGhlCj4+Pj4gKwkgKiBwYWdlX21hcHBpbmcoKSBmdW5j
dGlvbi4KPj4+PiArCSAqIFdlIGtub3cgdGhhdCBzZWNyZXRtZW0gcGFnZXMgYXJlIG5vdCBjb21w
b3VuZCBhbmQgTFJVIHNvIHdlIGNhbgo+Pj4+ICsJICogc2F2ZSBhIGNvdXBsZSBvZiBjeWNsZXMg
aGVyZS4KPj4+PiArCSAqLwo+Pj4+ICsJaWYgKFBhZ2VDb21wb3VuZChwYWdlKSB8fCAhUGFnZUxS
VShwYWdlKSkKPj4+PiArCQlyZXR1cm4gZmFsc2U7Cj4+Pgo+Pj4gSSdkIGFzc3VtZSBzZWNyZXRt
ZW0gcGFnZXMgYXJlIHJhcmUgaW4gYmFzaWNhbGx5IGV2ZXJ5IHNldHVwIG91dCB0aGVyZS4gU28K
Pj4+IG1heWJlIHRocm93aW5nIGluIGEgY291cGxlIG9mIGxpa2VseSgpL3VubGlrZWx5KCkgbWln
aHQgbWFrZSBzZW5zZS4KPj4KPj4gSSdkIHNheSB3ZSBjb3VsZCBkbyB1bmxpa2VseShwYWdlX2lz
X3NlY3JldG1lbSgpKSBhdCBjYWxsIHNpdGVzLiBIZXJlIEkgY2FuCj4+IGhhcmRseSBlc3RpbWF0
ZSB3aGljaCBwYWdlcyBhcmUgZ29pbmcgdG8gYmUgY2hlY2tlZC4KPj4gICAgCj4+Pj4gKwo+Pj4+
ICsJbWFwcGluZyA9IChzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqKQo+Pj4+ICsJCSgodW5zaWduZWQg
bG9uZylwYWdlLT5tYXBwaW5nICYgflBBR0VfTUFQUElOR19GTEFHUyk7Cj4+Pj4gKwo+Pj4KPj4+
IE5vdCBzdXJlIGlmIG9wZW4tY29kaW5nIHBhZ2VfbWFwcGluZyBpcyByZWFsbHkgYSBnb29kIGlk
ZWEgaGVyZSAtLSBvciBldmVuCj4+PiBuZWNlc3NhcnkgYWZ0ZXIgdGhlIGZhc3QgcGF0aCBhYm92
ZSBpcyBpbiBwbGFjZS4gQW55aG93LCBqdXN0IG15IDIgY2VudHMuCj4+Cj4+IFdlbGwsIG1vc3Qg
aWYgdGhlIC00LjIlIG9mIHRoZSBwZXJmb3JtYW5jZSByZWdyZXNzaW9uIGtidWlsZCByZXBvcnRl
ZCB3ZXJlCj4+IGR1ZSB0byByZXBlYXRlZCBjb21wb3VudF9oZWFkKHBhZ2UpIGluIHBhZ2VfbWFw
cGluZygpLiBTbyB0aGUgd2hvbGUgcG9pbnQKPj4gb2YgdGhpcyBwYXRjaCBpcyB0byBhdm9pZCBj
YWxsaW5nIHBhZ2VfbWFwcGluZygpLgo+IAo+IEkgd291bGQgaGF2ZSB0aG91Z2h0IHRoZSBmYXN0
IHBhdGggIihQYWdlQ29tcG91bmQocGFnZSkgfHwKPiAhUGFnZUxSVShwYWdlKSkiIHdvdWxkIGFs
cmVhZHkgYXZvaWQgY2FsbGluZyBwYWdlX21hcHBpbmcoKSBpbiBtYW55IGNhc2VzLgoKKGFuZCBJ
IGRvIHdvbmRlciBpZiBhIGdlbmVyaWMgcGFnZV9tYXBwaW5nKCkgb3B0aW1pemF0aW9uIHdvdWxk
IG1ha2UgCnNlbnNlIGluc3RlYWQpCgpXaWxseSBjYW4gbW9zdCBwcm9iYWJseSBnaXZlIHRoZSBi
ZXN0IGFkdmlzZSBoZXJlIDopCgotLSAKVGhhbmtzLAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
