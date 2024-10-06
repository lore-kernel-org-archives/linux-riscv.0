Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E47BCFB424
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Oct 2024 06:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:Cc:
	To:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p/CaSATLS4SbFvrvAezh0X1XTdHvywWaKSaYoTfDyN8=; b=40Hn3guWM5OFyw
	S8YgrV8+SiRKJuB+Id4Pq2ZEuET/6p6B9fh7GNSXKpNq33k5/DcLw9ozxw8A+880sfpflJaYvPz2b
	BAJAiUofjeL3+n5eG4m27nRg8r1c04CZFHqkUm+y2Qsecix1xE4vAe1j47gCDjUlJ9O1p6AQTqzj6
	gnmqUr4EsA1m4KxloqN2wjpDK590QLYyaD4pYz+X7w63UN2hPcgWPOgu5zTeK4YEi1rNxxAA7fMTD
	eOChQvKnyZtCA+Ob7F8gDEPguXkemuwcO+sCqj53WNOo7p0Ck28EerJksBGpplkuPhhsKCg0X/WKj
	jRPfSKSO9qA9V1fEK42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxKSy-0000000HCvK-2JAC;
	Sun, 06 Oct 2024 06:10:04 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxKSv-0000000HCud-2lFU
	for linux-riscv@lists.infradead.org;
	Sun, 06 Oct 2024 06:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1728194993; x=1728799793; i=markus.elfring@web.de;
	bh=nfHT270wEl9AxgDA67VCKhwp85VuN4fZDK+Q6206vzk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pDXP1gStZ9wjaIg8ZRDtUv9ESbxYdagMR89X+XbGTvUQso/xiWwhN3xtP/bMvyEv
	 b8mv3fX1HFeCqd2rxTDuqCWXzHgP0hrb8VVVd7t01QI7w1WBlCOvAsGePGUtFWswt
	 5xis7C3/F7pYyGCm5PCuEGWCyApywr5vFqkAtjwIrLYqlcivKy8viAwO4wUu3baG4
	 wbGMLyU4ffB/UvpGd8I3OYg5VcndSQX4J2HIaPJvcUwTAFara2jImgoqmagGZu66V
	 +lle6biJ7zEGve76JeiQFL/+piskEHj28DYoUNQI1Ye4CZxM2WtjiAY0ACaA7RAzF
	 V+cD+tZRNZpI6s29aw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.87.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M2Phc-1t04p51ZR0-001VdC; Sun, 06
 Oct 2024 08:09:53 +0200
Message-ID: <2be4c920-b4c7-4b7a-ae63-258f2d86df92@web.de>
Date: Sun, 6 Oct 2024 08:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Drew Fustini <dfustini@tenstorrent.com>, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, Fu Wei <wefu@redhat.com>,
 Guo Ren <guoren@kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: Drew Fustini <drew@pdp7.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20241005-th1520-pinctrl-fixes-v1-2-5c65dffa0d00@tenstorrent.com>
Subject: Re: [PATCH 2/2] pinctrl: th1520: Fix return value for unknown pin
 error
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241005-th1520-pinctrl-fixes-v1-2-5c65dffa0d00@tenstorrent.com>
X-Provags-ID: V03:K1:80QukG/njMlE+c8X6vqS9JBjUh36l0QZ3c40I4xW7dixPPcFjlC
 N7FvOqkAIh3Jd0tAJPY5bAhed2vBDi9PpRPY97kqh7k3vkMhO0us//5xhCBu8tv+06ytJWo
 172EnNSA12qrnpSTNILKGTSTnx2XDGIqTxP2WAbcF1pAjLi6qanbUu70qrl0svCS3mA+XPB
 ZX7VkiiX6/4DOhuN9wHYA==
UI-OutboundReport: notjunk:1;M01:P0:xTZ+ktdvsFE=;sJd8/aZu3cz3tBsX6sTGATwInWu
 8sf4wiClEXP9QVmAL33Q85yUMmRulYEzs2gZTXtFHNxCbUTfzz4ew9bG2K+x5+Uz/7kUnXDDw
 pTsUgYJuHrP4SVjB97nlOxaunlRistTgGIExhoKXkCZDJg1hTRGVkjOVL+MGBv9l5orXOfj+J
 oHsP+xEoVLgeXeU/L3DMB7aV033+1bVRsKtuKCj8Lwrd3LUzZIB4z18Ciz3CHMdbPjbM1F9r0
 uCydirtGaHw5cTEgadHY2aSaBAfFd3+cvcKLqbBXASo4O7wxT7y/XeRJBwqYdmMGCIwtPmPR5
 KKZxGZvidyllF22NGivnVCOtIBWgLivdR6PD4hKPKNuP8bJvuYVLctP8h4tEGF+aWUUx5T5S5
 IbPib6HZFbOkJufmoTUEML66VCd5zNO1HmIMJ96rnC8uoo8bVZ5kgU5t8FkFFhNjnQvvjlXgH
 slcEuAOQ1cChwvx6B6zsgqv0eWzwgVSU+9llHJkxtglIQgLnuWh/SC0GK1IyF4tPTFqRt8H64
 N5riqPE2+WOoC+B6KMtYZv9n6gJT++gHe3YUkXwnGHpV8a+8EWTv/OdDpQvO2cgEbDqzqvWH4
 yi7pkmPa0aHHVvY6pUxXTYGOjJw8kIcVrbx+OOcb/W3e+tfq4HiKxlcZ1wcvuITSaUjuAhM1H
 8Ti4k3wL5ZfJx5/lni1SEu07veJGXT+qOk/au4Jk+7eF5ROWMH/IwiNXBU7N28R5I/VZ8tTlk
 wmVlU467PSLbCSUxetb/GgPvwaROf13UulYHE+s6TbZOZgyJu+FtPq1cnJEt8U464DzOVKApl
 veuW1YmaqxkvUdxBf7Zqa7xg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_231002_498459_16F95FFE 
X-CRM114-Status: UNSURE (   4.79  )
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

PiBGaXggdGgxNTIwX3BpbmN0cmxfZHRfbm9kZV90b19tYXAoKSB0byBhIHJldHVybiB2YWx1ZSB1
cG9uIGFuIHVua25vd24KCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdG8g
cmV0dXJuIGFuIGVycm9yIGNvZGU/CgoKPiBwaW4gZXJyb3IgYmVmb3JlIGp1bXBpbmcgdG8gZnJl
ZV9jb25maWdzLgoK4oCmCj4gKysrIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtdGgxNTIwLmMK
PiBAQCAtNDk5LDYgKzQ5OSw3IEBAIHN0YXRpYyBpbnQgdGgxNTIwX3BpbmN0cmxfZHRfbm9kZV90
b19tYXAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAo+ICAJCQkJbm1hcHMgPSByb2xsYmFj
azsKPiAgCQkJCWRldl9lcnIodGhwLT5wY3RsLT5kZXYsICIlcE9Gbi4lcE9GbjogdW5rbm93biBw
aW4gJyVzJ1xuIiwKPiAgCQkJCQlucCwgY2hpbGQsIHBpbm5hbWUpOwo+ICsJCQkJcmV0ID0gLUVJ
TlZBTDsKPiAgCQkJCWdvdG8gZnJlZV9jb25maWdzOwo+ICAJCQl9CuKApgoKV291bGQgeW91IGRh
cmUgdG8gc3VwcG9ydCBhbm90aGVyIGp1bXAgdGFyZ2V0IGZvciB0aGlzIGFzc2lnbm1lbnQgc3Rh
dGVtZW50PwoKUmVnYXJkcywKTWFya3VzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
