Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB60C02183
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 01:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l+G4VMB0V2k+sFORL3kV8TyIJCzcUhBTcainjoV3/DQ=; b=wNUOswtDxD6kfg
	dPfswdA6Mt5bm/NpoqI1DhsqYOk7p1AB1RD5GceP6IJu00DMX1hRoZ0rS4HzB99E8k8al/cnwHa0i
	PMDDuNX4k+rE7TeQlllj7/hprMSet/wd2CudgWGbqL1UzX5SCYIK2VegoMrGMN3jT78xzC0XHNXgt
	aZlh6fUHwsbSMgxGgU73q3bnnKpxgU0RKbaViL9AC1izqWB3zI+fKw8WlnxhWdngJlHp1UPpEhV8N
	q8ssXh8cjz8h4vLDdY8XwmLxOl2k5vBVQxmdqKsbUGuKC1IoE8yhjLr+ri4fI5JfHLgzT9aIhHatb
	MZUehwlQh8dqa/7F/eYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYbDS-0000000Gmwl-0BxE;
	Fri, 17 Jan 2025 01:32:06 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYbC9-0000000GmfJ-22o4;
	Fri, 17 Jan 2025 01:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1737077439; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=TsqFKuMiLwMIWqbIsmre8PDwSTy200zBboCltX5otHE=;
	b=ejHDnCo94L03gkQR4tsWPG2L6zFGYksVaS+pDg7jgDrE193R1xX+LDKF09UVuiPW37eZEUl1HBhcG6fRN/nLSY9tsntU2sAg61902sG4b2YZzXYFS8QZdm6CMFbzwZizkWyOt39N0PpqlyLCN/nMIsWfpLDH3AfF9hW5aJIrkBY=
Received: from 30.74.144.128(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WNmu3tq_1737077435 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 17 Jan 2025 09:30:36 +0800
Message-ID: <ef266df5-46dc-43d2-8bb3-df28223b7149@linux.alibaba.com>
Date: Fri, 17 Jan 2025 09:30:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped
 THP in try_to_unmap
To: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: chrisl@kernel.org, david@redhat.com, ioworker0@gmail.com,
 kasong@tencent.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com,
 x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com
References: <20250115033808.40641-1-21cnbao@gmail.com>
 <20250115033808.40641-5-21cnbao@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20250115033808.40641-5-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_173045_825143_D2B12EC7 
X-CRM114-Status: UNSURE (   8.76  )
X-CRM114-Notice: Please train this message.
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

CgpPbiAyMDI1LzEvMTUgMTE6MzgsIEJhcnJ5IFNvbmcgd3JvdGU6Cj4gRnJvbTogQmFycnkgU29u
ZyA8di1zb25nYmFvaHVhQG9wcG8uY29tPgo+IAo+IFRoZSB0cnlfdG9fdW5tYXBfb25lKCkgZnVu
Y3Rpb24gY3VycmVudGx5IGhhbmRsZXMgUE1ELW1hcHBlZCBUSFBzCj4gaW5lZmZpY2llbnRseS4g
SXQgZmlyc3Qgc3BsaXRzIHRoZSBQTUQgaW50byBQVEVzLCBjb3BpZXMgdGhlIGRpcnR5Cj4gc3Rh
dGUgZnJvbSB0aGUgUE1EIHRvIHRoZSBQVEVzLCBpdGVyYXRlcyBvdmVyIHRoZSBQVEVzIHRvIGxv
Y2F0ZQo+IHRoZSBkaXJ0eSBzdGF0ZSwgYW5kIHRoZW4gbWFya3MgdGhlIFRIUCBhcyBzd2FwLWJh
Y2tlZC4gVGhpcyBwcm9jZXNzCj4gaW52b2x2ZXMgdW5uZWNlc3NhcnkgUE1EIHNwbGl0dGluZyBh
bmQgcmVkdW5kYW50IGl0ZXJhdGlvbi4gSW5zdGVhZCwKPiB0aGlzIGZ1bmN0aW9uYWxpdHkgY2Fu
IGJlIGVmZmljaWVudGx5IG1hbmFnZWQgaW4KPiBfX2Rpc2NhcmRfYW5vbl9mb2xpb19wbWRfbG9j
a2VkKCksIGF2b2lkaW5nIHRoZSBleHRyYSBzdGVwcyBhbmQKPiBpbXByb3ZpbmcgcGVyZm9ybWFu
Y2UuCj4gCj4gVGhlIGZvbGxvd2luZyBtaWNyb2JlbmNobWFyayByZWRpcnRpZXMgZm9saW9zIGFm
dGVyIGludm9raW5nIE1BRFZfRlJFRSwKPiB0aGVuIG1lYXN1cmVzIHRoZSB0aW1lIHRha2VuIHRv
IHBlcmZvcm0gbWVtb3J5IHJlY2xhbWF0aW9uIChhY3R1YWxseQo+IHNldCB0aG9zZSBmb2xpb3Mg
c3dhcGJhY2tlZCBhZ2Fpbikgb24gdGhlIHJlZGlydGllZCBmb2xpb3MuCj4gCj4gICAjaW5jbHVk
ZSA8c3RkaW8uaD4KPiAgICNpbmNsdWRlIDxzeXMvbW1hbi5oPgo+ICAgI2luY2x1ZGUgPHN0cmlu
Zy5oPgo+ICAgI2luY2x1ZGUgPHRpbWUuaD4KPiAKPiAgICNkZWZpbmUgU0laRSAxMjgqMTAyNCox
MDI0ICAvLyAxMjggTUIKPiAKPiAgIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4g
ICB7Cj4gICAJd2hpbGUoMSkgewo+ICAgCQl2b2xhdGlsZSBpbnQgKnAgPSBtbWFwKDAsIFNJWkUs
IFBST1RfUkVBRCB8IFBST1RfV1JJVEUsCj4gICAJCQkJTUFQX1BSSVZBVEUgfCBNQVBfQU5PTllN
T1VTLCAtMSwgMCk7Cj4gCj4gICAJCW1lbXNldCgodm9pZCAqKXAsIDEsIFNJWkUpOwo+ICAgCQlt
YWR2aXNlKCh2b2lkICopcCwgU0laRSwgTUFEVl9GUkVFKTsKPiAgIAkJLyogcmVkaXJ0eSBhZnRl
ciBNQURWX0ZSRUUgKi8KPiAgIAkJbWVtc2V0KCh2b2lkICopcCwgMSwgU0laRSk7Cj4gCj4gCQlj
bG9ja190IHN0YXJ0X3RpbWUgPSBjbG9jaygpOwo+ICAgCQltYWR2aXNlKCh2b2lkICopcCwgU0la
RSwgTUFEVl9QQUdFT1VUKTsKPiAgIAkJY2xvY2tfdCBlbmRfdGltZSA9IGNsb2NrKCk7Cj4gCj4g
ICAJCWRvdWJsZSBlbGFwc2VkX3RpbWUgPSAoZG91YmxlKShlbmRfdGltZSAtIHN0YXJ0X3RpbWUp
IC8gQ0xPQ0tTX1BFUl9TRUM7Cj4gICAJCXByaW50ZigiVGltZSB0YWtlbiBieSByZWNsYW1hdGlv
bjogJWYgc2Vjb25kc1xuIiwgZWxhcHNlZF90aW1lKTsKPiAKPiAgIAkJbXVubWFwKCh2b2lkICop
cCwgU0laRSk7Cj4gICAJfQo+ICAgCXJldHVybiAwOwo+ICAgfQo+IAo+IFRlc3RpbmcgcmVzdWx0
cyBhcmUgYXMgYmVsb3csCj4gdy9vIHBhdGNoOgo+IH4gIyAuL2Eub3V0Cj4gVGltZSB0YWtlbiBi
eSByZWNsYW1hdGlvbjogMC4wMDczMDAgc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRp
b246IDAuMDA3MjI2IHNlY29uZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0aW9uOiAwLjAwNzI5
NSBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNsYW1hdGlvbjogMC4wMDc3MzEgc2Vjb25kcwo+
IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRpb246IDAuMDA3MTM0IHNlY29uZHMKPiBUaW1lIHRha2Vu
IGJ5IHJlY2xhbWF0aW9uOiAwLjAwNzI4NSBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNsYW1h
dGlvbjogMC4wMDc3MjAgc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRpb246IDAuMDA3
MTI4IHNlY29uZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0aW9uOiAwLjAwNzcxMCBzZWNvbmRz
Cj4gVGltZSB0YWtlbiBieSByZWNsYW1hdGlvbjogMC4wMDc3MTIgc2Vjb25kcwo+IFRpbWUgdGFr
ZW4gYnkgcmVjbGFtYXRpb246IDAuMDA3MjM2IHNlY29uZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xh
bWF0aW9uOiAwLjAwNzY5MCBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNsYW1hdGlvbjogMC4w
MDcxNzQgc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRpb246IDAuMDA3NjcwIHNlY29u
ZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0aW9uOiAwLjAwNzE2OSBzZWNvbmRzCj4gVGltZSB0
YWtlbiBieSByZWNsYW1hdGlvbjogMC4wMDczMDUgc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVj
bGFtYXRpb246IDAuMDA3NDMyIHNlY29uZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0aW9uOiAw
LjAwNzE1OCBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNsYW1hdGlvbjogMC4wMDcxMzMgc2Vj
b25kcwo+IOKApgo+IAo+IHcvIHBhdGNoCj4gCj4gfiAjIC4vYS5vdXQKPiBUaW1lIHRha2VuIGJ5
IHJlY2xhbWF0aW9uOiAwLjAwMjEyNCBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNsYW1hdGlv
bjogMC4wMDIxMTYgc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRpb246IDAuMDAyMTUw
IHNlY29uZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0aW9uOiAwLjAwMjI2MSBzZWNvbmRzCj4g
VGltZSB0YWtlbiBieSByZWNsYW1hdGlvbjogMC4wMDIxMzcgc2Vjb25kcwo+IFRpbWUgdGFrZW4g
YnkgcmVjbGFtYXRpb246IDAuMDAyMTczIHNlY29uZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0
aW9uOiAwLjAwMjA2MyBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNsYW1hdGlvbjogMC4wMDIw
ODggc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRpb246IDAuMDAyMTY5IHNlY29uZHMK
PiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0aW9uOiAwLjAwMjEyNCBzZWNvbmRzCj4gVGltZSB0YWtl
biBieSByZWNsYW1hdGlvbjogMC4wMDIxMTEgc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFt
YXRpb246IDAuMDAyMjI0IHNlY29uZHMKPiBUaW1lIHRha2VuIGJ5IHJlY2xhbWF0aW9uOiAwLjAw
MjI5NyBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNsYW1hdGlvbjogMC4wMDIyNjAgc2Vjb25k
cwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRpb246IDAuMDAyMjQ2IHNlY29uZHMKPiBUaW1lIHRh
a2VuIGJ5IHJlY2xhbWF0aW9uOiAwLjAwMjI3MiBzZWNvbmRzCj4gVGltZSB0YWtlbiBieSByZWNs
YW1hdGlvbjogMC4wMDIyNzcgc2Vjb25kcwo+IFRpbWUgdGFrZW4gYnkgcmVjbGFtYXRpb246IDAu
MDAyNDYyIHNlY29uZHMKCkdvb2QgcmVzdWx0LgoKPiBUaGlzIHBhdGNoIHNpZ25pZmljYW50bHkg
c3BlZWRzIHVwIHRyeV90b191bm1hcF9vbmUoKSBieSBhbGxvd2luZyBpdAo+IHRvIHNraXAgcmVk
aXJ0aWVkIFRIUHMgd2l0aG91dCBzcGxpdHRpbmcgdGhlIFBNRC4KPiAKPiBTdWdnZXN0ZWQtYnk6
IEJhb2xpbiBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5hbGliYWJhLmNvbT4KPiBTdWdnZXN0ZWQt
Ynk6IExhbmNlIFlhbmcgPGlvd29ya2VyMEBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQmFy
cnkgU29uZyA8di1zb25nYmFvaHVhQG9wcG8uY29tPgoKTEdUTS4KUmV2aWV3ZWQtYnk6IEJhb2xp
biBXYW5nIDxiYW9saW4ud2FuZ0BsaW51eC5hbGliYWJhLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
