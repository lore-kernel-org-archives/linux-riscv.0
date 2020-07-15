Return-Path: <SRS0=uYfr=A2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85B7C433E5
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 17:56:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E6A720663
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2020 17:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mpumkAPv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yo/iLTkC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E6A720663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KUdpD5D9poexCvLZBiWebZ7fRRuwJQOFgpePtoBwWtI=; b=mpumkAPv6Eqm0FZXgaITz7hOM
	Y03ZRQuvTrV0bLWe0kuq1zCzHWSi/otRugaktARvVxdXawWF2Dz5grJfToMW/YCmEfBjxR2M91nk2
	eq3aqo4XSiuIBODnOkFmKxi+aAWjJI1EjzOrckKMl8uu4EKB/k4Yiiipc7isOKkJXPOF2mdtZhLfY
	38BDXLHfy3QRSiBfaMYLYZB8rcZimxSFDsiZglN8RrsNBdmT7kzW1oTwJCkvx/kkO4EL74GUcnxQ5
	D1U22FrGmCoPgLcEJgV35C8MPBUGnmN3SNyV1nuQDnVwrpzsCeMkQdShYsh2exRTSfv0dMZaX95/Z
	z00/HZzKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvldp-0004Ye-Rb; Wed, 15 Jul 2020 17:56:25 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvldm-0004Xm-NV
 for linux-riscv@lists.infradead.org; Wed, 15 Jul 2020 17:56:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id r12so3593712wrj.13
 for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2020 10:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=txrkPrZiEn1pbT9kzdmetNqwIC2PvBGCwV/yJihymvQ=;
 b=Yo/iLTkCOqUsykROi54kl7CXKAvBJVM2tFfbAhRX6TsblZCX1MJMyvsJbGn/NkBDzC
 KCnCXJ5z+Tyhy4z2tC+xHjEouoz2j3ja0nn/o7PJhs4U2OilX6G8RW82mNk/g+0JLzFI
 cAB9eabMoNyIpuwspNK7eEbw9oxRpVXgGwLs9YnQRQ8fcuhKhGmCqUjkqv84V00u/BKv
 9S+a/zpoyykQ6RlHPPoNe8fckniBZpWZtSm1Lm+Mg4qJMRWP9nDnp/acCVZRrYml3EVE
 xXcIp1cJet4qX3zvzmHXDDGSfkQcwKb59CVUwWpepUhoB3ACIQ9/N8UazhKz4FpCH/XJ
 f4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=txrkPrZiEn1pbT9kzdmetNqwIC2PvBGCwV/yJihymvQ=;
 b=tXlQxaTw5oKfR+/jV/a8K5TI9inYfPe/we+0egrQfMJF9scVdQktqUzQUM0lDT6paI
 mOfICubj0WyhmVgN1vLTpGrBY4z6qGWlqRHT9ehY8PrMhe3q2h9++xDU8JQXIR3UiL7k
 MQz9v3FFx6TrfFLDL0cACqPxhVuZ02pSIn6HD8pzjSxVIeEPIp0oSq/pc6AvCx/GM70p
 XgCExSEjhikZVABgUgkoNFXvOsONB2PlUKTmOHko25+0iHjiALOkTkqNP2xXPKt84uPN
 rCiCf4jr+xc5z8i/g5g+P3ibmQTXqzbeF2uWKA3p6svKXTJHmw84xPdy++u7tSP1o5yv
 e4KA==
X-Gm-Message-State: AOAM532ukwF6Y4xfbgLSUsdOeo/Vu3vajU8OPOdtpL8NS7KxAIfxnwci
 eT0pw4qanHbSP8YHWQiFCmNoCSvHTWLyHfojB5Q=
X-Google-Smtp-Source: ABdhPJwKTDDMyra+aSCx70aaxxEryoqGVH2kq/Vy70Lnm2CkKYtD0NcGtJo864aQiOBDMkj1VN7eSL+yNdnVk5jeG8k=
X-Received: by 2002:adf:82b8:: with SMTP id 53mr614398wrc.172.1594835778778;
 Wed, 15 Jul 2020 10:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200713183711.762244-1-luke.r.nels@gmail.com>
In-Reply-To: <20200713183711.762244-1-luke.r.nels@gmail.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Date: Wed, 15 Jul 2020 19:56:06 +0200
Message-ID: <CAJ+HfNg_qV=umB9T1U9vRo2pUpmUFfBN44WpAOfMoi75Ymh2dw@mail.gmail.com>
Subject: Re: [RFC PATCH bpf-next 0/3] bpf, riscv: Add compressed instructions
 to rv64 JIT
To: Luke Nelson <lukenels@cs.washington.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_135622_878380_C2F9FCFC 
X-CRM114-Status: GOOD (  15.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Borkmann <daniel@iogearbox.net>, Luke Nelson <luke.r.nels@gmail.com>,
 Netdev <netdev@vger.kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Xi Wang <xi.wang@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxMyBKdWwgMjAyMCBhdCAyMDozNywgTHVrZSBOZWxzb24gPGx1a2VuZWxzQGNzLndh
c2hpbmd0b24uZWR1PiB3cm90ZToKPgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGVuYWJsZXMgdXNpbmcg
Y29tcHJlc3NlZCByaXNjdiAoUlZDKSBpbnN0cnVjdGlvbnMKPiBpbiB0aGUgcnY2NCBCUEYgSklU
Lgo+CgpGaXJzdCBvZiBhbGw7IFJlYWxseSBuaWNlIHdvcmsuIEkgbGlrZSB0aGlzLCBhbmQgaXQg
bWFrZXMgdGhlIGNvZGUKZWFzaWVyIHRvIHJlYWQgYXMgd2VsbCAoZS5nLiBlbWl0X212KS4gSSdt
IGEgYml0IGN1cmlvdXMgd2h5IHlvdSBvbmx5CmRpZCBpdCBmb3IgUlY2NCwgYW5kIG5vdCBSVjMy
PyBJIGhhdmUgc29tZSBtaW5vciBjb21tZW50cyBvbiB0aGUKcGF0Y2hlcy4gSSBzdHJvbmdseSBl
bmNvdXJhZ2UgeW91IHRvIHN1Ym1pdCB0aGlzIGFzIGEgcHJvcGVyIChub24tUkZDKQpzZXQgZm9y
IGJwZi1uZXh0LgoKCkNoZWVycywKQmrDtnJuCgo+IFJWQyBpcyBhIHN0YW5kYXJkIHJpc2N2IGV4
dGVuc2lvbiB0aGF0IGFkZHMgYSBzZXQgb2YgY29tcHJlc3NlZCwKPiAyLWJ5dGUgaW5zdHJ1Y3Rp
b25zIHRoYXQgY2FuIHJlcGxhY2Ugc29tZSByZWd1bGFyIDQtYnl0ZSBpbnN0cnVjdGlvbnMKPiBm
b3IgaW1wcm92ZWQgY29kZSBkZW5zaXR5Lgo+Cj4gVGhpcyBzZXJpZXMgZmlyc3QgbW9kaWZpZXMg
dGhlIEpJVCB0byBzdXBwb3J0IHVzaW5nIDItYnl0ZSBpbnN0cnVjdGlvbnMKPiAoZS5nLiwgaW4g
anVtcCBvZmZzZXQgY29tcHV0YXRpb25zKSwgdGhlbiBhZGRzIFJWQyBlbmNvZGluZyBhbmQKPiBo
ZWxwZXIgZnVuY3Rpb25zLCBhbmQgZmluYWxseSB1c2VzIHRoZSBoZWxwZXIgZnVuY3Rpb25zIHRv
IG9wdGltaXplCj4gdGhlIHJ2NjQgSklULgo+Cj4gSSB1c2VkIG91ciBmb3JtYWwgdmVyaWZpY2F0
aW9uIGZyYW1ld29yaywgU2VydmFsLCB0byB2ZXJpZnkgdGhlCj4gY29ycmVjdG5lc3Mgb2YgdGhl
IFJWQyBlbmNvZGluZ3MgYW5kIHRoZWlyIHVzZXMgaW4gdGhlIHJ2NjQgSklULgo+Cj4gVGhlIEpJ
VCBjb250aW51ZXMgdG8gcGFzcyBhbGwgdGVzdHMgaW4gbGliL3Rlc3RfYnBmLmMsIGFuZCBpbnRy
b2R1Y2VzCj4gbm8gbmV3IGZhaWx1cmVzIHRvIHRlc3RfdmVyaWZpZXI7IGJvdGggd2l0aCBhbmQg
d2l0aG91dCBSVkMgYmVpbmcgZW5hYmxlZC4KPgo+IFRoZSBmb2xsb3dpbmcgYXJlIGV4YW1wbGVz
IG9mIHRoZSBKSVRlZCBjb2RlIGZvciB0aGUgdmVyaWZpZXIgc2VsZnRlc3QKPiAiZGlyZWN0IHBh
Y2tldCByZWFkIHRlc3QjMyBmb3IgQ0dST1VQX1NLQiBPSyIsIHdpdGhvdXQgYW5kIHdpdGggUlZD
Cj4gZW5hYmxlZCwgcmVzcGVjdGl2ZWx5LiBUaGUgZm9ybWVyIHVzZXMgMTc4IGJ5dGVzLCBhbmQg
dGhlIGxhdHRlciB1c2VzIDExMiwKPiBmb3IgYSB+MzclIHJlZHVjdGlvbiBpbiBjb2RlIHNpemUg
Zm9yIHRoaXMgZXhhbXBsZS4KPgo+IFdpdGhvdXQgUlZDOgo+Cj4gICAgMDogMDIwMDA4MTMgICAg
YWRkaSAgYTYsemVybywzMgo+ICAgIDQ6IGZkMDEwMTEzICAgIGFkZGkgIHNwLHNwLC00OAo+ICAg
IDg6IDAyODEzNDIzICAgIHNkICAgIHMwLDQwKHNwKQo+ICAgIGM6IDAyOTEzMDIzICAgIHNkICAg
IHMxLDMyKHNwKQo+ICAgMTA6IDAxMjEzYzIzICAgIHNkICAgIHMyLDI0KHNwKQo+ICAgMTQ6IDAx
MzEzODIzICAgIHNkICAgIHMzLDE2KHNwKQo+ICAgMTg6IDAxNDEzNDIzICAgIHNkICAgIHM0LDgo
c3ApCj4gICAxYzogMDMwMTA0MTMgICAgYWRkaSAgczAsc3AsNDgKPiAgIDIwOiAwMzA1NjY4MyAg
ICBsd3UgICBhMyw0OChhMCkKPiAgIDI0OiAwMjA2OTY5MyAgICBzbGxpICBhMyxhMywweDIwCj4g
ICAyODogMDIwNmQ2OTMgICAgc3JsaSAgYTMsYTMsMHgyMAo+ICAgMmM6IDAzNDU2NzAzICAgIGx3
dSAgIGE0LDUyKGEwKQo+ICAgMzA6IDAyMDcxNzEzICAgIHNsbGkgIGE0LGE0LDB4MjAKPiAgIDM0
OiAwMjA3NTcxMyAgICBzcmxpICBhNCxhNCwweDIwCj4gICAzODogMDM4NTY0ODMgICAgbHd1ICAg
czEsNTYoYTApCj4gICAzYzogMDIwNDk0OTMgICAgc2xsaSAgczEsczEsMHgyMAo+ICAgNDA6IDAy
MDRkNDkzICAgIHNybGkgIHMxLHMxLDB4MjAKPiAgIDQ0OiAwM2M1NjkwMyAgICBsd3UgICBzMiw2
MChhMCkKPiAgIDQ4OiAwMjA5MTkxMyAgICBzbGxpICBzMixzMiwweDIwCj4gICA0YzogMDIwOTU5
MTMgICAgc3JsaSAgczIsczIsMHgyMAo+ICAgNTA6IDA0MDU2OTgzICAgIGx3dSAgIHMzLDY0KGEw
KQo+ICAgNTQ6IDAyMDk5OTkzICAgIHNsbGkgIHMzLHMzLDB4MjAKPiAgIDU4OiAwMjA5ZDk5MyAg
ICBzcmxpICBzMyxzMywweDIwCj4gICA1YzogMDkwNTZhMDMgICAgbHd1ICAgczQsMTQ0KGEwKQo+
ICAgNjA6IDAyMGExYTEzICAgIHNsbGkgIHM0LHM0LDB4MjAKPiAgIDY0OiAwMjBhNWExMyAgICBz
cmxpICBzNCxzNCwweDIwCj4gICA2ODogMDA5MDAzMTMgICAgYWRkaSAgdDEsemVybyw5Cj4gICA2
YzogMDA2YTc0NjMgICAgYmdldSAgczQsdDEsMHg3NAo+ICAgNzA6IDAwMDAwYTEzICAgIGFkZGkg
IHM0LHplcm8sMAo+ICAgNzQ6IDAyZDUyODIzICAgIHN3ICAgIGEzLDQ4KGEwKQo+ICAgNzg6IDAy
ZTUyYTIzICAgIHN3ICAgIGE0LDUyKGEwKQo+ICAgN2M6IDAyOTUyYzIzICAgIHN3ICAgIHMxLDU2
KGEwKQo+ICAgODA6IDAzMjUyZTIzICAgIHN3ICAgIHMyLDYwKGEwKQo+ICAgODQ6IDA1MzUyMDIz
ICAgIHN3ICAgIHMzLDY0KGEwKQo+ICAgODg6IDAwMDAwNzkzICAgIGFkZGkgIGE1LHplcm8sMAo+
ICAgOGM6IDAyODEzNDAzICAgIGxkICAgIHMwLDQwKHNwKQo+ICAgOTA6IDAyMDEzNDgzICAgIGxk
ICAgIHMxLDMyKHNwKQo+ICAgOTQ6IDAxODEzOTAzICAgIGxkICAgIHMyLDI0KHNwKQo+ICAgOTg6
IDAxMDEzOTgzICAgIGxkICAgIHMzLDE2KHNwKQo+ICAgOWM6IDAwODEzYTAzICAgIGxkICAgIHM0
LDgoc3ApCj4gICBhMDogMDMwMTAxMTMgICAgYWRkaSAgc3Asc3AsNDgKPiAgIGE0OiAwMDA3ODUx
MyAgICBhZGRpICBhMCxhNSwwCj4gICBhODogMDAwMDgwNjcgICAgamFsciAgemVybywwKHJhKQo+
Cj4gV2l0aCBSVkM6Cj4KPiAgICAwOiAgIDAyMDAwODEzICAgIGFkZGkgICAgYTYsemVybywzMgo+
ICAgIDQ6ICAgNzE3OSAgICAgICAgYy5hZGRpMTZzcCAgc3AsLTQ4Cj4gICAgNjogICBmNDIyICAg
ICAgICBjLnNkc3AgIHMwLDQwKHNwKQo+ICAgIDg6ICAgZjAyNiAgICAgICAgYy5zZHNwICBzMSwz
MihzcCkKPiAgICBhOiAgIGVjNGEgICAgICAgIGMuc2RzcCAgczIsMjQoc3ApCj4gICAgYzogICBl
ODRlICAgICAgICBjLnNkc3AgIHMzLDE2KHNwKQo+ICAgIGU6ICAgZTQ1MiAgICAgICAgYy5zZHNw
ICBzNCw4KHNwKQo+ICAgMTA6ICAgMTgwMCAgICAgICAgYy5hZGRpNHNwbiAgczAsc3AsNDgKPiAg
IDEyOiAgIDAzMDU2NjgzICAgIGx3dSAgICAgYTMsNDgoYTApCj4gICAxNjogICAxNjgyICAgICAg
ICBjLnNsbGkgIGEzLDB4MjAKPiAgIDE4OiAgIDkyODEgICAgICAgIGMuc3JsaSAgYTMsMHgyMAo+
ICAgMWE6ICAgMDM0NTY3MDMgICAgbHd1ICAgICBhNCw1MihhMCkKPiAgIDFlOiAgIDE3MDIgICAg
ICAgIGMuc2xsaSAgYTQsMHgyMAo+ICAgMjA6ICAgOTMwMSAgICAgICAgYy5zcmxpICBhNCwweDIw
Cj4gICAyMjogICAwMzg1NjQ4MyAgICBsd3UgICAgIHMxLDU2KGEwKQo+ICAgMjY6ICAgMTQ4MiAg
ICAgICAgYy5zbGxpICBzMSwweDIwCj4gICAyODogICA5MDgxICAgICAgICBjLnNybGkgIHMxLDB4
MjAKPiAgIDJhOiAgIDAzYzU2OTAzICAgIGx3dSAgICAgczIsNjAoYTApCj4gICAyZTogICAxOTAy
ICAgICAgICBjLnNsbGkgIHMyLDB4MjAKPiAgIDMwOiAgIDAyMDk1OTEzICAgIHNybGkgICAgczIs
czIsMHgyMAo+ICAgMzQ6ICAgMDQwNTY5ODMgICAgbHd1ICAgICBzMyw2NChhMCkKPiAgIDM4OiAg
IDE5ODIgICAgICAgIGMuc2xsaSAgczMsMHgyMAo+ICAgM2E6ICAgMDIwOWQ5OTMgICAgc3JsaSAg
ICBzMyxzMywweDIwCj4gICAzZTogICAwOTA1NmEwMyAgICBsd3UgICAgIHM0LDE0NChhMCkKPiAg
IDQyOiAgIDFhMDIgICAgICAgIGMuc2xsaSAgczQsMHgyMAo+ICAgNDQ6ICAgMDIwYTVhMTMgICAg
c3JsaSAgICBzNCxzNCwweDIwCj4gICA0ODogICA0MzI1ICAgICAgICBjLmxpICAgIHQxLDkKPiAg
IDRhOiAgIDAwNmE3MzYzICAgIGJnZXUgICAgczQsdDEsMHg1MAo+ICAgNGU6ICAgNGEwMSAgICAg
ICAgYy5saSAgICBzNCwwCj4gICA1MDogICBkOTE0ICAgICAgICBjLnN3ICAgIGEzLDQ4KGEwKQo+
ICAgNTI6ICAgZDk1OCAgICAgICAgYy5zdyAgICBhNCw1MihhMCkKPiAgIDU0OiAgIGRkMDQgICAg
ICAgIGMuc3cgICAgczEsNTYoYTApCj4gICA1NjogICAwMzI1MmUyMyAgICBzdyAgICAgIHMyLDYw
KGEwKQo+ICAgNWE6ICAgMDUzNTIwMjMgICAgc3cgICAgICBzMyw2NChhMCkKPiAgIDVlOiAgIDQ3
ODEgICAgICAgIGMubGkgICAgYTUsMAo+ICAgNjA6ICAgNzQyMiAgICAgICAgYy5sZHNwICBzMCw0
MChzcCkKPiAgIDYyOiAgIDc0ODIgICAgICAgIGMubGRzcCAgczEsMzIoc3ApCj4gICA2NDogICA2
OTYyICAgICAgICBjLmxkc3AgIHMyLDI0KHNwKQo+ICAgNjY6ICAgNjljMiAgICAgICAgYy5sZHNw
ICBzMywxNihzcCkKPiAgIDY4OiAgIDZhMjIgICAgICAgIGMubGRzcCAgczQsOChzcCkKPiAgIDZh
OiAgIDYxNDUgICAgICAgIGMuYWRkaTE2c3AgIHNwLDQ4Cj4gICA2YzogICA4NTNlICAgICAgICBj
Lm12ICAgIGEwLGE1Cj4gICA2ZTogICA4MDgyICAgICAgICBjLmpyICAgIHJhCj4KPiBMdWtlIE5l
bHNvbiAoMyk6Cj4gICBicGYsIHJpc2N2OiBNb2RpZnkgSklUIGN0eCB0byBzdXBwb3J0IGNvbXBy
ZXNzZWQgaW5zdHJ1Y3Rpb25zCj4gICBicGYsIHJpc2N2OiBBZGQgZW5jb2RpbmdzIGZvciBjb21w
cmVzc2VkIGluc3RydWN0aW9ucwo+ICAgYnBmLCByaXNjdjogVXNlIGNvbXByZXNzZWQgaW5zdHJ1
Y3Rpb25zIGluIHRoZSBydjY0IEpJVAo+Cj4gIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXQuaCAgICAg
ICAgfCA0OTUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0KPiAgYXJjaC9yaXNjdi9u
ZXQvYnBmX2ppdF9jb21wMzIuYyB8ICAxNCArLQo+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2Nv
bXA2NC5jIHwgMjg3ICsrKysrKysrKy0tLS0tLS0tLQo+ICBhcmNoL3Jpc2N2L25ldC9icGZfaml0
X2NvcmUuYyAgIHwgICA2ICstCj4gIDQgZmlsZXMgY2hhbmdlZCwgNjUwIGluc2VydGlvbnMoKyks
IDE1MiBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi4yNS4xCj4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
