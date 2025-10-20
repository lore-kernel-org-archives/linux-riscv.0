Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91EB3CCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 04:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ouc5a4EMdu47APDyUNPPiIkmnGcoA/JPaLM2jpTvR7k=; b=EUcLp18I/EgSU9
	rIrDxnhTEC6sYHR8HMp4sSaSyS0fWAcfam1zGmUHsBXjuoWQ2Y+g2ra0X9VE4vjmtq4FxhffZyune
	4lgWdscSJdP8fZSHZWVz4N2hIlpCb3sOQ8zX7VwNDapvH9eu4IFEB4SsBGxYA/IyaFK+BbfUE1mnG
	LcottHOLF1kn54EGLLTfP+yUDyGtYVXgY8Od7ewPRv2wFCAkmFbAAXSQWD/r47AtxOwIltVTrpUuA
	tMnH8VSYKUTbp2+OrvXkBJzbpseOBdZj0oQyH6Itg01R8gcVhcibnY6k0WSCZHXkYnCd979cfVigd
	HWuY3MGw2UGOQrCDkt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhbY-0000000BsF9-1TAf;
	Mon, 20 Oct 2025 04:34:44 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhbV-0000000BsEi-2ii4
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 04:34:43 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-33067909400so2965353a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Oct 2025 21:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760934881; x=1761539681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+onDgxMPyKLOY40mbxy0dXul6lSc7HSME7/BE/rGWAw=;
        b=azT/39c1imgVf0TVJ47uGKgBVD6hHn3Rq+up4TppMEPpLMSHgDpoEkk9oo7azYlUEr
         siqc2O6L6OzYCRGdUD50rTQjoFazcSar/tiMdL6vTy1UBjbaIeNhtvnpCWlIShJLLr7j
         4nM7OoyNQgnRbXx0SMuSC8WH2UYq9S93CHEVGbZsgA9OWAbrcwN/rFTK2GhuwujfzRIi
         XNJ9v4nJSHsQ20Gzr1018wWoImd22Prv1yo+Pv2ExFxSBBvW50efPZbiDPiIXruUuPlK
         G22TNZi6pVMIY/EbGQBtU+kWXCZ7HBrC6CZxvQUsEg6OCJwMJDew3UwzhxUuXtI0pSJ/
         cWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934881; x=1761539681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+onDgxMPyKLOY40mbxy0dXul6lSc7HSME7/BE/rGWAw=;
        b=UYRAljvPu/zIP7T9bOo2pCZSBkx++n0cbunXIxpIiyNuABDHBV9d1RPfC3LHBGiwlY
         DQerDSZfo+ibnznpyLfLEEC3Zl1YPkdZvWdgf2iTYpWYbWScb9oKg7OxTQiW/QJkkOGO
         RRU0BCWb+fF6NamgvEQMm4rmPYruJtYAKimh7ZInvSNNEsvY+jYJaYW9eZ7L57gUKbVP
         IKDQuRWsbz2j3wx52EvlPwLP+UCE5dhx3ulMP5ZYjh01RJ4B2jFcgpUV/YLayAYcFAb7
         0U4Bv6vfa7TcBzJX3jeHD6JSaXOIePL17tAi7Uc05ovAgd9xLKA6xmfdW3CweEYEEAdZ
         FCyg==
X-Forwarded-Encrypted: i=1; AJvYcCWYkT0ur6jRa93zKUFLKJNH4wSYptn94IcKmXCC1NyKtfh2aT1DvKaUn0y/tr6ZlTqScCL8GM0fWj81Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ9u5IVbjhGnN5OxgRLhKbaKAQlVlYwBIHmOPBRo2Zwjf902j8
	oCkKjDJ6d5opyxfHSrs+9cXc5AAwUqsPhiWpV74HpAskrBtvACpLif+VtWMyuF0yA0QTqxdwNiv
	skIhHE2cwgztmA3KHpVY0F7kOftDj1nt7UtXZ9DwKsw==
X-Gm-Gg: ASbGncunPA8lBKx1oT90g2PwvL6cnXNv1HxhcJlrCA//4A+evhvfE+m8k3/ZsZzPNl6
	EL/iqeevCmtSgq8MfHB9VKDYQbX20nzcDto89fEUeIoOLhmbD4J/stukzEeZcBV+5wT08Da740m
	CpxID1IwjI4rZlLV6WeSn8ZTfTAwkOCpwrCbQYMKCfbunKqikavlC5xz+fzmLBZu45+wAb/JzVh
	75gu6x1lvGzAdT3qzRXTl9XsVerY6w/a+kR9rRDhNuIy4xeLvGK6ltIv7LHdVHtPwiq2drPNFCl
	rDFCrDNQx7Yy9/vRb8A=
X-Google-Smtp-Source: AGHT+IH9a1FKrBN3wWlaNuwKbnc7SmqwwgKUv1BbHl2nQXJtIw5nLWAzBwdqnbFCmBJfMi6jc127yHWzB+hEpQgkJLs=
X-Received: by 2002:a17:90b:3510:b0:32c:2cd:4d67 with SMTP id
 98e67ed59e1d1-33bcf892b26mr17239614a91.13.1760934880715; Sun, 19 Oct 2025
 21:34:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251020042056.30283-1-luxu.kernel@bytedance.com>
In-Reply-To: <20251020042056.30283-1-luxu.kernel@bytedance.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Mon, 20 Oct 2025 12:34:29 +0800
X-Gm-Features: AS18NWCAyFau_n9LGvHEY6sx4LEsfPQSzxZhTugNhp11gJ7ivOgOscG6Z4MCNx8
Message-ID: <CAPYmKFs5ATB26ZWtP3vyT=zhJHrafgvBAm6GUw27AM7h5vE9Kw@mail.gmail.com>
Subject: Re: [PATCH v4 00/10] riscv: Add Zalasr ISA extension support
To: corbet@lwn.net, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, will@kernel.org, peterz@infradead.org, 
	boqun.feng@gmail.com, mark.rutland@arm.com, anup@brainfault.org, 
	atish.patra@linux.dev, pbonzini@redhat.com, shuah@kernel.org, 
	parri.andrea@gmail.com, ajones@ventanamicro.com, brs@rivosinc.com, 
	guoren@kernel.org
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	apw@canonical.com, joe@perches.com, lukas.bulwahn@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_213441_711849_6FFD18EA 
X-CRM114-Status: GOOD (  16.99  )
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

VGhpcyBzZXJpZXMgd2FzIGF1dG9tYXRpY2FsbHkgYmxvY2tlZCBieSBHbWFpbCBkdWUgdG8gdG9v
IG1hbnkKcmVjaXBpZW50cywgc28gSSByZXNlbnQgaXQgdHdpY2UsIGNhdXNpbmcgdGhlIGVtYWls
cyB0byBhcHBlYXIKZGlzY29udGludW91cy4gSSBhcG9sb2dpemUgZm9yIGFueSBpbmNvbnZlbmll
bmNlIHRoaXMgbWF5IGhhdmUgY2F1c2VkCnRvIHRoZSByZXZpZXdlci4KCkJlc3QgcmVnYXJkcywK
WHUgTHUKCk9uIE1vbiwgT2N0IDIwLCAyMDI1IGF0IDEyOjIx4oCvUE0gWHUgTHUgPGx1eHUua2Vy
bmVsQGJ5dGVkYW5jZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9y
IHRoZSBaYWxhc3IgSVNBIGV4dGVuc2lvbiwgd2hpY2ggc3VwcGxpZXMgdGhlCj4gcmVhbCBsb2Fk
IGFjcXVpcmUvc3RvcmUgcmVsZWFzZSBpbnN0cnVjdGlvbnMuCj4KPiBUaGUgc3BlY2lmaWNhdGlv
biBjYW4gYmUgZm91bmQgaGVyZToKPiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtemFs
YXNyL2Jsb2IvbWFpbi9jaGFwdGVyMi5hZG9jCj4KPiBUaGlzIHBhdGNoIHNlaXJlcyBoYXMgYmVl
biB0ZXN0ZWQgd2l0aCBsdHAgb24gUWVtdSB3aXRoIEJyZW5zYW4ncyB6YWxhc3IKPiBzdXBwb3J0
IHBhdGNoWzFdLgo+Cj4gU29tZSBmYWxzZSBwb3NpdGl2ZSBzcGFjaW5nIGVycm9yIGhhcHBlbnMg
ZHVyaW5nIHBhdGNoIGNoZWNraW5nLiBUaHVzIEkKPiBDQ2VkIG1haW50YWluZXJzIG9mIGNoZWNr
cGF0Y2gucGwgYXMgd2VsbC4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvQ0FH
UFNYd0pFZHRxVz1ueDcxb3VmWnA2NG5LNnRLPTByeXRWRWN6NEYtZ2Z2Q09YazJ3QG1haWwuZ21h
aWwuY29tLwo+Cj4gdjQ6Cj4gIC0gQXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBh
cmNoX2F0b21pYyBvcGVyYXRpb25zLiBUaGFua3MKPiAgdG8gQW5kcmVhLgo+Cj4gdjM6Cj4gIC0g
QXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBhcmNoX3hjaGcvYXJjaF9jbXB4Y2hn
IG9wZXJhdGlvbnMKPiAgc28gYXMgdG8gZW5zdXJlIEZFTkNFLlRTTyBvcmRlcmluZyBiZXR3ZWVu
IG9wZXJhdGlvbnMgd2hpY2ggcHJlY2VkZSB0aGUKPiAgVU5MT0NLK0xPQ0sgc2VxdWVuY2UgYW5k
IG9wZXJhdGlvbnMgd2hpY2ggZm9sbG93IHRoZSBzZXF1ZW5jZS4gVGhhbmtzCj4gIHRvIEFuZHJl
YS4KPiAgLSBTdXBwb3J0IGh3cHJvYmUgb2YgWmFsYXNyLgo+ICAtIEFsbG93IFphbGFzciBleHRl
bnNpb25zIGZvciBHdWVzdC9WTS4KPgo+IHYyOgo+ICAtIEFkanVzdCB0aGUgb3JkZXIgb2YgWmFs
YXNyIGFuZCBaYWxyc2MgaW4gZHQtYmluZGluZ3MuIFRoYW5rcyB0bwo+ICBDb25vci4KPgo+IFh1
IEx1ICgxMCk6Cj4gICByaXNjdjogQWRkIElTQSBleHRlbnNpb24gcGFyc2luZyBmb3IgWmFsYXNy
Cj4gICBkdC1iaW5kaW5nczogcmlzY3Y6IEFkZCBaYWxhc3IgSVNBIGV4dGVuc2lvbiBkZXNjcmlw
dGlvbgo+ICAgcmlzY3Y6IGh3cHJvYmU6IEV4cG9ydCBaYWxhc3IgZXh0ZW5zaW9uCj4gICByaXNj
djogSW50cm9kdWNlIFphbGFzciBpbnN0cnVjdGlvbnMKPiAgIHJpc2N2OiBBcHBseSBaYWxhc3Ig
dG8gc21wX2xvYWRfYWNxdWlyZS9zbXBfc3RvcmVfcmVsZWFzZQo+ICAgcmlzY3Y6IEFwcGx5IGFj
cXVpcmUvcmVsZWFzZSBzZW1hbnRpY3MgdG8gYXJjaF94Y2hnL2FyY2hfY21weGNoZwo+ICAgICBv
cGVyYXRpb25zCj4gICByaXNjdjogQXBwbHkgYWNxdWlyZS9yZWxlYXNlIHNlbWFudGljcyB0byBh
cmNoX2F0b21pYyBvcGVyYXRpb25zCj4gICByaXNjdjogUmVtb3ZlIGFyY2ggc3BlY2lmaWMgX19h
dG9taWNfYWNxdWlyZS9yZWxlYXNlX2ZlbmNlCj4gICBSSVNDLVY6IEtWTTogQWxsb3cgWmFsYXNy
IGV4dGVuc2lvbnMgZm9yIEd1ZXN0L1ZNCj4gICBSSVNDLVY6IEtWTTogc2VsZnRlc3RzOiBBZGQg
WmFsYXNyIGV4dGVuc2lvbnMgdG8gZ2V0LXJlZy1saXN0IHRlc3QKPgo+ICBEb2N1bWVudGF0aW9u
L2FyY2gvcmlzY3YvaHdwcm9iZS5yc3QgICAgICAgICAgfCAgIDUgKy0KPiAgLi4uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwgICA1ICsKPiAgYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9hdG9taWMuaCAgICAgICAgICAgICAgIHwgIDcwICsrKysrKysrLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2JhcnJpZXIuaCAgICAgICAgICAgICAgfCAgOTEgKysrKysrKysr
LS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jbXB4Y2hnLmggICAgICAgICAgICAgIHwgMTQ0
ICsrKysrKysrKy0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2ZlbmNlLmggICAg
ICAgICAgICAgICAgfCAgIDQgLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmggICAg
ICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2luc24tZGVmLmgg
ICAgICAgICAgICAgfCAgNzkgKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20vaHdwcm9iZS5oICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9h
c20va3ZtLmggICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0
dXJlLmMgICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zeXNfaHdw
cm9iZS5jICAgICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X29uZXJl
Zy5jICAgICAgICAgICAgICAgICAgfCAgIDIgKwo+ICAuLi4vc2VsZnRlc3RzL2t2bS9yaXNjdi9n
ZXQtcmVnLWxpc3QuYyAgICAgICAgfCAgIDQgKwo+ICAxNCBmaWxlcyBjaGFuZ2VkLCAzMTQgaW5z
ZXJ0aW9ucygrKSwgOTUgZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuMjAuMQo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
