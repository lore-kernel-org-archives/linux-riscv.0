Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B1C8C48BE5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:54:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97CC8611AB
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 21:54:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97CC8611AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oxFWHPKfUQusK0XtRL1WZ2BEcVugDm99pPmlksD/HU=; b=Zug6nJkxrk3jNdfiTsP4zbXOqY
	iPL5U10c4E+sNgL8bvKWSWd3iALVC1DeuKhhJhxZhg7ewmDyJ4E5Tg925VuPtFYwaOjKJvX+QEtPe
	5inwJGs6ZnVcIPOfP2Hn0FsB9RFR7FsHEtYCNQSqBGhxHqSpgv895ScEOnowS7GTuNKZ6maKSUL//
	X/lbMRsgj4m/b0SR418Dkmn+1lCiswWM/YSQfq8Hum1/4KtfKl0NClEyF4MRLWvpBw47N/TP/IsnT
	JYD8sIk3HIeaChs8j+IXWXjt9kivLLOAMlnoNVhxHFW6j33crqidTS3SMhW4iKN85cJDJsObOTLFb
	x08NnYAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltH0o-003LXc-Ey; Tue, 15 Jun 2021 21:54:22 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltDp0-0027Xw-Cq
 for linux-riscv@lists.infradead.org; Tue, 15 Jun 2021 18:30:00 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 15FITjxo053936
 for <linux-riscv@lists.infradead.org>; Tue, 15 Jun 2021 21:29:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1623781780; x=1626373780;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m7piPkU8QBBePrBqgwf01oOS25yDfifMF3547bNitF8=;
 b=trmCRoLfNK5aSh8iDz9fLNyGINNcgrNLplrjlV/hZC9aFUe2LtUSsrgvjsQw5MQF
 OU4i3vFW+n9eoqnUj8+mprPOArbEEoX1T9yR9pcOlrg/7JKKcaBOtAT0e+b6qlyP
 t6INWvw5xZOzfii98La4qKwDetZ5hIZ/UKyBa0evo1X5U91zDtqos7fPK9ACHrJ6
 /vt7eJ+Xv1x9HdAngDuiiyPhcNF689aHrLTOpqcK36JMv1py2FEOLkR9h8l3++mJ
 x3moWxhRQZVjDlrxZtd26DvuLit6vfiFkIP3IYhPzx827j7AREZW8jfgQi+uTJwy
 De0k1Bb+yfYal3oToGyeoA==;
X-AuditID: 8b5b014d-96ef2700000067b6-cc-60c8f194994e
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 F6.54.26550.491F8C06; Tue, 15 Jun 2021 21:29:40 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Tue, 15 Jun 2021 21:29:40 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, linux-riscv
 <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 5/5] RISC-V: Add crash kernel support
Organization: FORTH
In-Reply-To: <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
References: <20210419005539.22729-1-mick@ics.forth.gr>
 <20210419005539.22729-6-mick@ics.forth.gr>
 <CAMuHMdW=23SPXwqcjD+30M_d0azdze2=ChZM-PF1brf9bCNtrA@mail.gmail.com>
Message-ID: <fe02eb618eee141e8bc021e8e30906fc@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsXSHT1dWXfKxxMJBgc2q1nMP3KO1eLZrb1M
 Fpd3zWGz2Pa5hc2i+d05douXl3uYLdpm8Vu07j3C7sDh8eblSxaPh5suMXlsWtXJ5nHocAej
 x+Yl9R6Xmq+ze3zeJBfAHsVlk5Kak1mWWqRvl8CVcfTSIuaCjbwVPTPUGhgvc3UxcnJICJhI
 XFiznrWLkYtDSOAoo8Sas7sYIRKmErP3doLZvAKCEidnPmEBsZkFLCSmXtnPCGHLSzRvnc0M
 YrMIqEq0rv8GVsMmoCkx/9JBIJuDQ0RAV2LOTyaQ+cwCc5glVk5dww5SIyxgI3FrwRGwen4B
 YYlPdy+ygticAoES11adY4M4aBWjxIIl66GOcJF4O72JDeI4FYkPvx+wgywQBbI3z1WawCg4
 C8mps5CcOgvJqQsYmVcxCiSWGetlJhfrpeUXlWTopRdtYgTHAqPvDsbbm9/qHWJk4mA8xCjB
 wawkwqtbfCJBiDclsbIqtSg/vqg0J7X4EKM0B4uSOC+v3oR4IYH0xJLU7NTUgtQimCwTB6dU
 A5NuUPCJMsGXvzcbBP166Rykd2jVu5mG6zNXfD3FsFyhhcPzw5IMgSrupYEXBdJDZe/Z3PI7
 tbVc0mtu6RxXkzlM5vvM5hllpJ/7PDPF01SE+6e2ov/6/wZaUzQ7Y3hdGp9xbm1bVJ6+4d+n
 sl1hUTdObZJTLCy9wX2h/4f+VNHSWon1W4x6Pnt4Nt7JPHSw66xIWtsJXcWqvV/CiuL/fLjA
 +Fl0i78SSzmXWtTObIE5luvrVftdsta49b98sMOTOf2R3Jov2l/MnjRJWPXrHfig6HskV3mT
 U9e7uVcLrk85to/L9NZuX4nGPU82h2SeK9oUWFXBWf3w9P+1W5f4TvAyYRDR3ePdNL3v2oV2
 GyWW4oxEQy3mouJEAHOVAVX0AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_112958_854166_E3D87330 
X-CRM114-Status: GOOD (  15.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGVsbG8gR2VlcnQsCgrOo8+EzrnPgiAyMDIxLTA2LTE1IDE2OjE5LCBHZWVydCBVeXR0ZXJob2V2
ZW4gzq3Os8+BzrHPiM61Ogo+IAo+IFRoaXMgZG9lcyBub3QgbWF0Y2gKPiBodHRwczovL2dpdGh1
Yi5jb20vZGV2aWNldHJlZS1vcmcvZHQtc2NoZW1hL2Jsb2IvbWFzdGVyL3NjaGVtYXMvY2hvc2Vu
LnlhbWwjTDc3Ogo+IAo+ICAgICAkcmVmOiB0eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50NjQt
YXJyYXkKPiAgICAgbWF4SXRlbXM6IDIKPiAgICAgZGVzY3JpcHRpb246Cj4gICAgICAgVGhpcyBw
cm9wZXJ0eSAoY3VycmVudGx5IHVzZWQgb25seSBvbiBhcm02NCkgaG9sZHMgdGhlIG1lbW9yeSAK
PiByYW5nZSwKPiAgICAgICB0aGUgYWRkcmVzcyBhbmQgdGhlIHNpemUsIG9mIHRoZSBlbGYgY29y
ZSBoZWFkZXIgd2hpY2ggbWFpbmx5IAo+IGRlc2NyaWJlcwo+ICAgICAgIHRoZSBwYW5pY2tlZCBr
ZXJuZWxcJ3MgbWVtb3J5IGxheW91dCBhcyBQVF9MT0FEIHNlZ21lbnRzIG9mIGVsZiAKPiBmb3Jt
YXQuCj4gCj4gSGVuY2UgImxpbnV4LGVsZmNvcmVoZHIiIHNob3VsZCBiZSBhIHByb3BlcnR5IG9m
IHRoZSAvY2hvc2VuIG5vZGUsCj4gaW5zdGVhZCBvZiBhIG1lbW9yeSBub2RlIHdpdGggYSBjb21w
YXRpYmxlIHZhbHVlIG9mICJsaW51eCxlbGZjb3JlaGRyIi4KPiAKClRoYXQncyBhIGJpbmRpbmcg
Zm9yIGEgcHJvcGVydHkgb24gdGhlIC9jaG9zZW4gbm9kZSwgdGhhdCBhcyB0aGUgdGV4dCAKc2F5
cyBpdCdzIGRlZmluZWQgZm9yIGFybTY0IG9ubHkgYW5kIHRoZSBjb2RlIHRoYXQgaGFuZGxlZCBp
dCB3YXMgYWxzbyAKb24gYXJtNjQuIEluc3RlYWQgdGhlIHJlc2VydmVkLXJlZ2lvbiBiaW5kaW5n
IEkgdXNlZCBpcyBhIHN0YW5kYXJkIApiaW5kaW5nLCBpZiB5b3UgZG9uJ3QgbGlrZSB0aGUgbmFt
ZSB1c2VkIGZvciB0aGUgY29tcGF0aWJsZSBzdHJpbmcgCmJlY2F1c2UgaXQgb3ZlcmxhcHMgd2l0
aCB0aGF0IHByb3BlcnR5IHdlIGNhbiBjaGFuZ2UgaXQuIEkgd2FudCB0byB1c2UgYSAKcmVzZXJ2
ZWQtcmVnaW9uIGZvciB0aGlzIGJlY2F1c2Ugd2UnbGwgaGF2ZSB0byByZXNlcnZlIGl0IGFueXdh
eSBzbyAKdXNpbmcgYSBwcm9wZXJ0eSBvbiAvY2hvc2VuIGFuZCB0aGVuIHVzaW5nIHRoYXQgcHJv
cGVydHkgdG8gcmVzZXJ2ZSB0aGUgCnJlZ2lvbiBzZWVtZWQgc3Vib3B0aW1hbC4KCj4+IHYyOgo+
PiAgKiBVc2UgbGludXgsdXNhYmxlLW1lbW9yeSBvbiAvbWVtb3J5IGluc3RlYWQgb2YgYSBuZXcg
YmluZGluZwo+IAo+IFRoaXMgcGFydCBzZWVtcyB0byBoYXZlIGJlZW4gcmVtb3ZlZCBpbiB2MyBh
bmQgbGF0ZXI/Cj4gTm90ZSB0aGF0ICJsaW51eCx1c2FibGUtbWVtb3J5LXJhbmdlIiBzaG91bGQg
YmUgYSBwcm9wZXJ0eSBvZiB0aGUKPiAvY2hvc2VuIG5vZGUsIHRvbywgY2ZyLgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9kZXZpY2V0cmVlLW9yZy9kdC1zY2hlbWEvYmxvYi9tYXN0ZXIvc2NoZW1hcy9j
aG9zZW4ueWFtbCNMODUKPiAKCk5vIHNwZWNpYWwgaGFuZGxpbmcgaXMgbmVlZGVkIHdoZW4gdXNp
bmcgbGludXgsdXNhYmxlLW1lbW9yeSBvbiAvbWVtb3J5LCAKbGltaXRpbmcgdGhlIGF2YWlsYWJs
ZSBtZW1vcnkgaXMgaGFuZGxlZCBieSBnZW5lcmljIGNvZGUgYXQgCmRyaXZlcnMvb2YvZmR0LmMK
ClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
