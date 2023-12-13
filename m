Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B312C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 16:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rBvYFIu/BfW8So9x5qXRR63nSoJ+lXjuQp5R76qSqhM=; b=Rn1RsHQH56ifgQ5EFRifTtDqLV
	3oBTdr2Bd6qcGvsL38A3QXa9BWGLlFDJg9gmnAMYW9xmmns9moeHSuy8nUE+K8UfjBBfO58vwi5YV
	8C+TP8Cr6wZ003INg/rkK0dA1LubsvMV2dsGUiTpAQBuYSFZqLenso1JcH20OclQMlMskXA55wlAa
	kVrvIiAf40FLQ7bDgQ00k6gDd5oZXbzwHzegT3QdzeM8hK9C2J6Rv0u+1im0BZv/V0/qBLyLfSQzD
	8IJvAPFYZD/SZeDTDMo5dU02sNCWWPSMXYntSmbRXKGyYhw/1O83za37l+0ZJal2qDlYszOc4egt1
	KP/3Ik7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRmR-00FOsQ-1Q;
	Wed, 13 Dec 2023 16:08:15 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDRmO-00FOry-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 16:08:14 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-58e256505f7so4027718eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 08:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1702483689; x=1703088489; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zx40J2tgT++jQyUHPjlcucWybX3M+OYwdkP2KsOFssw=;
        b=qCz08wl+nj1TG+J3O1yXuiHcSPxnQuOLZJvyXbQsWRvg6ZWH2D20GNNAJ41Amdg891
         23wCjPea/KV+kPAhCltA+rPFn9O5K64DGWKUYDaH5/kdiQEHgyYQ58NJqi0NxlDxAHQe
         5s7UXfpb26uw1hSEfADaKBUFCy5AhDagY33VsSY5fAC8b6kyhc4X+sjbkyRiIf9Tyfo3
         6jljlVNJHZCRfWtmclNjNO5fkrl5hlM47WaoVL5piw6h8H1ocSHzd2UlZKbY22KWQEXP
         Vq3+Swm3y7UCIoSlKnxicgyOWQsIzgoDbf5gKGqbMFspknv+ZAw5LGeymfYOvvEz3DHN
         CBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702483689; x=1703088489;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zx40J2tgT++jQyUHPjlcucWybX3M+OYwdkP2KsOFssw=;
        b=Oe+coG6Hm0VHmBzL10yXpLml8QVkimLcM7Kt977nItPNTCMDo5sloBTwUw4DAcvjTG
         zFfCpy+XoJJH/QecQ+87vmExZ9VeiduaK0aGMFPosUZRtSPlM3vSpVLExq9JIGEK7Qy8
         GCqlN1hfV/IYu2XoAAP0M39nTz0tsAQCdiPezfv2vX1CdWhq/lHBSlGDg0aAcCMjRvn/
         w3CuGH4OaRCjT/U3B/Zt1Y8yyoztEyraqi3KJ8emNzA+zVs8u9k27+YpP8IhhmleTmWb
         B4q8YZ+U9GtlGRqSauCF39LG5dHTa89QbDOPvdef6rlZ9qshIS14OddSgf9oOvVuW6qU
         /tkg==
X-Gm-Message-State: AOJu0YxVN80ElzPSc5pmGmZ7YUk+o5LR+BiYSPxwJHTtVVBiZ+AV8pcM
	P6Xl2xA/2GLwwpSFDnk7FibhOg==
X-Google-Smtp-Source: AGHT+IGITxIEovt83cuLdcufvp22b0EZLcRZg9QB7IG908WSa2cNw3Dz3M70QMDJmeNr8a0vmmx8vw==
X-Received: by 2002:a4a:d2d7:0:b0:58e:1c47:879e with SMTP id j23-20020a4ad2d7000000b0058e1c47879emr5926912oos.19.1702483689339;
        Wed, 13 Dec 2023 08:08:09 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id x6-20020a4aea06000000b0059030f95ebfsm3002852ood.41.2023.12.13.08.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 08:08:08 -0800 (PST)
Date: Wed, 13 Dec 2023 08:08:08 -0800 (PST)
X-Google-Original-Date: Wed, 13 Dec 2023 08:08:06 PST (-0800)
Subject: Re: [PATCH 0/3] Fix XIP boot and make XIP testable in QEMU
In-Reply-To: <20231212-crabmeat-flatness-3c0d02966551@spud>
CC: vitaly.wool@konsulko.com, Conor Dooley <conor.dooley@microchip.com>,
  aou@eecs.berkeley.edu, alexghiti@rivosinc.com, akpm@linux-foundation.org, andy.chiu@sifive.com,
  anup@brainfault.org, bhe@redhat.com, Bjorn Topel <bjorn@rivosinc.com>, chenjiahao16@huawei.com,
  cleger@rivosinc.com, haxel@fzi.de, greentime.hu@sifive.com, guoren@kernel.org, heiko@sntech.de,
  masahiroy@kernel.org, namcaov@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
  samitolvanen@google.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-62fcfc9e-eb18-48b6-878e-839f28666560@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_080813_004427_1235E971 
X-CRM114-Status: GOOD (  29.73  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAxMiBEZWMgMjAyMyAwNzoxNDo1NCBQU1QgKC0wODAwKSwgQ29ub3IgRG9vbGV5IHdy
b3RlOgo+Cj4gRmlyc3RseSwgbm8gaHRtbCBtYWlscywgdGhleSdyZSByZWplY3RlZCBieSB0aGUg
bGlzdHMgYW5kIGJyZWFrIHBlb3BsZSdzCj4gbWFpbCBmbG93cy4KPgo+IE9uIFR1ZSwgRGVjIDEy
LCAyMDIzIGF0IDAzOjE2OjEzUE0gKzAxMDAsIFZpdGFseSBXb29sIHdyb3RlOgo+PiB0aXMgMTIg
ZGVjLiAyMDIzIGtsLiAxNDoyMyBza3JldiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNy
b2NoaXAuY29tPG1haWx0bzpjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4+Ogo+PiA+IE9uIFR1
ZSwgRGVjIDEyLCAyMDIzIGF0IDAyOjAxOjExUE0gKzAxMDAsIEZyZWRlcmlrIEhheGVsIHdyb3Rl
Ogo+PiA+ID4gWElQIGJvb3Qgc2VlbXMgdG8gYmUgYnJva2VuIGZvciBzb21lIHRpbWUgbm93LiBB
IGxpa2VseSByZWFzb24gd2h5IG5vIG9uZQo+PiA+ID4gc2VlbXMgdG8gaGF2ZSBub3RpY2VkIHRo
aXMgaXMgdGhhdCBYSVAgaXMgbW9yZSBkaWZmaWN1bHQgdG8gdGVzdCwgYXMgaXQgaXMKPj4gPiA+
IGN1cnJlbnRseSBub3QgZWFzaWx5IHRlc3RhYmxlIHdpdGggUUVNVS4KPj4gPiA+Cj4+ID4gPiBU
aGVzZSBwYXRjaGVzIGZpeCB0aGUgWElQIGJvb3QgYW5kIGFsbG93IGFuIFhJUCBidWlsZCB3aXRo
b3V0IEJVSUxUSU5fRFRCLAo+PiA+ID4gd2hpY2ggaW4gdHVybiBtYWtlcyBpdCBlYXNpZXIgdG8g
dGVzdCBhbiBpbWFnZSB3aXRoIHRoZSBRRU1VIHZpcnQgbWFjaGluZS4KPj4gPiAKPj4gPiAKPj4g
PiBBcmUgeW91IGFjdHVhbGx5IHVzaW5nIFhJUCBpbiBzb21ldGhpbmcgb3RoZXIgdGhhbiBRRU1V
PyBUaGUgZmFjdCB0aGF0Cj4+ID4gc29tZSBvZiB0aGUgYmxhbWVkIGZpeGVzIGFyZSBvdmVyIDE4
IG1vbnRocyBvbGQgc3VnZ2VzdHMgdGhhdCB5b3UgYXJlCj4+ID4gbm90IGFjdGl2ZWx5IHVzaW5n
IFhJUCBidWlsZHMgb2YgdGhlIG1haW5saW5lIGtlcm5lbC4KPj4gPiBUaGVyZSBpcyBhIGRlc2ly
ZSB0byByZW1vdmUgWElQIHN1cHBvcnQgKGFtb25nIG90aGVyIHRoaW5ncyksIHNvIGlmIHlvdQo+
PiA+IGRvIGFjdHVhbGx5IGhhdmUgYSB1c2UgY2FzZSBmb3IgaXQsIHNwZWFrIHVwLgo+PiAKPj4g
WWVzLCB3ZSBzdXJlbHkgZG8sIG9uIEsyMTAgZm9yIGluc3RhbmNlLiBJdOKAmXMgdXNpbmcgYW4g
b2xkZXIga2VybmVsIGFuZAo+Cj4gVGhlIGsyMTAgYW5kIG5vbW11IGFyZSBvbiB0aGUgYmxvY2sg
Zm9yIHJlbW92YWwgdG9vIDopCj4gSXMgeW91ciB1c2UgY2FzZSBmb3IgZWl0aGVyIHRoZSBrMjEw
IG9yIFhJUCBzb21ldGhpbmcgb3RoZXIgdGhhbgo+ICJvb2ggdGhpcyB3b3JrcyI/IAoKWWEsIGlm
IHNvbWVvbmUgaXMgYWN0dWFsbHkgdXNpbmcgdGhlIFhJUCAoYW5kL29yIEsyMTAgb3IgTk9NTVUp
IHN0dWZmIAp0aGVuIEknbSBmaW5lIGtlZXBpbmcgaXQuICBXZSdkIGp1c3QgZmlndXJlZCBpdCB3
YXMgcHJvYmFibHkgYnJva2VuIApiZWNhdXNlIG5vYm9keSdkIGJlZW4gcG9zdGluZyBwYXRjaGVz
IGFuZCB3ZSBkaWRuJ3QgaGF2ZSBhbnkgYXV0b21hdGVkIAp0ZXN0cy4gIExvb2tzIGxpa2UgaXQg
d2FzIGJyb2tlbiwgd2hpY2ggaXMgYWx3YXlzIGEgcHJldHR5IHN0cm9uZyBzaWduIAppdCdzIG5v
dCBiZWluZyB1c2VkLgoKPj4gSSBoYXZlbuKAmXQgY2hlY2tlZCB0aGUgbWFpbmxpbmUgc3RhdHVz
IGZvciBhIHdoaWxlCj4KPiBJIGZpZ3VyZWQgdGhhdCB3aGVuIHRoZSByZXF1ZXN0IEkgc2VudCBh
c2tpbmcgaWYgeW91IGNvdWxkIHRlc3QgWElQIHdhcwo+IGlnbm9yZWQuIFdlJ3ZlIGJlZW4gNTAt
NTAgb24gd2hldGhlciBpdCBoYXMgYmVlbiBicm9rZW4gc2luY2UgQWxleCBwdXQKPiB0aGUgZHRi
IGluIHRoZSBmaXhtYXAgfjkgbW9udGhzIGFnby4KPgo+PiBidXQgaXQgaXMgbGlrZWx5IHRoYXQg
SSB3aWxsIGNvbWUgdXAgd2l0aCBzb21lIFhJUCB1cGRhdGVzCj4+IGJlZm9yZSBDaHJpc3RtYXMu
Cj4KPiBNYXkgSSBhc2sgd2hhdCB5b3UgaW50ZW5kIHVwZGF0aW5nPwo+Cj4gQ2hlZXJzLAo+IENv
bm9yLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
