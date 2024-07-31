Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5B4C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 07:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxgLr8IrJRmYKHrLSSTZWhpSgxk8eRdcqHP1BSumOF8=; b=ZoZnAlFi4cHc+9
	69di8HUX6HvcfhRrA1jiEN7IpLr05VSdrukcb4q8yaYouoeqJfv++kWmFQXW9YYniy80YD/uru7Q1
	Bn0bWVuqiKbSSey540qg/9oLsspvI6M2XKuLtJMH4tMQy0ueJ0ugFzQeKg31ycHa3Jjl6yy0PJDVo
	jj3KxMluNGR76veiOuIZItYWbwvjrWKVtzBnJopHLq0NL3EaTOk1JrO/589534LfwhP7JXs/CtZYx
	5dzfnA5N+vXhtegkWu9RORbPKR8cKy+qdMC86SA86D5toeb1VpC2hgJjrbD6XOOyvWTy19sQzGJo1
	SnfmAeGjYDOQ0h3Dnrcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3U1-000000004Ke-1ZWe;
	Wed, 31 Jul 2024 07:10:49 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ3Ty-000000004Ju-19zd
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 07:10:48 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-5af6a1afa7bso5603343a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 00:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1722409844; x=1723014644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM3knuOZHaqsTFzkDvpQFpGqEOzU5UQ/01PDBT9efdA=;
        b=A6UGDVio1Nf6/6REX6Rrc5hFjjT8OazZMe8zNH5AW045cAAI3+dvVC/ZonS1tnRcXw
         fFvpMtyPAkBvGNLNWZKD6folVto1C0tDup2+Sl+zc+3VLgPjFBLKJcP3gIo/9lOm147H
         Mc8WxscKJLIqxEnk52shPi1aNOTv23b5uaQKOuckUTF32DD5Dfps4UsFPSQnxmrlBqi9
         pKg2Q6Ej3QXeEAqLiqPdowSNj7hlr72wjcG83+ErLrEOjIENw7PecM2P1OyJ+3UPbo/K
         r5Rl7U0hs4if1dWQFHBMG3lqg72ckXlFsNtnFzehQ4B9itBTnm6t/46OMC1zB8d3FFfF
         uYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722409844; x=1723014644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rM3knuOZHaqsTFzkDvpQFpGqEOzU5UQ/01PDBT9efdA=;
        b=HaKJOE9xYXLHMUI4d60myPWGaAvsvhIzC7ynePYWVUsG+kDcFA5/nKpOCYnaPEnJs1
         wdTNCy3MFsqODz7Qopdsnis6g5U6M7vcyowwHghSngIr0RBPZjDuP/5f4EZTuo1rkwlC
         1MpsSJ31yF4yFWlKz1TivkiW0lLxJCnOJrNrfGBLmObgmqiDWc6fzzg7JP0+owDsWWhy
         YrEm+r+tV3mGRmnZjURfkDGjb5m21PH9TRvMrAdFmiRv7ypvIksvYtIEAMxnQA3jR3bE
         NZFgTw5uWJba8jirlKSymcCmT9r6HFW+CU8bdBcs1eTJMzfb8gOV1m5vZy7OghjhPanf
         u7QA==
X-Forwarded-Encrypted: i=1; AJvYcCWDIcGYABBbflsLCOAt3cerMJs/IwmSTED8o+o5T+pEvQ6qeA1/oMY+w3t8hh//jj8gjJlCuEnPM4Uq2AfqaV5DjbLt2rCuk2E6qbDONw+B
X-Gm-Message-State: AOJu0Yy1M62nrhPIxuqcVADxYVIeFyFXQAJ28ee2tiSiN1yh3rvUmDfB
	ajGxCnOOygbLz5a20L4ZB6ljWYLOwE1lk7EEKVdZcXI6Yp60NZFaEPmJHndq2cIa/GhpWQaM2/I
	3mqsFeajXaDtYEBFDQNtL27nUFcNkBDtDZs/9wg==
X-Google-Smtp-Source: AGHT+IGUys3WnYAg9sQ+TuEMKkqzevv5FUJda7lT6udM7lAkPAKhnz7RRtQdNEaRKDEN5SpkAfN9qgIvkzT1vcXEvPo=
X-Received: by 2002:a50:d6d4:0:b0:58b:9561:650b with SMTP id
 4fb4d7f45d1cf-5b021d21cd1mr8461697a12.25.1722409844400; Wed, 31 Jul 2024
 00:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240731032627.59696-1-qiaozhe@iscas.ac.cn>
In-Reply-To: <20240731032627.59696-1-qiaozhe@iscas.ac.cn>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 31 Jul 2024 09:10:33 +0200
Message-ID: <CAHVXubh2MawWGzcL38DPnj2Xa=ZGNr6JK3of3v=eSEOkMeu8Bw@mail.gmail.com>
Subject: Re: [PATCH] riscv/mm: Add handling for VM_FAULT_SIGSEGV in mm_fault_error()
To: Zhe Qiao <qiaozhe@iscas.ac.cn>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	surenb@google.com, akpm@linux-foundation.org, wangkefeng.wang@huawei.com, 
	willy@infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_001046_484855_5BDC5FD3 
X-CRM114-Status: GOOD (  18.70  )
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

SGkgWmhlLAoKT24gV2VkLCBKdWwgMzEsIDIwMjQgYXQgNToyNuKAr0FNIFpoZSBRaWFvIDxxaWFv
emhlQGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEFkZCBwcm9jZXNzaW5nIGZvciBWTV9DQVVMVF9T
SUdTRUdWIHRvIG1tX2ZhdWx0X2Vycm9yICgpIHRvIGF2b2lkCj4gZGlyZWN0IGV4ZWN1dGlvbiBv
ZiBCVUcoKS4KClNvcnJ5IHRvIGJvdGhlciB5b3UgYWdhaW4sIGJ1dCBzaW5jZSB0aGVyZSBpcyBh
IHR5cG8KKHMvVk1fQ0FVTFRfU0lHU0VHVi9WTV9GQVVMVF9TSUdTRUdWKSwgZG8geW91IG1pbmQg
cmVwaHJhc2luZyB0aGUKY29tbWl0IGxvZyBsaWtlIHRoaXMgKG9yIHNpbWlsYXIpPwoKIkhhbmRs
ZSBWTV9GQVVMVF9TSUdTRUdWIGluIHRoZSBwYWdlIGZhdWx0IHBhdGggc28gdGhhdCB3ZSBjb3Jy
ZWN0bHkKa2lsbCB0aGUgcHJvY2VzcyBhbmQgd2UgZG9uJ3QgQlVHKCkgdGhlIGtlcm5lbC4iCgo+
Cj4gRml4ZXM6IDA3MDM3ZGI1ZDQ3OSAoIlJJU0MtVjogUGFnaW5nIGFuZCBNTVUiKQo+IFNpZ25l
ZC1vZmYtYnk6IFpoZSBRaWFvIDxxaWFvemhlQGlzY2FzLmFjLmNuPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L21tL2ZhdWx0LmMgfCAxNyArKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
OSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvbW0vZmF1bHQuYyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+IGluZGV4IDUyMjRmMzczMzgw
Mi4uYTlmMmI0YWY4ZjNmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+ICsr
KyBiL2FyY2gvcmlzY3YvbW0vZmF1bHQuYwo+IEBAIC02MSwyNiArNjEsMjcgQEAgc3RhdGljIGlu
bGluZSB2b2lkIG5vX2NvbnRleHQoc3RydWN0IHB0X3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcg
YWRkcikKPgo+ICBzdGF0aWMgaW5saW5lIHZvaWQgbW1fZmF1bHRfZXJyb3Ioc3RydWN0IHB0X3Jl
Z3MgKnJlZ3MsIHVuc2lnbmVkIGxvbmcgYWRkciwgdm1fZmF1bHRfdCBmYXVsdCkKPiAgewo+ICsg
ICAgICAgaWYgKCF1c2VyX21vZGUocmVncykpIHsKPiArICAgICAgICAgICAgICAgbm9fY29udGV4
dChyZWdzLCBhZGRyKTsKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsgICAgICAgfQo+ICsK
PiAgICAgICAgIGlmIChmYXVsdCAmIFZNX0ZBVUxUX09PTSkgewo+ICAgICAgICAgICAgICAgICAv
Kgo+ICAgICAgICAgICAgICAgICAgKiBXZSByYW4gb3V0IG9mIG1lbW9yeSwgY2FsbCB0aGUgT09N
IGtpbGxlciwgYW5kIHJldHVybiB0aGUgdXNlcnNwYWNlCj4gICAgICAgICAgICAgICAgICAqICh3
aGljaCB3aWxsIHJldHJ5IHRoZSBmYXVsdCwgb3Iga2lsbCB1cyBpZiB3ZSBnb3Qgb29tLWtpbGxl
ZCkuCj4gICAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAgICBpZiAoIXVzZXJfbW9k
ZShyZWdzKSkgewo+IC0gICAgICAgICAgICAgICAgICAgICAgIG5vX2NvbnRleHQocmVncywgYWRk
cik7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IC0gICAgICAgICAgICAgICB9
Cj4gICAgICAgICAgICAgICAgIHBhZ2VmYXVsdF9vdXRfb2ZfbWVtb3J5KCk7Cj4gICAgICAgICAg
ICAgICAgIHJldHVybjsKPiAgICAgICAgIH0gZWxzZSBpZiAoZmF1bHQgJiAoVk1fRkFVTFRfU0lH
QlVTIHwgVk1fRkFVTFRfSFdQT0lTT04gfCBWTV9GQVVMVF9IV1BPSVNPTl9MQVJHRSkpIHsKPiAg
ICAgICAgICAgICAgICAgLyogS2VybmVsIG1vZGU/IEhhbmRsZSBleGNlcHRpb25zIG9yIGRpZSAq
Lwo+IC0gICAgICAgICAgICAgICBpZiAoIXVzZXJfbW9kZShyZWdzKSkgewo+IC0gICAgICAgICAg
ICAgICAgICAgICAgIG5vX2NvbnRleHQocmVncywgYWRkcik7Cj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuOwo+IC0gICAgICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGRvX3Ry
YXAocmVncywgU0lHQlVTLCBCVVNfQURSRVJSLCBhZGRyKTsKPiAgICAgICAgICAgICAgICAgcmV0
dXJuOwo+ICsgICAgICAgfSBlbHNlIGlmIChmYXVsdCAmIFZNX0ZBVUxUX1NJR1NFR1YpIHsKPiAr
ICAgICAgICAgICAgICAgZG9fdHJhcChyZWdzLCBTSUdTRUdWLCBTRUdWX01BUEVSUiwgYWRkcik7
Cj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAgIH0KPiArCj4gICAgICAgICBCVUco
KTsKPiAgfQo+Cj4gLS0KPiAyLjQzLjAKPgoKVGhhdCdzIGEgdmVyeSBnb29kIGNhdGNoLCBnb29k
IGpvYiEgWW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hp
dGlAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQWxleAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
