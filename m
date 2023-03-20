Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F901C7618D
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 14:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLr/k+tv3KRwL1ddV0GOYMuT9creAoUQKFbqSuepN8E=; b=pQinXvXqIXzTye
	KulaCEQhXG2iW7MPjfnjrBvqIjk/6ity0jNeTl/Rl0Zj3wDxaHrJxtlOi3SoFUJt1MDFLUzdt21Nq
	HVzkB4NgRk9Zd/92QVVh9PPkrQ8yOy/iuVIwpy34R1hwbY31HfwxPlRIEubWlDQDurxpGtOQVH97q
	ofNUhOohWU5+xjci115g20/JQoO5AFe0C8RHkQWUpOaWy1iZmLAiObxtRIXI1adkvSNl5TXxC0Rv1
	qnyJERuU0/sTCR6Z/KuY50KCs/TIGpHndMbawMjxoogGdpSzlqRJokF6xqaPCdsrqUR2jwu8gF+ZH
	uO6Z9Q0AbxqOOj+9MKsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGn5-009NIf-1g;
	Mon, 20 Mar 2023 14:47:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGn2-009NHK-1m
	for linux-riscv@lists.infradead.org;
	Mon, 20 Mar 2023 14:47:14 +0000
Received: by mail-lf1-x12d.google.com with SMTP id g17so15237433lfv.4
        for <linux-riscv@lists.infradead.org>; Mon, 20 Mar 2023 07:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1679323629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kc414cxHJJ4Rs2Usfe1VLFadO893WdMMNYN/EzyjUGE=;
        b=l8nxmBq097o2mhqhQ32r2xzlCnOSVT51U6HhjTroWn1KW8CwnaGjZToUmrbA3ygIiD
         wEbFFZq8rYty6ZsLpDzfxRfnMfOxLzlsFbNhCTVpOo7sqXGfIED+dFdczJIWXETCKyzy
         KsjhEi6gMhYqziNZMZM123Lf9S29yCT6P7r5uu5l/7Nzf2i+oKXEFIjCG3pE+npkznDb
         alvORS2ND+E9oxRPhsnKqT+bm1MuhsUdn4R1Ka38xB5HzJJwrd5mj8N8bt/02MJlJP8T
         2iUvU963YsF6T/0G43vWpqyv2jSUQj9EIaQLN1SQ7F610bkWhPqX3La127WVUJcs0yIP
         Qx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679323629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kc414cxHJJ4Rs2Usfe1VLFadO893WdMMNYN/EzyjUGE=;
        b=IbzDs4WHx0hybbMzwizrVmS2DYuKewsPYjp1A/xtUbNhFyKFsk7eCxdVdXHxnaylkJ
         w5cES3uta0RH03gkFbhZLD8K7+ruykdTle+REtpdUs53SD22FIeDJEGOsatLn4XDpjrq
         /muX5dlSWzMjppeAdi6MUDSXqlf4nomgcJbXgwrdSbrWU2ULyORa8Ob3GjFuQ4kaqqJV
         9x6RpO7ThxPRTZ6M51Tt3oG1IPxeBMYelJ/cp/pWvLot/evOvfWHs3//LNguW2yYjEG5
         Rj5YRAMAx2+5zRd39UhKREINe4ffxf5NPYknxR0S898eY5/48Sz5ORm0JpRyEBR9oGqY
         1owA==
X-Gm-Message-State: AO0yUKUtor2+ChpKLqiWn1t3Y4LDOjivVmBcLSwEMItYXIYqjUCGNKw+
	4BrEv9I7xrBorT5Yp6pFiMHXmmUglccCFNIu+NeXlQ==
X-Google-Smtp-Source: AK7set+DvUj3j8tjxdsk6XcnxH+SLGzT+Hu5S0QmM1Yr26jly9HIRPsvYCs6G1aS8U70PrI2cUHaBIhI7pFyTRhHrkw=
X-Received: by 2002:a05:6512:3084:b0:4e8:cfbf:d6f1 with SMTP id
 z4-20020a056512308400b004e8cfbfd6f1mr156529lfd.0.1679323629226; Mon, 20 Mar
 2023 07:47:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230317113538.10878-1-andy.chiu@sifive.com> <20230317113538.10878-9-andy.chiu@sifive.com>
 <456a8e61-c6b7-46d5-a25c-c466820912d7@spud>
In-Reply-To: <456a8e61-c6b7-46d5-a25c-c466820912d7@spud>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Mon, 20 Mar 2023 22:46:57 +0800
Message-ID: <CABgGipVf3eTc9pj58wMYQr7NBcic+-m3fECEttqvPcn9Zu3qJw@mail.gmail.com>
Subject: Re: [PATCH -next v15 08/19] riscv: Introduce struct/helpers to
 save/restore per-task Vector state
To: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Vincent Chen <vincent.chen@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_074712_648527_391FAFB9 
X-CRM114-Status: GOOD (  15.61  )
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

T24gTW9uLCBNYXIgMjAsIDIwMjMgYXQgOTowNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBNYXIgMTcsIDIwMjMgYXQgMTE6
MzU6MjdBTSArMDAwMCwgQW5keSBDaGl1IHdyb3RlOgo+ID4gRnJvbTogR3JlZW50aW1lIEh1IDxn
cmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+Cj4gPiBBZGQgdmVjdG9yIHN0YXRlIGNvbnRleHQg
c3RydWN0IHRvIGJlIGFkZGVkIGxhdGVyIGluIHRocmVhZF9zdHJ1Y3QuIEFuZAo+ID4gcHJlcGFy
ZSBsb3ctbGV2ZWwgaGVscGVyIGZ1bmN0aW9ucyB0byBzYXZlL3Jlc3RvcmUgdmVjdG9yIGNvbnRl
eHRzLgo+ID4KPiA+IFRoaXMgaW5jbHVkZSBWZWN0b3IgUmVnZmlsZSBhbmQgQ1NScyBob2xkaW5n
IGR5bmFtaWMgY29uZmlndXJhdGlvbiBzdGF0ZQo+ID4gKHZzdGFydCwgdmwsIHZ0eXBlLCB2Y3Ny
KS4gVGhlIFZlYyBSZWdpc3RlciB3aWR0aCBjb3VsZCBiZSBpbXBsZW1lbnRhdGlvbgo+ID4gZGVm
aW5lZCwgYnV0IHNhbWUgZm9yIGFsbCBwcm9jZXNzZXMsIHNvIHRoYXQgaXMgc2F2ZWQgc2VwYXJh
dGVseS4KPiA+Cj4gPiBUaGlzIGlzIG5vdCB5ZXQgd2lyZWQgaW50byBmaW5hbCB0aHJlYWRfc3Ry
dWN0IC0gd2lsbCBiZSBkb25lIHdoZW4KPiA+IF9fc3dpdGNoX3RvIGFjdHVhbGx5IHN0YXJ0cyBk
b2luZyB0aGlzIGluIGxhdGVyIHBhdGNoZXMuCj4gPgo+ID4gR2l2ZW4gdGhlIHZhcmlhYmxlIChh
bmQgcG90ZW50aWFsbHkgbGFyZ2UpIHNpemUgb2YgcmVnZmlsZSwgdGhleSBhcmUKPiA+IHNhdmVk
IGluIGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBtZW1vcnksIHBvaW50ZWQgdG8gYnkgZGF0YXAgcG9p
bnRlciBpbgo+ID4gX19yaXNjdl92X2V4dF9zdGF0ZS4KPiA+Cj4gPiBDby1kZXZlbG9wZWQtYnk6
IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFZpbmVldCBHdXB0YSA8dmluZWV0Z0ByaXZvc2luYy5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+Cj4gSSB0aGluayB5b3UgbWlzc2Vk
IGE6Cj4gQWNrZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+
Cj4KPiBUaGFua3MsCj4gQ29ub3IuCj4KClllcywgcmVtb3ZlZCBpdCBvbiBwdXJwb3NlIGJlY2F1
c2UgSSBjaGFuZ2VkIHNvbWUgaW5saW5lIGFzc2VtYmx5IGluCnRoaXMgc3VibWlzc2lvbi4gU28g
SSB0aGluayB5b3UgbWF5IHdhbnQgdG8gdGFrZSBhIGxvb2sgaW4gY2FzZSBJIGRpZApzb21ldGhp
bmcgc2lsbHkuCgpUaGFua3MsCkFuZHkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
