Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4897C3DA59
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 09:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MKyaOzmA+T5g39XSk3JIA3MHfzSSXZ+tG3JQSrnD/s=; b=dbMBlmUKihGq4M
	0wauJK3P1nOIUTDo0AbbzSjjp278ILKtH2i0Jeg6i2C/jznh8rQKjfcTSYFGL7negcE+HCRBZPuyQ
	2hgmxu5LeG6KM2t9R7HdgeBWyknuBP1sETGYU7Zwa+jLI1pJeLcfoP77rxFuW9Kuait+H3gXV4jyl
	ZtbVOfBH+jLe/29nImTaZ8Hzohum54ZpLQY3AjisXNRoZWHGmRxPhzYvdWkSMWMg5v4emmrALXAai
	BgyJSV/BcTDcZyM1Wha95bOQ5Nd+DEdXek1uWjfHfVtJUiMhPIZczucX/xALsztqnIraHpitBcH5F
	yQ+6fsGEzwQLNlvnfLdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk42-00000002G8N-14lY;
	Fri, 19 Jul 2024 09:38:10 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk3z-00000002G6z-056d
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 09:38:08 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2eec7e43229so24117011fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721381885; x=1721986685; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHuQOzwZHF/RNpfChTvHFJsWi3ick1N/VEEIytMiyeQ=;
        b=EwG4zFJrMXhor2bocgwkPjQlgI9g/u/rtK/zAkuzMNm5nblEh6rjU4J5WbNEYnD8Dm
         K67HGlsKp/f2SblhaGx747jTVWw8ZKBIlx12caXxSUgAkBlmh20l5328Pd2s5QLgID12
         Kvc19RlgKh/TLDqZp/sFEe/zl+4OPCzCNU2D7n5K6e5QkAYQsmmKi8EjMQzop5v8VwGj
         EkHqC8BsCC+jHj6uRCXYKk/kkQUMkgaeLWbnJ1953JCLzuMVCrLggztCtQJVAwtmZQ+9
         drTUV5BLp+z69NdrRK32rhX+3usqSiND3gTWq0/Pjsc+U6yvsMVOj0ksndU7y8w9Bogz
         B7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381885; x=1721986685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHuQOzwZHF/RNpfChTvHFJsWi3ick1N/VEEIytMiyeQ=;
        b=CGWKlLsfnXbLVIZGru7UYBPvvjFQjIUjUpihDJOIkuyVxZuRSABTQpwIxCdgJWagw1
         QuR1UxqbguvHC0p/hBEPZFzLbp3ZSvm2HNwvatJjMu6BmXK51kS5v8YcT7BIu0k+IUt/
         8NL7wxFw00sctB5c8kM+3LPPqtsS0gf6aIO2dSWf3k0wNsO5nmypFV1/hW5Y3bRHAeQ/
         n9xp1y9TS0z3n64fgyQNrLVZcT5+B7Hc0ypWwuec1gyTJOXbLK8g7Cjeddy0f3BO25Sm
         iMb3XoMtTR9bxwRGc1rCt2IpSfFRB62JBYSdioGqMf9KnaQcbPsCPzHL45Ai0jAvipip
         al1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXUvAscFZX1pnvzu+Z+ZiXg/Fu/dmqkahRNBEfGE+ovQAfSS2YbqgNJ47ZFcrCeq4+A8ISqZ6q1wV0O1b8uscfyPk9vTyE9VBh8DIGb/SvS
X-Gm-Message-State: AOJu0Yw7e4p8EVDfxXsH3OB5Qr2Z/kmAkfR2I8RfarbzmMZ9EJR61qI1
	GR/n77u2yrq5RiWZaMY8BuQaQybNhwzfi7Y1di5JWVL2j+9IUR60hXLj69Yl/KWSgVxS/2fctAj
	Nv8mnMeNk3vbu8UDWcy5Zn54NTeMsRGT9VjvgNA==
X-Google-Smtp-Source: AGHT+IGiJNTRWlBgnX41CQFZmILGxpV1J9kBUt1OoMxruvBGLdHaDWwzwf0eXsqOE/wPqccfZTwogeTX0F7BgSX59RM=
X-Received: by 2002:a2e:a17b:0:b0:2ec:596c:b629 with SMTP id
 38308e7fff4ca-2ef05c726bbmr33287691fa.20.1721381885303; Fri, 19 Jul 2024
 02:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240718152254.16007-1-eric.lin@sifive.com> <12bd744ea481c8a3505e6f4869d409d24d3db795.camel@maquefel.me>
In-Reply-To: <12bd744ea481c8a3505e6f4869d409d24d3db795.camel@maquefel.me>
From: Eric Lin <eric.lin@sifive.com>
Date: Fri, 19 Jul 2024 17:37:53 +0800
Message-ID: <CAPqJEFp+KHku2ygaHhv0YP3Wy1RhuKOZ33EAonzaUxxkM5z-Fg@mail.gmail.com>
Subject: Re: [PATCH] perf arch events: Fix duplicate RISC-V SBI firmware event name
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: acme@kernel.org, adrian.hunter@intel.com, 
	alexander.shishkin@linux.intel.com, aou@eecs.berkeley.edu, 
	dminus@andestech.com, inochiama@outlook.com, irogers@google.com, 
	jisheng.teoh@starfivetech.com, jolsa@kernel.org, kan.liang@linux.intel.com, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, locus84@andestech.com, mark.rutland@arm.com, 
	mingo@redhat.com, n.shubin@yadro.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterlin@andestech.com, peterz@infradead.org, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_023807_406930_781A1CDB 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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

SGkgTmlraXRhLAoKT24gRnJpLCBKdWwgMTksIDIwMjQgYXQgNDo1MeKAr1BNIE5pa2l0YSBTaHVi
aW4gPG5pa2l0YS5zaHViaW5AbWFxdWVmZWwubWU+IHdyb3RlOgo+Cj4gSGkgRXJpYywKPgo+IE5p
Y2UgY2F0Y2ghCj4KPiBTaG91bGRuJ3QgaXQgZml4IGV2ZXJ5IHBhdGNoIHRoYXQgY29waWVkIGFm
ZmVjdGVkICdmaXJtd2FyZS5qc29uJyBieQo+IHRoZSB3YXkgPwo+Cj4gU29tZXRoaW5nIGxpa2U6
Cj4KPiBGaXhlczogOGYwZGNiNGU3MzY0ICgicGVyZiBhcmNoIGV2ZW50czogcmlzY3Ygc2JpIGZp
cm13YXJlIHN0ZCBldmVudAo+IGZpbGVzIikKPiBGaXhlczogYzRmNzY5ZDQwOTNkICgicGVyZiB2
ZW5kb3IgZXZlbnRzIHJpc2N2OiBhZGQgU2lmaXZlIFU3NCBKU09OCj4gZmlsZSIpCj4gRml4ZXM6
IGFjYmY2ZGU2NzRlZiAoInBlcmYgdmVuZG9yIGV2ZW50cyByaXNjdjogQWRkIFN0YXJGaXZlIER1
YmhlLTgwCj4gSlNPTiBmaWxlIikKPiBGaXhlczogNzM0MGM2ZGY0OWRmICgicGVyZiB2ZW5kb3Ig
ZXZlbnRzIHJpc2N2OiBhZGQgVC1IRUFEIEM5eHggSlNPTgo+IGZpbGUiKQo+IEZpeGVzOiBmNTEw
MmUzMWMyMDkgKCJyaXNjdjogYW5kZXM6IFN1cHBvcnQgc3BlY2lmeWluZyBzeW1ib2xpYwo+IGZp
cm13YXJlIGFuZCBoYXJkd2FyZSByYXcgZXZlbnQiKQo+Cj4gUmV2aWV3ZWQtYnk6IE5pa2l0YSBT
aHViaW4gPG4uc2h1YmluQHlhZHJvLmNvbT4KCgpPSywgSSdsbCBhZGQgZXZlcnkgcGF0Y2ggIkZp
eGVzOiIgIGluIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgc2VuZCB0aGUgdjIgcGF0Y2guClRoYW5r
cyBmb3IgdGhlIHJldmlldy4KClJlZ2FyZHMsCkVyaWMgTGluCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
