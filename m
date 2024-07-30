Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9813BC3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 23:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JBWvbYYWNmLW1UcLtNeAIDz0luYOcw+pNpr5JG+Brm0=; b=r7v9adhZgj1lBO
	ydYkXZvizhpzFo3Zwo7Av7XG4BZawjSpEA+5K9VvxUTIIaP3Po9tXaRULe9xOoCfJpx5LEO9fWbxp
	sT6NmwE/vh/eyYXU34cayR9RLnEVO+RRU/qgZHBHtvhQ+Eee0Xt0RruxfVZnN7LDT8Kp9mnzH5iP5
	v5qjE+uXJAGAVMVsplQQaUuI7nPEbY9OPyJG3lqEvNp/BxjC+40L5eEJkuG7qilKK0hGZP+sqXrbw
	pwbQ+aTxujUKp5imMtEnCWet9wnFpW+ZuOukH5dMRVmV4C34brW23X1toiszvAgg1x9woOo5kWLO2
	Ub4IdKGadyA6YGEm66qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYvu1-0000000GhoL-3t4d;
	Tue, 30 Jul 2024 23:05:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYvty-0000000Ghnn-3QTW
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 23:05:08 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fd78c165eeso43500025ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jul 2024 16:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1722380705; x=1722985505; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nnXntQdX862gVyIztKO/l+KuxZoqT2mA4f4VoFTiDGg=;
        b=OuE/UKEiuQmsg96ivwOOxZIPh2GRXqCBtGG2UP40vsn20ukYNbmMdNUo1DJV5OnGKu
         iPFHrJPJyoqID57Himy3pLf3T94CuIZ6kwWR8vG5IfzaUxNtIY0v+ttEiyzIUstWXeP9
         fZ3irF2361Cire04CBnyG7LHkRVAVDYqWUojvty6pMNB35HxumXCPcxIb4wRGovbFkN5
         27tDWcH3YoLrXRUjcsRFL/8hZBjkpoCwPqo0WT5Z+tqg4okTItMhiMhVzfcb5vARueap
         gC20nTlweitFCt6HDSmKfClj8Lnk6CH11yzjYhrmG5nFQ5be3Ysfq/tkwl10aBXcndq6
         sDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722380705; x=1722985505;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nnXntQdX862gVyIztKO/l+KuxZoqT2mA4f4VoFTiDGg=;
        b=Hd4TebgFYZL/sQ3GlD0ct2USvR7q7+lvXdR5qSonXzZIsOwGstjr9k3MS6rpoYfVUa
         yrDqdtLQFxpMwSdhvTf98dTjwabEqGiu/JCMahITk0qT7uL3RlbJakT2Qxt0O1iaDU0D
         FUNdsS+i0Zdo07bsZczPVDXmkN0m4HBDZz0/1zJUMy8ZlyQ5mXMAeVrZMGkhsc7Ntl9o
         wKRylvRkIY/k5Qc/umCmGb6BB1GkntCLq65DfiM9cUuF2hUT48wHrU8fWfdhE2CtCPl1
         wHbEae+ELAWWV9WBBQbc1OhAkn6VPw1y7jFUpl1rs0hSjXY9VwmqS1TWHZXO5bZgYJqJ
         Nwaw==
X-Forwarded-Encrypted: i=1; AJvYcCULlQ9PPZ6LV/I106VCJxnFCpYKqk4E8FLwFvNNILnGjE73ZB8QJQVXYT4saS6y91S6Fgo5aVBsE80iVaQcrPNTBOdG2VFKHSBl/jmGqKME
X-Gm-Message-State: AOJu0YzYYcZ4r/QRyxnYVxmnjBhZ4F3AX7zL/34U9QZds3ycqCOH12J9
	1ycN08lHdbY8T30l4mQM8hNeDNumW/LNFPOJTz+ss/J/NCgRQ94gTT4+GRb6+D8=
X-Google-Smtp-Source: AGHT+IG8Q55ATj4Ez7sYYAJur1LedubizP92VmcH7tRbhAlzb2pARJxM591+mQYc6UeoR1S4yD8eoA==
X-Received: by 2002:a17:902:e5cf:b0:1fd:9135:64e with SMTP id d9443c01a7336-1ff048a048emr150282655ad.50.1722380705274;
        Tue, 30 Jul 2024 16:05:05 -0700 (PDT)
Received: from x1 ([2601:1c2:1802:170:4520:8165:b9e7:a203])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f94ba7sm107791025ad.248.2024.07.30.16.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 16:05:04 -0700 (PDT)
Date: Tue, 30 Jul 2024 16:05:02 -0700
From: Drew Fustini <drew@pdp7.com>
To: Icenowy Zheng <uwu@icenowy.me>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <dfustini@tenstorrent.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: Document T-Head TH1520
 AP_SUBSYS controller
Message-ID: <ZqlxnlKH60KXi8P0@x1>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
 <20240623-th1520-clk-v2-1-ad8d6432d9fb@tenstorrent.com>
 <57ef2eef45f2de15e6607da266b37b2a.sboyd@kernel.org>
 <CAJM55Z8iF8yV5JK5v6ZtQqS5AaWwCZ7uwhSYb7hdxh0juDFdqg@mail.gmail.com>
 <ZqPQ8X51S6PrzQxI@x1>
 <2375ff5fb664d8de9627e76788bd40b5d8eabf35.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2375ff5fb664d8de9627e76788bd40b5d8eabf35.camel@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_160506_994906_B518E65A 
X-CRM114-Status: GOOD (  28.40  )
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

T24gU2F0LCBKdWwgMjcsIDIwMjQgYXQgMDE6MjE6MzlQTSArMDgwMCwgSWNlbm93eSBaaGVuZyB3
cm90ZToKPiDlnKggMjAyNC0wNy0yNuaYn+acn+S6lOeahCAwOTozOCAtMDcwMO+8jERyZXcgRnVz
dGluaeWGmemBk++8mgo+ID4gT24gRnJpLCBKdWwgMjYsIDIwMjQgYXQgMDM6NDU6MzZBTSAtMDUw
MCwgRW1pbCBSZW5uZXIgQmVydGhpbmcgd3JvdGU6Cj4gPiA+IFN0ZXBoZW4gQm95ZCB3cm90ZToK
PiA+ID4gPiBRdW90aW5nIERyZXcgRnVzdGluaSAoMjAyNC0wNi0yMyAxOToxMjozMSkKPiA+ID4g
PiA+IERvY3VtZW50IGJpbmRpbmdzIGZvciB0aGUgVC1IZWFkIFRIMTUyMCBBUCBzdWItc3lzdGVt
IGNsb2NrCj4gPiA+ID4gPiBjb250cm9sbGVyLgo+ID4gPiA+ID4gCj4gPiA+ID4gPiBMaW5rOgo+
ID4gPiA+ID4gaHR0cHM6Ly9vcGVuYmVhZ2xlLm9yZy9iZWFnbGV2LWFoZWFkL2JlYWdsZXYtYWhl
YWQvLS9ibG9iL21haW4vZG9jcy9USDE1MjAlMjBTeXN0ZW0lMjBVc2VyJTIwTWFudWFsLnBkZgo+
ID4gPiA+ID4gQ28tZGV2ZWxvcGVkLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4K
PiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZpdm8uY29tPgo+
ID4gPiA+ID4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQHRl
bnN0b3JyZW50LmNvbT4KPiA+ID4gPiA+IC0tLQo+ID4gPiA+IAo+ID4gPiA+IEFwcGxpZWQgdG8g
Y2xrLW5leHQKPiA+ID4gCj4gPiA+IFRoYW5rcywgYnV0IHRoaXMgZHJpdmVyIHNlZW1zIGEgYml0
IGluY29tcGxldGUuIFdpdGggdGhpcyBhcHBsaWVkCj4gPiA+IHRoZSBMaWNoZWUgUGkKPiA+ID4g
NEEgbm8gbG9uZ2VyIGJvb3RzIHdpdGhvdXQgdGhlIGNsa19pZ25vcmVfdW51c2VkIGtlcm5lbCBw
YXJhbWV0ZXIuCj4gPiA+IAo+ID4gPiAvRW1pbAo+ID4gCj4gPiBJcyB0aGlzIHRoZSBjYXNlIHdo
ZW4geW91IGFwcGx5IHRoZSBkdHMgcGF0Y2hlcyBmcm9tIHRoaXMgc2VyaWVzPwo+ID4gCj4gPiBU
aGUgZHRzIHBhdGNoZXMgd29uJ3QgZ28gaW4gdW50aWwgNi4xMiBzbyBJIGRvbid0IHRoaW5rIHRo
ZSBwcmVzZW5jZQo+ID4gb2YKPiA+IHRoZSBjbGstdGgxNTIwLWFwLmMgaXRzZWxmIGluIDYuMTEg
d291bGQgYnJlYWsgZXhpc3Rpbmcgc3lzdGVtcy4KPiA+IAo+ID4gVGhhdCBzYWlkLCBJIGhhdmUg
YmVlbiB1c2luZyBjbGtfaWdub3JlX3VudXNlZC4gSSBoYWQgYmVlbiB0aGlua2luZwo+ID4gdGhh
dAo+ID4gbWFkZSBzZW5zZSBiZWNhdXNlIHRoZSBmdWxsIHNldCBvZiBjbG9jayBjb250cm9sbGVy
IGRyaXZlcnMgbGlrZQo+ID4gQU9OX1NVQlNZUyAoYWx3YXlzIG9uKSwgQVVESU9fU1VCU1lTLCBE
U1BfU1VCU1lTLCBldGMsIGFyZSBub3QKPiA+IHByZXNlbnQKPiA+IHlldCBpbiBtYWlubGluZS4g
SG93ZXZlciwgdGhlIFQtSGVhZCB2ZW5kb3Iga2VybmVsIGRvZXMgaGF2ZSBkcml2ZXJzCj4gPiBm
b3IKPiA+IGFsbCB0aG9zZSBjbG9jayBjb250cm9sbGVycyBhbmQgSSB3YXMgc3VwcmlzZWQgdG8g
c2VlIHRoYXQgdGhlIHZlbmRvcgo+ID4ga2VybmVsIGZhaWxzIHRvIGJvb3Qgd2hlbiBJIGp1c3Qg
dGVzdGVkIHJlbW92aW5nIGNsa19pZ25vcmVfdW51c2VkLgo+ID4gCj4gPiBBcyBmb3IgY2xrLXRo
MTUyMC1hcC5jIGluIG1haW5saW5lLCBJJ2xsIGludmVzdGlnYXRlIGZ1cnRoZXIgd2hpY2gKPiA+
IGNsawo+ID4gZGlzYWJsZXMgc2VlbSB0byBjYXVzaW5nIHRoZSBib290IGZhaWx1cmUgd2hlbiB1
c2luZyB0aGUgZHRzIGZyb20KPiA+IHRoaXMKPiA+IHNlcmllcy4gSSBzdXNwZWN0IEkgbWF5IG5l
ZWQgdG8gYWRkIG5vZGVzIHRoYXQgd2lsbCBjYXVzZSB0aGUKPiA+IG5lY2Vzc2FyeQo+ID4gY2xr
cyB0byBiZSBlbmFibGVkIGJ5IHRoZWlyIHJlc3BlY3RpdmUgZHJpdmVycy4KPiAKPiBJZiBkaXNh
YmxpbmcgdGhlIGNsb2NrIGp1c3QgbGVhZHMgdG8gc3lzdGVtIGhhbmcsIHNldHRpbmcKPiBDTEtf
SVNfQ1JJVElDQUwgc2hvdWxkIGJlIHVzZWZ1bCAoYW5kIG5lZWRlZCkgaGVyZS4KClRoYW5rIHlv
dSBmb3IgdGhlIHN1Z2dlc3Rpb24gYWJvdXQgQ0xLX0lTX0NSSVRJQ0FMLgoKSSBoYXZlIGZvdW5k
IHRocm91Z2ggcHJvY2VzcyBvZiBlbGltaW5hdGlvbiB0aGF0IHRoZSAiZW1tYy1zZGlvIiBjbG9j
awooQ0xLX0VNTUNfU0RJTykgZmFpbHMgdG8gd29yayBhZnRlciB0aGUgInZwLWF4aSIgY2xvY2sg
KENMS19WUF9BWEkpIGlzCmRpc2FibGVkLiBJIGFkZGVkIHRoZSBDTEtfSUdOT1JFX1VOVVNFRCBm
bGFnIHRvICJ2cC1heGkiIGFuZCB0aGUgc3lzdGVtCmlzIGFibGUgdG8gYm9vdCBjb3JyZWN0bHku
IEkgdGhpbmsgaW4gdGhhdCBjYXNlIENMS19JU19DUklUSUNBTCBpcyBub3QKbmVlZGVkLgoKSSd2
ZSBiZWVuIHJldmlld2luZyB0aGUgVEgxNTIwIFN5c3RlbSBVc2VyIE1hbnVhbCBbMV0gYW5kIEkg
YW0gdW5jZXJ0YWluCndoeSB0aGUgc3RhdGUgb2YgInZwLWF4aSIgd291bGQgYWZmZWN0ICJlbW1j
LXNkaW8iOgoKICAtIEVNTUNfU0RJT19SRUZfQ0xLX0VOIGlzIGJpdCAzMCBpbiBQRVJJX0NMS19D
RkcgKG9mZnNldCAweDIwNCkuIAogIC0gVlBTWVNfQVhJX0FDTEtfRU4gaXMgYml0IDE1IGluIFZQ
U1lTX0NMS19DRkcgKG9mZnNzZXQgMHgxZTApLgoKSSBkb24ndCBzZWUgYW55IGxpbmthZ2UgYmV0
d2VlbiB0aGVtIGluIHRoZSBwdWJsaWMgZG9jdW1lbnRhdGlvbi4KUmVnYXJkbGVzcywgdGhlIGFk
ZGl0aW9uIG9mIHRoZSBDTEtfSUdOT1JFX1VOVVNFRCBmbGFnIHRvICJ2cC1heGkiIGZpeGVzCnRo
ZSBib290IGZhaWx1cmUsIHNvIEkgd2lsbCBwb3N0IGEgcGF0Y2ggdG8gdGhhdCBlZmZlY3QuCgpU
aGFua3MsCkRyZXcKClsxXSBodHRwczovL29wZW5iZWFnbGUub3JnL2JlYWdsZXYtYWhlYWQvYmVh
Z2xldi1haGVhZC8tL2Jsb2IvbWFpbi9kb2NzL1RIMTUyMCUyMFN5c3RlbSUyMFVzZXIlMjBNYW51
YWwucGRmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
