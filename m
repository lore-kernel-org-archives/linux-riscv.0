Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417D6CF6495
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Sep 2024 09:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qdd3Xi0f0GUnOIQ75Quo/vaxe+3rn6fy2O9w7Z7GXoc=; b=B+aEQU+9HLqnBY
	n8GO+4a1yRpXvMRAA+4AD7T6xhBFPmhDZ48vqjAPwOI/c+u7mUVB0V9JpDkqyMU1Z6k4GFoTKIpts
	E0zjo0puFZL0pHikP8hkSy5FG2sLUcxIhUmFy23rOFiDsR+35obh2uKmbE+R5MedibGDjJBxpGOIe
	WJ2GebZoLxuGkA6h7k8YhYK7FGwWtChgT71B8PVwJoBYe5GcyPa760k65mE/yvhavgM58NWK2olDp
	g0A4rDXBGc7aCxToBCiZMQD9LTX8y93ysA1HH2/p5SA+AIwetOyt08NvHVt0Tp1z1GPOkjjtZ7Rgy
	b03pBpRjKgyf70TEqN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suTWq-0000000CrlT-37c5;
	Sat, 28 Sep 2024 09:14:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suTWn-0000000CrkE-374U
	for linux-riscv@lists.infradead.org;
	Sat, 28 Sep 2024 09:14:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C26B8A4016A
	for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 09:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90D9C4CECD
	for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 09:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727514852;
	bh=ZxUX2bSPp3e7OZZCI7nhMz8oj00AuqElgjuSvQ01SZQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jsL87tHoabQvgso0X70BChaJ8YD9i3hGMz2fN6J51wZszFHRe2b0i/Ocb5phYZhMU
	 /aDvvB51dKXBsNVz7Cgagws98BCf0dW1NKltGawuJl6R44ME4a7pmpZqgCvCGUN1eD
	 veKGN1FI0USmm07DotjjHzZ0pIwThuSM0hG88SY5c1l/v5WPxknPIJFMIP8AmynnV1
	 CY21/H0j2TaMXJVQA428X0lgB8q3rT/qrEbrEHTdac5CB6UdRlIpLxR80tQ5Od1NFq
	 tLfjDFCbOzWG7Us4dFAoFijyTBMBAJtsH55M29sbfdePSEDP8xeDE/xkcqABNQ6jBj
	 IqCIDeJHCjvoA==
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a9a3e731f9so254983885a.0
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 02:14:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV1FcgPJZE71SY4MOr8Rp0GJVt2ZzAXDFI0wV1piuOZXSp9IAybV2aX83bvXZfL1cWZvqfl7s3cgk3+6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGgdt3sdjemShx2q6kao9TQ9olhU73XYNrpGLOJnVmmIEKMFC0
	HEIjhogUXD6g2Jv3UVaRuv9uNyiDXJ7w0EkaFQiScAMuv9Q1yMn9Hc/sydC297qOdPcnTxrTRgW
	3739+1wbZKYeuthml6A3Gw8pEeXI=
X-Google-Smtp-Source: AGHT+IEIJBvI1ZnMqsnDSFPkfMNKVu+B+hYGK1Y1g1nidaxCR4JAFXKw3/qPbJRVW+JE/2IgHiMcPA8URIFsOtlvejU=
X-Received: by 2002:a05:620a:370e:b0:7a2:a1d:f0c6 with SMTP id
 af79cd13be357-7ae37825602mr734291385a.5.1727514851848; Sat, 28 Sep 2024
 02:14:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240927131355.350918-1-bjorn@kernel.org> <20240927131355.350918-2-bjorn@kernel.org>
 <CAEf4BzaWneXBv401rOdW8ijBTqRn_Ut4FFvhbsPShh5_pjV33A@mail.gmail.com>
In-Reply-To: <CAEf4BzaWneXBv401rOdW8ijBTqRn_Ut4FFvhbsPShh5_pjV33A@mail.gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Date: Sat, 28 Sep 2024 11:14:01 +0200
X-Gmail-Original-Message-ID: <CAJ+HfNh+2oN_A4KtUkeSfvH+D6AHkVWErskq5+s2zgejot0BiA@mail.gmail.com>
Message-ID: <CAJ+HfNh+2oN_A4KtUkeSfvH+D6AHkVWErskq5+s2zgejot0BiA@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] selftests: bpf: Add missing per-arch include path
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Mykola Lysenko <mykolal@fb.com>, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Charlie Jenkins <charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_021413_933504_E91D5A02 
X-CRM114-Status: GOOD (  19.19  )
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

T24gRnJpLCAyNyBTZXB0IDIwMjQgYXQgMjI6NTIsIEFuZHJpaSBOYWtyeWlrbwo8YW5kcmlpLm5h
a3J5aWtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIFNlcCAyNywgMjAyNCBhdCA2OjE0
4oCvQU0gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JvdGU6Cj4gPgo+ID4gRnJv
bTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+ID4KPiA+IFRoZSBwcm9nX3Rl
c3RzIHByb2dyYW1zIGRvIG5vdCBpbmNsdWRlIHRoZSBwZXItYXJjaCB0b29scyBpbmNsdWRlCj4g
PiBwYXRoLCBlLmcuIHRvb2xzL2FyY2gvcmlzY3YvaW5jbHVkZS4gU29tZSBhcmNoaXRlY3R1cmVz
IGRlcGVuZCB0aG9zZQo+ID4gZmlsZXMgdG8gYnVpbGQgcHJvcGVybHkuCj4gPgo+ID4gSW5jbHVk
ZSB0b29scy9hcmNoLyQoU1VCQVJDSCkvaW5jbHVkZSBpbiB0aGUgc2VsZnRlc3RzIGJwZiBidWls
ZC4KPiA+Cj4gPiBGaXhlczogNmQ3NGQxNzhmZTZlICgidG9vbHM6IEFkZCByaXNjdiBiYXJyaWVy
IGltcGxlbWVudGF0aW9uIikKPiA+IFNpZ25lZC1vZmYtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3Ju
QHJpdm9zaW5jLmNvbT4KPiA+IC0tLQo+ID4gIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2JwZi9N
YWtlZmlsZSB8IDMgKystCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9i
cGYvTWFrZWZpbGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9icGYvTWFrZWZpbGUKPiA+IGlu
ZGV4IDM2NTc0MGYyNGQyZS4uZDZhNTNhZmE0NDlmIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvYnBmL01ha2VmaWxlCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0
ZXN0cy9icGYvTWFrZWZpbGUKPiA+IEBAIC0xMCw2ICsxMCw3IEBAIFRPT0xTRElSIDo9ICQoYWJz
cGF0aCAuLi8uLi8uLikKPiA+ICBMSUJESVIgOj0gJChUT09MU0RJUikvbGliCj4gPiAgQlBGRElS
IDo9ICQoTElCRElSKS9icGYKPiA+ICBUT09MU0lOQ0RJUiA6PSAkKFRPT0xTRElSKS9pbmNsdWRl
Cj4gPiArVE9PTFNBUkNISU5DRElSIDo9ICQoVE9PTFNESVIpL2FyY2gvJChTUkNBUkNIKS9pbmNs
dWRlCj4gPiAgQlBGVE9PTERJUiA6PSAkKFRPT0xTRElSKS9icGYvYnBmdG9vbAo+ID4gIEFQSURJ
UiA6PSAkKFRPT0xTSU5DRElSKS91YXBpCj4gPiAgaWZuZXEgKCQoTyksKQo+ID4gQEAgLTQ0LDcg
KzQ1LDcgQEAgQ0ZMQUdTICs9IC1nICQoT1BUX0ZMQUdTKSAtcmR5bmFtaWMgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgICAtV2FsbCAtV2Vycm9yIC1mbm8t
b21pdC1mcmFtZS1wb2ludGVyICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAg
ICAkKEdFTkZMQUdTKSAkKFNBTl9DRkxBR1MpICQoTElCRUxGX0NGTEFHUykgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ICAgICAgICAgICAtSSQoQ1VSRElSKSAtSSQoSU5DTFVERV9ESVIpIC1JJChH
RU5ESVIpIC1JJChMSUJESVIpICAgICAgICAgIFwKPiA+IC0gICAgICAgICAtSSQoVE9PTFNJTkNE
SVIpIC1JJChBUElESVIpIC1JJChPVVRQVVQpCj4gPiArICAgICAgICAgLUkkKFRPT0xTSU5DRElS
KSAtSSQoVE9PTFNBUkNISU5DRElSKSAtSSQoQVBJRElSKSAtSSQoT1VUUFVUKQo+Cj4gRWR1YXJk
IHdhcyBnb2luZyB0byBzd2l0Y2ggc2VsZnRlc3RzIHRvIHVzZSBrZXJuZWwgVUFQSSBoZWFkZXJz
LCBJCj4gd29uZGVyIGlmIHdlIHNob3VsZCBkbyBqdXN0IHRoYXQgYW5kIHRoZW4gc2V0IHVwIGFy
Y2gtc3BlY2lmaWMKPiBpbmNsdWRlcyBmcm9tIGtlcm5lbCAobm90IGZyb20gdG9vbHMvKSBhcyB3
ZWxsPwoKSW4gdGhlIGVuZCBpdCdzIHVwIHRvIHlvdSBndXlzISBUaGlzIGlzIGJyb2tlbiBvbiBM
aW51cycgbWFzdGVyIGZvcgpSSVNDLVYgbm93LCBzbyBmcm9tIG15IChSSVNDLVYpIHBlcnNwZWN0
aXZlIGhhdmluZyBhIHdvcmthcm91bmQgc29vbmVyCnRoYW4gbGF0ZXIgd291bGQgYmUgbmljZSEK
CkBFZHVhcmQgRG8geW91IGhhdmUgYW55IHBhdGNoZXMgYXJvdW5kPyBJZiBzbywgSSBjYW4gdGFr
ZSB0aGVtIGZvciBhIHNwaW4gb24gUlYuCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
