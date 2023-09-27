Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFB5E80A9B
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z05Ci1RG/VMvd27UstBn9P4WO583KM0NCUaIl6gWTDA=; b=uBynBRGOKmTnFT
	e5klhd6jgyCiJrLiozLbJ9CFtVVeOHUx7zbNneX6wytWA5zGp7LUGw8nxU3IGym9Q8m5zdZunJwGI
	XwFb/Fve8Q0CaNCj9AJQ+tu2RRylodcrstBIWpGWhH6wfVjQvVc6cpobeDRLpY6uYSU9IWDxfJ2Di
	LAhnWz9HicLsDaZIBUDpH3cfZD12+P20qPPvdAwPOzsha834TvtQgi9sxOfQZ0SINrLyKi8Q+wrEa
	bXwAjrdbxhbGoL48GSDyQPeXJbtuO9FSEdUBJxqNjxTlmxoDahflw/M15dcZ+FvvLo0OewGkaI+Pq
	RhehJB7c4dKLIXtpNmRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOjK-0009xR-2l;
	Wed, 27 Sep 2023 07:13:06 +0000
Received: from mail-yw1-f177.google.com ([209.85.128.177])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOjI-0009wS-0U
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 07:13:06 +0000
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-59f7f46b326so70347637b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 00:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695798782; x=1696403582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+bbVFytZ41e9lUv+Wxsk6ddySSnKMOncFN3cH7+dQI=;
        b=HJ4qBI1U+75CyrwA0t37fpzzSZiNpPd9B8PPOkuY+vC1a9iyNgPRAvsGeQbhKNBmO7
         AWr+6S+YbtDjdpDeGpQvvV6+tv0iW/Rp2hYMTz2c80eRlLG7onpu2vYgmyLjijPwtTa8
         Yvd+8EDiR8bvBpyALZGrsS6eptEd4v7nqIW8FRUtyXMa/u5eioF3r0gTR6Ht1JrgvwIn
         1yAkBLCogM6EQubSknWKLdvVbgDPf9ul0jVqQOCKC2Rss9/WmSUUyP/vBPmEGyzJYDcY
         RYApLlqr/vOgJvhtO3i7YqHIKC3GdHF0wpIuvF+cDuNypXKTHF6z0AFuzszG4Yy2oBDz
         uAzQ==
X-Gm-Message-State: AOJu0Yz2OwR1NAdG+8859zpRjbjRsE7aVTv8w2AGvAnrxaXwC1TF2L5h
	Wmht3WelRXuwfdJJv7KSoAsM4SvH/8/3TQ==
X-Google-Smtp-Source: AGHT+IF4kIJm641i86fbLa1X6m3iGQK4VHTtugtjn8WfFo1NIuclqxpBpHzvux/ja1soSMVh5VV63g==
X-Received: by 2002:a0d:d587:0:b0:59f:4c52:2f5d with SMTP id x129-20020a0dd587000000b0059f4c522f5dmr1595045ywd.2.1695798781710;
        Wed, 27 Sep 2023 00:13:01 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id x184-20020a0deec1000000b005463e45458bsm3588322ywe.123.2023.09.27.00.13.00
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 00:13:00 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-59f6e6b7600so75755687b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 00:13:00 -0700 (PDT)
X-Received: by 2002:a0d:d90b:0:b0:59f:69e6:18c5 with SMTP id
 b11-20020a0dd90b000000b0059f69e618c5mr1515077ywe.11.1695798779861; Wed, 27
 Sep 2023 00:12:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
 <20230913-grumbly-rewrite-34c85539f2ed@spud> <CAMuHMdXmNCXvFj8gF0COQrvhbRuugrJN0sM_DL1vDE=4EU0bEA@mail.gmail.com>
 <ada7a449-cc23-84e2-0d7f-5b90c4f07ded@starfivetech.com>
In-Reply-To: <ada7a449-cc23-84e2-0d7f-5b90c4f07ded@starfivetech.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 Sep 2023 09:12:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVi+bCV2_mb=j0rxtpwjp-dZjfmaBC0gyStzoZbAsvQCg@mail.gmail.com>
Message-ID: <CAMuHMdVi+bCV2_mb=j0rxtpwjp-dZjfmaBC0gyStzoZbAsvQCg@mail.gmail.com>
Subject: Re: [GIT PULL 2/5] dt-bindings: power: Add power-domain header for JH7110
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor@kernel.org>, ulf.hansson@linaro.org, 
	Conor Dooley <conor.dooley@microchip.com>, arnd@arndb.de, jiajie.ho@starfivetech.com, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, robh@kernel.org, 
	walker.chen@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_001304_191766_5629DEBA 
X-CRM114-Status: GOOD (  18.64  )
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

SGkgQ2hhbmdodWFuZywKCk9uIFdlZCwgU2VwIDI3LCAyMDIzIGF0IDM6MjXigK9BTSBDaGFuZ2h1
YW5nIExpYW5nCjxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgo+IE9u
IDIwMjMvOS8yNiAxODo1NSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+ID4gT24gV2VkLCBT
ZXAgMTMsIDIwMjMgYXQgMzo1OOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4gRnJvbTogQ2hhbmdodWFuZyBMaWFuZyA8Y2hhbmdodWFuZy5saWFuZ0BzdGFy
Zml2ZXRlY2guY29tPgo+ID4+Cj4gPj4gQWRkIHBvd2VyLWRvbWFpbiBoZWFkZXIgZm9yIEpINzEx
MCBTb0MsIGl0IGNhbiB1c2UgdG8gb3BlcmF0ZSBkcGh5Cj4gPj4gcG93ZXIuCj4gPj4KPiA+PiBT
aWduZWQtb2ZmLWJ5OiBDaGFuZ2h1YW5nIExpYW5nIDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZl
dGVjaC5jb20+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4KPiA+Cj4gPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5v
dyBjb21taXQgNDFiNjZiNTRhNzJiZDc5Ngo+ID4gKCJkdC1iaW5kaW5nczogcG93ZXI6IEFkZCBw
b3dlci1kb21haW4gaGVhZGVyIGZvciBKSDcxMTAiKQo+ID4gaW4gcG1kb21haW4vbmV4dC4KPgo+
IFdoZXJlIGlzIHRoZSB3ZWJzaXRlIGxpbmsgZm9yIHRoZSBwbWRvbWFpbi9uZXh0PwoKQXMgcGVy
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjYtcmMzL3NvdXJjZS9NQUlOVEFJ
TkVSUyNMODcyOQppdCBjYW4gYmUgZm91bmQgYXQKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIv
c2NtL2xpbnV4L2tlcm5lbC9naXQvdWxmaC9saW51eC1wbS5naXQvbG9nLz9oPW5leHQKCkdye29l
dGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBV
eXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0
QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8g
am91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhh
dC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
