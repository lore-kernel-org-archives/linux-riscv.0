Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCD9C4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 22:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lHMXIoib8XVQRiW5Nsp1SCamu6rSCo0r05jf0ygsuHU=; b=FSQX1hrlzjtMmm
	g/Fo6jlionMDbWcwXvr9IVIPdtD+Z99uBdO/k08GEmJMObEW1yJGs0oVvoQmIMsr9iRddk750h2jM
	Y154N3WTMCbWGU+XzOeWwJO7dy5Qscm3km0bTiiiUgFAiyfPTobyGJd6Co6jaI8XEnPL6HOZwds0K
	NDA7VNpvSEfyPD6m8J3Brlr3zu7cU75zsolb8l6zqhkGxQz/2G6ZEKLX4sjUGLJKGHiG5EceDb/Mg
	NbsmfkmTvM8US2AVniFXnqn7lCPgiTQO5FONVlGHqxubPL2WJkrjFCQjMFDHFpa+Fpl8twnzOofGl
	5HGA36oH0C1oMS8xhrVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUYR-00000000jZg-2COS;
	Thu, 16 Jul 2026 22:27:43 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkUYP-00000000jYz-0eSk
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 22:27:42 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-667971437d6so10982709d50.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 15:27:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784240860; cv=none;
        d=google.com; s=arc-20260327;
        b=jwBE+c9xOc4j7W2iiP24zuxxBndtG51lbm94OeQGBtMcP85uZs+eSkZeqYkzF8s/Nd
         xy2I9sQuYyxOqxCUU8z90Orl0zbDIsPBjAr+xsxEtp3EnEC84P6Roop8zMI3eqrAksg0
         2EB18i1Xm2H+A6lxsmXP0Obcw3aEyIO7Bhtr05O1GWBmlKoC6g+0wm7lz4QvjHjgmci2
         r3fsbsqf2eefMfqwK51EhKERv+YEetl9N1Z2dJePFeX1Ld6qDLlYqyozmp4mKPxCHh0Q
         VGS9IA1cdrZmO94ARbF5+JbFQ6iZL/unx1W3k8q6gcy1RxMXYFt0MI6ci32wwqgAZLaY
         5eWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ZU0yywrvxPHG6hK8bj9GpWMCRYihvW5KONWikHDtR4=;
        fh=ctm19FWtYSY8QctQ9Zol18fwazc94Rd3FraZxIaV2hk=;
        b=OJps9YWsLKMsBT+rGXAiszXcqKPobLVXGwfIWCgxiY4UuU8gQnR77qH57uv30KyMrC
         Ma/wJ//qBljrBrH7J68PmGrRK3j3Ak8bVizLn790nDDWk5BqFT9JlcqA/OQAGyj4ql9H
         cgT56jgcfkg0uNSCXGvuY8KunT9nNombksG6fIo/VYdM/SADGn2Xpsxr2zjLODbYcwar
         QVVj68T5R4vmPk1Xt16tY/sNQQfhy42pXUksGW82wBb0vmwrWcBavNLhEBLUMF3dbn0K
         tzIt6TuhPo0aIMlxtyTOUHFdKxXveXsoNHqyyXmqPV8UYxJZt+TsqrdK32EDhfv8M8SA
         UxSw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784240860; x=1784845660; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6ZU0yywrvxPHG6hK8bj9GpWMCRYihvW5KONWikHDtR4=;
        b=GijxLS1NH5GNoBKYyWbxC/G4+VwfFXWmAIm1NNF1HbLX6XaAE1w5+T6xxPNaqZ3ODc
         /uBujzfXNNa/l+7fWS6Z1QO9/cQzH+qyIKYEBvXfd7+dr0HftYUanIeS9B+sP30pIHd6
         WgB6Tvse1unEcLmwpWZj/6I15bM/zkbSlXaDWPRSRAlun7iCLxKNE3eHT5rfuCTb+3fs
         AVgLU8HdVl96ag8vfqaizi0ckYzQztNXGJOmQwq4hRG00SI8RcpF7+K0+fuBH2ZnHQCF
         xJzSW3ions+2FX85KeVd4aWzLjt6SV4S6ZIyiQQmbG+DpWMXTbhThDlBxqOp6s89+Ifg
         ArCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784240860; x=1784845660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ZU0yywrvxPHG6hK8bj9GpWMCRYihvW5KONWikHDtR4=;
        b=KCQFfeBjF08I/Qh+qRcWsSTxXPBudNWpVpRm9A4FIWCokdORc9zQ1+29PQ26i60BrO
         MqjCxs5dJendWPsAeHAGuIw548usRLA4/82gbUpxNCPCEsIBvzU1Jr28yyBYIwLOKo0a
         xlSBEt0h+dRjAZL5xr7JjfpN/V2m6Q1YhoUAgBcpkiXLAKQMy6NfGNXBtLkWYP2u7jsG
         Sl+1J9CtCgZnuPdgcxh+TIIF/0vKmxJa5QeH6UwA5L+Rp0MKBLyUsYJKHpJW2IcZqeh9
         UZFOoseMa0QuCHaexDGbc0ctSFuUaWX2f6eKyJDQahCRu76UzLQa7QegFTs3XiWs3ct4
         g6Nw==
X-Forwarded-Encrypted: i=1; AHgh+RqKerJAWuvqfiLBQHJDXZZv4FGeXbGWWxQ3P811IU3upl5dhcBD6ubOmBhdUbf6NsAs3qv9kfJnv+Czig==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhVUygFp6HqZY3WPN021kpltp92GRUjqacgA9kB52DSp+GwIk9
	f6z0y3OYQmsKpv4eWNRkHzTyvFx4til7lhvGbjGGZZx5hBIr4q4hijESctmCKp5dY/p9KWnT9PK
	F6lt77mIohynJCQPuj6Ar2Xm+GpnXMxyT7koPBBK6tw==
X-Gm-Gg: AfdE7ck14d8ZSExirCQxNsVJRmypM1oO2zu+FKsF4t5A6w0E0jAc/bTgysC4GG63KXR
	lKYcYiMA5kn3dSrPoXAEvnqpoKio9o4ALrikdKBaeN/DYN8eGiStKKUjyIbu+vZMLpNSECw+hFu
	dTA4XcQK3QTSgWSEoIo8z1Egdbr/6EO7WlS+rhYzd8ha0OwGctd17goEayoABaSnRhtYW1V2GPd
	NH0dvn+j3vmRkFEm/3vc/lDqVzHvK0k+aNKRs5knbMIegTkmycTqnJ2Hlrd2TgJuKuvAPfV2ZGW
	477BMC1NthfBsP446Q==
X-Received: by 2002:a05:690e:4292:20b0:664:ae6b:b499 with SMTP id
 956f58d0204a3-668134128f7mr5521399d50.78.1784240860157; Thu, 16 Jul 2026
 15:27:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
 <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
 <e7a43955e41c4dbdb864e89edc3d9fe6@realtek.com> <allZOmTRIvot39Gj@inochi.infowork>
In-Reply-To: <allZOmTRIvot39Gj@inochi.infowork>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 16 Jul 2026 17:27:29 -0500
X-Gm-Features: AUfX_mwxPqzyWp7O4WLTTM2K_5Fn9GaDNvcy6d1xA8kFX3CnozHTqWZXOkjwN2k
Message-ID: <CAEev2e_QaaGmc-fSd4dWQAm2YOqOmBDn-xi1coWrAnoh0JUqRQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>, 
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_152741_201695_3EC03561 
X-CRM114-Status: GOOD (  18.43  )
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

SGkgSW5vY2hpLAoKT24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgNToyNOKAr1BNIElub2NoaSBBbWFv
dG8gPGlub2NoaWFtYUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMTYsIDIwMjYg
YXQgMDk6MjI6MTdBTSArMDAwMCwgUGluZy1LZSBTaGloIHdyb3RlOgo+ID4gQW5pcnVkaCBTcmlu
aXZhc2FuIDxhc3Jpbml2YXNhbkBvc3MudGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPiA+ID4gVGhl
IFNwYWNlbWl0IEszIFBpY28gSVRYIEJvYXJkIGhhcyBhIFJUTDg4NTJCRSBwY2llIGNhcmQgYmVo
aW5kIGEgUENJZQo+ID4gPiByb290IHBvcnQsIGJ1dCB0aGUgU29DIGRvZXNuJ3QgaGF2ZSBhbnkg
MzIgRE1BIGFkZHJlc2VzZXMgd2hpY2ggdGhlCj4gPiA+IHJ0dzg5IHNlZW1zIHRvIHVzZSBieSBk
ZWZhdWx0LiBFbmFibGUgMzYgYml0IERNQSBhYmlsaXR5IHRoYXQgdGhlIGRyaXZlcgo+ID4gPiBo
YXMgd2hlbiB0aGlzIHBhcnRpY3VsYXIgcm9vdCBwb3J0IGlzIGRldGVjdGVkIHNvIHRoYXQgdGhl
IGRyaXZlciBjYW4KPiA+ID4gcHJvYmUgb24gdGhpcyBTb0MuCj4gPiA+Cj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IEFuaXJ1ZGggU3Jpbml2YXNhbiA8YXNyaW5pdmFzYW5Ab3NzLnRlbnN0b3JyZW50LmNv
bT4KPiA+Cj4gPiBUaGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWU6Cj4gPgo+ID4gQWNrZWQtYnk6
IFBpbmctS2UgU2hpaCA8cGtzaGloQHJlYWx0ZWsuY29tPgo+ID4KPiA+IEJ1dCBJIHdvbmRlciBo
b3cgdGhpcyBwYXRjaHNldCBnb2VzIHZpYSB3aGljaCB0cmVlLiBJJ20gaGFwcHkgdG8gbWVyZ2UK
PiA+IHRoZW0gaW50byBydHcgdHJlZSBhbmQgdGhlbiB3aXJlbGVzcy1uZXh0IHRyZWUgaWYgcGVv
cGxlIGNhbiBhY2sKPiA+IHBhdGNoIDEvMi4KPiA+Cj4gPgo+Cj4gVGhlc2UgSURzIGFyZSBmcm9t
IG15IHBhdGNoc2V0Lgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3NwYWNlbWl0LzIwMjYwNzA5
MDQwMDI3Ljk1ODQwMC0xLWlub2NoaWFtYUBnbWFpbC5jb20vCj4KPiBJIHRoaW5rIEFuaXJ1ZGgg
Y2FuIG1vdmUgdGhpcyBJRCBhbmQgYWRkIHRoZW0gdG8gdGhlIHBjaV9pZHMuaAo+IGRpcmVjdGx5
LCBBbmQgSSBjYW4gYWRqdXN0IG15IHBhdGNoIHRvIGRlcGVuZCBvbiB0aGlzLiBJdCBzdGlsbAo+
IG5lZWRzIHNvbWUgaW1wcm92ZW1lbnQgdG8gYmUgbWVyZ2VkLgoKU291bmRzIGdvb2QsIEknbGwg
ZHJvcCB0aGUgZGVwZW5kZW5jeSBvbiB5b3VyIHNlcmllcyBhbmQganVzdCBoYXZlIG15CnNlcmll
cyBhZGQgdGhlc2UgSURzIHRvIGxpbnV4LnBjaV9pZHMuaC4gSSdsbCBzZW5kIG91dCBhIFYyIHRv
bmlnaHQuCgo+Cj4gUmVnYXJkcywKPiBJbm9jaGkKPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
