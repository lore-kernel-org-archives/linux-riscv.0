Return-Path: <SRS0=YGcN=JQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D79C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:15:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A3BF61107
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Apr 2021 09:15:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A3BF61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NP/kNsrdloCCqkDfBQqkulUosEhw2WQpPKX4esTRgew=; b=cXueynGEGxe97jMYXARqyGorC
	obVslRZeEUuarRP+N//eRgyKC6NdLChp7rDfPeuXG+QpXaqTlZ/XQ13LoLw3b2o2+0JoRIZdf4ZSv
	HR6SbYm+k8Tgd44pfWHTTTXzLvVw+zHZPovmvOJUS0SkC/BWzs1fcW+TE6Ul6JC3YU2yTBOtSmNme
	cikpdaCownJHE6pbbujoPwT9rNb8X0+PzlU3gHhdbgz0J6jXnlQNOvpSSsuTxNTg7CxaSGYu2kqHt
	+NLu/RHQSehXJ8outMlckALcTtBQNMdMB/skrTFzs3nhD0+mwIddFM2FdmHG1n17EpdC/fUgaPNWe
	zuS1JhDeQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYPzy-009WzA-6F; Mon, 19 Apr 2021 09:15:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPzv-009Wyu-2e
 for linux-riscv@desiato.infradead.org; Mon, 19 Apr 2021 09:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:Subject:From:References
 :Cc:To:Sender:Reply-To:Content-ID:Content-Description;
 bh=JJHH0NX3OsQ2e3bz8MbvbRBxnLsHKmu/POOlzwxl9eU=; b=HvKQ70KdxKewRcHR07DfTQwUAY
 OhkMcX46XiQ0303dKbV9Bw3/O4rfkXncTTaOgdgfF5MI8Te3KkiaJ95zMgotsCYvGfhyeNpAdyPpF
 dL8kKTdyX40Yb0rEtKCGlMrwNJpXIbHH/OeIsD3ph4MKa5LPmQS53YWlMI8yqzYKWWF6/6B0tKJ1C
 gj3w0YZBvJSca/uonZL3k7q1/LTLvpXHY7g2GW4SaMV5sYoreFffEXG0MBmmqnp5LcGWNJ14l66JJ
 Xd1jfBviHPzSQrv0PC8YkDTRziIJwshJADTcynHnfDtjmD7epG4wPwvpvEpnA8Zs/YVBT9GZRMsrp
 oGx2abMA==;
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYPzp-00BDo8-EN
 for linux-riscv@lists.infradead.org; Mon, 19 Apr 2021 09:15:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618823708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JJHH0NX3OsQ2e3bz8MbvbRBxnLsHKmu/POOlzwxl9eU=;
 b=QX2G3CzJ/NKD5UOg85qHAZTkn4RiYHvYTExtbc+L2jA7dhUw0gVsiT0k5iKqRzYhEVDons
 pF1+55fvvZBvw9Gn3JVIcieUx0XziS9/K+8s9SJ1s9J0VSkh8kwTvP28dW+dEFJcvlIqU0
 KMPI/jgfhyYGNVdLCq+Z1xq5xuU5A5w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-lVWUPvItObuYYQ7cueErRA-1; Mon, 19 Apr 2021 05:15:06 -0400
X-MC-Unique: lVWUPvItObuYYQ7cueErRA-1
Received: by mail-ej1-f70.google.com with SMTP id
 ne22-20020a1709077b96b02903803a047edeso2092734ejc.3
 for <linux-riscv@lists.infradead.org>; Mon, 19 Apr 2021 02:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JJHH0NX3OsQ2e3bz8MbvbRBxnLsHKmu/POOlzwxl9eU=;
 b=l71aTQP8SF5/tjln5kLCd/2TN399YsWK+6JpFo9sTdTF+WeL31ocOgDgahu4E5oA2Y
 1lvbG9VSTpw38jS8WXMLvwCASlbvhPZKYz1qk8rGczj25X/w6NvHBgS4Oo86PowmEUvd
 /UZqyIn+THBvV/LEuwpS1rD5gze59jLFxmYNt2Mow/fyuxWsEywU8SUnP3SIR1Q3pRv3
 cjVFHhK3ZRtFHC94c7FX3FZo2ltHloEOrOmaPWK62J8Xno73kkILt5PeOIdrbXJv9H4G
 5CjDfhImHM/wrix7jAYcSoclJJ9PxaAihESHqdGCMUpPk2DK6HFzt6Wz0EfbDf/VAXDZ
 LH/w==
X-Gm-Message-State: AOAM530uHHavqm+rBD/eioSJllW/6uWqMOmqO8UMKZ2TMtsxsm/68tbO
 IvnCkyaItzN8BDtjXZUDKl52U12UuKkMsNQ+a8blLBQyJ+MInv0pJB+SGIQ+yWJrtkKF5ymUFdY
 2b54XowWsfuX9wEAL7I6lwfZ1mWpt
X-Received: by 2002:a05:6402:42d1:: with SMTP id
 i17mr23711272edc.131.1618823705485; 
 Mon, 19 Apr 2021 02:15:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYzYlDX/eTm99p4Oo7Oz5LAmRLoDDSSTEdvjwkyJC6GdKrJUD2OsxJ6l4DnJdCX72CgXH3hg==
X-Received: by 2002:a05:6402:42d1:: with SMTP id
 i17mr23711232edc.131.1618823705193; 
 Mon, 19 Apr 2021 02:15:05 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c69b8.dip0.t-ipconnect.de. [91.12.105.184])
 by smtp.gmail.com with ESMTPSA id y16sm12144407edc.62.2021.04.19.02.15.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 02:15:04 -0700 (PDT)
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>, Dan Williams <dan.j.williams@intel.com>,
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
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH] secretmem: optimize page_is_secretmem()
Message-ID: <3b30ac54-8a92-5f54-28f0-f110a40700c7@redhat.com>
Date: Mon, 19 Apr 2021 11:15:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419084218.7466-1-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_021509_591237_D9DA52F9 
X-CRM114-Status: GOOD (  30.36  )
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

T24gMTkuMDQuMjEgMTA6NDIsIE1pa2UgUmFwb3BvcnQgd3JvdGU6Cj4gRnJvbTogTWlrZSBSYXBv
cG9ydCA8cnBwdEBsaW51eC5pYm0uY29tPgo+IAo+IEtlcm5lbCB0ZXN0IHJvYm90IHJlcG9ydGVk
IC00LjIlIHJlZ3Jlc3Npb24gb2Ygd2lsbC1pdC1zY2FsZS5wZXJfdGhyZWFkX29wcwo+IGR1ZSB0
byBjb21taXQgIm1tOiBpbnRyb2R1Y2UgbWVtZmRfc2VjcmV0IHN5c3RlbSBjYWxsIHRvIGNyZWF0
ZSAic2VjcmV0Igo+IG1lbW9yeSBhcmVhcyIuCj4gCj4gVGhlIHBlcmYgcHJvZmlsZSBvZiB0aGUg
dGVzdCBpbmRpY2F0ZWQgdGhhdCB0aGUgcmVncmVzc2lvbiBpcyBjYXVzZWQgYnkKPiBwYWdlX2lz
X3NlY3JldG1lbSgpIGNhbGxlZCBmcm9tIGd1cF9wdGVfcmFuZ2UoKSAoaW5saW5lZCBieSBndXBf
cGdkX3JhbmdlKToKPiAKPiAgIDI3Ljc2ICArMi41ICAzMC4yMyAgICAgICBwZXJmLXByb2ZpbGUu
Y2hpbGRyZW4uY3ljbGVzLXBwLmd1cF9wZ2RfcmFuZ2UKPiAgICAwLjAwICArMy4yICAgMy4xOSDC
sSAyJSAgcGVyZi1wcm9maWxlLmNoaWxkcmVuLmN5Y2xlcy1wcC5wYWdlX21hcHBpbmcKPiAgICAw
LjAwICArMy43ICAgMy42NiDCsSAyJSAgcGVyZi1wcm9maWxlLmNoaWxkcmVuLmN5Y2xlcy1wcC5w
YWdlX2lzX3NlY3JldG1lbQo+IAo+IEZ1cnRoZXIgYW5hbHlzaXMgc2hvd2VkIHRoYXQgdGhlIHNs
b3cgZG93biBoYXBwZW5zIGJlY2F1c2UgbmVpdGhlcgo+IHBhZ2VfaXNfc2VjcmV0bWVtKCkgbm9y
IHBhZ2VfbWFwcGluZygpIGFyZSBub3QgaW5saW5lIGFuZCBtb3Jlb3ZlciwKPiBtdWx0aXBsZSBw
YWdlIGZsYWdzIGNoZWNrcyBpbiBwYWdlX21hcHBpbmcoKSBpbnZvbHZlIGNhbGxpbmcKPiBjb21w
b3VuZF9oZWFkKCkgc2V2ZXJhbCB0aW1lcyBmb3IgdGhlIHNhbWUgcGFnZS4KPiAKPiBNYWtlIHBh
Z2VfaXNfc2VjcmV0bWVtKCkgaW5saW5lIGFuZCByZXBsYWNlIHBhZ2VfbWFwcGluZygpIHdpdGgg
cGFnZSBmbGFnCj4gY2hlY2tzIHRoYXQgZG8gbm90IGltcGx5IHBhZ2UtdG8taGVhZCBjb252ZXJz
aW9uLgo+IAo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8b2xpdmVyLnNhbmdAaW50
ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXguaWJtLmNv
bT4KPiAtLS0KPiAKPiBAQW5kcmV3LAo+IFRoZSBwYXRjaCBpcyB2cyB2NS4xMi1yYzctbW1vdHMt
MjAyMS0wNC0xNS0xNi0yOCwgSSdkIGFwcHJlY2lhdGUgaWYgaXQgd291bGQKPiBiZSBhZGRlZCBh
cyBhIGZpeHVwIHRvIHRoZSBtZW1mZF9zZWNyZXQgc2VyaWVzLgo+IAo+ICAgaW5jbHVkZS9saW51
eC9zZWNyZXRtZW0uaCB8IDI2ICsrKysrKysrKysrKysrKysrKysrKysrKystCj4gICBtbS9zZWNy
ZXRtZW0uYyAgICAgICAgICAgIHwgMTIgKy0tLS0tLS0tLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQs
IDI2IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L3NlY3JldG1lbS5oIGIvaW5jbHVkZS9saW51eC9zZWNyZXRtZW0uaAo+IGluZGV4
IDkwN2E2NzM0MDU5Yy4uYjg0MmIzOGNiZWIxIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgv
c2VjcmV0bWVtLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3NlY3JldG1lbS5oCj4gQEAgLTQsOCAr
NCwzMiBAQAo+ICAgCj4gICAjaWZkZWYgQ09ORklHX1NFQ1JFVE1FTQo+ICAgCj4gK2V4dGVybiBj
b25zdCBzdHJ1Y3QgYWRkcmVzc19zcGFjZV9vcGVyYXRpb25zIHNlY3JldG1lbV9hb3BzOwo+ICsK
PiArc3RhdGljIGlubGluZSBib29sIHBhZ2VfaXNfc2VjcmV0bWVtKHN0cnVjdCBwYWdlICpwYWdl
KQo+ICt7Cj4gKwlzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZzsKPiArCj4gKwkvKgo+ICsJ
ICogVXNpbmcgcGFnZV9tYXBwaW5nKCkgaXMgcXVpdGUgc2xvdyBiZWNhdXNlIG9mIHRoZSBhY3R1
YWwgY2FsbAo+ICsJICogaW5zdHJ1Y3Rpb24gYW5kIHJlcGVhdGVkIGNvbXBvdW5kX2hlYWQocGFn
ZSkgaW5zaWRlIHRoZQo+ICsJICogcGFnZV9tYXBwaW5nKCkgZnVuY3Rpb24uCj4gKwkgKiBXZSBr
bm93IHRoYXQgc2VjcmV0bWVtIHBhZ2VzIGFyZSBub3QgY29tcG91bmQgYW5kIExSVSBzbyB3ZSBj
YW4KPiArCSAqIHNhdmUgYSBjb3VwbGUgb2YgY3ljbGVzIGhlcmUuCj4gKwkgKi8KPiArCWlmIChQ
YWdlQ29tcG91bmQocGFnZSkgfHwgIVBhZ2VMUlUocGFnZSkpCj4gKwkJcmV0dXJuIGZhbHNlOwoK
SSdkIGFzc3VtZSBzZWNyZXRtZW0gcGFnZXMgYXJlIHJhcmUgaW4gYmFzaWNhbGx5IGV2ZXJ5IHNl
dHVwIG91dCB0aGVyZS4gClNvIG1heWJlIHRocm93aW5nIGluIGEgY291cGxlIG9mIGxpa2VseSgp
L3VubGlrZWx5KCkgbWlnaHQgbWFrZSBzZW5zZS4KCj4gKwo+ICsJbWFwcGluZyA9IChzdHJ1Y3Qg
YWRkcmVzc19zcGFjZSAqKQo+ICsJCSgodW5zaWduZWQgbG9uZylwYWdlLT5tYXBwaW5nICYgflBB
R0VfTUFQUElOR19GTEFHUyk7Cj4gKwoKTm90IHN1cmUgaWYgb3Blbi1jb2RpbmcgcGFnZV9tYXBw
aW5nIGlzIHJlYWxseSBhIGdvb2QgaWRlYSBoZXJlIC0tIG9yIApldmVuIG5lY2Vzc2FyeSBhZnRl
ciB0aGUgZmFzdCBwYXRoIGFib3ZlIGlzIGluIHBsYWNlLiBBbnlob3csIGp1c3QgbXkgMiAKY2Vu
dHMuCgpUaGUgaWRlYSBvZiB0aGUgcGF0Y2ggbWFrZXMgc2Vuc2UgdG8gbWUuCgotLSAKVGhhbmtz
LAoKRGF2aWQgLyBkaGlsZGVuYgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
