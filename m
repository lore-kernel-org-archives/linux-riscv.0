Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F458E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIs+EkDpoUzhK1DNJvMczik3Eadsy8NMJ3BL0j9MJnQ=; b=bPVX8yTaZ0AFw6
	uNimREPMqGVf10W/q0IX9cj4MY5QRXAZbMlGo6FgDTWzN7G4PglVGAYZUdeiCbB8qS1/MGpFthmQz
	PtvS1D2A0//KxUQKhshbNrJeA72ZkHTdpvjBTGZD1WD4zgQe6MNJ3bSCXWZKAy7rE6hS7CIvubk8r
	YEfpnElYnljOfq5OWsrG54sv/z/bN/GE1653GnzVJILJZMiX6QsJYFeIyyyU2FWfjGgmkJuJaK4G5
	yls4FDJeul6IURznMVUf3ApW78FMBJNo2CEvUOv+kuq8sRo1WlnPq+9aMLRvTynHy65zpSLIC8XZx
	XLTwN1SY4nQu9P2oBzwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpsMM-00B5aa-2i;
	Mon, 09 Oct 2023 15:39:54 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpsMJ-00B5Xe-0o
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 15:39:54 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5363227cc80so7658829a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 08:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696865986; x=1697470786; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dce5tc48MmXb1BeLD+z3c8yQ/TXHxZJ5ZFrvkB3IrkI=;
        b=Ix01OwZ4+xHBfvMLTCprA9FSghNEZFkpLmxTjBP2uX8t+IUhbs07+F2mFAakrsNZzU
         SESqHi5l6ZJKQkEGeheoq24NoxpoOaEYof8zTKLPWw/9AXhIzviOn8VNPYoTk5DXJ2fr
         5NmvgvcHUyM8pa3HTAN870PTF2XTaSjdyD3J5ua7CXXqDvxcvHQsjs9DMelOuODucCkD
         77wdUz6Iea6Z9nDmIsbmbY0I/d3PIvec0j41DNJcFbVntfJzg+zEO04ti+kabiYz8aWe
         WHzg5lvnPel6qjPrSpxImlGDCTxbb+UMn/T4lB2JKu/HKUVorj4FYF05LO5ocKGsQGJe
         9SAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696865986; x=1697470786;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dce5tc48MmXb1BeLD+z3c8yQ/TXHxZJ5ZFrvkB3IrkI=;
        b=OSz12QfhHOH2h7Sk+uo6SfV9dEKWP1J6kXQwFlsWowWmoSY0FSjz1O8fKiNLiV2NEu
         o3D7tFbTpgq39hkl+PpPAZ80al/ESZB7GPV1bGeZHsdOFYG2vNcP3Sw3usw+/Lk45p3N
         LIj7hIeEtpldU8VgN7DKVUuIgeULpTQS8G2+2rAJIZ7Sb9WywiEa9tEILXlnV9RmxRZX
         YvQgDhCm0cctmuEryw+2EH1QhuWDUKye2qQBbTu10CHRjCbqB9GQsPKPAfO7V55Rx+5r
         sxpDkApT7Oh95J67ixxtqKEW2gkDlwJ4AawIwJWZp/IVFwfUBQMM9QdVFPiaLuxlB6u+
         CuUA==
X-Gm-Message-State: AOJu0YwsyAUMBPV/vNpIhsiUSd1Xpqa5PtwoY98SZbghj7m735xEZCbH
	5VTpQb1vjN1N2S8Cyovol4NMMA==
X-Google-Smtp-Source: AGHT+IE2EWq6xiYPbGBRAOQrZzbwY5ZGZRSEfIsP1pUiBjlDv5qogf5sfPomc3231IlrxBZYEWBjrQ==
X-Received: by 2002:a05:6402:1357:b0:533:4a9a:b0e6 with SMTP id y23-20020a056402135700b005334a9ab0e6mr14536520edw.20.1696865985838;
        Mon, 09 Oct 2023 08:39:45 -0700 (PDT)
Received: from localhost ([176.74.158.132])
        by smtp.gmail.com with ESMTPSA id j17-20020aa7c411000000b0053635409213sm6291715edq.34.2023.10.09.08.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 08:39:45 -0700 (PDT)
Date: Mon, 9 Oct 2023 17:39:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Evan Green <evan@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, conor.dooley@microchip.com, 
	apatel@ventanamicro.com
Subject: Re: [RFC PATCH 3/5] RISC-V: hwprobe: Introduce which-cpus flag
Message-ID: <20231009-26f43e41ddc98f0263f4258d@orel>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
 <20230921125518.175428-10-ajones@ventanamicro.com>
 <CALs-HstCDZK3BPpubW8FqWQ8w4qH-_Zfgv3YhUYOgguv-OWufw@mail.gmail.com>
 <20231005-f530ebe8df5c0880e53fcfa3@orel>
 <CALs-Hsu3QCvjm7ERTFHqF+GjqkfK2x_eUbca2OjD0TzrCukABA@mail.gmail.com>
 <20231005-5221bab223ee6d8a4c77b23d@orel>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231005-5221bab223ee6d8a4c77b23d@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_083951_289025_F57BF357 
X-CRM114-Status: GOOD (  27.37  )
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

T24gVGh1LCBPY3QgMDUsIDIwMjMgYXQgMDg6MTE6MjVQTSArMDIwMCwgQW5kcmV3IEpvbmVzIHdy
b3RlOgo+IE9uIFRodSwgT2N0IDA1LCAyMDIzIGF0IDEwOjEyOjE0QU0gLTA3MDAsIEV2YW4gR3Jl
ZW4gd3JvdGU6Cj4gPiBPbiBUaHUsIE9jdCA1LCAyMDIzIGF0IDY6MjPigK9BTSBBbmRyZXcgSm9u
ZXMgPGFqb25lc0B2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gTW9uLCBT
ZXAgMjUsIDIwMjMgYXQgMDk6MTY6MDFBTSAtMDcwMCwgRXZhbiBHcmVlbiB3cm90ZToKPiAuLi4K
PiA+ID4gPiBTbyBpZiBJIHdyaXRlIG91dCB0aGlzIGFsZ29yaXRobSwgSSBnZXQgc29tZXRoaW5n
IGxpa2U6Cj4gPiA+ID4gICogQ3JlYXRlIGFuIGFycmF5IG9mIGV2ZXJ5IHBvc3NpYmxlIGtleSwg
YW5kIGRlZHVwZSB0aGUgY2FsbGVyJ3MgbGlzdAo+ID4gPiA+IG9mIHBhaXJzIGludG8gdGhpcyBh
cnJheS4KPiA+ID4gPiAgKiBGb3IgZWFjaCByZW1haW5pbmcgY3B1LCBnbyB0aHJvdWdoIHRoaXMg
YXJyYXkgYW5kIGVpdGhlciBjb25maXJtCj4gPiA+ID4gdGhlIGJpZyBhcnJheSdzIGVsZW1lbnQg
bWF0Y2hlcyB0aGlzIGNwdSdzIHZhbHVlLCBvciBjbGVhciB0aGUgY3B1Cj4gPiA+ID4gZnJvbSB0
aGUgcmVzdWx0IHNldC4KPiA+ID4gPgo+ID4gPiA+IEJ1dCB3aHkgZG8gd2UgZ28gdG8gYWxsIHRo
ZSBlZmZvcnQgb2YgZGUtZHVwaW5nIHRoZSBjYWxsZXIncyBhcnJheSBvZgo+ID4gPiA+IHBhaXJz
PyBDYW4ndCB0aGV5IGRvIHRoYXQgdGhlbXNlbHZlcyAob3IgcGF5IGEgc21hbGwgcGVyZm9ybWFu
Y2UKPiA+ID4gPiBwZW5hbHR5IGZvciAieWVzIiByZXN1bHRzKT8gSW5zdGVhZCwgY291bGRuJ3Qg
aXQgYmUgc29tZXRoaW5nIGxpa2U6Cj4gPiA+ID4gRm9yIGVhY2ggcGFpciBpbiB0aGUgdXNlcidz
IHNldCwgZm9yIGVhY2ggcmVtYWluaW5nIGNwdSBpbiB0aGUgc2V0LAo+ID4gPiA+IGNvbXBhcmUg
dGhlIHZhbHVlcywgb3IgY2xlYXIgdGhlIGNwdSBpbiB0aGUgcmVtYWluaW5nIHNldC4KPiA+ID4g
Pgo+ID4gPiA+IERvaW5nIHRoYXQgd291bGQgYWxzbyB0YWtlIHRoZSBydW50aW1lIGZyb20gTyhr
ZXlzcGFjZSAqIG5jcHVzKSB0bwo+ID4gPiA+IE8ocXVlcnlfbGVuZ2ggKiBuY3B1cykuCj4gPiA+
Cj4gPiA+IEkgd2FudCB0byBkZS1kdXBlIGZvciB0d28gcmVhc29uczoKPiA+ID4gICogcXVlcnlf
bGVuZ3RoIGlzIHVuYm91bmRlZCwgYnV0IGtleXNwYWNlIGlzIGJvdW5kZWQgKGFuZCBpcyBjdXJy
ZW50bHkKPiA+ID4gICAgc21hbGwpCj4gPiAKPiA+IE9rLCBidXQgcmVtZW1iZXIgdGhhdCBpZiB3
ZSBzaGlwIHRoaXMgYmVoYXZpb3IgdG9kYXksIHdlJ3JlIGNvbW1pdHRlZAo+ID4gdG8gaXQgZm9y
ZXZlci4gVGhlIGtleXNwYWNlIGlzIGxpa2VseSB0byBncm93LCBpdCB3b3VsZCBiZSB1bmZvcnR1
bmF0ZQo+ID4gaWYgdGhpcyBzdGVwIHN0YXJ0ZWQgdG8gY2F1c2UgYSBub3RpY2VhYmxlIHBlcmZv
cm1hbmNlIGRlbGF5Lgo+IAo+IE1heWJlIGl0J3Mgbm90IHRvbyBsYXRlIHRvIHB1dCBhIGJvdW5k
IG9uIHBhaXJzLCBpLmUuIHBhaXJfY291bnQgZ3JlYXRlcgo+IHRoYW4gc29tZSBudW1iZXIgc2hv
dWxkIHJldHVybiBFMkJJRy4KPgoKU2NyYXRjaCB0aGlzIGlkZWEuIEkgd2VudCBsb29raW5nIGZv
ciBwcmVjZWRlbnQgZm9yIGxpbWl0aW5nIHRoZSBsZW5ndGggb2YKaW5wdXQgYXJyYXlzIHRvIHN5
c2NhbGxzLCBidXQgY291bGRuJ3QgZmluZCBhbnkuIFRvIHRoZSBjb250cmFyeSwgSSBmb3VuZAp0
aGF0IG1vdmVfcGFnZXMoKSB1c2VkIHRvIHJldHVybiBFMkJJRyB3aGVuIHRoZXJlIHdlcmUgInRv
byBtYW55IHBhZ2VzIHRvCm1vdmUiLCBidXQgaXQgaGFzbid0IGRvbmUgc28gc2luY2UgMi42LjI5
IGFuZCwgZXZlbiB0aGVuLCBpdCBhcHBlYXJzIHRoZQpjb25jZXJuIHdhcyBtdWx0aXBsaWNhdGlv
biBvdmVyZmxvdywgbm90IGhhdmluZyAidG9vIG11Y2giIHdvcmsuIFNvLCB3ZQpzaG91bGQgbGVh
dmUgdGhlIG51bWJlciBvZiBwYWlycyB1bmJvdW5kZWQsIGJ1dCwgdG9vIG1lLCB0aGF0IG1lYW5z
IHdlCnNob3VsZCBkZS1kdXBlLCBzaW5jZSB3ZSBjYW4gZG8gdGhlIGNvcHlfZnJvbV91c2VyKCkg
b25jZSBmb3IgZWFjaCBhdCB0aGF0CnRpbWUsIGFuZCBhbnkgdXNlciB3aGljaCBkZWNpZGVzIHRv
IHByb3ZpZGUgZWFjaCBiaXQgc2VwYXJhdGVseSBmb3IgZWFjaApiaXRtYXNrIGtleSB0eXBlIHNo
b3VsZCBnZXQgdGlueSBzcGVlZHVwLgoKVGhhbmtzLApkcmV3CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
