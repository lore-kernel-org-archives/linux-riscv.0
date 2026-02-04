Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E116EF99DE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Feb 2026 20:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Message-Id:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=mmC69hXfNKZDwCSo7P0+W1pzSM5xoNX1kPBEKt8f40Y=; b=EE5
	DtmiJ1ipoE+6UIeckMY2cs7YYunweoOvhek2/fPCfWdSK5oACcCl/go4wudzW95uIT+/EP3PMnMee
	57rWV23WYTDlCn1gRqAcypi+qXPBhQomMt3reIXXsKXqZeX0Kzrt1tFrKN0f/vmYv4wqAYc/p/Z/3
	kXlb1yaaF0YwjLLWxbJh/BQmUcdj3CarIb8kZo1U/4YovJKutNOa+n2kpMbWMaC9kp/vJBkPi66Ss
	QBQ0brcRFM6TNfDDYmEFW8bE5giofQocZOgwyH8Wqkn+v5YX5WjLKj3Rkass7Nf0xsDD2OzZVx/Dr
	7sir5yr91uiEyaPowIMPcEs1ScUdcyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqzkX-00000003uLe-0UQg;
	Fri, 13 Feb 2026 20:26:49 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTmR-00000007qda-2JhD
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 03:42:17 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a93210fcc2so5044405ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 19:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770176534; x=1770781334; darn=lists.infradead.org;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxaGgiCs5zBYpfLxe5C7ES0aKYY8NFq6Tb6uEQsWDRI=;
        b=ILb7QmxJ0r7vc1/acWzJEQgT/tzeWbvf+Mu7PZpzbx1zvm80qjPdNLtp8yQ1lM66k/
         auc3hh5+KeameuIqFW3hy396IY1RuR1OSFm878OCu+XjiQoCavgn4nKvKsnCC4noT2Bl
         fGWkp/SzFK1rb3fBnkzOVvIaA9o+g/3l5SuFVDVdSyo1WFTNiaOc/H74rvcGS1rc978t
         1Cmn9JvfUYuYioqkXmXEzq76/rFdClcqLfkteNy43gqPBC5F488t7S1D6CnJbJzYG08F
         Uf/KyRWK1eXtH8z26zij5xgABYx3M9Z0N6qbtmvLuO84mc6MY4X2LchO8+O1ESGd98LA
         kNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770176534; x=1770781334;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uxaGgiCs5zBYpfLxe5C7ES0aKYY8NFq6Tb6uEQsWDRI=;
        b=QJzJDiJAyWePMEKEL0q8JHdHD8D4bZ/HXAWnoqlCcaYG4NgcF0iOjHTVkYQas659aZ
         4yjjZHUtRkS4SjwkaYaj7edSrl9QCOC3QntSqDSG2roD9fvbgzDMvX5QA+B41U62p7LB
         1oyb0MGuGtjdv1p0VOrQ563Mlx4YHLOnRrTIXCT4+X4OZElN8Fw5mxdA92SLh3gIQDXk
         AAKDv4RNnguDwPRKXGAaA+kieVxaaQFJdLsd01Q/cA2vxe0kmVvLdnxtipVTS3A5Ajlv
         zRYUT7sQwHyHaYmVnjgodZsp0ndjNBkvJAV4Y7LMMyc1uv7WotwAEWvM0cmo6bawX3Up
         Gp7w==
X-Forwarded-Encrypted: i=1; AJvYcCUa4C69cW4nknIpfSQ+UxEdHrcZ+EiL4dgGBDbxWxkh0UWgj4/THQmtsg/z08WBbaHKhm1gRAIX4GdfDA==@lists.infradead.org
X-Gm-Message-State: AOJu0YweNshXaMDE968hOCCX8FCggI9BE1d3G0A8ObdRg0eYHRyELx2k
	dFYCNENli8cNNV0UI2AMo98NcJ7+wSVxtlQS9TOddPSvTnaFRlqPmfwB
X-Gm-Gg: AZuq6aJsnRb8ebSUIFDjsWGUPzwnSz0yCdWL3MTcT82LQKEb/9v0tHeGCqtu+/+lmsz
	LRSYFREYh3cWvrVYwKqP6VTN3lASAZMgGkKF/elnfYauexVDCNXf73i6VbJi33ok47IdEp/KlTQ
	e1avort2PCL5F7Lb4s89k37QEzR7Pd3C0IvJNRvbr4ipsx+GqsapgG+5QD821Oxb2xKLXXHdBlg
	zNMCs27mJhJc4GIYuGZMorJ5K/FCm938NUeI/Qt+n9bgRwe0cLbPCb0F8CzQYb7Ak29w96VWQJ5
	hq2DM+lnMoHiVglEp3VXSpdZtiP9EnwGlJdyvqvscsAbcuRK2ddmXjTdza8ImcO+MRzN40Z58NK
	N2ubpczsGWWO5PH8AyBmiONqDdix6ctfDl6WiOcx5KkWO30AI6RyZDKh8Mqzlcdw6O+g3wj/wHa
	Hg9OpelACR3UyukKD7o7r+q4orONJqyp25djwMZwMmKFO5D7s=
X-Received: by 2002:a17:903:228e:b0:2a7:5dbc:ed69 with SMTP id d9443c01a7336-2a933e42981mr16684595ad.27.1770176534174;
        Tue, 03 Feb 2026 19:42:14 -0800 (PST)
Received: from smtpclient.apple ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397cb23sm8257695ad.93.2026.02.03.19.42.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 19:42:13 -0800 (PST)
From: qingwei hu <huqingwei.kernel@gmail.com>
X-Google-Original-From: qingwei hu <qingwei.hu@bytedance.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH] RISC-V: Skip stopping cycle counter
Message-Id: <5A50DBFA-261B-4C12-9291-4FA0190FCC13@bytedance.com>
Date: Wed, 4 Feb 2026 11:41:59 +0800
Cc: alex@ghiti.fr,
 anup@brainfault.org,
 aou@eecs.berkeley.edu,
 atish.patra@linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 mark.rutland@arm.com,
 palmer@dabbelt.com,
 pjw@kernel.org,
 qingwei.hu@bytedance.com,
 will@kernel.org
To: andrew.jones@oss.qualcomm.com
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_194215_593381_165D16C1 
X-CRM114-Status: GOOD (  21.11  )
X-Mailman-Approved-At: Fri, 13 Feb 2026 12:26:48 -0800
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

SGkgRHJldywKClRoYW5rcyBmb3IgdGhlIGhlYWRzLXVwLgoKWWVzLCBDaGVuIFBlaeKAmXMgcGF0
Y2ggZ290IHRoZXJlIGZpcnN0LCBhbmQgSSBub3RpY2VkIGl0IGFsc28gYXZvaWRzIHN0b3BwaW5n
CmBUSU1FYCBhbmQgYElOU1RSRVRgLiBJ4oCZbGwgZm9sbG93IHVwIHRoZXJlIGlmIEkgaGF2ZSBh
bnkgY29tbWVudHMgb3IgdGVzdApyZXN1bHRzIHRvIHNoYXJlLgoKVGhhbmtzLApRaW5nd2VpCgpP
biBXZWQsIEZlYiA0LCAyMDI2IGF0IDg6MzjigK9BTSBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25l
c0Bvc3MucXVhbGNvbW0uY29tPiB3cm90ZToKPiAKPiBPbiBNb24sIEZlYiAwMiwgMjAyNiBhdCAw
NzoxNzoyOFBNICswODAwLCBxaW5nd2VpLmh1IHdyb3RlOgo+PiBGcm9tOiBRaW5nd2VpIEh1IDxx
aW5nd2VpLmh1QGJ5dGVkYW5jZS5jb20+Cj4+IAo+PiBJbiB0aGUgcmlzY3ZfcG11X3NiaSBkcml2
ZXIsIHBtdV9zYmlfc3RvcF9hbGwoKSBpcyBpbnRlbmRlZCB0byBzdG9wCj4+IGFsbCBhdmFpbGFi
bGUgY291bnRlcnMuIEhvd2V2ZXIsIGNvdW50ZXIgMCAodGhlIGN5Y2xlIGNvdW50ZXIpIHNob3Vs
ZAo+PiBiZSBleGNsdWRlZCBmcm9tIHRoaXMgb3BlcmF0aW9uIGJlY2F1c2UgdGhlIGNvdW50ZXIg
bWF5IGJlIHVzZWQgaW4KPj4gdXNlciBtb2RlIGJ5IHJkY3ljbGUuCj4gCj4gSGkgUWluZ3dlaSwK
PiAKPiBJdCBsb29rcyBsaWtlIENoZW4gUGVpIGJlYXQgeW91IHRvIHRoaXNbMV0sIGJ1dCB0aGF0
IHBhdGNoIGFsc28gYXZvaWRzCj4gc3RvcHBpbmcgVElNRSBhbmQgSU5TVFJFVC4KPiAKPiBbMV0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwMTMxMTEyNDQwLjI5MTUtMS1jcDA2MTNA
bGludXguYWxpYmFiYS5jb20vCj4gCj4gVGhhbmtzLAo+IGRyZXcKPiAKPj4gCj4+IFNpZ25lZC1v
ZmYtYnk6IFFpbmd3ZWkgSHUgPHFpbmd3ZWkuaHVAYnl0ZWRhbmNlLmNvbT4KPj4gLS0tCj4+IGRy
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMgfCAxMCArKysrKysrLS0tCj4+IDEgZmlsZSBjaGFu
Z2VkLCA3IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+IAo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wZXJmL3Jpc2N2X3BtdV9zYmkuYyBiL2RyaXZlcnMvcGVyZi9yaXNjdl9wbXVfc2Jp
LmMKPj4gaW5kZXggN2RkMjgyZGE2N2NlLi4yYmMwMDUwZGFiZDIgMTAwNjQ0Cj4+IC0tLSBhL2Ry
aXZlcnMvcGVyZi9yaXNjdl9wbXVfc2JpLmMKPj4gKysrIGIvZHJpdmVycy9wZXJmL3Jpc2N2X3Bt
dV9zYmkuYwo+PiBAQCAtOTAwLDExICs5MDAsMTUgQEAgc3RhdGljIGludCBwbXVfc2JpX2dldF9j
dHJpbmZvKGludCBuY3RyLCB1bnNpZ25lZCBsb25nICptYXNrKQo+PiBzdGF0aWMgaW5saW5lIHZv
aWQgcG11X3NiaV9zdG9wX2FsbChzdHJ1Y3QgcmlzY3ZfcG11ICpwbXUpCj4+IHsKPj4gICAgIC8q
Cj4+IC0gICAgICAqIE5vIG5lZWQgdG8gY2hlY2sgdGhlIGVycm9yIGJlY2F1c2Ugd2UgYXJlIGRp
c2FibGluZyBhbGwgdGhlIGNvdW50ZXJzCj4+IC0gICAgICAqIHdoaWNoIG1heSBpbmNsdWRlIGNv
dW50ZXJzIHRoYXQgYXJlIG5vdCBlbmFibGVkIHlldC4KPj4gKyAgICAgICogTm8gbmVlZCB0byBj
aGVjayB0aGUgZXJyb3IgYmVjYXVzZSB3ZSBhcmUgZGlzYWJsaW5nIGFsbCBhdmFpbGFibGUKPj4g
KyAgICAgICogY291bnRlcnMgKGV4Y2VwdCB0aGUgY3ljbGUgY291bnRlcikgd2hpY2ggbWF5IGlu
Y2x1ZGUgY291bnRlcnMKPj4gKyAgICAgICogdGhhdCBhcmUgbm90IGVuYWJsZWQgeWV0Lgo+PiAr
ICAgICAgKgo+PiArICAgICAgKiBDeWNsZSBjb3VudGVyIGlzIGV4Y2x1ZGVkIGJlY2F1c2UgaXQg
bWlnaHQgYmUgYWNjZXNzZWQgYnkgdXNlcgo+PiArICAgICAgKiBtb2RlIHZpYSByZGN5Y2xlLgo+
PiAgICAgICovCj4+ICAgICBzYmlfZWNhbGwoU0JJX0VYVF9QTVUsIFNCSV9FWFRfUE1VX0NPVU5U
RVJfU1RPUCwKPj4gLSAgICAgICAgICAgICAgIDAsIHBtdS0+Y21hc2ssIFNCSV9QTVVfU1RPUF9G
TEFHX1JFU0VULCAwLCAwLCAwKTsKPj4gKyAgICAgICAgICAgICAgIDAsIHBtdS0+Y21hc2sgJiB+
QklUKDApLCBTQklfUE1VX1NUT1BfRkxBR19SRVNFVCwgMCwgMCwgMCk7Cj4+IH0KPj4gCj4+IHN0
YXRpYyBpbmxpbmUgdm9pZCBwbXVfc2JpX3N0b3BfaHdfY3RycyhzdHJ1Y3QgcmlzY3ZfcG11ICpw
bXUpCj4+IC0tCj4+IDIuMzkuNQo+PiAKPj4gCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+PiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
