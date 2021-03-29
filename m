Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E2FFC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:56:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08EC61934
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 17:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A08EC61934
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LDS28kz/5Tz4MfLtx4vF7rsJtr0ENAsvI+MclMAkXBI=; b=nwxoMhXIRpnD7nEYL5s8e7sdx
	KjFhyiAeokfPr8k2cMPf5PqgNuyAPlk8MV2giYXhJiNfa6Z9bvTt6AsBU0wcQiVtiuaUe7t+P46fj
	MxJSlXt5GkTwdF4b9XmsGIGbxvEgRT0bG2c8/r8Ghwu/OPU8yG0Gn1NUhbXLhXqq4nD13OT4eEt+b
	MVnAEuCqfdW5wUn+iB4mo/U9qRZWKmGnSLyPKcnroo14Zt1X2yPyeRwVNeIdakVUTFNIGtIv4UL+O
	ia0C98VX3wS1ZXv6GenEMiDHBbJEFo0q1rMijjnyNBwOV87A2FlAkCo8RaLCl4cMQW0hjIgjW2pt3
	2OjeAZa5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw7i-000xRw-59; Mon, 29 Mar 2021 17:56:22 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoz2-000ZjL-Jg
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 10:18:58 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 31-20020a9d00220000b02901b64b9b50b1so11752195ota.9
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 03:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=59bVk1U3eAVs4AcTUq5Uzd81CXfJ27eB6Tb5HoqJbm8=;
 b=O7z2KPqex9OWV7rS0vW975GuYu72swPQwIu0JStsGX+5blMKnxF4JEN969+cGkQcUx
 RRAIZCaWVM6UvKRHQZPbSAZAMbND8NkoPZj/pPMFhyPbCIod4KjhS5UC4fhJK4swTo8L
 eDRakI0I851rDSdJIeBVLxdGygwSBLJYHfMkF3i8SiQEgpgJVGIKsxXFNADOE8H2fF5L
 PARIy4Jj0eTGdOO6EJ+FeENXgGnjvxDjY27eIKTOSzZaakkWxL4PBK8iEtxg00HeeAWC
 fo6/CJzNn2hlMDiGOXpFAH/LcDvVyL7OpeoE5X3fIJ7aXM/HOL+Tc4X7VUUQBJSn5354
 g8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=59bVk1U3eAVs4AcTUq5Uzd81CXfJ27eB6Tb5HoqJbm8=;
 b=f5k8U8NWbWhWfXVdgIPKVGC6GmD0NBI9szOOGObLOfNyHtg6UaDxYng14iWArMbwS9
 GBAMRG5YizBbQqBgbg5IHZfoy67T1y+oAy3CzE1W/NkrgpkarvoqX4FxAsWraJXGM+T3
 gtH/WPDz3m/afkfYk5fC4ISAIvVUtKA83U3oX08OmoqCc7QBfjgU+lh9cFRTxF2ZvkGb
 gybeVThuV6RI6fX4TbsC3QFta8Gl6igmtiZK+AEC29o5yFWU21A5BCY0FZmwvYO1H4vZ
 Mx3ma0naOJeHyAvmyKGfhBrXEjPbHFU4D1gExpZf4z8gV4X8Uy7zslflURyuqWCs9Sfl
 sC+g==
X-Gm-Message-State: AOAM533leddZVIAf1UiZoGKPA89RZEp9oqzcXJggnf1sl1KPvEZJub9J
 dPFLMGdb72iQ80xlsh5XOTa4qRSzzti+o9DbKyeJWA==
X-Google-Smtp-Source: ABdhPJzlGZ/D+OmhIRfsTVba9K6RjVylLGLXIUf2URPu2C4G3q7Koa/dAuoNoQPZI+ZZ6IltV4gHAZx065pDvYORC7g=
X-Received: by 2002:a9d:6249:: with SMTP id i9mr22150688otk.166.1617013133098; 
 Mon, 29 Mar 2021 03:18:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
 <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
 <874kgyfetu.fsf@igel.home>
In-Reply-To: <874kgyfetu.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 29 Mar 2021 18:18:42 +0800
Message-ID: <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_111856_800102_2B71C772 
X-CRM114-Status: GOOD (  13.99  )
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

T24gRnJpLCBNYXIgMjYsIDIwMjEgYXQgNToyNCBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxp
bnV4LW02OGsub3JnPiB3cm90ZToKPgo+IE9uIE3DpHIgMjYgMjAyMSwgWm9uZyBMaSB3cm90ZToK
Pgo+ID4gMS4gQm9vdCBvbiBvcGVuU1VTRS1UdW1ibGV3ZWVkLVJJU0MtVi1KZU9TLWhpZml2ZXVu
bGVhc2hlZC5yaXNjdjY0LnJhdy54ego+ID4gdy8gcGx1Z2dpbmcgZXRoZXJuZXQgY2FibGUKPiA+
ICAgLSBJdCBzZWVtcyB0aGF0IEkgZW5jb3VudGVyZWQgYSBkaWZmZXJlbnQgc2l0dWF0aW9uIHdp
dGggeW91LCBteQo+ID4gc3lzdGVtIGh1bmcgdXAgYW5kIEkgZGlkbid0IHNlZSB0aGUgYm9vdCBt
ZXNzYWdlIHlvdSBtZW50aW9uZWQgeWV0Lgo+Cj4gVGhhdCdzIGV4YWN0bHkgdGhlIGlzc3VlLiAg
VGhlIHByb2Nlc3MgaXMgc3R1Y2sgaW4gRC4KPgoKWWVzLCBJIGNvdWxkIGdldCB0aGUgbmV0d29y
ayBwcm9ibGVtIGJ5IHVzaW5nIHRoZSBkZWZjb25maWcgeW91CnByb3ZpZGVkLCB0aGUgc3lzdGVt
IGh1bmcgdXAgd2hlbiBleGVjdXRpbmcgJ2lmY29uZmlnJyBpbW1lZGlhdGVseQphZnRlciBpbnN0
YWxsaW5nIG1hY2IgZHJpdmVyIG1vZHVsZSwgdGhlIG5ldHdvcmsgY2FuIHdvcmsgYnkgb25seQpy
ZXZlcnRpbmcgdGhlIGNvbW1pdCA3MzIzNzRhMGI0NDBkOWE3OWM4NDEyZjMxOGEyNWNkMzdiYTZm
NGUyLiBCdXQgdGhlCm5ldHdvcmsgaXMgZmluZSBieSB1c2luZyB0aGUgbWFpbmxpbmUncyBkZWZj
b25maWcsIHRoaXMgaXMgYSBsaXR0bGUKYml0IHdlaXJkLCBJIHdpbGwgY2hlY2sgdGhhdCBhbmQg
dHJ5IHRvIGZpbmQgdGhlIGRpZmZlcmVuY2UuCgo+IEFuZHJlYXMuCj4KPiAtLQo+IEFuZHJlYXMg
U2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKPiBHUEcgS2V5IGZpbmdlcnByaW50ID0gNzU3
OCBFQjQ3IEQ0RTUgNEQ2OSAyNTEwICAyNTUyIERGNzMgRTc4MCBBOURBIEFFQzEKPiAiQW5kIG5v
dyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50LiIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
