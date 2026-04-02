Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4907ACC6B00
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 06:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rwhpaLKhRLdBk/dtTePcHsCTE/NKXwLUrPdLTpHgXHU=; b=GBX8cACIOzQIjb
	/Ur+A8rv7FLf1/S1dT0WHVWmlbe9ps6kDAF8oySem9wTxKklxqouWraRiO6GBeIPuhYs+caz+tLL3
	oyKzfRUkmGuW2xCs9U6v7IIXw/H71odd4BkRBQkkdMvtAnKZ2UBtkbDMCnV4B301Kicrmy6DSYr7Q
	24XfOdNOvdwcUUT2WOz2lRrOcEPHiYYQyAL9eANoT8o2WpLJsexOY/SePqHV+ZAVW87VgbfMBo+2p
	sb6O8J1p+KW+TX+5l1L8iJUFlzIqz9RKU3wZPZ+wg0v+1lM7hxvXYe786snrs46PV7UbAwcWkOMzO
	BdIULK/lLoDrSOGmfWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BL0-0000000GrtO-07Pf;
	Thu, 02 Apr 2026 06:15:30 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8BKw-0000000GrsK-2AL5
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 06:15:28 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-67c1e0718f1so319678eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 23:15:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775110525; cv=none;
        d=google.com; s=arc-20240605;
        b=HiVB/S33gz5rzT6Z49NCY4dqOw7OMFjFl2SKt05Te/o5MZkrNOopIH0YQGKAzKQ2mn
         5VMXjoNCH0/RtgTpy3m5/uOfhnx0xbRnOwv0GQDQUEI4W0AUflk37KHHzNqLjfYFcTYj
         Enun6R/bUEUS3PhkELh+Hzu5IkvBF6iSoyFw7FHu06NhWR/vRMNEUCTcm3DWsRHa9Md+
         y6ITAcYIpRVcVSUemCe6OhojdJJwL2R0/TnofOaAUGv05RH6YhWF4K3qt3vXvWDn1ygA
         6YYj8JIt3xdSdRhD8UA4domeGpPuqD2JcMrOHGxxfZtheCrEvoNyWIURqVAa1aWDowyg
         YudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gmm+ZuAZEoshHephNI5x+CZdRU1jdbvaZcO28wZCH1g=;
        fh=LTtyWUbG5Ku9V9eo0R0aaK/6JWPvQbd2sHxLe5F/cDA=;
        b=di7ROHwfxVLl/yORWTKRqBtdGoCXSKFQcpcDjNSGEBkEe4Lmx7RHn/d+jRtYsOwF7r
         NERL3YWMSWm3dK+EtDmrLaAFRg8fJ8ZhYBG7Rz9Sc9mC7IJfF8Q78Oo6UKYnZWWvp2Sf
         U8+45/PNyb0uwrcSMj4bznCllZJeL1oVwWC/Er3VObeDbw2XxfoZQaJJ91dCjkz5VY4A
         kuW8Eil/gyDpTILaYZCDcSF/uXAuR9z8xSkbGvVlJA1iW6/Lbzsy1d7ZPKyYln8v9Bhk
         QnnwBNoP4uJGQ9UFAQyzWGjIGT14hta2v/waDE4OlHSYixVuflgm8w2IBrwr9/+FnRfY
         bXmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775110525; x=1775715325; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gmm+ZuAZEoshHephNI5x+CZdRU1jdbvaZcO28wZCH1g=;
        b=B7BmjIW7hjmkcjGii5DsewLnpJQnFpmoTEt8RfTsx5eRiVEZ7G2Os1kuZtIxJT3Pdr
         fEiRpCVvsJ+pAUv0xk78kwlahitYRQYocHptp+gPdPV0YmreKrF3alKIeSXNCiOXR0wO
         fheRIBnWw5KIDvsCoKHmoZX7FUn8A6ttOlWWSdWENsCTDlWKkpYCzAgmrBqdOPBYVSgD
         LeC4xhwOHMCAPB19TeORsnvsZodz2IhvXG50t3GnOBDhUG2N0ITJJNiUQv8mf2jrxZAA
         6iEksRnGGtSktumVNibuqCvgwPyADtiXhzE+UMgtYkGz1VHs9x2ZTQSgWdXXdd83LtJC
         hQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110525; x=1775715325;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gmm+ZuAZEoshHephNI5x+CZdRU1jdbvaZcO28wZCH1g=;
        b=Rv82yvxTWM4fdadIuDWJF791P2aJasW+UoXvmVzX+jc6Owo6n9uxXnkZEb3Z/zUO0W
         LLlSaIRDHijxnUjTNGARU6Mp8ER4RP+cslXAndfFOyiuWImUSlHwAk2FJrPJsISQoknH
         MeMUUD9n6/gEAW3xk8EQbNEfBlIMRJ7xy1dqvc38REtPK42jt3RhogCB4R7RrcOVw/J4
         PghxIpLqGn4SJ+8IkrYdvRVME8wsumm86x2wklDBvQivHMYCmHXiKBTm+MB+zZczCuck
         XGjgt9cU96FodDFp6bhXRcg7nXRNaHgYMvZ0p+KFFEF6SZD99X7t5sUuDGdAa0DsaMdL
         ntgA==
X-Forwarded-Encrypted: i=1; AJvYcCW0SdVzk8QM9mwzMoGBlqhTgivYGkBGFf4cxXwktjxzSJbn0xDyMhEBgwnk1lzAmmnUKaNZoFt8RRJfEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvKxG98D7pOZAdqqEN7Nn3wr58ikos15XNS5p3LFQ4wW50dr4j
	lE1BMB/4ZQCKIXgeyE2Mzq2ll7TWm0B+AZYjOaLyjcyUB8bgLGOno5hn23/BeTxyoy/aeD6weIW
	MHdZnJ8F/WawI5ucRNSQFmQA8d8G68FXUfgT+Wkh6Og==
X-Gm-Gg: ATEYQzw5tQRQfA80NU6hkpss3b7aGnjo70sYKDC9u6PBDZzDfXKWCHdX2PXNL1MU4/Y
	psXpsR1mjh4eiyCx6e+GiSrsES/3PmKfR2t4xFhzUAfvJU+dpNd611fhdMgRHyF1WhTreOlsBqr
	6whJ9/rAiC0bovexW4BG51xZMAmBmJaFbaQKDAcgQxXqxVuBNZURMs0yiu0uLKm1DYJTZvSeylT
	igxZyZf+K1yxsUfv818UPKcCMI0SDkH/lm640ok4/k+eaqT6LFHCg9+KCxMYyIulIv7axQNasXG
	Yo3cElEUiSYs4Xycth3Iu6NAB9zRjNWeZmqVtRaqmCoZfVQuMDenRQSK6DacnKngl4pcROMi7Sp
	48h4LmW2uFbY1oofeq6hd0fasFSw=
X-Received: by 2002:a05:6820:2083:b0:67e:3c4a:eac2 with SMTP id
 006d021491bc7-67fabd0f6c5mr3266769eaf.58.1775110525373; Wed, 01 Apr 2026
 23:15:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy3V2kipH8sPzXkmnXP=Sh=7wwqhHaAWDyucJnytbL+qtw@mail.gmail.com>
 <20260401104902.716329-1-xujiakai2025@iscas.ac.cn>
In-Reply-To: <20260401104902.716329-1-xujiakai2025@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 11:45:13 +0530
X-Gm-Features: AQROBzCXxzxKAp8muMDJJLpwLYO82PaRHrPCQ2ylV6QJVZYM_9h4TEWap2UJzSw
Message-ID: <CAAhSdy1tN1i3KZ_EmGPN6dz=DYSfGGxeiTCbHYA3GRezFD4Wiw@mail.gmail.com>
Subject: Re: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_gstage_get_leaf()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	jiakaiPeanut@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_231527_690442_67CBCF92 
X-CRM114-Status: GOOD (  17.32  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCA0OjE54oCvUE0gSmlha2FpIFh1IDx4dWppYWthaTIwMjVA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IEkndmUgYmVlbiBmdXp6aW5nIHRo
ZSBsYXRlc3Qga3ZtLXJpc2N2IHdpdGggdGhlIHNwaW5fdHJ5bG9jaygpIGZpeAo+IGFwcGxpZWQs
IGFuZCBJIGNhbiBzdGlsbCByZXByb2R1Y2UgdGhlIHVzZS1hZnRlci1mcmVlIGJ1ZyBpbgo+IGt2
bV9yaXNjdl9nc3RhZ2VfZ2V0X2xlYWYoKS4gVGhpcyBpbmRpY2F0ZXMgdGhlIGN1cnJlbnQgZml4
IGlzCj4gaW5zdWZmaWNpZW50Lgo+Cj4gVGhlIGN1cnJlbnQgY29kZSBkb2VzOgo+ICAgICBtbXVf
bG9ja2VkID0gc3Bpbl90cnlsb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiAgICAga3ZtX3Jpc2N2X2dz
dGFnZV91bm1hcF9yYW5nZSguLi4pOwo+ICAgICBpZiAobW11X2xvY2tlZCkKPiAgICAgICAgIHNw
aW5fdW5sb2NrKCZrdm0tPm1tdV9sb2NrKTsKPiBXaGVuIHNwaW5fdHJ5bG9jaygpIGZhaWxzIChs
b2NrIGhlbGQgYnkgYW5vdGhlciBDUFUpLCB0aGUgY29kZSBzdGlsbAo+IHByb2NlZWRzIHRvIGFj
Y2VzcyB0aGUgZ3N0YWdlIHBhZ2UgdGFibGUgd2l0aG91dCBhbnkgcHJvdGVjdGlvbiwKPiBsZWFk
aW5nIHRvIFVBRiB3aGVuIGNvbmN1cnJlbnQgd2l0aCBrdm1fcmlzY3ZfbW11X2ZyZWVfcGdkKCku
Cj4KPiBUaGUgZnVuZGFtZW50YWwgaXNzdWUgaXMgdGhhdCBzcGluX3RyeWxvY2soKSByZXR1cm5z
IGZhbHNlIGluIHR3bwo+IGRpZmZlcmVudCBjYXNlczoKPiAxLiBMb2NrIGhlbGQgYnkgY3VycmVu
dCB0aHJlYWQgKHdlIHNob3VsZCBjb250aW51ZSkKPiAyLiBMb2NrIGhlbGQgYnkgYW5vdGhlciB0
aHJlYWQgKHdlIHNob3VsZCBOT1QgY29udGludWUpCj4gQnV0IHRoZSBjdXJyZW50IGNvZGUgZG9l
c24ndCBkaXN0aW5ndWlzaCBiZXR3ZWVuIHRoZW0uCj4KPiBNeSBwcm9wb3NlZCBmaXg6Cj4gVXNl
IGxvY2tfaXNfaGVsZF90eXBlKCkgdG8gY2hlY2sgaWYgY3VycmVudCB0aHJlYWQgYWxyZWFkeSBo
b2xkcyB0aGUKPiBsb2NrOgo+ICAgICBib29sIG5lZWRfdW5sb2NrID0gZmFsc2U7Cj4gICAgIGlm
ICghbG9ja19pc19oZWxkX3R5cGUoJmt2bS0+bW11X2xvY2ssIExPQ0tfU1RBVEVfSEVMRCkpIHsK
PiAgICAgICAgIHNwaW5fbG9jaygma3ZtLT5tbXVfbG9jayk7Cj4gICAgICAgICBuZWVkX3VubG9j
ayA9IHRydWU7Cj4gICAgIH0KPiAgICAga3ZtX3Jpc2N2X2dzdGFnZV91bm1hcF9yYW5nZSguLi4p
Owo+ICAgICBpZiAobmVlZF91bmxvY2spCj4gICAgICAgICBzcGluX3VubG9jaygma3ZtLT5tbXVf
bG9jayk7Cj4KPiBIb3dldmVyLCBJJ20gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUgYmVzdCBhcHBy
b2FjaC4gV2hhdCBkbyB5b3UgdGhpbms/Cj4KCkkgZG9uJ3QgbWluZCBpbXByb3ZpbmcgdGhpcyBm
dXJ0aGVyIGJ1dCB0aGlzIG5vdyBkZXNlcnZlcyBzb21lCmNvbW1lbnRzIGFib3V0IHdoeSB3ZSBh
cmUgZG9pbmcgdGhpcyBjb250aW9uYWwgbG9ja2luZy4KClJlZ2FyZHMsCkFudXAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
