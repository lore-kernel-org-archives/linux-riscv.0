Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E9DC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Mar 2022 08:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qCqth8Z4FkD5jvop9o1VP1mQQPxyvw1L2eWV7OotvY=; b=VYSzhK/DWKvxWYaiJoxFFPJKHP
	g4WUHYcBKVML9BWkNUvxkLY4YHkyNdMCGN5vp0GFuBv4IyHLDceXQHen/Azl4rUPCI2YBCry2jc++
	Ek2hhIOsos43spHVwuZPShZMdWdk9UNICKMJfVuDDzLXhq07m+k32cYFheH5eoPBUiPnr+1pzlCG6
	Jv+FmBgBJp9lAsHmbD3Cwd3GxtY9WcoqFLa7amt3fu8HHGyry6iJuntmYyGkDOfKjuC1fnpaA5ljV
	URp9e6MPFQqO6SuFL06GilzsZM3GTcJLnuRrLaFWv1cZDPHyhIXJ9dMtPWEA6/LCDjUtVKLzxaUtj
	Fe73fz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYOdU-005NPP-42; Sun, 27 Mar 2022 08:52:32 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYOdR-005NNi-Ls
 for linux-riscv@lists.infradead.org; Sun, 27 Mar 2022 08:52:31 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 22R8qHNe047403
 for <linux-riscv@lists.infradead.org>; Sun, 27 Mar 2022 11:52:17 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1648371132; x=1650963132;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=O7kXkCdvhvkq/xOJDYOOrEuPdlDIk8ke1X+ujPivqOc=;
 b=ElHHF3EcNDRUAW8hyeIYHGqck2a8/UujzBMHet2ql7Jkpr7oaB7w6OJPGoBg1W11
 Bq9vVLj4YGbWEwT/utY5bhVE1q8FKEwPtvn0FaO5z4n6UPuZiIpU2wuu6p5jACpP
 pMKbx0K91DiNP2LLKyBdCdDkLJpr56qm8dN/02fVOQeffXkSWt0CUGD8mzk+KN9x
 19HYd7WToHqmVXRlmag/YX36IqQ//wYgflQ9gUc2G9roqxZgKu8dqvocBqjqQ3gn
 LruNfrpxPo26b0VrhVX8YhEqQ/caigpMilCOA20AdiM0YFKtlOxEVPDvLVHgUE2B
 6crZP2Kf7jCCMVIKWpD+LA==;
X-AuditID: 8b5b014d-f2ab27000000641e-21-624025bc924b
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 66.EE.25630.CB520426; Sun, 27 Mar 2022 11:52:12 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Sun, 27 Mar 2022 11:52:11 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Conor.Dooley@microchip.com
Cc: mick@ics.forth.gr, palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
Organization: FORTH
In-Reply-To: <ebaa9b4e-9e37-e2f4-2bee-37d324e7302b@microchip.com>
References: <20220322132839.3653682-1-mick@ics.forth.gr>
 <ebaa9b4e-9e37-e2f4-2bee-37d324e7302b@microchip.com>
Message-ID: <941622f4f76ecd5bc071e310479b3ad3@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrNLMWRmVeSWpSXmKPExsXSHT1dWXePqkOSwdmVYhZbf89it5iyaQe7
 xeVdc9gstn1uYbNofneO3eLl5R5mi7ZZ/A7sHm9evmTxONzxhd3j4aZLTB6bl9R73PmxlNHj
 UvN1do/Pm+QC2KO4bFJSczLLUov07RK4MhoXCRdM5qhY8GY/SwPjKbYuRk4OCQETiQu7JrB2
 MXJxCAkcY5Q4s3IFK0TCVGL23k5GEJtXQFDi5MwnLCA2s4CFxNQr+xkhbHmJ5q2zmUFsFgFV
 iTdNG9hBbDYBTYn5lw6C1YsIyEn8/3WGGWQBs8BqRomJk1rBFggL+EpMWrkDzOYXEJb4dPci
 mM0p4Chxuq0B6DoOoIvyJSY+jYO4wUXi2rbJUEerSHz4/YAdpEQUyN48V2kCo+AsJJfOQnLp
 LCSXLmBkXsUokFhmrJeZXKyXll9UkqGXXrSJERz+jL47GG9vfqt3iJGJg/EQowQHs5IIr+xZ
 +yQh3pTEyqrUovz4otKc1OJDjNIcLErivCzXZJKEBNITS1KzU1MLUotgskwcnFINTBN3/iw5
 P3PJO7kv0fZr3044xx8/f/ejIrMXxTfFM6N+VjSfjUxbdFb8y+zE7J0f33dyeAQ7H7b4eknm
 6+Jq03fTBXdI60sseCd34EvRO86jiZerLk99/ic80+zL7B0F3BeWe36q6Fu4Qa1Kq/LLJZ+I
 i10dvdsjjCfOTPv3wnzrY7Owg9dLN7Dbavdznjj/+PjmedfZNmz1jmRdbnb6vHu4TW/M27PS
 sX4e11s72mR4F3OtPKGjluI4ax+b1vLIj7FpoiKN/96kMwfm6SzxUH9ZLR6WuWzZ7W8hbRfs
 rAXyXi6bsvOD/VOhRQLf563cfOgmb4LUga401q83RNLDp917lJeSNbvyxoXCVRffvZdVYinO
 SDTUYi4qTgQAbcQ2iu4CAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_015230_107919_D169B308 
X-CRM114-Status: GOOD (  10.64  )
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

zqPPhM65z4IgMjAyMi0wMy0yNCAxMTozNywgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gzq3O
s8+BzrHPiM61Ogo+IE9uIDIyLzAzLzIwMjIgMTM6MjgsIE5pY2sgS29zc2lmaWRpcyB3cm90ZToK
Pj4gSW4gY2FzZSB0aGUgRFRCIHByb3ZpZGVkIGJ5IHRoZSBib290bG9hZGVyL0Jvb3RST00gaXMg
YmVmb3JlIHRoZSAKPj4ga2VybmVsCj4+IGltYWdlIG9yIG91dHNpZGUgL21lbW9yeSwgd2Ugd29u
J3QgYmUgYWJsZSB0byBhY2Nlc3MgaXQgdGhyb3VnaCB0aGUKPj4gbGluZWFyIG1hcHBpbmcsIGFu
ZCBnZXQgYSBzZWdmYXVsdCBvbiBzZXR1cF9hcmNoKCkuIEN1cnJlbnRseSBPcGVuU0JJCj4+IHJl
bG9jYXRlcyBEVEIgYnV0IHRoYXQncyBub3QgYWx3YXlzIHRoZSBjYXNlIChlLmcuIGlmIEZXX0pV
TVBfRkRUX0FERFIKPj4gaXMgbm90IHNwZWNpZmllZCksIGFuZCBpdCdzIGFsc28gbm90IHRoZSBt
b3N0IHBvcnRhYmxlIGFwcHJvYWNoIHNpbmNlCj4+IHRoZSBkZWZhdWx0IEZXX0pVTVBfRkRUX0FE
RFIgb2YgdGhlIGdlbmVyaWMgcGxhdGZvcm0gcmVsb2NhdGVzIHRoZSBEVEIKPj4gYXQgYSBzcGVj
aWZpYyBvZmZzZXQgdGhhdCBtYXkgbm90IGJlIGF2YWlsYWJsZS4gVG8gYXZvaWQgdGhpcyAKPj4g
c2l0dWF0aW9uCj4+IGNvcHkgRFRCIHNvIHRoYXQgaXQncyB2aXNpYmxlIHRocm91Z2ggdGhlIGxp
bmVhciBtYXBwaW5nLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTmljayBLb3NzaWZpZGlzIDxtaWNr
QGljcy5mb3J0aC5ncj4KPiAKPiBBbGJlaXQgaW4gYSBiYWNrcG9ydCwgSSB0ZXN0ZWQgdGhpcyBv
biBhIFBvbGFyRmlyZSBTb0MgYmFzZWQgYm9hcmQuCj4gU28gSSBndWVzcywgVGVzdGVkLWJ5OiBD
b25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IAo+IEFuZCBhIGxvdCBj
bGVhbmVyIHRoYW4gdXNpbmcgY3JlYXRlX3BnZF9tYXBwaW5nIGluIHNldHVwX3ZtX2ZpbmFsIHRv
IGRvIAo+IGl0IDopCj4gCj4gVGhhbmtzLAo+IENvbm9yLgo+IAoKVGhhbmtzICEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
