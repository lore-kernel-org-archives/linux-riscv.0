Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF6A6C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:45:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B02360F56
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 10:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B02360F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3M3wJe4MAL4y1hvzw8FSTdnNJCSa3WKrd9B7XCwCfC0=; b=lWfzhUGQuyqL7V
	3/h7kkbRURvKH+GXOTVDpHa5pv+//f/bOL0ozdiDBKWDsVfQCgOEULIHHs0ZMKwnfB3oUd0kyQrYf
	cPdFg5M8CZlnkopcMIlpsnBC6cXc8xR1Dm0BIEaTwdx8WdN8Vf6ksPKiHs7Lx+ymWfEl2PmuLu6GS
	hT9+vAM+t+JLnTf38UBiHIoanv8DLgwXo3ulGxk1p5M3+CsWLeGsMM6RC8kOVJPMj/niPsjq9A5Us
	n/iW6XW2gqMsgcwBWk+ThF/kSfHQR8PmP+C3kunlLlbNVtqYI6nN3WeU85gYi8oqajzZKtF+5rQn1
	z8SwP+ipf+/cIynFXe6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTMDb-00AylE-MA; Thu, 23 Sep 2021 10:44:43 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTM5i-00Auw9-Rh
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 10:36:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id u18so15820037wrg.5
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eMbiNurWfkJzojRgNNmqasqLNlJJs+jiiHsMdIwNVvs=;
 b=Mwn70RgnJsBKz3l3RmCUghBXc3LumiQmyrULnyQImLHG6yGPcLa87NYIu4vIKWpj+7
 HsmQt7OdQYRxnEZ7kD2gRlNXluGZtgsrFEtw24Cwh+mPOI9x9yKQPBAOU51SdlIKO8gV
 ms0imbOC38OgFS5Zir7zmafkscVxQqhxU5+r3RfAEkAh8DoslDTS2+te9bYpkJejTDr6
 Ta5NyqItGdg7krlS/sv6L4Vz4Ne+JFElZQUd+X+ZKbSF5GcmfoKvbgccKi5DxLF0ChtO
 Nq8UNXm4FEDGsxZKKhIIrH1YSmtmlAzfG83PlAvIBCzWFuGCR9x2xPnSkFoicK46yijm
 ewtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eMbiNurWfkJzojRgNNmqasqLNlJJs+jiiHsMdIwNVvs=;
 b=ED5KR97qZ4IecMZUtJlyMd8NDKwcPOESkCXGyj3MH+qYOqroLDm2O0g8oLdizn4uk5
 BzgbRSm6fCkWVQ+g6mS9DbyxE484SYAKekjUqHxvXwocLN6eLr5wn9c3SUKNfal+8Wdz
 gJsV9i2dzDrOAh1ovQtytC7kOl4LgQdhQXCGSXutC2GkPYbmynruGpKYpUnFfJe9yd1i
 F6l74PWaR9MCzbr6XxDlAGlFtsJQkDAyrER4FEx2hY3rsQYO1X8bDFilGAsmRVGr0bSp
 oWX2RxS25qd0K5vQXrMGa234m2L4DM43QaUs33AsrE4gsoPAEdS0mbcTFywpY4mNTj5S
 r9FQ==
X-Gm-Message-State: AOAM533fPpEMLcpp8YbNqMcuz4r1lpWt0H2n1lmeW+cPn/OPRXH1bjGb
 QHPvbO8ZRGKFL3TywOv5zdipihgP/6GfsvqO61CtaQ==
X-Google-Smtp-Source: ABdhPJzzzFNBBTQmornwaObih+0At8/n2L7giwGym3fL/FkOZkJtM7I96eIKvv/VP5+qdPQ2rdvgL3j+CZLbStAfjJE=
X-Received: by 2002:a5d:688a:: with SMTP id h10mr4146098wru.331.1632393392871; 
 Thu, 23 Sep 2021 03:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
 <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
 <CAAeLtUChjjzG+P8yg45GLZMJy5UR2K5RRBoLFVZhtOaZ5pPtEA@mail.gmail.com>
In-Reply-To: <CAAeLtUChjjzG+P8yg45GLZMJy5UR2K5RRBoLFVZhtOaZ5pPtEA@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 16:06:21 +0530
Message-ID: <CAAhSdy33=4AWaYWT8P5iCrvTcoOEgwm1NgcxJCq53Pp6zzNruQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
To: Philipp Tomsich <philipp.tomsich@vrull.eu>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Guo Ren <guoren@kernel.org>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, 
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, 
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>, 
 Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>, 
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>, 
 Bill Huffman <huffman@cadence.com>, Allen Baum <allen.baum@esperantotech.com>, 
 Josh Scheid <jscheid@ventanamicro.com>, Richard Trauben <rtrauben@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_033634_961330_E5884075 
X-CRM114-Status: GOOD (  27.76  )
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

T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgMzozOCBQTSBQaGlsaXBwIFRvbXNpY2gKPHBoaWxpcHAu
dG9tc2ljaEB2cnVsbC5ldT4gd3JvdGU6Cj4KPiBPbiBUaHUsIDIzIFNlcHQgMjAyMSBhdCAxMTo0
OCwgTmljayBLb3NzaWZpZGlzIDxtaWNrQGljcy5mb3J0aC5ncj4gd3JvdGU6Cj4gPgo+ID4gzqPP
hM65z4IgMjAyMS0wOS0yMyAxMjo0MiwgTmljayBLb3NzaWZpZGlzIM6tzrPPgc6xz4jOtToKPiA+
ID4gzqPPhM65z4IgMjAyMS0wOS0yMyAxMjozNywgQW51cCBQYXRlbCDOrc6zz4HOsc+IzrU6Cj4g
PiA+PiBPbiBUaHUsIFNlcCAyMywgMjAyMSBhdCAyOjU1IFBNIE5pY2sgS29zc2lmaWRpcyA8bWlj
a0BpY3MuZm9ydGguZ3I+Cj4gPiA+PiB3cm90ZToKPiA+ID4+Pgo+ID4gPj4+IEhlbGxvIEd1bywK
PiA+ID4+Pgo+ID4gPj4+IM6jz4TOuc+CIDIwMjEtMDktMjMgMTA6MjcsIGd1b3JlbkBrZXJuZWwu
b3JnIM6tzrPPgc6xz4jOtToKPiA+ID4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gPj4+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+ID4gPj4+IGluZGV4IGU1MzRmNmE3
Y2ZhMS4uMTgyNWNkOGRiMGRlIDEwMDY0NAo+ID4gPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+ID4+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gPiA+Pj4gQEAgLTU2LDcg
KzU2LDkgQEAgcHJvcGVydGllczoKPiA+ID4+PiAgICAgICBlbnVtOgo+ID4gPj4+ICAgICAgICAg
LSByaXNjdixzdjMyCj4gPiA+Pj4gICAgICAgICAtIHJpc2N2LHN2MzkKPiA+ID4+PiArICAgICAg
LSByaXNjdixzdjM5LHN2cGJtdAo+ID4gPj4+ICAgICAgICAgLSByaXNjdixzdjQ4Cj4gPiA+Pj4g
KyAgICAgIC0gcmlzY3Ysc3Y0OCxzdnBibXQKPiA+ID4+PiAgICAgICAgIC0gcmlzY3Ysbm9uZQo+
ID4gPj4+Cj4gPiA+Pj4gSXNuJ3Qgc3ZwYm10IG9ydGhvZ29uYWwgdG8gdGhlIG1tdSB0eXBlID8g
SXQncyBhIGZ1bmN0aW9uYWxpdHkgdGhhdAo+ID4gPj4+IGNhbgo+ID4gPj4+IGJlIHByZXNlbnQg
b24gZWl0aGVyIHN2MzkvNDgvNTcgc28gd2h5IG5vdCBoYXZlIGFub3RoZXIgInN2cGJtdCIKPiA+
ID4+PiBwcm9wZXJ0eSBkaXJlY3RseSBvbiB0aGUgY3B1IG5vZGUgPwo+ID4gPj4KPiA+ID4+IEFj
dHVhbGx5LCAibW11LXR5cGUiIHdvdWxkIGJlIGEgZ29vZCBwbGFjZSBiZWNhdXNlIGl0J3MgcGFn
ZSBiYXNlZAo+ID4gPj4gbWVtb3J5IGF0dHJpYnV0ZSBhbmQgcGFnaW5nIGNhbid0IGV4aXN0IHdp
dGhvdXQgbW11IHRyYW5zbGF0aW9uIG1vZGUuCj4gPiA+Pgo+ID4gPj4gQWxzbywgInN2cG1idCIg
aXMgaW5kZWVkIGEgQ1BVIHByb3BlcnR5IHNvIGhhcyB0byBiZSBmZWF0dXJlCj4gPiA+PiBpbmRp
dmlkdWFsCj4gPiA+PiBDUFUgbm9kZS4gSHlwb3RoZXRpY2FsbHksIGEgaGV0ZXJvZ2VuZW91cyBz
eXN0ZW0gaXMgcG9zc2libGUgd2hlcmUKPiA+ID4+IHNvbWUgQ1BVcyBoYXZlICJzdnBtYnQiIGFu
ZCBzb21lIENQVXMgZG9uJ3QgaGF2ZSAic3ZwbWJ0Ii4gRm9yCj4gPiA+PiBleGFtcGxlLCBhIGZ1
dHVyZSBGVXh4eCBTb0MgbWlnaHQgaGF2ZSBhIEUtY29yZSBhbmQgZmV3IFMtY29yZXMKPiA+ID4+
IHdoZXJlIFMtY29yZXMgaGF2ZSBTdnBtYnQgd2hlcmVhcyBFLWNvcmUgZG9lcyBub3QgaGF2ZSBT
dnBtYnQKPiA+ID4+IGJlY2F1c2UgaXQncyBhbiBlbWJlZGRlZCBjb3JlLgo+ID4gPj4KPiA+ID4K
PiA+ID4gSSBzaG91bGQgc2F5IGNwdVggbm9kZSwgbm90IHRoZSByb290IC9jcHUgbm9kZS4gV2Ug
Y2FuIGhhdmUgYW4gc3ZwYm10Cj4gPiA+IHByb3BlcnR5IGluIHRoZSBzYW1lIHdheSB3ZSBoYXZl
IGFuIG1tdS10eXBlIHByb3BlcnR5Lgo+ID4gPgo+ID4KPiA+IEknbSBhbHNvIHRoaW5raW5nIG9m
IGZ1dHVyZSBtbXUtcmVsYXRlZCBleHRlbnNpb25zLCBlLmcuIHdoYXQgYWJvdXQKPiA+IHN2bmFw
b3QgPyBTaG91bGQgd2UgaGF2ZSBtbXUtdHlwZSBiZSByaXNjdixzdjM5LHN2bmFwb3QgYW5kIGUu
Zy4KPiA+IHJpc2N2LnN2Mzksc3ZwYm10LHN2bmFwb3QgPyBJdCdsbCBiZWNvbWUgbWVzc3kuCj4K
PiBIb3cgaWYgd2UgZXhwYW5kIHRoaXMgdG8gYSBtbXUgc3Vibm9kZSBpbiBjcHVAeCBhbmQgYWRk
IGEgYm9vbGVhbnMgZm9yCj4gYWRvcm5tZW50cyBsaWtlIHN2bmFwb3QgYW5kIHN2cGJtdD8KPgo+
IFRoZSBvbGRlciBtbXUtdHlwZSBjb3VsZCB0aGVuIHRyZWF0ZWQgdG8gaW5kaWNhdGUgYSBtbXUg
dy9vIGFueSBhZG9ybm1lbnRzCj4gc3BlY2lmaWVkLiAgSSBhbSBhd2FyZSB0aGF0IHRoaXMgZ2Vu
ZXJhdGVzIGFuIGFkZGl0aW9uYWwgcGFyc2luZy1wYXRoCj4gdGhhdCB3aWxsIGJlCj4gbWFpbnRh
aW5lZCwgYnV0IGl0IHdpbGwgYWxsb3cgZnV0dXJlIHByb3BlcnRpZXMgdG8gYmUgZ3JvdXBlZC4K
Pgo+IFRoaXMgY291bGQgbGlrZSBsaWtlIHRoZSBmb2xsb3dpbmc6Cj4KPiAgIGNwdUAwIHsKPiAg
ICAgLi4uCj4gICAgIG1tdSB7Cj4gICAgICAgIHR5cGUgPSAicmlzY3Ysc3YzOSI7Cj4gICAgICAg
IHN1cHBvcnRzLXN2cGJtdDsKPiAgICAgfQo+ICAgICAuLi4KPiAgIH0KClRoaXMgaXMgYmV0dGVy
IGJ1dCB3ZSB3aWxsIGhhdmUgdG8gc3VwcG9ydCB0aGUgb2xkICJtbXUtdHlwZSIgRFQKcHJvcGVy
dHkgYXMgd2VsbCBiZWNhdXNlIHdlIGNhbid0IGJyZWFrIGNvbXBhdGliaWxpdHkgaW4gRFQgYmlu
ZGluZ3MuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
