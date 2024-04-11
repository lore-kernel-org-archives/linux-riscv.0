Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF726CD1297
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 02:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iKNu0egXYh80EtCclj4xFM0kf60etUbSfAeQPHwASTw=; b=byA8KX36eFZtij
	jp00birfdSdYhEzL7mCFQd23ReeaST7NxPAToOqh0IolQLFiovbHFmS2xDqSzw1+7lkvppBoSmscs
	USS+GYq8RoScxLH4AuRC/lGluXh4hTGsxGvTzwwpWkDwbkp/CCsp2Rge1boOGEtydIolckbWyZ7/k
	A4EgQACqX4zRaqmbYY9e55idLZwXCsunyJ/7YpCxXxDxZoqnRf/MXS/uGo7+iajjQEAsJgvNGJknE
	V/rZzZ/eE7Jzt62vXhtV6yDrdrPVkltHvCeKvcVC22mEcpDOjiSQgjiWgmLTDM7gUNok+8JEonZp2
	OQEE+o4h4+nuPeOpVCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rukBP-00000009zCW-0nlu;
	Thu, 11 Apr 2024 02:28:59 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rukBM-00000009z9c-0T0a
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 02:28:57 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-22f078f1aecso2533954fac.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 19:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1712802523; x=1713407323; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RZa5VrCYalte+N2warzKW3IpmB8jtSkkbR424BNjE4g=;
        b=APAsVlf3DDVtM46Awx0fjTfh8Y02oearknJNjyjG0r7v6cLOykzddAwYJmT7xghNox
         9PptH+rx8cPXu1PsHcp77ohZaEzL6lnlZQvpBvqrhqhS8TEh7aoxrhisdS3V52g2RGVk
         W8T0qhd/z1HxnAYmQ3UAVGEvDQ3gftUIsIstruEvu9foN2oDHfUgiIEguVH419rO/qlK
         rVLb2+f88j3QFOC/3mEj5AYdOhyEut1vvxyGh+0Fx9BOTIqShwn5sNiaMYnw1qP/WlNX
         +Y0HIJn0uR14AQK1RFK8/+xpw0ohP7dgCAgq1Bb6KJYyDFW4vYvIFQZ7PjYx3WWv29ln
         6Apw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712802523; x=1713407323;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZa5VrCYalte+N2warzKW3IpmB8jtSkkbR424BNjE4g=;
        b=Ww1+JtTj3P5hm8cHyGqMzXk4h65SIAE6GvSG1AcUyxl8p/Mz3mzp9KAAKNjmRaYV+a
         CcjHC3gYXeIT5TTkVcFSR2Z699uxNWFec1wAU2+X95ETLrEzblF97l5BlrSP6k2zy3vC
         3qsXdJKvc7LoqPdltM2+ldNYn6AJY775gM6EAxpUU4YpSZAwz+aoSKfQ7fXBtDFpd2kT
         VrYBLFH7kgaJhPDo3GlyIpDpWusKKWgC4NK70llJ7U3l9ntZETynVbo/wfO1nWxBQq1M
         Ov/PfjF+F9gs0YbDzusqASD43icfsPwVvmU5834w8Si3BIOKNmS3lvI/70Y1z7BwsVLN
         5egg==
X-Forwarded-Encrypted: i=1; AJvYcCX1ZwFHnmMhwqGSV02AeJXXSh1AoATAz2HPHY35I0C+24qGf0aBnIqobms+fhdiE99SNBtQn2UxkALoSHqxn+WjcOyJPnQS1CwpmxUzr/wZ
X-Gm-Message-State: AOJu0Yywb0oqRlxrlyuTXvhVR1D7xChBFV4orv0A5cPAkd4F4OWn2Ncx
	OR25paMqiP0my9kfn1nFJseQNqoOkuEGyFDctgSgEmqGxSQJzPBaKN1i49LMEGSy9JS2bYoatfa
	OpB4Vq8BxoxN1++YPHIpmiMkRcvrY41TwYQcPgg==
X-Google-Smtp-Source: AGHT+IGL+36/5FAhSNT/qMIqi+3odc/2fts2wJ2UrUZ5w9uMu+P7IO7ZtKqknoIWdATGMtiRodslssOipgwfCl+ZbgU=
X-Received: by 2002:a05:6870:41cf:b0:22e:b2b4:f00b with SMTP id
 z15-20020a05687041cf00b0022eb2b4f00bmr4754613oac.39.1712802523483; Wed, 10
 Apr 2024 19:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240407123829.36474-1-cuiyunhui@bytedance.com> <abd135fa-c432-4e37-9792-07a0e17e93d5@arm.com>
In-Reply-To: <abd135fa-c432-4e37-9792-07a0e17e93d5@arm.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Thu, 11 Apr 2024 10:28:32 +0800
Message-ID: <CAEEQ3w=+C2J0ZS227-1P-B+pe_NRp_3i4c4CxGssiKqbpXx_qw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/2] ACPI: PPTT: Populate cacheinfo
 entirely with PPTT
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: rafael@kernel.org, lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_192856_465826_0D69D4C5 
X-CRM114-Status: GOOD (  26.82  )
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

SGkgSmVyZW15LAoKT24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgOTozMOKAr0FNIEplcmVteSBMaW50
b24gPGplcmVteS5saW50b25AYXJtLmNvbT4gd3JvdGU6Cj4KPiBIaSwKPgo+Cj4gRmlyc3QgdGhh
bmtzIGZvciB3b3JraW5nIG9uIHRoaXMuCj4KPiBPbiA0LzcvMjQgMDc6MzgsIFl1bmh1aSBDdWkg
d3JvdGU6Cj4gPiBXaGVuIHRoZSB0eXBlIGFuZCBsZXZlbCBpbmZvcm1hdGlvbiBvZiB0aGlzX2xl
YWYgY2Fubm90IGJlIG9idGFpbmVkCj4gPiBmcm9tIGFyY2gsIGNhY2hlaW5mbyBpcyBjb21wbGV0
ZWx5IGZpbGxlZCBpbiB3aXRoIHRoZSBjb250ZW50IG9mIFBQVFQuCj4KPiBJIHN0YXJ0ZWQgcmV2
aWV3aW5nIHRoaXMsIGJhc2VkIG9uIHdoYXQgSSB1bmRlcnN0b29kIHRvIGJlIHRoZSBuZWVkIHRv
Cj4gZ2VuZXJhdGUgdGhlIHRvcG9sb2d5IGVudGlyZWx5IGZyb20gdGhlIFBQVFQuIEJ1dCwgaXQg
d2FzIHJhaXNpbmcgbW9yZQo+IHF1ZXN0aW9ucyB0aGFuIGFuc3dlcnMgYmVjYXVzZSB0aGUgUFBU
VCBpcyBmYXIgdG9vIGZsZXhhYmxlIGluIGl0cwo+IGFiaWxpdHkgdG8gcmVwcmVzZW50IGNhY2hl
IGhpZXJhY2hpZXMgdGhhdCBhcm4ndCBsb2dpY2FsbHkgdXNlZnVsLiBGb3IKPiBleGFtcGxlIG11
bHRpcGxlIEkgb3IgRCBjYWNoZXMgYXQgdGhlIHNhbWUgbGV2ZWwsIG9yIEkgb3IgRCBjYWNoZXMK
PiBoaWdoZXIgaW4gdGhlIHRvcG9sb2d5IHRoYW4gdW5pZmllZCBvbmVzLgo+Cj4gQXQgbGVhc3Qg
Zm9yIGFybTY0IChhbmQgSSB0aGluayBvdGhlcnMpIHRoZXJlIGlzIGFuIHVuZGVyc3Rvb2QKPiBz
aW1wbGlmaWNhdGlvbiB0aGF0IHRoZXJlIHdpbGwgYmUgTiBsZXZlbHMgb2Ygc3BsaXQgSS9EIGNh
Y2hlcyBhbmQgTQo+IHVuaWZpZWQgbGV2ZWxzLiBBbmQgZnJvbSB0aGF0LCB0aGUgbnVtYmVyIG9m
IGNhY2hlIGxlYXZlcyBhcmUgY29tcHV0ZWQKPiBhbmQgYWxsb2NhdGVkLCBhbmQgdGhlbiB3ZSBn
byBpbiBhbmQgbGFyZ2x5IHNraXAgUFBUVCBjYWNoZSBub2RlcyB3aGljaAo+IGRvbid0IG1ha2Ug
c2Vuc2UgaW4gdmlldyBvZiBhIGdlbmVyaWMgdG9wb2xvZ3kgbGlrZSB0aGF0LiAoc2VlIHRoZQo+
IGNvbW1lbnQgaW4gY2FjaGVpbmZvLmM6NTA2KQo+Cj4gQm90aCBvZiB0aG9zZSBwaWVjZXMgb2Yg
aW5mb3JtYXRpb24gYXJlIGF2YWlsYWJsZSBpbgo+IGFjcGlfZ2V0X2NhY2hlX2luZm8oKS4gVGhl
IG1pc3NpbmcgcGFydCBpcyBtYXJraW5nIHRob3NlIE4gbGV2ZWxzIG9mIEkvRAo+IGNhY2hlIGFz
IHN1Y2guCj4KPiBMb29raW5nIGF0IHRoaXMgY29kZSBJIGRvbid0IHJlYWxseSBzZWUgYWxsIHRo
ZSBlcnJvci9hbGxvY2F0aW9uCj4gbG9naWMvZXRjIHRoYXQgYXNzdXJlcyB0aGUgY2FjaGUgbGVh
ZiBpbmRleGluZyBpcyBhbGxvY2F0ZWQgY29ycmVjdGx5Cj4gd2hpY2ggd29ycmllcyBtZSwgYWx0
aG91Z2ggYWRtaWRkaXRseSBJIGNvdWxkIGJlIG1pc3Npbmcgc29tZXRoaW5nCj4gaW1wb3J0YW50
Lgo+Cj4gSW4gc3VtbWFyeSwgZGlkIHlvdSBjb25zaWRlciBqdXN0IGFsbG9jYXRpbmcgbWF0Y2hp
bmcgSS9EIGNhY2hlcyBmcm9tCj4gdGhlIG51bWJlciBvZiBzcGxpdCBsZXZlbHMgaW4gYWNwaV9n
ZXRfY2FjaGVfaW5mbygpIHRoZW4gcmVtb3Zpbmcgb3IKPiBpbnZhbGlkYXRpbmcgdGhlIG9uZXMg
dGhhdCBkb24ndCBoYXZlIG1hdGNoaW5nIFBQVFQgZW50cmllcyBhZnRlcgo+IHJ1bm5pbmcgY2Fj
aGVfc2V0dXBfYWNwaSgpPyBUaGF0cyBhIGZhaXJseSB0cml2aWFsIGNoYW5nZSBBRkFJSyBpZiB0
aGUKPiBkZWNpc2lvbiBpcyBiYXNlZCBvbiB0aGUgbGFjayBvZiBhIGNhY2hlX2lkIG9yIGp1c3Qg
Y2hhbmdpbmcgdGhlCj4gdGhpc19sZWFmLT50eXBlID0gQ0FDSEVfVFlQRV9VTklGSUVEIGFzc2ln
bm1lbnQgdG8gdGhlIGNvcnJlY3QgdHlwZSBhbmQKPiBhc3N1cmluZyBsZWZ0IG92ZXIgQ0FDSEVf
VFlQRV9OT0NBQ0hFIGVudHJpZXMgYXJlIHJlbW92ZWQuIEkgdGhpbmsgbXVjaAo+IG9mIHRoZSAi
c2lnbmlmaWNhbnQgd29yayIgaXMgbGlrZWx5IGZpeGVkIGZvciB0aGF0IHRvIHdvcmsuIEp1c3QK
PiB0d2Vha2luZyBkZXRlY3RfY2FjaGVfbGV2ZWwoKS9nZXRfY2FjaGVfdHlwZSgpIHRvIHNldAo+
IENBQ0hFX1RZUEVfU0VQRVJBVEUgaWYgdGhlIGxldmVsIGlzIGxlc3MgdGhhbiB0aGUgYWNwaV9n
ZXRfY2FjaGVfaW5mbygpCj4gc3BsaXRfbGV2ZWwgdmFsdWUgcHJvYmFibHkgYWxzbyBkb2VzIHRo
ZSBtYWpvcml0eSBvZiB3aGF0IHlvdSBuZWVkCj4gb3V0c2lkZSBvZiBoYXZpbmcgdW5lcXVhbCBj
b3VudHMgb2YgSSBhbmQgRCBjYWNoZXMuCj4KPiBUaGVyZSBhcmUgcHJvYmFibHkgb3RoZXIgY2hv
aWNlcyBhcyB3ZWxsLCB0aG91Z2h0cz8KPgoKRmlyc3QsIEkgdGhpbmsgdGhlIGN1cnJlbnQgc3Rh
dGUgb2YgdGhlIEFDUEkgUFBUVCBzcGVjaWZpY2F0aW9uIG1lZXRzCnRoZSByZXF1aXJlbWVudHMg
YW5kIGlzIGxvZ2ljYWxseSBjb21wbGV0ZS4gT3RoZXJ3aXNlLCB0aGUgUFBUVApzcGVjaWZpY2F0
aW9uIG5lZWRzIHRvIGJlIHVwZGF0ZWQsIHJpZ2h0PwpPdXIgZGlzY3Vzc2lvbiBpcyBiZXN0IGZv
Y3VzZWQgb24gdGhlIGV4aXN0aW5nIGFuZCB1c3VhbCBjYXNlLCBldmVuIG9uCkFSTTY0LCB3aGlj
aCBpcyBhcyB5b3Ugc2F5ICJOLWxldmVsIHNlcGFyYXRlZCBJL0QgY2FjaGUsIE0tbGV2ZWwKdW5p
ZmllZCIuCgpBbmQgdGhlbiwgdGhlIHByb2JsZW0gd2UgaGF2ZSBub3cgaXMgdGhhdCB0aGUgUklT
Qy1WIGFyY2hpdGVjdHVyZSBkb2VzCm5vdCBoYXZlIGEgc2V0IG9mIHJlZ2lzdGVycyB0byBkZXNj
cmliZSB0aGUgY2FjaGUgbGV2ZWwgYW5kIHR5cGUgbGlrZQpBUk02NCBkb2VzLCBzbyB3ZSBuZWVk
IHRvIGZ1bGx5IHRydXN0IHRoZSBjb250ZW50cyBvZiB0aGUgUFBUVCB0YWJsZS4KUGxlYXNlIGNo
ZWNrIHRoZSBwYXRjaDoKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4
LXJpc2N2L3BhdGNoLzIwMjQwNDA3MTIzODI5LjM2NDc0LTItY3VpeXVuaHVpQGJ5dGVkYW5jZS5j
b20vCi4KCkp1ZGdpbmcgZnJvbSB0aGlzIHJlcXVpcmVtZW50LCBjYW4geW91IGhlbHAgcmV2aWV3
IHRoaXMgcGF0Y2g/IFRoYW5rcy4KCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
