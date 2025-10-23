Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580E3CCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 05:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8Z4xEbsPcREBx+dupCYU6XLd1uAoa661fw2k4/fd4k=; b=avGfMAQhfsN3q7
	zLtP6c62Ec1T0ZUGtOQ3h8VrkPmF9Wo6UborhNVj3ELLqalVYT1/lHYUqKjlKL7AHXBi5biqWt2a2
	O6QDHMXw6Aww0Le7CS52lfrz7oLWHiVxbgjOQanbz2Wj8CfqW42se7Y/8ldtQxMzkAGU8em6dj3Jj
	dbs+gbOx4ikROqLtSEj8uHyF4Frgw28hA3xpKBwHxZbcNT72rtm2H6el/f/bd4NvFF4FkgRbmd1yi
	P8j/0TJHpc+1FOKHdh7rWTOgAmyjI5K4CS05ZO0aBU8yBgcKM0yqPdffI2J6qx3s75pdzj/ZjZDha
	nYcye7nofyhvbjXy50Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoLi-00000005Adr-0jdT;
	Thu, 23 Oct 2025 05:58:58 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoLe-00000005AdR-3t3K
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 05:58:57 +0000
Received: from [192.168.0.105] (unknown [114.241.85.109])
	by APP-03 (Coremail) with SMTP id rQCowABXqIL9w_lo3ZHFFA--.967S2;
	Thu, 23 Oct 2025 13:58:22 +0800 (CST)
Message-ID: <f8a55f89-2612-49e3-88c6-acb523ac74d3@iscas.ac.cn>
Date: Thu, 23 Oct 2025 13:58:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: add Ethernet and PDMA to
 OrangePi RV2
To: michael.opdenacker@rootcommit.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Emil Renner Berthing <emil.renner.berthing@gmail.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251022201807.1474789-1-michael.opdenacker@rootcommit.com>
 <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251022201807.1474789-2-michael.opdenacker@rootcommit.com>
X-CM-TRANSID: rQCowABXqIL9w_lo3ZHFFA--.967S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFyDAryrWFWrGr13Aw4rAFb_yoW8Jw4DpF
	4xWr1Yyrs8Cr48tw4xXw429a4rWw4kJ3yDA3Z0grZ8C3Z8XFyFqrs2qwnxuFW5K34fGayj
	vFW7ua4FqF1UAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvlb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xK
	xwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x07jeoGQUUUUU=
X-Originating-IP: [114.241.85.109]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_225855_358423_11422A74 
X-CRM114-Status: UNSURE (   9.05  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IHNvIG11Y2ggZm9yIHRoZSBwYXRjaCBhbmQgdGVzdGluZyByZXN1bHRzLiBPbmx5
IHNvbWUgbml0cGlja3MKZm9sbG93LgoKT24gMTAvMjMvMjUgMDQ6MTgsIG1pY2hhZWwub3BkZW5h
Y2tlckByb290Y29tbWl0LmNvbSB3cm90ZToKPiBGcm9tOiBNaWNoYWVsIE9wZGVuYWNrZXIgPG1p
Y2hhZWwub3BkZW5hY2tlckByb290Y29tbWl0LmNvbT4KPgo+IFRoZSBPcmFuZ2VQaSBSVjIgYm9h
cmQgc2hpcHMgdHdvIFJHTUlJIGV0aGVybmV0IHBvcnRzLgo+IEVhY2ggaGFzIGFuIGV4dGVybmFs
IE1vdG9yY29tbSBZVDg1MzFDIFBIWSBhdHRhY2hlZCwgdGhlIFBIWSB1c2VzIEdQSU8KPiBmb3Ig
cmVzZXQgcGluIGNvbnRyb2wuCj4KPiBFbmFibGUgUERNQSBmb3IgdGhlIFNwYWNlbWlUIEsxLWJh
c2VkIFNvQyBpbiB0aGUgT3JhbmdlUGkgUlYyIGJvYXJkLgo+Cj4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBPcGRlbmFja2VyIDxtaWNoYWVsLm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20+Cj4gQ0M6
IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BnbWFpbC5jb20+Cj4g
Q0M6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+IENDOiBWaXZpYW4gV2FuZyA8d2FuZ3J1
aWthbmdAaXNjYXMuYWMuY24+CgpGaXJzdGx5LCBpdCBpcyB1c3VhbGx5IHNwZWx0ICJDYzoiLCB3
aXRoIG9uZSB1cHBlci1jYXNlIEMgYW5kIG9uZQpsb3dlci1jYXNlIGMuCgpTZWNvbmRseSwgIkNj
OiIgc2hvdWxkIG5vdCBiZSBuZWNlc3NhcnkgaW4gdGhlIHBhdGNoL2NvbW1pdCBtZXNzYWdlLgpG
cm9tIERvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0OgoKwqAgwqAg
SWYgYSBwZXJzb24gaGFzIGhhZCB0aGUgb3Bwb3J0dW5pdHkgdG8gY29tbWVudCBvbiBhIHBhdGNo
LCBidXQgaGFzIG5vdArCoCDCoCBwcm92aWRlZCBzdWNoIGNvbW1lbnRzLCB5b3UgbWF5IG9wdGlv
bmFsbHkgYWRkIGEgYGBDYzpgYCB0YWcgdG8gdGhlIHBhdGNoLgrCoCDCoCBUaGlzIHRhZyBkb2N1
bWVudHMgdGhhdCBwb3RlbnRpYWxseSBpbnRlcmVzdGVkIHBhcnRpZXMgaGF2ZSBiZWVuIGluY2x1
ZGVkIGluCsKgIMKgIHRoZSBkaXNjdXNzaW9uLgoKSWYgeW91IGxvb2sgdGhyb3VnaCB0aGUgZ2l0
IGxvZ3Mgb2YgTGludXgsIENjIHRhZ3MgYXJlIHJlYWxseSBub3QgYQpyZWd1bGFyIG9jY3VycmVu
Y2UgZXhjZXB0IHRob3NlIG1hcmtpbmcgcGF0Y2hlcyBhcyBzdWl0YWJsZSBmb3IKYmFja3BvcnRp
bmcgdG8gc3RhYmxlLgoKVGhhbmtzLApWaXZpYW4gImRyYW1mb3JldmVyIgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
