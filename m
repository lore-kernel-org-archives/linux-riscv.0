Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC37C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77P97m8TAUlLW4V9Mb34ly1JfLyK1CLPqL8YfEIQvz4=; b=rpVf1syl+GUyl1
	LmXHHftw4y5z0yfQSOSl95C3ODrNuLGNGZSutVerCXYgm4IJo5QJ0S8Yvzg2VOGGk0w/JX8mE7gMI
	BFd5otpWDIeogHF3+LcEaBQhVDDaNc72u7goZgyz1eUlDWpRZ9BtHKUTEvRYxlHfX4/uBmSmoatY0
	+Q5zSqb8I4OgIAD6+XG1X5bmiwFzWG0Pi0RvoQfOmrfBzKz05qFuGpSXcOorLGJvv8ZzIjSSFI7Dv
	SaO0IOLWLfzF5avzCJvMy3kskSdy1AXqXCNcu20r/57dV6PxaNCYgECqmH/KMZwP7UPqjRovMS5iK
	Jfii3kbuphJVbLf1ca4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetZd-00000001UY8-27Ii;
	Wed, 01 Jul 2026 11:57:49 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetZa-00000001UXT-3eBn
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 11:57:48 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-4955cd5da3dso220897b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 04:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782907065; cv=none;
        d=google.com; s=arc-20260327;
        b=QNgFWY1cqvQWmYAfPLL6rSMEpTGpNktJh2VUoiWL0Tlgmmug0mdTL4ctwhHr2itme4
         Qvgx8W4yj/m2ddr5pMUvt4Kv4yxCLOcS+4FhBPkBb5Zimb0AKMixrqLjo8ngNTQMwprF
         Jzs5aFHG4/3Y2S5BjR+GoMOHSVS1dt4SM85XpdlsUO2/4LRS274UgzV/8e+NVvdL+rm7
         ody90BgSU7I4v/uCZ/FFEGA7YcHdKE4GR90w3xZ7lFbPNCWzjflG13nCS1lEC1s645X1
         CBdHMO0Ds54JE8Ami7vWehJV3BLl0Oek56k3SyexmYqHEkxg2OPMcw/gbS/A36vin0EJ
         ITaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lqKxpCifHTwVLxyMY/FMijSWYZ0kJMALXZou2Lu6auM=;
        fh=DaEGdjpue36GLl5Tka7HlcKlx6UDsdWHRtJQJtgpTfQ=;
        b=Tjs4DpLQyCPA23/X0/23RQJT1KK7cHdqP9mqWGd4eVQ0UIyNCUA3s7QuGNmL/N5xCf
         kCsVxLBdRjAhWkG+fBlA35qWwpDVrrFceGCj47cJCTdewrwAkYdyOnJEGHZIpo7rUtWY
         63Jbrbehg0Rt5r2Fh8HEVr+7Cuhs4jwEFNRYIbrrQi1wLjifhrXu+uNx5KF2kKanZ44g
         uFZIFnsUPcFom5pkxBx6lz5x3e5oOruUlAh+g0zpZ8WzgzlhoiIC0eTM26s/pH/C65yp
         tv75t3ExP46PU1qNq3VUHG8IhnAXarJBApm0go3dgeF99hGG+Nx7oYdAfPGrYFNs28UK
         H/iw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1782907065; x=1783511865; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lqKxpCifHTwVLxyMY/FMijSWYZ0kJMALXZou2Lu6auM=;
        b=hF/LQP/TUdR+iLj8CJwsEamTRbjgr5/8j0Djce6LdFS/bBmETwT1AGyIDPiy1iekT0
         NpS8uMXsAmRP+6GG3H/EInB65W1hw9kSbObul0XQKYsgG8kNhG67v5afItZQn8+15N2b
         6S2m2ixC8X7Iu9xS/LY0NmrSl6WYfhC35I1QwbnlDWDBjzb4GNels8P2zEo/vykacVB5
         FyUhBpz5Tn6iXo3wRYUDEq1QBotxp0WmYsgT8lAuEypoltjJqw1/wtGp/VbpENj9ho7B
         8GjGOnMsiO5SdC+trztmW2ON1c+AN20ZKh8A34LBxuGwRQmqiOQpgSllpbRHeq/uSuVs
         OKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782907065; x=1783511865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lqKxpCifHTwVLxyMY/FMijSWYZ0kJMALXZou2Lu6auM=;
        b=jKpeDYw5RtBe1XR0sdN/C0S4U5k8jSE1wARWbnSusZ4ZnuXIbdtwspPA8S8PO9+AuZ
         /eo8nZ2ezOwWsz6IHReeZRi6iRD9DWctH6TSRwXVZYIrwtmxucZJXE2+rSJHcJfx25yW
         xH6lXcRerBf99JtzKLvBKF1klR3RuUCqqFPeZLYl2bWqSsPNhBCq/Dv6D1RnMSfkKk3B
         zFPS/Hz6bgKv4eQYj/e9/CgNl9PXVmTdelZJbyPMWrzkjndFWvvvwShSQ2o41BN2a8Lz
         HFFwr0am9Y9IFE8jzFyVXZEWtR5eGSQGn1ebtBK1GapsXzDl7GMZdZN5vKecCU/Xaks/
         1qJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/xZeAil/xgeARzppbWisaFu1434wv32qkBkQOkULd59rXzZQ0d10y0dONqgH60tHbQBJZRaFsyEit5/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRwVpGjx47gcGSGGXTAqUvEyUtbpo6maamSRiZiHVn3Nit2r52
	69//9xvxWjal9hQTcpswJuJf0fl6Bh8iwcvAFFlxovN0VhTHkHXCAc3QpXhrAtiYHr+aSfvxMr3
	9dZVDdvkd35QOQlBm7i5orVVvDiYinMAJDRLRjIhP3w==
X-Gm-Gg: AfdE7ckwLbtrjC2jgvHEIJ3I07tem65sXHeMCV6FooWWeHJbKaB/UMRwukB2zHGFwmy
	n0vz+IGsKdu9sPVxBOJmK0tcZrQPIBKe5lIoV6okYshQa/B8RgGxEEXZfFpF4Fm252BlSy4OBt3
	nkKTZrxjpE7/JGzWTYwkOrEjISloMuRyYM/uCLkPNoYklpxKxMsjoXunyr8q1xGXUWTqEXeEz9J
	r6jova013NOOtQEul5jRD+vCn1TECDJyUYw9W/mDYDHCQI2VJdYX8zSARyrTNzMddkZU9frrHw=
X-Received: by 2002:a05:6808:1389:b0:492:5bf0:d29f with SMTP id
 5614622812f47-4960f0d2101mr838181b6e.37.1782907065542; Wed, 01 Jul 2026
 04:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1782877663.git.cuiyunhui@bytedance.com> <7988df83f6341ea045ebd7294af2e8907dbd5ee7.1782877663.git.cuiyunhui@bytedance.com>
 <ea525a80-1e6f-4304-a371-3ec17d91ee96@app.fastmail.com>
In-Reply-To: <ea525a80-1e6f-4304-a371-3ec17d91ee96@app.fastmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 1 Jul 2026 19:57:33 +0800
X-Gm-Features: AVVi8Ce8Hvhgv036NZvyTtBZ5NMmFq-2bEMlGWh7WwSjecXpQvRJF8LZ_SFRCM4
Message-ID: <CAEEQ3wnDACZ08kk6ycpgXezgyS5zxi+P_vF_yBScK2sxU+UKaw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5 1/3] riscv: io: avoid null-pointer
 arithmetic in PIO helpers
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, pulehui@huawei.com, 
	puranjay@kernel.org, Thomas Huth <thuth@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Zong Li <zong.li@sifive.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Thomas Gleixner <tglx@kernel.org>, 
	Deepak Gupta <debug@rivosinc.com>, seanwascoding@gmail.com, 
	Andy Chiu <andybnac@gmail.com>, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, bpf@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, qingfang.deng@siflower.com.cn, 
	Linux-Arch <linux-arch@vger.kernel.org>, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_045746_919830_110967A8 
X-CRM114-Status: GOOD (  11.56  )
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

SGkgQXJuZCwKCk9uIFdlZCwgSnVsIDEsIDIwMjYgYXQgMjoyNeKAr1BNIEFybmQgQmVyZ21hbm4g
PGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMSwgMjAyNiwgYXQgMDY6MjAs
IFl1bmh1aSBDdWkgd3JvdGU6Cj4gPiBAQCAtNTYsNiArNTYsOCBAQAo+ID4gICNkZWZpbmUgX19p
b19wYncoKSAgIFJJU0NWX0ZFTkNFKGlvdywgbykKPiA+ICAjZGVmaW5lIF9faW9fcGF3KCkgICBS
SVNDVl9GRU5DRShvLCBpbykKPiA+Cj4gPiArI2RlZmluZSBQQ0lfSU9fQUREUihhZGRyKSAgICAo
KHZvaWQgX19pb21lbSAqKSgodW5zaWduZWQgbG9uZylQQ0lfSU9CQVNFCj4gPiArIChhZGRyKSkp
Cj4KPiBUaGlzIGRvZXMgbm90IHNlZW0gdG8gaGF2ZSBhbnkgcHVycG9zZSwgaXMgdGhpcyBqdXN0
IGxlZnQgb3Zlcgo+IGZyb20gdGhlIHByZXZpb3VzIHZlcnNpb24/Cj4KPiA+Cj4gPiArI2lmZGVm
IENPTkZJR19IQVNfSU9QT1JUCj4gPiAgX19pb19yZWFkc19pbnMoaW5zLCAgdTgsIGIsIF9faW9f
cGJyKCksIF9faW9fcGFyKGFkZHIpKQo+ID4gIF9faW9fcmVhZHNfaW5zKGlucywgdTE2LCB3LCBf
X2lvX3BicigpLCBfX2lvX3BhcihhZGRyKSkKPiA+ICBfX2lvX3JlYWRzX2lucyhpbnMsIHUzMiwg
bCwgX19pb19wYnIoKSwgX19pb19wYXIoYWRkcikpCj4gPiAtI2RlZmluZSBpbnNiKGFkZHIsIGJ1
ZmZlciwgY291bnQpIF9faW5zYihQQ0lfSU9CQVNFICsgKGFkZHIpLCBidWZmZXIsIGNvdW50KQo+
ID4gLSNkZWZpbmUgaW5zdyhhZGRyLCBidWZmZXIsIGNvdW50KSBfX2luc3coUENJX0lPQkFTRSAr
IChhZGRyKSwgYnVmZmVyLCBjb3VudCkKPiA+IC0jZGVmaW5lIGluc2woYWRkciwgYnVmZmVyLCBj
b3VudCkgX19pbnNsKFBDSV9JT0JBU0UgKyAoYWRkciksIGJ1ZmZlciwgY291bnQpCj4gPiArI2Rl
ZmluZSBpbnNiKGFkZHIsIGJ1ZmZlciwgY291bnQpIF9faW5zYihQQ0lfSU9fQUREUihhZGRyKSwg
YnVmZmVyLCBjb3VudCkKPiA+ICsjZGVmaW5lIGluc3coYWRkciwgYnVmZmVyLCBjb3VudCkgX19p
bnN3KFBDSV9JT19BRERSKGFkZHIpLCBidWZmZXIsIGNvdW50KQo+ID4gKyNkZWZpbmUgaW5zbChh
ZGRyLCBidWZmZXIsIGNvdW50KSBfX2luc2woUENJX0lPX0FERFIoYWRkciksIGJ1ZmZlciwgY291
bnQpCj4gPiArI2VuZGlmCj4KPiBBcyBmYXIgYXMgSSBjYW4gdGVsbCwganVzdCBhZGRpbmcgdGhl
ICNpZmRlZiBoZXJlIHNob3VsZCBiZSBzdWZmaWNpZW50LgoKT2theS4KCj4KPiAgICAgICBBcm5k
CgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
