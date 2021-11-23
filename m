Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50F23C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Nov 2021 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LQEjYKKrh9SRgl6SXYG//J4OyB0qb9JhoYoCK5D2atQ=; b=RIibb0AimpVPjv
	77+c+B0DU3wgTGUZimuYbd/kxVHjc9zKSd0vueg4GufYeDALpT99y5GO+Cuzy766EsGei28ewpMfy
	eY8H509AokIDFmb43m/k+B3gum4GdNXI6XEVA3dsxIqNtvtxqliYs1xcSW3njpdCFR5++VCc3SNi6
	FKuXWsOLh94vG6aGFJdkyovcS3Sh9Zqhm/rrIZuG5LzaFipzlroSTF0t7crTZ5D2N2LgbAAG4pGlV
	N7OFIMCBZDO07qYEt/5d3c2RlvZYT/DGwsFIU/2CT6ZYvbf7gHTEAy4KSH7qFc+mlp3JdycR/45Ww
	bQF7QXTlgbeSmSTExEMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpUN1-001xKq-VP; Tue, 23 Nov 2021 11:53:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpUMy-001xJJ-Qj
 for linux-riscv@lists.infradead.org; Tue, 23 Nov 2021 11:53:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so1965023wmj.5
 for <linux-riscv@lists.infradead.org>; Tue, 23 Nov 2021 03:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7HCsn3LauvYlw254i5JEp6W9ePQ2LHc/IwCYYFyUPzE=;
 b=TNu6s/w6vt+7IaJeXayLbrq/RXSMlbuqU8t6TjBqQqZkNPDA4qjccqKSdKXMH54Kso
 E7eQwiSGUSG2CHSa31AcKRX4NnBkkmNT0PfEaxVSE+/ETEwcrpogoQeXH1esnxonox8N
 wlYAkcWix/a/Jr4vru+C+4rH46GsjV7b4uvULoxT7pyuzrJ2iJU6s2ryT6T4is6yxaJm
 +hXu5KBeK0yPB5T8IG5WdbBTD7ComXerL+DFtEurTdrcTNd+6mpv4VWxrFXX0wfWLEDN
 sxSgFQjaoI7LmvZiKdLvDI/vK1OmpvF6CCWtKrMRzM4aCHg+EY6llXVXsuzGkiGgLsCF
 QoWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=7HCsn3LauvYlw254i5JEp6W9ePQ2LHc/IwCYYFyUPzE=;
 b=OfXcucowmqjEEi4x+GHTOgBxQ6S2SZbcXV5GrsRdh4DP15/Sa7o7OOpAjlBWR878mi
 R+VVvgTsVx7p/nO8E9XEno5PMTJj5lsKSwsk7900RUfeFQQtzUBwAScKtVrGMEMhss5g
 xSFN/ewyMEl4DBupV2wZxvSJ5y/uM2fVijaaa/BgCPQJecJFamlDBLYknJJvDDJwK2sW
 vhW2NWo6TTDfHKNTon7UyMG84kr/pM86AumKL0JFNR88NPq126u6Jc8k+WwMulfbqKIh
 rzGYuVSV8dfjo7rVN1DFIYzB348ehLkmycSBZTCSxt4EHAzoLvqfJSm6HIJKQklVPDS4
 dHuA==
X-Gm-Message-State: AOAM531P4XdDoXmsrhrmW0+zdiMktTMS90EnZOQrKCmcaHbksgEjQu+E
 sdQAy1u67ZiYHH7CtvcGmQsbTg==
X-Google-Smtp-Source: ABdhPJwUJgOXWF/109whZMvPubj9tHLlQt7cpbmmCDcfE/tpcF9iYKuPT590KGCJoe/xH4JtcjO65A==
X-Received: by 2002:a05:600c:22d0:: with SMTP id
 16mr2343747wmg.37.1637668429367; 
 Tue, 23 Nov 2021 03:53:49 -0800 (PST)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id d9sm11550737wre.52.2021.11.23.03.53.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 23 Nov 2021 03:53:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [RFC PATCH 2/3] riscv: Add early_param to decrease firmware region
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <CAAhSdy0LLu4o6uOB8t_Wv6jsOrrrSMx0pv1E1B5F679gan3i6g@mail.gmail.com>
Date: Tue, 23 Nov 2021 11:53:48 +0000
Cc: Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 atishp@rivosinc.com,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup.patel@wdc.com>,
 Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Alexandre Ghiti <alex@ghiti.fr>
Message-Id: <07AD2CEA-3C9B-48FA-8E67-3B60448A08F0@jrtc27.com>
References: <20211123015717.542631-1-guoren@kernel.org>
 <20211123015717.542631-3-guoren@kernel.org>
 <CAAhSdy0LLu4o6uOB8t_Wv6jsOrrrSMx0pv1E1B5F679gan3i6g@mail.gmail.com>
To: Anup Patel <anup@brainfault.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_035352_925132_20689183 
X-CRM114-Status: GOOD (  23.34  )
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

T24gMjMgTm92IDIwMjEsIGF0IDAzOjQ0LCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3Jn
PiB3cm90ZToKPiAKPiArQWxleAo+IAo+IE9uIFR1ZSwgTm92IDIzLCAyMDIxIGF0IDc6MjcgQU0g
PGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPj4gCj4+IEZyb206IEd1byBSZW4gPGd1b3JlbkBs
aW51eC5hbGliYWJhLmNvbT4KPj4gCj4+IFVzaW5nIHJpc2N2LmZ3X3NpemUgaW4gY21kbGluZSB0
byB0ZWxsIHRoZSBrZXJuZWwgd2hhdCB0aGUKPj4gZmlybXdhcmUgKG9wZW5zYmkpIHNpemUgaXMu
IFRoZW4gcmVzZXJ2ZSB0aGUgcHJvcGVyIHNpemUgb2YKPj4gZmlybXdhcmUgdG8gc2F2ZSBtZW1v
cnkgaW5zdGVhZCBvZiB0aGUgd2hvbGUgMk1CLiBJdCdzIGhlbHBmdWwKPj4gdG8gc2F0aXNmeSBh
IHNtYWxsIG1lbW9yeSBzeXN0ZW0gKEQxcy9GMTMzIGZyb20gQWxsd2lubmVyKS4KPj4gCj4+IFNp
Z25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPj4gQ2M6IFBh
bG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+Cj4+IENjOiBBbnVwIFBhdGVsIDxhbnVw
LnBhdGVsQHdkYy5jb20+Cj4+IENjOiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4K
Pj4gLS0tCj4+IGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgMTQgKysrKysrKysrKysrKy0KPj4gMSBm
aWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+IGlu
ZGV4IDkyMGU3OGY4YzNlNC4uZjdkYjZkNDAyMTNkIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2
L21tL2luaXQuYwo+PiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+PiBAQCAtMTU5LDYgKzE1
OSwxNSBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9tZW0oY2hhciAqcCkKPj4gfQo+PiBlYXJs
eV9wYXJhbSgibWVtIiwgZWFybHlfbWVtKTsKPj4gCj4+ICtzdGF0aWMgcGh5c19hZGRyX3QgZmly
bXdhcmVfc2l6ZSBfX2luaXRkYXRhOwo+PiArc3RhdGljIGludCBfX2luaXQgZWFybHlfZ2V0X2Zp
cm13YXJlX3NpemUoY2hhciAqYXJnKQo+PiArewo+PiArICAgICAgIGZpcm13YXJlX3NpemUgPSBt
ZW1wYXJzZShhcmcsICZhcmcpOwo+PiArCj4+ICsgICAgICAgcmV0dXJuIDA7Cj4+ICt9Cj4+ICtl
YXJseV9wYXJhbSgicmlzY3YuZndzeiIsIGVhcmx5X2dldF9maXJtd2FyZV9zaXplKTsKPj4gKwo+
IAo+IFdlIGhhdmUgYXZvaWRlZCBhbnkgUklTQy1WIHNwZWNpZmljIGtlcm5lbCBwYXJhbWV0ZXIg
dGlsbCBub3cKPiBhbmQgSSBkb24ndCB0aGluayBhZGRpbmcgInJpc2N2LmZ3c3oiIGlzIHRoZSBy
aWdodCBhcHByb2FjaC4KPiAKPiBPcGVuU0JJIGFkZHMgYSByZXNlcnZlZCBtZW1vcnkgbm9kZSAo
bW1vZGVfcmVzdkA4MDAwMDAwKQo+IHRvIG1hcmsgdGhlIG1lbW9yeSB3aGVyZSBpdCBpcyBydW5u
aW5nIGFzIHJlc2VydmVkLiBJbiBmYWN0LCBhbGwKPiBNLW1vZGUgcnVudGltZSBmaXJtd2FyZSBz
aG91bGQgYmUgYWRkaW5nIGEgcmVzZXJ2ZWQgbWVtb3J5Cj4gbm9kZSBqdXN0IGxpa2UgT3BlblNC
SS4KCkJCTCBkb2VzIG5vdCBkbyB0aGlzIGFuZCwgZXZlbiBpZiBpdOKAmXMgbW9kaWZpZWQgdG9k
YXksIG9sZGVyIHZlcnNpb25zCndpbGwgc3RpbGwgbmVlZCB0byBiZSBzdXBwb3J0ZWQgZm9yIHF1
aXRlIGEgd2hpbGUgbG9uZ2VyLgoKSW4gRnJlZUJTRFsxXSB3ZSBvbmx5IHJlc2VydmUgdGhlIGZp
cnN0IDIgTWlCIG9mIERSQU0gKHdlIGRvbuKAmXQgY2FyZQphYm91dCBSVjMyKSBpZiB0aGVyZSBp
cyBubyByZXNlcnZlZCBtZW1vcnkgbm9kZSBjb3ZlcmluZyB0aGUgRFJBTSBiYXNlCmFkZHJlc3Ms
IHdoaWNoIGF2b2lkcyB0aGlzIGlzc3VlLiBUaGUgb25seSBkb3duc2lkZSB3aXRoIHRoYXQgYXBw
cm9hY2gKaXMgdGhhdCBpZiBmaXJtd2FyZSBvY2N1cGllcyBhIGRpZmZlcmVudCByZWdpb24gdGhh
biB0aGUgYmVnaW5uaW5nIG9mCkRSQU0gKG9yIHRoZXJlIGlzIG5vIGZpcm13YXJlIHJlc2lkZW50
IGluIHRoZSBzdXBlcnZpc29y4oCZcyBwaHlzaWNhbAphZGRyZXNzIHNwYWNlLCBhcyBpcyB0aGUg
Y2FzZSBmb3IgYSB2aXJ0dWFsaXNlZCBndWVzdCkgdGhlbiBpdAp1bm5lY2Vzc2FyaWx5IHJlc2Vy
dmVzIHRoYXQgZmlyc3QgMiBNaUIsIGJ1dCB0aGF04oCZcyBub3QgYSBodWdlIGRlYWwsCmFuZCBj
YW7igJl0IGJlIGF2b2lkZWQgc28gbG9uZyBhcyBCQkwgY29udGludWVzIHRvIGV4aXN0ICh3ZWxs
LCBJIGd1ZXNzCnlvdSBjb3VsZCBwcm9iZSB0aGUgU0JJIGltcGxlbWVudGF0aW9uIElEIGlmIHlv
dSByZWFsbHkgY2FyZWQgYWJvdXQKdGhhdCwgYnV0IEnigJl2ZSB5ZXQgdG8gaGVhciBvZiBhIHBs
YXRmb3JtIHdoZXJlIHRoZSBTQkkgaW1wbGVtZW50YXRpb24sCmlmIGl0IGV4aXN0cywgaXNu4oCZ
dCBhdCB0aGUgc3RhcnQgb2YgRFJBTSwgYW5kIGlmIHlvdeKAmXJlIHZpcnR1YWxpc2luZwp0aGVu
IHlvdSBwcm9iYWJseSBoYXZlIGVub3VnaCBEUkFNIHRoYXQgeW91IGRvbuKAmXQgbm90aWNlIDIg
TWlCIGdvaW5nCm1pc3NpbmcpLgoKSmVzcwoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9mcmVlYnNk
L2ZyZWVic2Qtc3JjL2Jsb2IvbWFpbi9zeXMvcmlzY3YvcmlzY3YvbWFjaGRlcC5jI0w1NTQtTDU2
OAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
