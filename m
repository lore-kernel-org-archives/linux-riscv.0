Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E55C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 02:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zY92UF82LQ9po3J4GTaejmm7M3jebvhs5DDGF9GcKtg=; b=mhXvXgMqZnzE5s
	yTymeRlJECXkfJfN7xtEdLoM+kDmBprG4ii+NsJ/XLEwuHtuu2RJy7Faf0FhXmRKlQBQTCgdxCt9P
	GceOc0s5HM1fUH/mIizckLbVY06n+7PNBPVcpD2a1MIArnE/LkMbX+UuQtyfUewlezR7YnFmiTH5X
	+0q1Lx0P5dt4eKufzYRGNgTP5nwkID+IVBy93PTO13j/070X+pncZSBJWQ02iTGPxowCdqApYIK0M
	TAp9JsQWzQ+s9h+t0vqPdxKwmUzOpAxUPO9MWGW12nYBG3Ypa8JmDxeG4tDt/UANwJUWCRI2r1rIE
	JoPFpzDuKDbj2WcduihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6k47-008toD-M7; Mon, 10 Jan 2022 02:05:43 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6jrT-008ms2-E1
 for linux-riscv@lists.infradead.org; Mon, 10 Jan 2022 01:52:40 +0000
Received: by mail-lf1-x129.google.com with SMTP id g26so38976023lfv.11
 for <linux-riscv@lists.infradead.org>; Sun, 09 Jan 2022 17:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PAmvDjOQprSLqp3N1+fz5g6MUD0+lASiAhwymAYrtVM=;
 b=TTA3x5DgsSIXAhRr84LY9zUjOch1cXk659M5mY85o3HhpJCosqz035iFXGHImoBLrL
 npwUPI0VKeyoAJmeclRznjI0GNeiZkj+qn9o4d+dhkqRCe+lTj7bDxg1GfD43zm2vN7V
 4TsHxbRcnmXXNtKFVpxNOYx4np7GnFZVIL/0NwlNs6IJlWCHkWY2EvZX5BFI2+H/2dzK
 6jopjdilMadSNzvzNDfApcSD4xXc5ERIl5T2mX77GvVUJO3Et1rrk6OTinWJuu7DY7qR
 myich9mgF+4x1SRliu/WXPJW3gwZs9A0FOnziI0Gypk8jYurXTHazn0w+JudkvfyhiWL
 JUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PAmvDjOQprSLqp3N1+fz5g6MUD0+lASiAhwymAYrtVM=;
 b=EyIo2DVuucXCX6ap6H85qKkEWmZy/a/UWUISiZ4wwQqy/dqZImJAu0fK5+uC+6laWg
 esG2LbESjpdbpFLc3k38I4oBcpDMvMOR5a+OBDLrwrHEYk2R/MS9cYploFXQvUZJKflW
 SHz9/ac8Axw+vDArwULHxby1PS+aAHTE8rNXlm7O7mQla1SJsirpGUHUQ5r0ewUNA+GL
 5nfZgOozoqs0Vko4leN786h2dVIkinPbd4mOaTD6ye946Ql0qu4tZBvd/X+yjoOWfPj5
 sPF4oFojW59Rmg5Y2LnkIKtr1u4ddChw6kzFKgQ9qPhIdSt/j9MJJgCE6uWBJqCEk1Dk
 yRnA==
X-Gm-Message-State: AOAM532ZSYqV9Lg/XPgpz3Q0YEbutCXkBEo5PleDqz9THmZv5E0OxLc9
 N4k+ml2ew99U9BMjlSyD2/un4YbSHM/mgcDOMQmucg==
X-Google-Smtp-Source: ABdhPJzMPmTi/ANQ/Ww5I/fTF/P9J0QbJtUOem/3EUzfHpLTjXLP4Uu9/jvj83SJc6SXf62ESEAmBEJcZB2S/vNG0qM=
X-Received: by 2002:a05:6512:280c:: with SMTP id
 cf12mr988837lfb.5.1641779556910; 
 Sun, 09 Jan 2022 17:52:36 -0800 (PST)
MIME-Version: 1.0
References: <20220107090715.2601-1-zong.li@sifive.com>
 <20220108004514.C331AC36AE9@smtp.kernel.org>
In-Reply-To: <20220108004514.C331AC36AE9@smtp.kernel.org>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 10 Jan 2022 09:52:27 +0800
Message-ID: <CANXhq0qQO9K0j5OaB2U3jJi+4V1tcDpf9Pu+yrcqBtdZ-Q5Z1A@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
To: Stephen Boyd <sboyd@kernel.org>
Cc: lee.jones@linaro.org, linux-clk <linux-clk@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Michael Turquette <mturquette@baylibre.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220109_175239_579992_654D847A 
X-CRM114-Status: GOOD (  12.15  )
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

T24gU2F0LCBKYW4gOCwgMjAyMiBhdCA4OjQ1IEFNIFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVs
Lm9yZz4gd3JvdGU6Cj4KPiBRdW90aW5nIFpvbmcgTGkgKDIwMjItMDEtMDcgMDE6MDc6MTUpCj4g
PiBUaGlzIGNvbW1pdCByZXZlcnRzIGNvbW1pdCA0ODdkYzdiYjZhMGMgKCJjbGs6IHNpZml2ZTog
ZnU1NDAtcHJjaToKPiA+IERlY2xhcmUgc3RhdGljIGNvbnN0IHZhcmlhYmxlICdwcmNpX2Nsa19m
dTU0MCcgd2hlcmUgaXQncyB1c2VkIikuCj4gPiBGb3IgZml4aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKSBhYm91dCDigJhwcmNpX2Nsa19mdTU0MOKAmSBkZWZpbmVkCj4gPiBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0sIHRoZSBwcm9ibGVtIGlzIHRoYXQgdGhl
IEMgZmlsZQo+ID4gb2YgZnU1NDAgYW5kIGZ1NzQwIGRvZXNuJ3QgdXNlIHRoZXNlIHZhcmlhYmxl
cywgYnV0IHRoZXkgaW5jbHVkZXMgdGhlCj4gPiBoZWFkZXIgZmlsZXMuIFdlIGNvdWxkIHJlZmlu
ZSB0aGUgY29kZSBieSBtb3ZpbmcgdGhlIGRlZmluaXRpb24gb2YgdGhlc2UKPiA+IHZhcmlhYmxl
cyBpbnRvIGZ1NTQwIGFuZCBmdTc0MCBpbXBsZW1lbnRhdGlvbiByZXNwZWN0aXZlbHkgaW5zdGVh
ZCBvZgo+ID4gY29tbW9uIGNvcmUgY29kZSwgdGhlbiB3ZSBjb3VsZCBzdGlsbCBzZXBhcmF0ZSB0
aGUgU29Dcy1kZXBlbmRlbnQgZGF0YQo+ID4gaW4gdGhlaXIgb3duIGltcGxlbWVudGF0aW9uLgo+
ID4KPiA+IEZpeGVzOiA0ODdkYzdiYjZhMGMgKCJjbGs6IHNpZml2ZTogZnU1NDAtcHJjaTogRGVj
bGFyZSBzdGF0aWMKPiA+IGNvbnN0IHZhcmlhYmxlICdwcmNpX2Nsa19mdTU0MCcgd2hlcmUgaXQn
cyB1c2VkIikKPgo+IFRoZSBmaXhlcyB0YWcgc2hvdWxkIGJlIG9uIG9uZSBsaW5lLCBub3Qgc3Bs
aXQgYWNyb3NzIHR3by4KPgoKT2ssIGxldCBtZSBmaXggaXQgaW4gdGhlIHY0IHBhdGNoLiBUaGFu
a3MKCj4gPiBTaWduZWQtb2ZmLWJ5OiBab25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
