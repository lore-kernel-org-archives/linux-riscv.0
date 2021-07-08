Return-Path: <SRS0=GvX2=MA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E40C07E96
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:29:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D949A6162B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jul 2021 13:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D949A6162B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ca0VhFt5b35uPV8ZJ9sHduYqGDgpxEI+nA7RWXLPS74=; b=oXQfd//7xvPNwR
	pN7uD+GhRp8tVR0+getwCGqNv4bs1CXbwDpye0Jeo4guFLSKnDqItdHyf8dKP2rdwAu1zWGmp/LiL
	xS4ZrGzDNjIdgVZgsA8JJblRxitpErEASgO3AYqN6ss7xkPNsvp7uQZm02XfhRoIiwP7HARRq6DV3
	5uleKSjZW/jrIvHlFMevWX57ejHSCdIMhKO1quYb3WicJUlI94J+abpbg/+GxbEUl/x4OBB8hpWlY
	jCrD5kHHbuNIEWyA9d9Nxk9CW0GDcno1VFBUJbPyyr1gfgx9GhdfmnGVWcLyqb1yYKlIyoMccpXIZ
	+lZ1jCrHlsUHr7AlIzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1U61-00H5Tu-6N; Thu, 08 Jul 2021 13:29:41 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1U5y-00H5T2-6A
 for linux-riscv@lists.infradead.org; Thu, 08 Jul 2021 13:29:39 +0000
Received: by mail-yb1-xb31.google.com with SMTP id b13so8964351ybk.4
 for <linux-riscv@lists.infradead.org>; Thu, 08 Jul 2021 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7iY/t0V3e2tJ2lgZLF6BcOUJNLhB502Wbe1KPKqB0LA=;
 b=ovlSDhRfTlXIGTTpWKdVDJDYwHGRnh6RX5bu82M/prXU1TSsMXMwyHyt6NeSyG/VZH
 WfLIwt73YEx9HQlGzD9Nt+sB6mdU06Y86CL4x5ZIDeOpfi30OLMC8K5rMs37G1+nGGQ0
 PLn/75deF/+N1QH89L5zG+YOf2FEqLowpgKxKYfm67N6HBSIfyTngRtQcIALFjIrgiBh
 grlCNI4Wg4L9c7XQesChJZf1zzCoimDOazQsXajqWyAu/9Fep0xpcJp178DeHqNor/4O
 COrYXyp4WP/WO8UzcTx9xvvf8bklfn/1rP4BMaGgG1J3a8urNcLzAAmNrs8BWoYEwEo7
 f7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7iY/t0V3e2tJ2lgZLF6BcOUJNLhB502Wbe1KPKqB0LA=;
 b=JKFdem/1OBLS7hAeU/Oja1X+r6vbb8H5g6V97DzGHWxx9XFo0fbqo41/lMzW1rEn94
 XA5rMBuKI3T3b1C4cv8x7F3TviE+oYIONRBTD2HNahSiL4bDMQZzftgejPvms271b1uI
 ywk+nk9zjNWS1hRk+VSYHLUzEzgvZBTUzpBgjLxBWa+LEQPHFYyI12G0hW6fo/fg6k+C
 3b8Rus81+Jet0kTbs3abY303NMSte7TFTEBHnADSts8C5gwTaQFK/m8+vQb1Q1bmyhnm
 Ae187E0CzBlt31o6jnk3ONFsumx4BSAb9pikjTINdc9Ry8mk15Hxp42XK9MB/oVFV03d
 0qBg==
X-Gm-Message-State: AOAM532XRtwvIVEx4B1BwxFPSkrX4ryN2QUDul9aTQiSAjQhX6xfvHj9
 gMDjIPWKFTNDsgcg0M4QFf0rRR+IhRDSBxEcGoA=
X-Google-Smtp-Source: ABdhPJyj0wCPN4rnzDZzw3u1A5K0DoAv/kiMbwKUFoPpA7LrFI9EzkCTntijaxa4pc8RU+DfXx4dyiP1Os1eM+sR6kQ=
X-Received: by 2002:a5b:504:: with SMTP id o4mr40480864ybp.332.1625750977168; 
 Thu, 08 Jul 2021 06:29:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210627135117.28641-1-bmeng.cn@gmail.com>
 <11706f7e-a53a-5640-d713-bc4562db71fa@huawei.com>
 <CAEUhbmV=h3nZ8Aa94_uyjrZ_NGe+9-xAorUMubSPJXu3y60PeQ@mail.gmail.com>
 <aa1f027c-bbc7-92f8-80a6-fe290cd1cdf8@huawei.com>
 <CAEUhbmXeqAsLxm+oCHRPHMZq2mQXPD6fJOFerwp_BRv1kCc7ow@mail.gmail.com>
 <CAEUhbmUvDSocWobb26PcrV6vi6kHjg8o6pNomt9AnGWGbvAuhw@mail.gmail.com>
 <94a92009-ce49-bbe4-794c-0631520e4c3d@huawei.com>
 <CAEUhbmX8a+rjc4=5QfR4MivMMx-T_7KDq-QHtmrGsVL2VqLQAA@mail.gmail.com>
In-Reply-To: <CAEUhbmX8a+rjc4=5QfR4MivMMx-T_7KDq-QHtmrGsVL2VqLQAA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Jul 2021 21:29:26 +0800
Message-ID: <CAEUhbmVQPYQSuYLaTRY112TpUB9g-KfCEREGODxNivHhnWNb_Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix 32-bit RISC-V boot failure
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Atish Patra <atish.patra@wdc.com>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_062938_291947_DE92D528 
X-CRM114-Status: GOOD (  29.66  )
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

SGkgUGFsbWVyLAoKT24gVGh1LCBKdWwgMSwgMjAyMSBhdCAxMDoyMCBBTSBCaW4gTWVuZyA8Ym1l
bmcuY25AZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVsIDEsIDIwMjEgYXQgMTA6MDgg
QU0gS2VmZW5nIFdhbmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPiB3cm90ZToKPiA+Cj4g
Pgo+ID4gT24gMjAyMS82LzMwIDE5OjU4LCBCaW4gTWVuZyB3cm90ZToKPiA+ID4gT24gTW9uLCBK
dW4gMjgsIDIwMjEgYXQgMTE6MjEgQU0gQmluIE1lbmcgPGJtZW5nLmNuQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4gPiA+PiBPbiBNb24sIEp1biAyOCwgMjAyMSBhdCAxMDoyOCBBTSBLZWZlbmcgV2FuZyA8
d2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+ID4gPj4+Cj4gPiA+Pj4gT24gMjAy
MS82LzI4IDk6MTUsIEJpbiBNZW5nIHdyb3RlOgo+ID4gPj4+PiBPbiBNb24sIEp1biAyOCwgMjAy
MSBhdCA4OjUzIEFNIEtlZmVuZyBXYW5nIDx3YW5na2VmZW5nLndhbmdAaHVhd2VpLmNvbT4gd3Jv
dGU6Cj4gPiA+Pj4+PiBIae+8jCBzb3JyeSBmb3IgdGhlIG1pc3Rha2XvvIx0aGUgYnVnIGlzIGZp
eGVkIGJ5Cj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgt
cmlzY3YvMjAyMTA2MDIwODU1MTcuMTI3NDgxLTItd2FuZ2tlZmVuZy53YW5nQGh1YXdlaS5jb20v
Cj4gPiA+Pj4+IFdoYXQgYXJlIHdlIG9uIHRoZSBwYXRjaCB5b3UgbWVudGlvbmVkPwo+ID4gPj4+
Pgo+ID4gPj4+PiBJIGRvbid0IHNlZSBpdCBhcHBsaWVkIGluIHRoZSBsaW51eC9tYXN0ZXIuCj4g
PiA+Pj4+Cj4gPiA+Pj4+IEFsc28gdGhlcmUgc2hvdWxkIGJlIGEgIkZpeGVzIiB0YWcgYW5kIHN0
YWJsZUB2Z2VyLmtlcm5lbC5vcmcgY2MnZWQKPiA+ID4+Pj4gYmVjYXVzZSAzMi1iaXQgaXMgYnJv
a2VuIHNpbmNlIHY1LjEyLgo+ID4gPj4+IGh0dHBzOi8va2VybmVsLmdvb2dsZXNvdXJjZS5jb20v
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Jpc2N2L2xpbnV4LysvYzk4MTFlMzc5YjIxMWM2N2Jh
MjlmYjA5ZDZmNjQ0ZGQ0NGNmY2ZmMgo+ID4gPj4+Cj4gPiA+Pj4gaXQncyBvbiBQYWxtZXInIHJp
c2N2LW5leHQuCj4gPiA+PiBOb3Qgc3VyZSByaXNjdi1uZXh0IGlzIGZvciB3aGljaCByZWxlYXNl
PyBUaGlzIGlzIGEgcmVncmVzc2lvbiBhbmQKPiA+ID4+IHNob3VsZCBiZSBvbiA1LjEzLgo+ID4g
Pj4KPiA+ID4+PiBIaSBQYWxtZXIsIHNob3VsZCBJIHJlc2VuZCBvciBjb3VsZCB5b3UgaGVscCBt
ZSB0byBhZGQgdGhlIGZpeGVzIHRhZz8KPiA+ID4gWW91ciBwYXRjaCBtaXhlZCAyIHRoaW5ncyAo
Zml4IHBsdXMgb25lIGZlYXR1cmUpIHRvZ2V0aGVyLCBzbyBpdCBpcwo+ID4gPiBub3QgcHJvcGVy
IHRvIGJhY2sgcG9ydCB5b3VyIHBhdGNoLgo+ID4KPiA+ICJtZW09IiB3aWxsIGNoYW5nZSB0aGUg
cmFuZ2Ugb2YgbWVtYmxvY2ssIHNvIHRoZSBmaXggcGFydCBtdXN0IGJlIGluY2x1ZGVkLgo+ID4K
Pgo+IFllcywgc28geW91IGNhbiByZWJhc2UgdGhlICJtZW09IiBjaGFuZ2VzIG9uIHRvcCBvZiBt
eSBwYXRjaC4KPgo+IFRoZSBwcmFjdGljZSBpcyB0aGF0IHdlIHNob3VsZCBub3QgbWl4IDIgdGhp
bmdzIGluIG9uZSBwYXRjaC4gSSBjYW4KPiBpbWFnaW5lIHRoYXQgeW91IHdhbnRlZCB0byBhZGQg
Im1lbT0iIHRvIFJJU0MtViBhbmQgc3VkZGVubHkgZm91bmQgdGhlCj4gZXhpc3RpbmcgbG9naWMg
d2FzIGJyb2tlbiwgc28geW91IHNlbnQgb25lIHBhdGNoIHRvIGRvIGJvdGguCj4KPiA+Cj4gPiA+
Cj4gPiA+IEhlcmUgaXMgbXkgMiBjZW50czoKPiA+ID4KPiA+ID4gMS4gRHJvcCB5b3VyIHBhdGNo
IGZyb20gcmlzY3YtbmV4dAo+ID4gPiAyLiBBcHBseSBteSBwYXRjaCBhcyBpdCBpcyBhIHNpbXBs
ZSBmaXggdG8gcHJldmlvdXMgY29tbWl0LiBUaGlzCj4gPiA+IGFsbG93cyBzdGFibGUga2VybmVs
IHRvIGNoZXJyeS1waWNrIHRoZSBmaXggdG8gdjUuMTIgYW5kIHY1LjEzLgo+ID4gPiAzLiBSZWJh
c2UgeW91ciBwYXRjaCBhZ2FpbnN0IG1pbmUsIGFuZCByZXNlbmQgdjIKPiA+ID4KPiA+ID4gTGV0
IG1lIGtub3cgaWYgdGhpcyBtYWtlcyBzZW5zZS4KPiA+Cj4gPiBJdCBpcyBub3QgYSBiaWcgcHJv
YmxlbSBmb3IgbWUsIGJ1dCBJIGhhdmUgbm8gcmlnaHQgYWJvdXJ0IHJpc2N2LW5leHQsCj4gPgo+
ID4gbGV0J3Mgd2FpdCBQYWxtZXIncyBhZHZpc2UuCj4gPgo+Cj4gU3VyZS4gUGFsbWVyLCBsZXQg
bWUga25vdyB5b3VyIHRob3VnaHRzLgoKUGluZz8KClJlZ2FyZHMsCkJpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
