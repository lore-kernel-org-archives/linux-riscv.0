Return-Path: <SRS0=XVif=ON=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184CDC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F456121F
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Sep 2021 09:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F456121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YmFzByrGDBkVy2/RL76nOLpc3ZhubxmG1pZY/bgUDmI=; b=uqmeXh8epMunL0kpZaV63o76tA
	Fvvgum4MGUegQkSzW4dLjMEX5wnNDJPXUXi3D019CcH38Ad49Q/mGX1D9uz8iwctE2IHeuOMnzDgt
	qwZEA6cHP2H8RGKJ+HeOfcgzNK9pABHksMrIQiq3iKVWYZEfdMxdGBdewSFKVuz0LmpFkzJc6XKwK
	Ty89Oq8dDTiJoxPxXpuJ3moMYqIijzvzoxIQNjh8Vqi3fwU5DHQGE9aatZfoi4rTaCp5XK3AJvEOv
	FR4wkf2WSsq7HzaUarAgiGZEHYufoF5Uk0E8p9yHdTdOLcSoCPDyAn0L1mddo04AIonk5lHa1Pnzv
	KtbOalhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTLFW-00Ap0V-Nu; Thu, 23 Sep 2021 09:42:38 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTLFT-00Aoz1-Mc
 for linux-riscv@lists.infradead.org; Thu, 23 Sep 2021 09:42:37 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
 by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 18N9gXdj038038
 for <linux-riscv@lists.infradead.org>; Thu, 23 Sep 2021 12:42:33 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
 q=dns/txt; i=@ics.forth.gr; t=1632390148; x=1634982148;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=REVIbiYY3tzh8nWvkfpsBLWmSnyEr4yRMntSdzxF5UA=;
 b=V59fssE5tBUm7ZA/ovi83MXG0MyFNiPGmIXYgcDAr5FJ2hZp0K3UUcEaKj0hnHg5
 QVCm75G7OG+aIcrqbaVtEYyS68rqHLYirByBk9pyAcVyC7WDMnDrm+1ZRqqkZkuE
 479nGizkAzou0nFMUgs03U1ONqhF8ESmun+IoPZ+v20tHk1E6J4X4t9C0+GCPmmU
 NZhgwB2JLUe8i++IHG5P0FNEPqlH+NauyxfLgqLXnfRZprXr/lAMs+6mKikcA44l
 sY4vtL+jD5fBiZaBGvexD6NXrnUGg/W2SsOaGVQNdmwtLsOGX3HX7YYztBwKj478
 Dxf/Z5p/qAOj874i19ctfw==;
X-AuditID: 8b5b014d-ba8f670000005d46-f0-614c4c0469b6
Received: from enigma.ics.forth.gr (enigma.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 AF.FB.23878.40C4C416; Thu, 23 Sep 2021 12:42:28 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user:  at ics.forth.gr
MIME-Version: 1.0
Date: Thu, 23 Sep 2021 12:42:28 +0300
From: Nick Kossifidis <mick@ics.forth.gr>
To: Anup Patel <anup@brainfault.org>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Guo Ren <guoren@kernel.org>, Anup
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
In-Reply-To: <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
References: <20210923072716.913826-1-guoren@kernel.org>
 <6d7b1668c1f562a5ef426bb2519f9784@mailhost.ics.forth.gr>
 <CAAhSdy0YDP3Nk8N9fnrKgS+3Rjt=5tLCh20upmUGK9SK67nNvg@mail.gmail.com>
Message-ID: <0861cc74d3886e685e9aa5d13ddcd781@mailhost.ics.forth.gr>
X-Sender: mick@mailhost.ics.forth.gr
User-Agent: Roundcube Webmail/1.3.16
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmplleLIzCtJLcpLzFFi42Lpjp6urMvi45NocPWDmsWTQ+1sFtMOHGK3
 aJ2wm8XiyYeJbBYtH96xWvyddIzdYtGK7ywWS3ZKW+x5tYfd4kJzD6PFvRXL2C12989hsdh+
 /jubxYu9jSwWxx/tYrFYufook8WFxpvsFpdXz2eyeH7qGJvFpS/XWCwu75rDZrHtcwubxcp1
 x5gtZvz4x2jR/O4cu8XWjesYLbpXVluc3HCA0WLN0qmMFi37p7BY/Dx0nsli4et57A4KHq/a
 njF5/P41idHj3e9ljB5Tf59h8VjT+ZrJY1ZDL5vHnXPn2Tw2PFrN6vH/0EoWj52z7rJ7LNhU
 6tFy5C2rx8NNl5g8Nq3qZPPY+dDSY/OS+gCJKC6blNSczLLUIn27BK6M+1+vMRXs5ak4vu84
 YwPjJ84uRk4OCQETiW3rXjGD2EICRxklzr6Rg4ibSsze28kIYvMKCEqcnPmEBcRmFrCQmHpl
 PyOELS/RvHU2WC+LgKrE9wc/WEFsNgFNifmXDoLViwioSDx/eg6onguofg63xMZ9P5lAEsIC
 5hJvvzawg9j8AsISn+5eBGvmFAiUuPLjIwtIg5DATkaJ6c+fMUNc4SLxcvNXRojrVCQ+/H4A
 1MzBIQpkb56rNIFRcBaSW2chuXUWklsXMDKvYhRILDPWy0wu1kvLLyrJ0Esv2sQITimMvjsY
 b29+q3eIkYmD8RCjBAezkgjv5xteiUK8KYmVValF+fFFpTmpxYcYpTlYlMR5efUmxAsJpCeW
 pGanphakFsFkmTg4pRqYPEMN3u/PkwrWjOr9k2vz6k6sYGz1pCUJ0rWfnDw1udYaLDdXc1I7
 qsfXExZSy/Fiy6yuK3Knsvc3rjq64GlUYu9DM58/l9cab5W8lf73q1CCklxESNHiTQ0SXuo3
 D16tLddfZTD/w4LlcVsmRRjtjdkWlDUlfsXpe+eZetyfHl7IcMIu2zMjeLukn+XzlohLKyaa
 8rdPet/H55x46amiRhVXVNA1oQWRm9yeFE9yixIonbYy7tDPwxbtb535JBmutc675vGyo31x
 sHnedKsnd+LmandMVDbcyiL5csr9zx8EBGr68748v9zmnsS+PPno7cBmvg8Xvx6/fEDCbffC
 BYHbnZRjti/42njfUnyfEktxRqKhFnNRcSIANIa0FpgDAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210923_024236_152620_07B02D77 
X-CRM114-Status: GOOD (  12.02  )
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

zqPPhM65z4IgMjAyMS0wOS0yMyAxMjozNywgQW51cCBQYXRlbCDOrc6zz4HOsc+IzrU6Cj4gT24g
VGh1LCBTZXAgMjMsIDIwMjEgYXQgMjo1NSBQTSBOaWNrIEtvc3NpZmlkaXMgPG1pY2tAaWNzLmZv
cnRoLmdyPiAKPiB3cm90ZToKPj4gCj4+IEhlbGxvIEd1bywKPj4gCj4+IM6jz4TOuc+CIDIwMjEt
MDktMjMgMTA6MjcsIGd1b3JlbkBrZXJuZWwub3JnIM6tzrPPgc6xz4jOtToKPj4gZGlmZiAtLWdp
dCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPj4g
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4+IGlu
ZGV4IGU1MzRmNmE3Y2ZhMS4uMTgyNWNkOGRiMGRlIDEwMDY0NAo+PiAtLS0gYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPj4gQEAgLTU2LDcgKzU2
LDkgQEAgcHJvcGVydGllczoKPj4gICAgICAgZW51bToKPj4gICAgICAgICAtIHJpc2N2LHN2MzIK
Pj4gICAgICAgICAtIHJpc2N2LHN2MzkKPj4gKyAgICAgIC0gcmlzY3Ysc3YzOSxzdnBibXQKPj4g
ICAgICAgICAtIHJpc2N2LHN2NDgKPj4gKyAgICAgIC0gcmlzY3Ysc3Y0OCxzdnBibXQKPj4gICAg
ICAgICAtIHJpc2N2LG5vbmUKPj4gCj4+IElzbid0IHN2cGJtdCBvcnRob2dvbmFsIHRvIHRoZSBt
bXUgdHlwZSA/IEl0J3MgYSBmdW5jdGlvbmFsaXR5IHRoYXQgCj4+IGNhbgo+PiBiZSBwcmVzZW50
IG9uIGVpdGhlciBzdjM5LzQ4LzU3IHNvIHdoeSBub3QgaGF2ZSBhbm90aGVyICJzdnBibXQiCj4+
IHByb3BlcnR5IGRpcmVjdGx5IG9uIHRoZSBjcHUgbm9kZSA/Cj4gCj4gQWN0dWFsbHksICJtbXUt
dHlwZSIgd291bGQgYmUgYSBnb29kIHBsYWNlIGJlY2F1c2UgaXQncyBwYWdlIGJhc2VkCj4gbWVt
b3J5IGF0dHJpYnV0ZSBhbmQgcGFnaW5nIGNhbid0IGV4aXN0IHdpdGhvdXQgbW11IHRyYW5zbGF0
aW9uIG1vZGUuCj4gCj4gQWxzbywgInN2cG1idCIgaXMgaW5kZWVkIGEgQ1BVIHByb3BlcnR5IHNv
IGhhcyB0byBiZSBmZWF0dXJlIGluZGl2aWR1YWwKPiBDUFUgbm9kZS4gSHlwb3RoZXRpY2FsbHks
IGEgaGV0ZXJvZ2VuZW91cyBzeXN0ZW0gaXMgcG9zc2libGUgd2hlcmUKPiBzb21lIENQVXMgaGF2
ZSAic3ZwbWJ0IiBhbmQgc29tZSBDUFVzIGRvbid0IGhhdmUgInN2cG1idCIuIEZvcgo+IGV4YW1w
bGUsIGEgZnV0dXJlIEZVeHh4IFNvQyBtaWdodCBoYXZlIGEgRS1jb3JlIGFuZCBmZXcgUy1jb3Jl
cwo+IHdoZXJlIFMtY29yZXMgaGF2ZSBTdnBtYnQgd2hlcmVhcyBFLWNvcmUgZG9lcyBub3QgaGF2
ZSBTdnBtYnQKPiBiZWNhdXNlIGl0J3MgYW4gZW1iZWRkZWQgY29yZS4KPiAKCkkgc2hvdWxkIHNh
eSBjcHVYIG5vZGUsIG5vdCB0aGUgcm9vdCAvY3B1IG5vZGUuIFdlIGNhbiBoYXZlIGFuIHN2cGJt
dCAKcHJvcGVydHkgaW4gdGhlIHNhbWUgd2F5IHdlIGhhdmUgYW4gbW11LXR5cGUgcHJvcGVydHku
CgpSZWdhcmRzLApOaWNrCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
