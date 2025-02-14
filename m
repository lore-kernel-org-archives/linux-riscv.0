Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36941C02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bk7U/sCyYJ2VWaoeO5c80PK3ECJRLotfc7f2yJEsWY=; b=kTZYmHK8uxQSLZ
	lfsZl7QCVVBvXpupqKMel/iwVyXfLBJAFCWKbYQHQ3QNYZZeeznnqLTIqQtTicaOKKAAMYzA/zVuO
	SnO/5fNmFTQVizn/bP0Lv6chnLujQqWNuZ9GlcJi0nwy6fgQnzn6X8VedEv28/ByzURJA/8MG0xxa
	Hs/eTddZr52zdY/In7f9qC29RhklqQzks7Hg0WMVPdyup/IqZj47eY6wR5J/VrVt70x7Zgr/IByJH
	2CXm6WEty8FMLemodnNyZ0KvaAY1oaxMb1vIX4XZUGf7jR9yKMpeQTlguTIQzwS8AVK1AJMo3mPVL
	ya8+Ie4U3LNer5xe51mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tivcr-0000000EyuB-2Xwv;
	Fri, 14 Feb 2025 13:21:01 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tivGu-0000000Eu7z-0e8W
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 12:58:21 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so404670666b.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 04:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739537898; x=1740142698; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lP1hpU69owb/Nx1wGtyX3wACbVKop7EcqQ2GnZSjLNQ=;
        b=jMogU9aJ15TX/uMpqjORT6Pkb7WZ7u9ioX1VNWNnjWCsiGX34CoNTnujJCW2Uxp2Lk
         hlYhdT/urXjDDwJVPku7gwGjxXziYdjgZ+2VLy0EJw3IPzy3mrGxc0niJ8RDDAG0/9yY
         azefzVbIiaKmNYL1SYYZ24/fgoAXu4D6CriUW6q6ms1+tGGbmf/nA10swBhZPa4QzDFz
         1uRxrlW7bXNK9jcVNL7KksUFZBspbWuAgLUakBHGVWfA7mwkcTxzAa2QPtpbb5U4zdGI
         Nl7GdnkDjAZmiHPY5ufgbAEJQnS7q5NeKe5tblNW7UvZ4HaUnTRSVaQKkAMd580P30Z2
         YqMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739537898; x=1740142698;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lP1hpU69owb/Nx1wGtyX3wACbVKop7EcqQ2GnZSjLNQ=;
        b=bXKByvEZUjju4TuRVo1NH8uion0cQJKUjHiFaXu7TSFek3leuL+4K7J7op5GlrpEIT
         Zx5Hrd120EV0YE4kTVdLCgqi73XJwTnPVAwSUthDN4eXaf21NxcKlMmL9E5j/OgqMZGn
         UkTDqm2wrOq92X63rVHdWsxtPhOVV6V1QmBifIoSVKa9NhXmrktLdXnjHun9Koo2Vkx0
         GOT6NJwx2ch1geD1JEgAIhhmf6n8H8SgG6QWpVtnQJza8kBey9lkw3PmPTdQ0HfpDHky
         +66ySSXLex+zIf9o2M7n/i6M9EqrptYidL58iA35ldyKA5kqBfb22CxIFK5b2HHTzktH
         u8jA==
X-Forwarded-Encrypted: i=1; AJvYcCV8GKeL6ok6etYHJALzf1PfAovi611Cq3zFU0BAO2PayC8BTEIMpedU3V1f7ZyjKKxU70k8eKJucw1WTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3B7XOrsQgIeYlZTFbc5O2/k7I/HJc5+/IiGU/lrwrTROEX1U0
	FdUl/6pjVuP+kN5HdK8S2nWOOeBh/HRkrwy4nCgvrjNT5UrXkh3V
X-Gm-Gg: ASbGnctckAmBqSExH8Jpuq3tl+r2AENHpZHaBCqG4E0o24tOOVPGfatrezYjwwTPro3
	8Grj/nz0pRiyPXEgtD3nf6+vI3JSa3G+u9RR0R0fQefobV9I6j4ojUwCsck+vP/GrEZzjjfOl6p
	FZhGyYG+TDJqfNhJOlpnGQnJdjAxbY86FTytqCIcSKs7ayvVqPWNiY3GlWYItfxae9FVRNascsQ
	y10GNmyJbw0oCBsV/QZsOryrNEaS7N2q4q477fmUXaKURA6YpM6Nz/R0MeMLBdtUXludqnNKO89
	JgqZkhncrWAU+gUq/TBlI3hIHs4wljo9
X-Google-Smtp-Source: AGHT+IEM/giBHrNhE2apCFsLoOA7KVfIIVDAQlkLpgsqoRf+RI8nGhggXvQqe8I3LLSH6j7dYy8K3A==
X-Received: by 2002:a17:907:2ce5:b0:ab6:6018:df18 with SMTP id a640c23a62f3a-ab7f3325261mr1184848066b.6.1739537897901;
        Fri, 14 Feb 2025 04:58:17 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aadsm335251866b.88.2025.02.14.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 04:58:17 -0800 (PST)
Message-ID: <f6b036acada7686e1bfd814bd62782890bf35a50.camel@gmail.com>
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: AnnanLiu <annan.liu.xdu@outlook.com>, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, 	conor+dt@kernel.org, Inochi Amaoto
 <inochiama@gmail.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 14 Feb 2025 13:58:15 +0100
In-Reply-To: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_045820_190273_0C3B6BA8 
X-CRM114-Status: GOOD (  16.47  )
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

SGkgQW5uYW4sIElub2NoaSwKCk9uIFRodSwgMjAyNC0wMS0yNSBhdCAxNzo0NiArMDgwMCwgQW5u
YW5MaXUgd3JvdGU6Cj4gQWRkIHRoZSB3YXRjaGRvZyBkZXZpY2UgdHJlZSBub2RlIHRvIGN2MTgw
MCBTb0MuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5uYW5MaXUgPGFubmFuLmxpdS54ZHVAb3V0bG9v
ay5jb20+Cj4gLS0tCj4gVGhpcyBwYXRjaCBkZXBlbmRzIG9uIHRoZSBjbGsgZHJpdmVyIGFuZCBy
ZXNldCBkcml2ZXIuCj4gQ2xrIGRyaXZlciBsaW5rOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC9JQTFQUjIwTUI0OTUzOUNEQUQ5QTI2OENCRjZDQTE4NEJCQjlGQUBJQTFQUjIwTUI0OTUz
Lm5hbXByZDIwLnByb2Qub3V0bG9vay5jb20vCj4gUmVzZXQgZHJpdmVyIGxpbms6Cj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMTEzMDA1NTAzLjI0MjMtMS1qc3poYW5nQGtlcm5l
bC5vcmcvCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAtIENoYW5nZSB0aGUgbmFtZSBvZiB0aGUg
d2F0Y2hkb2cgZnJvbSB3YXRjaGRvZzAgdG8gd2F0Y2hkb2cuCj4gLSBDaGFuZ2UgdGhlIHN0YXR1
cyBvZiB3YXRjaGRvZy4KPiB2MSBsaW5rOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9E
TTZQUjIwTUIyMzE2MEI4NDk5Q0MyQkZEQUU2RkNBQ0RBQjlFQUBETTZQUjIwTUIyMzE2Lm5hbXBy
ZDIwLnByb2Qub3V0bG9vay5jb20vCj4gCj4gCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhn
by9jdjE4MDBiLW1pbGt2LWR1by5kdHMgfMKgIDQgKysrKwo+IMKgYXJjaC9yaXNjdi9ib290L2R0
cy9zb3BoZ28vY3YxODAwYi5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTYgKysrKysrKysrKysr
KysrKwo+IMKgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0cyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0cwo+IGluZGV4IDNh
ZjllMzRiM2JjNy4uNzU0NjkxNjFiZmZmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0cwo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvc29waGdvL2N2MTgwMGItbWlsa3YtZHVvLmR0cwo+IEBAIC0zNiwzICszNiw3IEBAICZvc2Mg
ewo+IMKgJnVhcnQwIHsKPiDCoAlzdGF0dXMgPSAib2theSI7Cj4gwqB9Owo+ICsKPiArJndhdGNo
ZG9nIHsKPiArCXN0YXR1cyA9ICJva2F5IjsKPiArfTsKCkl0IHdvdWxkIGJlIG5lY2Vzc2FyeSBp
biBhbGwgU29DcyB1bmxlc3MuLi4gWzFdCgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4
MDBiLmR0c2kKPiBpbmRleCBhZWM2NDAxYTQ2N2IuLjAzY2EzMmNkMzdiNiAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kKPiArKysgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9jdjE4MDBiLmR0c2kKPiBAQCAtMSw2ICsxLDcgQEAKPiDCoC8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4gwqAvKgo+IMKgICog
Q29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhhbmcgPGpzemhhbmdAa2VybmVsLm9yZz4KPiAr
ICogQ29weXJpZ2h0IChDKSAyMDI0IEFubmFuIExpdSA8YW5uYW4ubGl1LnhkdUBvdXRsb29rLmNv
bT4KPiDCoCAqLwo+IMKgCj4gwqAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRy
b2xsZXIvaXJxLmg+Cj4gQEAgLTEwMyw2ICsxMDQsMjEgQEAgdWFydDQ6IHNlcmlhbEA0MWMwMDAw
IHsKPiDCoAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gwqAJCX07Cj4gwqAKPiArCQl3YXRjaGRv
Zzogd2F0Y2hkb2dAMzAxMDAwMHsKPiArCQkJY29tcGF0aWJsZSA9ICJzbnBzLGR3LXdkdCI7Cj4g
KwkJCXJlZyA9IDwweDMwMTAwMDAgMHgxMDA+Owo+ICsJCQlpbnRlcnJ1cHRzID0gPDU4IElSUV9U
WVBFX0xFVkVMX0hJR0g+Owo+ICsJCQljbG9ja3MgPSA8JnBjbGs+OwoKJm9zYyA/Cgo+ICsJCQly
ZXNldHMgPSA8JnJzdCBSU1RfV0RUPjsKPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsKClsxXSAu
Li4gdGhlIHN0YXR1cyBoZXJlIGlzIGRyb3BwZWQuIFdoYXQgaXMgdGhlIHJlYXNvbiBmb3IgZGlz
YWJsaW5nIGl0IGluIHRoZSBmaXJzdCBwbGFjZT8KCj4gKwkJfTsKPiArCj4gKwkJcGNsazogcGNs
ayB7Cj4gKwkJCSNjbG9jay1jZWxscyA9IDwwPjsKPiArCQkJY29tcGF0aWJsZSA9ICJmaXhlZC1j
bG9jayI7Cj4gKwkJCWNsb2NrLWZyZXF1ZW5jeSA9IDwyNTAwMDAwMD47Cj4gKwkJfTsKPiArCj4g
wqAJCXBsaWM6IGludGVycnVwdC1jb250cm9sbGVyQDcwMDAwMDAwIHsKPiDCoAkJCWNvbXBhdGli
bGUgPSAic29waGdvLGN2MTgwMGItcGxpYyIsICJ0aGVhZCxjOTAwLXBsaWMiOwo+IMKgCQkJcmVn
ID0gPDB4NzAwMDAwMDAgMHg0MDAwMDAwPjsKCldoeSBkaWRuJ3QgaXQgZ28gaW50byBjdjE4eHgu
ZHRzaT8KCi0tIApBbGV4YW5kZXIgU3ZlcmRsaW4uCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
