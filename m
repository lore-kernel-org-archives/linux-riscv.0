Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894D4EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 00:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqI4qeDC7zH6wfz+4pxCExzUVQEV0dA5Cd2WLPMY5EY=; b=esIJIoeJ2XsGmm
	pMfwReZYb77yccIumIwZD6d3v8SQLKs1raeo5fyoIimUxrVYvS6akID/SNU+7yJ2Ar9W0qMVdDYDQ
	X6RGH1BRBIas39odQEBnvR+xlMtJgpKybuMbmmXtfemEy4TpOFJUoa8VoJpxMMlmBNn8fx77XiIGT
	wMXMtU3r8393en/0VdaWxUttHTHhBBUq3zeLqtU//P5wFmKMUtfjf1ZsQLO2BAGdyfqGyESRoCbY4
	KCtwblM1HaPzz2fcY6JrnQkTZUvQfwqpLMT03OzIdOtpPYfEylvDX7XuGIcZs95s45I2od071v9xV
	NCZKs9HJBxAfylD52TVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJjl7-001XJs-13;
	Thu, 13 Jul 2023 00:00:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJjl5-001XJR-15
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 00:00:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49353619A6
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 00:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4186C433C7
	for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 00:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689206433;
	bh=m45Eh51GK33EfykT/kNO3/YeUg+Yoa9HKS4dDxqE0rk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CCaEzlcjriTjavqYQVOTOB6EsstWPysLatVaXgEL/u5HGSogUw2l7BywOrVgxasUI
	 Jz92tvE079LpxJP+x2YRaFchKVUX+vyfUW2rWfKvYKRk7yoW/LZvrRIbunivAiO4Vg
	 WtRbuB6dUOY5pSnmLd+orHKzSHWViRoMAn0SppLvy6WXmmsKI5eylBB/uD9hUUuHxe
	 ZCWbRIP1f99l2Qz+FtFWwPZUy/uqRoNqavUvk749Hk9KjawIkCnIUtdktfAuce72cl
	 Dq4XWbFuKL2QTOgdb6inPxdQehwjR+ZaIXDXmypwkwQBE6sr2GUhk0v7yTIXtHIHHb
	 GIpAqJTZIRfZg==
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3128fcd58f3so224344f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 17:00:33 -0700 (PDT)
X-Gm-Message-State: ABy/qLZjA413xSzGbhPHdX9W5rSzOXD1KGIbui4QjJlARTk4vXT3eaLo
	B82pylWRgNZLrrDJQnv2egpVsindULf060kUH5c=
X-Google-Smtp-Source: APBJJlEwQerlQY1yjKz9UoeRLB1mSvniYAH+OyMJVU01a2VyNNFlAgaIbAe+pLUu7MhF6S5iwoGh+G44SA+ZwPAxHqU=
X-Received: by 2002:adf:f44d:0:b0:30a:ec3b:58d8 with SMTP id
 f13-20020adff44d000000b0030aec3b58d8mr21784626wrp.3.1689206431973; Wed, 12
 Jul 2023 17:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230711062202.3542367-1-CoelacanthusHex@gmail.com>
In-Reply-To: <20230711062202.3542367-1-CoelacanthusHex@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 12 Jul 2023 20:00:20 -0400
X-Gmail-Original-Message-ID: <CAJF2gTRgXbEfQWiWtZtVNBDhpY2miG_ByHrVZF2fbfu60hCHcQ@mail.gmail.com>
Message-ID: <CAJF2gTRgXbEfQWiWtZtVNBDhpY2miG_ByHrVZF2fbfu60hCHcQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: entry: set a0 prior to syscall_handler
To: Celeste Liu <coelacanthushex@gmail.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>, 
	Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_170035_486794_857FC414 
X-CRM114-Status: GOOD (  20.36  )
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

T24gVHVlLCBKdWwgMTEsIDIwMjMgYXQgMjoyMuKAr0FNIENlbGVzdGUgTGl1IDxjb2VsYWNhbnRo
dXNoZXhAZ21haWwuY29tPiB3cm90ZToKPgo+IFdoZW4gd2UgdGVzdCBzZWNjb21wIHdpdGggNi40
IGtlcm5lbCwgd2UgZm91bmQgZXJybm8gaGFzIHdyb25nIHZhbHVlLgo+IElmIHdlIGRlbnkgTkVU
TElOS19BVURJVCB3aXRoIEVBRk5PU1VQUE9SVCwgYWZ0ZXIgZjBiZGRmNTA1ODZkLCB3ZSB3aWxs
Cj4gZ2V0IEVOT1NZUy4gV2UgZ290IHNhbWUgcmVzdWx0IHdpdGggOWMyNTk4ZDQzNTEwICgicmlz
Y3Y6IGVudHJ5OiBTYXZlIGEwCj4gcHJpb3Igc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgp
IikuCj4KPiBDb21wYXJlZCB3aXRoIHg4NiBhbmQgbG9vbmdhcmNoJ3MgaW1wbGVtZW50YXRpb24g
b2YgdGhpcyBwYXJ0IG9mIHRoZQo+IGZ1bmN0aW9uLCB3ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0g
LUVOT1NZUyBzaG91bGQgYmUgYWR2YW5jZWQgYmVmb3JlCj4gc3lzY2FsbF9oYW5kbGVyIHRvIGZp
eCB0aGlzIHByb2JsZW0uIFdlIGhhdmUgd3JpdHRlbiB0aGUgZm9sbG93aW5nIHBhdGNoLAo+IHdo
aWNoIGNhbiBmaXggdGhpcyBwcm9ibGVtIGFmdGVyIHRlc3RpbmcuIEJ1dCB3ZSBkb24ndCBrbm93
IGVub3VnaCBhYm91dAo+IHRoaXMgcGFydCBvZiB0aGUgY29kZSB0byBleHBsYWluIHRoZSByb290
IGNhdXNlLiBIb3BlIHNvbWVvbmUgY2FuIGZpbmQKPiBhIHJlYXNvbmFibGUgZXhwbGFuYXRpb24u
IEFuZCB3ZSdkIGxpa2UgdG8gcmV3b3JkIHRoaXMgY29tbWl0IG1lc3NhZ2UKPiBhY2NvcmRpbmcg
dG8gdGhlIGV4cGxhbmF0aW9uIGluIHYyCj4KPiBGaXhlczogZjBiZGRmNTA1ODZkICgicmlzY3Y6
IGVudHJ5OiBDb252ZXJ0IHRvIGdlbmVyaWMgZW50cnkiKQo+IFJlcG9ydGVkLWJ5OiBGZWxpeCBZ
YW4gPGZlbGl4b25tYXJzQGFyY2hsaW51eC5vcmc+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBSdWl6aGUg
UGFuIDxjMTQxMDI4QGdtYWlsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBSdWl6aGUgUGFuIDxjMTQx
MDI4QGdtYWlsLmNvbT4KPiBDby1kZXZlbG9wZWQtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3Jj
LmlzY2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IFNoaXFpIFpoYW5nIDxzaGlxaUBpc3JjLmlz
Y2FzLmFjLmNuPgo+IFNpZ25lZC1vZmYtYnk6IENlbGVzdGUgTGl1IDxDb2VsYWNhbnRodXNIZXhA
Z21haWwuY29tPgo+IFRlc3RlZC1ieTogRmVsaXggWWFuIDxmZWxpeG9ubWFyc0BhcmNobGludXgu
b3JnPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jIHwgMyArLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4g
aW5kZXggZjkxMGRmY2NiZjVkMi4uY2NhZGI1ZmZkMDYzYyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwo+IEBA
IC0zMDEsNiArMzAxLDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9p
ZCBkb190cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4KPiAgICAgICAgICAgICAg
ICAgcmVncy0+ZXBjICs9IDQ7Cj4gICAgICAgICAgICAgICAgIHJlZ3MtPm9yaWdfYTAgPSByZWdz
LT5hMDsKPiArICAgICAgICAgICAgICAgcmVncy0+YTAgPSAtRU5PU1lTOwpPaCwgbm8uIFlvdSBk
ZXN0cm95ZWQgdGhlIGEwIGZvciBzeXNjYWxsX2hhbmRsZXIsIHJpZ2h0PyBJdCdzIG5vdApyZWFz
b25hYmxlLiBMZXQncyBzZWUgd2hpY2ggc3lzY2FsbF9oYW5kbGVyIG5lZWRzIGEwPS1FTk9TWVMu
CgpDb3VsZCB5b3UgZ2l2ZSBvdXQgbW9yZSBkZXRhaWwgb24geW91ciB0ZXN0IGNhc2U/Cgo+Cj4g
ICAgICAgICAgICAgICAgIHJpc2N2X3ZfdnN0YXRlX2Rpc2NhcmQocmVncyk7Cj4KPiBAQCAtMzA4
LDggKzMwOSw2IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9f
dHJhcF9lY2FsbF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Cj4gICAgICAgICAgICAgICAgIGlm
IChzeXNjYWxsIDwgTlJfc3lzY2FsbHMpCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3lzY2Fs
bF9oYW5kbGVyKHJlZ3MsIHN5c2NhbGwpOwo+IC0gICAgICAgICAgICAgICBlbHNlCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgcmVncy0+YTAgPSAtRU5PU1lTOwo+Cj4gICAgICAgICAgICAgICAg
IHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUocmVncyk7Cj4gICAgICAgICB9IGVsc2Ugewo+IC0t
Cj4gMi40MS4wCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
