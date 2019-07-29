Return-Path: <SRS0=e5eF=V2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBFAC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 07:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9903216C8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2019 07:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S3UAPAED"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9903216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOqIml2p9yDgb/fxHluj4/pyEgR89PPdyFNblapThFI=; b=S3UAPAED401cLB
	aJbNwae7h1b95ZEIr2pX9FeuS5w6yg0OYziQCLn6/ORgeQOfYszZ1/r1KmSe3chlEtOdxMpEUSST7
	eFvpZWVMldDEd+yJ0wDvfqXaefPyIVmhb5Cy3SC2cT8cGOAIoaXOrWkiILdUlQb/v3KwtGEJpb+yd
	keqiWfwiqPmAbF/3kwQ0FfctR+fm0NNKOsK4qKDccrJ/tsuxfQFdp+fqe4v+ZLodAf7ZpfAwEzG0A
	iw/H8DWDXNEWkLhzsChLT2pkVN7Hat0gX8wqejUjV4CveEPK2bUqla7+j9aYtOiyA7O4d+2jn2j1J
	aW2TLi7Lo/DKHLEnVLPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs0CC-0005k2-Rs; Mon, 29 Jul 2019 07:35:48 +0000
Received: from smtp180.sjtu.edu.cn ([202.120.2.180])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs0C9-0005f8-68
 for linux-riscv@lists.infradead.org; Mon, 29 Jul 2019 07:35:47 +0000
Received: from mta04.sjtu.edu.cn (mta04.sjtu.edu.cn [202.121.179.8])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id 8916710089E1C;
 Mon, 29 Jul 2019 15:35:15 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id 6A8B0180610F8;
 Mon, 29 Jul 2019 15:35:15 +0800 (CST)
X-Virus-Scanned: amavisd-new at 
Received: from mta04.sjtu.edu.cn ([127.0.0.1])
 by localhost (mta04.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 7dS9vcJ9Qf-l; Mon, 29 Jul 2019 15:35:15 +0800 (CST)
Received: from mailstore19.sjtu.edu.cn (mailstore19.sjtu.edu.cn
 [202.121.179.19])
 by mta04.sjtu.edu.cn (Postfix) with ESMTP id 3F0A0180610F7;
 Mon, 29 Jul 2019 15:35:15 +0800 (CST)
Date: Mon, 29 Jul 2019 15:35:14 +0800 (CST)
From: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <310108829.9436429.1564385714781.JavaMail.zimbra@sjtu.edu.cn>
In-Reply-To: <20190729062548.4pio5sfuxfwwxecr@pengutronix.de>
References: <20190727070916.2960-1-xywang.sjtu@sjtu.edu.cn>
 <20190729062548.4pio5sfuxfwwxecr@pengutronix.de>
Subject: Re: [PATCH] pwm: avoid disabling clk twice
MIME-Version: 1.0
X-Originating-IP: [202.120.40.82]
X-Mailer: Zimbra 8.8.9_GA_3798 (ZimbraWebClient - GC73 (Linux)/8.8.9_GA_3744)
Thread-Topic: avoid disabling clk twice
Thread-Index: 5H4ORNZJT/EZAbsON7ampQXHnGMF2w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_003545_430266_0ECD9DCF 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pwm@vger.kernel.org, palmer <palmer@sifive.com>,
 Yash Shah <yash.shah@sifive.com>, thierry reding <thierry.reding@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

CgotLS0tLSBPbiBKdWwgMjksIDIwMTksIGF0IDI6MjUgUE0sIFV3ZSBLbGVpbmUtS8O2bmlnIHUu
a2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZSB3cm90ZToKCj4gSGVsbG8sCj4gCj4gT24gU2F0
LCBKdWwgMjcsIDIwMTkgYXQgMDM6MDk6MTZQTSArMDgwMCwgV2FuZyBYaWF5YW5nIHdyb3RlOgo+
PiBTaW1pbGFyIHRvIGNvbW1pdCA2M2ZkNGI5NGI5NDggKCJzZXJpYWw6IGlteDogZml4IGVycm9y
IGhhbmRsaW5nCj4+IGluIGNvbnNvbGVfc2V0dXAiKSwgYXMgZGRhdGEtPmNsayBoYXMgYmVlbiBl
eHBsaWNpdGx5IGRpc2FibGVkIHR3bwo+PiBsaW5lcyBhYm92ZSwgaXQgc2hvdWxkIGF2b2lkIGJl
aW5nIGRpc2FibGVkIGZvciB0aGUgc2Vjb25kIHRpbWUuCj4+IGNsa191bnByZXBhcmUoKSBzdWl0
cyBoZXJlIGJldHRlci4KPj4gCj4+IFNpZ25lZC1vZmYtYnk6IFdhbmcgWGlheWFuZyA8eHl3YW5n
LnNqdHVAc2p0dS5lZHUuY24+Cj4+IC0tLQo+PiAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIHwg
MiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4+
IAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jCj4+IGluZGV4IGE3YzEwN2YxOWU2Ni4uMDBmNmZhYjViZDNiIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPj4gKysrIGIvZHJpdmVycy9wd20vcHdt
LXNpZml2ZS5jCj4+IEBAIC0zMTIsNyArMzEyLDcgQEAgc3RhdGljIGludCBwd21fc2lmaXZlX3Jl
bW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCj4+ICAJaWYgKGlzX2VuYWJsZWQpCj4+
ICAJCWNsa19kaXNhYmxlKGRkYXRhLT5jbGspOwo+PiAgCj4+IC0JY2xrX2Rpc2FibGVfdW5wcmVw
YXJlKGRkYXRhLT5jbGspOwo+PiArCWNsa191bnByZXBhcmUoZGRhdGEtPmNsayk7Cj4+ICAJcmV0
ID0gcHdtY2hpcF9yZW1vdmUoJmRkYXRhLT5jaGlwKTsKPj4gIAljbGtfbm90aWZpZXJfdW5yZWdp
c3RlcihkZGF0YS0+Y2xrLCAmZGRhdGEtPm5vdGlmaWVyKTsKPiAKPiBJIHRoaW5rIHRoaXMgcGF0
Y2ggaXMgd3JvbmcuCj4gCj4gQWZ0ZXIgYSBzdWNjZXNzZnVsbCBjYWxsIHRvIC5wcm9iZSB0aGUg
Y2xvY2sgaXMgbGVmdCBwcmVwYXJlZCBhbmQKPiBlbmFibGVkLiBUaGlzIGlzIHVuZG9uZSBpbiB0
aGUgdW5jb25kaXRpb25hbCBjYWxsIHRvCj4gY2xrX2Rpc2FibGVfdW5wcmVwYXJlIHRoYXQgeW91
IHJlbW92ZWQuCgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciBwb2ludGluZyBvdXQgdGhlIGlzc3Vl
LiBJIGRpZCBtaXNzIHRoZSBub3JtYWwgcGF0aDooCgo+IFRoZXJlIGlzIGhvd2V2ZXIgc3RpbGwg
YSBwcm9ibGVtOiBJZiBMaW51eCBpcyBzdGFydGVkIHdpdGggdGhlIHB3bQo+IGVuYWJsZWQgKHN1
Y2ggdGhhdCAuZ2V0X3N0YXRlIHJldHVybnMgc3RhdGUtPmVuYWJsZWQgPSB0cnVlKSB0aGVuCj4g
ZGlzYWJsaW5nIHRoZSBwd20gaGFzIG9uZSBjbGtfZGlzYWJsZSB0b28gbXVjaC4KPiAKClRoZXJl
IGlzIGFub3RoZXIgcGF0aCBvZiBkb3VibGUtZGlzYWJsaW5nOiBwd21fc2lmaXZlX2VuYWJsZSgp
IG1heSBkaXNhYmxlCmRkYXRhLT5jbGsgYXMgcmVxdWlyZWQgYnkgdGhlICdlbmFibGUnIGZsYWcu
CnB3bV9zaWZpdmVfYXBwbHkoKSBjYWxscyBpdCBhbmQgcGFzc2VzIHRoZSBmbGFnLiBIb3dldmVy
LCB0aGVyZSBpcwphIGNsa19kaXNhYmxlKGRkYXRhLT5jbGspIGp1c3QgYmVsb3cgaW52b2tpbmcg
cHdtX3NpZml2ZV9lbmFibGUoKQppbiBwd21fc2lmaXZlX2FwcGx5KCkuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
