Return-Path: <SRS0=5ZKR=FJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A89C1C433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 20:15:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E2523110
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Dec 2020 20:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E2523110
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=metux.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XBDTEPPvdexQ5XiXdez3w4g9hLC4pU5sW4rxvgVRQmY=; b=mGRwWNij+OEmsMQNjg4EyK6TX
	+TZKCKo1A3Ix9pzYKunHL3U6wGhH+N9m5/R6FWWzWruF2zy/VnpVfIR1IUb50Hd3yzuJdgCoxfItp
	H8ZB3mPcnQGa8CXyZ3UZkJSyzoH72ovK7+xqyQQSAIA2SyMtULnijw3TGEbZ7Szs25YlORsnBrtGI
	WgcJr5bziDiMtb7ALS80xuzQbG316mX2Im2sRo8qXUjODGW3npdtv19nJurNwTmraeeyXgwKW93c9
	j1cEyyfCwREj0efSWPTuKLPRpE6APvN60Pryo56Gvw4shO8CU9G8RmG1RZ5fBWlO/yiJjH8W/MFKM
	ih+nvQoZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kldy5-0000hX-KX; Sat, 05 Dec 2020 20:15:45 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kldy3-0000h7-R3
 for linux-riscv@lists.infradead.org; Sat, 05 Dec 2020 20:15:44 +0000
Received: from [192.168.1.155] ([95.117.6.188]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MbRwP-1k9pJD3wRl-00bwGo; Sat, 05 Dec 2020 21:15:31 +0100
Subject: Howto listen to/handle gpio state changes ? Re: [PATCH v2 2/2]
 drivers: gpio: add virtio-gpio guest driver
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
 linux-kernel@vger.kernel.org
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <0080d492-2f07-d1c6-d18c-73d4204a5d40@metux.net>
Date: Sat, 5 Dec 2020 21:15:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201203191135.21576-2-info@metux.net>
Content-Language: tl
X-Provags-ID: V03:K1:6Us/Eccm2b+8uFxw1F3t+QrfFkxImB2I2ty+Sf0QMFWg/I08C+0
 l/putPEzoIZdUH7OratR6bhG5Wy5rbrzir2gcr2T83PhcZL3s+tN+LfQ0QpaonL4C2Nu5/I
 baDn5qVWWroBU8pOeaRhpPy9tmeBMVkzlfmhLKOxlsZCYIiEIxKjJMl57Kc88zmH7OFxMy5
 x+dpS83a3PhirR79mANbQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:TmIGK7FxUCU=:yAJyBYcomdQV3KBUpDYeoh
 7Ge9qY1V8TDxnX8V6yve7wUof8n/FkUM9wClbl4yh6qUcL5r3mNwZRDoNPECQQjpoDTUHMytG
 rYjGRCAbBatBR7IYgg9wiBYMHqUMHlbwByVqAdq0Wwn7PxImKXp+bSiXl69HnKUwFkeZ/ZXqk
 h7QYanonsFRUq1z+CNJS2v0F5n2uJAOZL+4iqVYbpHSrq2O/IZHcrZ2uNiwnzBJ/1mQecCdlW
 +3AIO9ESFYwOJe+Z6nzDzhW1+/cKJsiNBhb9EaNDCxmetXm5oNpXhXtkKr0UsoGSrYe7hxNzM
 3PmuVvz/ILrxFzD4ElD91NMu4TjHDRZjD/L29ni5LEktB3rSDvAHDnxTveECZjzMYejJ7H9/I
 miRi2KQ5May5m3yoPoMC9K+c0UhmWEUFlPN95YJidQg0YPEgQQTmIRibVZDLs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_151544_102408_CAC60ECE 
X-CRM114-Status: UNSURE (   7.73  )
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
Cc: corbet@lwn.net, mst@redhat.com, linus.walleij@linaro.org,
 linux-doc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
 linux-riscv@lists.infradead.org, jasowang@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMuMTIuMjAgMjA6MTEsIEVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0IHdyb3Rl
OgoKRnJpZW5kcywKCkkndmUgc3RpbGwgZ290IGEgcHJvYmxlbSB3LyBzaWduYWwvaXJxIGhhbmRs
aW5nOgoKVGhlIHZpcnRpby1ncGlvIGRldmljZS9ob3N0IGNhbiByYWlzZSBhIHNpZ25hbCBvbiBs
aW5lIHN0YXRlIGNoYW5nZS4KS2luZGEgSVJRLCBidXQgbm90IGFjdHVhbGx5IHJ1bm5pbmcgdGhy
b3VnaCByZWFsIElSUXMsIGluc3RlYWQgYnkgYQptZXNzYWdlIHJ1bm5pbmcgdGhvdWdoIHF1ZXVl
LiAoaG1tLCBraWRhIE1TSSA/IDpvKS4KCkkndmUgdHJpZWQgYWxsb2NhdGluZyBhbiBJUlEgcmFu
Z2UgYW5kIGNhbGxpbmcgZ2VuZXJpY19oYW5kbGVfaXJxKCksCmJ1dCB0aGVuIEknbSBnZXR0aW5n
IHVuaGFubGVkIElSUSB0cmFwLgoKTXkgaG9wZSB3YXMgc29tZSBncGlvIGxpYiBmdW5jdGlvbiBm
b3IgY2FsbGluZyBpbiB3aGVuIGFuIGxpbmUgc3RhdGUKY2hhbmdlcywgdGhhdCBkb2VzIGFsbCB0
aGUgbWFnaWMgKHNvbWVib2R5IGxpc3RlbmluZyBvbiBzb21lIGdwaW8sCm9yIGdwaW8gdXNlZCBh
cyBpbnRlcnJ1cHQgc291cmNlKSwgYnV0IHRoZSBvbmx5IHRoaW5nIEkgY291bGQgZmluZAp3YXMg
c29tZSBoZWxwZXJzIGZvciBncGlvIGNoaXBzIHRoYXQgaGF2ZSB0aGVpciBvd24gYnVpbHRpbgpp
bnRlcnJ1cHQgY29udHJvbGxlciAoVklSVElPX0dQSU9fRVZfSE9TVF9MRVZFTCkuCgpTb21laG93
IGZlZWxzIHRoYXQncyBub3QgcXVpdGUgd2hhdCBJJ20gbG9va2luZyBmb3IuCgpDb3VsZCBhbnli
b2R5IHBsZWFzZSBnaXZlIG1lIG1vcmUgaW5zaWdodHMgPwoKCi0tbXR4CgotLSAKLS0tCkhpbndl
aXM6IHVudmVyc2NobMO8c3NlbHRlIEUtTWFpbHMga8O2bm5lbiBsZWljaHQgYWJnZWjDtnJ0IHVu
ZCBtYW5pcHVsaWVydAp3ZXJkZW4gISBGw7xyIGVpbmUgdmVydHJhdWxpY2hlIEtvbW11bmlrYXRp
b24gc2VuZGVuIFNpZSBiaXR0ZSBpaHJlbgpHUEcvUEdQLVNjaGzDvHNzZWwgenUuCi0tLQpFbnJp
Y28gV2VpZ2VsdCwgbWV0dXggSVQgY29uc3VsdApGcmVlIHNvZnR3YXJlIGFuZCBMaW51eCBlbWJl
ZGRlZCBlbmdpbmVlcmluZwppbmZvQG1ldHV4Lm5ldCAtLSArNDktMTUxLTI3NTY1Mjg3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
