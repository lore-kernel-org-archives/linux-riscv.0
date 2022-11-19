Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84EF0C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Nov 2022 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=002jqYq33hP8MSMQQqzAjmiDLJ1R8h94wszOzoU+4Bc=; b=X6ZES7sKbYSNGM
	XgPf9FeLetsp/WtMCgq9fr/0iw5VxilbSs7Ns939/gPHtL3RLXeWp8R82EAwT4NBSL6CJTXuPMulO
	yU9cq2sgPhR03pn/1MJRRMZdU6gZ95cFqPsCj3kkn4+vg+auImAPX28iKTHwG17ehPG/0mtgRHBkw
	SQHOqUTke5eBwZPJqOLF5gPIsW3kec5w/v9N3K5WxzQLqF2u/k23LR4fKiUYy7P0Fkc/6U30HpLmV
	JEOtYW5HclFmDVsu/a+4tMpwtKb2I2/WVAYnwoiDmyMmSxK4GnIFC6DeAaHPz55ys1wPotPR6Ief8
	WQWvFX0P3XYwck35aU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMEu-00DG9q-Q2; Sat, 19 Nov 2022 11:42:28 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owMEs-00DG9F-6f
	for linux-riscv@lists.infradead.org; Sat, 19 Nov 2022 11:42:28 +0000
Received: from [198.18.0.1] (unknown [124.16.97.152])
	by APP-03 (Coremail) with SMTP id rQCowAD3_ZUawXhj8j4WAA--.19852S3;
	Sat, 19 Nov 2022 19:42:21 +0800 (CST)
Message-ID: <f03c4c80-b5e1-eeee-cb75-9f618f5e1708@iscas.ac.cn>
Date: Sat, 19 Nov 2022 19:42:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v1 1/1] riscv: mm: call best_map_size many times during
 linear-mapping
To: Alexandre Ghiti <alex@ghiti.fr>, palmer@dabbelt.com,
 linux-riscv@lists.infradead.org
Cc: jeff@riscv.org, xuyinan@ict.ac.cn, ajones@ventanamicro.com
References: <20221006021223.3091711-1-panqinglin2020@iscas.ac.cn>
 <dbf2c1f5-d435-4c16-dd16-697b0e7ce3d9@ghiti.fr>
From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
In-Reply-To: <dbf2c1f5-d435-4c16-dd16-697b0e7ce3d9@ghiti.fr>
X-CM-TRANSID: rQCowAD3_ZUawXhj8j4WAA--.19852S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4fAF4rCw1rtryDZw15XFb_yoW8tF1Upr
	n5AFWUCrW5Cr1kXF4UJw1UXFy5GFn3G3W7Gr1UCa4DAF47Jr1q9r4UXr9agr1UAr4kJr4r
	Ar1vyrZ5ua45J3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x2
	0xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18Mc
	Ij6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2
	V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07jeE_NUUUUU=
X-Originating-IP: [124.16.97.152]
X-CM-SenderInfo: 5sdq1xpqjox0asqsiq5lvft2wodfhubq/1tbiCgUPDGN4MK3y6gAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_034226_636286_91051C59 
X-CRM114-Status: GOOD (  15.72  )
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

SGkgQWxleCwKCk9uIDExLzE1LzIyIDExOjM4IFBNLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4g
SGkgUWluZ2xpbiwKPiAKPiBPbiAwNi8xMC8yMDIyIDA0OjEyLCBwYW5xaW5nbGluMjAyMEBpc2Nh
cy5hYy5jbiB3cm90ZToKPj4gRnJvbTogUWluZ2xpbiBQYW4gPHBhbnFpbmdsaW4yMDIwQGlzY2Fz
LmFjLmNuPgo+Pgo+PiBNb2RpZnkgdGhlIGJlc3RfbWFwX3NpemUgZnVuY3Rpb24gdG8gZ2l2ZSBt
YXBfc2l6ZSBtYW55IHRpbWVzIGluc3RlYWQKPj4gb2Ygb25seSBvbmNlLCBzbyBhIG1lbW9yeSBy
ZWdpb24gY2FuIGJlIG1hcHBlZCBieSBib3RoIFBNRF9TSVpFIGFuZAo+PiBQQUdFX1NJWkUuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFFpbmdsaW4gUGFuIDxwYW5xaW5nbGluMjAyMEBpc2Nhcy5hYy5j
bj4KPj4gLS0tCj4+IMKgIGFyY2gvcmlzY3YvbW0vaW5pdC5jIHwgOSArKysrKy0tLS0KPj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPj4g
aW5kZXggYjU2YTBhNzU1MzNmLi4xYjc2ZDNmZTRlMjYgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlz
Y3YvbW0vaW5pdC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4+IEBAIC02NzMsMTAg
KzY3MywxMSBAQCB2b2lkIF9faW5pdCBjcmVhdGVfcGdkX21hcHBpbmcocGdkX3QgKnBnZHAsCj4+
IMKgIHN0YXRpYyB1aW50cHRyX3QgX19pbml0IGJlc3RfbWFwX3NpemUocGh5c19hZGRyX3QgYmFz
ZSwgcGh5c19hZGRyX3QgCj4+IHNpemUpCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCAvKiBVcGdyYWRl
IHRvIFBNRF9TSVpFIG1hcHBpbmdzIHdoZW5ldmVyIHBvc3NpYmxlICovCj4+IC3CoMKgwqAgaWYg
KChiYXNlICYgKFBNRF9TSVpFIC0gMSkpIHx8IChzaXplICYgKFBNRF9TSVpFIC0gMSkpKQo+PiAt
wqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBBR0VfU0laRTsKPj4gK8KgwqDCoCBiYXNlICY9IFBNRF9T
SVpFIC0gMTsKPj4gK8KgwqDCoCBpZiAoIWJhc2UgJiYgc2l6ZSA+PSBQTURfU0laRSkKPj4gK8Kg
wqDCoMKgwqDCoMKgIHJldHVybiBQTURfU0laRTsKPj4gLcKgwqDCoCByZXR1cm4gUE1EX1NJWkU7
Cj4+ICvCoMKgwqAgcmV0dXJuIFBBR0VfU0laRTsKPj4gwqAgfQo+PiDCoCAjaWZkZWYgQ09ORklH
X1hJUF9LRVJORUwKPj4gQEAgLTExMTEsOSArMTExMiw5IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBz
ZXR1cF92bV9maW5hbCh2b2lkKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVuZCA+PSBfX3Bh
KFBBR0VfT0ZGU0VUKSArIG1lbW9yeV9saW1pdCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZW5kID0gX19wYShQQUdFX09GRlNFVCkgKyBtZW1vcnlfbGltaXQ7Cj4+IC3CoMKgwqDCoMKg
wqDCoCBtYXBfc2l6ZSA9IGJlc3RfbWFwX3NpemUoc3RhcnQsIGVuZCAtIHN0YXJ0KTsKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGZvciAocGEgPSBzdGFydDsgcGEgPCBlbmQ7IHBhICs9IG1hcF9zaXpl
KSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZhID0gKHVpbnRwdHJfdClfX3ZhKHBh
KTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwX3NpemUgPSBiZXN0X21hcF9zaXplKHBh
LCBlbmQgLSBwYSk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNyZWF0ZV9wZ2RfbWFw
cGluZyhzd2FwcGVyX3BnX2RpciwgdmEsIHBhLCBtYXBfc2l6ZSwKPj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBncHJvdF9mcm9tX3ZhKHZhKSk7Cj4g
Cj4gCj4gSXQgd29ya3MgZmluZSBmb3IgbWUsIHNvIHlvdSBjYW4gYWRkOgo+IAo+IFJldmlld2Vk
LWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gVGVzdGVkLWJ5
OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gCj4gRllJLCBJJ20g
d29ya2luZyByaWdodCBub3cgb24gdXNpbmcgaHVnZXBhZ2VzIG9mIDFHQiBmb3IgdGhlIGxpbmVh
ciAKPiBtYXBwaW5nLgo+IAo+IFRoYW5rcywKPiAKPiBBbGV4CgpHb3QgaXQuIFRoYW5rcyBhIGxv
dCBmb3IgeW91ciByZXZldyBhbmQgdGVzdC4KClRoYW5rcywKUWluZ2xpbgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
