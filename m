Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77005C43603
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:39:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 048F060FF3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:39:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 048F060FF3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=42X2vbl9VJ8J53Uj9+FIaoTUW8kkkj6Ow82/HrJVAjU=; b=fByOySFFayTZpaOEx0dWvrQDT
	dlU0emyF2KDmRp9xiEhqua0E8Qbc5D5V3/VBDUCjVmPyEbJcKNhopJ8E1ujVEzFyfMn6p4FOV1Za8
	RmdTLXbtNOTM9W7ojMs2T5sm32vvMt470E4o9pElcYMPSoY5GRKW/4RMjch3NxUWOqteQmekZ3KT/
	Nia3ESuL0nknTvWsINwaXSKkSE+pFwYZz2EwcV9Ra+d6REs1Hp16+LSl/xze02jvhmiLkK3UMelNQ
	WjMl1qZ89012Xe4Ir3ftwJxNAlPO/Jm8b/tcYyHW+bRkrpxWw7rDTekrZrl7Zh8fSCrhBH/0Z6YvS
	aHQcx0XPw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYQN6-009a2j-OQ; Mon, 19 Apr 2021 09:39:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQMo-009ZvX-Mh
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 09:38:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=W9MP8cjbzcrX9DzJPJwd3PFnkP3wW8EZhTQvmYtyhYA=; b=ZB3NtfBOhL4bNTWvkVOAeavumQ
 gtFiBKBCdTEn6uNVbGCMHqrVDH0MFJwVfAVEd21NIA9PFVbU9JvKf8H1qJ3CobYRAMzDocb0pRrxa
 lHQadFdJebyT1vEOTn5otJgHzh3veS4HU8pc6E3rYIQVsxJJ2obYkeh0dsSDPpmIp94U4L6vhTwcK
 Y0htGyRAtBRWHKfBEz7cMNfUQFbYD9jN+32xz6gVu/ObvGYU9p5ngxuy6o2Z9FDqmD50G3mAw1ChV
 o16wiRNMxy3SBaUer6CTgkbM5r7COiZ2PjA5SUwpLUy8GWe6L3y2A8VH0hyJz3h5zIU3KtsSgqmBp
 iAtoeLbA==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYQMi-00BEog-JC
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 09:38:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618825127;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W9MP8cjbzcrX9DzJPJwd3PFnkP3wW8EZhTQvmYtyhYA=;
 b=WjqclfNhOnm4j0SgIg86CmUN71xGal1PzaJQbeQjeHPvDvv7BCH/K+2xOXRe9RXTpkj2Mf
 fbHcOFSLMMY8Atz/06DF94OsM4dJN01gjeCV24agFXDX4FTBiQ6NLyt/pzqj1QEsBGmgig
 LZyBoip8SSJcgh3vM3VOlSN5hZD75FI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-571-o2rxVJTvPVOGsFmi2vohMw-1; Mon, 19 Apr 2021 05:38:44 -0400
X-MC-Unique: o2rxVJTvPVOGsFmi2vohMw-1
Received: by mail-ej1-f70.google.com with SMTP id
 o25-20020a1709061d59b029037c94676df5so3438074ejh.7
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 02:38:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W9MP8cjbzcrX9DzJPJwd3PFnkP3wW8EZhTQvmYtyhYA=;
 b=NdepHB4DODT097pViHa8BaWHZIO9S2xBsHVijDn9BJiNKUozbna2x5GngIZ+ljYfso
 Ta+U1S4obBpL6+kd/Fwb5pb5h/koCcAwgnmBoJWozaQXd4hq9LxXSp5GSw7TQybnd/LN
 O8KfoPK48ywHRXsEL2681yHFtXA8U4LnralWegjSf1F0kmqSndbQk2qKQ44ToTGiaWLq
 5lM5T/6nFskrPUBpSjOq8rkc0gDCY4kjBSQthISn6I3unYomh3ykujV2ZtHp5JlZu6hE
 Wp7TetKLC63e70jbAOSm57QvnPM+OoZCkdOdiuJ3vcwtaRObzwej04ABi2fdb6OHNYs7
 wE5Q==
X-Gm-Message-State: AOAM532XLfyyuSDvoxojbDTQh0Mtl1Wx5WjaX/tNDvK5tqA9NDPVE1g5
 g899QhTz2m4Kykkj1q0LFkoUESzz08/isRxII5a3BOihUiUTLNQ1uE18kd45IWwjDYbSIDjJ3G6
 /qwltFjR2/PDJanWchBsRWfqUBDYP
X-Received: by 2002:a17:906:98d6:: with SMTP id
 zd22mr16697367ejb.17.1618825122872; 
 Mon, 19 Apr 2021 02:38:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGQ30kMI3cddajeZS/U8PQuAuuPoix56tOatD7f6VV3+y8LgKZjvgSrEGol9OdxIgtH/QwWg==
X-Received: by 2002:a17:906:98d6:: with SMTP id
 zd22mr16697331ejb.17.1618825122657; 
 Mon, 19 Apr 2021 02:38:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c69b8.dip0.t-ipconnect.de. [91.12.105.184])
 by smtp.gmail.com with ESMTPSA id x7sm11903755eds.67.2021.04.19.02.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:38:42 -0700 (PDT)
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <f4d0c4bf-423b-e227-444b-f1ea722dc43f@redhat.com>
Date: Mon, 19 Apr 2021 11:38:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YH1PE4oWeicpJT9g@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_023848_719763_69437BE6 
X-CRM114-Status: GOOD (  27.20  )
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

T24gMTkuMDQuMjEgMTE6MzYsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gT24gTW9uLCBBcHIgMTks
IDIwMjEgYXQgMTE6MTU6MDJBTSArMDIwMCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+IE9u
IDE5LjA0LjIxIDEwOjQyLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+Pj4gRnJvbTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Pj4KPj4+IEtlcm5lbCB0ZXN0IHJvYm90IHJlcG9y
dGVkIC00LjIlIHJlZ3Jlc3Npb24gb2Ygd2lsbC1pdC1zY2FsZS5wZXJfdGhyZWFkX29wcwo+Pj4g
ZHVlIHRvIGNvbW1pdCAibW06IGludHJvZHVjZSBtZW1mZF9zZWNyZXQgc3lzdGVtIGNhbGwgdG8g
Y3JlYXRlICJzZWNyZXQiCj4+PiBtZW1vcnkgYXJlYXMiLgo+Pj4KPj4+IFRoZSBwZXJmIHByb2Zp
bGUgb2YgdGhlIHRlc3QgaW5kaWNhdGVkIHRoYXQgdGhlIHJlZ3Jlc3Npb24gaXMgY2F1c2VkIGJ5
Cj4+PiBwYWdlX2lzX3NlY3JldG1lbSgpIGNhbGxlZCBmcm9tIGd1cF9wdGVfcmFuZ2UoKSAoaW5s
aW5lZCBieSBndXBfcGdkX3JhbmdlKToKPj4+Cj4+PiAgICAyNy43NiAgKzIuNSAgMzAuMjMgICAg
ICAgcGVyZi1wcm9maWxlLmNoaWxkcmVuLmN5Y2xlcy1wcC5ndXBfcGdkX3JhbmdlCj4+PiAgICAg
MC4wMCAgKzMuMiAgIDMuMTkgwrEgMiUgIHBlcmYtcHJvZmlsZS5jaGlsZHJlbi5jeWNsZXMtcHAu
cGFnZV9tYXBwaW5nCj4+PiAgICAgMC4wMCAgKzMuNyAgIDMuNjYgwrEgMiUgIHBlcmYtcHJvZmls
ZS5jaGlsZHJlbi5jeWNsZXMtcHAucGFnZV9pc19zZWNyZXRtZW0KPj4+Cj4+PiBGdXJ0aGVyIGFu
YWx5c2lzIHNob3dlZCB0aGF0IHRoZSBzbG93IGRvd24gaGFwcGVucyBiZWNhdXNlIG5laXRoZXIK
Pj4+IHBhZ2VfaXNfc2VjcmV0bWVtKCkgbm9yIHBhZ2VfbWFwcGluZygpIGFyZSBub3QgaW5saW5l
IGFuZCBtb3Jlb3ZlciwKPj4+IG11bHRpcGxlIHBhZ2UgZmxhZ3MgY2hlY2tzIGluIHBhZ2VfbWFw
cGluZygpIGludm9sdmUgY2FsbGluZwo+Pj4gY29tcG91bmRfaGVhZCgpIHNldmVyYWwgdGltZXMg
Zm9yIHRoZSBzYW1lIHBhZ2UuCj4+Pgo+Pj4gTWFrZSBwYWdlX2lzX3NlY3JldG1lbSgpIGlubGlu
ZSBhbmQgcmVwbGFjZSBwYWdlX21hcHBpbmcoKSB3aXRoIHBhZ2UgZmxhZwo+Pj4gY2hlY2tzIHRo
YXQgZG8gbm90IGltcGx5IHBhZ2UtdG8taGVhZCBjb252ZXJzaW9uLgo+Pj4KPj4+IFJlcG9ydGVk
LWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8b2xpdmVyLnNhbmdAaW50ZWwuY29tPgo+Pj4gU2lnbmVk
LW9mZi1ieTogTWlrZSBSYXBvcG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+Pj4gLS0tCj4+Pgo+
Pj4gQEFuZHJldywKPj4+IFRoZSBwYXRjaCBpcyB2cyB2NS4xMi1yYzctbW1vdHMtMjAyMS0wNC0x
NS0xNi0yOCwgSSdkIGFwcHJlY2lhdGUgaWYgaXQgd291bGQKPj4+IGJlIGFkZGVkIGFzIGEgZml4
dXAgdG8gdGhlIG1lbWZkX3NlY3JldCBzZXJpZXMuCj4+Pgo+Pj4gICAgaW5jbHVkZS9saW51eC9z
ZWNyZXRtZW0uaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKystCj4+PiAgICBtbS9zZWNy
ZXRtZW0uYyAgICAgICAgICAgIHwgMTIgKy0tLS0tLS0tLS0tCj4+PiAgICAyIGZpbGVzIGNoYW5n
ZWQsIDI2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L3NlY3JldG1lbS5oIGIvaW5jbHVkZS9saW51eC9zZWNyZXRtZW0uaAo+
Pj4gaW5kZXggOTA3YTY3MzQwNTljLi5iODQyYjM4Y2JlYjEgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNs
dWRlL2xpbnV4L3NlY3JldG1lbS5oCj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L3NlY3JldG1lbS5o
Cj4+PiBAQCAtNCw4ICs0LDMyIEBACj4+PiAgICAjaWZkZWYgQ09ORklHX1NFQ1JFVE1FTQo+Pj4g
K2V4dGVybiBjb25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFjZV9vcGVyYXRpb25zIHNlY3JldG1lbV9h
b3BzOwo+Pj4gKwo+Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBwYWdlX2lzX3NlY3JldG1lbShzdHJ1
Y3QgcGFnZSAqcGFnZSkKPj4+ICt7Cj4+PiArCXN0cnVjdCBhZGRyZXNzX3NwYWNlICptYXBwaW5n
Owo+Pj4gKwo+Pj4gKwkvKgo+Pj4gKwkgKiBVc2luZyBwYWdlX21hcHBpbmcoKSBpcyBxdWl0ZSBz
bG93IGJlY2F1c2Ugb2YgdGhlIGFjdHVhbCBjYWxsCj4+PiArCSAqIGluc3RydWN0aW9uIGFuZCBy
ZXBlYXRlZCBjb21wb3VuZF9oZWFkKHBhZ2UpIGluc2lkZSB0aGUKPj4+ICsJICogcGFnZV9tYXBw
aW5nKCkgZnVuY3Rpb24uCj4+PiArCSAqIFdlIGtub3cgdGhhdCBzZWNyZXRtZW0gcGFnZXMgYXJl
IG5vdCBjb21wb3VuZCBhbmQgTFJVIHNvIHdlIGNhbgo+Pj4gKwkgKiBzYXZlIGEgY291cGxlIG9m
IGN5Y2xlcyBoZXJlLgo+Pj4gKwkgKi8KPj4+ICsJaWYgKFBhZ2VDb21wb3VuZChwYWdlKSB8fCAh
UGFnZUxSVShwYWdlKSkKPj4+ICsJCXJldHVybiBmYWxzZTsKPj4KPj4gSSdkIGFzc3VtZSBzZWNy
ZXRtZW0gcGFnZXMgYXJlIHJhcmUgaW4gYmFzaWNhbGx5IGV2ZXJ5IHNldHVwIG91dCB0aGVyZS4g
U28KPj4gbWF5YmUgdGhyb3dpbmcgaW4gYSBjb3VwbGUgb2YgbGlrZWx5KCkvdW5saWtlbHkoKSBt
aWdodCBtYWtlIHNlbnNlLgo+IAo+IEknZCBzYXkgd2UgY291bGQgZG8gdW5saWtlbHkocGFnZV9p
c19zZWNyZXRtZW0oKSkgYXQgY2FsbCBzaXRlcy4gSGVyZSBJIGNhbgo+IGhhcmRseSBlc3RpbWF0
ZSB3aGljaCBwYWdlcyBhcmUgZ29pbmcgdG8gYmUgY2hlY2tlZC4KPiAgIAo+Pj4gKwo+Pj4gKwlt
YXBwaW5nID0gKHN0cnVjdCBhZGRyZXNzX3NwYWNlICopCj4+PiArCQkoKHVuc2lnbmVkIGxvbmcp
cGFnZS0+bWFwcGluZyAmIH5QQUdFX01BUFBJTkdfRkxBR1MpOwo+Pj4gKwo+Pgo+PiBOb3Qgc3Vy
ZSBpZiBvcGVuLWNvZGluZyBwYWdlX21hcHBpbmcgaXMgcmVhbGx5IGEgZ29vZCBpZGVhIGhlcmUg
LS0gb3IgZXZlbgo+PiBuZWNlc3NhcnkgYWZ0ZXIgdGhlIGZhc3QgcGF0aCBhYm92ZSBpcyBpbiBw
bGFjZS4gQW55aG93LCBqdXN0IG15IDIgY2VudHMuCj4gCj4gV2VsbCwgbW9zdCBpZiB0aGUgLTQu
MiUgb2YgdGhlIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb24ga2J1aWxkIHJlcG9ydGVkIHdlcmUKPiBk
dWUgdG8gcmVwZWF0ZWQgY29tcG91bnRfaGVhZChwYWdlKSBpbiBwYWdlX21hcHBpbmcoKS4gU28g
dGhlIHdob2xlIHBvaW50Cj4gb2YgdGhpcyBwYXRjaCBpcyB0byBhdm9pZCBjYWxsaW5nIHBhZ2Vf
bWFwcGluZygpLgoKSSB3b3VsZCBoYXZlIHRob3VnaHQgdGhlIGZhc3QgcGF0aCAiKFBhZ2VDb21w
b3VuZChwYWdlKSB8fCAKIVBhZ2VMUlUocGFnZSkpIiB3b3VsZCBhbHJlYWR5IGF2b2lkIGNhbGxp
bmcgcGFnZV9tYXBwaW5nKCkgaW4gbWFueSBjYXNlcy4KCgotLSAKVGhhbmtzLAoKRGF2aWQgLyBk
aGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
