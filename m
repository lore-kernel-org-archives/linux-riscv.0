Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A48EB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 06:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKCgWNCaQGlYYcrWvbxh4sEBQK7bFm9JQaHfXNGoa+I=; b=DStfuiiq4LdkZr
	Y64eGmnxkgfU/c9Gy9NS4fYNW9NXgZZboizuh2H2Mj1/FGALUcprgeLvAY+intp9cVZQqKi7Ir8DY
	eTKMixhZk1G2ts/NdHM9oEDhYc+o8PnST3luhExkzlZV1rvd+lbEOHSWBxF9UJZoWqaHxPd1oh0dH
	gnjhPuZvftZ/+62IPsijZhRESrvWKSCDvsNoDDn64ukxuZJgCXNhC8uf2ByplBnv4eUfTQOVKRWxy
	XPfxY0WnusjwBLwF+jNM5XWDmpDLPfx2bmuyfaPYJQxyLbbKRMSb2aVjljsiCu/ZSJXaLsYCydm7r
	q67V4bxZ5wm47L9pHG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOBU0-006PS1-2n;
	Tue, 25 Jul 2023 06:25:20 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOBTy-006PQm-2t
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 06:25:20 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-44523d9fd18so1315481137.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 23:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690266315; x=1690871115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEUYA8z3zr7f9Yzq/3gIgIrlPEAwowWK06gnE/zw7M0=;
        b=i7EKm2oYOzfgf70PdZ5PGua72PfIJcNqQ/14LQ/t6WvuZ/RiPPwFdkK63u0swQVFlP
         H0pjPdnOka7zmPj/acw+gWe9LXo/rvZNUDlSka/Rfi7+5ZWTjC3ZemvkNyIfERKBm5Er
         h5anUVpJSJfeCAi4UR3vCwElFwdOMkbnp6tyv9bGfZocLR61D+pG0mavMCrNxTGSzJQF
         Ox8sOXH/DGXs9RUGmhXLShHWv9TvueyjPMDNXFx7dHLu6HjFxwUTIdQbeY71keZo6I7A
         7gyjMzsN2OhA9hHqUIakB9jkwpOnjeOQM1qb9fob00qIIqPTbccECGHt/BexdumTucvS
         yrKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690266315; x=1690871115;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEUYA8z3zr7f9Yzq/3gIgIrlPEAwowWK06gnE/zw7M0=;
        b=NYxsZpjk6oQ1SFI6ntclLSfKuSk0MCgzY23Ne9HSS7LynzDBLtguZSOpzoEg/AMJGO
         zYTw3hgoiwI+VtfFQHqBhKAgoAvl5iop+huQAfmM3OFcZQr6KcTqjszuJxeIJ2DoOZq+
         lH00MjBzMGsvo5/cBbUvhnLVGbDNnqwKbVKyiOmQO2ZYEnPInNAfDyyvIKE6JkdDN6+d
         iod150HnrESYelkGF8oJwAVFHPtyOmvcAi1P3NPLChQ/LEnvDysM+/bXA0yVfzCh/v6y
         aacIMvrzSX4B/g+pemf0/LdPxrcVZgM/sZ/siqPCPmkJhgQAzrG87zDwMJbB0CPIrK8i
         jMLg==
X-Gm-Message-State: ABy/qLabZZjGSU7YiktcoKUe/ZNES2dFpM0GkKP42sidfuRvISc+wFRF
	KewDbXvaDIrPAxsmtoLsus3ZhxSRXw4oIooE+tyBggHMI9X0lrwD
X-Google-Smtp-Source: APBJJlHJX/cbANhDpAwmzq/zB7fKISef8BsNSx7J2O7kTpMFv7YZqNJyI4jgDUIifS+KHaEBaapX/DMRnPc4DiDDEOo=
X-Received: by 2002:a67:ec94:0:b0:446:eb8e:8940 with SMTP id
 h20-20020a67ec94000000b00446eb8e8940mr2881382vsp.16.1690266314724; Mon, 24
 Jul 2023 23:25:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230724132736.124106-1-luxu.kernel@bytedance.com>
 <e75d0e92-1e6e-43c2-1935-00f22df5579d@codethink.co.uk> <20230724-anatomist-evade-ef89a12a491a@wendy>
In-Reply-To: <20230724-anatomist-evade-ef89a12a491a@wendy>
From: Xu Lu <luxujoy@gmail.com>
Date: Tue, 25 Jul 2023 14:25:03 +0800
Message-ID: <CAEuiHnxkc3uO0==bo1R19SiS7DmuOQ5DMc2wjLbPxFhY4urYOA@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix local irq restore when flags indicates irq disabled
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, luxu.kernel@bytedance.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_232518_936604_C0CD8A03 
X-CRM114-Status: GOOD (  26.07  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMTA6MDPigK9QTSBDb25vciBEb29sZXkKPGNvbm9yLmRv
b2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDI0LCAyMDIzIGF0IDAy
OjQyOjUwUE0gKzAxMDAsIEJlbiBEb29rcyB3cm90ZToKPiA+IE9uIDI0LzA3LzIwMjMgMTQ6Mjcs
IGx1eHUua2VybmVsIHdyb3RlOgo+ID4gPiBXaGVuIGFyY2hfbG9jYWxfaXJxX3Jlc3RvcmUoKSBp
cyBjYWxsZWQgd2l0aCBmbGFncyBpbmRpY2F0aW5nIGlycXMKPiA+ID4gZGlzYWJsZWQsIHdlIG5l
ZWQgdG8gY2xlYXIgU1JfSUUgYml0IGluIENTUl9TVEFUVVMsIHdoZXJlYXMgY3VycmVudAo+ID4g
PiBpbXBsZW1lbnRhdGlvbiBiYXNlZCBvbiBjc3Jfc2V0KCkgZnVuY3Rpb24gb25seSBzZXRzIFNS
X0lFIGJpdCBvZgo+ID4gPiBDU1JfU1RBVFVTIHdoZW4gU1JfSUUgYml0IG9mIGZsYWdzIGlzIGhp
Z2ggYW5kIGRvZXMgbm90aGluZyB3aGVuCj4gPiA+IFNSX0lFIGJpdCBvZiBmbGFncyBpcyBsb3cu
Cj4gPiA+Cj4gPiA+IFRoaXMgY29tbWl0IHN1cHBsaWVzIGNzciBjbGVhciBvcGVyYXRpb24gd2hl
biBjYWxsaW5nIGlycSByZXN0b3JlCj4gPiA+IGZ1bmN0aW9uIHdpdGggZmxhZ3MgaW5kaWNhdGlu
ZyBpcnEgZGlzYWJsZWQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IGx1eHUua2VybmVsIDxs
dXh1Lmtlcm5lbEBieXRlZGFuY2UuY29tPgo+ID4KPiA+IHJlYWwtbmFtZXMgYXJlIHJlcXVpcmVk
IGZvciBzaWdub2ZmCj4KPiBBbmQgdGhlIEZyb206IGFkZHJlc3MgbmVlZHMgdG8gbWF0Y2ggdGhl
IHNpZ25vZiwgaGVyZSB0aGUgRnJvbTogYWRkcmVzcwo+IGlzIGEgZ21haWwgb25lLgo+Cj4gPiA+
IC0tLQo+ID4gPiAgIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vaXJxZmxhZ3MuaCB8IDUgKysrKy0K
PiA+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4g
PiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmgg
Yi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdzLmgKPiA+ID4gaW5kZXggMDhkNGQ2YTVi
N2U5Li43YzMxZmMzYzM1NTkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vaXJxZmxhZ3MuaAo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2lycWZsYWdz
LmgKPiA+ID4gQEAgLTQ5LDcgKzQ5LDEwIEBAIHN0YXRpYyBpbmxpbmUgaW50IGFyY2hfaXJxc19k
aXNhYmxlZCh2b2lkKQo+ID4gPiAgIC8qIHNldCBpbnRlcnJ1cHQgZW5hYmxlZCBzdGF0dXMgKi8K
PiA+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQgYXJjaF9sb2NhbF9pcnFfcmVzdG9yZSh1bnNpZ25l
ZCBsb25nIGZsYWdzKQo+ID4gPiAgIHsKPiA+ID4gLSAgIGNzcl9zZXQoQ1NSX1NUQVRVUywgZmxh
Z3MgJiBTUl9JRSk7Cj4gPiA+ICsgICBpZiAoZmxhZ3MgJiBTUl9JRSkKPiA+ID4gKyAgICAgICAg
ICAgY3NyX3NldChDU1JfU1RBVFVTLCBTUl9JRSk7Cj4gPiA+ICsgICBlbHNlCj4gPiA+ICsgICAg
ICAgICAgIGNzcl9jbGVhcihDU1JfU1RBVFVTLCBTUl9JRSk7Cj4gPiA+ICAgfQo+ID4gPiAgICNl
bmRpZiAvKiBfQVNNX1JJU0NWX0lSUUZMQUdTX0ggKi8KPiA+Cj4gPiBJIHRoaW5rIHRoaXMgaXMg
Y29ycmVjdCwgSSB3b25kZXIgaG93IGxvbmcgdGhpcyBoYXMgYmVlbiBnb2luZyBvbgo+ID4gd2l0
aG91dCBhbnlvbmUgbm90aWNpbmc/Cj4KPiBDb2RlIGhhcyBiZWVuIGxpa2UgdGhpcyBzaW5jZSA2
ZDYwYjZlZTBjOTcgKCJSSVNDLVY6IERldmljZSwgdGltZXIsCj4gSVJRcywgYW5kIHRoZSBTQkki
KSwgY29tbWl0dGVkIG9uIFR1ZSBTZXAgMjYgMTU6MjY6NDcgMjAxNyAtMDcwMC4KClRoYW5rcyBm
b3IgeW91ciByZXBseS4gSSB3aWxsIHJlc2VuZCB0aGUgcGF0Y2ggd2l0aCByZWFsIG5hbWUgYW5k
CmNvcnJlY3QgbWFpbGJveC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
