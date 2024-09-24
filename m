Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88752CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LaFtkftkeHxn59GgyxN9ppKR3i81tC4kSB5l/e1cZq0=; b=LxtZqw1MonaTzm
	xG3HtrwbC24CAG9PYfx+BsqiX197yomkmPf6w2HxuAl/oLeAVpeuxJda4kAgZZph7M2in++knOSOD
	/pUT83LNAiOj2/oEChJpMdQcT3qM7JqjQSUjlsRd8mkMk00luUAFcqNj1ep/7EoEE1kSJNO4GluGn
	QVxV47Q3aDzB2SiAryj2eOXp5xifhO6NfUCko1CTPV49btY9j1yk1JV+hNbvsfMhX/w56i6sJtJfl
	ueFv1sSSrNn0YPEZ1OMqB0ZKZluKpmFsnFnTXev+XgDBFCZTa9A+rrV8Zmu8omOwjJMzM/lYxovfL
	6KP81ejksbcHDhgmRSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st7wg-00000002imw-18qj;
	Tue, 24 Sep 2024 15:59:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st7wb-00000002ilx-0HT6
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 15:59:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727193554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+S0wIYME8PmmnZGOe7mz6Cv0BjF3gAq3MOk8uH20clU=;
	b=N+x1OVVPX0sVKb7fFuluXRvtTO6hAvjVEAtBPeZO0HFNq861zZ2Z53EVCWE1jXSeVlolI5
	YN5UHSPmT3i55NwJ5nkXnjhnVCxH3RoSEfb+5yHxVY4yyXqZcPmldVfHbILeWwe4dk6VmC
	A6Y4P8Cfhing1P+47DTGKdVZekIcdLc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-292-RZL99CVzNiClmfSuN25kMg-1; Tue, 24 Sep 2024 11:59:12 -0400
X-MC-Unique: RZL99CVzNiClmfSuN25kMg-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2d88641e9a8so5981459a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Sep 2024 08:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727193550; x=1727798350;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+S0wIYME8PmmnZGOe7mz6Cv0BjF3gAq3MOk8uH20clU=;
        b=QMzp9rDSFU+Ms4GMiH1gYCMRDbUXEbWOsX+RTW9vteTyuyQ+eiaC24/HaGD1oTqoQo
         5So0tC1SrUMbR2GBfBDrnDhSWszO7PxXjf9k5SjWC3At0oqHbFx5mt4HXaSFKuP+fE9/
         lOvlZWxrgfd/0RVc10V7zonK1pgx1NztqZKw5YQJl97Gaa9JGrQWmJuUDxEBye6KvIc/
         c5F1TRu+rjd07PvZUFjPYQEbi4N+YUK0xiHpTYzjjbAprKm+hKSnkxDEnHTY24nXBKeI
         eGuhj1yyTczvfu0R+BqVHeiWxIFKObxSykrgo6ZeVYlygtHDhKRwq1/gVaPX1cRM4O5P
         h9Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVt/+wkgfYeLVZEaJfI5OpklClLKGqXRrbBKIM7EnPU+f8EPgLg+pkL//PpkbtUkmmEqaSyuRaKSUm9jQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8qrmdUK2bCcOOL4vA00qs3tyWprViXk4tvGv6X4nEQG/pwngg
	mNLKCbPdlMrbv95+XBK7T69GHIXh6gnXLHPW3B4v8zKBhCtPH3hUrjM7tWdsLORVCWuJbqa1zDQ
	9L0ewGneaeJnR0eJSUL3UkFzU7qqEycMGgLTvP4Zos3HdlmTLOFNLQMUhOJs0LjGiQui/RmePlD
	4BVUTH+JCg1o8FhQfWyItYxAgAEI8kT4iAORHosO6e
X-Received: by 2002:a17:90b:4b04:b0:2c9:3370:56e3 with SMTP id 98e67ed59e1d1-2dd80e38b6emr17534383a91.34.1727193549586;
        Tue, 24 Sep 2024 08:59:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkR7hCExRN4dc958K/x9tQVNNIbvGe5xIdWwh1kAgb4AzafwKHNWeKF98H6OSv5ifeNMlvasI7rJFQ0xwQDsE=
X-Received: by 2002:a17:90b:4b04:b0:2c9:3370:56e3 with SMTP id
 98e67ed59e1d1-2dd80e38b6emr17534353a91.34.1727193549054; Tue, 24 Sep 2024
 08:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com>
 <B2A62C7F-45BA-43E1-975F-5AF0197CD2C3@kernel.org> <CAJD_bP+43=XXD7p3fRfDxCbj=_YedgVLv38XO4iOAw94a+4PHg@mail.gmail.com>
 <202409221511.9AF49BD@keescook>
In-Reply-To: <202409221511.9AF49BD@keescook>
From: Jason Montleon <jmontleo@redhat.com>
Date: Tue, 24 Sep 2024 11:58:57 -0400
Message-ID: <CAJD_bP+6qCgseo9of-cKW3+nH_UbGFwPo6WRbqqcneOZ+EEtOw@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] Cannot boot Lichee Pi 4A with
 FORTIFY_SOURCE enabled
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, linux-riscv@lists.infradead.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_085917_276649_84F698CF 
X-CRM114-Status: GOOD (  20.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBTZXAgMjIsIDIwMjQgYXQgNjozOOKAr1BNIEtlZXMgQ29vayA8a2Vlc0BrZXJuZWwu
b3JnPiB3cm90ZToKPiBDYW4geW91IHRyeSB0aGlzIHBhdGNoPyBJdCBzaG91bGQgYXZvaWQgdXNp
bmcgdGhlICJXQVJOIiBpbmZyYXN0cnVjdHVyZQo+IChpZiB0aGF0IGlzIHRoZSBzb3VyY2Ugb2Yg
YmxvY2tpbmcgYm9vdCksIGJ1dCBzaG91bGQgc3RpbGwgcHJvdmlkZSBzb21lCj4gZGV0YWlsIGFi
b3V0IHdoYXQgdHJpcHBlZCBpdCB1cCAodmlhIHRoZSAicmVndWxhciIgcHJfKigpIGxvZ2dpbmcp
LiBBbmQKPiBpZiBpdCBib290cywgY2FuIHlvdSBsb29rIGF0IHRoZSBsb2cgdG8gZmluZCB3aGF0
IGl0IHJlcG9ydHMgZm9yIHRoZQo+ICJXYW50ZWQgdG8gd3JpdGUgLi4uIiBsaW5lKHMpPwo+Cj4g
VGhhbmtzIQo+Cj4gLUtlZXMKPgo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZm9ydGlm
eS1zdHJpbmcuaCBiL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaAo+IGluZGV4IDBkOTli
ZjExZDI2MC4uNDY5YTM0Mzk5NTlkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZm9ydGlm
eS1zdHJpbmcuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaAo+IEBAIC01
NDksNyArNTQ5LDggQEAgX19GT1JUSUZZX0lOTElORSBib29sIGZvcnRpZnlfbWVtY3B5X2Noayhf
X2tlcm5lbF9zaXplX3Qgc2l6ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IHNpemVfdCBxX3NpemUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb25zdCBzaXplX3QgcF9zaXplX2ZpZWxkLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc2l6ZV90IHFfc2l6ZV9maWVsZCwKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHU4IGZ1bmMpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB1OCBmdW5jLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqZmll
bGQpCj4gIHsKPiAgICAgICAgIGlmIChfX2J1aWx0aW5fY29uc3RhbnRfcChzaXplKSkgewo+ICAg
ICAgICAgICAgICAgICAvKgo+IEBAIC02MTAsOCArNjExLDEzIEBAIF9fRk9SVElGWV9JTkxJTkUg
Ym9vbCBmb3J0aWZ5X21lbWNweV9jaGsoX19rZXJuZWxfc2l6ZV90IHNpemUsCj4gICAgICAgICAg
KiBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMDE4MzIKPiAg
ICAgICAgICAqLwo+ICAgICAgICAgaWYgKHBfc2l6ZV9maWVsZCAhPSBTSVpFX01BWCAmJgo+IC0g
ICAgICAgICAgIHBfc2l6ZSAhPSBwX3NpemVfZmllbGQgJiYgcF9zaXplX2ZpZWxkIDwgc2l6ZSkK
PiAtICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4gKyAgICAgICAgICAgcF9zaXplICE9IHBf
c2l6ZV9maWVsZCAmJiBwX3NpemVfZmllbGQgPCBzaXplKSB7Cj4gKyAgICAgICAgICAgICAgIGlm
IChwX3NpemVfZmllbGQgPT0gMCkKPiArICAgICAgICAgICAgICAgICAgICAgICBwcl93YXJuKCJX
YW50ZWQgdG8gd3JpdGUgJXp1IHRvIGEgMC1zaXplZCBkZXN0aW5hdGlvbjogJXNcbiIsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplLCBmaWVsZCk7Cj4gKyAgICAgICAgICAg
ICAgIGVsc2UKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsKPiArICAgICAg
IH0KPgo+ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICB9Cj4gQEAgLTYyNSw3ICs2MzEsOCBAQCBf
X0ZPUlRJRllfSU5MSU5FIGJvb2wgZm9ydGlmeV9tZW1jcHlfY2hrKF9fa2VybmVsX3NpemVfdCBz
aXplLAo+ICAgICAgICAgY29uc3Qgc2l6ZV90IF9fcV9zaXplX2ZpZWxkID0gKHFfc2l6ZV9maWVs
ZCk7ICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGZvcnRpZnlfd2Fybl9vbmNlKGZvcnRp
ZnlfbWVtY3B5X2NoayhfX2ZvcnRpZnlfc2l6ZSwgX19wX3NpemUsICBcCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF9fcV9zaXplLCBfX3Bfc2l6ZV9maWVsZCwgICAgICAg
ICAgXAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX3Ffc2l6ZV9maWVs
ZCwgRk9SVElGWV9GVU5DXyAjI29wKSwgXAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX3Ffc2l6ZV9maWVsZCwgRk9SVElGWV9GVU5DXyAjI29wLFwKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgI3AgIiBhdCAiIEZJTEVfTElORSksIFwKPiAgICAg
ICAgICAgICAgICAgICAjb3AgIjogZGV0ZWN0ZWQgZmllbGQtc3Bhbm5pbmcgd3JpdGUgKHNpemUg
JXp1KSBvZiBzaW5nbGUgJXMgKHNpemUgJXp1KVxuIiwgXAo+ICAgICAgICAgICAgICAgICAgIF9f
Zm9ydGlmeV9zaXplLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAg
ICAgICAgICAgICAgICAgICAiZmllbGQgXCIiICNwICJcIiBhdCAiIEZJTEVfTElORSwgICAgICAg
ICAgICAgICAgICAgICBcCj4KPgo+IC0tCj4gS2VlcyBDb29rCj4KCkhpIEtlZXMsClNvcnJ5IGZv
ciB0aGUgZGVsYXkgaW4gcmVzcG9uZGluZy4gWW91ciBwYXRjaCBhbHNvIGNhdXNlZCB0aGUgc3lz
dGVtCnRvIGhhbmcgYm9vdGluZywgYnV0IEkgdG9vayBpdCBhcyBpbnNwaXJhdGlvbiB0byB0cnkg
c29tZSB0aGluZ3MuClRMO0RSIEkgc2VlIHRoZXNlIHR3byBwcmludCBzZXZlcmFsIHRpbWVzOgoK
V2FudGVkIHRvIHdyaXRlIDggdG8gYSAwLXNpemVkIGRlc3RpbmF0aW9uOiBvbGRwdHIgYXQKYXJj
aC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmM6MTg1CldhbnRlZCB0byB3cml0ZSAyOCB0byBh
IDAtc2l6ZWQgZGVzdGluYXRpb246IG9sZHB0ciBhdAphcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9l
cnJhdGEuYzoxODUKClNpbmNlIEkgc3VzcGVjdGVkIENPTkZJR19FUlJBVEFfVEhFQURfTUFFIHdo
aWNoIHJlbGllcyBvbgpDT05GSUdfUklTQ1ZfQUxURVJOQVRJVkVfRUFSTFkgSSBzdXNwZWN0ZWQg
aXQgaXMganVzdCB0b28gZWFybHkgZm9yCnByXyosIGV0Yy4gSSB0cmllZCB0cmFjZV9wcmludGsg
YnV0IHRoYXQgZGlkbid0IHByb2R1Y2UgYW55IHRyYWNlcywKYW5kIHRoZW4gSSBmb3VuZCBhIGNv
bW1lbnQgd2hpY2ggbWFrZXMgbWUgdGhpbmsgd2UncmUgdG9vIGVhcmx5IGZvcgp0aGF0IHRvby4K
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvYXJjaC9yaXNjdi9rZXJuZWwvYWx0ZXJuYXRpdmUuYz9oPXY2LjExI24y
MTQKCkkgZGlkbid0IHdhbnQgdG8gZ2l2ZSB1cCBzbyBJIHdyb3RlIGEgc2ltcGxlIG1vZHVsZSB0
byBmaWd1cmUgb3V0IGhvdwp0byB1c2Ugc2JpX2VjYWxsIGFuZCB0aGVuIGluY29ycG9yYXRlZCB0
aGF0IGlkZWEgaW50byB5b3VyIHBhdGNoLAphbHRob3VnaCBldmVuIHRoYXQgd2FzIG5vdCBzdHJh
aWdodGZvcndhcmQ6Cmh0dHBzOi8vZ2lzdC5naXRodWIuY29tL2ptb250bGVvbi9mMzUzNmFkNzBk
YzkyYmVkOTkyMTM5YWQ1YjI2NmQ1YwoKRnVsbCBvdXRwdXQ6IGh0dHBzOi8vZ2lzdC5naXRodWIu
Y29tL2ptb250bGVvbi84MjNmYWNmZjM4ZTI4YjcxN2YxNTNlMzhhZGNmZDdmZQoKVGhhbmsgeW91
IGFnYWluLApKYXNvbiBNb250bGVvbgoKLS0gCkphc29uIE1vbnRsZW9uICAgICAgICB8IGVtYWls
OiBqbW9udGxlb0ByZWRoYXQuY29tClJlZCBIYXQsIEluYy4gICAgICAgICB8IGdwZyBrZXk6IDB4
MDY5RTMwMjIKQ2VsbDogNTA4LTQ5Ni0wNjYzICAgIHwgaXJjOiBqbW9udGxlbyAvIGptb250bGVv
bgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
