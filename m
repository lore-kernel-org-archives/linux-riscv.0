Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75508606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RFTt2yoX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=gNK/4zmR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t0JHFIvfbGa7Q/O4bvwQgSlVWgp/9pK+Z70Ta/Gx04w=; b=RFTt2yoXAEJj5v9FkNXaT7k0B6
	0tNaBleI0rmjaKDNhMWbEIRNXU4nz4JUKH/L8THBVSbc5VpyBvacw8KUAnzzy2y4evDabhJbivdD/
	4pAeUqZ8Ft4WfA6dxrgz3Es8tFWjtj9hZ61qepI2CHyzyCdSpfumDYGmg1oZf9UTgRiopDvghI9rh
	VPzW2PzAxGMVPAM2Ugeeo7TPjWSRTNfn1mk8COj4So6nPUCvks+AguZiuo2heaL+ILAu5pkiKKmUB
	mGcizsFbw+B4yShkKohdSOuWzlBXjUnQxH/C/e5DKMcrWUe3soi4cyE+tUn68Rcx2twuXOfKqQSgL
	SG1F/Eig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrc5-00000001Uv3-17T0;
	Mon, 16 Nov 2026 07:58:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSrc2-00000001Ut0-1fXX
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 07:58:51 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso19959775e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 15 Nov 2026 23:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794815928; x=1795420728; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=gNK/4zmRT2q1aK0LSns8/fdKbUg4n807+pACXJH+HhISRyHkaSCuZx9i9aoPTfhxbd
         2Ta4idS2JZt5odxHqjSpYqBobsAA36WFID8U6CXQzNAEGoNotdF1Hf5POxKIsEQs+g7o
         O3evmDEPgNGGXXS34e9qNwOhwtjrW1j3/jZXEgXjUXq6hIBnYwtm+2NJjK3wgQZig6bz
         hTBWFFxH2TP6LXATPoEvT8T6difSsQtNeoKSnofhQKQIfSFqWxgu5TZKKra/+aKFSnjq
         QSEcrn/UX0C6ZTzZ8DJ08GJ5AwM6TPexAvfbcKroQxaVYWDJTROcQXmm4iJ3M8OnaTPU
         DblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794815928; x=1795420728;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RUWz3ZPMUxA6+r9kTNI2D7JNnedpd8n5diTIAYYVkok=;
        b=GcJypbfHWcUk6NR4cz7X4rLahvj8GjG3JjKEvSf8/nztwWpT6egOvnw3O5Ra69PTF7
         Mb8WPkHehHG2U1PL/XSEbIDQKXoT9lu/2SawQ6VyM9amvse5LwJSPntxjs0nebJQDMiA
         TT0yFciK2KkV3d0G2ai1NxY9o4B5F74dg96yVj2lUL3BMZY/UaiAo+po+GqwPNzOG8Bb
         SGloqxD4z46bmqk4uu6jn7QnDKXr5AXGeF/lYvxqMj/2jLPSYpuWI3W39xx1InxJZsSi
         g5t7PuI8osprmyToAi2Db7F+sNKiViM6i8UYsjwjwSGTuDkCunRf9bKKe+y9Vfk8w2FX
         1xYA==
X-Forwarded-Encrypted: i=1; AL+hErEGYNOT+1O26qqnHO2TqNk7Csr0+UvROAKoh2QwU7GZ/1VWDRJdJ4HtbbmmJnrMZtSnXUpyUNGIrViiqg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9tJ5cajv1I+FcQb0ue93E9GSoaCZKW3Q3N5fOpQQSoN6c/bEWJ
	lvP71ThANjFpxN6Qlq5Y1HA0ZG/NFgg853rqPNEQAacgiG4iTmWum5GBZotvGfkEP+mm
X-Gm-Gg: AYBFou3h7/n8PKjt8Cozev8cIYCSLPO0ukL2RRq+EHRK0JcpO5GwWSRSNMlmKBgl3Um
	oiJJpS5sk/PmUiIyU7H4x4x5xTzGlR12L6IzWIKUxh7EgR2rPf5LdTByw2TGVv9Ijt6YJlQBPlz
	cWwMSYXXYheLXYhjjOr3P6C97f31yEVC08UyXphiFwhnFtzaWomNRlyg29v3hrxluSvGV316yeb
	OiYk4sC8wa49nAapbRj1qf4dt6o1IHggYsEEMm7mgINycB1hjumLLm7OnZ+gT5MxPPaaGGNHcHq
	6eFEZ3X4+FAh/yOMTRUaWazBFvzsNRfN7Ts5MFbf5YnLnN57sa+ZgeKQX/ZlUbb7g2R4GFoY1cF
	iKie6LLePtHj+ReBWC0ELUrDJM5u6ReFwTNCpH3nqx0wBDC3GyOb+yJtBPnGOScuaRFvqMX2xIj
	cavRhZjLLkF++qCnsxQryUExnpwtJUzLThE4rjIE47dpLKyYW5gwmcOUvkeupaGKlbtp0SspiNv
	599WIzji09EbKdXGlTKwqltUdDOJLak6RFlMgLA2ijz+6yCEZu87cdFyWq1vFCVTpHzJVVW6Vb8
	Mbw+grQS3A/3ZFRYJwfVljWJQjh9c1H9dQrAmOS49nA1J6jq7cP3EzO2TfWi31w=
X-Received: by 2002:a05:600c:3b07:b0:4bb:5de1:e912 with SMTP id 5b1f17b1804b1-4bb5de1f216mr172834365e9.1.1794815928232;
        Sun, 15 Nov 2026 23:58:48 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e252f7fsm375768305e9.2.2026.11.15.23.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 23:58:47 -0800 (PST)
Message-ID: <aa32167cd3865049bfe0281b8b651c47f5e1c05d.camel@amutable.com>
Subject: Re: [PATCH RFC 2/4] sh/crash_dump: check ioremap() in
 copy_oldmem_page()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Breno Leitao
	 <leitao@debian.org>, Chris Mason <mason@kernel.org>, Thomas Gleixner
	 <tglx@kernel.org>, x86@kernel.org, kexec@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hildenbrand <david@kernel.org>, 
	stable@vger.kernel.org
Date: Mon, 16 Nov 2026 08:58:46 +0100
In-Reply-To: <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
References: <20261112-work-procfs-oldmem-v1-0-ecdcafd99265@kernel.org>
	 <20261112-work-procfs-oldmem-v1-2-ecdcafd99265@kernel.org>
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_235850_452921_9A4CF366 
X-CRM114-Status: GOOD (  13.04  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCAyMDI2LTExLTEyIGF0IDE3OjM3ICswMTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90
ZToKPiBjb3B5X29sZG1lbV9wYWdlKCkgbWFwcyBhIHBhZ2Ugb2YgdGhlIG9sZCBrZXJuZWwgd2l0
aCBpb3JlbWFwKCkgYW5kCj4gY29waWVzIGZyb20gaXQgd2l0aG91dCBjaGVja2luZyB3aGV0aGVy
IHRoZSBtYXBwaW5nIHdvcmtlZC4gSWYgaXQKPiBkaWRuJ3QsIHRoZSBjb3B5IHJlYWRzIGZyb20g
YW4gb2Zmc2V0IGludG8gdGhlIE5VTEwgcGFnZS4KPiAKPiBSZXR1cm4gLUVOT01FTSBsaWtlIHRo
ZSBvdGhlciBhcmNoaXRlY3R1cmVzIGRvLiByZWFkX2Zyb21fb2xkbWVtKCkKPiB0dXJucwo+IHRo
YXQgaW50byAtRUZBVUxUIGxpa2UgYW55IG90aGVyIHNob3J0IGNvcHkuCj4gCj4gRml4ZXM6IDRk
NWFkZTViMjljNiAoInNoOiBrZHVtcCBzdXBwb3J0LiIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5l
bC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gQnJhdW5lciAoQW11dGFibGUpIDxicmF1
bmVyQGtlcm5lbC5vcmc+CgpSZXZpZXdlZC1ieTogQWxleGFuZGVyIE1pa2hhbGl0c3luIDxhbGV4
QGFtdXRhYmxlLmNvbT4KCj4gLS0tCj4gwqBhcmNoL3NoL2tlcm5lbC9jcmFzaF9kdW1wLmMgfCAz
ICsrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9hcmNoL3NoL2tlcm5lbC9jcmFzaF9kdW1wLmMKPiBiL2FyY2gvc2gva2VybmVsL2NyYXNoX2R1
bXAuYwo+IGluZGV4IDE5Y2U2YTk1MGFhY2EuLjg1YzBlNThmMWE1OWYgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9zaC9rZXJuZWwvY3Jhc2hfZHVtcC5jCj4gKysrIGIvYXJjaC9zaC9rZXJuZWwvY3Jhc2hf
ZHVtcC5jCj4gQEAgLTIwLDYgKzIwLDkgQEAgc3NpemVfdCBjb3B5X29sZG1lbV9wYWdlKHN0cnVj
dCBpb3ZfaXRlciAqaXRlciwKPiB1bnNpZ25lZCBsb25nIHBmbiwKPiDCoAkJcmV0dXJuIDA7Cj4g
wqAKPiDCoAl2YWRkciA9IGlvcmVtYXAocGZuIDw8IFBBR0VfU0hJRlQsIFBBR0VfU0laRSk7Cj4g
KwlpZiAoIXZhZGRyKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiDCoAljc2l6ZSA9IGNvcHlf
dG9faXRlcih2YWRkciArIG9mZnNldCwgY3NpemUsIGl0ZXIpOwo+IMKgCWlvdW5tYXAodmFkZHIp
Owo+IMKgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
