Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CDFC001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Aug 2023 18:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GUD5jSTJNK9vfQFKkgGsiPhs2NXd4CRvlJAKjRcvOk=; b=QCiW52eCuXtD/6
	86G68RhPmZhZaB6ICBHhlwUQfCuUdd+vEy2N3ygPxc278cIzErLESdS4XHU9oCVomBbVutpG0tfZX
	x5o0tYEwj84s9v9ArYTA98ifcI/bLojHyh2GQ5v2zWpCoCSsI0Rg0wy28VxttfoyucaQmpau5c3XO
	tge6aHMwbKqMy65jEYo9hNXHwOUnqcikKF2tHfHsG8P6BHbMXLJnpsioCDOUjTVE7bA1ctivqpMSJ
	yznd5+fjW7rXql7odqf1CtuxD66RazzX4Pjm1LpbxkY+XkIRcqfzXwr7iGzC5A5XJjoIeCO1cuMey
	Z0PeqyJUR7cMJEgUXPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVyw3-002BFh-1i;
	Tue, 15 Aug 2023 18:38:31 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVyw1-002BF2-04
	for linux-riscv@lists.infradead.org;
	Tue, 15 Aug 2023 18:38:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1bdc8081147so22165935ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 15 Aug 2023 11:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1692124706; x=1692729506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sF+cwDNQT+uZaPiDDTMoz6OzsKpTvp3erzo3Rj0grKs=;
        b=dv7XIkl+hk3kQfxv13TRju7OfbWc6xtCFh3vJAocizGBFya10lRk+XpWtRfdN+DyI1
         44H0sEMPGXExXkU6incGJ7STzLczFbH5I1sZKjk7rxi+Q1dK4mhmfQU69wTgzXkEI1dP
         qPoT3nsDQP05EqETsqVoVjdNO6N1yg7BjaIlH3tTT+rqTTQ4Zf4Ax5GD0smTlvHNxDps
         W+Pb+lcTnXYWIZuCv4eqaIh05DOh+c2iajzX+TPpZ/BZY1eOygOkJnxKf5JcpQCQD7zs
         3U7myd1FR4JCVPG3Dn8RWGRAB43csZKlbZs053c90bUHTOjWarMGlg5iqBy3jwVrAGEQ
         0QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692124706; x=1692729506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sF+cwDNQT+uZaPiDDTMoz6OzsKpTvp3erzo3Rj0grKs=;
        b=KtztGuYSiZFGzwmEPOhjaPEiiNhD4kbLhc2POo1Xqwk+DnBeazaIEkiJgkoyDxUlKb
         Po8rg2Er48oz+AzXUL4iR4Rc24HV1hvPNt02PGs00xyaUcgdwyBm+n8FVdZA+A97Ozhg
         P30u9UFZCVjIv7akCYPQIGujdL3mJGpa53d0pZjBR+jPrBo+jznwAdcFkM8jXptFV+52
         d52J7VFcO43K1Gq11qrrauSdlp1TRDtVv39tGWcGtqkhS5I1agx12KrEMG8hOFI0frD5
         2sB6KDIszeb4AyBHxJ/OYN8QvmGp0JR4b1goazaKOD0aPbv3QicVQtwltRCQ7No8/50l
         HTXA==
X-Gm-Message-State: AOJu0YyD9a0qasmvPZ481fo57AQvsp/2mvN6HR0rKyaaQsbOgAJqSzzD
	k90/TiYW9K8spEDli6DNPdIe8w==
X-Google-Smtp-Source: AGHT+IEoy/q9mUWwPMqxGsuzGevjSDRWvRXsimZkzJcdD4KCN2k3JJ/Zgp1nYbrk8s7GE8PQcYr0yQ==
X-Received: by 2002:a17:902:dac4:b0:1ba:fe6a:3845 with SMTP id q4-20020a170902dac400b001bafe6a3845mr3590310plx.11.1692124705743;
        Tue, 15 Aug 2023 11:38:25 -0700 (PDT)
Received: from ziepe.ca ([206.223.160.26])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902768b00b001bb750189desm11380667pll.255.2023.08.15.11.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Aug 2023 11:38:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qVyvv-007hpI-NM;
	Tue, 15 Aug 2023 15:38:23 -0300
Date: Tue, 15 Aug 2023 15:38:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Zong Li <zong.li@sifive.com>
Cc: Baolu Lu <baolu.lu@linux.intel.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com,
	linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>,
	iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 03/11] dt-bindings: Add RISC-V IOMMU bindings
Message-ID: <ZNvGH91EmlOAaxBK@ziepe.ca>
References: <CAK9=C2Vg9eR5LJPeqDDQ0pHZcrT5DOUzA8_wYEVEjfnhb6s8pw@mail.gmail.com>
 <CANXhq0oTrU_-OQroW7H+hvxcU7YROhkgdCF9g_WtPTzVFQL7gA@mail.gmail.com>
 <CAK9=C2XoQjPzZ5yB5jfTbee4-Pb8GgFAZRbfcMwMk9pyo39WxQ@mail.gmail.com>
 <CANXhq0q7R9Srx6U=fReq7LDLFgW6rMmjKH=o6MzDT5AWNRXP6w@mail.gmail.com>
 <592edb17-7fa4-3b5b-2803-e8c50c322eee@linux.intel.com>
 <CANXhq0pS_=YxgrxSKbdfrFdGcBduzk3LTyC4vp_hqoJTbX3e0g@mail.gmail.com>
 <ZMEO1kNGfGjN6kZM@ziepe.ca>
 <CANXhq0qMWS_j0n_aUO8BVFSedYCjuMM=Z_tsnK05ZhG+Ob6pqw@mail.gmail.com>
 <ZNOpbac4i5zfmHj4@ziepe.ca>
 <CANXhq0rzz1Sn8dKvNt7acvKN_g5yXFN9u6XPiRHr9ay7q2VbzA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0rzz1Sn8dKvNt7acvKN_g5yXFN9u6XPiRHr9ay7q2VbzA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_113829_083062_0BD12050 
X-CRM114-Status: GOOD (  27.90  )
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

T24gVHVlLCBBdWcgMTUsIDIwMjMgYXQgMDk6Mjg6NTRBTSArMDgwMCwgWm9uZyBMaSB3cm90ZToK
PiBPbiBXZWQsIEF1ZyA5LCAyMDIzIGF0IDEwOjU34oCvUE0gSmFzb24gR3VudGhvcnBlIDxqZ2dA
emllcGUuY2E+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgSnVsIDI3LCAyMDIzIGF0IDEwOjQyOjQ3
QU0gKzA4MDAsIFpvbmcgTGkgd3JvdGU6Cj4gPgo+ID4gPiBQZXJoYXBzIHRoaXMgcXVlc3Rpb24g
Y291bGQgYmUgcmVsYXRlZCB0byB0aGUgc2NlbmFyaW9zIGluIHdoaWNoCj4gPiA+IGRldmljZXMg
d2lzaCB0byBiZSBpbiBieXBhc3MgbW9kZSB3aGVuIHRoZSBJT01NVSBpcyBpbiB0cmFuc2xhdGlv
bgo+ID4gPiBtb2RlLCBhbmQgd2h5IElPTU1VIGRlZmluZXMvc3VwcG9ydHMgdGhpcyBjYXNlLiBD
dXJyZW50bHksIEkgY291bGQKPiA+ID4gZW52aXNpb24gYSBzY2VuYXJpbyB3aGVyZSBhIGRldmlj
ZSBpcyBhbHJlYWR5IGNvbm5lY3RlZCB0byB0aGUgSU9NTVUKPiA+ID4gaW4gaGFyZHdhcmUsIGJ1
dCBpdCBpcyBub3QgZnVuY3Rpb25pbmcgY29ycmVjdGx5LCBvciB0aGVyZSBhcmUKPiA+ID4gcGVy
Zm9ybWFuY2UgaW1wYWN0cy4gSWYgbW9kaWZ5aW5nIHRoZSBoYXJkd2FyZSBpcyBub3QgZmVhc2li
bGUsIGEKPiA+ID4gZGVmYXVsdCBjb25maWd1cmF0aW9uIHRoYXQgYWxsb3dzIGJ5cGFzcyBtb2Rl
IGNvdWxkIGJlIHByb3ZpZGVkIGFzIGEKPiA+ID4gc29sdXRpb24uIFRoZXJlIG1pZ2h0IGJlIG90
aGVyIHNjZW5hcmlvcyB0aGF0IEkgbWlnaHQgaGF2ZSBvdmVybG9va2VkLgo+ID4gPiBJdCBzZWVt
cyB0byBtZSBzaW5jZSBJT01NVSBzdXBwb3J0cyB0aGlzIGNvbmZpZ3VyYXRpb24sIGl0IHdvdWxk
IGJlCj4gPiA+IGFkdmFudGFnZW91cyB0byBoYXZlIGFuIGFwcHJvYWNoIHRvIGFjaGlldmUgaXQs
IGFuZCBEVCBtaWdodCBiZSBhCj4gPiA+IGZsZXhpYmxlIHdheS4KPiA+Cj4gPiBTbyBmYXIgd2Un
dmUgdGFrZW4gdGhlIGFwcHJvYWNoIHRoYXQgYnJva2VuIGhhcmR3YXJlIGlzIHF1aXJrZWQgaW4g
dGhlCj4gPiBrZXJuZWwgYnkgbWF0Y2hpbmcgT0YgY29tcGF0aWJsZSBzdHJpbmcgcGF0dG5lcnMu
IFRoaXMgaXMgSFcgdGhhdCBpcwo+ID4gY29tcGxldGVseSBicm9rZW4gYW5kIHRoZSBJT01NVSBk
b2Vzbid0IHdvcmsgYXQgYWxsIGZvciBpdC4KPiA+Cj4gPiBIVyB0aGF0IGlzIHNsb3cgb3Igd2hh
dGV2ZXIgaXMgbm90IHF1aXJrZWQgYW5kIHRoaXMgaXMgYW4gYWRtaW4gcG9saWN5Cj4gPiBjaG9p
Y2Ugd2hlcmUgdGhlIHN5c3RlbSBzaG91bGQgbGFuZCBvbiB0aGUgc2VjdXJpdHkvcGVyZm9ybWFu
Y2UKPiA+IHNwZWN0cnVtLgo+ID4KPiA+IFNvIEknbSBub3Qgc3VyZSBhZGRpbmcgRFQgbWFrZXMg
c2Vuc2UgaGVyZS4KPiA+Cj4gCj4gSGkgSmFzb24sCj4gU29ycnkgZm9yIGJlaW5nIGxhdGUgaGVy
ZSwgSSBoYWRuJ3Qgbm90aWNlZCB0aGlzIHJlcGx5IGVhcmxpZXIuIFRoZQo+IGFwcHJvYWNoIHNl
ZW1zIHRvIGFkZHJlc3MgdGhlIHNpdHVhdGlvbi4gQ291bGQgeW91IGtpbmRseSBwcm92aWRlCj4g
aW5mb3JtYXRpb24gYWJvdXQgdGhlIGxvY2F0aW9uIG9mIHRoZSBwYXRjaGVzPyBJIHdhcyB3b25k
ZXJpbmcgYWJvdXQKPiBmdXJ0aGVyIGRldGFpbHMgcmVnYXJkaW5nIHRoaXMgcGFydGljdWxhciBp
bXBsZW1lbnRhdGlvbi4gVGhhbmtzCgpUaGVyZSBhcmUgYSBjb3VwbGUgdmVyc2lvbnMsIGVnICAK
IGFybV9zbW11X2RlZl9kb21haW5fdHlwZSgpCiBxY29tX3NtbXVfZGVmX2RvbWFpbl90eXBlKCkK
Ckphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
