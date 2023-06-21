Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0910EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 14:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BN3elH6lBstAaLnll2pW2u4Uqk43gjZLgYDyl7dou7I=; b=hb2ipZPHNWpKAR
	oJnYKZiIvVR6yOEOid96ffHfq5dxxn0MGLd95/mJJ0Q3XPd6ZLRm73r6BCLkkuOk6QSGVvK7QQAxm
	y8ZW7Xy0bm9tv5j6syX45AbvPPZl4f+eBojDOTOeFfaRpe8xMdAP7Z+49ShxrcLZnbVoFDSRAmmWW
	Mx1Ev7dNPF9q5BIY9txO6n1KtFnxjqcM/jg+LzzZgoKEwcyxJiPwwzBGtR0FNJ4dsmNpatPCzZ/Kx
	glu+pyJdCLHpkpNz7vGmr1Z4j4JX7v19IRlfgmXZevLjylQ9FYFRmcS4pcrD7cLdr7S5FcyiLJNoB
	CdqZhWi6LUU3KqotumrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz4s-00EqCm-2F;
	Wed, 21 Jun 2023 14:44:58 +0000
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBz4p-00EqC4-2q
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 14:44:57 +0000
Received: by mail-qk1-x734.google.com with SMTP id af79cd13be357-76240c53846so455145985a.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bluespec-com.20221208.gappssmtp.com; s=20221208; t=1687358694; x=1689950694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G8gqXQsnGvoqkioXahPnHUa3oTE8+S+Wca2oYm6MdHI=;
        b=4MnISCPychI9MMlHnn8J9pKH/Ay9J/Dav4Vl9ssbYh3FQep+W2M0Lm+wD5nLBkIna/
         8qVGdSH//hOry3zmOVIxA5boXrjTbESUCFFm6sXot7gOBQtkOj/oFMrmGu5tpctluUSD
         AUJw1tw4nGbStH/GjvaOfqMmJ6KBWPesxGScMaP03hvbK1sUR9VL+Ff0/beK7HQPTmBx
         60j31J/tZfKigpnPLmVrwxb0dL7BGA9TGncYeOiqOu1BzpELNliddyx90I1WfLWhbmI+
         ziQQqpMrS0t/6jgTLBIoaw2j/O5sCVYG72TFND86ZpOu/qvsuRpYTU2g3C+wxFq4l3Hd
         y7jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687358694; x=1689950694;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G8gqXQsnGvoqkioXahPnHUa3oTE8+S+Wca2oYm6MdHI=;
        b=SiT9AxcShwxeNkhvj5L5Ibr4SRHhH9DhExmXy9BuG1KGR9skoHaIZGfkjLvAEzQtb1
         WBmXSfZ5DEP8BFtzksE7YK4RgCLLtXwjcmSNJRjAJtIq11oYCYg1gQ0zO7VqFMMzEs/+
         pcZ8ijlHqOyJEW10E6nIe2s7LYICa3FDj3dsT4T/hvV+nmt/Nh0HOQn/kmv2kvMAGoWH
         xW/j3b6BQ0HyihyuZCHqKzpVQYlddLv8OnZQdyoJDPmOEFR6q+t1hy663Zj2nUYZao//
         PF5jXD45wRSLP3LN0qbviyOtUolUE7yD6nWe58e400h6YSWhwo44XUjVPV9fyxA0I+o3
         tCYg==
X-Gm-Message-State: AC+VfDyjiu87Gv6c9gPu4Rz3CtaOYR9PLQelGd9AXEKBClsy4opNXwUr
	AhGcB81VAzD2SKleds6OhE9H
X-Google-Smtp-Source: ACHHUZ7OvZbQAtEM+u7sfCEQFYfifeK8cZODV4oH6Sq9M08XTHTtKnKUvBcQB4KdYm4iaSfje1s3jg==
X-Received: by 2002:a05:620a:6283:b0:763:9f31:157b with SMTP id ov3-20020a05620a628300b007639f31157bmr7992191qkn.11.1687358694060;
        Wed, 21 Jun 2023 07:44:54 -0700 (PDT)
Received: from bruce.bluespec.com ([181.214.94.83])
        by smtp.gmail.com with ESMTPSA id i18-20020ae9ee12000000b0075772c756e0sm2280123qkg.101.2023.06.21.07.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jun 2023 07:44:53 -0700 (PDT)
Date: Wed, 21 Jun 2023 10:44:51 -0400
From: Darius Rad <darius@bluespec.com>
To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>
Subject: Re: [PATCH] RISC-V: Clobber V registers on syscalls
Message-ID: <ZJMM4yrU8RfnhD+m@bruce.bluespec.com>
Mail-Followup-To: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, Andy Chiu <andy.chiu@sifive.com>
References: <mhng-6bb8dac2-33c3-410f-82ce-36554e497e9c@palmer-ri-x1c9>
 <878rccoprt.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878rccoprt.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_074456_144378_B5209E88 
X-CRM114-Status: GOOD (  40.20  )
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

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgMDQ6MjY6MTRQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3
cm90ZToKPiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3JpdGVzOgo+IAo+
ID4gT24gTW9uLCAxOSBKdW4gMjAyMyAxMjowMToyMCBQRFQgKC0wNzAwKSwgYmpvcm5Aa2VybmVs
Lm9yZyB3cm90ZToKPiA+PiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4gd3Jp
dGVzOgo+ID4+Cj4gPj4gWy4uLl0KPiA+Pgo+ID4+Pj4+ICsJCXJpc2N2X3ZfdnN0YXRlX29mZihy
ZWdzKTsKPiA+Pj4+PiArCj4gPj4+Pgo+ID4+Pj4gTm90IG9mZiwgcmlnaHQ/IElzbid0IGl0IF9f
cmlzY3Zfdl92c3RhdGVfY2xlYW4oKSB0aGF0IHlvdSdkIGxpa2UgdG8KPiA+Pj4+IGNhbGw/IFNv
bWV0aGluZyBsaWtlOgo+ID4+Pj4KPiA+Pj4+IHN0YXRpYyB2b2lkIHZzdGF0ZV9kaXNjYXJkKHN0
cnVjdCBwdF9yZWdzICpyZWdzKQo+ID4+Pj4gewo+ID4+Pj4gICAgICAgIGlmICgocmVncy0+c3Rh
dHVzICYgU1JfVlMpID09IFNSX1ZTX0RJUlRZKQo+ID4+Pj4gICAgICAgICAgICAgICAgX19yaXNj
dl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKPiA+Pj4+IH0KPiA+Pj4+Cj4gPj4+PiBDb21wbGVtZW50
ZWQgYnkgYSAhViBjb25maWcgdmFyaWFudC4KPiA+Pj4KPiA+Pj4gSSB0aGluayBpdCdzIGp1c3Qg
YSBxdWVzdGlvbiBvZiB3aGF0IHdlJ3JlIHRyeWluZyB0byBkbyBoZXJlOiBjbGVhbiAKPiA+Pj4g
YXZvaWRzIHRoZSBrZXJuZWwgViBzdGF0ZSBzYXZlLCBidXQgdW5sZXNzIHRoZSBrZXJuZWwgZGVj
aWRlcyB0byB1c2UgViAKPiA+Pj4gZHVyaW5nIHRoZSBzeXNjYWxsIHRoZSByZWdpc3RlciBjb250
ZW50cyB3aWxsIHN0aWxsIGJlIHVzYWJsZSBieSAKPiA+Pj4gdXNlcnNwYWNlLiAgTWF5YmUgdGhh
dCdzIGZpbmUgYW5kIHdlIGNhbiBqdXN0IHJlbHkgb24gdGhlIElTQSBzcGVjLCAKPiA+Pj4gdGhv
dWdoPyAgSSBzZW50IGFub3RoZXIgcGF0Y2ggdG8ganVzdCBkb2N1bWVudCBpdCBpbiBMaW51eCwg
ZXZlbiBpZiBpdCdzIAo+ID4+PiBpbiB0aGUgSVNBIHNwZWMgaXQgc2VlbXMgd29ydGggaGF2aW5n
IGluIHRoZSBrZXJuZWwgYXMgd2VsbC4KPiA+Pj4KPiA+Pj4gVGhhdCBzYWlkLCBJIHRoaW5rIHRo
ZSByaWdodCB0aGluZyB0byBkbyBoZXJlIG1pZ2h0IGJlIHRvIHplcm8gdGhlIFYgCj4gPj4+IHJl
Z2lzdGVyIHN0YXRlIGFuZCBzZXQgaXQgdG8gaW5pdGlhbDogdGhhdCB3YXkgd2UgY2FuIHByZXZl
bnQgdXNlcnNwYWNlIAo+ID4+PiBmcm9tIGFjY2lkZW50YWxseSByZWx5aW5nIG9uIHRoZSBzdGF0
ZSBzYXZlLCBidXQgd2UgY2FuIGFsc28gYXZvaWQgdGhlIAo+ID4+PiB0cmFwIHRoYXQgd291bGQg
Y29tZSBmcm9tIHR1cm5pbmcgaXQgb2ZmLiAgVGhhdCBsZXRzIHVzIGdpdmUgdGhlIAo+ID4+PiBo
YXJkd2FyZSBhIG5pY2UgY2xlYW4gaW5kaWNhdGlvbiB3aGVuIHRoZSBWIHN0YXRlIGlzbid0IGlu
IHVzZSwgd2hpY2ggCj4gPj4+IHdpbGwgaG9wZWZ1bGx5IGhlbHAgdXMgYXZvaWQgdGhlIHNhdmUv
cmVzdG9yZSBwZXJmb3JtYW5jZSBpc3N1ZXMgdGhhdCAKPiA+Pj4gb3RoZXIgcG9ydHMgaGF2ZSBo
aXQuCj4gPj4KPiA+PiBGV0lXLCBJIHRoaW5rIHRoYXQncyBhIG11Y2ggYmV0dGVyIGlkZWEgdGhh
biB0dXJuaW5nIFYgb2ZmLiBJIGFsc28gbGlrZQo+ID4+IHRoYXQgaXQnbGwgcHJldmVudGluZyB1
c2VybGFuZCB0byByZWx5IG9uIHByZS1lY2FsbCBzdGF0ZS4KPiA+Cj4gPiBPSywgYW55b25lIGVs
c2Ugb3Bwb3NlZD8KPiA+Cj4gPiBXZSdyZSBraW5kIG9mIGluIHRoZSB3ZWVkcyBvbiBwZXJmb3Jt
YW5jZSwgSSB0aGluayB3ZSdkIG5lZWQgSFcgdG8ga25vdyAKPiA+IGZvciBzdXJlIGlmIGVpdGhl
ciBpcyBhbiBpc3N1ZS4gIFNlZW1zIGJlc3QgdG8ganVzdCBwbGF5IGl0IHNhZmUgV1JUIHRoZSAK
PiA+IHVBQkkgZm9yIG5vdywgd2UgY2FuIGFsd2F5cyBkZWFsIHdpdGggYW55IHBlcmZvcm1hbmNl
IGlzc3VlcyBpZiB0aGUgCj4gPiBleGlzdC4KPiAKPiBIZXJlJ3MgdGhlIHBhdGNoIHlvdSBtZW50
aW9uZWQgYXQgdGhlIFBXIHN5bmNodXA7IEkndmUga2VwdCB0aGUgU3ViamVjdAo+IGFuZCBzdWNo
IGlmIHlvdSB3YW4ndCB0byBhcHBseSBpdC4gTE1LIGlmIHlvdSdkIGxpa2UgYSBwcm9wZXIgb25l
Lgo+IAo+IC0tCj4gCj4gU3ViamVjdDogW1BBVENIXSByaXNjdjogRGlzY2FyZCB2ZWN0b3Igc3Rh
dGUgb24gc3lzY2FsbHMKPiBNSU1FLVZlcnNpb246IDEuMAo+IENvbnRlbnQtVHlwZTogdGV4dC9w
bGFpbjsgY2hhcnNldD1VVEYtOAo+IENvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiAK
PiBUaGUgUklTQy1WIHZlY3RvciBzcGVjaWZpY2F0aW9uIHN0YXRlczoKPiAgIEV4ZWN1dGluZyBh
IHN5c3RlbSBjYWxsIGNhdXNlcyBhbGwgY2FsbGVyLXNhdmVkIHZlY3RvciByZWdpc3RlcnMKPiAg
ICh2MC12MzEsIHZsLCB2dHlwZSkgYW5kIHZzdGFydCB0byBiZWNvbWUgdW5zcGVjaWZpZWQuCj4g
Cj4gVGhlIHZlY3RvciBzdGF0dXMgaXMgc2V0IHRvIEluaXRpYWwsIGFuZCB0aGUgdmVjdG9yIHN0
YXRlIGlzCj4gZXhwbGljaXRseSB6ZXJvZWQuIFRoYXQgd2F5IHdlIGNhbiBwcmV2ZW50IHVzZXJz
cGFjZSBmcm9tIGFjY2lkZW50YWxseQo+IHJlbHlpbmcgb24gdGhlIHN0YXRlZCBzYXZlLgoKSXMg
aXQgd29ydGggY2xvYmJlcmluZyB3aXRoIGFsbCAxcywgcmF0aGVyIHRoYW4gemVybywgZm9yIGNv
bnNpc3RlbmN5IHdpdGgKb3RoZXIgdmVjdG9yIGJlaGF2aW9yIChpLmUuLCB0YWlsL21hc2sgYWdu
b3N0aWMpIGFuZCBmb3IgdGhlIHJlYXNvbnMgZ2l2ZW4KaW4gdGhlIHZlY3RvciBzcGVjIGZvciBu
b3QgZG9pbmcgc28gd2l0aCB6ZXJvPwoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVs
IDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0
b3IuaCB8IDI0ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jICAgICAgIHwgIDIgKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmggYi9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCj4gaW5kZXggMDRjMGIwN2JmNmNkLi5iMzAyMGQw
NjRmNDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3IuaAo+ICsr
KyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiBAQCAtMTYzLDYgKzE2MywyOSBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgX19zd2l0Y2hfdG9fdmVjdG9yKHN0cnVjdCB0YXNrX3N0cnVj
dCAqcHJldiwKPiAgdm9pZCByaXNjdl92X3ZzdGF0ZV9jdHJsX2luaXQoc3RydWN0IHRhc2tfc3Ry
dWN0ICp0c2spOwo+ICBib29sIHJpc2N2X3ZfdnN0YXRlX2N0cmxfdXNlcl9hbGxvd2VkKHZvaWQp
Owo+ICAKPiArc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQoc3RydWN0
IHB0X3JlZ3MgKnJlZ3MpCj4gK3sKPiArCXVuc2lnbmVkIGxvbmcgdmw7Cj4gKwo+ICsJaWYgKCFy
aXNjdl92X3ZzdGF0ZV9xdWVyeShyZWdzKSkKPiArCQlyZXR1cm47Cj4gKwo+ICsJcmlzY3Zfdl92
c3RhdGVfb24ocmVncyk7Cj4gKwo+ICsJcmlzY3Zfdl9lbmFibGUoKTsKPiArCWFzbSB2b2xhdGls
ZSAoCj4gKwkJIi5vcHRpb24gcHVzaFxuXHQiCj4gKwkJIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+
ICsJCSJ2c2V0dmxpCSUwLCB4MCwgZTgsIG04LCB0YSwgbWFcblx0Igo+ICsJCSJ2bXYudi5pCXYw
LCAwXG5cdCIKPiArCQkidm12LnYuaQl2OCwgMFxuXHQiCj4gKwkJInZtdi52LmkJdjE2LCAwXG5c
dCIKPiArCQkidm12LnYuaQl2MjQsIDBcblx0Igo+ICsJCSIub3B0aW9uIHBvcFxuXHQiCj4gKwkJ
OiAiPSZyIiAodmwpIDogOiAibWVtb3J5Iik7Cj4gKwlyaXNjdl92X2Rpc2FibGUoKTsKPiArfQo+
ICsKPiAgI2Vsc2UgLyogISBDT05GSUdfUklTQ1ZfSVNBX1YgICovCj4gIAo+ICBzdHJ1Y3QgcHRf
cmVnczsKPiBAQCAtMTc4LDYgKzIwMSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCByaXNjdl92X3Zz
dGF0ZV9jdHJsX3VzZXJfYWxsb3dlZCh2b2lkKSB7IHJldHVybiBmYWxzZTsgfQo+ICAjZGVmaW5l
IF9fc3dpdGNoX3RvX3ZlY3RvcihfX3ByZXYsIF9fbmV4dCkJZG8ge30gd2hpbGUgKDApCj4gICNk
ZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpCQlkbyB7fSB3aGlsZSAoMCkKPiAgI2RlZmlu
ZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdoaWxlICgwKQo+ICsjZGVmaW5lIHJp
c2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncykJCWRvIHt9IHdoaWxlICgwKQo+ICAKPiAgI2VuZGlm
IC8qIENPTkZJR19SSVNDVl9JU0FfViAqLwo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMKPiBpbmRleCAwNWZmZGNk
MTQyNGUuLjAwYzY4YjU3ZmY4OCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFw
cy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBAIC0yOTUsNiArMjk1LDgg
QEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190cmFwX2VjYWxs
X3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAkJcmVncy0+ZXBjICs9IDQ7Cj4gIAkJcmVncy0+
b3JpZ19hMCA9IHJlZ3MtPmEwOwo+ICAKPiArCQlyaXNjdl92X3ZzdGF0ZV9kaXNjYXJkKHJlZ3Mp
Owo+ICsKPiAgCQlzeXNjYWxsID0gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZShyZWdzLCBz
eXNjYWxsKTsKPiAgCj4gIAkJaWYgKHN5c2NhbGwgPCBOUl9zeXNjYWxscykKPiAKPiBiYXNlLWNv
bW1pdDogYWJkNjE1MmQ2MDQ2ZGRjNGJlMTA0MGI2MjA2YmVlMmUwMjVlOGE3OQo+IC0tIAo+IDIu
MzkuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4gbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
