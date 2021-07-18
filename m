Return-Path: <SRS0=1tpi=MK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BDE9C636C8
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 21:55:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41FB61073
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jul 2021 21:55:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41FB61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2w34ngqFcrvKRDe6ciGqDknqTxIlEptfWv6kXSXKkZQ=; b=DTkmpc5hkDCIyU
	xNANJHKn/+csvevrSCPiJd4005k6oZiTc1h+sJh9Wl3LFKbgv11rj12jpEX215VxXMAuXEFUAhcmL
	f1JG2sxJcRizYzQjdGREQzmFt1wGd3p0fpCbYK28WUhwuDVkZcixq0xRlS3cKzC6zzGLzY130+A/6
	7d4POMOKvc2P4bNVLEp5Sl53SoZaydabblKyoLnPdVH4onPoh4gPAqJSjCMY+n3SxXSLVti8RN4HB
	e49xy7YBvrPDsua7M2wYfOATWSWM9oWb82W2WjyyKd2PHvcVZxar3VhnngavHEohKwPR+fyOplXri
	OXTeSQ3Jd+D1g3XIrtIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5EkH-0083yu-6l; Sun, 18 Jul 2021 21:54:45 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5EkE-0083xe-DH
 for linux-riscv@lists.infradead.org; Sun, 18 Jul 2021 21:54:44 +0000
Received: by mail-yb1-xb34.google.com with SMTP id c16so17876836ybl.9
 for <linux-riscv@lists.infradead.org>; Sun, 18 Jul 2021 14:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9j1NWnlbjiSB+YS5FOue9N8gotu/EDm4p2Vpx7w+TB0=;
 b=JdBncGJcVy1N7d6pyHtdLvzJFtv/elzIMW9Ke0j/aQQbVu4ob/Rk+4/oZOKI8I95mX
 GUkkTJNDEm5+njVW9GQBOnN/Lx5d/cqYM8zILEj0ZGeDvQdRxez2Hl2TkToP++M2jOkV
 ZQ5NdKJNoJ1eStj49EI3coroBtFXjNlKYOfjAV7iPeJwCnirxjMY+1x8i8YRbaKyJ3p8
 GuV1cDPRbEJpBILS9Uez9X+htfGKzG5xfRPVuJdl+flhTyc0ytMYna6CJoCmaG4SFolM
 5u/Lrk4tN/pVJliV4Xxhf9MJG/trbQgwmI7L3R8sqaPLsW7c8pAjr94Wi3gITHdsViZu
 cuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9j1NWnlbjiSB+YS5FOue9N8gotu/EDm4p2Vpx7w+TB0=;
 b=srg3fDgt/xXqd8p3zxallmuF5To5uGpUCG5+oPFQ8sz9F8gYxAmt+JS9ebFllFqvRr
 yPnCeDnZbz1mnmSpA0qvhqECQAPpPcVF+1VPqkPwLRIO43UFdNZx098J3+dkZdgDf5eT
 Hm4xT6qawaow/fUO4/p1LmMIbHua600kNYoONnq7PqGfOsy1tdvKYL3fMA//dv3F5qGr
 qz7A/LPK4bSctpNGPmmG/fwjGfRtFHK38tROKXrb8mpBgOqu8EwC77KwDp3URdde22q8
 y4RpDNf9RdyouZx+Xi+UiFuAV0QwPsp+p0celI+A5mTTksJM5Gcrns4iU8mrUhru1WtJ
 iwWg==
X-Gm-Message-State: AOAM533LgcKy7dJ5TL1+k1JywnnWIb71SNzhQdXx1+rLqw5nc5ttJRxr
 THMo5QcvsQTebees7HGYQNxMjEoaYrbX24MjZ0A=
X-Google-Smtp-Source: ABdhPJxi9hEYY1Rma5JOio9CxD2CjVJXBqV9KgzBDkgfXMP6dHpl4SMScCNq367PiaagDX0X3Xso89Tdw96kXOCK7TQ=
X-Received: by 2002:a25:bd09:: with SMTP id f9mr27126985ybk.27.1626645280871; 
 Sun, 18 Jul 2021 14:54:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210718065039.15627-1-msuchanek@suse.de>
 <c621c6c6-ad2d-5ce0-3f8c-014daf7cad64@iogearbox.net>
 <20210718193655.GP24916@kitsune.suse.cz>
In-Reply-To: <20210718193655.GP24916@kitsune.suse.cz>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Sun, 18 Jul 2021 14:54:29 -0700
Message-ID: <CAEf4Bza4Fd4vnJLHYKN_VE3=hcLSnxUN-YMN4iv=B5h+y+wCdg@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Remove from kernel tree.
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: Daniel Borkmann <daniel@iogearbox.net>, bpf <bpf@vger.kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <kafai@fb.com>, 
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
 Magnus Karlsson <magnus.karlsson@intel.com>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>,
 open list <linux-kernel@vger.kernel.org>, 
 Networking <netdev@vger.kernel.org>, linux-riscv@lists.infradead.org, 
 clang-built-linux <clang-built-linux@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_145442_515994_660B0B36 
X-CRM114-Status: GOOD (  23.29  )
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

T24gU3VuLCBKdWwgMTgsIDIwMjEgYXQgMTI6MzYgUE0gTWljaGFsIFN1Y2jDoW5layA8bXN1Y2hh
bmVrQHN1c2UuZGU+IHdyb3RlOgo+Cj4gT24gU3VuLCBKdWwgMTgsIDIwMjEgYXQgMDk6MDQ6MTZQ
TSArMDIwMCwgRGFuaWVsIEJvcmttYW5uIHdyb3RlOgo+ID4gT24gNy8xOC8yMSA4OjUwIEFNLCBN
aWNoYWwgU3VjaGFuZWsgd3JvdGU6Cj4gPiA+IGxpYmJwZiBzaGlwcGVkIGJ5IHRoZSBrZXJuZWwg
aXMgb3V0ZGF0ZWQgYW5kIGhhcyBwcm9ibGVtcy4gUmVtb3ZlIGl0Lgo+ID4gPgo+ID4gPiBDdXJy
ZW50IHZlcnNpb24gb2YgbGliYnBmIGlzIGF2YWlsYWJsZSBhdAo+ID4gPgo+ID4gPiBodHRwczov
L2dpdGh1Yi5jb20vbGliYnBmL2xpYmJwZgoKVGhpcyBwYXRjaCBtYWRlIG1lIGRheSA6KSBsaWJi
cGYgc291cmNlcyBpbiB0aGUga2VybmVsIHRyZWUgaXMgKnRoZQpzb3VyY2UqIG9mIGxpYmJwZi4g
UXVvdGluZyBEZXRhaWxzIHNlY3Rpb24gKFswXSkgb2YgbGliYnBmIFJFQURNRToKCiAgRGV0YWls
cwoKICBUaGlzIGlzIGEgbWlycm9yIG9mIGJwZi1uZXh0IExpbnV4IHNvdXJjZSB0cmVlJ3MgdG9v
bHMvbGliL2JwZgpkaXJlY3RvcnkgcGx1cyBpdHMgc3VwcG9ydGluZyBoZWFkZXIgZmlsZXMuCgog
IEFsbCB0aGUgZ29yeSBkZXRhaWxzIG9mIHN5bmNpbmcgY2FuIGJlIGZvdW5kIGluIHNjcmlwdHMv
c3luYy1rZXJuZWwuc2ggc2NyaXB0LgoKICBTb21lIGhlYWRlciBmaWxlcyBpbiB0aGlzIHJlcG8g
KGluY2x1ZGUvbGludXgvKi5oKSBhcmUgcmVkdWNlZAp2ZXJzaW9ucyBvZiB0aGVpciBjb3VudGVy
cGFydCBmaWxlcyBhdCBicGYtbmV4dCdzCnRvb2xzL2luY2x1ZGUvbGludXgvKi5oIHRvIG1ha2Ug
Y29tcGlsYXRpb24gc3VjY2Vzc2Z1bC4KCj4gPiA+Cj4gPiA+IExpbms6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2JwZi9iMDcwMTVlYmQ3YmJhZGIwNmE5NWE1MTA1ZDlmNmI0ZWQ1ODE3YjJmLmNh
bWVsQGRlYmlhbi5vcmcvCj4gPiA+IFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBTdWNoYW5layA8bXN1
Y2hhbmVrQHN1c2UuZGU+Cj4gPgo+ID4gTkFLLCBJJ20gbm90IGFwcGx5aW5nIGFueSBvZiB0aGlz
LiBJZiB0aGVyZSBhcmUgaXNzdWVzLCB0aGVuIGZpeCB0aGVtLiBJZgo+Cj4gVGhleSBhcmUgZml4
ZWQgaW4gdGhlIGdpdGh1YiB2ZXJzaW9uLgo+Cj4gPiB5b3Ugd291bGQgaGF2ZSBjaGVja2VkIHRv
b2xzL2xpYi9icGYvIGdpdCBoaXN0b3J5LCB5b3Ugd291bGQgaGF2ZSBmb3VuZAo+ID4gdGhhdCBs
aWJicGYgaXMgdW5kZXIgYWN0aXZlIGRldmVsb3BtZW50IGluIHRoZSB1cHN0cmVhbSBrZXJuZWwg
dHJlZSBhbmQKPgo+IFNvIGlzIHRoZSBnaXRodWIgdmVyc2lvbi4KClNlZSBhYm92ZSwgR2l0aHVi
IGlzIGEgcHJvamVjdGlvbiBvZiB0aGUga2VybmVsIHNvdXJjZXMuIFllcywgTWFrZWZpbGUKaGVy
ZSBhbmQgb24gR2l0aHViIGFyZSBkaWZmZXJlbnQsIGJ1dCB0aGF0J3MgYnkgbmVjZXNzaXR5LiBX
ZSBkbyBhc2sKYWxsIGRpc3Ryb3MgdG8gcGFja2FnZSBsaWJicGYgZnJvbSB0aGUgR2l0aHViIHZl
cnNpb24sIGJ1dCB0aGVyZSBhcmUKa2VybmVsIHByb2plY3RzIChicGZ0b29sLCBwZXJmLCBzZWxm
dGVzdHMpIHVzaW5nIGxpYmJwZiBmcm9tIHRoZQprZXJuZWwgc291cmNlcyB0aGVtc2VsdmVzLgoK
Pgo+ID4geW91IGNvdWxkIGhhdmUgc3BhcmVkIHlvdXJzZWxmIHRoaXMgcGF0Y2guCj4KPiBZb3Ug
Y291bGQgaGF2ZSBzcGFyZWQgbWUgYSBsb3Qgb2YgcHJvYmxlbXMgaWYgdGhlcmUgd2FzIG9ubHkg
b25lIHNvdXJjZQo+IGZvciBsaWJicGYuCj4KPiBDYW4ndCB5b3UgQlBGIHBlb3BsZSBhZ3JlZSBv
biBvbmUgcGxhY2UgdG8gZGV2ZWxvcCB0aGUgbGlicmFyeT8KCldlIGNhbi4gV2UgZGlkLiBXZSBl
dmVuIHdyb3RlIHRoYXQgZG93bi4gQW5kIHdlIGRvIGRldmVsb3AgbGliYnBmIGluCm9uZSBwbGFj
ZSwgaGVyZS4gR2l0aHViIHJlcG8gb25seSBhY2NlcHRzIFBScyBmb3IgR2l0aHViIE1ha2VmaWxl
IGFuZAp2YXJpb3VzIHBhcnRzIG9mIENJIHByb2Nlc3Mgd2hpY2ggaXMgR2l0aHViLXNwZWNpZmlj
LgoKPgo+IFRoYW5rcwo+Cj4gTWljaGFsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
