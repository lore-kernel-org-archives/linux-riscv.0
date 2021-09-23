Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718A2C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3445260F70
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3445260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I7pmD8wg6Wqf55S/kS2wgAS3ftSr6tS/m13Mj8OLYUg=; b=rGvQ9SN1uGHDWbiDrOXO19jqvz
	x70fBbuonhAwWJLPF0Tj2LHZJVaf1MoJxkrrtqq+qoTQjFVUErxwd01/2HRYh+/7onDC1Or/9tsgJ
	dNFeQvoiY/rkYlMbv5ZGsisMYWGToi+58wSlXBGzsTS2czJ3luEunH43ExWT6587K21KJhIu2vYxh
	zx+gICL6BuAtEpQdisQX2CT+stAL7RdD1OH6Jc/y0hvUaMlg9l8Lho6oZbcK2fx+IrkCKsUvvONh3
	AnSrlhgmooWCJoY7XKt/bNYyXVGH7DQZ8JTs+ElVTaL0RUQz/ok0FDpl9j5kDg1ybK+/kLjTTzezF
	1nMmoDnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLL7-00Aptt-2D; Thu, 23 Sep 2021 09:48:25 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLL4-00ApsL-7i
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 09:48:23 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 18N9mK4E038265
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 12:48:20 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1632390495; x=1634982495;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b40pxG74vSyzDsUyZQqj5rECdnyCEnKf/bmituQ7HGQ=;
 b=V0AwFjJwMt9ytoSGdr4fLFEfbQoduL+VS+PcwZA6BZE++rej7lwPTa2ujaSC6Ozp
 /gAfSYjSaEDWi5/XF0hVRH4bBxOh1UnWOoY+lCC9IDB6EZ/cQ77yVIbb1DD0PB9B
 IfSJqLXiZgTCv8VNB17ejkWcqNBirqWSR9MiTLsL5uULhKk2+01rxR6qxAFvwjnl
 4H4VxP29tbvjOzgwEZTiCzovnNPDE3KQm90/S+WkWWi5DyZKd9SyIXoDmwoVWTw2
 ZwyMKXEdsdMEacCrlRLqaxEkzQ/RZ59xxGPCqaedD22EvqELUgK7k2l354HB5op9
 gX1JRoL0w2stoTiMblR6bw==;
X-AuditID: 8b5b014d-ba8f670000005d46-5e-614c4d5edca6
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 20.1C.23878.E5D4C416; Thu, 23 Sep 2021 12:48:15 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 12:48:13 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Nick Kossifidis <mick@ics.forth.gr>
Cc: Anup Patel <anup@brainfault.org>, Guo Ren <guoren@kernel.org>, Anup
 Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, Palmer
 Dabbelt <palmerdabbelt@google.com>, =?UTF-8?Q?Christoph_M=C3=BCllner?=
 <christoph.muellner@vrull.eu>, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christoph Hellwig <hch@lst.de>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, =?UTF-8?Q?Wei_Wu_=28=E5=90=B4=E4=BC=9F=29?=
 <lazyparser@gmail.com>, Drew Fustini <drew@beagleboard.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org List"
 <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Maxime Ripard <maxime@cerno.tech>, Daniel Lustig <dlustig@nvidia.com>,
 Greg Favor <gfavor@ventanamicro.com>, Andrea Mondelli
 <andrea.mondelli@huawei.com>, Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu
 <xinhaoqu@huawei.com>, Bill Huffman <huffman@cadence.com>, Allen Baum
 <allen.baum@esperantotech.com>, Josh Scheid <jscheid@ventanamicro.com>,
 Richard Trauben <rtrauben@gmail.com>
Subject: Re: [PATCH] riscv: Add RISC-V svpbmt extension
Organization: FORTH
In-Reply-To: <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
 <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
Message-ID: <16de95480d279b086cf0c612461e4235@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42Lpjp6urBvv65NoMOsWi8WTQ+1sFtMOHGK3
 aJ2wG8j9MJHNouXDO1aLv5OOsVssWvGdxWLJTmmLPa/2sFtcaO5htLi3Yhm7xe7+OSwW289/
 Z7N4sbeRxeL4o10sFitXH2WyuNB4k93i8ur5TBbPTx1js7j05RqLxeVdc9gstn1uYbNYue4Y
 s8WMH/8YLZrfnWO32LpxHaNF98pqi5MbDjBarFk6ldGiZf8UFoufh84zWSx8PY/dQcHjVdsz
 Jo/fvyYxerz7vYzRY+rvMyweazpfM3nMauhl87hz7jybx4ZHq1k9/h9ayeKxc9Zddo8Fm0o9
 Wo68ZfV4uOkSk8emVZ1sHjsfWnpsXlIfIBHFZZOSmpNZllqkb5fAlfH+J3fBM76KeUfOsjcw
 vubuYuTkkBAwkZi+qJGli5GLQ0jgKKPEm3sv2CESphKz93Yygti8AoISJ2c+YQGxmQUsJKZe
 2c8IYctLNG+dzQxiswioSvz7eBisl01AU2L+pYNg9SIC6hKdz98wgixgFpjJLbHz/FewZmEB
 c4m3XxvAGvgFhCU+3b3ICmJzCrhKbJ3exghx0RdGiX0zT7JDXOEi8WT9bCaI61QkPvx+ABTn
 4BAFsjfPVZrAKDgLya2zkNw6C8mtCxiZVzEKJJYZ62UmF+ul5ReVZOilF21iBKcURt8djLc3
 v9U7xMjEwXiIUYKDWUmE9/MNr0Qh3pTEyqrUovz4otKc1OJDjNIcLErivLx6E+KFBNITS1Kz
 U1MLUotgskwcnFINTIoxbxTs1F/vquCMceK//yeO/3/Qg3X38jd/z9BM4TTWPpG50j1xkUY1
 V9DP6M+Z+4p+fHb0Z83JeKXj57y3oHiR5dHU06riPz7pSh1LP7S27cSSyq9LKy0zAxj0e5w5
 7ptKRDuz2uYLv7t0MXUfh9ILm2fdt3KNprS42224n5TwjT/dOE1/w+5sg6jDb1t9Aj1t5JNr
 VBPYtjxTr4n9pSyrcmXvbuGGVcyT3x1b6VigWqgst1CsozTZ/o91yLe3nw9JvK2+eYfpyKd9
 n6yvyAe9aalIunpN+lmsmucdgz9Pg46/ULfKW2I1/ePzeRa3966ozVkvJVEn+Wd9ur1XxRd7
 jhfmhw5GdIUW/HVRYinOSDTUYi4qTgQAqeAjvJgDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_024822_668390_9B5E9B21 
X-CRM114-Status: GOOD (  11.22  )
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

zqPPhM65z4IgMjAyMS0wOS0yMyAxMjo0MiwgTmljayBLb3NzaWZpZGlzIM6tzrPPgc6xz4jOtToK
PiDOo8+EzrnPgiAyMDIxLTA5LTIzIDEyOjM3LCBBbnVwIFBhdGVsIM6tzrPPgc6xz4jOtToKPj4g
T24gVGh1LCBTZXAgMjMsIDIwMjEgYXQgMjo1NSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNz
LmZvcnRoLmdyPiAKPj4gd3JvdGU6Cj4+PiAKPj4+IEhlbGxvIEd1bywKPj4+IAo+Pj4gzqPPhM65
z4IgMjAyMS0wOS0yMyAxMDoyNywgZ3VvcmVuQGtlcm5lbC5vcmcgzq3Os8+BzrHPiM61Ogo+Pj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVz
LnlhbWwKPj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMu
eWFtbAo+Pj4gaW5kZXggZTUzNGY2YTdjZmExLi4xODI1Y2Q4ZGIwZGUgMTAwNjQ0Cj4+PiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4+PiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4+
PiBAQCAtNTYsNyArNTYsOSBAQCBwcm9wZXJ0aWVzOgo+Pj4gICAgICAgZW51bToKPj4+ICAgICAg
ICAgLSByaXNjdixzdjMyCj4+PiAgICAgICAgIC0gcmlzY3Ysc3YzOQo+Pj4gKyAgICAgIC0gcmlz
Y3Ysc3YzOSxzdnBibXQKPj4+ICAgICAgICAgLSByaXNjdixzdjQ4Cj4+PiArICAgICAgLSByaXNj
dixzdjQ4LHN2cGJtdAo+Pj4gICAgICAgICAtIHJpc2N2LG5vbmUKPj4+IAo+Pj4gSXNuJ3Qgc3Zw
Ym10IG9ydGhvZ29uYWwgdG8gdGhlIG1tdSB0eXBlID8gSXQncyBhIGZ1bmN0aW9uYWxpdHkgdGhh
dCAKPj4+IGNhbgo+Pj4gYmUgcHJlc2VudCBvbiBlaXRoZXIgc3YzOS80OC81NyBzbyB3aHkgbm90
IGhhdmUgYW5vdGhlciAic3ZwYm10Igo+Pj4gcHJvcGVydHkgZGlyZWN0bHkgb24gdGhlIGNwdSBu
b2RlID8KPj4gCj4+IEFjdHVhbGx5LCAibW11LXR5cGUiIHdvdWxkIGJlIGEgZ29vZCBwbGFjZSBi
ZWNhdXNlIGl0J3MgcGFnZSBiYXNlZAo+PiBtZW1vcnkgYXR0cmlidXRlIGFuZCBwYWdpbmcgY2Fu
J3QgZXhpc3Qgd2l0aG91dCBtbXUgdHJhbnNsYXRpb24gbW9kZS4KPj4gCj4+IEFsc28sICJzdnBt
YnQiIGlzIGluZGVlZCBhIENQVSBwcm9wZXJ0eSBzbyBoYXMgdG8gYmUgZmVhdHVyZSAKPj4gaW5k
aXZpZHVhbAo+PiBDUFUgbm9kZS4gSHlwb3RoZXRpY2FsbHksIGEgaGV0ZXJvZ2VuZW91cyBzeXN0
ZW0gaXMgcG9zc2libGUgd2hlcmUKPj4gc29tZSBDUFVzIGhhdmUgInN2cG1idCIgYW5kIHNvbWUg
Q1BVcyBkb24ndCBoYXZlICJzdnBtYnQiLiBGb3IKPj4gZXhhbXBsZSwgYSBmdXR1cmUgRlV4eHgg
U29DIG1pZ2h0IGhhdmUgYSBFLWNvcmUgYW5kIGZldyBTLWNvcmVzCj4+IHdoZXJlIFMtY29yZXMg
aGF2ZSBTdnBtYnQgd2hlcmVhcyBFLWNvcmUgZG9lcyBub3QgaGF2ZSBTdnBtYnQKPj4gYmVjYXVz
ZSBpdCdzIGFuIGVtYmVkZGVkIGNvcmUuCj4+IAo+IAo+IEkgc2hvdWxkIHNheSBjcHVYIG5vZGUs
IG5vdCB0aGUgcm9vdCAvY3B1IG5vZGUuIFdlIGNhbiBoYXZlIGFuIHN2cGJtdAo+IHByb3BlcnR5
IGluIHRoZSBzYW1lIHdheSB3ZSBoYXZlIGFuIG1tdS10eXBlIHByb3BlcnR5Lgo+IAoKSSdtIGFs
c28gdGhpbmtpbmcgb2YgZnV0dXJlIG1tdS1yZWxhdGVkIGV4dGVuc2lvbnMsIGUuZy4gd2hhdCBh
Ym91dCAKc3ZuYXBvdCA/IFNob3VsZCB3ZSBoYXZlIG1tdS10eXBlIGJlIHJpc2N2LHN2Mzksc3Zu
YXBvdCBhbmQgZS5nLiAKcmlzY3Yuc3YzOSxzdnBibXQsc3ZuYXBvdCA/IEl0J2xsIGJlY29tZSBt
ZXNzeS4KClJlZ2FyZHMsCk5pY2sKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
