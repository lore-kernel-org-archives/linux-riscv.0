Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEF2C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeeSiWO9iXJ0Ly7fJ7YWdRtWjdOpfLu/iVTWcmJ86R4=; b=b5k6NjvQWIIn4j
	Ap+QCCEPuEosJxtIaOoHki1JTMOdtBMHYDClF8UKv09kmOoghuKPZMgvJOuNysSsv6kpyiSr+JZeA
	KkxddGJZ+sUvxX4L7xwlL6PS0/gu5Xc3LNQwjVLi/D11M39vQajiIAWk5lpZ+iZJY+sgQJIggTaGe
	BSNyWS4uX12nQpfQ8DsTBsY3j+cz2ziN4A8O1Xas/zkGV2aRRdBuhac2+HRxsFHbyOZuG13GJErqG
	U8XTHRs2zZCwzLBdhtEmNCK6kSNEtmnQmv3YzC5qwJWqWznYRi4KZcCcmp7lGJ8EoptbPTLVfdrm5
	ZNhCmV7DHAfykLlQuZEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDqE-00F2r9-1Z;
	Tue, 11 Jul 2023 13:55:46 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJDqC-00F2pM-06
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 13:55:45 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1b3f722fdafso5276833fac.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 06:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689083740; x=1691675740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZXQMJc+mkFZtu2vLefW5Re8NpovkJxJKped5EUiUKOE=;
        b=HkYEi7D71WxskFHQM+aAHJt6p+vCBGcsORuiSXWiLLY9CJSGGJuz7aI+5vX+eiJzwJ
         CFna3az14Z5H9toaTxOrXYXAz7PgteurcnP8KcjrXUDmkOsO9iqqeef+V834P0Yv9/cc
         67vgj6mlQzVxhYNj5Z5ZO0mOQLOvRowRF60vwCHl10kYjdv39+EOU4imPsu/WwryoI6G
         TLg7PDKxpf1V+9g6XaEG20PqBFXFkFjmASCkDACvM934NOpCH7mf9OKlJdaQaYOczIq/
         9VsHbvRieaZnZz7Bz9aoc1HqLxOTpVSgycfBKI8hJN6VHU8QD+KkEMYTCXAZbzxbZ9BY
         5WWA==
X-Gm-Message-State: ABy/qLaZEFcyoVECtS9YY/JgL15EUZBQrCFcaxXDFZx0c8+CCSj5wtM6
	u0LdHk+211udXLGbzisDsE48L+y03HnpmQ==
X-Google-Smtp-Source: APBJJlE4244VmyGJtp7aCUllkjT3rtibLw1E20pwrX/8GrGFJ136qSBIBgx+BEyzWMgggQUz7MEE8w==
X-Received: by 2002:a05:6870:a70b:b0:1b7:642a:40c9 with SMTP id g11-20020a056870a70b00b001b7642a40c9mr251503oam.59.1689083740284;
        Tue, 11 Jul 2023 06:55:40 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id y64-20020a817d43000000b0056cd44f9f23sm567286ywc.63.2023.07.11.06.55.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 06:55:39 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5703cb4bcb4so61090857b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 06:55:39 -0700 (PDT)
X-Received: by 2002:a81:6e8b:0:b0:570:85b2:e6dd with SMTP id
 j133-20020a816e8b000000b0057085b2e6ddmr17111816ywc.17.1689083738977; Tue, 11
 Jul 2023 06:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230511181931.869812-1-tj@kernel.org> <20230511181931.869812-7-tj@kernel.org>
 <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
In-Reply-To: <ZF6WsSVGX3O1d0pL@slm.duckdns.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jul 2023 15:55:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
Message-ID: <CAMuHMdVCQmh6V182q4g---jvsWiTOP2hBPZKvma6oUN6535LEg@mail.gmail.com>
Subject: Consider switching to WQ_UNBOUND messages (was: Re: [PATCH v2 6/7]
 workqueue: Report work funcs that trigger automatic CPU_INTENSIVE mechanism)
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, 
	"torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-team@meta.com, 
	Linux PM list <linux-pm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, linux-rtc@vger.kernel.org, 
	linux-riscv <linux-riscv@lists.infradead.org>, netdev <netdev@vger.kernel.org>, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, Linux MMC List <linux-mmc@vger.kernel.org>, 
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_065544_067270_33D13D90 
X-CRM114-Status: GOOD (  20.51  )
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

SGkgVGVqdW4sCgpPbiBGcmksIE1heSAxMiwgMjAyMyBhdCA5OjU04oCvUE0gVGVqdW4gSGVvIDx0
akBrZXJuZWwub3JnPiB3cm90ZToKPiBXb3JrcXVldWUgbm93IGF1dG9tYXRpY2FsbHkgbWFya3Mg
cGVyLWNwdSB3b3JrIGl0ZW1zIHRoYXQgaG9nIENQVSBmb3IgdG9vCj4gbG9uZyBhcyBDUFVfSU5U
RU5TSVZFLCB3aGljaCBleGNsdWRlcyB0aGVtIGZyb20gY29uY3VycmVuY3kgbWFuYWdlbWVudCBh
bmQKPiBwcmV2ZW50cyBzdGFsbGluZyBvdGhlciBjb25jdXJyZW5jeS1tYW5hZ2VkIHdvcmsgaXRl
bXMuIElmIGEgd29yayBmdW5jdGlvbgo+IGtlZXBzIHJ1bm5pbmcgb3ZlciB0aGUgdGhlcnNob2xk
LCBpdCBsaWtlbHkgbmVlZHMgdG8gYmUgc3dpdGNoZWQgdG8gdXNlIGFuCj4gdW5ib3VuZCB3b3Jr
cXVldWUuCj4KPiBUaGlzIHBhdGNoIGFkZHMgYSBkZWJ1ZyBtZWNoYW5pc20gd2hpY2ggdHJhY2tz
IHRoZSB3b3JrIGZ1bmN0aW9ucyB3aGljaAo+IHRyaWdnZXIgdGhlIGF1dG9tYXRpYyBDUFVfSU5U
RU5TSVZFIG1lY2hhbmlzbSBhbmQgcmVwb3J0IHRoZW0gdXNpbmcKPiBwcl93YXJuKCkgd2l0aCBl
eHBvbmVudGlhbCBiYWNrb2ZmLgo+Cj4gdjI6IERyb3AgYm91bmNpbmcgdGhyb3VnaCBrdGhyZWFk
X3dvcmtlciBmb3IgcHJpbnRpbmcgbWVzc2FnZXMuIEl0IHdhcyB0bwo+ICAgICBhdm9pZCBpbnRy
b2R1Y2luZyBjaXJjdWxhciBsb2NraW5nIGRlcGVuZGVuY3kgYnV0IHdhc24ndCBlZmZlY3RpdmUg
YXMgaXQKPiAgICAgc3RpbGwgaGFkIHBvb2wgbG9jayAtPiB3Y2lfbG9jayAtPiBwcmludGsgLT4g
cG9vbCBsb2NrIGxvb3AuIExldCdzIGp1c3QKPiAgICAgcHJpbnQgZGlyZWN0bHkgdXNpbmcgcHJp
bnRrX2RlZmVycmVkKCkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUZWp1biBIZW8gPHRqQGtlcm5lbC5v
cmc+Cj4gU3VnZ2VzdGVkLWJ5OiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGluZnJhZGVhZC5vcmc+
CgpUaGFua3MgZm9yIHlvdXIgcGF0Y2gsIHdoaWNoIGlzIG5vdyBjb21taXQgNjM2Mzg0NTAwNTIw
MjE0OAooIndvcmtxdWV1ZTogUmVwb3J0IHdvcmsgZnVuY3MgdGhhdCB0cmlnZ2VyIGF1dG9tYXRp
YyBDUFVfSU5URU5TSVZFCm1lY2hhbmlzbSIpIGluIHY2LjUtcmMxLgoKSSBndWVzcyB5b3UgYXJl
IGludGVyZXN0ZWQgdG8ga25vdyB3aGVyZSB0aGlzIHRyaWdnZXJzLgpJIGVuYWJsZWQgQ09ORklH
X1dRX0NQVV9JTlRFTlNJVkVfUkVQT1JUPXksIGFuZCB0ZXN0ZWQKdGhlIHJlc3VsdCBvbiB2YXJp
b3VzIG1hY2hpbmVzLi4uCgpTSC9SLU1vYmlsZToKCiAgd29ya3F1ZXVlOiBnZW5wZF9wb3dlcl9v
ZmZfd29ya19mbiBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyA0IHRpbWVzLApjb25zaWRlciBzd2l0
Y2hpbmcgdG8gV1FfVU5CT1VORAoKQXRtYXJrIFRlY2hubyBBcm1hZGlsbG84MDAtRVZBIHdpdGgg
c2htb2JfZHJtOgoKICB3b3JrcXVldWU6IGRybV9mYl9oZWxwZXJfZGFtYWdlX3dvcmsgaG9nZ2Vk
IENQVSBmb3IgPjEwMDAwdXMgMTYKdGltZXMsIGNvbnNpZGVyIHN3aXRjaGluZyB0byBXUV9VTkJP
VU5ECgpSLUNhciBHZW4yOgoKICB3b3JrcXVldWU6IHJ0Y190aW1lcl9kb193b3JrIGhvZ2dlZCBD
UFUgZm9yID4xMDAwMHVzIDQgdGltZXMsCmNvbnNpZGVyIHN3aXRjaGluZyB0byBXUV9VTkJPVU5E
CgpSLUNhciBHZW4yL0dlbjM6CgogIHdvcmtxdWV1ZTogcG1fcnVudGltZV93b3JrIGhvZ2dlZCBD
UFUgZm9yID4xMDAwMHVzIDQgdGltZXMsIGNvbnNpZGVyCnN3aXRjaGluZyB0byBXUV9VTkJPVU5E
CgpSLUNhciBHZW4zOgoKICB3b3JrcXVldWU6IGtmcmVlX3JjdV93b3JrIGhvZ2dlZCBDUFUgZm9y
ID4xMDAwMHVzIDQgdGltZXMsIGNvbnNpZGVyCnN3aXRjaGluZyB0byBXUV9VTkJPVU5ECgpPcmFu
Z2VDcmFiL0xpbnV4LW9uLUxpdGVYLVZleFJpc2NWIHdpdGggaHQxNmszMyAxNC1zZWcgZGlzcGxh
eSBhbmQgc3NkMTMweGRybWZiOgoKICB3b3JrcXVldWU6IGNoZWNrX2xpZmV0aW1lIGhvZ2dlZCBD
UFUgZm9yID4xMDAwMHVzIDQgdGltZXMsIGNvbnNpZGVyCnN3aXRjaGluZyB0byBXUV9VTkJPVU5E
CiAgd29ya3F1ZXVlOiBkcm1fZmJfaGVscGVyX2RhbWFnZV93b3JrIGhvZ2dlZCBDUFUgZm9yID4x
MDAwMHVzIDEwMjQKdGltZXMsIGNvbnNpZGVyIHN3aXRjaGluZyB0byBXUV9VTkJPVU5ECiAgd29y
a3F1ZXVlOiBmYl9mbGFzaGN1cnNvciBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyAxMjggdGltZXMs
CmNvbnNpZGVyIHN3aXRjaGluZyB0byBXUV9VTkJPVU5ECiAgd29ya3F1ZXVlOiBodDE2azMzX3Nl
ZzE0X3VwZGF0ZSBob2dnZWQgQ1BVIGZvciA+MTAwMDB1cyAxMjggdGltZXMsCmNvbnNpZGVyIHN3
aXRjaGluZyB0byBXUV9VTkJPVU5ECiAgd29ya3F1ZXVlOiBtbWNfcmVzY2FuIGhvZ2dlZCBDUFUg
Zm9yID4xMDAwMHVzIDEyOCB0aW1lcywgY29uc2lkZXIKc3dpdGNoaW5nIHRvIFdRX1VOQk9VTkQK
CkF0YXJpIChBUkFueU0pOgoKICB3b3JrcXVldWU6IGF0YV9zZmZfcGlvX3Rhc2sgaG9nZ2VkIENQ
VSBmb3IgPjEwMDAwdXMgNjQgdGltZXMsCmNvbnNpZGVyIHN3aXRjaGluZyB0byBXUV9VTkJPVU5E
CgpUaGUgT3JhbmdlQ3JhYiBpcyBhIHNsb3cgbWFjaGluZSwgc28gaXQncyBub3QgdGhhdCBzdXJw
cmlzaW5nIHRvIHNlZSB0aGVzZQptZXNzYWdlcy4uLgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAg
ICAgICAgICAgICAgICAgICAgICBHZWVydAoKCi0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVy
ZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCklu
IHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlz
ZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qg
c2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
