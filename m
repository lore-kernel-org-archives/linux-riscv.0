Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2194FC3DA60
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 01:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rdd6mQKnmRqOPbt6pJD0jxiTYZ0boSleqbvHjcPwz4I=; b=JI+fDer2vUOyNR
	6qOZmgFUw2VA8rqvdIkb/PU7KtwPlcrfbx901follK7MUNFAHiqziuAEZTLowhnH09sNHhPk17bsm
	NqrabpSvLK/6ncAzZGpMiqlcDSNxQ0KSF9aFxVqrFjHVJ6RAiS6pk8o7MKj3rL+E+Z5P81Ky7FgOP
	FDljC5A+zTAgdBOr50oJDwOHee9R3htIq3lVFcGn9JEe2TE9D9WetX5HpSaLiYi+zjXdjT93gcpmY
	o8McH6I2kTJrqRfUuAoze0gQS2KMSo0QpaFx4ibdehVsFjk6vPzTsc2mMn7txdqJOjFze49olPNUS
	6RHBwOEKegMM1S+/cvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFyC-0000000FQVS-47GH;
	Thu, 18 Jul 2024 01:30:08 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFy8-0000000FQUR-1lMN
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 01:30:07 +0000
Received: from [198.18.0.1] (unknown [180.110.112.93])
	by APP-05 (Coremail) with SMTP id zQCowAAnUiIMcJhmy2fnAw--.10199S2;
	Thu, 18 Jul 2024 09:29:50 +0800 (CST)
Message-ID: <ae740896-ca8c-482f-8b80-acc3fa60d0c3@iscas.ac.cn>
Date: Thu, 18 Jul 2024 09:29:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: add tracepoints for page fault
To: Matthew Wilcox <willy@infradead.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Alexandre Ghiti <alexghiti@rivosinc.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240715101400.39103-1-zhuhengbo@iscas.ac.cn>
 <20240717082728.84401-1-zhuhengbo@iscas.ac.cn>
 <ZpfbVzwT5flLqatZ@casper.infradead.org>
From: Zhu Hengbo <zhuhengbo@iscas.ac.cn>
In-Reply-To: <ZpfbVzwT5flLqatZ@casper.infradead.org>
X-CM-TRANSID: zQCowAAnUiIMcJhmy2fnAw--.10199S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKFWkAF47Zw13XF48JrW3GFg_yoWkCrb_AF
	1Iyryxu3W7Xr47Kr45Kw1Y9r9rJrW2gw1fJ3WkZr9rCFZxJr9xWrs5Kwn3A3WxWwsrGFn3
	uF9Fqw1Iyrya9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbc8YjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
	8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
	cI8IcVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU2rcTDUUUU
X-Originating-IP: [180.110.112.93]
X-CM-SenderInfo: x2kxxvpqje0q5lvft2wodfhubq/1tbiBgoCDGaYTG1jIwAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_183004_859661_4FF85F53 
X-CRM114-Status: UNSURE (   8.84  )
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

Ck9uIDIwMjQvNy8xNyAyMjo1NSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4gT24gV2VkLCBKdWwg
MTcsIDIwMjQgYXQgMDg6Mjc6MTlBTSArMDAwMCwgWmh1IEhlbmdibyB3cm90ZToKPj4gKwlUUF9T
VFJVQ1RfX2VudHJ5KAo+PiArCQlfX2ZpZWxkKHVuc2lnbmVkIGxvbmcsIGFkZHJlc3MpCj4+ICsJ
CV9fZmllbGQodW5zaWduZWQgbG9uZywgZXBjKQo+PiArCQlfX2ZpZWxkKHVuc2lnbmVkIGxvbmcs
IGNhdXNlKQo+PiArCSksCj4+ICsKPj4gKwlUUF9mYXN0X2Fzc2lnbigKPj4gKwkJX19lbnRyeS0+
YWRkcmVzcwk9IHJlZ3MtPmJhZGFkZHI7Cj4+ICsJCV9fZW50cnktPmVwYwkJPSByZWdzLT5lcGM7
Cj4+ICsJCV9fZW50cnktPmNhdXNlCQk9IHJlZ3MtPmNhdXNlOwo+PiArCSksCj4+ICsKPj4gKwlU
UF9wcmludGsoInVzZXIgcGFnZSBmYXVsdCwgYWRkcmVzcz0lcHMgZXBjPSVwcyBjYXVzZT0weCVs
eCIsCj4+ICsJCQkodm9pZCAqKV9fZW50cnktPmFkZHJlc3MsICh2b2lkICopX19lbnRyeS0+ZXBj
LAo+PiArCQkJX19lbnRyeS0+Y2F1c2UpCj4gV2hhdCBpcyAiZXBjIj8gIFlvdSd2ZSBtYWRlIHRo
aXMgZ3JhdHVpdG91c2x5IGRpZmZlcmVudCBmcm9tIHg4Ni4KPiBOZXZlciBkbyB0aGF0LiAgQWx3
YXlzIGNvcHkgd2hhdCBzb21lYm9keSBlbHNlIGhhcyBkb25lIHVubGVzcyB5b3UgaGF2ZQo+IGEg
Z29vZCByZWFzb24gdG8gYmUgZGlmZmVyZW50LgoK4oCcZXBj4oCdIHN0YW5kcyBmb3IgRXhjZXB0
aW9uIFByb2dyYW0gQ291bnRlciwgd2hpY2gga2VlcHMgdHJhY2sgb2Ygd2hlcmUgdGhlIENQVSBp
cyB3aXRoaW4gdGhlIGNvZGUuIEl0IGlzIHRoZSBzYW1lIGFzIHRoZSBJbnN0cnVjdGlvbiBQb2lu
dGVyIGluIHg4Ni4KCkZvciBleGFtcGxlLCBoZXJlIGlzIHRoZSBlbmNhcHN1bGF0aW9uIG9mIGFj
Y2Vzc2luZyB0aGUgaW5zdHJ1Y3Rpb24gcG9pbnRlciBpbiByaXNjLXY6CgrCoMKgwqAgLyogSGVs
cGVycyBmb3Igd29ya2luZyB3aXRoIHRoZSBpbnN0cnVjdGlvbiBwb2ludGVyICovCsKgwqDCoCBz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgaW5zdHJ1Y3Rpb25fcG9pbnRlcihzdHJ1Y3QgcHRf
cmVncyAqcmVncykKwqDCoMKgIHsKwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHJlZ3MtPmVwYzsKwqDC
oMKgIH0KCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
