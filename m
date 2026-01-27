Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E33D2FEF4
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 23:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qav/Ruxd2GGaGK4g6X3Y3psswmht0oVpRpXYN192gD0=; b=biRM8chobfhCIb
	i4pV4muMD3OKiNeN5ib0+J2wwp/MlaetQFjpE8WWNoYobo0E5CtMQlPNiLcwx5jIXzXmerIypoph6
	A+bujUnj8S5p9BBrwIMYwYX7Nx5SKq5rQRzYsNNH83za/mf4/kHx0xaxObJb3IlquJoana4x3WAT8
	mGU6LpUTX0W65fh3B2b5P3DjFoQINzCiz+NUA7flSxdtL1HX3ytd3slRXkH4d3hTUdccucy4MVIZ9
	x/JYN22KbtzbwqgCvGVD3l6fg701T3iQWFz+4aFUvPCp45NvOJECEx4UHWRkyjO0SLFnKOS++Qf4K
	afQRCRLqAQyOO5guxxaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksey-0000000FAoe-1TNH;
	Tue, 27 Jan 2026 23:39:48 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksew-0000000FAnv-0UNf
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 23:39:47 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-79456d5dda4so31647857b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Jan 2026 15:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769557184; cv=none;
        d=google.com; s=arc-20240605;
        b=L6pvUqxPBX7SJGkwBawlnguQanTuWuP2kzwYjVk82c/gDsfNdLFtjQOdjv6zeZT467
         V0za3PofyFRoNtAlqsSxB3lXqMbnaK0DULl+b1BkPwmaytfW3qVXhOkjClt1gJzOKJbh
         e5u52Zbg2Y/UKbmAyx527YAOHjKq9icYIBIB8nDnRhH6YwLN78bQAoJSciC/b3yZ1M9Y
         5DFqvjzgt6YyqxapAoeLWFLnegAM6raXhLimZgvHQ8Z+zt8Co+g1G0Xt0kRKpNAuxe/p
         ruaUBWjcXumAHkrDGFgRNlXDNDyZRxkVIvmOY3l9iZR2i38gh4eVBDTYpYow3XjCVYGv
         nwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HLfEbFRwaaXoEu5p3+t5bvDBAaOn+hEnCv527EKjzLg=;
        fh=z3VI5tvBJE+eC3w8C6+M16jzDYkd9zdYyu/N3UxLWMk=;
        b=ckGH7SZssdKnDZGNnGVUe/08hshPskaACKxdjk4jkQlcyiJinDLoOWyet/aKSYFTIK
         l6OsOZhRl+AGn+057wVKKEsfjtdSdt25qWBljWU8+7cZvRRprvLZejjWwz3csIMHjVZ7
         YQuMEOMMWEdmiQBOPT5mArfEeaSUMMBf3wyXMAjpyfsTxvSye+HwVD3YSAItE6cUX/gX
         oEU9mYCk66fb7HbVCJ1NLmd/DV+tCEdL13BvxD+RyD9d7uFpzROnKWalRjDFFgBkU9Qo
         Tp0N+7ZvEnQjlZXdSLxetmccKt4xJuls9rOktk/8SzQS9tw9T0RhFn9/As0JQBglSeOj
         dGkw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769557184; x=1770161984; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLfEbFRwaaXoEu5p3+t5bvDBAaOn+hEnCv527EKjzLg=;
        b=OjJ7yVU/sXkt512tariDEbd/J7yIS1reygd83+HlJ/NH+KpPwfeHK3frHnVCEi5/x8
         YTfkB4xK4Ney57Mac4NAptGGxPWptQjCgHfwvMq83n/Gb6VngMq6fVE7WUF1jSMPqKE0
         xa5/0XvebrloM69uTA86j7KZdbbKTJH+YtnkW/4o5U7epWx8Dh51qEwDENMuSOgil9e8
         k4aFW0h667CPOg8s9MwpNZtLDk80jW30W5qmojKK2GKnd326G0e3y2nUq+0XUJ/54qy5
         soiPWw+TUMFijMyAWxr8MVQmqHtX2OGjmF6CevpLbhLnFl/ZxFtnK1dqkjhdK+MZRx6A
         Skig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769557184; x=1770161984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLfEbFRwaaXoEu5p3+t5bvDBAaOn+hEnCv527EKjzLg=;
        b=Qoit+8eotQXnSFJqx9Gf1tQDMtdYPFL4CSb6roJo5S59d7BUU4og7PbnwjewjzEg8g
         eeie6ghe6LWQYsDepU68S1dv/8dZAqMmVkXOw3y/SMWddc81ybNZPJX1VTJ9AupUlNB4
         1+gl2ngkFYvgjvMx0ZH67iENkQ8Yo5eZYahQa8zHbwQNVvszFpc2a46/mGLckIK0OWLo
         wEOBOERBf5cl9SEKpbVMwm0DtQs1nTk3mj5Cnkd4C8MD2xhvnC4IYtGMmkoS/rpT4hkv
         niGE7rONLxrSS1VAk40//IGILYNqiCeNCVAKwZaCOyXclbKAzE2MjrrhoAYnMtO5hPks
         Em6w==
X-Forwarded-Encrypted: i=1; AJvYcCX2Bv1bg479pzFVOVzYKbrUrfQkLGm9p1Z86rjylc5yyAE+vGGkl/4e08Cgae0zacUiOfFeurSsmUl4pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwE4E16Ib3thyqcTZTI1YkgTWgNe4XxjfF70h2Gkl5PszWI406C
	61RsgpzjVp64cb++ceg7z2PRlb+jFW1iiEsBukh5CsXBu5qhiZPUU55hzqRWzuU6hqWtIXPdCPc
	msR4wRFlHBSntJk0Cvjc0Ce2gsEXirzkWTkXq+FURxw==
X-Gm-Gg: AZuq6aI4MOYreGDNRrhu40CrPYAdes+KBFyvXaNJMaCC0ZDfGGt0a5+icvR0xjDff+S
	gD5wTs69SvHSpSyA6nXOMYjdlXt2TMJsNa0o59a65Eu2XueQICmMB6UZ5fNMmFycJg1ETLg9GnJ
	0j+BiGvIwuDLUgyYP8y4Xc4/jkV6NrdsG38qzKqhOp5sN7or0fXa09J1efKU/2tOZnksoWXYIkb
	6kYrdVgIfNWoh0s/2/yoLMRVoWrUJjFx9/GCdsaasWnWnejYc2fvNCkC6viSjEAMrlrCt/lmgqJ
	CnoQJ71IhScTjywaWlUynixbo9sulaxKEiDS0/O9XWpj5gsoi3xUrjJwRnGJ
X-Received: by 2002:a05:690c:c384:b0:793:a2fa:b980 with SMTP id
 00721157ae682-7947ac02c85mr49512957b3.44.1769557184251; Tue, 27 Jan 2026
 15:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com> <20260127-mystify-carmaker-150aa3fcd6c6@spud>
In-Reply-To: <20260127-mystify-carmaker-150aa3fcd6c6@spud>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Tue, 27 Jan 2026 17:39:33 -0600
X-Gm-Features: AZwV_QgU-_hZ5EIV6MqaVF_pm5xoRa9QBwjZNyO1hs18RpJ3g9G6LAL8JmHvLPM
Message-ID: <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
To: Conor Dooley <conor@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com, bmasney@redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_153946_168468_6701EF2A 
X-CRM114-Status: GOOD (  18.22  )
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

SGkgQ29ub3IsCgpPbiBUdWUsIEphbiAyNywgMjAyNiBhdCAxOjU44oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSmFuIDI2LCAyMDI2IGF0IDAz
OjA3OjE0UE0gLTA2MDAsIEFuaXJ1ZGggU3Jpbml2YXNhbiB3cm90ZToKPiA+IERvY3VtZW50IGJp
bmRpbmdzIGZvciBUZW5zdG9ycmVudCBBdGxhbnRpcyBQUkNNIHRoYXQgbWFuYWdlcyBjbG9ja3MK
PiA+IGFuZCByZXNldHMuIFRoaXMgYmxvY2sgaXMgaW5zdGFudGlhdGVkIDQgdGltZXMgaW4gdGhl
IFNvQy4KPiA+IFRoaXMgY29tbWl0IGRvY3VtZW50cyB0aGUgY2xvY2tzIGZyb20gdGhlIFJDUFUg
UFJDTSBibG9jay4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbmlydWRoIFNyaW5pdmFzYW4gPGFz
cmluaXZhc2FuQG9zcy50ZW5zdG9ycmVudC5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vYmluZGluZ3Mv
Y2xvY2svdGVuc3RvcnJlbnQsYXRsYW50aXMtcHJjbS55YW1sICB8ICA4MiArKysrKysrKysrKysr
KysrCj4gPiAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDIgKwo+ID4gIC4uLi9kdC1iaW5kaW5ncy9jbG9jay90ZW5zdG9ycmVudCxhdGxhbnRp
cy1wcmNtLmggIHwgMTAzICsrKysrKysrKysrKysrKysrKysrKwo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgMTg3IGluc2VydGlvbnMoKykKPiA+Cj4gPiArCj4gPiArICB0ZW5zdG9ycmVudCxwcmNtLXJj
cHU6Cj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5k
bGUKPiA+ICsgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgUGhhbmRsZSByZWZlcmVuY2UgdG8g
UkNQVSBwcmNtLCBuZWVkZWQgYnkgb3RoZXIgMyBwcmNtcyAoUENJZSwgTU0sIEhTSU8pCj4gPiAr
ICAgICAgYXMgdGhlIGNvbnRyb2wgcmVnaXN0ZXJzIGZvciB0aGUgUExMcyB0aGF0IGRyaXZlIHRo
ZXNlIHN1YnN5c3RlbXMgYXJlIGluCj4gPiArICAgICAgUkNQVSBwcmNtJ3MgcmFuZ2UKPgo+IFRo
aXMgaXMgcHJldHR5IHN1c3BlY3Qgc291bmRpbmcsIGlmIHRoZSBQTExzIGZvciAhcmNwdSBhcmUg
Y29udHJvbGxlZCBpbgo+IHRoZSByY3B1IHJlZ2lzdGVyIHJlZ2lvbiwgd2h5IGlzIGl0IG5vdCBh
IGNsb2NrIHBhcmVudCBmb3IgdGhlICFyY3B1Cj4gcHJjbXM/CgpJIHNhdyBhbm90aGVyIGNsb2Nr
IGRyaXZlciBkb2luZyBpdCBpbiB0aGUgbWFubmVyIEkgZGlkIFsxXSwgYW5kCnRob3VnaHQgdGhh
dCBpdCB3b3VsZCBtYWtlIHdyaXRpbmcgdGhlIGJpbmRpbmdzIGFuZCB0aGUgY2xvY2sgZHJpdmVy
CnNpbXBsZXIuIEVhY2ggcHJjbSBub2RlIHdvdWxkIGhhdmUgYSBzaW5nbGUgaW5wdXQgY2xvY2sg
KG90aGVyd2lzZQp0aGVyZSB3b3VsZCBiZSBhIGRpZmZlcmluZyBudW1iZXIgb2YgaW5wdXQgY2xv
Y2tzIGZvciBlYWNoIHByY20gbm9kZSkuClRoaXMgd291bGQgYWxzbyBhdm9pZCBoYXZpbmcgdGhl
IGNsb2NrIHRyZWUgaW4gdGhlIGRyaXZlciBjb250YWluCm11bHRpcGxlIGVudHJpZXMgZm9yIHNv
bWUgb2YgdGhlIFBMTHMgKG9uZSBpbiB0aGUgcmNwdSBzdWJzeXN0ZW0gd2hlcmUKaXQgaXMgZGVm
aW5lZCBhbmQgYW5vdGhlciB3aGVyZSB0aGUgc2FtZSBjbG9jayBpcyByZWZlcnJlZCB3aXRoIHsK
LmluZGV4ID0gMCB9KSB3aGljaCBjb3VsZCBiZWNvbWUgY29uZnVzaW5nLgoKV2hhdCB3b3VsZCB5
b3Ugc3VnZ2VzdCB0aGF0IEkgZG8/CgpbMV0gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvdjYuMTguMi9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Nsb2Nr
L3NwYWNlbWl0LGsxLXBsbC55YW1sI0wyMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
