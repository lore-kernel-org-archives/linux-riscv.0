Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46B7C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 11:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BIG8uilLv1ASRyC9cXHBGtZ/22z4KLzHdBURoO4VxUo=; b=3s/kgUK9AUQbd0
	vri/YOsTWSztbPCOd7cchEDQa5wCxS5GlMjg7koPM0TgkbDv7gXkYs5s7EsASSU/D4fjigjSZOIuN
	seI9/hwK1QrA5dQKwB1V1Fmsh+aj9LTtfBXZX+5XXgzn9RS5QqgzlC5HErctM6JJu4oGQ+dV3zgGP
	F5SAe4waA1C50YrvyH8fV4qPCTKE+JtobesRQ6DW+LwdumTtqoy7BITEDXDSBjcSXv9AQkXwXhcMq
	xfxwiBBFmM5FhY+RZEz1qkzl0sLusNSB/HUsQw/c9T8wEttYlmv3WHzFOOlj3HUAcS83rQRASJwRo
	CKswlNXsQzSWkQGEMnmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5FD-001L5u-9N; Thu, 09 Feb 2023 11:37:39 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5FB-001L4d-1u
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 11:37:38 +0000
Received: by mail-lj1-x235.google.com with SMTP id y19so1704296ljq.7
        for <linux-riscv@lists.infradead.org>; Thu, 09 Feb 2023 03:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gN5dmIKNiTeuwb/3TvmDWzfH1BwGxtn7YPjkX4NxKgo=;
        b=N1a2K6KqYxkNBfNNdZk1zWrrpSnrtKQTdw0K8qC6sbrnuleoaTBhY2+YjebvTfU08k
         fGcKceMiyw8nnekShPLp7eG12Po4zvEdpy5kbGUrIDcuoagKRU3ryR9lOgm8oZcDExSr
         taeWcKcc2KBRiGXGft7vImb88wy18ZRCM6NiF2GPtObRj1kT8Hdvv/tbxmf7cJE5v7WA
         VTp7RBEF282iQqmiDm+TxgQ2Tks2UGGRwl03lM3ArpwZaJaDFkMQBb03blPqZvYoaQxS
         Jx6Wllzmmyo9q06fjyX4wReOZWzYEC0MeiHl/HhyjDtBMhQW6NC0sx46Gl0fFfcXuNqH
         /6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gN5dmIKNiTeuwb/3TvmDWzfH1BwGxtn7YPjkX4NxKgo=;
        b=t+QSBc6J7KSO9gD94pQ60zFBvvv9VSkjFEyCAETL2+/G3mT0gyLi30iWV9QZwmXV3K
         5w1vj0rYtVGqgCjIGy3pOoYVYE5ME6JcnpmVXTEq3nlUFsumGoMzzl7Hv/Kz2e+m2PLn
         gztAdx02YKuSU2aHBF4Kbu8fz3uuiipNnvkPb9PZ1fDEGdovsMtRw8H8MXNA7CaNuRDf
         B61cLIKasOcr1TctRwnqkFDPAoD5IylPZfsPlqDzLvwtzAe+LtZAJQsVWIttE5yzdLPO
         a+f+lq8hrknWtiAwsdH2wUYc/tE6k3Y0syKthMuUGfRQkBMZZREUlwNtw2Sh91x0M4py
         GAVA==
X-Gm-Message-State: AO0yUKUX+GF6hEJSMNw9sf8l9Iz7p86BncNsxSqRpdBNmf/a+KPeY0Dy
	RkA4B74kFdn204kfzhlkLN38AGTivRHDN2tdwKPPAQ==
X-Google-Smtp-Source: AK7set+L0OW3rn1staXflxpNU94CdVo17mvAyMohGACHZ3A24K+HoDQCWPu5p031s/Er2aF2ZbvvgkWsXuhdOkQnbv8=
X-Received: by 2002:a2e:8e28:0:b0:28a:a1d3:572f with SMTP id
 r8-20020a2e8e28000000b0028aa1d3572fmr1794667ljk.20.1675942650395; Thu, 09 Feb
 2023 03:37:30 -0800 (PST)
MIME-Version: 1.0
References: <mhng-9e6b4607-6bea-411c-b843-916c1e0798ee@palmerdabbelt-glaptop>
 <182c1d4e-a117-79d6-4dd1-8e3c8a447b4a@ghiti.fr> <CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com>
In-Reply-To: <CACT4Y+YYAfTafFk7DE0B=qQFgkPXS7492AhBdY_CP1WdB8CGfA@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 9 Feb 2023 12:37:17 +0100
Message-ID: <CACT4Y+Y1s2iE3OF8WHwb7F2crRjgnFCWQfoFvs3d-KgHpMLeKg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Bump COMMAND_LINE_SIZE value to 1024
To: Alex Ghiti <alex@ghiti.fr>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, macro@orcam.me.uk, david.abdurachmanov@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-api@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_033737_143285_B2D27A3F 
X-CRM114-Status: GOOD (  42.62  )
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

T24gVGh1LCAxMCBOb3YgMjAyMiBhdCAyMjowMSwgRG1pdHJ5IFZ5dWtvdiA8ZHZ5dWtvdkBnb29n
bGUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMjEgSnVuIDIwMjEgYXQgMDA6MTEsIEFsZXggR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+ID4KPiA+IEhpIFBhbG1lciwKPiA+Cj4gPiBMZSAy
My8wNC8yMDIxIMOgIDA0OjU3LCBQYWxtZXIgRGFiYmVsdCBhIMOpY3JpdCA6Cj4gPiA+IE9uIEZy
aSwgMDIgQXByIDIwMjEgMTE6MzM6MzAgUERUICgtMDcwMCksIG1hY3JvQG9yY2FtLm1lLnVrIHdy
b3RlOgo+ID4gPj4gT24gRnJpLCAyIEFwciAyMDIxLCBEYXZpZCBBYmR1cmFjaG1hbm92IHdyb3Rl
Ogo+ID4gPj4KPiA+ID4+PiA+ID4gPiAgVGhpcyBtYWNybyBpcyBleHBvcnRlZCBhcyBhIHBhcnQg
b2YgdGhlIHVzZXIgQVBJIHNvIGl0IG11c3QKPiA+ID4+PiBub3QgZGVwZW5kIG9uCj4gPiA+Pj4g
PiA+ID4gS2NvbmZpZy4gIEFsc28gY2hhbmdpbmcgaXQgKHJhdGhlciB0aGFuIHNheSBhZGRpbmcK
PiA+ID4+PiBDT01NQU5EX0xJTkVfU0laRV9WMiBvcgo+ID4gPj4+ID4gPiA+IHN3aXRjaGluZyB0
byBhbiBlbnRpcmVseSBuZXcgZGF0YSBvYmplY3QgdGhhdCBoYXMgaXRzIGRpbWVuc2lvbgo+ID4g
Pj4+IHNldCBpbiBhCj4gPiA+Pj4gPiA+ID4gZGlmZmVyZW50IHdheSkgcmVxdWlyZXMgY2FyZWZ1
bCBldmFsdWF0aW9uIGFzIGV4dGVybmFsIGJpbmFyaWVzCj4gPiA+Pj4gaGF2ZSBhbmQKPiA+ID4+
PiA+ID4gPiB3aWxsIGhhdmUgdGhlIHZhbHVlIGl0IGV4cGFuZHMgdG8gY29tcGlsZWQgaW4sIHNv
IGl0J3MgYSBwYXJ0Cj4gPiA+Pj4gb2YgdGhlIEFCSQo+ID4gPj4+ID4gPiA+IHRvby4KPiA+ID4+
PiA+ID4KPiA+ID4+PiA+ID4gVGhhbmtzLCBJIGRpZG4ndCByZWFsaXplIHRoaXMgd2FzIHBhcnQg
b2YgdGhlIHVzZXIgQkkuICBJbiB0aGF0Cj4gPiA+Pj4gY2FzZSB3ZQo+ID4gPj4+ID4gPiByZWFs
bHkgY2FuJ3QgY2hhZ2UgaXQsIHNvIHdlJ2xsIGhhdmUgdG8gc29ydCBvdXQgc29tZSBvdGhlciB3
YXkKPiA+ID4+PiBkbyBmaXgKPiA+ID4+PiA+ID4gd2hhdGV2ZXIgaXMgZ29pbmcgb24uCj4gPiA+
Pj4gPiA+Cj4gPiA+Pj4gPiA+IEkndmUgZHJvcHBlZCB0aGlzIGZyb20gZml4ZXMuCj4gPiA+Pj4g
Pgo+ID4gPj4+ID4gRG9lcyBpbmNyZWFzaW5nIENPTU1BTkRfTElORV9TSVpFIGJyZWFrIHVzZXIt
c3BhY2UgYmluYXJpZXM/IEkgd291bGQKPiA+ID4+PiA+IGV4cGVjdCBpdCB0byB3b3JrIHRoZSBz
YW1lIHdheSBhcyBhZGRpbmcgbmV3IGVudW0gdmFsdWVzLCBvciBhZGRpbmcKPiA+ID4+PiA+IGZp
ZWxkcyBhdCB0aGUgZW5kIG9mIHZlcnNpb25lZCBzdHJ1Y3RzLCBldGMuCj4gPiA+Pj4gPiBJIHdv
dWxkIGFzc3VtZSB0aGUgb2xkIGJvb3Rsb2FkZXJzL2V0YyB3aWxsIG9ubHkgc3VwcG9ydCB1cCB0
byB0aGUKPiA+ID4+PiA+IG9sZCwgc21hbGxlciBtYXggY29tbWFuZCBsaW5lIHNpemUsIHdoaWxl
IHRoZSBrZXJuZWwgd2lsbCBzdXBwb3J0Cj4gPiA+Pj4gPiBsYXJnZXIgY29tbWFuZCBsaW5lIHNp
emUsIHdoaWNoIGlzIGZpbmUuCj4gPiA+Pj4gPiBIb3dldmVyLCBpZiBzb21ldGhpbmcgY29waWVz
IC9wcm9jL2NtZGxpbmUgaW50byBhIGZpeGVkLXNpemUgYnVmZmVyCj4gPiA+Pj4gPiBhbmQgZXhw
ZWN0cyB0aGF0IHRvIHdvcmssIHRoYXQgd2lsbCBicmVhay4uLiB0aGF0J3MgcXVpdGUgdW5mb3J0
dW5hdGUKPiA+ID4+PiA+IHVzZXItc3BhY2UgY29kZS4uLiBpcyBpdCB3aGF0IHdlIGFmcmFpZCBv
Zj8KPiA+ID4+PiA+Cj4gPiA+Pj4gPiBBbHRlcm5hdGl2ZWx5LCBjb3VsZCBleHBvc2UgdGhlIHNh
bWUgQ09NTUFORF9MSU5FX1NJWkUsIGJ1dCBpbnRlcm5hbGx5Cj4gPiA+Pj4gPiBzdXBwb3J0IGEg
bGFyZ2VyIGNvbW1hbmQgbGluZT8KPiA+ID4+Pgo+ID4gPj4+IExvb2tpbmcgYXQga2VybmVsIGNv
bW1pdCBoaXN0b3J5IEkgc2VlIFBvd2VyUEMgc3dpdGNoZWQgZnJvbSA1MTIgdG8KPiA+ID4+PiAy
MDQ4LCBhbmQgSSBkb24ndCBzZWUgY29tcGxhaW50cyBhYm91dCB0aGUgQUJJIG9uIHRoZSBtYWls
aW5nIGxpc3QuCj4gPiA+Pj4KPiA+ID4+PiBJZiBDT01NQU5EX0xJTkVfU0laRSBpcyB1c2VkIGJ5
IHVzZXIgc3BhY2UgYXBwbGljYXRpb25zIGFuZCB3ZQo+ID4gPj4+IGluY3JlYXNlIGl0IHRoZXJl
IHNob3VsZG4ndCBiZSBwcm9ibGVtcy4gSSB3b3VsZCBleHBlY3QgdGhpbmdzIHRvCj4gPiA+Pj4g
d29yaywgYnV0IGp1c3QgZ2V0IHRydW5jYXRlZCBib290IGFyZ3M/IFRoYXQgaXMgdGhlIGFwcGxp
Y2F0aW9uIHdpbGwKPiA+ID4+PiBjb250aW51ZSBvbmx5IHRvIGxvb2sgYXQgdGhlIGluaXRpYWwg
NTEyIGNoYXJzLgo+ID4gPj4KPiA+ID4+ICBUaGUgbWFjcm8gaXMgaW4gYW4gaW5jbHVkZS91YXBp
IGhlYWRlciwgc28gaXQncyBleHBvcnRlZCB0byB0aGUgdXNlcmxhbmQKPiA+ID4+IGFuZCBhIHBh
cnQgb2YgdGhlIHVzZXIgQVBJLiAgSSBkb24ndCBrbm93IHdoYXQgdGhlIGNvbnNlcXVlbmNlcyBh
cmUgZm9yCj4gPiA+PiB0aGUgUklTQy1WIHBvcnQgc3BlY2lmaWNhbGx5LCBidXQgaXQgaGFzIHJh
aXNlZCBteSBhdHRlbnRpb24sIGFuZCBJIHRoaW5rCj4gPiA+PiBpdCBoYXMgdG8gYmUgaW52ZXN0
aWdhdGVkLgo+ID4gPj4KPiA+ID4+ICBQZXJoYXBzIGl0J3MgT0sgdG8gY2hhbmdlIGl0IGFmdGVy
IGFsbCwgYnV0IHlvdSdkIGhhdmUgdG8gZ28gdGhyb3VnaAo+ID4gPj4ga25vd24vcG90ZW50aWFs
IHVzZXJzIG9mIHRoaXMgbWFjcm8uICBJIGd1ZXNzIHRoZXJlIHNob3VsZG4ndCBiZSB0aGF0Cj4g
PiA+PiBtYW55Cj4gPiA+PiBvZiB0aGVtLgo+ID4gPj4KPiA+ID4+ICBJbiBhbnkgY2FzZSBpdCBj
YW5ub3QgZGVwZW5kIG9uIEtjb25maWcsIGJlY2F1c2UgdGhlIHVzZXJsYW5kIHdvbid0IGhhdmUK
PiA+ID4+IGFjY2VzcyB0byB0aGUgY29uZmlndXJhdGlvbiwgYW5kIHRoZW4gcHJlc3VtYWJseSB3
YW50cyB0byBoYW5kbGUgYW55IGFuZAo+ID4gPj4gYWxsLgo+ID4gPgo+ID4gPiBJdCBraW5kIG9m
IGZlZWxzIHRvIG1lIGxpa2UgQ09NTUFORF9MSU5FX1NJWkUgc2hvdWxkbid0IGhhdmUgYmVlbiBw
YXJ0Cj4gPiA+IG9mIHRoZSBVQUJJIHRvIGJlZ2luIHdpdGguICBJIHNlbnQgYSBwYXRjaCB0byBy
ZW1vdmUgaXQgZnJvbSB0aGUKPiA+ID4gYXNtLWdlbmVyaWMgVUFCSSwgbGV0J3Mgc2VlIGlmIGFu
eW9uZSBrbm93cyBvZiBhIHJlYXNvbiBpdCBzaG91bGQgYmUgVUFCSToKPiA+ID4KPiA+ID4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJjaC8yMDIxMDQyMzAyNTU0NS4zMTM5NjUtMS1w
YWxtZXJAZGFiYmVsdC5jb20vVC8jdQo+ID4KPiA+IEFybmQgc2VlbWVkIHRvIGFncmVlIHdpdGgg
eW91IGFib3V0IHJlbW92aW5nIENPTU1BTkRfTElORV9TSVpFIGZyb20gdGhlCj4gPiBVQUJJLCBh
bnkgcHJvZ3Jlc3Mgb24geW91ciBzaWRlPwo+Cj4gV2FzIHRoaXMgZXZlciBtZXJnZWQ/IERvbid0
IHNlZSB0aGlzIGV2ZW4gaW4gbGludXgtbmV4dC4KClBpbmcuIFN0aWxsIGFuIGlzc3VlIGF0IGxl
YXN0IGZvciBzeXpib3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
