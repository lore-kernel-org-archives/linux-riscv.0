Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83860C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 00:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oolIk71SsXAJnLslwwuIBMDs7PbIaG7IHxGoRjC2Tz4=; b=B6LVaEa7IaaajQ
	51Vei6er54LUf5a97KoEScgZIogrkSmkphg6ZXvR+3x3hOnRqmJ2f6DzAtcL1E1xmiQV7LsFLoK0A
	5jsQ0/uX6FAv5Ag9gZsVXwplHW5VVIZxEdAHjje55QFHV8CSXfUm8CqzsnCgXU6kg90H408f3wOsa
	6WZqQ9MrwG8acm3S3R2FrQwXxM1LgtEAIAVSgQ55aO+MO6K2Sa0FxjhcktyHPxGTn9Jr6WCdrHSKx
	R8rcaJkw0ex6VadZ6qSidp+P5JMrcpdEDpIMwWsFpYCM+S11WX36gdBkFr4O6VQjM9GTyDmhc+Wfi
	Kjd9zJdxOO7Sfm772slg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTraV-00000004Gfv-2Jd5;
	Tue, 24 Jun 2025 00:32:35 +0000
Received: from mx-out.tlen.pl ([193.222.135.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTmJc-00000003l4L-3dJQ
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 18:54:50 +0000
Received: (wp-smtpd smtp.tlen.pl 4453 invoked from network); 23 Jun 2025 20:54:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=o2.pl; s=20241105;
          t=1750704878; bh=Nz/MLAtc2Q0OF2vCJ2qL2BfXnH2qMBB6O1rcR/uerOo=;
          h=Subject:To:Cc:From;
          b=EVSnBIP/yqYSauTNAm3iKv1XB4wKe+Y0LOwmxgi6daIhtHsEqShlac/mIQd/oTab0
           BFKu42f5dzCleanEHICAtmecj6/KjJBZmop/AhaX3pKsLKGi8A0xk5RlyuDgJoi1AY
           80dtzBvcURtla+X7VtAgQRiNqd/nPpEkjw69yuIzsE0cVd8MzplGphAuoIAHYTJy55
           GX/cdyD8p9229vzHQS1A/KymHly7mW6cikZBNsP9rUxEeekse5FgC2U4clcDVYwV1n
           1HPTOpWjr4oSOw+WlqFakuL1wLXnTYqyAAAmYViidjk/0rxZ1S5rY/l/zRtlQmi2if
           UHaJ8TPQGP1WA==
Received: from apn-31-0-3-138.dynamic.gprs.plus.pl (HELO [192.168.1.22]) (mat.jonczyk@o2.pl@[31.0.3.138])
          (envelope-sender <mat.jonczyk@o2.pl>)
          by smtp.tlen.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <elder@riscstar.com>; 23 Jun 2025 20:54:38 +0200
Message-ID: <d35922c4-fbd0-4d13-9bcd-2688b48c0045@o2.pl>
Date: Mon, 23 Jun 2025 20:54:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] rtc: spacemit: support the SpacemiT P1 RTC
To: Alex Elder <elder@riscstar.com>, lee@kernel.org,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dlan@gentoo.org, wangruikang@iscas.ac.cn, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 troymitchell988@gmail.com, guodong@riscstar.com, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250622032941.3768912-1-elder@riscstar.com>
 <20250622032941.3768912-5-elder@riscstar.com>
Content-Language: en-GB, pl
From: =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>
Autocrypt: addr=mat.jonczyk@o2.pl; keydata=
 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
 TANkZ3QqXNX2
In-Reply-To: <20250622032941.3768912-5-elder@riscstar.com>
X-WP-MailID: 2af6533f687966590cf5e4cd8b367565
X-WP-AV: skaner antywirusowy Poczty o2
X-WP-SPAM: NO 0000000 [UUNh]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_115449_350971_21B175D5 
X-CRM114-Status: GOOD (  16.43  )
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

VyBkbml1IDIyLjA2LjIwMjUgb8KgMDU6MjksIEFsZXggRWxkZXIgcGlzemU6Cj4gQWRkIHN1cHBv
cnQgZm9yIHRoZSBSVEMgZm91bmQgaW4gdGhlIFNwYWNlbWlUIFAxIFBNSUMuICBJbml0aWFsbHkK
PiBvbmx5IHNldHRpbmcgYW5kIHJlYWRpbmcgdGhlIHRpbWUgYXJlIHN1cHBvcnRlZC4KPgo+IFRo
ZSBQTUlDIGlzIGltcGxlbWVudGVkIGFzIGEgbXVsdGktZnVuY3Rpb24gZGV2aWNlLiAgVGhpcyBS
VEMgaXMKPiBwcm9iZWQgYmFzZWQgb24gdGhpcyBkcml2ZXIgYmVpbmcgbmFtZWQgaW4gYSBNRkQg
Y2VsbCBpbiB0aGUgc2ltcGxlCj4gTUZEIEkyQyBkcml2ZXIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBB
bGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+Cj4gLS0tCj4gdjM6IC0gQWRkZWQgdGhpcyBk
cml2ZXIgdG8gdGhlIHNlcmllcywgaW4gcmVzcG9uc2UgdG8gTGVlIEpvbmVzIHNheWluZwo+ICAg
ICAgICBtb3JlIHRoYW4gb25lIE1GRCBzdWItZGV2aWNlIHdhcyByZXF1aXJlZCB0byBiZSBhY2Nl
cHRhYmxlCltzbmlwXQo+ICtzdGF0aWMgaW50IHAxX3J0Y19yZWFkX3RpbWUoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgcnRjX3RpbWUgKnQpCj4gK3sKPiArCXN0cnVjdCBwMV9ydGMgKnAxID0g
ZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gKwl1OCB0aW1lW3R1X2NvdW50XTsKPiArCWludCByZXQ7
Cj4gKwo+ICsJcmV0ID0gcmVnbWFwX2J1bGtfcmVhZChwMS0+cmVnbWFwLCBSVENfQ09VTlRfQkFT
RSwgJnRpbWUsIHNpemVvZih0aW1lKSk7Cj4gKwlpZiAocmV0KQo+ICsJCXJldHVybiByZXQ7CgpI
ZWxsbywKCkFyZSB5b3Ugc3VyZSB0aGF0IHlvdSByZWFkIHRoZSB0aW1lIHBhcnRzIGNvbnNpc3Rl
bnRseSBoZXJlPyBJIG1lYW46CmlzIHRoZXJlIGEgcmlzayB0aGF0IHRoZSBjbG9jayBpcyB1cGRh
dGluZyBiZWxvdyB5b3UgLSBzbyB0aGF0IGZvcgpleGFtcGxlIGR1cmluZyB0aGUgdHJhbnNpdGlv
bgoKMTI6NTk6NTkgLT4gMTM6MDA6MDAKCnlvdSBhcmUgZ29pbmcgdG8gcmVhZCAxMjowMDowMCBv
ciAxMjo1OTowMD8KCklmIHNvLCB5b3UgY291bGQgZm9yIGV4YW1wbGUgcmVhZCB0aGUgdGltZSBp
biBhIGxvb3AgdW50aWwgeW91IGdldAp0d28gc2FtZSByZWFkb3V0cy4KCj4gKwo+ICsJdC0+dG1f
c2VjID0gdGltZVt0dV9zZWNvbmRdICYgR0VOTUFTSyg1LCAwKTsKPiArCXQtPnRtX21pbiA9IHRp
bWVbdHVfbWludXRlXSAmIEdFTk1BU0soNSwgMCk7Cj4gKwl0LT50bV9ob3VyID0gdGltZVt0dV9o
b3VyXSAmIEdFTk1BU0soNCwgMCk7Cj4gKwl0LT50bV9tZGF5ID0gKHRpbWVbdHVfZGF5XSAmIEdF
Tk1BU0soNCwgMCkpICsgMTsKPiArCXQtPnRtX21vbiA9IHRpbWVbdHVfbW9udGhdICYgR0VOTUFT
SygzLCAwKTsKPiArCXQtPnRtX3llYXIgPSAodGltZVt0dV95ZWFyXSAmIEdFTk1BU0soNSwgMCkp
ICsgMTAwOwoKSXMgaXQgbmVjZXNzYXJ5IHRvIHVzZSB0aGUgYml0bWFza3MgaGVyZT8gQXJlIHRo
ZSBoaWdoZXIgYml0cyB1bmRlZmluZWQKaW4gaGFyZHdhcmU/IElmIHNvLCBpcyBpdCBuZWNlc3Nh
cnkgdG8gbWFzayB0aGVtIHdoaWxlIHdyaXRpbmcgdGhlIHRpbWUKaW4gcDFfcnRjX3NldF90aW1l
KCk/Cgo+ICsJLyogdG1fd2RheSwgdG1feWRheSwgYW5kIHRtX2lzZHN0IGFyZW4ndCB1c2VkICov
Cj4gKwo+ICsJcmV0dXJuIDA7Cj4gK30KPiArCj4gK3N0YXRpYyBpbnQgcDFfcnRjX3NldF90aW1l
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHJ0Y190aW1lICp0KQo+ICt7Cj4gKwlzdHJ1Y3Qg
cDFfcnRjICpwMSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwo+ICsJdTggdGltZVt0dV9jb3VudF07
Cj4gKwlpbnQgcmV0Owo+ICsKPiArCXRpbWVbdHVfc2Vjb25kXSA9IHQtPnRtX3NlYzsKPiArCXRp
bWVbdHVfbWludXRlXSA9IHQtPnRtX21pbjsKPiArCXRpbWVbdHVfaG91cl0gPSB0LT50bV9ob3Vy
Owo+ICsJdGltZVt0dV9kYXldID0gdC0+dG1fbWRheSAtIDE7Cj4gKwl0aW1lW3R1X21vbnRoXSA9
IHQtPnRtX21vbjsKPiArCXRpbWVbdHVfeWVhcl0gPSB0LT50bV95ZWFyIC0gMTAwOwo+ICsKPiAr
CS8qIERpc2FibGUgdGhlIFJUQyB0byB1cGRhdGU7IHJlLWVuYWJsZSBhZ2FpbiB3aGVuIGRvbmUg
Ki8KPiArCXJldCA9IHJlZ21hcF91cGRhdGVfYml0cyhwMS0+cmVnbWFwLCBSVENfQ1RSTCwgUlRD
X0VOLCAwKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiArCj4gKwlyZXQgPSByZWdt
YXBfYnVsa193cml0ZShwMS0+cmVnbWFwLCBSVENfQ09VTlRfQkFTRSwgdGltZSwgc2l6ZW9mKHRp
bWUpKTsKPiArCj4gKwkodm9pZClyZWdtYXBfdXBkYXRlX2JpdHMocDEtPnJlZ21hcCwgUlRDX0NU
UkwsIFJUQ19FTiwgUlRDX0VOKTsKUGVyaGFwcyB5b3Ugc2hvdWxkbid0IGlnbm9yZSBhbnkgZXJy
b3JzIGhlcmUgLSBmYWlsaW5nIHRvIHJlc3RhcnQKdGhlIGNsb2NrIHNob3VsZCBtYWtlIHAxX3J0
Y19zZXRfdGltZSgpIHJldHVybiBhbiBlcnJvciBjb2RlLgo+ICsKPiArCXJldHVybiByZXQ7Cj4g
K30KPiArCgpHcmVldGluZ3MsCgpNYXRldXN6CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
