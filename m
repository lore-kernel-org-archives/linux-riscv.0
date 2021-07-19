Return-Path: <SRS0=/Tun=ML=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8219AC07E95
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 15:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420F76124C
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jul 2021 15:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420F76124C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSGMw5OUezGjhwTKVwv0rPmtbzZ5lBoe8Seq3ozpx5c=; b=RZ4vY+9qG1I6hoLmJrEwnPJ/l2
	ddqULN1IfUvxsTfw4jSCn6jEnIGX2yswF5+XqgegIpnBhEiSORr8yAquK+iDdz+xuA6Rgm2PjTpzY
	V0awEYg+Zxn1TC4It5JvtgKPt8LMs1EK2WPpdmAsWmJZuJ6CcYkQcu7QR7D2tqJRA+zNA1uCIFsBM
	7AT0xzpE2XM6mt0KrdwTcM6sMGDfQAHbvS3eeSf8eHoqAb/8ksznUEuWOHDoOvuhzwSsbsc+RKwaL
	nZsmnymZFtBisKoW2t+5uSvjEZb1aTqMwMwb/EAExJC+ShreV7TJRDGePU4d9KQ9nYrkyl24YhtKq
	jG2dSdLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5V0t-00A2x1-D9; Mon, 19 Jul 2021 15:16:59 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5V0q-00A2wC-Fz
 for linux-riscv@lists.infradead.org; Mon, 19 Jul 2021 15:16:58 +0000
Received: by mail-oo1-xc35.google.com with SMTP id
 a17-20020a4ad5d10000b0290263c143bcb2so3108535oot.7
 for <linux-riscv@lists.infradead.org>; Mon, 19 Jul 2021 08:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=asQrWP/KNFhAup0eq5AJmEotdNpzwTXJeOEaFS3um+E=;
 b=GjUpvRa856+70k+PCoIP+G1edhPmUfXWAXbNAw4Le//f3H8Sg8ZVD6Vk/1oh34B5Ip
 ntJfMKpU0Jwt50Ipt9ua/4AwzNu07xcbwWD+pW1r48RXXd+Krl6SjQ82yzuYLb6rkOMp
 mWu5Y4x1e4qJdCFeB9Y11QsJlc6rNM/4dCw1lrSLTZF+U8rmSE2wVbkmVkShBjEgbQ7Q
 F71Ir7+CvFUvhLV5aFZt130p76gywCod7Jmpjx4sIESxmRlbF4FHU4vbE6Y7ziKi1nb7
 59VLM7nBBJvsnfT188Rrl5WHVnzQyPk+VMLFrowPhPOfBi9fR+MdcWW4nZwexT5MvYkl
 qz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=asQrWP/KNFhAup0eq5AJmEotdNpzwTXJeOEaFS3um+E=;
 b=GJAc1ELdRltd6Yg8clBNDipfP9oFfPiL2MyzkJ29A3dq5db19SBzqtEvnN0oFYOh8E
 ZIdk8KtZa+0wcRxoC+nFttr1BYPmDVQqcJJXW72zkA0aZz/abdO45CpT+8E4pSnMDIjP
 cn82lKJm+jptAgMrhaax/Lp4AgQtR0KUXrZNbULAEB41IVXf+QWtQQyWBwYSemps4CPq
 PgDXJw+Cn5MwSqnG7RajBZFHDZJdMIIr1qUpmsTJdLeb6I4shT7LhK0jWU/7PviVe+jI
 HZ6Lk/wg/9hWh5T0AwMXbJpUMRnzFgdPJZ2izF4D6ya/0O293yUW7IaZukQ0PvuXIkUt
 ti1w==
X-Gm-Message-State: AOAM533zZSRvvnZfi+BIgQo3Vax8i84qoILrMALapKnAX0APmJfWmJrk
 6uRhJziCGiWM3gjXB6TslOk=
X-Google-Smtp-Source: ABdhPJwM8tnUCPUm4QK+QMwwokqcmNwqIwJMF1deabKfedDEvAFtL3xiNUtjYbHjsvXY67zKj6ZA0g==
X-Received: by 2002:a4a:9406:: with SMTP id h6mr17804555ooi.36.1626707815145; 
 Mon, 19 Jul 2021 08:16:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 f2sm3776717oij.45.2021.07.19.08.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jul 2021 08:16:54 -0700 (PDT)
To: Akira Tsukamoto <akira.tsukamoto@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <a7a801d2-13d2-7b5b-66a5-98e7c95b00cc@gmail.com>
 <5e1b5d90-5a1e-5e9f-7b92-6c53b8589c2a@gmail.com>
 <cd14a8b0-0a27-77a8-6dc2-3268f9f09922@roeck-us.net>
 <e1bb4768-5517-8ef3-eaf3-bbfc103fa918@gmail.com>
 <9a2bf544-2aaa-d175-bc0a-c8bcefd8141a@roeck-us.net>
 <718c5a83-de9f-3b5a-ef36-e52ad5bb4d67@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 1/1] riscv: __asm_copy_to-from_user: Optimize unaligned
 memory access and pipeline stall
Message-ID: <c19f05f0-985e-ca6e-7cfc-af5c69e155fd@roeck-us.net>
Date: Mon, 19 Jul 2021 08:16:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <718c5a83-de9f-3b5a-ef36-e52ad5bb4d67@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_081656_581219_955D1A3C 
X-CRM114-Status: GOOD (  28.14  )
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

T24gNy8xOS8yMSA3OjQ5IEFNLCBBa2lyYSBUc3VrYW1vdG8gd3JvdGU6Cj4gCj4gT24gNy8xOS8y
MDIxIDExOjI0IFBNLCBHdWVudGVyIFJvZWNrIHdyb3RlOgo+PiBPbiA3LzE5LzIxIDc6MDAgQU0s
IEFraXJhIFRzdWthbW90byB3cm90ZToKPj4+Cj4+PiBPbiA3LzE5LzIwMjEgMTA6NTEgUE0sIEd1
ZW50ZXIgUm9lY2sgd3JvdGU6Cj4+Pj4gSGksCj4+Pj4KPj4+PiBPbiA3LzE5LzIxIDU6NTMgQU0s
IEFraXJhIFRzdWthbW90byB3cm90ZToKPj4+Pj4KPj4+Pj4gVGhpcyBwYXRjaCB3aWxsIHJlZHVj
ZSBjcHUgdXNhZ2UgZHJhbWF0aWNhbGx5IGluIGtlcm5lbCBzcGFjZSBlc3BlY2lhbGx5Cj4+Pj4+
IGZvciBhcHBsaWNhdGlvbiB3aGljaCB1c2Ugc3lzLWNhbGwgd2l0aCBsYXJnZSBidWZmZXIgc2l6
ZSwgc3VjaCBhcwo+Pj4+PiBuZXR3b3JrIGFwcGxpY2F0aW9ucy4gVGhlIG1haW4gcmVhc29uIGJl
aGluZCB0aGlzIGlzIHRoYXQgZXZlcnkKPj4+Pj4gdW5hbGlnbmVkIG1lbW9yeSBhY2Nlc3Mgd2ls
bCByYWlzZSBleGNlcHRpb25zIGFuZCBzd2l0Y2ggYmV0d2VlbiBzLW1vZGUKPj4+Pj4gYW5kIG0t
bW9kZSBjYXVzaW5nIGxhcmdlIG92ZXJoZWFkLgo+Pj4+Pgo+Pj4+Cj4+Pj4gSSBoYWQgdG8gcmV2
ZXJ0IHRoZSBvcmlnaW5hbCBwYXRjaCBmcm9tIHRoZSBtYWlubGluZSBrZXJuZWwgcHJpb3IgdG8g
YXBwbHlpbmcKPj4+PiB0aGlzIHBhdGNoLiBPYnZpb3VzbHkgdGhhdCBtZWFucyB0aGF0IHRoZXJl
IG1heSBiZSBvdGhlciBjaGFuZ2VzIGFmZmVjdGluZyB0aGUKPj4+PiBvdXRjb21lLgo+Pj4+Cj4+
Pj4gcmlzY3Y2NCBpbWFnZXMgd29yaywgYnV0IHJpc2N2MzIgaW1hZ2VzIHN0aWxsIGZhaWwgd2l0
aCB0aGlzIHBhdGNoIGFwcGxpZWQuCj4+Pj4gVGhlIGVycm9yIGlzIGEgYml0IGRpZmZlcmVudCB0
aGFuIGJlZm9yZSwgdGhvdWdoLgo+Pj4+Cj4+Pj4gLi4uCj4+Pj4gW8KgwqAgMTEuODk5OTc5XSBS
dW4gL3NiaW4vaW5pdCBhcyBpbml0IHByb2Nlc3MKPj4+PiBbwqDCoCAxMi4xNTI2NjZdIHJhbmRv
bTogZmFzdCBpbml0IGRvbmUKPj4+PiBtb3VuOiBhcHBsZXQgbm90IGZvdW5kCj4+Pj4gIu+/ve+/
ve+/ve+/ve+/vVbvv710OiBhcHBsZXQgbm90IGZvdW5kCj4+Pj4gL2Jp77+977+977+977+977+9
Vu+/vUYtOiBhcHBsZXQgbm90IGZvdW5kCj4+Pj4gbW91bjogYXBwbGV0IG5vdCBmb3VuZAo+Pj4+
IHN3YW9uOiBhcHBsZXQgbm90IGZvdW5kCj4+Pj4gaG9zdG5hbWUtRjogYXBwbGV0IG5vdCBmb3Vu
ZAo+Pj4+Cj4+Pj4gQWZ0ZXIgdGhpcywgdGhlIGltYWdlIGhhbmdzLgo+Pj4+Cj4+Pj4gRm9yIGNv
bXBhcmlzb24sIHRoZSBtYWlubGluZSBrZXJuZWwgKHY1LjE0LXJjMikgZmFpbHMgYXMgZm9sbG93
cy4KPj4+Pgo+Pj4+IFvCoMKgIDEwLjc4ODEwNV0gUnVuIC9zYmluL2luaXQgYXMgaW5pdCBwcm9j
ZXNzCj4+Pj4gU3RhcnRpbmcgc3lzbG9nZDogT0sKPj4+PiBTdGFydGluZyBrbG9nZDogT0sKPj4+
PiAvZXRjL2luaXQuZC9TMDJzeXNjdGw6IGxpbmUgNjg6IHN5bnRheCBlcnJvcjogRU9GIGluIGJh
Y2txdW90ZSBzdWJzdGl0dXRpb24KPj4+PiAvZXRjL2luaXQuZC9TMjB1cmFuZG9tOiBsaW5lIDE6
IHN5bnRheCBlcnJvcjogdW50ZXJtaW5hdGVkIHF1b3RlZCBzdHJpbmcKPj4+PiBTdGFydGluZyBu
ZXR3b3JrOiAvYmluL3NoOiBzeW50YXggZXJyb3I6IHVudGVybWluYXRlZCBxdW90ZWQgc3RyaW5n
Cj4+Pj4gc2VkOiB1bm1hdGNoZWQgJy8nCj4+Pj4gL2Jpbi9zaDogc3ludGF4IGVycm9yOiB1bnRl
cm1pbmF0ZWQgcXVvdGVkIHN0cmluZwo+Pj4+IEZBSUwKPj4+PiAvZXRjL2luaXQuZC9TNTVydW50
ZXN0OiBsaW5lIDQ4OiBzeW50YXggZXJyb3I6IEVPRiBpbiBiYWNrcXVvdGUgc3Vic3RpdHV0aW9u
Cj4+Pj4KPj4+PiBJJ2xsIGJlIGhhcHB5IHRvIHByb3ZpZGUgaW5mb3JtYXRpb24gb24gaG93IHRv
IHJlcHJvZHVjZSB0aGUgcHJvYmxlbQo+Pj4+IGlmIG5lZWRlZC4gUGxlYXNlIGxldCBtZSBrbm93
Lgo+Pj4KPj4+IFllcywgSSBkbyB3b3VsZCBsaWtlIHRvIGtub3cgdGhlIHByb2NlZHVyZSBvZiBi
dWlsZCBpbnN0cnVjdGlvbiBvZiB5b3VyIHJ2MzIgaW1hZ2UuCj4+PiBUaGVuIEkgd291bGQgcmVw
cm9kdWNlIHRoZSBlcnJvciBhbmQgbG9vayBpbnRvIGhvdyB0byBmaXggaXQuCj4+Pgo+PiBQbGVh
c2UgaGF2ZSBhIGxvb2sgYXQgaHR0cDovL3NlcnZlci5yb2Vjay11cy5uZXQvcWVtdS9yaXNjdjMy
Lwo+PiBhbmQgbGV0IG1lIGtub3cgaWYgeW91IG5lZWQgYW55dGhpbmcgZWxzZS4KPiAKPiBUaGFu
a3MgZm9yIHRoZSBsaW5rLiBJIHdpbGwgd29yayBvbiBpdCB0b21vcnJvdyBpbiBteSB0aW1lLgo+
IEJ1aWxkaW5nIHRoZSBrZXJuZWwgd2l0aCBkZWZjb25maWcgbG9va3MgbXVjaCBxdWlja2VyIHRo
YW4gdGhlIGNvbmZpZy4KPiBJIHdpbGwgdHJ5IGl0IGZyb20gZGVmY29uZmlnIGFuZCB0aGVuIGNv
bmZpZy4KPiAKPiBBbHNvIEkgd291bGQgbGlrZSB0byB1c2UgdGhlIHNhbWUgcnYzMiB0b29sY2hh
aW4uIEFyZSB5b3UgdXNpbmcgcHJlYnVpbHQKPiByaXNjdjMyLWxpbnV4LWdjYz8gU2hvdWxkIG5v
dCBtYWtlIGRpZmZlcmVuY2VzIGJ1dCBqdXN0IGluIGNhc2UuCj4gCgpJIHVzZSBhIHRvb2xjaGFp
biBidWlsdCB3aXRoIGVpdGhlciBidWlsZHJvb3QgKHdoZW4gYnVpbGRpbmcgdGhlIHJvb3QgZmls
ZSBzeXN0ZW0pCm9yIHdpdGggdGhlIGJ1aWxkYWxsIHNjcmlwdHMgZnJvbSBodHRwczovL2dpdGh1
Yi5jb20vam1lc21vbi9idWlsZGFsbC5naXQKKGZvciB0aGUga2VybmVsKS4gRWl0aGVyIGNhc2Us
IGl0IGlzIHRoZSBkZWZhdWx0IHJpc2N2MzIgdG9vbGNoYWluIGZyb20gYm90aC4KCj4gSXMgdGhl
cmUgYSBwdWJsaWMgcmVmZXJlbmNlIGZvciB0aGUgd2F5IG9mIGJ1aWxkaW5nIHlvdXIgcWVtdSBh
bmQgb3BlbnNiaT8KPiBOb3Qgc3VyZSB3aGljaCB2ZXJzaW9uIG9mIHFlbXUgd2l0aCB3aGljaCBy
djMyIHRvIGJ1aWxkIHRoZW0sIHJ2MzJpLCBydjMyaW1hZCBvciBlbHNlLgoKSSBkb24ndCBrbm93
IGFib3V0IHJ2MzJpIG9yIHJ2MzJpbWFkLCBzb3JyeS4gSSBidWlsZCBxZW11IGZyb20gc291cmNl
IHVzaW5nCgktLWRpc2FibGUtdXNlciAtLWRpc2FibGUtZ251dGxzIC0tZGlzYWJsZS1kb2NzIFwK
ICAgICAgICAgLS1kaXNhYmxlLW5ldHRsZSAtLWRpc2FibGUtZ2NyeXB0IC0tZGlzYWJsZS12bmMt
cG5nIFwKICAgICAgICAgLS1kaXNhYmxlLXhlbiAtLWRpc2FibGUteGVuLXBjaS1wYXNzdGhyb3Vn
aCBcCiAgICAgICAgIC0tZGlzYWJsZS1saWJzc2gKY29uZmlndXJhdGlvbiBvcHRpb25zLiBUaGUg
ZmlybXdhcmUgaW1hZ2UgKG9wZW5zYmkpIGlzIGJ1aWx0IGFzIHBhcnQgb2YgdGhhdC4KWW91IHNo
b3VsZCBiZSBhYmxlIHRvIHVzZSBhIHByZS1idWlsdCB2ZXJzaW9uIG9mIHFlbXUgdjYuMCBpZiB0
aGF0IGlzIGF2YWlsYWJsZQpzb21ld2hlcmUuCgpIb3BlIHRoaXMgaGVscHMsCkd1ZW50ZXIKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
