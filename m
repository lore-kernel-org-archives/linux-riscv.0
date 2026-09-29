Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE56ACA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1W85ycr6Xd49AG1ytOcweU+ztx4FkJaQJGy1d0KEQE=; b=Ynr5ejesTG2dDz
	lnvuCB90ebXg2NbHMeV3ikRtoeIkXOn5sSMOqMUZ/07bJI7+/15ef2IvXnWdQD0F3NE5Z/U07Qx/E
	JDSBIaYoL0WwDHVk85EGGDNniDA3/hRpaa4BGDrfzcaXqQIA0qLcA+mv9bkHyWW+iQ1mtqmxgi+lO
	xbysVDPguvD04m7TWP9/NGBSfDaF5vdILEg0MNB1rzuZM+0UvGUwoHzP25kNwMb3LXOaqPMkiDGbC
	haXUfFHPR/nI93OBHjSlJkUB8DyW30LuyI6rF6NO9PxfPDjlQSON9FEodiLgCxidR2QnixFxLUSWH
	SPbJtYjIebn7BzISECzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTsj-00000002wIN-3VPk;
	Tue, 29 Sep 2026 09:12:13 +0000
Received: from mail-vs2-f42.google.com ([74.125.227.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTsg-00000002wHn-0zc5
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 09:12:12 +0000
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso1343389e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 02:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673129; x=1791277929;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JOw0a9YdB1CwQ1gVObJylylvUx3VbrlfiDLWG9S39O0=;
        b=Pye/A23jmrWLo5LQ7d16whHSCbMncHbG229yGIlZ2XxAyqkJaxaSAr+emTF4e5+a8w
         ni6JZckBeU62jA+cJJU4gg2tdzmT4UlnMwxwJuYjpjxqpyIFxjioQ2D3ETnMMeSkNLCR
         LrZGx9e7ZxhWTV2hgSc9vPgPfxfwXNvURichPU4P8P3rsDsSG0fzhmmvtkbAE9ObcYhV
         Sct78N6CRVcHKG94XGfWQfcQ/c0uINfn3zjTbeYVsakuOrHNAW1GMtL/Ji2D3HkKohur
         Oc0ErshYPMnTh4Yy+AEJQkghU/rRGXt/ZOZsfFhXAbGpoGsuxj0oSVUrlmpQ8Q/extEs
         ekrQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8h7UjuRdtRS+bYVjrjSPiDlgDn7RNzeWx2xt0C9s2YsjNbxr5Ez9uFq+wqxkFv+OcdkAEG+8VdEZJ+Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ8TgyNU/6zYDpALrgM7TTJMVE67153U8J/1uQjq3PXt4ogdo25
	gbEbQV9rYEQpycH78XxkLENM/CKOJ0c01+WcrZHiuGN3B1ielWE9w7FS3dfIVD9S
X-Gm-Gg: AYBFou3ogfpAjJgbZlrZsyDJtkFRwZNS9S0PzNdkds40cYquht2jE1LNGT/QZEdptzC
	3AmvWIy4lDzAEImYsXAqQLKRORDEItSPrHvFsE9eQ/M54E/p933ScBJzTAk8AFBTqt7q3nUq80y
	H6xrx7Vutahp2GSZC4iAEVdD6rZcd/KI0o82hWiUMM9NJAHOP4xlvqSt7evfQY2yXmNQOIEDaFT
	0hSJdZkL773im6hRDvbq2x+/+rGRXCco3c+5ibsVbvxpY4Bb5QSoeXx0LMPx3LIHwUu/37NwAab
	673eLX6POxySsQJ86SRwLfLbjElLI78cgbbMVEssqUxp2/rnjA1s40dvRbGQBNysB1xh7fEH4g5
	/3OdsKkgJDqMBgdjl9kzU+i9tKtQACd8UWdmyN5l5/dCNSjg/TZC8JywNKCEhY6+QQ3aMH/sv7H
	EWL0UcimNe5rbMMF9H7HLgGYJ1HB88pT7uB9WLEOozCnfdIzS74yS+hYX4NhGaZamaWyvNfaPbd
	3f1+1/7YwYR2uTYJ+KwGU7PzZhMa1oPe201
X-Received: by 2002:a05:6102:50a5:b0:7b2:908b:ada1 with SMTP id ada2fe7eead31-7b8feead286mr841636137.22.1790673128702;
        Tue, 29 Sep 2026 02:12:08 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988c0bf0964sm1302979241.2.2026.09.29.02.12.07
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:12:08 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b30092f554so713730137.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 02:12:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzRc2CM/FTWwswZY0k3edpCBTQ0zHFYA12GrFP6m3QjDiWOEkdXe0GZv31VhLOJjdRduD4J2+49SJ/Nkg==@lists.infradead.org
X-Received: by 2002:a05:6102:149d:b0:7b7:3acf:bd3a with SMTP id
 ada2fe7eead31-7b73acfe23dmr1486747137.4.1790673127529; Tue, 29 Sep 2026
 02:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260924213256.122530-2-blum@kernel.org> <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
In-Reply-To: <15d659fe-c9cb-fa65-5dd6-7182fb152317@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 11:11:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
X-Gm-Features: AclHuK-WMfBhqpiaX2MeBSdTA0pBWiNpHLGLXukEn385P1daLkcYPTJ9S7ydLfM
Message-ID: <CAMuHMdVK-MzcnNgobviFf8rxkko_sBT43+gZdEG45fN+vyo1xA@mail.gmail.com>
Subject: Re: [PATCH] riscv: process: Use str_supported_unsupported() in compat_mode_detect()
To: Paul Walmsley <pjw@kernel.org>, Thorsten Blum <blum@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Zishun Yi <vulab@iscas.ac.cn>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_021210_280614_C1CFEE40 
X-CRM114-Status: GOOD (  17.47  )
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

SGkgUGF1bCwgVGhvcnN0ZW4sCgpPbiBTYXQsIDI2IFNlcHQgMjAyNiBhdCAwMTo0OCwgUGF1bCBX
YWxtc2xleSA8cGp3QGtlcm5lbC5vcmc+IHdyb3RlOgo+IE9uIFRodSwgMjQgU2VwIDIwMjYsIFRo
b3JzdGVuIEJsdW0gd3JvdGU6Cj4gPiBSZXBsYWNlIGhhcmQtY29kZWQgc3RyaW5ncyB3aXRoIHRo
ZSBzdHJfc3VwcG9ydGVkX3Vuc3VwcG9ydGVkKCkgaGVscGVyLgo+ID4gVGhpcyB1bmlmaWVzIHRo
ZSBvdXRwdXQgYW5kIGhlbHBzIHRoZSBsaW5rZXIgd2l0aCBkZWR1cGxpY2F0aW9uLCB3aGljaAo+
ID4gY2FuIHJlc3VsdCBpbiBhIHNtYWxsZXIgYmluYXJ5Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6
IFRob3JzdGVuIEJsdW0gPGJsdW1Aa2VybmVsLm9yZz4KPgo+IFRoYW5rcywgcXVldWVkIGZvciB2
Ny40LgoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLCB3aGljaCBpcyBub3cgY29tbWl0IGEwNjc3NjU2
NWI5ZTczNTEgKCJyaXNjdjoKcHJvY2VzczogVXNlIHN0cl9zdXBwb3J0ZWRfdW5zdXBwb3J0ZWQo
KSBpbiBjb21wYXRfbW9kZV9kZXRlY3QoKSIpCmluIHJpc2N2L2Zvci1uZXh0LgoKVGhpcyBmYWls
cyB0byBidWlsZDoKCiAgICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmM6IEluIGZ1bmN0aW9u
IOKAmGNvbXBhdF9tb2RlX2RldGVjdOKAmToKICAgIGFyY2gvcmlzY3Yva2VybmVsL3Byb2Nlc3Mu
YzoxMzg6MTc6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZgpmdW5jdGlvbiDigJhzdHJf
c3VwcG9ydGVkX3Vuc3VwcG9ydGVk4oCZClstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xh
cmF0aW9uXQogICAgICAxMzggfCAgICAgICAgICAgICAgICAgc3RyX3N1cHBvcnRlZF91bnN1cHBv
cnRlZChjb21wYXRfbW9kZV9zdXBwb3J0ZWQpKTsKICAgICAgICAgIHwgICAgICAgICAgICAgICAg
IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCmFzIGl0IGhhcyBhIGhhcmQgZGVwZW5kZW5jeSBv
biBjb21taXQgNTM4M2NmMjgwZWY0ZjAwYgooImxpYi9zdHJpbmdfY2hvaWNlczogQWRkIHN0cl9z
dXBwb3J0ZWRfdW5zdXBwb3J0ZWQoKQpoZWxwZXIiKSwgd2hpY2ggaXMgb25seSBwcmVzZW50IGlu
IHRoZSBmb3ItbmV4dCBicmFuY2ggb2YKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcGR4ODYvcGxhdGZvcm0tZHJpdmVycy14ODYuZ2l0LgoKR3J7b2V0amUs
ZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lgog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
