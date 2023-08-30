Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB9FC6FA8F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 07:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qm6Tm7vk3kHhoszJfX+PcRiLQge5RXae88FSvEGfHsI=; b=eNvWkOx0Lv2Svk
	bBpNVuerQ/wl3wyF0tZvB01TMZOroeE0aFVFa3Z0N5jcnE+zY1ZyWViNCgB5v7ytbhfAlTMv7lnS2
	G70Wuh2ZswCVcE/agNgJhp7Nu9P2WpFo0vhImGjvk56j9QRMlBia6fDHIq4oBrVkzIuYq+O6Fs20L
	jzia81BS7Mbsmwl1jvCagpTPvg27qEXp+kS2cIZjSYtNbg1lr59HP8e2Yznbvv+nYbGtBBbZMm0Yz
	0LmIxY9XX/UMs4N+Ze0dkzlQo/ujvzsmoxL7LY2ZZZEUiCv1/kDrS5/9al8Y2BG1h7LFXm+kJiNhN
	hmLqvSSuVqVvjozFMqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbG4L-00D2yg-2n;
	Wed, 30 Aug 2023 07:56:53 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbG4I-00D2yD-2V
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 07:56:52 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-56b0c5a140dso3430214a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 00:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693382209; x=1693987009; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qffhXBI//HA0r55HhLgsB/tbzSiNc1A7y5JWtmP+Ocg=;
        b=QkLOdlOAVklzhwNLJiaHPW2hvMbJjqyvyElFGjKfxVh2Whl7Zkw9yhOtiP+2X1/Nhn
         IBr9hyXrK157yO3z/llYZphCaUSNPAMV2ZILMT4X9WoTmcJWQLZRpN87Gu5bKcrEaBBQ
         dhYUljqCDIgtvWm+gQRRPeF5zF9IUNkpcxxnuYMCO6yhfqGe36C8LEFUnKkDgzwFTaUE
         BGdW52TLM8ls55RDV28CtAg/mgHZESwxkgXSTa2bHoEQIQ7XshUO4umFb85Gd4dlNrdB
         LtfVgCmVd7kgXG8q3wkXz+jjuBgxOzXxJ4K3Ou+hBoKDiWqOTxCYO7q76kz0x/t5+XRn
         AhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693382209; x=1693987009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qffhXBI//HA0r55HhLgsB/tbzSiNc1A7y5JWtmP+Ocg=;
        b=eGuAhhL6S/yAD5gEYLotOJNGkKn8IVDGo8bHlMxF7a5+g9FLIQu9+6MnKcKxQDkYwY
         67HWnRQP+bRMvO7NojzMLhejrA72E/tGzS797ns8ymceKqUzMhjOmMt60q+fVhexDMnW
         9krSC797E/aHC2nzlGRuvjQXM6tH8BpuBrTHTwqg/ANooIP1/GhPI/g8UJkl4mGI1TWx
         034VU3K4XLf3x+Cmv51cGIsjFtq+PNTZNQPmUGLdAalsHpsS2146zpngtW7YMnNj0drX
         aguBzM+PdCmG63myNYnRaHgD3B+vUtYEHNPIEAvtMAykDTCPvrNKmFLJD1l7KpUITzBJ
         DjWQ==
X-Gm-Message-State: AOJu0YxiyS0/Zz8f4uAmeStJBxLv5VnGYckfSCZwJmnNfFsahk6wg82I
	i76aX+oqd7g0vvH2QEq47YxVTvDKy9eT5nDwhyw=
X-Google-Smtp-Source: AGHT+IEWITQ8cCSo6yBOlFLP7t/DijKVX6fkKNAXUjjVQldwp/KfjLTZU2VFz3Y6VC1neo/ubxeJKFeimikmWbAjzPc=
X-Received: by 2002:a17:90a:7345:b0:26b:4a9e:3c7e with SMTP id
 j5-20020a17090a734500b0026b4a9e3c7emr1446738pjs.4.1693382208658; Wed, 30 Aug
 2023 00:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230827205641.46836-1-namcaov@gmail.com> <874jkjl4e1.fsf@all.your.base.are.belong.to.us>
 <ZOyhozSq3S36eRSq@nam-dell> <ZOymDqhE9STgx4Mm@nam-dell> <87edjmz864.fsf@all.your.base.are.belong.to.us>
 <ZO4+/P9B29Bpb0Yz@nam-dell> <87il8xm1d1.fsf@all.your.base.are.belong.to.us> <CA+sZ8B8uMqYOE56T3TqDnGGyaEo+sffC_7rWFH78M8OsWc6BSg@mail.gmail.com>
In-Reply-To: <CA+sZ8B8uMqYOE56T3TqDnGGyaEo+sffC_7rWFH78M8OsWc6BSg@mail.gmail.com>
From: Nam Cao <namcaov@gmail.com>
Date: Wed, 30 Aug 2023 09:56:37 +0200
Message-ID: <CA+sZ8B-K6KP_W+HOkjCC+7C-YmMyLVVcJv-w1PDR+ZZedfTUPQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: provide riscv-specific is_trap_insn()
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, guoren@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_005650_818853_23C656AD 
X-CRM114-Status: GOOD (  34.48  )
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

T24gV2VkLCBBdWcgMzAsIDIwMjMgYXQgOTo0NuKAr0FNIE5hbSBDYW8gPG5hbWNhb3ZAZ21haWwu
Y29tPiB3cm90ZToKPgo+IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDk6MzLigK9BTSBCasO2cm4g
VMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBOYW0gQ2FvIDxuYW1jYW92
QGdtYWlsLmNvbT4gd3JpdGVzOgo+ID4KPiA+ID4gT24gVHVlLCBBdWcgMjksIDIwMjMgYXQgMDg6
MTQ6NTlBTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+ID4+IE5hbSBDYW8gPG5hbWNh
b3ZAZ21haWwuY29tPiB3cml0ZXM6Cj4gPiA+Pgo+ID4gPj4gPiBPbiBNb24sIEF1ZyAyOCwgMjAy
MyBhdCAwMzozMToxNVBNICswMjAwLCBOYW0gQ2FvIHdyb3RlOgo+ID4gPj4gPj4gT24gTW9uLCBB
dWcgMjgsIDIwMjMgYXQgMDI6NDg6MDZQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiA+
ID4+ID4+ID4gTmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKPiA+ID4+ID4+ID4K
PiA+ID4+ID4+ID4gPiB1cHJvYmVzIGV4cGVjdHMgaXNfdHJhcF9pbnNuKCkgdG8gcmV0dXJuIHRy
dWUgZm9yIGFueSB0cmFwIGluc3RydWN0aW9ucywKPiA+ID4+ID4+ID4gPiBub3QganVzdCB0aGUg
b25lIHVzZWQgZm9yIGluc3RhbGxpbmcgdXByb2JlLiBUaGUgY3VycmVudCBkZWZhdWx0Cj4gPiA+
PiA+PiA+ID4gaW1wbGVtZW50YXRpb24gb25seSByZXR1cm5zIHRydWUgZm9yIDE2LWJpdCBjLmVi
cmVhayBpZiBDIGV4dGVuc2lvbiBpcwo+ID4gPj4gPj4gPiA+IGVuYWJsZWQuIFRoaXMgY2FuIGNv
bmZ1c2UgdXByb2JlcyBpZiBhIDMyLWJpdCBlYnJlYWsgZ2VuZXJhdGVzIGEgdHJhcAo+ID4gPj4g
Pj4gPiA+IGV4Y2VwdGlvbiBmcm9tIHVzZXJzcGFjZTogdXByb2JlcyBhc2tzIGlzX3RyYXBfaW5z
bigpIHdobyBzYXlzIHRoZXJlIGlzIG5vCj4gPiA+PiA+PiA+ID4gdHJhcCwgc28gdXByb2JlcyBh
c3N1bWUgYSBwcm9iZSB3YXMgdGhlcmUgYmVmb3JlIGJ1dCBoYXMgYmVlbiByZW1vdmVkLCBhbmQK
PiA+ID4+ID4+ID4gPiByZXR1cm4gdG8gdGhlIHRyYXAgaW5zdHJ1Y3Rpb24uIFRoaXMgY2F1c2Ug
YW4gaW5maW5pdGUgbG9vcCBvZiBlbnRlcmluZwo+ID4gPj4gPj4gPiA+IGFuZCBleGl0aW5nIHRy
YXAgaGFuZGxlci4KPiA+ID4+ID4+ID4gPgo+ID4gPj4gPj4gPiA+IEluc3RlYWQgb2YgdXNpbmcg
dGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24sIGltcGxlbWVudCB0aGlzIGZ1bmN0aW9uCj4gPiA+
PiA+PiA+ID4gc3BlZmljaWFsbHkgZm9yIHJpc2N2IHdoaWNoIGNoZWNrcyBmb3IgYm90aCBlYnJl
YWsgYW5kIGMuZWJyZWFrLgo+ID4gPj4gPj4gPgo+ID4gPj4gPj4gPiBJIHRvb2sgdGhpcyBmb3Ig
YSBzcGluLCBhbmQgaXQgaW5kZWVkIGZpeGVzIHRoaXMgbmV3IGhhbmchIE5pY2UhCj4gPiA+PiA+
Pgo+ID4gPj4gPj4gR3JlYXQhIFRoYW5rcyBmb3IgdGVzdGluZyBpdC4KPiA+ID4+ID4+Cj4gPiA+
PiA+PiA+IEhvd2V2ZXIsIHdoZW4gSSB0cmllZCBzZXR0aW5nIGFuIHVwcm9iZSBvbiB0aGUgZWJy
ZWFrIGluc3RydWN0aW9uCj4gPiA+PiA+PiA+IChvZmZzZXQgMHgxMTgpIGZyb20geW91ciBleGFt
cGxlIFsxXSwgdGhlIHByb2JlIGRvZXMgbm90IHNob3cgdXAgaW4gdGhlCj4gPiA+PiA+PiA+IHRy
YWNlIGJ1ZmZlci4KPiA+ID4+ID4+ID4KPiA+ID4+ID4+ID4gQW55IGlkZWFzPwo+ID4gPj4gPj4K
PiA+ID4+ID4+ID5Gcm9tIG15IHVuZGVyc3RhbmRpbmcsIGJvdGggdXByb2JlcyBhbmQga3Byb2Jl
cyByZWZ1c2UgdG8gaW5zdGFsbCBicmVhayBwb2ludHMKPiA+ID4+ID4+IGludG8gZXhpc3Rpbmcg
dHJhcCBpbnN0cnVjdGlvbnMuIE90aGVyd2lzZSwgd2UgbWF5IGNvbmZsaWN0IHdpdGggc29tZXRo
aW5nIGVsc2UKPiA+ID4+ID4+IHRoYXQgaXMgYWxzbyB1c2luZyB0cmFwIGluc3RydWN0aW9ucy4K
PiA+ID4+ID4KPiA+ID4+ID4gSSBqdXN0IHJlYWxpemUgeW91IHByb2JhYmx5IGFzayB0aGlzIGJl
Y2F1c2UgdXByb2JlIGNhbiBzdGlsbCBiZSBpbnN0YWxsZWQgYmVmb3JlCj4gPiA+PiA+IGFwcGx5
aW5nIHRoZSBwYXRjaC4gQnV0IEkgdGhpbmsgdGhhdCBpcyBhbm90aGVyIGJ1ZyB0aGF0IG15IHBh
dGNoIGFsc28KPiA+ID4+ID4gYWNjaWRlbnRhbGx5IGZpeDogdXByb2JlcyBzaG91bGQgbm90IGlu
c3RhbGwgYnJlYWtwb2ludCBpbnRvIGVicmVhayBpbnN0cnVjdGlvbnMsCj4gPiA+PiA+IGJ1dCBp
dCBpbmNvcnJlY3RseSBkb2VzIHNvIGJlY2F1c2UgaXQgZG9lcyBub3QgZXZlbiBrbm93IGFib3V0
IHRoZSBleGlzdGVuY2Ugb2YKPiA+ID4+ID4gMzItYml0IGVicmVhay4KPiA+ID4+Cj4gPiA+PiBG
V0lXLCBJIGNhbiBzdGlsbCBpbnN0YWxsIHRoZSB1cHJvYmUgYXQgYW4gZWJyZWFrIHdpdGggeW91
IHBhdGNoLiBJdCdzCj4gPiA+PiBub3QgaGl0LCBidXQgc3VjY2VlZHMgdG8gaW5zdGFsbC4KPiA+
ID4KPiA+ID4gSXQgc2VlbXMgdXByb2JlcyBpbnN0YWxsIGZhaWx1cmVzIGFyZSBjb21wbGV0ZWx5
IHNpbGVudCAoc2VlIHVwcm9iZV9tbWFwKCkgaW4KPiA+ID4ga2VybmVsL2V2ZW50cy91cHJvYmVz
LmMpLiBTbyBJIHRoaW5rIGFsdGhvdWdoIHVwcm9iZXMgaW5zdGFsbCBzZWVtcyBmaW5lLCBpdAo+
ID4gPiBhY3R1YWxseSBpcyBub3QuCj4gPgo+ID4gSHVoLCBzbyB0aGVyZSdzIG5vIGNoZWNrIGlm
IHRoZSBpbnN0cnVjdGlvbiBpcyBhIHZhbGlkIG9uZSBhdCBldmVudAo+ID4gcmVnaXN0ZXIgcG9p
bnQ/Cj4KPiBUaGVyZSBhcmUgc29tZSBjaGVja3MgKGVnLiBpZiB0aGUgcHJvYmUgaXMgd2l0aGlu
IHRoZSBiaW5hcnkpLCBidXQKPiB0aGV5IGFyZSBub3QgY29tcGxldGUuCgpPaCB3YWl0LCBpZ25v
cmUgdGhhdCwganVzdCB0ZXN0ZWQsIHRoaXMgaXMgYWxzbyBub3QgY2hlY2tlZC4KCj4gVGhlIGFj
dHVhbCBjaGVja3MgZm9yIHRoZSB2YWxpZGl0eSBvZiB0aGUgaW5zdHJ1Y3Rpb24gaXMgbm90IGRv
bmUKPiB1bnRpbCBpbnN0YWxsYXRpb24uCj4KPiBCZXN0IHJlZ2FyZHMsCj4gTmFtCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
