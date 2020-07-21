Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692E9C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 02:38:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9E8206E9
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 02:38:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i24tQvpI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B9E8206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eswin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3zVdGBHSeIjJ9hsoWQwsNEv5OLJ1oV1f+6aCZVlllWY=; b=i24tQvpI8dTZVVUlogruRwmQ6
	QUc1t7HiI4HikDT6PjbjzA7QTYIi5voTjd3TRlaukoTXyxn9UjB9EdUqTaT3f+U4p+UBODR5MmRmw
	5AVT13ZB1ClI6Dq7r0k74Z5LtV9exODuwhtyS8jLKe4+pEPeSvqlaVeCjSnd5NOqtRYz0+/7aEzrY
	YHqBKOFDhkRBPe85iBdVK+NnqCAztmedsn5cl2Vqu9aoFO1ulcw8EphceFa3o8sSbayzbThpdzWds
	vvN06Wdg4GAVnCit+ixNuGigtCHFN/L9bw7y3c02TLde0z2Xgdj84Gseh+wluVyB6Ch+9lmYr65D1
	Mp/bRbI2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxiAu-0003dr-D6; Tue, 21 Jul 2020 02:38:36 +0000
Received: from out28-5.mail.aliyun.com ([115.124.28.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxiAr-0003cD-6p
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 02:38:35 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07916176|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0445112-0.0024327-0.953056;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03298; MF=maochenxi@eswin.com; NM=1; PH=DS; RN=6;
 RT=6; SR=0; TI=SMTPD_---.I56PH.u_1595299106; 
Received: from 10.1.56.17(mailfrom:maochenxi@eswin.com
 fp:SMTPD_---.I56PH.u_1595299106)
 by smtp.aliyun-inc.com(10.194.98.253);
 Tue, 21 Jul 2020 10:38:26 +0800
Subject: Re: [PATCH 1/1] riscv: Enable ARCH_HAS_FAST_MULTIPLIER for RV64I
From: Chenxi Mao <maochenxi@eswin.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
References: <mhng-e8fe18f0-e6d7-4ee2-8a9b-a00dbf0b338b@palmerdabbelt-glaptop1>
 <7ad95929-039f-9760-fc30-e89e02424361@eswin.com>
Message-ID: <c5d82526-233a-15d5-90df-ca0c25a53639@eswin.com>
Date: Tue, 21 Jul 2020 10:38:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7ad95929-039f-9760-fc30-e89e02424361@eswin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_223833_573999_C7287330 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: chenxi.mao2013@gmail.com, linux-riscv@lists.infradead.org,
 aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyOgoKTW92ZSB0byBSSVNDViBwbGF0Zm9ybSBpcyBvayBmb3IgbWUsIGJ1dCBJIGNh
bm5vdCBldmFsdWF0ZSBSVjMyIGNvbmRpdGlvbi4KCkNoZW54aQoKCk9uIDIwMjAvNy8yMSDkuIrl
jYg5OjQ3LCBDaGVueGkgTWFvIHdyb3RlOgo+IEhpIFBhbG1lcjoKPgo+IFRoYW5rcyBmb3IgeW91
ciByZXBseS4KPgo+IEZyYW5rbHksIEkgZGlkbid0IHRlc3QgQVJDSF9IQVNfRkFTVF9NVUxUSVBM
SUVSIG9uIFJWMzIsCj4KPiBzbyBJIGNhbm5vdCBwdXQgaXQgaW4gUklTQ1YgcGxhdGZvcm0uCj4K
PiBJIGFtIHRyeWluZyB0byBjb21wYXJpbmcgQVJNNjQgd2l0aCBSaXNjdiB0byBmaW5kIG91dCBt
b3JlIG9wdGltaXphdGlvbgo+Cj4gY29uZmlndXJhdGlvbnMuCj4KPiBJIHN1Z2dlc3QgdG8gZW5h
YmxlIEFSQ0hfSEFTX0ZBU1RfTVVMVElQTElFUiBvbiBSVjY0IGZpcnN0Lgo+Cj4gSWYgc29tZW9u
ZSBlbHNlIGV2YWx1YXRlIHRoaXMgb24gUlYzMiwgd2UgY291bGQgbW92ZSBpdCB0byBSSVNDViBw
bGF0Zm9ybS4KPgo+Cj4gQ2hlbnhpCj4KPgo+IE9uIDIwMjAvNy8yMSDkuIrljYg5OjE3LCBQYWxt
ZXIgRGFiYmVsdCB3cm90ZToKPj4gT24gV2VkLCAwOCBKdWwgMjAyMCAyMjoxOToyMiBQRFQgKC0w
NzAwKSwgbWFvY2hlbnhpQGVzd2luLmNvbSB3cm90ZToKPj4+IEVuYWJsZSBBUkNIX0hBU19GQVNU
X01VTFRJUExJRVIgb24gUlY2NEkKPj4+IHdoaWNoIHdvcmtzIGZpbmUgb24gR0NDLTkuMyBhbmQg
R0NDLTEwLjEKPj4+Cj4+PiBQUzI6IHJlbW92ZSBBUkNIX1NVUFBPUlRTX0lOVDEyOCBiZWNhdXNl
IG9mIFJWNjRJIGFscmVhZHkgZW5hYmxlZC4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGVueGkg
TWFvIDxtYW9jaGVueGlAZXN3aW4uY29tPgo+Pj4gLS0tCj4+PiDCoGFyY2gvcmlzY3YvS2NvbmZp
ZyB8IDEgKwo+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9LY29uZmlnIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBpbmRl
eCAxMjgxOTJlMTRmZjIuLjg0ZTY3NzdmZWNhZCAxMDA2NDQKPj4+IC0tLSBhL2FyY2gvcmlzY3Yv
S2NvbmZpZwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9LY29uZmlnCj4+PiBAQCAtMjAyLDYgKzIwMiw3
IEBAIGNvbmZpZyBBUkNIX1JWNjRJCj4+PiDCoMKgwqDCoCBib29sICJSVjY0SSIKPj4+IMKgwqDC
oMKgIHNlbGVjdCA2NEJJVAo+Pj4gwqDCoMKgwqAgc2VsZWN0IEFSQ0hfU1VQUE9SVFNfSU5UMTI4
IGlmIENDX0hBU19JTlQxMjggJiYgR0NDX1ZFUlNJT04gPj0gNTAwMDAKPj4+ICvCoMKgwqAgc2Vs
ZWN0IEFSQ0hfSEFTX0ZBU1RfTVVMVElQTElFUgo+Pj4gwqDCoMKgwqAgc2VsZWN0IEhBVkVfRFlO
QU1JQ19GVFJBQ0UgaWYgTU1VCj4+PiDCoMKgwqDCoCBzZWxlY3QgSEFWRV9EWU5BTUlDX0ZUUkFD
RV9XSVRIX1JFR1MgaWYgSEFWRV9EWU5BTUlDX0ZUUkFDRQo+Pj4gwqDCoMKgwqAgc2VsZWN0IEhB
VkVfRlRSQUNFX01DT1VOVF9SRUNPUkQKPj4gQWgsIHRoYW5rcyAtLSB0aGlzIG9uZSBkaWRuJ3Qg
c2hvdyB1cCB3aGVuIEkgd2FzIGxvb2tpbmcgYXQgdGhlIGxhc3Qgb25lLsKgIEkKPj4gdGhpbmsg
d2UgY2FuIHB1dCB0aGUgZmFzdCBtdWx0aXBsaWVyIG9uIHJ2MzIgYW5kIHJ2NjQsIHRoZXJlIHNo
b3VsZG4ndCBiZSBhbnkKPj4gZGlmZmVyZW5jZSB0aGVyZS7CoCBJIGd1ZXNzIGluIHRoZW9yeSB3
ZSBzaG91bGQgYmUgc3RpY2tpbmcgdGhpcyBhbGwgaW4gc29tZQo+PiBzb3J0IG9mICJwbGF0Zm9y
bSB0eXBlIiBvcHRpbWl6YXRpb24gZmxhZ3MsIGJ1dCB0aGF0J3MgcHJvYmFibHkgYml0IG11Y2gg
Zm9yCj4+IG5vdy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
