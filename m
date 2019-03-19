Return-Path: <SRS0=7N9o=RW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC873C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 06:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E7D920872
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Mar 2019 06:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DjhqFY5x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="aJGHy2qO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E7D920872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KS1+4z+7/aZib0nnfaGaJgL5IOqBha6rjMURUJAyos0=; b=DjhqFY5xZiMuI3
	oBwQMO6/NocR39uOYPhvm1lxcU3atZ3WF558fRKe3emuaRv2Zmn8XlkSEx+zE3KFJg3rDtievHW3a
	PwT6g9LgN59MP0zFy9jSOF9+UmTF9G3q95rPgmxXPgvIG4CmEmTMkBuPxKS0G23FpwkAsAWLJ7Nvx
	tXKlDSEfGkLwiHAE1yV1nVl6h+dVObfpDhVIXF8DQSggWj+0l+fnfZlxJWHX75D/HYplN43H03lZk
	iFsfGw73AlPqjVOGQXz6H5Yz6XoN+KSYqaQejF/Szna+GTs0UxfayrTaahkaYH0pkUf5Xu5IaY2ST
	lQfEnGdtU+hAwNim5Q7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h68DX-0006Ff-0g; Tue, 19 Mar 2019 06:27:19 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h68DS-0006EP-Lm
 for linux-riscv@lists.infradead.org; Tue, 19 Mar 2019 06:27:17 +0000
Received: by mail-lj1-x242.google.com with SMTP id j89so4816557ljb.1
 for <linux-riscv@lists.infradead.org>; Mon, 18 Mar 2019 23:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jDL+Fn/cQghWTA3oSma3bwThX7AoUICzbfrMolBsrFE=;
 b=aJGHy2qO3QO4M/a5ud5O/SlM0dVAYdF6QRE2rNIvz8tFeuDop2+I5kIWHNDqgnvW7W
 HDLTi0DNUZKzsbPOtdkxifPlz3ZIwWx5CRYuMFf1knwaJ56GsmHJUGeHNT/GuPQvvoBl
 tV1+2e5KXv5jYdWp+A9od3APsryHLgy4z64ADkdtaxByar+UyK444xrXB1wEKw0Lv1p0
 9CjMWkaqx+G7MbWJCagEclth6apopL9gnGHF4HlVj1N4Ros6IFx7wYSl+ueHaTTtgHOn
 ssE4Ni0Fmy5Me0xrCHJWLinUwqBMLYMbPPUPR4PnbS5jZXAy8LX1wEIM0VRDUE8zLHLt
 GWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jDL+Fn/cQghWTA3oSma3bwThX7AoUICzbfrMolBsrFE=;
 b=QOzlnxxmYm22O0mmig8a0T9F/THPpahroWpe/MfWwJQTWxDE1/7CGO522vTpZ2eRqz
 qV9vGsVGsnNjQR+zn5/erc8fqGlozdL2YlgejY9YDVzHCbzVtZshz/tR6+waUo8ZoSYn
 FU2boOKnNqFhTDdlAT4/XYy2JGQZcdqnst42fwdIdPMuGBmvNeMfAlEdRGL3MVFoHgbG
 F+SQOaiTsFwYeD+1zsRbsEqTPZy221JrnOXmEtar+z16Yd/OVCUhxrROYqs/72XFCZWq
 R3JrRz/hBdKxiEFWw628kgeaxGkcH4fwyUyDmhXoWRHiED3Fez307pxICms3DMlCRc+1
 spYw==
X-Gm-Message-State: APjAAAXSN9bHqf6FqBOiOTLQRhJ1l4BK433aRjHEj3J97YLZgkTWcPvg
 hY1tFc3VgzGrD9sKHw6JJ3C+6tV0osfc8quTCSHh9Q==
X-Google-Smtp-Source: APXvYqw7VoscLsbG/LdUeNfMqcTLTM/iY0hRK/0p6LScyzfmWl4haKxSl1YeGl34sr3ieHRu/s8756NN9VRXTR4LXOc=
X-Received: by 2002:a2e:42cf:: with SMTP id h76mr4726655ljf.95.1552976832134; 
 Mon, 18 Mar 2019 23:27:12 -0700 (PDT)
MIME-Version: 1.0
References: <1552378289-27245-1-git-send-email-yash.shah@sifive.com>
 <mvmimwotn60.fsf@suse.de>
 <CAJ2_jOE3RH9FyFg_NATcLEpHv5y89zdh06Ji2x8n3C_gp-wn6A@mail.gmail.com>
 <mvm5zsgp00d.fsf@suse.de>
In-Reply-To: <mvm5zsgp00d.fsf@suse.de>
From: Yash Shah <yash.shah@sifive.com>
Date: Tue, 19 Mar 2019 11:56:35 +0530
Message-ID: <CAJ2_jOHoNnBF2UwU6G1vdvNrJAUJdGL_RncRAOaXMWoS03cagA@mail.gmail.com>
Subject: Re: [PATCH v9 0/2] PWM support for HiFive Unleashed
To: Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_232716_471289_D9ADFD24 
X-CRM114-Status: GOOD (  11.39  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, Sachin Ghadi <sachin.ghadi@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBNYXIgMTgsIDIwMTkgYXQgMTA6NTYgUE0gQW5kcmVhcyBTY2h3YWIgPHNjaHdhYkBz
dXNlLmRlPiB3cm90ZToKPgo+IE9uIE3DpHIgMTUgMjAxOSwgWWFzaCBTaGFoIDx5YXNoLnNoYWhA
c2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiA+IFlvdSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGUgcGVyaW9k
IHNldHRpbmcgaXMgcGFzc2VkIHZpYSB0aGUKPiA+IGNvbnZlbnRpb25hbCB3YXkgaW4gRFQgZmls
ZS4KPiA+IEV4YW1wbGU6Cj4gPiBwd21sZWRzIHsKPiA+ICAgICBjb21wYXRpYmxlID0gInB3bS1s
ZWRzIjsKPiA+ICAgICBoZWFydGJlYXQgewo+ID4gICAgICAgICBwd21zID0gPCZMNDUgMCAxMDAw
MDAwMCAwPjsKPiA+ICAgICAgICAgbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKPiA+ICAgICAgICAg
bGludXgsZGVmYXVsdC10cmlnZ2VyID0gImhlYXJ0YmVhdCI7Cj4gPiAgICAgfTsKPiA+IH07Cj4K
PiBJJ3ZlIG5vdyBtYW5hZ2VkIHRvIGJ1aWxkIGEgd29ya2luZyBGU0JMIHdpdGggdGhhdCBjaGFu
Z2UsIGJ1dCB0aGF0Cj4gZGlkbid0IGNoYW5nZSBhbnl0aGluZy4gIFRoZXJlIGlzIG5vdCBldmVu
IGEgaGVhcnRiZWF0IG9wdGlvbiBpbgo+IC9zeXMvY2xhc3MvbGVkcy9oZWFydGJlYXQvdHJpZ2dl
ciBhbnkgbW9yZS4KCkJlbG93IGlzIHRoZSBjb3B5IG9mIHRoZSBwd20gbm9kZXMgaW4gbXkgRFRT
IGZpbGU6CgpMNDU6IHB3bUAxMDAyMDAwMCB7CiAgICAgICAgY29tcGF0aWJsZSA9ICJzaWZpdmUs
cHdtMCI7CiAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwmcGxpYzA+OwogICAgICAgIGludGVy
cnVwdHMgPSA8NDIgNDMgNDQgNDU+OwogICAgICAgIHJlZyA9IDwweDAgMHgxMDAyMDAwMCAweDAg
MHgxMDAwPjsKICAgICAgICByZWctbmFtZXMgPSAiY29udHJvbCI7CiAgICAgICAgY2xvY2tzID0g
PCZwcmNpIDM+OwogICAgICAgICNwd20tY2VsbHMgPSA8Mj47Cn07Ckw0NjogcHdtQDEwMDIxMDAw
IHsKICAgICAgICBjb21wYXRpYmxlID0gInNpZml2ZSxwd20wIjsKICAgICAgICBpbnRlcnJ1cHQt
cGFyZW50ID0gPCZwbGljMD47CiAgICAgICAgaW50ZXJydXB0cyA9IDw0NiA0NyA0OCA0OT47CiAg
ICAgICAgcmVnID0gPDB4MCAweDEwMDIxMDAwIDB4MCAweDEwMDA+OwogICAgICAgIHJlZy1uYW1l
cyA9ICJjb250cm9sIjsKICAgICAgICBjbG9ja3MgPSA8JnByY2kgMz47CiAgICAgICAgI3B3bS1j
ZWxscyA9IDwyPjsKfTsKcHdtbGVkcyB7CiAgICAgICAgY29tcGF0aWJsZSA9ICJwd20tbGVkcyI7
CiAgICAgICAgaGVhcnRiZWF0IHsKICAgICAgICAgICAgICAgIHB3bXMgPSA8Jkw0NSAwIDEwMDAw
MDAwIDA+OwogICAgICAgICAgICAgICAgbWF4LWJyaWdodG5lc3MgPSA8MjU1PjsKICAgICAgICAg
ICAgICAgIGxpbnV4LGRlZmF1bHQtdHJpZ2dlciA9ICJoZWFydGJlYXQiOwogICAgICAgIH07Cn07
CgpUaGUgYWJvdmUgd29ya3MgZm9yIG1lLgpJIGp1c3Qgbm90aWNlZCB0aGF0IEkgaGF2ZSBiZWVu
IHVzaW5nIHB3bS1jZWxscyA9IDIsIGluc3RlYWQgb2YgMy4KTWF5YmUgdGhhdCBpcyB0aGUgcHJv
YmxlbSBoZXJlLgpJIHdpbGwgc3VnZ2VzdCB5b3UgdGVzdCBpdCBvbiB2MTEgcGF0Y2ggaW4gd2hp
Y2ggSSB3aWxsIGZpeCB0aGlzCnB3bS1jZWxscyBpc3N1ZS4KClRoYW5rcyBmb3IgcG9pbnRpbmcg
aXQgb3V0LgoKPgo+IEFuZHJlYXMuCj4KPiAtLQo+IEFuZHJlYXMgU2Nod2FiLCBTVVNFIExhYnMs
IHNjaHdhYkBzdXNlLmRlCj4gR1BHIEtleSBmaW5nZXJwcmludCA9IDAxOTYgQkFEOCAxQ0U5IDE5
NzAgRjRCRSAgMTc0OCBFNEQ0IDg4RTMgMEVFQSBCOUQ3Cj4gIkFuZCBub3cgZm9yIHNvbWV0aGlu
ZyBjb21wbGV0ZWx5IGRpZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
