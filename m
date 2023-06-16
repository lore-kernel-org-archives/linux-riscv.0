Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9F8EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 20:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZNEr1NH8H3Pl7MmpK+aN8r7M6rAmtH/OOZCN4Ln8/w=; b=cSj4iNzKnvC6hu
	v/W5OzwSMhUvc/LGVCF9g5S6crt+5M5XExaZ1lIKcpeZSakrxMUtC5UEsBlFwNSS29Nq4t93Uxg26
	tSEm0UBnaMjn+lHCchYZbyxya5NRoIAOGnZ0TqAU4tu3uxXCeDXGvCQ2qCRGVXqEUzTIOGibuBERH
	fQ9uOCaCdTzDlJ7nDho0lzd3nj6Xc+lVsXB9ipRf5sRNmhiaHu9CpJY5erBBmE/PWWe/j9XEHIi3b
	cracBCCXO8Z9Eb091h9Nebgrx13h8gfSINVOFlSB0XpSrDJmUD+rJdgM8iZnf41e9BqS5HppDaJ9U
	3llT5a5D/uW1EVA3ePPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAFrS-001lC9-15;
	Fri, 16 Jun 2023 20:15:58 +0000
Received: from smtp-28.smtpout.orange.fr ([80.12.242.28] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAElF-001ZAz-06
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 19:05:33 +0000
Received: from [192.168.1.18] ([86.243.2.178])
	by smtp.orange.fr with ESMTPA
	id AEl3qsN0azGOZAEl3qbxZO; Fri, 16 Jun 2023 21:05:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1686942324;
	bh=/1NDZljZnmXw+wvMypf9in+CWgaJ6Ha7fof+KMEWXkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=L1UHQQdov53KIZubtn8++RpOhsQ336Ta3YPRBhRuX+L5tPvyLagPQfB5+mOFL66hO
	 ZdKc16v0XbvRm3X8+bPz6G2+CG7tdKOqAmJh2pT9xIRa959Pw4eXeNRGbn3lQ4yjPj
	 dp7ttXFUrwPSQJF08JZflCBCFkXtuUO1Wj01VGMcDfBwI8F5evSGqQDsx490s3tPPx
	 CcWi/aIYBk7nWVuCyg+R1RY3I+/R0XZJ3hQvAZFNpdjJsDFy08URyIiitMJw58wNZD
	 qY6d6yPcosQpXXPf/3sf+1e8wlXlYN0U0Bf55QZAaBuukY4Bt2T3APgG+WFl4IYl9o
	 0jtudusahc8SA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 16 Jun 2023 21:05:24 +0200
X-ME-IP: 86.243.2.178
Message-ID: <ae77d0ce-9a54-d779-daa2-c429631c8bb7@wanadoo.fr>
Date: Fri, 16 Jun 2023 21:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/3] soc: sifive: Add SiFive private L2 cache PMU driver
Content-Language: fr
To: Eric Lin <eric.lin@sifive.com>, conor@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org,
 chenhuacai@kernel.org, baolu.lu@linux.intel.com, will@kernel.org,
 kan.liang@linux.intel.com, nnac123@linux.ibm.com, pierre.gondois@arm.com,
 huangguangbin2@huawei.com, jgross@suse.com, chao.gao@intel.com,
 maobibo@loongson.cn, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>,
 Nick Hu <nick.hu@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-3-eric.lin@sifive.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230616063210.19063-3-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_120529_290968_8ED1FBE2 
X-CRM114-Status: GOOD (  13.62  )
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

TGUgMTYvMDYvMjAyMyDDoCAwODozMiwgRXJpYyBMaW4gYSDDqWNyaXTCoDoKPiBGcm9tOiBHcmVl
bnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+IAo+IFRoaXMgYWRkcyBTaUZpdmUg
cHJpdmF0ZSBMMiBjYWNoZSBQTVUgZHJpdmVyLiBVc2VyCj4gY2FuIHVzZSBwZXJmIHRvb2wgdG8g
cHJvZmlsZSBieSBldmVudCBuYW1lIGFuZCBldmVudCBpZC4KPiAKPiBFeGFtcGxlOgo+ICQgcGVy
ZiBzdGF0IC1DIDAgLWUgL3NpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfYnRvdC8K
PiAgICAgICAgICAgICAgICAgIC1lIC9zaWZpdmVfcGwyX3BtdS9pbm5lcl9hY3F1aXJlX2Jsb2Nr
X250b2IvCj4gICAgICAgICAgICAgICAgICAtZSAvc2lmaXZlX3BsMl9wbXUvaW5uZXJfYWNxdWly
ZV9ibG9ja19udG90LyBscwo+IAo+ICAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0cyBmb3IgJ0NQ
VShzKSAwJzoKPiAKPiAgICAgICAgICAgICAgICAgMzAwICAgICAgc2lmaXZlX3BsMl9wbXUvaW5u
ZXJfYWNxdWlyZV9ibG9ja19idG90Lwo+ICAgICAgICAgICAgICAgMTc4MDEgICAgICBzaWZpdmVf
cGwyX3BtdS9pbm5lcl9hY3F1aXJlX2Jsb2NrX250b2IvCj4gICAgICAgICAgICAgICAgNTI1MyAg
ICAgIHNpZml2ZV9wbDJfcG11L2lubmVyX2FjcXVpcmVfYmxvY2tfbnRvdC8KPiAKPiAgICAgICAg
IDAuMDg4OTE3MzI2IHNlY29uZHMgdGltZSBlbGFwc2VkCj4gCj4gJCBwZXJmIHN0YXQgLUMgMCAt
ZSAvc2lmaXZlX3BsMl9wbXUvZXZlbnQ9MHgxMDAwMS8KPiAgICAgICAgICAgICAgICAgIC1lIC9z
aWZpdmVfcGwyX3BtdS9ldmVudD0weDQwMDEvCj4gICAgICAgICAgICAgICAgICAtZSAvc2lmaXZl
X3BsMl9wbXUvZXZlbnQ9MHg4MDAxLyBscwo+IAo+ICAgUGVyZm9ybWFuY2UgY291bnRlciBzdGF0
cyBmb3IgJ0NQVShzKSAwJzoKPiAKPiAgICAgICAgICAgICAgICAgMjUxICAgICAgc2lmaXZlX3Bs
Ml9wbXUvZXZlbnQ9MHgxMDAwMS8KPiAgICAgICAgICAgICAgICAyNjIwICAgICAgc2lmaXZlX3Bs
Ml9wbXUvZXZlbnQ9MHg0MDAxLwo+ICAgICAgICAgICAgICAgICA2NDQgICAgICBzaWZpdmVfcGwy
X3BtdS9ldmVudD0weDgwMDEvCj4gCj4gICAgICAgICAwLjA5MjgyNzExMCBzZWNvbmRzIHRpbWUg
ZWxhcHNlZAo+IAo+IFNpZ25lZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNp
Zml2ZS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRXJpYyBMaW4gPGVyaWMubGluQHNpZml2ZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1i
eTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+IC0tLQoKWy4uLl0KCj4gK2ludCBzaWZp
dmVfcGwyX3BtdV9wcm9iZShzdHJ1Y3QgZGV2aWNlX25vZGUJKnBsMl9ub2RlLAo+ICsJCQkgdm9p
ZCBfX2lvbWVtICpwbDJfYmFzZSwgaW50IGNwdSkKPiArewo+ICsJc3RydWN0IHNpZml2ZV9wbDJf
cG11X2V2ZW50ICpwdHIgPSBwZXJfY3B1X3B0cigmc2lmaXZlX3BsMl9wbXVfZXZlbnQsIGNwdSk7
Cj4gKwlpbnQgcmV0ID0gLUVJTlZBTDsKCk5pdDogbm8gbmVlZCB0byBpbml0Cgo+ICsKPiArCS8q
IEdldCBjb3VudGVyIG51bWJlcnMuICovCj4gKwlyZXQgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihw
bDJfbm9kZSwgInNpZml2ZSxwZXJmbW9uLWNvdW50ZXJzIiwgJnB0ci0+Y291bnRlcnMpOwo+ICsJ
aWYgKHJldCkgewo+ICsJCXByX2VycigiTm90IGZvdW5kIHNpZml2ZSxwZXJmbW9uLWNvdW50ZXJz
IHByb3BlcnR5XG4iKTsKPiArCQlnb3RvIGVhcmx5X2VycjsKPiArCX0KPiArCXByX2luZm8oInBl
cmZtb24tY291bnRlcnM6ICVkIGZvciBDUFUgJWRcbiIsIHB0ci0+Y291bnRlcnMsIGNwdSk7Cj4g
Kwo+ICsJLyogQWxsb2NhdGUgcGVyZl9ldmVudC4gKi8KPiArCXB0ci0+ZXZlbnRzID0ga2NhbGxv
YyhwdHItPmNvdW50ZXJzLCBzaXplb2Yoc3RydWN0IHBlcmZfZXZlbnQpLCBHRlBfS0VSTkVMKTsK
PiArCWlmICghcHRyLT5ldmVudHMpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gKwo+ICsJcHRyLT5l
dmVudF9zZWxlY3RfYmFzZSA9IHBsMl9iYXNlICsgU0lGSVZFX1BMMl9TRUxFQ1RfQkFTRV9PRkZT
RVQ7Cj4gKwlwdHItPmV2ZW50X2NvdW50ZXJfYmFzZSA9IHBsMl9iYXNlICsgU0lGSVZFX1BMMl9D
T1VOVEVSX0JBU0VfT0ZGU0VUOwo+ICsKPiArCWlmICghcGwycG11X2luaXRfZG9uZSkgewo+ICsJ
CXJldCA9IHBlcmZfcG11X3JlZ2lzdGVyKHNpZml2ZV9wbDJfcG11LnBtdSwgc2lmaXZlX3BsMl9w
bXUucG11LT5uYW1lLCAtMSk7Cj4gKwkJaWYgKHJldCkgewo+ICsJCQljcHVocF9zdGF0ZV9yZW1v
dmVfaW5zdGFuY2UoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TSUZJVkVfUEwyX1BNVV9PTkxJTkUsCj4g
KwkJCQkJCSAgICAmc2lmaXZlX3BsMl9wbXUubm9kZSk7Cj4gKwkJCXByX2VycigiRmFpbGVkIHRv
IHJlZ2lzdGVyIHNpZml2ZV9wbDJfcG11LnBtdTogJWRcbiIsIHJldCk7Cj4gKwkJfQo+ICsJCXNp
Zml2ZV9wbDJfcG11X3BtX2luaXQoKTsKPiArCQlwbDJwbXVfaW5pdF9kb25lID0gdHJ1ZTsKPiAr
CX0KPiArCj4gKwlyZXR1cm4gMDsKPiArCj4gK2Vhcmx5X2VycjoKPiArCXJldHVybiByZXQ7Cj4g
K30KPiArCj4gK2ludCBzaWZpdmVfcGwyX3BtdV9pbml0KHZvaWQpCj4gK3sKPiArCWludCByZXQg
PSAwOwoKTml0OiBubyBuZWVkIHRvIGluaXQKCj4gKwo+ICsJcmV0ID0gY3B1aHBfc2V0dXBfc3Rh
dGVfbXVsdGkoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TSUZJVkVfUEwyX1BNVV9PTkxJTkUsCj4gKwkJ
CQkgICAgICAicGVyZi9zaWZpdmUvcGwycG11Om9ubGluZSIsCj4gKwkJCQkgICAgICBzaWZpdmVf
cGwyX3BtdV9vbmxpbmVfY3B1LAo+ICsJCQkJICAgICAgc2lmaXZlX3BsMl9wbXVfb2ZmbGluZV9j
cHUpOwo+ICsJaWYgKHJldCkKPiArCQlwcl9lcnIoIkZhaWxlZCB0byByZWdpc3RlciBDUFUgaG90
cGx1ZyBub3RpZmllciAlZFxuIiwgcmV0KTsKPiArCj4gKwlyZXQgPSBjcHVocF9zdGF0ZV9hZGRf
aW5zdGFuY2UoQ1BVSFBfQVBfUEVSRl9SSVNDVl9TSUZJVkVfUEwyX1BNVV9PTkxJTkUsCj4gKwkJ
CQkgICAgICAgJnNpZml2ZV9wbDJfcG11Lm5vZGUpOwo+ICsJaWYgKHJldCkKPiArCQlwcl9lcnIo
IkZhaWxlZCB0byBhZGQgaG90cGx1ZyBpbnN0YW5jZTogJWRcbiIsIHJldCk7Cj4gKwo+ICsJcmV0
dXJuIHJldDsKCk5pdDogcmV0dXJuIDA7Cgo+ICt9CgpbLi4uXQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
