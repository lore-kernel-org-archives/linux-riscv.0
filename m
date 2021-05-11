Return-Path: <SRS0=YITu=KG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F57AC433B4
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 12:26:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D0D6134F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 May 2021 12:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84D0D6134F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+3JsXRa2fNqjJddYNbbKb/+KaEq/VJxVGzpwIxqAeYY=; b=X3ZdxHKqvG0F/pE1HFVT/bV0F
	yBdjWb2ViMUTfgMMRERt8uikXJS8wtvK0ZZT6FOalRdhH6K6V4PwQQSwcKI6mF49fCSyTBrJWl1Qb
	may41RHJ7p7Th8RH8QVTpPeH4agLh/TKAIyjKVyp3BtqU/Xa06SkSqBeT/sv+W6wGWUx2PVVyFVvs
	UQCWs2B7YUwKWlnpWpQjzMrwMHaGjo2jGxiGWdsN424Q8EdA/N6x7dIJ6Dih2+iTtJe5EJ0k1ngVX
	MzkigStBW3ggNa1uVv5WzQ7Zs12u9r+K2lbTDQcqoRFBqIjbFTfQIsbNW92y6NOemO+iUUaNhehGb
	kNX095G8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRSf-00HNSI-Kj; Tue, 11 May 2021 12:26:05 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOCz-00Gdlg-Dg
 for linux-riscv@desiato.infradead.org; Tue, 11 May 2021 08:57:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=2GM5UN9N24TQvJTRoFkZQ64/JJ8nZjyWhhkhtInsOWQ=; b=M+DZ89di488w7dO3bZKTieOMUh
 tbfxsFEToc0FB6aoQz6XP4nw4Ws8perAjP3tcEeN46RjojL87sIvNzTuBGm6y8WDsrZ1dw2+h58Pb
 Yvm9+9r4mK8DSPWfTeOMwOgBnltJ2Qb1kKRF10kVL6LNvuDqO8VmhoEhFQ3D24kNNiutAr+Ky5Oso
 DNlfv+P41tN4wQMh+q6weokAaw9S9M3UXZYmT/s39EnehhL9QgL7Gl8lIETeGI9vvqLyBcN0iatyP
 Rbxf1XJmGlIpk+UWp55iJ6kFXkU5s/C5vvTn+0yRXywx93zOx2EE4XTPTfQoLpNjpiv3KtZakU5BB
 ejCMb+Ng==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgOCv-009Pis-RQ
 for linux-riscv@lists.infradead.org; Tue, 11 May 2021 08:57:39 +0000
Received: by mail-oi1-x22f.google.com with SMTP id z3so17167800oib.5
 for <linux-riscv@lists.infradead.org>; Tue, 11 May 2021 01:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2GM5UN9N24TQvJTRoFkZQ64/JJ8nZjyWhhkhtInsOWQ=;
 b=phW4jI5FWU5J/1V4aHBF/X5nVB8sHBgZgsExEgakm52L4Lx/1PZhKqOMItQKwLhEXz
 olyE1J3ovC/tCl4FjkFsH/J0IJ47FBTp1UISEHGW4jrOEfLqGjFeqwYhao2nF5xnQ5Q9
 FDjQIdUnEo/0oCxR5Jilb+lZJvVE3cO22LbvWE2kynxNQhbsLbqFWksnvw0eHCHlhzQU
 e5qGA60wKUTJPs5aLYdmgKeBFaNs8GxnyHJ6bmUW6whJQy8/YEZyInubYE8ak1frkX3Q
 3htpy1+uK/2QwCMmhc2YTl1/XWL2ZtHIXyYESQ02AF2uyHIYahtHV1xfNLF/7w2Q5V0Z
 J/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2GM5UN9N24TQvJTRoFkZQ64/JJ8nZjyWhhkhtInsOWQ=;
 b=joUwr9n4aGfMFyOu7KV3nqiiLufklGFvk9Waop/0EfoP6LahDKlG2a8ycS63UR2wg7
 nHC4D2GWAVWRkWTbh3exbUHi0qmpfC32UoG/DZGEW5hoLCaBWq997B6O1L3BUynxsIoU
 CbOI4U1tpYfGHf7XqV6zyp7zA+YJM5z7xYvDyOfGH/x7iuq72W/bDJAKWWNKPuyL/UYT
 UKcJNQDcILbo9mq17s+z8P6+nfcsfitFZ79pw/WcH6p8He4C12/RvxkQdxEVegtaXhEB
 Z2/MqRScYc9AwsYvGphkqxYuLLUyUp3AdE3qX7Oum/dYgwLdV9JFpupoAcbh/IjN2v9q
 JIEQ==
X-Gm-Message-State: AOAM531P2GEq3UrRjjj9wAq985twVGogEHSbPEjo75SPKefRofI+2469
 ycNvGyMEgJXaqM64ZfmFCKj+v5VqzL4bUwftzyU=
X-Google-Smtp-Source: ABdhPJx/vyly/xsGQfudk5VwYktpK3p0PqF9PqTV+9LnINR2W7IrCsW//tJAUqYRTaZs0E6G3NwJIrtoJkRS1IdAsk0=
X-Received: by 2002:aca:c30f:: with SMTP id t15mr21358226oif.145.1620723456379; 
 Tue, 11 May 2021 01:57:36 -0700 (PDT)
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
 <CANXhq0rE-ZcPBp02Pvozpk_s-j6NhxHUmso75uz6ji9bejO8gA@mail.gmail.com>
 <87h7kukzy4.fsf@igel.home>
 <CANXhq0r5_xhFu3W9mUFkp_7BYUVBzvHZE1A6jpBDcL_KwTc1cA@mail.gmail.com>
 <87tuob7n8g.fsf@igel.home>
 <CANXhq0rTC8grpRe_Q0vG6_52b-41OuN4vHum8RvouMbE6xiXpQ@mail.gmail.com>
In-Reply-To: <CANXhq0rTC8grpRe_Q0vG6_52b-41OuN4vHum8RvouMbE6xiXpQ@mail.gmail.com>
From: Yixun Lan <yixun.lan@gmail.com>
Date: Tue, 11 May 2021 08:53:58 +0000
Message-ID: <CALecT5jQ7_-d7j+MXrG++Bnr_wYmbWgCK20Ju5Pgjbu9xmwQBA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] clk: add driver for the SiFive FU740
To: Zong Li <zong.li@sifive.com>
Cc: Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Stephen Boyd <sboyd@kernel.org>, 
 Pragnesh Patel <pragnesh.patel@openfive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Michael Turquette <mturquette@baylibre.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_015737_920822_55406A18 
X-CRM114-Status: GOOD (  14.80  )
/bin/ln: failed to access
 'reaver_cache/texts/20210511_015737_920822_55406A18': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_015737_920822_55406A18 
X-CRM114-Status: GOOD (  11.35  )
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

T24gV2VkLCBBcHIgMTQsIDIwMjEgYXQgMjoyNSBQTSBab25nIExpIDx6b25nLmxpQHNpZml2ZS5j
b20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgNzozMSBQTSBBbmRyZWFzIFNj
aHdhYiA8c2Nod2FiQGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+Cj4gPiBPbiBNw6RyIDMxIDIw
MjEsIFpvbmcgTGkgd3JvdGU6Cj4gPgo+ID4gPiBJIGZvdW5kIHRoYXQgdGhlIGdlbWd4bHBsbCB3
YXMgZGlzYWJsZWQgaW1tZWRpYXRlbHkgYnkgcG93ZXIKPiA+ID4gbWFuYWdlbWVudCBhZnRlciBt
YWNiIGRyaXZlciBpbnN0YWxsLiBUaGUgbWFpbmxpbmUncyBkZWZjb25maWcgZG9lc24ndAo+ID4g
PiBlbmFibGUgQ09ORklHX1BNLCBzbyB0aGUgbmV0d29yayBpcyBmaW5lIG9uIGl0LiBUaGUgb3Bl
bnN1c2UgZGVmY29uZmlnCj4gPiA+IGVuYWJsZXMgQ09ORklHX1BNLCBhbmQgdGhlIHBhdGNoCj4g
PiA+IDczMjM3NGEwYjQ0MGQ5YTc5Yzg0MTJmMzE4YTI1Y2QzN2JhNmY0ZTIgYWRkZWQgdGhlIGVu
YWJsZS9kaXNhYmxlCj4gPiA+IGNhbGxiYWNrIGZ1bmN0aW9ucywgc28gdGhlIGdlbWd4bHBsbCBQ
TEwsIEkgaGF2ZSBubyBpZGVhIHdoeSBwb3dlcgo+ID4gPiBtYW5hZ2VtZW50IGRpc2FibGUgaXQs
IEkgd291bGQga2VlcCB0cmFjZSBpdC4KPiA+Cj4gPiBEb2VzIHRoYXQgbWVhbiB0aGF0IENPTkZJ
R19QTSBhbHNvIGFmZmVjdHMgdGhlIEZVNzQwPwo+ID4KPgo+IFllcywgd2UgZ290IHRoZSBzYW1l
IHByb2JsZW0gb24gdGhlIEZVNzQwLiBXZSBhcmUgY2hlY2tpbmcgdGhlIGlzc3VlLgo+Ckp1c3Qg
YSBtaWxkIHBpbmcsIGFueSBwcm9ncmVzcyByZWdhcmRpbmcgdGhpcyBpc3N1ZT8KCll4dW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
