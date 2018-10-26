Return-Path: <SRS0=LGYn=NG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1073CC6786E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 16:13:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DCD2085B
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 26 Oct 2018 16:13:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sr4FqiIq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNKynyyU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0DCD2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cixu8MaaqrRIqgkCvojzP4rdYtgazVhdF/JHWFE2UCQ=; b=sr4FqiIq69Modn
	G1Jd+Ub/DY3Kta6AFh5F7PUutcGtifwPyBce7XxodqmJvsgcypK2jvXqsqZImeRkUOTrQPP0O++3j
	PribzK0ZSonCAdlFrKCLyPbsXLN6zBLbIVv7WYhRIq9SPN/j+2q7u0ZzAUFF20ojkguuw2wX5l5Hw
	BbCsVnq7u7uwU1A0z/l62AFlwloAenITODfbuufNj1f6ptlZQZOGwycqjBQQuOFluBv0KtIAVufG9
	6kys9gA5LKDukfP21++0lVSvsL0YunW0vYiVuBDiFZQg8p6vz3X8W3Asghy/H6+jdqFD1uaHpbJxz
	UTU+EHbr/lDj1PzOxZbg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gG4js-0005Fy-LV; Fri, 26 Oct 2018 16:13:32 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gG4jp-0005F4-Kl
 for linux-riscv@lists.infradead.org; Fri, 26 Oct 2018 16:13:31 +0000
Received: by mail-it1-x143.google.com with SMTP id h14-v6so2336124itf.1
 for <linux-riscv@lists.infradead.org>; Fri, 26 Oct 2018 09:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3ja46AWjXIK62bQzh6UCmxmW1cJyitbx1J65EKWW5tQ=;
 b=NNKynyyUtBAVEz1kfaLDU2PV78uMU8Vllu5epRwRbYLeqmYENWqoErjaDcBY5aJyWT
 kqJQecDII8l+tE+XXNQQvKeQeuN5BlF/M+uXfgV2gS7iuQVm7I94b7cbPnuUli57K24z
 YpEzRoZe1hGUAHytvulHWotWESUozrjaUZbhVWHltS8lX8nIvog/NoEt985Ns+85sVqp
 a4qi4adtrOZOxjutP9Uda6W1ElWMSEFKa5/m11hD1zxmutWjK3RlK9xD19TPEoYO11OV
 sPJfPu7CJOhORNe4NbfcyLx3D6+cKEUYTS+Cnzcy7IwzwPKwjrZcoEb9+wkWKGAlpuKj
 i0Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3ja46AWjXIK62bQzh6UCmxmW1cJyitbx1J65EKWW5tQ=;
 b=jCJkgLdMqYVqVw7l7mQxeNtKOuj1kKOlpl8THswQxMxhInjGVlMZ4cvXrdVA8Wso3u
 vpwNVywKAdkoHKCx4l6CywaBpwrOBWJOfqLmPSCerSrcg7CclfpCUvm/LvTFD2V3json
 YfwaIwhCb9iDHg0g7fqMBK+HGUCxoumSw6o6fKw+T0atWQLpM1cS8jaVr6Uwy/MS+K/1
 8g8AODXRg68jUpFzsb/qRC95V+xK3is13hN3Tq5XKrHsZ4760Awyv4bffpUgbWUTCyH5
 W5tuGIRvfso3itwKIyCzKzbQJcP+SKOM1DqLce9NQfcj++nEZa3sDhEcY/bHq2jR/bST
 lBZw==
X-Gm-Message-State: AGRZ1gJ/x76W1oSgQItcv0T+41R9YOuxUDrI3lsUtk0QNzcygBX0xt2y
 8r0NlnZ3EOf0uR+KgKk3e9TOhaE1n/MjCLyRM1LY0M0H
X-Google-Smtp-Source: AJdET5fafXKwXZR/Yx4uwVHVYVBdWn3VqiLw0Z8v4Fn0VOor8N/SoVusbsy0dNyWFEt+7XMJoMb01UGRIgVnonTKlaA=
X-Received: by 2002:a24:4a8f:: with SMTP id
 k137-v6mr4100209itb.136.1540570397086; 
 Fri, 26 Oct 2018 09:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
 <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
 <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
 <CAHk-=wiHy+39PkEjUuQRJdOO7aNytYXeAGD-tZwOfOEj6ZhTKg@mail.gmail.com>
In-Reply-To: <CAHk-=wiHy+39PkEjUuQRJdOO7aNytYXeAGD-tZwOfOEj6ZhTKg@mail.gmail.com>
From: Zong Li <zongbox@gmail.com>
Date: Sat, 27 Oct 2018 00:13:05 +0800
Message-ID:
 <CA+ZOyagSZHXXy_ViTg7Po3qOVgUschzuvDXrhuiAkr-dg-svig@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
To: torvalds@linux-foundation.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181026_091329_707693_180348E1 
X-CRM114-Status: GOOD (  13.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: gregkh@linuxfoundation.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, paul.walmsley@sifive.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181026161305.BWfsagC_m33x7FD0OxB2WBO1NWQUwIHwKVE_zFpftxY@z>

TGludXMgVG9ydmFsZHMgPHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiDmlrwgMjAxOOW5
tDEw5pyIMjbml6Ug6YCx5LqUIOS4iuWNiDk6NTHlr6vpgZPvvJoKPgo+IE9uIDEwLzI1LzE4IDY6
MTIgUE0sIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+ID4KPiA+IEFsbW9zdCBhbHdheXMsIHRoZSA2
NC1iaXQgZGl2aWRlIHR1cm5zIG91dCB0byBiZSBlbnRpcmVseSBwb2ludGxlc3MsCj4gPiBhbmQg
dGhlIGNvZGUgY2FuIGJlIHdyaXR0ZW4gYXMgYSAobXVjaCBjaGVhcGVyKSA2NC1ieS0zMiBkaXZp
ZGUKPiA+IGluc3RlYWQgdXNpbmcgdGhlIGZ1bmN0aW9ucyBpbiA8YXNtL2Rpdi5oPiBpbnN0ZWFk
Lgo+Cj4gVGhlIG90aGVyIGNvbW1vbiBzaXR1YXRpb24gZm9yIHRoZSBrZXJuZWwgaXMgdGhhdCBz
b21ldGhpbmcgd2FzCj4gd3JpdHRlbiBhcyAieHl6IC8gYWJjIiwgd2hlbiBpdCB0dXJucyBvdXQg
dGhhdCBhYmMgaXMgcmVhbGx5IGp1c3QgYQo+IHBvd2VyLW9mLXR3by4KPgo+IFNvIGl0J3Mgbm90
IG5lY2Vzc2FyaWx5IGFsd2F5cyB0aGF0IHRoZSA2NC1iaXQgZGl2aWRlIGNhbiBiZQo+IHJlLXdy
aXR0ZW4gYXMgYSA2NC1ieS0zMiBkaXZpZGUsIHNvbWV0aW1lcyBpdCBjYW4gYmUgcmV3cml0dGVu
IGFzCj4gc2ltcGx5IGEgc2hpZnQuIFdoaWNoIGlzIGV2ZW4gY2hlYXBlci4KPgo+IFRoYXQncyB0
aGUgcmVhc29uIEkgdHJ5IHRvIGFjdGl2ZWx5IGRpc2NvdXJhZ2UgZnVsbCA2NC1ieS02NCBkaXZp
ZGVzLgo+IFdlIGhhdmUgaGFkIHNpdHVhdGlvbnMgd2hlcmUgcGVvcGxlIGVuZCB1cCB1c2luZyBh
IGRpdmlkZSB0aGF0IGNhbgo+IHRha2UgaHVuZHJlcyBvZiBjeWNsZXMsIHdoZXJlIGFsYXJtaW5n
bHkgb2Z0ZW4gaXQgY2FuIGJlIHJld3JpdHRlbiBhcwo+IG9uZSB0aGF0IHRha2VzIHRlbnMgb2Yg
Y3ljbGVzIG9yIGV2ZW4ganVzdCBfc2luZ2xlXyBjeWNsZXMuCj4KPiBQZW9wbGUgZG9uJ3Qgc29t
ZXRpbWVzIGFwcHJlY2lhdGUganVzdCBob3cgZXhwZW5zaXZlIDY0LWJ5LTY0IGRpdmlkZXMKPiBh
cmUgd2hlbiB5b3UgZG9uJ3QgaGF2ZSBkaXJlY3QgaGFyZHdhcmUgc3VwcG9ydCBmb3IgdGhlbSwg
YW5kIGhvdwo+IG9mdGVuIHRoZXJlIGFyZSBtdWNoIHNpbXBsZXIgYW5kIGZhc3RlciB3YXlzIHRv
IGF2b2lkIHRoZW0uCj4KCk91ciBkcml2ZXIgZ3V5cyBpbXBsZW1lbnQgdGhlIERNQSBkcml2ZXIg
d2hpY2ggaGFzIGEgZnVsbCA2NC1iaXQKZGl2aWRlIGluIGl0cyBpbml0aWFsaXphdGlvbiBmdW5j
dGlvbi4gSSBoYWQgY2hlY2tlZCB0aGUgY29kZSwgaXQKY291bGQgdXNlIHRoZSA2NC1ieS0zMiBk
aXZpZGVzIGluIGZhY3Qgb2YgdGhlIHNpdHVhdGlvbi4gSSB3YXMgbm90CmNvbnNjaW91cyBvZiB0
aGUgbWlzdGFrZSBhbmQgbmFpdmVseSB0aG91Z2h0IHRoYXQgdW1vZGRpMyBpcyB1c2VmdWwKZm9y
IHRoZSBvdGhlciBkcml2ZXJzIHdoaWNoIG5lZWQgdGhlIDY0LWJ5LTY0IGRpdmlkZS4gSSB3b3Vs
ZCBzdWJtaXQgYQpwYXRjaCB0byBnZXQgcmlkIG9mIHRoZXNlIHJvdXRpbmVzLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
