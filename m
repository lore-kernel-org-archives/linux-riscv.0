Return-Path: <SRS0=valo=NV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C905DC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 19:40:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90ACD208A3
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 10 Nov 2018 19:40:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n00e9xVJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1GlWzYit";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lkcl.net header.i=@lkcl.net header.b="lbKkRPD9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90ACD208A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lkcl.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=heG1qkr6ppmB2k6pdOuwTNe2PJ7uCdBxJslqgY0g0ec=; b=n00e9xVJoy7255
	clAiqsxN0Ka3Xeh94iXwoJs7Wa9HYOvJhMY/q3n4kP4xSGdlG7d+JsPfWeqFWnK+PRtcsDHkXOTgk
	RBLcBXawG6udmtkUdKrgUwafVzhYRs9ih5mbKPuoG9UhLusg6Jy7ETlEOXnW67J2HadyIRwunpsVr
	85jaZwf51O03zW0iRPJHVeDtC2nroxlctoa8DMpNEd6V7ibRWObd0g1Qc5oqz2oBAcZd5pjpSqMoM
	SPljBX9TXpCaIV9koXDv60LpxE3E3njWj11b6dKhEc9EoqEZGZIfP2kYYCOUPO3tNsau5zznxk6lz
	wptaiO4W8f6oCudMOhXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gLZ7L-000277-O9; Sat, 10 Nov 2018 19:40:27 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLZ7K-00026s-BP
 for linux-riscv@bombadil.infradead.org; Sat, 10 Nov 2018 19:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JvD6/lwvZtDm+/FJta8kXSAQQW7Cth63m5a9hKpMVg8=; b=1GlWzYitydWMbP1valiaNULKDQ
 wx9wsZ0obskXO2BvcZ9Aa1vC+2M0jpjGUjQWHDRxL/x+xqXRim0GnfPnnCV1oAsPvyaHo/tUe0f+s
 1jbYsmlJ1Be3kz0l9M4Xt3ijWOkRLvoBeBVNRFNHuDLEbibl6PYousTpNNcmSvOjHWdZ5IEcRRRTn
 6UfFG42tuUEoHk9TWdEQXfnS22ng0lekD3q/yyq2vHLirV9kJF6grWSY0vMEIN981sBeKCyQ9GSIX
 KT0hznx3HB4KwHLeIuFJareIqMZjIZiCbS1vN3QW/1ay+Ig7+rzj4i17Qys61kfhPm+028x4W+7aJ
 EGs+8aMw==;
Received: from lkcl.net ([217.147.94.29])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gLZ7H-0007eO-Nf
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 19:40:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lkcl.net;
 s=201607131; 
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version;
 bh=JvD6/lwvZtDm+/FJta8kXSAQQW7Cth63m5a9hKpMVg8=; 
 b=lbKkRPD9Z8TX8mO8dNafrTHJ9r2KuwmnDpfU5ePS98r1vOqw1wuszj3OL/RjV/eafy+UQazfqSudpCKGiziXLfXQZ0dHEKOR4eG/Drx1DniuCclnD6mh78BwRpFy/e5128ogiAF3Bi/sWBUed7muJyfQmZlilb+DZYsL7g3R8qo=;
Received: from mail-lf1-f46.google.com ([209.85.167.46])
 by lkcl.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <lkcl@lkcl.net>) id 1gLZ76-0008NJ-30
 for linux-riscv@lists.infradead.org; Sat, 10 Nov 2018 19:40:12 +0000
Received: by mail-lf1-f46.google.com with SMTP id p17so3619728lfh.4
 for <linux-riscv@lists.infradead.org>; Sat, 10 Nov 2018 11:39:56 -0800 (PST)
X-Gm-Message-State: AGRZ1gIKv+luLIfZ0uAGMQZ4De3aPPGzFSbSk98HcK/OkiO1y9wik0XL
 zsowoEVZJg/Um0Wll5GWutqaZ3PAj2UvwlrcM60=
X-Google-Smtp-Source: AJdET5emt0KqIWbtj5Mh4ypyA8TADXBYh23my7dkK77UWKnL5Kyd2ZrL41E0F8R6TrBurbIlBtpIXOTQMRkhHIb3kHM=
X-Received: by 2002:a19:e01e:: with SMTP id x30mr7677404lfg.89.1541878790708; 
 Sat, 10 Nov 2018 11:39:50 -0800 (PST)
MIME-Version: 1.0
References: <4aef7216-726c-f565-5c0f-cebd2aefb46d@wdc.com>
 <CAPweEDySAg6LCTNOKHB2Ax3tJNySi9XQzG4d1msSQQepwDi8Vw@mail.gmail.com>
 <2e5329eff04e2b0bc2433b5d974bf10f@mailhost.ics.forth.gr>
 <CAPweEDz-7oRg2UWPkvTDdfi36Z4PQLAuLdL3-Sy-kmkGEJ=44A@mail.gmail.com>
 <CAP6exYKfhtgXz4nVSwXasicbE+8ZbKwp-15_xGFHfFoK9yi9-g@mail.gmail.com>
 <CAOesGMjVFGLfqVqmsK6V88cdTxmN_CAEhDey8nxKOeTYHC69jA@mail.gmail.com>
 <CAPweEDwDApbFofs689xvPBjoqODCeMyaYQWpgo3CuqSjQjYTvw@mail.gmail.com>
 <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
In-Reply-To: <84838217ee26d70634368ef63d43427d@mailhost.ics.forth.gr>
From: Luke Kenneth Casson Leighton <lkcl@lkcl.net>
Date: Sat, 10 Nov 2018 19:39:39 +0000
X-Gmail-Original-Message-ID: <CAPweEDxzkNTGKbitReqUqpsybF3ZAZSL4StVjxfkB956gYSPcw@mail.gmail.com>
Message-ID:
 <CAPweEDxzkNTGKbitReqUqpsybF3ZAZSL4StVjxfkB956gYSPcw@mail.gmail.com>
Subject: Re: [sw-dev] SBI extension proposal v2
To: mick@ics.forth.gr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181110_144023_903357_2D1D537B 
X-CRM114-Status: GOOD (  18.07  )
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
Cc: mark.rutland@arm.com, hch@infradead.org, Damien.LeMoal@wdc.com,
 Olof Johansson <olof.johansson@gmail.com>, alankao@andestech.com,
 abner.chang@hpe.com, atish.patra@wdc.com, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Alexander Graf <agraf@suse.de>,
 zong@andestech.com, ron minnich <rminnich@gmail.com>, sw-dev@groups.riscv.org,
 paul.walmsley@sifive.com, Olof Johansson <olof@lixom.net>,
 Alistair.Francis@wdc.com, linux-riscv@lists.infradead.org,
 Andrew Waterman <andrew@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181110193939.QTYOsVh8kVRQJ1PairZ8C3DdfhXo8YMCJL2h1A2nANM@z>

LS0tCmNyb3dkLWZ1bmRlZCBlY28tY29uc2Npb3VzIGhhcmR3YXJlOiBodHRwczovL3d3dy5jcm93
ZHN1cHBseS5jb20vZW9tYTY4CgpPbiBTYXQsIE5vdiAxMCwgMjAxOCBhdCA1OjU5IFBNIE5pY2sg
S29zc2lmaWRpcyA8bWlja0BpY3MuZm9ydGguZ3I+IHdyb3RlOgo+Cj4gzqPPhM65z4IgMjAxOC0x
MS0xMCAxOTo0NywgTHVrZSBLZW5uZXRoIENhc3NvbiBMZWlnaHRvbiDOrc6zz4HOsc+IzrU6Cj4g
PiBPbiBTYXQsIE5vdiAxMCwgMjAxOCBhdCA1OjQyIFBNIE9sb2YgSm9oYW5zc29uIDxvbG9mQGxp
eG9tLm5ldD4gd3JvdGU6Cj4gPgo+ID4+IFRoZSBjYXNlIG9mIGNvbnNvbGUgaXMgaW4gdGhpcyBj
YXNlIHByZXR0eSBzaW1wbGU6IEl0J3MgaW50ZW5kZWQgZm9yCj4gPj4gZWFybHkgYm9vdCBmb3Ig
dmVyeSBzaW1wbGlzdGljIGVudmlyb25tZW50cyAoYmVmb3JlIHRoZSByZXN0IG9mIHRoZQo+ID4+
IGtlcm5lbCBpcyB1cCwgZXRjKS4gS2VlcGluZyB0aGUgU0JJIGNvbnNvbGUgYXJvdW5kIGJleW9u
ZCBlYXJseSBib290LAo+ID4+IGFuZCBzb21laG93IHRyeWluZyB0byBvcHRpbWl6ZSBmb3IgaXQg
Zm9yIHRob3NlIHVzZSBjYXNlcyBpcyBhCj4gPj4gbWlzZGlyZWN0ZWQgZWZmb3J0OyB0aGF0J3Mg
d2hhdCBuYXRpdmUgZHJpdmVycyBhcmUgZm9yLgo+ID4KPiA+ICBzcGlrZSAod2hpY2ggaXMgb25s
eSBhcm91bmQgNywwMDAgbGluZXMgb2YgY29kZSkgZG9lc24ndCBoYXZlIG5hdGl2ZQo+ID4gZHJp
dmVycywgYW5kIHFlbXUgaXMgdG9vIGhlYXZ5LWR1dHkgdG8gY29uc2lkZXIgYWRkaW5nIGN1c3Rv
bQo+ID4gZXh0ZW5zaW9ucyBhbmQgZXhwZXJpbWVudGFsIHJlc2VhcmNoIG9udG8uCj4gPgo+ID4g
IHdpdGggbm90aGluZyBpbiBzcGlrZSAqb3RoZXIqIHRoYW4gdGhlIHNlcmlhbCBjb25zb2xlLCBp
dCdzIHRoZSBvbmx5Cj4gPiB3YXkgaW4gYW5kIG91dC4KPiA+Cj4gPiAgbC4KPgo+IEFueXRoaW5n
IG1vcmUgdGhhbiBhIG1haW4vZGVidWcgY29uc29sZSBpcyB0b28gbXVjaCBmb3IgdGhlIFNCSSwg
aXRzCj4gZ29hbCBpcyB0byBiZSB1c2VkIGVhcmx5IG9uIGluIHRoZSBib290IHByb2Nlc3MgdW50
aWwgdGhlIE9TIG9yIHRoZQo+IGJhcmUgbWV0YWwgYXBwIHRha2VzIGNvbnRyb2wuCgogbm9vbywg
dGhhdCdzIGp1c3QgX29uZV8gdXNlIHRvIHdoaWNoIGl0J3MgYmVpbmcgcHV0LgoKPiBIYXZpbmcg
bXVsdGlwbGUgc2VyaWFsIGxpbmVzIHRocm91Z2gKPiB0aGUgU0JJIGZvciB0aGluZ3MgbGlrZSBQ
UFAsIFVQUywgdmlydHVhbCBjb25zb2xlcyBhbmQgYWxsIHRoZSBzdHVmZgo+IHlvdSBtZW50aW9u
ZWQgaXMgb3V0IG9mIHNjb3BlLgoKIHdoeT8KCj4gQm9vdCBhbiBPUyBhbmQgdXNlIHRoZSBzdGFu
ZGFyZCBVQVJUCj4gZHJpdmVycyBmb3IgYWNjZXNzaW5nIHRoZSBzZXJpYWwgbGluZXMuIElmIHRo
ZXJlIGFyZSBubyBkcml2ZXJzCj4gb3Igc3VwcG9ydCBvbiBzcGlrZSwgaXQncyBvcGVuIHNvdXJj
ZSAhCgogdGhpcyBpcyBhIGNvbW1vbiBtaXNjb25jZXB0aW9uIHRoYXQgImJlY2F1c2UgaXQncyBv
cGVuIHNvdXJjZSBhbnlvbmUKY2FuIGRvIHdoYXQgdGhleSB3YW50Ii4gIGNvZGUgY29zdHMgbW9u
ZXkuICBzZXJ2ZXJzIHRvIGhvc3QgY29kZSBjb3N0Cm1vbmV5LiAgYW5zd2VyaW5nIHRoZSBlbWFp
bHMgd2hlcmUgcGVvcGxlIGV4cGVjdCAiZnJlZSIgc3VwcG9ydApiZWNhdXNlIHlvdSdyZSBob3N0
aW5nIHRoZSBvbmx5IHB1YmxpYyB2ZXJzaW9uIG9mIHRoYXQgc2VydmVyIGNvc3RzCm1vbmV5LgoK
IGknbSBhbiBldGhpY2FsIGxpYnJlIGRldmVsb3BlcjogaSBjYW4ndCBnbyBmb290aW5nIHRoZSBi
aWxsIGZvciBvdGhlcgpwZW9wbGUgdG8gc3BvbmdlIG9mZiBteSBlZmZvcnRzIGFsbCB0aGUgdGlt
ZSwgaSd2ZSBoYWQgMjAgeWVhcnMgb2YKcGVvcGxlIGRvaW5nIHRoYXQgYW5kIGknbSBmKioqKipn
IHdlbGwgbm90IHB1dHRpbmcgdXAgd2l0aCBpdCBvbiB0aGlzCnByb2plY3QuCgogc28gbm8sIG1p
Y2ssIHNvcnJ5LCBub3QgYnV5aW5nIHRoZSBhcmd1bWVudCAiaXQncyBvcGVuIHNvdXJjZSIuCgps
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
