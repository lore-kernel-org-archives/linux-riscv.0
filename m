Return-Path: <SRS0=ssm3=N3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B34D6C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78EE82086A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 16 Nov 2018 17:27:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C+3FMJtj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cVcP6NCf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78EE82086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=MF7zmHlm1XMtwt7/gp1oHMWLnzuhQ/9a+VkJJeomIw8=; b=C+3FMJtjl/t4Pc/UlVWIycT/w
	oF2VBJ3ubn/FJog3iw8+ejGb5GM1fqQQ9iZfVWKiAUHxGUOXfoUeK3fkhkmRBuyF31zmq/R8Zyn1v
	PJcqUa3mnqM9EcyzLayMrgQDmabd5V6wvmPPYbcfpEQS/8SFZ+QAr1xSmCSc+hPWFupjv1OE5uu+k
	/ogatGJUkqfjQuCKF7bPqZ3mvGqHAhFAz4bx6G4YqIKDtXA8OT0WMupAHFvPdjNadfAe/zatjG/z5
	FgPP98VVc7oWslCov/r+7kpafZruR11lU2Ky+VtqWH+4eBR5Xd3Qc3IJQZLd/Nwo9xW+oN6vyRK3I
	a2AYyVjJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gNhtl-0004F5-1w
	for infradead-linux-riscv@archiver.kernel.org; Fri, 16 Nov 2018 17:27:17 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNhth-0004EM-3n
 for linux-riscv@lists.infradead.org; Fri, 16 Nov 2018 17:27:14 +0000
Received: by mail-pg1-x543.google.com with SMTP id 17so10620963pgg.1
 for <linux-riscv@lists.infradead.org>; Fri, 16 Nov 2018 09:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=DsSu0TbVnJrrgCV6hTsaAyN94c/6CTZgbetXywX9w2s=;
 b=cVcP6NCfhXGPEuW+5j8MMFNDKj3RQ6m7smz86FrPQZtH3AeB/WEeq2jPCAjSFd4jcr
 cLRom12AkdE6X9m42P4vGIwes+J5ifoAz3TaAzNFJu2/oKAdCspFOJ6fyS8NNBuISwHp
 YEVJdHLscVmEV5u7GpTtBKJQaiFVOHCTWxfVZimYmedOjFGqa539GQxpZwk98UFwJQdX
 PjFbOWtCa3cq4mTyDpGAvfZvozpQKyNx/elpcWzpSqWFVTIj5t5D+Tioy6R6T9ALyjBx
 7Hm+wzNiNdDO2joKco7xJqNvlaTGX153CJLLOYNS7hIrfUHpcxdwxzM+wswwAODz7h1x
 s9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=DsSu0TbVnJrrgCV6hTsaAyN94c/6CTZgbetXywX9w2s=;
 b=HtMgNpqzw0MxoQEJrrBkZFO6yuRle7KKAd6XAOltZszWbKGunCi/gjGNw6rxPU6lsP
 H17AEr2D3m1eeBKj2BZX+iBEKcx9jS33MURU8kIgg2RuiSuyTTfwowbPH0Z08hG4DJ8J
 O1rcuVlS2ErkOu2QTxoubQ5MpjPOH8Wbp/slrTaSUrcjGKmi8RSem0DyygDCfK9E/ALR
 M9Z0k9lpTMdKL5MIKjjk+wwY1IBbqIXH3q7+4fzzA/zuqqSKLDNvaU5yrGCaRmCeS4EB
 3pFU1J2OFc+oRfsYzTDdC/aTARFzgXHwvkQtfpHvuISCAfc5pzJwwAiIe+H+nZ0KgbLy
 1KVg==
X-Gm-Message-State: AGRZ1gL2acvv69yYNIqUObs5JF4mCv+F2w6ppXKPNJbsnwg+mp/wvrPz
 AfIrytwfyUz10szESDrslvWJGQ==
X-Google-Smtp-Source: AJdET5eYRE4y4WCv10LxPrLB1XFj2lxh0jT6v83+ll3lmKudvTnKqgFWiQC7juRi6MufytkdWTeyKA==
X-Received: by 2002:a63:f006:: with SMTP id k6mr10768461pgh.259.1542389221498; 
 Fri, 16 Nov 2018 09:27:01 -0800 (PST)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id s144sm30167516pgs.87.2018.11.16.09.27.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Nov 2018 09:27:00 -0800 (PST)
Date: Fri, 16 Nov 2018 09:27:00 -0800 (PST)
X-Google-Original-Date: Fri, 16 Nov 2018 09:26:58 PST (-0800)
Subject: Re: [PATCH] RISC-V: Update Kconfig to better handle CMDLINE
In-Reply-To: <c5493cd7f7f3df0269c8a7d6d33ba199@mailhost.ics.forth.gr>
From: Palmer Dabbelt <palmer@sifive.com>
To: mick@ics.forth.gr
Message-ID: <mhng-c4cd5cdc-bffb-48f9-9594-0eca3acfe36c@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181116_092713_218507_CA4A00A4 
X-CRM114-Status: GOOD (  21.97  )
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
Cc: mick@ics.forth.gr, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181116172700.-bqzBYclulL9mSErjweUy2gReOrjIoQf59N-7VAeU_c@z>

T24gRnJpLCAxNiBOb3YgMjAxOCAwOToxNDowNCBQU1QgKC0wODAwKSwgbWlja0BpY3MuZm9ydGgu
Z3Igd3JvdGU6Cj4gzqPPhM65z4IgMjAxOC0xMS0xNiAxOTowOCwgTmljayBLb3NzaWZpZGlzIM6t
zrPPgc6xz4jOtToKPj4gzqPPhM65z4IgMjAxOC0xMS0xNiAxODo1MiwgUGFsbWVyIERhYmJlbHQg
zq3Os8+BzrHPiM61Ogo+Pj4gT24gRnJpLCAwOSBOb3YgMjAxOCAxNzowMjo0NCBQU1QgKC0wODAw
KSwgbWlja0BpY3MuZm9ydGguZ3Igd3JvdGU6Cj4+Pj4gQWRkIGEgbWVudSB0byBjaG9zZSBob3cg
dGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZSB3aWxsIGJlCj4+Pj4gdXNlZCBhbmQgYWRkIENNRExJ
TkVfRVhURU5EIGZvciBjb21wYXRpYmlsaXR5IHdpdGggRkRUIGNvZGUuCj4+Pj4KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZvcnRoLmdyPgo+Pj4+IC0tLQo+
Pj4+ICBhcmNoL3Jpc2N2L0tjb25maWcgfCA0NQo+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgMjEgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9L
Y29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+Pj4gaW5kZXggNTVkYTkzZjRlODE4Li44MWY4
ODQxNjRiNTIgMTAwNjQ0Cj4+Pj4gLS0tIGEvYXJjaC9yaXNjdi9LY29uZmlnCj4+Pj4gKysrIGIv
YXJjaC9yaXNjdi9LY29uZmlnCj4+Pj4gQEAgLTIyNywzOSArMjI3LDQyIEBAIGVuZG1lbnUKPj4+
Pgo+Pj4+ICBtZW51ICJCb290IG9wdGlvbnMiCj4+Pj4KPj4+PiAtY29uZmlnIENNRExJTkVfQk9P
TAo+Pj4+IC0JYm9vbCAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPj4+PiArY29uZmln
IENNRExJTkUKPj4+PiArCXN0cmluZyAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgbGluZSIKPj4+
PiAgCWhlbHAKPj4+PiAgCSAgRm9yIG1vc3QgcGxhdGZvcm1zLCBpdCBpcyBmaXJtd2FyZSBvciBz
ZWNvbmQgc3RhZ2UgYm9vdGxvYWRlcgo+Pj4+ICAJICB0aGF0IGJ5IGRlZmF1bHQgc3BlY2lmaWVz
IHRoZSBrZXJuZWwgY29tbWFuZCBsaW5lIG9wdGlvbnMuCj4+Pj4gIAkgIEhvd2V2ZXIsIGl0IG1p
Z2h0IGJlIG5lY2Vzc2FyeSBvciBhZHZhbnRhZ2VvdXMgdG8gZWl0aGVyIG92ZXJyaWRlCj4+Pj4g
LQkgIHRoZSBkZWZhdWx0IGtlcm5lbCBjb21tYW5kIGxpbmUgb3IgYWRkIGEgZmV3IGV4dHJhIG9w
dGlvbnMgdG8gaXQuCj4+Pj4gLQkgIEZvciBzdWNoIGNhc2VzLCB0aGlzIG9wdGlvbiBhbGxvd3Mg
aGFyZGNvZGluZyBjb21tYW5kIGxpbmUKPj4+PiBvcHRpb25zCj4+Pj4gLQkgIGRpcmVjdGx5IGlu
dG8gdGhlIGtlcm5lbC4KPj4+PiArCSAgdGhlIHByb3ZpZGVkIGtlcm5lbCBjb21tYW5kIGxpbmUg
b3IgYWRkIGEgZmV3IGV4dHJhIG9wdGlvbnMgdG8KPj4+PiBpdC4KPj4+PiArCSAgRm9yIHN1Y2gg
Y2FzZXMsIGl0IGlzIHBvc3NpYmxlIHRvIGRlZmluZSBhIGJ1aWx0LWluIGNvbW1hbmQgbGluZQo+
Pj4+ICsJICBoZXJlIGFuZCBjaG9zZSBob3cgdGhlIGtlcm5lbCBzaG91bGQgdXNlIGl0IGxhdGVy
IG9uLgo+Pj4+Cj4+Pj4gLQkgIEZvciB0aGF0LCBjaG9vc2UgJ1knIGhlcmUgYW5kIGZpbGwgaW4g
dGhlIGV4dHJhIGJvb3QgcGFyYW1ldGVycwo+Pj4+IC0JICBpbiBDT05GSUdfQ01ETElORS4KPj4+
PiArY2hvaWNlCj4+Pj4gKwlwcm9tcHQgIkJ1aWx0LWluIGNvbW1hbmQgbGluZSB1c2FnZSIgaWYg
Q01ETElORSAhPSAiIgo+Pj4+ICsJZGVmYXVsdCBDTURMSU5FX0ZBTExCQUNLCj4+Pj4gKwloZWxw
Cj4+Pj4gKwkgIENob3NlIGhvdyB0aGUga2VybmVsIHdpbGwgaGFuZGxlIHRoZSBwcm92aWRlZCBi
dWlsdC1pbiBjb21tYW5kCj4+Pj4gKwkgIGxpbmUuCj4+Pj4KPj4+PiAtCSAgVGhlIGJ1aWx0LWlu
IG9wdGlvbnMgd2lsbCBiZSBjb25jYXRlbmF0ZWQgdG8gdGhlIGRlZmF1bHQgY29tbWFuZAo+Pj4+
IC0JICBsaW5lIGlmIENNRExJTkVfRk9SQ0UgaXMgc2V0IHRvICdOJy4gT3RoZXJ3aXNlLCB0aGUg
ZGVmYXVsdAo+Pj4+IC0JICBjb21tYW5kIGxpbmUgd2lsbCBiZSBpZ25vcmVkIGFuZCByZXBsYWNl
ZCBieSB0aGUgYnVpbHQtaW4gc3RyaW5nLgo+Pj4+ICtjb25maWcgQ01ETElORV9GQUxMQkFDSwo+
Pj4+ICsJYm9vbCAiRmFsbGJhY2siCj4+Pj4gKwloZWxwCj4+Pj4gKwkgIFVzZSB0aGUgYnVpbHQt
aW4gY29tbWFuZCBsaW5lIGFzIGZhbGxiYWNrIGluIGNhc2Ugd2UgZ2V0IG5vdGhpbmcKPj4+PiAr
CSAgZnJvbSB0aGUgYm9vdCBsb2FkZXIuCj4+Pj4KPj4+PiAtY29uZmlnIENNRExJTkUKPj4+PiAt
CXN0cmluZyAiQnVpbHQtaW4ga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+Pj4+IC0JZGVwZW5kcyBv
biBDTURMSU5FX0JPT0wKPj4+PiAtCWRlZmF1bHQgIiIKPj4+PiArY29uZmlnIENNRExJTkVfRVhU
RU5ECj4+Pj4gKwlib29sICJFeHRlbnNpb24iCj4+Pj4gIAloZWxwCj4+Pj4gLQkgIFN1cHBseSBj
b21tYW5kLWxpbmUgb3B0aW9ucyBhdCBidWlsZCB0aW1lIGJ5IGVudGVyaW5nIHRoZW0gaGVyZS4K
Pj4+PiArCSAgVXNlIHRoZSBidWlsdC1pbiBjb21tYW5kIGxpbmUgYXMgYW4gZXh0ZW5zaW9uIG9m
IHRoZSBjb21tYW5kIGxpbmUKPj4+PiArCSAgcHJvdmlkZWQgYnkgdGhlIGJvb3QgbG9hZGVyLgo+
Pj4+Cj4+Pj4gIGNvbmZpZyBDTURMSU5FX0ZPUkNFCj4+Pj4gLQlib29sICJCdWlsdC1pbiBjb21t
YW5kIGxpbmUgb3ZlcnJpZGVzIGJvb3Rsb2FkZXIgYXJndW1lbnRzIgo+Pj4+IC0JZGVwZW5kcyBv
biBDTURMSU5FX0JPT0wKPj4+PiArCWJvb2wgIkZvcmNlZCIKPj4+PiAgCWhlbHAKPj4+PiAtCSAg
U2V0IHRoaXMgb3B0aW9uIHRvICdZJyB0byBoYXZlIHRoZSBrZXJuZWwgaWdub3JlIHRoZSBib290
bG9hZGVyCj4+Pj4gLQkgIG9yIGZpcm13YXJlIGNvbW1hbmQgbGluZS4gIEluc3RlYWQsIHRoZSBi
dWlsdC1pbiBjb21tYW5kIGxpbmUKPj4+PiAtCSAgd2lsbCBiZSB1c2VkIGV4Y2x1c2l2ZWx5Lgo+
Pj4+ICsJICBVc2UgdGhlIGJ1aWx0LWluIGNvbW1hbmQgbGluZSBpbiBwbGFjZSBvZiB0aGUgY29t
bWFuZCBsaW5lCj4+Pj4gKwkgIHByb3ZpZGVkIGJ5IHRoZSBib290IGxvYWRlci4KPj4+Pgo+Pj4+
IC0JICBJZiB5b3UgZG9uJ3Qga25vdyB3aGF0IHRvIGRvIGhlcmUsIHNheSBOLgo+Pj4+ICtlbmRj
aG9pY2UKPj4+Pgo+Pj4+ICBlbmRtZW51Cj4+Pgo+Pj4gSXQgbG9va3MgbGlrZSB0aGlzIGlzIGZ1
bmN0aW9uYWxseSBlcXVpdmFsZW50IHRvIHdoYXQgQVJNIGhhcywgYnV0IHRoZQo+Pj4gcG9sYXJp
dHkgaXMgYSBiaXQgZGlmZmVyZW50IGFuZCB0aGUgaGVscCBzdHJpbmdzIGFyZW4ndCBhcyBlYXN5
IHRvCj4+PiByZWFkLiAgSXMgdGhlcmUgYSByZWFzb24gd2UgY2FuJ3QganVzdCBjb3B5IHdoYXQg
dGhleSBkbz8KPj4+Cj4+PiAgICBjb25maWcgQ01ETElORQo+Pj4gICAgICAgICAgICBzdHJpbmcg
IkRlZmF1bHQga2VybmVsIGNvbW1hbmQgc3RyaW5nIgo+Pj4gICAgICAgICAgICBkZWZhdWx0ICIi
Cj4+PiAgICAgICAgICAgIGhlbHAKPj4+ICAgICAgICAgICAgICBPbiBzb21lIGFyY2hpdGVjdHVy
ZXMgKEVCU0ExMTAgYW5kIENBVFMpLCB0aGVyZSBpcwo+Pj4gY3VycmVudGx5IG5vIHdheQo+Pj4g
ICAgICAgICAgICAgIGZvciB0aGUgYm9vdCBsb2FkZXIgdG8gcGFzcyBhcmd1bWVudHMgdG8gdGhl
IGtlcm5lbC4gRm9yCj4+PiB0aGVzZQo+Pj4gICAgICAgICAgICAgIGFyY2hpdGVjdHVyZXMsIHlv
dSBzaG91bGQgc3VwcGx5IHNvbWUgY29tbWFuZC1saW5lCj4+PiBvcHRpb25zIGF0IGJ1aWxkCj4+
PiAgICAgICAgICAgICAgdGltZSBieSBlbnRlcmluZyB0aGVtIGhlcmUuIEFzIGEgbWluaW11bSwg
eW91IHNob3VsZAo+Pj4gc3BlY2lmeSB0aGUKPj4+ICAgICAgICAgICAgICBtZW1vcnkgc2l6ZSBh
bmQgdGhlIHJvb3QgZGV2aWNlIChlLmcuLCBtZW09NjRNCj4+PiByb290PS9kZXYvbmZzKS4KPj4+
ICAgICAgIGNob2ljZQo+Pj4gICAgICAgICAgICBwcm9tcHQgIktlcm5lbCBjb21tYW5kIGxpbmUg
dHlwZSIgaWYgQ01ETElORSAhPSAiIgo+Pj4gICAgICAgICAgICBkZWZhdWx0IENNRExJTkVfRlJP
TV9CT09UTE9BREVSCj4+PiAgICAgICAgICAgIGRlcGVuZHMgb24gQVRBR1MKPj4+ICAgICAgIGNv
bmZpZyBDTURMSU5FX0ZST01fQk9PVExPQURFUgo+Pj4gICAgICAgICAgICBib29sICJVc2UgYm9v
dGxvYWRlciBrZXJuZWwgYXJndW1lbnRzIGlmIGF2YWlsYWJsZSIKPj4+ICAgICAgICAgICAgaGVs
cAo+Pj4gICAgICAgICAgICAgIFVzZXMgdGhlIGNvbW1hbmQtbGluZSBvcHRpb25zIHBhc3NlZCBi
eSB0aGUgYm9vdCBsb2FkZXIuCj4+PiBJZgo+Pj4gICAgICAgICAgICAgIHRoZSBib290IGxvYWRl
ciBkb2Vzbid0IHByb3ZpZGUgYW55LCB0aGUgZGVmYXVsdCBrZXJuZWwKPj4+IGNvbW1hbmQKPj4+
ICAgICAgICAgICAgICBzdHJpbmcgcHJvdmlkZWQgaW4gQ01ETElORSB3aWxsIGJlIHVzZWQuCj4+
PiAgICAgICBjb25maWcgQ01ETElORV9FWFRFTkQKPj4+ICAgICAgICAgICAgYm9vbCAiRXh0ZW5k
IGJvb3Rsb2FkZXIga2VybmVsIGFyZ3VtZW50cyIKPj4+ICAgICAgICAgICAgaGVscAo+Pj4gICAg
ICAgICAgICAgIFRoZSBjb21tYW5kLWxpbmUgYXJndW1lbnRzIHByb3ZpZGVkIGJ5IHRoZSBib290
IGxvYWRlcgo+Pj4gd2lsbCBiZQo+Pj4gICAgICAgICAgICAgIGFwcGVuZGVkIHRvIHRoZSBkZWZh
dWx0IGtlcm5lbCBjb21tYW5kIHN0cmluZy4KPj4+ICAgICAgIGNvbmZpZyBDTURMSU5FX0ZPUkNF
Cj4+PiAgICAgICAgICAgIGJvb2wgIkFsd2F5cyB1c2UgdGhlIGRlZmF1bHQga2VybmVsIGNvbW1h
bmQgc3RyaW5nIgo+Pj4gICAgICAgICAgICBoZWxwCj4+PiAgICAgICAgICAgICAgQWx3YXlzIHVz
ZSB0aGUgZGVmYXVsdCBrZXJuZWwgY29tbWFuZCBzdHJpbmcsIGV2ZW4gaWYgdGhlCj4+PiBib290
Cj4+PiAgICAgICAgICAgICAgbG9hZGVyIHBhc3NlcyBvdGhlciBhcmd1bWVudHMgdG8gdGhlIGtl
cm5lbC4KPj4+ICAgICAgICAgICAgICBUaGlzIGlzIHVzZWZ1bCBpZiB5b3UgY2Fubm90IG9yIGRv
bid0IHdhbnQgdG8gY2hhbmdlIHRoZQo+Pj4gICAgICAgICAgICAgIGNvbW1hbmQtbGluZSBvcHRp
b25zIHlvdXIgYm9vdCBsb2FkZXIgcGFzc2VzIHRvIHRoZQo+Pj4ga2VybmVsLgo+Pj4gICAgZW5k
Y2hvaWNlCj4+PiAgICBJJ20gbm90IHJlYWxseSBvcHBvc2VkIHRvIHlvdXIgc29sdXRpb24sIEkn
bSBqdXN0IHRyeWluZyB0byBhdm9pZAo+Pj4gYmVpbmcgZGlmZmVyZW50IHdpdGhvdXQgYSByZWFz
b24uCj4+Cj4+IEFUQUdTIGFuZCByZWZlcmVuY2VzIHRvIEFSTSBwbGF0Zm9ybXMgc3VjaCBhcyBF
QlNBMTEwIGFyZSBub3QgcmVsYXRlZAo+PiB0byBSSVNDLVYKPj4gYW5kIEkgdGhpbmsgQ01ETElO
RV9GQUxMQkFDSyBpcyBtb3JlIGRlc2NyaXB0aXZlIHRoYW4KPj4gQ01ETElORV9GUk9NX0JPT1RM
T0FERVIuCgpPSy4KCj4gTm93IHRoYXQgeW91IG1lbnRpb24gaXQgdGhlIHRleHQgY291bGQgYmUg
YmV0dGVyLiBJIGp1c3Qgd2FudGVkIHRvCj4ga2VlcCB0aGVtIHNob3J0IGFuZCBjb25zaXN0ZW50
LiBEbyB5b3Ugd2FudCBtZSB0byB1c2UgQVJNJ3MgdGV4dCBmb3IKPiBDTURMSU5FX0VYVEVORCBh
bmQgQ01ETElORV9GT1JDRSA/CgpUaGF0J3MgcHJldHR5IG11Y2ggdGhlIG9ubHkgcGFydCBJIGxv
b2tlZCBhdC4gICJFeHRlbnNpb24iIGFuZCAiRm9yY2VkIiBsb29rZWQgCmEgYml0IHRvbyBicmll
Ziwgc28gSSBncmVwcGVkIGFyb3VuZCBhbmQgZm91bmQgdGhlIEFSTSBvbmUuICBJIG9ubHkgbG9v
a2VkIGF0IAp0aGUgc3RyaW5ncywgSSBhZ3JlZSBtdWNoIG9mIHRoZSBoZWxwIHRleHQgbWFrZXMg
bm8gc2Vuc2UgZm9yIFJJU0MtViAtLSB3aGF0IAp3YXMgdGhlcmUgaXMgZmluZS4KCkNhbiB5b3Ug
cmUtc3BpbiB0aGUgcGF0Y2g/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
