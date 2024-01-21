Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35B8C47422
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Jan 2024 14:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCcXgM6/bobhYH5T66Kr7D4Gg0/FnyDbQy6MTRlrebo=; b=NGToELmMwT5dtz
	bsyB8n0HtpCHmBHsM/+aV+NYR52Q2eO2JMcMMTjStt8ba1f28DZJz8cZC4gU2X1xCGhrJ5fnEjbwy
	681/kaissTbHh3s5dg7gdgIi1A7KKjmSMWW94+c/vtiOyYKWH1cix1U9muKzB0mrm+ZyMyejcUaHZ
	/nbDeyabp4M8c/oa0GT73TTOLH5NRKvpiWHSyFD5vunuzShHdfHmri72RHlHcHTawd78TRXn6DoWa
	i8EuC+OCVQ57bLKFZvBrZJbcc5lPLwejil3/FUpcw6Ie8WBCRDHfK+vwMEF6oY3yOyXVg1jqoeCm6
	4e+bsbQZ3Txtkb1OyB8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRYsy-009dAT-1V;
	Sun, 21 Jan 2024 14:33:20 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRYss-009d9i-0C
	for linux-riscv@lists.infradead.org;
	Sun, 21 Jan 2024 14:33:18 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50e72e3d435so2048312e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jan 2024 06:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1705847591; x=1706452391; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJE8OZBFkDTsEKIKYcuzQslvx5cqQPu3UG0j6ooiPi4=;
        b=RQszwUiwwPaP3DdMqzMCRb9QGWhmGIN9jBXxUEMD1ceBiclI2qr6pqkhtwbWLeO5AB
         KwSe8ynrIwmhr/Et3O8y6dnzzDuht2SBHzemZOTgmUe78jlEzpJwipNFfkEEVH4lGVSC
         meBngXWItPqN9GggutUKkYcwPGaZ0RuH5NpHg4RVNYQzg8fIQkv/HzOk2fnMJmx2pUvH
         q27lz4UqCNWDPbjFgCj6vaCfvkbKz2TZGx2Z4UanECfdX2yzrV76aMca/58W7gtTFNav
         zXamEsiTQ+hSKn72m3mnvjUalY9TVur2jjKKm3bUQuyjv6+M5in43eC3l9R7JiWOt1R6
         DysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705847591; x=1706452391;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJE8OZBFkDTsEKIKYcuzQslvx5cqQPu3UG0j6ooiPi4=;
        b=HBuQ3Ioe7V/eDYQBGLGBrqsW0txq1PzmqFSTBEHgPXGiOREelNkubSmhvJtHTU4JPg
         qlN2SQZHlZ1YjbNh+/2i4tz2qRlsxBiOgTFvFOKZg16Aps21+vDNLmkK9qXbfBX0h/iK
         T6L7mPgiyN1cFOAKZny1yaMTs/QFZ+KNVreDA4J+gct/Kc2PV+ihvhE7k1rAgvDh0O83
         lYvvVpw3YiKOqo3RUCpEeTfL3rzY3jKaHT+SQtUUwQb9YnaKcmxnwgTQnf46dvOsd6OY
         SGnvVZPINZfV8aJvYhNTHMSk+WH6pyCDGMSF0V7ELi0JJlsThZcpICmecwmzmC3EVeua
         IuGA==
X-Gm-Message-State: AOJu0YwWy8Oum1ge7UUFmGLGrsw9owirMrT7DfBnIbYeE1Emiq3+8800
	/Gu1jtcb8xIfv2J1yPUkUV7fX0+G7JQNOsNGHCMimBSHh7ZyEnJD6ZFh8t9wyAC2C5kzjXfs0eg
	GPM7A/cihRooK9dyndSwyDGSMrCUQwIbAIxTUEm4hOTTLVNHa
X-Google-Smtp-Source: AGHT+IHKIXirYl8NrFW1DcPSJph3DFRJYP7/XgMmw+Lupa75vIdqahT/p0CIPU2Xazeyk/5FYR4FTnBLHo6Xh0ZJMGE=
X-Received: by 2002:ac2:44a4:0:b0:50e:64f5:ad71 with SMTP id
 c4-20020ac244a4000000b0050e64f5ad71mr580427lfm.146.1705847591228; Sun, 21 Jan
 2024 06:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20240121011341.GA97368@sol.localdomain> <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
In-Reply-To: <mhng-e4b5de69-859d-43ea-b35d-b568e6a621ef@palmer-ri-x1c9>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Sun, 21 Jan 2024 22:32:59 +0800
Message-ID: <CABgGipW0pZCESu7dyiUdta2JtrpeMsJ3EABNjj_0GO9fbbTwQg@mail.gmail.com>
Subject: Re: [PATCH -next v21 23/27] riscv: detect assembler support for
 .option arch
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: ebiggers@kernel.org, Nelson Chu <nelson.chu@sifive.com>, 
	linux-riscv@lists.infradead.org, anup@brainfault.org, atishp@atishpatra.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	Vineet Gupta <vineetg@rivosinc.com>, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, nathan@kernel.org, 
	ndesaulniers@google.com, trix@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_063314_143651_A04D0D89 
X-CRM114-Status: GOOD (  22.66  )
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

T24gU3VuLCBKYW4gMjEsIDIwMjQgYXQgMTA6NTXigK9BTSBQYWxtZXIgRGFiYmVsdCA8cGFsbWVy
QGRhYmJlbHQuY29tPiB3cm90ZToKPgo+IE9uIFNhdCwgMjAgSmFuIDIwMjQgMTc6MTM6NDEgUFNU
ICgtMDgwMCksIGViaWdnZXJzQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBIaSBBbmR5LAo+ID4KPiA+
IE9uIE1vbiwgSnVuIDA1LCAyMDIzIGF0IDExOjA3OjIwQU0gKzAwMDAsIEFuZHkgQ2hpdSB3cm90
ZToKPiA+PiArY29uZmlnIEFTX0hBU19PUFRJT05fQVJDSAo+ID4+ICsgICAgIyBodHRwczovL3Jl
dmlld3MubGx2bS5vcmcvRDEyMzUxNQo+ID4+ICsgICAgZGVmX2Jvb2wgeQo+ID4+ICsgICAgZGVw
ZW5kcyBvbiAkKGFzLWluc3RyLCAub3B0aW9uIGFyY2gkKGNvbW1hKSArbSkKPiA+PiArICAgIGRl
cGVuZHMgb24gISQoYXMtaW5zdHIsIC5vcHRpb24gYXJjaCQoY29tbWEpIC1pKQo+ID4KPiA+IFdp
dGggdGlwLW9mLXRyZWUgY2xhbmcgKGxsdm0tcHJvamVjdCBjb21taXQgODVhOGU1YzNlMDU4NmU4
NSksIEknbSBzZWVpbmcKPiA+IEFTX0hBU19PUFRJT05fQVJDSCBiZSBzZXQgdG8gbi4gIEl0J3Mg
dGhlIHNlY29uZCAiZGVwZW5kcyBvbiIgdGhhdCBtYWtlcyBpdCBiZQo+ID4gc2V0IHRvIG4sIHNv
IGFwcGFyZW50bHkgY2xhbmcgc3RhcnRlZCBhY2NlcHRpbmcgIi5vcHRpb24gYXJjaCAtaSIuICBX
aGF0IHdhcwo+ID4geW91ciBpbnRlbnQgaGVyZSBmb3IgY2hlY2tpbmcgdGhhdCAiLm9wdGlvbiBh
cmNoIC1pIiBpcyBub3Qgc3VwcG9ydGVkPyAgSSdkCj4gPiB0aGluayB0aGF0IGp1c3QgdGhlIGZp
cnN0ICJkZXBlbmRzIG9uIiB3b3VsZCBiZSBzdWZmaWNpZW50LgoKVGhlIHJlYXNvbiB3aHkgSSBh
ZGRlZCB0aGUgc2Vjb25kIGNoZWNrIGlzIGJlY2F1c2UgY2xhbmcgYW5kIGdjYyBvbmx5CnJldHVy
biBhbiBhc3NlbWJsZXIgd2FybmluZyB3aGVuIGl0IGRvZXMgbm90IHN1cHBvcnQgIi5vcHRpb24g
YXJjaCIgYXQKYWxsLiBObyBlcnJvcnMgd2VyZSByZXBvcnRlZC4gU28sIGl0IGVuZGVkIHVwIHBh
c3NpbmcgdGhlIGZpcnN0CmNvbmRpdGlvbiBjaGVjayBmb3Igb2xkIHRvb2xjaGFpbnMgdGhhdCBz
aG91bGRuJ3QgYmUgcGFzc2luZy4KCj4KPiBJJ20gbm90IHN1cmUgd2hhdCBBbmR5J3MgcmF0aW9u
YWxlIHdhcywgYnV0IGRlM2E5MTNkZjZlICgiUklTQy1WOgo+IENsYXJpZnkgdGhlIGJlaGF2aW9y
IG9mIC5vcHRpb24gYXJjaCBkaXJlY3RpdmUuIikgaW4gYmludXRpbHMtZ2RiCj4gc3RvcHBlZCBh
Y2NlcHRpbmcgYC5vcHRpb24gYXJjaCwgLWlgIGFsb25nIHdpdGggZml4aW5nIGEgaGFuZGZ1bCBv
Zgo+IG90aGVyIG9kZGl0aWVzIGluIG91ciBgLm9wdGlvbiBhcmNoYCBoYW5kbGluZy4KPgo+IElm
IHRoYXQncyBhbGwgdGhpcyBpcyB0ZXN0aW5nIGZvciB0aGVuIHdlIHNob3VsZCBwcm9iYWJseSBh
ZGQgc29tZSBzb3J0Cj4gb2YgdmVyc2lvbiBjaGVjayBmb3Igb2xkIGJpbnV0aWxzIChvciBtYXli
ZSBqdXN0IGlnbm9yZSBpdCwgbG9va3MgbGlrZQo+IGl0IHdhcyBhIGJ1Z2ZpeCBhbmQgdGhlIG9s
ZCB2ZXJzaW9uIHdhcyBuZXZlciByZWxlYXNlZCkuCj4KPiArTmVsc29uLCBhcyBoZSBwcm9iYWJs
eSBrbm93cyBiZXR0ZXIgdGhhbiBJIGRvLgo+Cj4gVGhhdCBzYWlkOiB3aGF0IGRvZXMgTExWTSBk
byBpZiB5b3UgYXNrIGl0IHRvIHR1cm4gdGhlICJJIiBiYXNlIElTQSBvZmY/Cj4gSSdkIGFyZ3Vl
IHRoZXJlJ3Mgbm8gaW5zdHJ1Y3Rpb25zIGxlZnQgYXQgdGhhdCBwb2ludC4uLgoKTWF5YmUgd2hh
dCB3ZSByZWFsbHkgc2hvdWxkIGRvIGlzIHRvIHVwZ3JhZGUgdGhlIGNvbmRpdGlvbiBjaGVjayB0
byBhCm9uZSBsaW5lciBzaGVsbCBzY3JpcHQgYW5kIGdyZXAgaWYgIldhcm5pbmciIGlzIGJlaW5n
IHByaW50ZWQuIFNhZGx5CnRoaXMgd2FybmluZyBpcyBub3QgZmFpbGluZyB0aGUgY29tcGlsYXRp
b24gd2l0aCAtV2Vycm9yLgoKSSBjYW4gdHJ5IGZvcm1pbmcgYSBwYXRjaCBvbiB0aGlzIGlmIGl0
IGZlZWxzIGFscmlnaHQgdG8gcGVvcGxlLgoKVGhhbmtzLApBbmR5CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
