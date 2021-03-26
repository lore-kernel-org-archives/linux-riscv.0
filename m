Return-Path: <SRS0=uLWX=IY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A18C433C1
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 09:11:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0B461A32
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Mar 2021 09:10:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0B461A32
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MCMRRQMAldVxnpT3w5bn4r/4oUWif4MD1R3DuKpfol8=; b=GJdbAY8mjGDanvQ/jyV3CBqQ1
	3QOKGoWfi2tFsCIbuxZMc+25FpZ4bIOeVhtvxA2qC7zt87MSUB5+xPOuP6Q6kFTO14dXB0jBitFvZ
	KA4B+YDOqubi+Mf5v4FmcUqaNcW+9H6NGLLfK194q7zn1kpGX7bWF1qVU/swn2SBWpEmrFJbrNdIX
	Gks0xHLb6ijGAcoVyaKprhNAgQQ+34IZ3dj/8FPjITHDjPOLYlFyQzOP9XCkVmDVZEZ54BXrpQyIu
	m0ztvVm1sd8pnUE1AGKLHmi0eoISYpoYr12epO3FkMk4ALIOCkNMY9xn13mEt2WjO/vgevHcl6cLn
	4Z7jO0lxQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPiUO-00352Y-7O; Fri, 26 Mar 2021 09:10:44 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPiUI-00351Y-Br
 for linux-riscv@lists.infradead.org; Fri, 26 Mar 2021 09:10:41 +0000
Received: by mail-oi1-x22f.google.com with SMTP id a8so5028663oic.11
 for <linux-riscv@lists.infradead.org>; Fri, 26 Mar 2021 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4p7L0r2YVzvHUiWBzaSDayxmY/547g3xQbzU3O52T2E=;
 b=K//qQBOSq6LUJ/Ks7l0mrUPHs53l2Y1cWYTAx32Gr87z72QyvxSgd8n/3wdyZwBa9Y
 VJJFuBtSJQ2V34IWaPS9wqqDQJJKuwfWRH91wAzYmwMZOPX8SGtMk6qwguBjJ61lwP2b
 iLaoblkPZMm8b2E2yJvXXGHFj71px91XW31LHTtueSJ1lX4gcK/8Zr7Y+DYlXDtg9Eml
 igyHDBGqetdlCtKl9jiSRUCIomfnb1f9aMiqseOUPPlUE5mAtBD53/D8A++mRhTkyRdt
 WPYwhuFyxorKD3YQ5b+q4dVGIaFbHZ4sjTo5ELKGsWEO3mSmAWfPVZ+2ZNK09l9LovFX
 ZEog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4p7L0r2YVzvHUiWBzaSDayxmY/547g3xQbzU3O52T2E=;
 b=TUM+8MmF7Hv0sfaGhLkes/XfDC7kbXPNpcaXyChxjH3Y6X2COq9P0NBoetGOryrDID
 ar1bLBo2lMN4An9xagKJ9J9LkusBsybRBpMJfu3cUQ8DBlWj5Y8DjNFeYajzlZiHf9Jd
 xsn+6I56ZWGADHSfHkc878RmDatyg+IKEh9JANZWSzki8lIgrFVSrony6AoQ7p7+aD7X
 U13ezMy5jFVij3fHOMZnJ8BC0i+AzKqaOqQktpjisJzOFS2VIYMf5ayE8B214CsLvag2
 UPHlc/p12W/5+ecycnhgymrIfnuOD+NVe4DMZrP2JrVnKRGb0Mlt3qivrkodTyJidzFZ
 j0iA==
X-Gm-Message-State: AOAM530BQ0xBgJykXV9Fpk7MZUNgoxUeLH936ESARrtQoOtN4vgKHfZH
 xAXnsyalJnnhlXK/TAURy7DswCJpUZngvp1cZMEfCw==
X-Google-Smtp-Source: ABdhPJzWYUEN40+bsyYL88YYVQP5NXJtFRzbznOQwcflZtD04abopFLejxa8uvUREgVwa5kx1YHlguTbvtlVwiiZfJM=
X-Received: by 2002:aca:1c02:: with SMTP id c2mr8944699oic.31.1616749836344;
 Fri, 26 Mar 2021 02:10:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201209094916.17383-1-zong.li@sifive.com>
 <87v99qyjaz.fsf@igel.home>
 <CANXhq0oLxFK1431WmTj5HRO5k_omYkQZCBTG+HORTk9=W_XyNg@mail.gmail.com>
 <CANXhq0p90Cgha_zLzxamK9mxmVPn3effh_cZq_CTLrcAkKZg2Q@mail.gmail.com>
 <87lfaj7cki.fsf@igel.home> <871rc4on36.fsf@igel.home>
 <CANXhq0pDge0BPgAjoLrX7Y2qtofb3dhV1_CPHBaCg0o4cEMrbQ@mail.gmail.com>
 <87a6qrk2pw.fsf@igel.home>
In-Reply-To: <87a6qrk2pw.fsf@igel.home>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 26 Mar 2021 17:10:24 +0800
Message-ID: <CANXhq0rOeAWnRYHAYKJfDeY4kYz6+5mU_dJSqU67+2p9u0STHQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Andreas Schwab <schwab@linux-m68k.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Stephen Boyd <sboyd@kernel.org>, Pragnesh Patel <pragnesh.patel@openfive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Michael Turquette <mturquette@baylibre.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_091038_550007_9236ABA3 
X-CRM114-Status: GOOD (  14.97  )
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

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgNToyMiBQTSBBbmRyZWFzIFNjaHdhYiA8c2Nod2FiQGxp
bnV4LW02OGsub3JnPiB3cm90ZToKPgo+IE9uIE3DpHIgMjUgMjAyMSwgWm9uZyBMaSB3cm90ZToK
Pgo+ID4gdGFrZSBhIGxvb2sgYXQgdGhpcyBhZ2Fpbi4gQ291bGQgeW91IGFsc28gbGV0IG1lIGtu
b3cgd2hpY2ggYm9vdGxvYWRlcgo+ID4geW91IHVzZWQgKEZTQkwgb3IgVS1ib290LVNQTCk/IFRo
YW5rcy4KPgo+IFUtQm9vdCBTUEwKPgo+IFBsZWFzZSB0cnkgdGhpcyBpbWFnZToKPgo+IGh0dHA6
Ly9kb3dubG9hZC5vcGVuc3VzZS5vcmcvcG9ydHMvcmlzY3YvdHVtYmxld2VlZC9pbWFnZXMvb3Bl
blNVU0UtVHVtYmxld2VlZC1SSVNDLVYtSmVPUy1oaWZpdmV1bmxlYXNoZWQucmlzY3Y2NC5yYXcu
eHoKPgoKSGkgQW5kcmVhcywKClRoZSBmb2xsb3dpbmcgaXMgdGhlIHJlc3VsdCBvZiB0aGUgdGVz
dCBzbyBmYXIuIEkgd291bGQgY29udGludWUgdG8Kc2VlIHdoYXQgaGFwcGVuZWQgdGhlcmUuCgox
LiBCb290IG9uIG9wZW5TVVNFLVR1bWJsZXdlZWQtUklTQy1WLUplT1MtaGlmaXZldW5sZWFzaGVk
LnJpc2N2NjQucmF3Lnh6CncvIHBsdWdnaW5nIGV0aGVybmV0IGNhYmxlCiAgLSBJdCBzZWVtcyB0
aGF0IEkgZW5jb3VudGVyZWQgYSBkaWZmZXJlbnQgc2l0dWF0aW9uIHdpdGggeW91LCBteQpzeXN0
ZW0gaHVuZyB1cCBhbmQgSSBkaWRuJ3Qgc2VlIHRoZSBib290IG1lc3NhZ2UgeW91IG1lbnRpb25l
ZCB5ZXQuCgpbICBPSyAgXSBGaW5pc2hlZCBHZW5lcmF0ZSBpc3N1ZSBmaWxlIGZvciBsb2dpbiBz
ZXNzaW9uLgpbICBPSyAgXSBGaW5pc2hlZCBBcHBseSBzZXR0aW5ncyBmcm9tIC9ldGMvc3lzY29u
ZmlnL2tleWJvYXJkLgpbICBPSyAgXSBTdGFydGVkIFVzZXIgTG9naW4gTWFuYWdlbWVudC4KWyAg
KioqIF0gKDMgb2YgMykgQSBzdGFydCBqb2IgaXMgcnVubmluZyBmb3LigKZ1cHBsaWNhbnQgc2Vy
dmljZSAoNThzIC8gMW1pbiA1MXMpClsqKiAgICBdICgzIG9mIDMpIEEgc3RhcnQgam9iIGlzIHJ1
bm5pbmcgZm9y4oCmY2FudCBzZXJ2aWNlICgxbWluIDI4cyAvIDFtaW4gNTFzKQpbICAgKioqXSAo
MiBvZiAzKSBBIHN0YXJ0IGpvYiBpcyBydW5uaW5nIGZvcuKApmNhbnQgc2VydmljZSAoMW1pbiA1
OHMgLyAzbWluIDIxcykKWyAgICoqKl0gKDEgb2YgMykgQSBzdGFydCBqb2IgaXMgcnVubmluZyBm
b3LigKZjYW50IHNlcnZpY2UgKDJtaW4gMjhzIC8gM21pbiAyMXMpClsqKiAgICBdICgzIG9mIDMp
IEEgc3RhcnQgam9iIGlzIHJ1bm5pbmcgZm9y4oCmY2FudCBzZXJ2aWNlICgybWluIDU4cyAvIDNt
aW4gMjFzKQpbICoqKiAgXSAoMiBvZiAzKSBBIHN0YXJ0IGpvYiBpcyBydW5uaW5nIGZvcuKApmNh
bnQgc2VydmljZSAoM21pbiAyOHMgLyA0bWluIDUxcykKWyAgICAgKl0gKDEgb2YgMykgQSBzdGFy
dCBqb2IgaXMgcnVubmluZyBmb3LigKZjYW50IHNlcnZpY2UgKDNtaW4gNThzIC8gNG1pbiA1MXMp
ClsgKioqICBdICgzIG9mIDMpIEEgc3RhcnQgam9iIGlzIHJ1bm5pbmcgZm9y4oCmY2FudCBzZXJ2
aWNlICg0bWluIDI4cyAvIDRtaW4gNTFzKQpbKioqICAgXSAoMiBvZiAzKSBBIHN0YXJ0IGpvYiBp
cyBydW5uaW5nIGZvcuKApmNhbnQgc2VydmljZSAoNG1pbiA1OXMgLyA2bWluIDIycykKWyAgICAq
Kl0gKDEgb2YgMykgQSBzdGFydCBqb2IgaXMgcnVubmluZyBmb3LigKZjYW50IHNlcnZpY2UgKDVt
aW4gMjlzIC8gNm1pbiAyMnMpClsgICoqKiBdICgzIG9mIDMpIEEgc3RhcnQgam9iIGlzIHJ1bm5p
bmcgZm9y4oCmY2FudCBzZXJ2aWNlICg1bWluIDU5cyAvIDZtaW4gMjJzKQpbKiAgICAgXSAoMiBv
ZiAzKSBBIHN0YXJ0IGpvYiBpcyBydW5uaW5nIGZvcuKApmNhbnQgc2VydmljZSAoNm1pbiAyOXMg
LyA3bWluIDUycykKWyAgKioqIF0gKDEgb2YgMykgQSBzdGFydCBqb2IgaXMgcnVubmluZyBmb3Li
gKZjYW50IHNlcnZpY2UgKDZtaW4gNTlzIC8gN21pbiA1MnMpClsgICAgKipdICgzIG9mIDMpIEEg
c3RhcnQgam9iIGlzIHJ1bm5pbmcgZm9y4oCmY2FudCBzZXJ2aWNlICg3bWluIDI5cyAvIDdtaW4g
NTJzKQpbRkFJTEVEXSBGYWlsZWQgdG8gc3RhcnQgd2lja2VkIEF1dG9JUHY0IHN1cHBsaWNhbnQg
c2VydmljZS4KU2VlICdzeXN0ZW1jdGwgc3RhdHVzIHdpY2tlZGQtYXV0bzQuc2VydmljZScgZm9y
IGRldGFpbHMuCltGQUlMRURdIEZhaWxlZCB0byBzdGFydCB3aWNrZWQgREhDUHY0IHN1cHBsaWNh
bnQgc2VydmljZS4KU2VlICdzeXN0ZW1jdGwgc3RhdHVzIHdpY2tlZGQtZGhjcDQuc2VydmljZScg
Zm9yIGRldGFpbHMuCltGQUlMRURdIEZhaWxlZCB0byBzdGFydCB3aWNrZWQgREhDUHY2IHN1cHBs
aWNhbnQgc2VydmljZS4KU2VlICdzeXN0ZW1jdGwgc3RhdHVzIHdpY2tlZGQtZGhjcDYuc2Vydmlj
ZScgZm9yIGRldGFpbHMuCiAgICAgICAgIFN0YXJ0aW5nIHdpY2tlZCBuZXR3b3JrIG1hbmFnZW1l
bnQgc2VydmljZSBkYWVtb24uLi4KWyAgICAqKl0gQSBzdGFydCBqb2IgaXMgcnVubmluZyBmb3Ig
d2lja2VkIG7igKZydmljZSBkYWVtb24gKDdtaW4gNTlzIC8gOW1pbiAyMnMpClsqKiogICBdIEEg
c3RhcnQgam9iIGlzIHJ1bm5pbmcgZm9yIHdpY2tlZCBu4oCmcnZpY2UgZGFlbW9uICg4bWluIDI5
cyAvIDltaW4gMjJzKQpbICA2MDMuMzY0OTg4XSBCVUc6IHdvcmtxdWV1ZSBsb2NrdXAgLSBwb29s
IGNwdXM9MSBub2RlPTAgZmxhZ3M9MHgwCm5pY2U9MCBzdHVjayBmb3IgMzZzIQpbKioqICAgXSBB
IHN0YXJ0IGpvYiBpcyBydW5uaW5nIGZvciB3aWNrZWQgbuKApnJ2aWNlIGRhZW1vbiAoOG1pbiA1
OXMgLyA5bWluIDIycykKWyAgNjMzLjQ0NDk4Nl0gQlVHOiB3b3JrcXVldWUgbG9ja3VwIC0gcG9v
bCBjcHVzPTEgbm9kZT0wIGZsYWdzPTB4MApuaWNlPTAgc3R1Y2sgZm9yIDY2cyEKICAgICAgICAg
U3RvcHBpbmcgRmx1c2ggSm91cm5hbCB0byBQZXJzaXN0ZW50IFN0b3JhZ2UuLi4KWyAgT0sgIF0g
U3RvcHBlZCBGbHVzaCBKb3VybmFsIHRvIFBlcnNpc3RlbnQgU3RvcmFnZS4KWyAgT0sgIF0gU3Rv
cHBlZCBKb3VybmFsIFNlcnZpY2UuCgoKMi4gQm9vdCBvbiBrZXJuZWwgaW1hZ2Ugd2hpY2ggYnVp
bHQgYnkgb3BlbnN1c2UgZGVmY29uZmlnIHdpdGgKY2hhbmdpbmcgQ09ORklHX01BQ0IgdG8geSBp
bnN0ZWFkIG9mIG0KIC0gQWx0aG91Z2ggSSBnb3Qgc29tZSBwcm9ibGVtIGZvciBtb3VudGluZyB0
aGUgcm9vdCBmaWxlc3lzdGVtIG9uCnRoaXMgaW1hZ2Ugbm93LCBidXQgSSBkaWRuJ3QgaGFuZyB1
cCBhdCB0aGUgbWVzc2FnZSB5b3UgbWVudGlvbmVkLCBJCmNvdWxkIGdvIHRocm91Z2ggYWZ0ZXIg
bWFjYiBkcml2ZXIgaW5pdGlhbGl6YXRpb24KClsgICAgMi4zNTAzMDldIGxpYnBoeTogRml4ZWQg
TURJTyBCdXM6IHByb2JlZApbICAgIDIuMzU0NDc2XSBtYWNiIDEwMDkwMDAwLmV0aGVybmV0OiBS
ZWdpc3RlcmVkIGNsayBzd2l0Y2gKJ3NpZml2ZS1nZW1neGwtbWdtdCcKWyAgICAyLjM1ODc1Ml0g
bWFjYiAxMDA5MDAwMC5ldGhlcm5ldDogR0VNIGRvZXNuJ3Qgc3VwcG9ydCBoYXJkd2FyZSBwdHAu
ClsgICAgMi4zNjE0NjRdIGxpYnBoeTogTUFDQl9taWlfYnVzOiBwcm9iZWQKWyAgICAyLjM2NjI4
OV0gbWFjYiAxMDA5MDAwMC5ldGhlcm5ldCBldGgwOiBDYWRlbmNlIEdFTSByZXYgMHgxMDA3MDEw
OQphdCAweDEwMDkwMDAwIGlycSAxNiAoNzA6YjM6ZDU6OTI6ZjI6NmMpClsgICAgMi4zNzU1NzBd
IGUxMDAwZTogSW50ZWwoUikgUFJPLzEwMDAgTmV0d29yayBEcml2ZXIKWyAgICAyLjM4MDMyM10g
ZTEwMDBlOiBDb3B5cmlnaHQoYykgMTk5OSAtIDIwMTUgSW50ZWwgQ29ycG9yYXRpb24uClsgICAg
Mi4zODYzMzhdIGVoY2lfaGNkOiBVU0IgMi4wICdFbmhhbmNlZCcgSG9zdCBDb250cm9sbGVyIChF
SENJKSBEcml2ZXIKLi4uClsgICAgMi42ODc0NDddIFdhaXRpbmcgZm9yIHJvb3QgZGV2aWNlIC9k
ZXYvbW1jYmxrMHA0Li4uCgozLiBJIGNoZWNrIHRoZSBwYXRjaCBzZXQgb2Ygc3VwcG9ydGluZyBm
dTc0MCwgaXQgc2hvdWxkbid0IGltcGFjdApmdTU0MCwgSSdtIGdvaW5nIHRvIGR1bXAgYW5kIGNv
bXBhcmluZyB0aGUgcHJjaSBjb250ZW50IGFuZCBnaXZlIG1vcmUKdGVzdGluZy4KCgo+IEFuZHJl
YXMuCj4KPiAtLQo+IEFuZHJlYXMgU2Nod2FiLCBzY2h3YWJAbGludXgtbTY4ay5vcmcKPiBHUEcg
S2V5IGZpbmdlcnByaW50ID0gNzU3OCBFQjQ3IEQ0RTUgNEQ2OSAyNTEwICAyNTUyIERGNzMgRTc4
MCBBOURBIEFFQzEKPiAiQW5kIG5vdyBmb3Igc29tZXRoaW5nIGNvbXBsZXRlbHkgZGlmZmVyZW50
LiIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
